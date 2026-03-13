package com.velocity.ibe.services.impl;

import com.velocity.ibe.dto.rooms.DealDto;
import com.velocity.ibe.dto.rooms.RoomDetailResponseDto;
import com.velocity.ibe.dto.rooms.RoomImageDto;
import com.velocity.ibe.dto.rooms.RoomSearchRequest;
import com.velocity.ibe.dto.rooms.RoomSearchResponse;
import com.velocity.ibe.dto.rooms.StandardRateDto;
import com.velocity.ibe.entities.Offer;
import com.velocity.ibe.entities.Property;
import com.velocity.ibe.entities.RoomRate;
import com.velocity.ibe.entities.RoomType;
import com.velocity.ibe.repositories.OfferRepository;
import com.velocity.ibe.repositories.RoomRateRepository;
import com.velocity.ibe.repositories.RoomSearchRepository;
import com.velocity.ibe.repositories.RoomTypeRepository;
import com.velocity.ibe.services.RoomService;
import com.velocity.ibe.services.roomservicehelper.FilterSort;
import com.velocity.ibe.services.roomservicehelper.Pagination;
import com.velocity.ibe.services.roomservicehelper.Price;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;

@Service
@Transactional(readOnly = true)
public class RoomServiceImpl implements RoomService {
    private final RoomSearchRepository roomSearchRepository;
    private final Pagination paginationHelper;
    private final FilterSort filterSort;
    private final Price price;
    private final RoomTypeRepository roomTypeRepository;
    private final RoomRateRepository roomRateRepository;
    private final OfferRepository offerRepository;

    public RoomServiceImpl(
            RoomSearchRepository roomSearchRepository,
            Pagination paginationHelper,
            FilterSort filterSort,
            Price price,
            RoomTypeRepository roomTypeRepository,
            RoomRateRepository roomRateRepository,
            OfferRepository offerRepository) {
        this.roomSearchRepository = roomSearchRepository;
        this.paginationHelper = paginationHelper;
        this.filterSort = filterSort;
        this.price = price;
        this.roomTypeRepository = roomTypeRepository;
        this.roomRateRepository = roomRateRepository;
        this.offerRepository = offerRepository;
    }

    @Override
    public RoomSearchResponse searchRooms(UUID propertyId, RoomSearchRequest req) {

        if (!req.getCheckIn().isBefore(req.getCheckOut())) {
              throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST, "CheckIn date must be before CheckOut date" );
        }

        Integer maxBookingRooms = roomSearchRepository.getMaxBookingRooms(propertyId);
        if (maxBookingRooms != null && req.getRooms() > maxBookingRooms) {
            return emptyResponse(req, propertyId);
        }

        List<Map<String, Object>> rooms = roomSearchRepository.searchRooms(propertyId, req);
        int totalCount = roomSearchRepository.countRooms(propertyId, req);

        List<Map<String, Object>> propertyOffers = roomSearchRepository.getPropertyOffers(propertyId);

        for (Map<String, Object> room : rooms) {
            int maxOccupancy = (int) room.get("max_occupancy");
            int roomsNeeded = (int) Math.ceil((double) req.getGuests() / maxOccupancy);
            if (maxBookingRooms != null && roomsNeeded > maxBookingRooms) {
                continue;
            }
            room.put("rooms_needed", roomsNeeded);
            room.put("is_exact_match", roomsNeeded <= req.getRooms());
            BigDecimal basePrice = (BigDecimal) room.get("base_total_price");
            UUID roomTypeId = (UUID) room.get("id");
            List<Map<String, Object>> roomTypeOffers = roomSearchRepository.getRoomTypeOffers(roomTypeId);
            room.put("display_price", price.calculateDisplayPrice(basePrice, propertyOffers, roomTypeOffers));
        }

        //pagination
        Map<String, Object> pagination = paginationHelper.build(
                req.getPage(),
                req.getLimit(),
                req.getOffset(),
                rooms.size(),
                totalCount
        );

        //meta
        Map<String, Object> meta = filterSort.buildMeta(
                roomSearchRepository.getFiltersForProperty(propertyId),
                roomSearchRepository.getSortOptionsForProperty(propertyId)
        );

        return new RoomSearchResponse(rooms, pagination, meta);
    }

    private RoomSearchResponse emptyResponse(RoomSearchRequest req, UUID propertyId) {
        Map<String, Object> pagination = paginationHelper.build(req.getPage(), req.getLimit(), 0, 0, 0);
        Map<String, Object> meta = filterSort.buildMeta(
                roomSearchRepository.getFiltersForProperty(propertyId),
                roomSearchRepository.getSortOptionsForProperty(propertyId)
        );
        return new RoomSearchResponse(Collections.emptyList(), pagination, meta);
    }

    @Override
    public RoomDetailResponseDto getRoomDetail(
        String tenantName,
        UUID propertyId,
        UUID roomTypeId,
        LocalDate checkIn,
        LocalDate checkOut,
        int rooms
    ) {
        validateDates(checkIn, checkOut);

        RoomType roomType = roomTypeRepository
            .fetchRoomDetailWithContext(roomTypeId, propertyId, tenantName)
            .orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND, "Room not found for this property"));

        Property property = roomType.getProperty();
        validateStay(checkIn, checkOut, property, rooms);

        CompletableFuture<List<RoomRate>> ratesFuture =
            CompletableFuture.supplyAsync(() ->
                roomRateRepository.findDistinctByRoomTypeIdAndDateRange(
                    roomTypeId, checkIn, checkOut));

        CompletableFuture<List<Offer>> offersFuture =
            CompletableFuture.supplyAsync(() ->
                offerRepository.findAllActiveOffersForRoom(propertyId, roomTypeId));

        List<RoomRate> rates = ratesFuture.join();
        List<Offer> offers = offersFuture.join();
        BigDecimal totalPrice = rates.stream()
            .map(RoomRate::getPrice)
            .reduce(BigDecimal.ZERO, BigDecimal::add)
            .multiply(BigDecimal.valueOf(rooms))
            .setScale(2, RoundingMode.HALF_UP);

        StandardRateDto standardRate = new StandardRateDto(totalPrice);
        List<DealDto> deals = offers.stream()
            .map(o -> buildDealDto(
                o.getName(),
                o.getDescription(),
                o.getOfferPercentage(),
                totalPrice))
            .toList();
        List<String> amenities = roomType.getAmenities()
            .stream()
            .map(rta -> rta.getAmenity().getLabel())
            .toList();
        String bedType = roomType.getBedType() != null
            ? roomType.getBedType().getName()
            : null;
        return new RoomDetailResponseDto(
            roomType.getId(),
            roomType.getTitle(),
            roomType.getDescription(),
            roomType.getSizeSqft(),
            roomType.getMaxOccupancy(),
            bedType,
            parseImages(roomType.getImages()),
            amenities,
            standardRate,
            deals
        );
    }

    @Override
    public DealDto applyPromoCode(
        UUID propertyId,
        UUID roomTypeId,
        String promoCode,
        LocalDate checkIn,
        LocalDate checkOut,
        int rooms
    ) {
        List<RoomRate> rates = roomRateRepository
            .findDistinctByRoomTypeIdAndDateRange(
                roomTypeId, checkIn, checkOut);

        BigDecimal standardTotal = rates.stream()
            .map(RoomRate::getPrice)
            .reduce(BigDecimal.ZERO, BigDecimal::add)
            .multiply(BigDecimal.valueOf(rooms))
            .setScale(2, RoundingMode.HALF_UP);

        Offer offer = offerRepository
            .findPromoCode(propertyId, roomTypeId, promoCode)
            .orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND, "Invalid or expired promo code"));

        return buildDealDto(
            offer.getName(),
            offer.getDescription(),
            offer.getOfferPercentage(),
            standardTotal
        );
    }

    //helpers
    private DealDto buildDealDto(
        String name,
        String description,
        BigDecimal offerPercentage,
        BigDecimal standardTotal
    ) {
        BigDecimal discount = offerPercentage
            .divide(BigDecimal.valueOf(100),
                10, RoundingMode.HALF_UP);

        BigDecimal dealPrice = standardTotal
            .multiply(BigDecimal.ONE.subtract(discount))
            .setScale(2, RoundingMode.HALF_UP);

        return new DealDto(name, description, dealPrice);
    }

    private void validateDates(
        LocalDate checkIn, LocalDate checkOut) {
        if (checkIn == null || checkOut == null) {
            throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                "CheckIn and CheckOut are required");
        }
        if (!checkIn.isBefore(checkOut)) {
            throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                "CheckIn must be before CheckOut");
        }
        if (checkIn.isBefore(LocalDate.now())) {
            throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                "CheckIn cannot be in the past");
        }
    }

    private void validateStay(
        LocalDate checkIn,
        LocalDate checkOut,
        Property property,
        int rooms
    ) {
        long nights = ChronoUnit.DAYS
            .between(checkIn, checkOut);

        if (nights < property.getMinStay()) {
            throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                "Minimum stay is "
                    + property.getMinStay() + " nights");
        }
        if (nights > property.getMaxStay()) {
            throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                "Maximum stay is "
                    + property.getMaxStay() + " nights");
        }
        if (property.getMaxBookingRooms() != null
            && rooms > property.getMaxBookingRooms()) {
            throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                "Maximum bookable rooms is "
                    + property.getMaxBookingRooms());
        }
    }

    private List<RoomImageDto> parseImages(
        List<Map<String, String>> images) {
        if (images == null || images.isEmpty())
            return List.of();
        return images.stream()
            .map(img -> new RoomImageDto(
                img.get("url"),
                img.get("alt")
            ))
            .toList();
    }
}
