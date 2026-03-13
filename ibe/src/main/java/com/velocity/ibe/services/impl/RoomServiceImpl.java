package com.velocity.ibe.services.impl;

import com.velocity.ibe.dto.rooms.*;
import com.velocity.ibe.entities.*;
import com.velocity.ibe.repositories.*;
import com.velocity.ibe.services.RoomModal;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;

@Service
@Transactional(readOnly = true)
public class RoomServiceImpl implements RoomModal {
    private final RoomTypeRepository roomTypeRepository;
    private final RoomRateRepository roomRateRepository;
    private final AmenityRepository amenityRepository;
    private final OfferRepository offerRepository;
    private final PropertyRepository propertyRepository;

    public RoomServiceImpl(
        RoomTypeRepository roomTypeRepository,
        RoomRateRepository roomRateRepository,
        AmenityRepository amenityRepository,
        OfferRepository offerRepository,
        PropertyRepository propertyRepository
    ) {
        this.roomTypeRepository = roomTypeRepository;
        this.roomRateRepository = roomRateRepository;
        this.amenityRepository = amenityRepository;
        this.offerRepository = offerRepository;
        this.propertyRepository = propertyRepository;
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
