package com.velocity.ibe.controllers;

import com.velocity.ibe.dto.rooms.DealDto;
import com.velocity.ibe.dto.rooms.RoomDetailResponseDto;
import com.velocity.ibe.services.RoomModal;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.UUID;

@RestController
@RequestMapping
public class RoomController {

    private final RoomModal roomService;

    public RoomController(RoomModal roomService) {
        this.roomService = roomService;
    }

    @GetMapping("/{tenantName}/properties/{propertyId}/rooms/{roomTypeId}")
    public RoomDetailResponseDto getRoomDetail(
        @PathVariable String tenantName,
        @PathVariable UUID propertyId,
        @PathVariable UUID roomTypeId,
        @RequestParam
        @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
        LocalDate checkIn,
        @RequestParam
        @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
        LocalDate checkOut,
        @RequestParam(defaultValue = "1") int rooms
    ) {
        return roomService.getRoomDetail(
            tenantName, propertyId, roomTypeId,
            checkIn, checkOut, rooms
        );
    }

    @GetMapping("/{tenantName}/properties/{propertyId}/rooms/{roomTypeId}/promo")
    public DealDto applyPromoCode(
        @PathVariable String tenantName,
        @PathVariable UUID propertyId,
        @PathVariable UUID roomTypeId,
        @RequestParam
        @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
        LocalDate checkIn,
        @RequestParam
        @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
        LocalDate checkOut,
        @RequestParam(defaultValue = "1") int rooms,
        @RequestParam String promoCode
    ) {
        return roomService.applyPromoCode(
            propertyId, roomTypeId,
            promoCode,
            checkIn, checkOut, rooms
        );
    }
}