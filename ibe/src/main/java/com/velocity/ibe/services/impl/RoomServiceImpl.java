package com.velocity.ibe.services.impl;

import com.velocity.ibe.services.RoomService;
import com.velocity.ibe.services.roomservicehelper.FilterSort;
import com.velocity.ibe.services.roomservicehelper.Pagination;
import com.velocity.ibe.services.roomservicehelper.Price;
import com.velocity.ibe.dto.rooms.RoomSearchRequest;
import com.velocity.ibe.dto.rooms.RoomSearchResponse;
import com.velocity.ibe.repositories.RoomSearchRepository;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class RoomServiceImpl implements RoomService {
    private final RoomSearchRepository roomSearchRepository;
    private final Pagination paginationHelper;
    private final FilterSort filterSort;
    private final Price price;

    public RoomServiceImpl(
            RoomSearchRepository roomSearchRepository,
            Pagination paginationHelper,
            FilterSort filterSort,
            Price price) {
        this.roomSearchRepository = roomSearchRepository;
        this.paginationHelper = paginationHelper;
        this.filterSort = filterSort;
        this.price = price;
    }

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
}