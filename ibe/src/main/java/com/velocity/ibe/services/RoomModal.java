package com.velocity.ibe.services;

import java.time.LocalDate;
import java.util.UUID;

import com.velocity.ibe.dto.rooms.DealDto;
import com.velocity.ibe.dto.rooms.RoomDetailResponseDto;

public interface RoomModal {

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