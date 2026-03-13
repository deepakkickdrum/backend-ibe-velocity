package com.velocity.ibe.services;

import java.time.LocalDate;
import java.util.UUID;

import com.velocity.ibe.dto.rooms.DealDto;
import com.velocity.ibe.dto.rooms.RoomDetailResponseDto;
import com.velocity.ibe.dto.rooms.RoomSearchRequest;
import com.velocity.ibe.dto.rooms.RoomSearchResponse;

public interface RoomService {
    RoomSearchResponse searchRooms(UUID propertyId, RoomSearchRequest req);

    RoomDetailResponseDto getRoomDetail(
        String tenantName,
        UUID propertyId,
        UUID roomTypeId,
        LocalDate checkIn,
        LocalDate checkOut,
        int rooms
    );

    DealDto applyPromoCode(
        UUID propertyId,
        UUID roomTypeId,
        String promoCode,
        LocalDate checkIn,
        LocalDate checkOut,
        int rooms
    );
}
