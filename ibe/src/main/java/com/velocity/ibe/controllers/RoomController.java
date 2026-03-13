package com.velocity.ibe.controllers;

import com.velocity.ibe.dto.rooms.RoomSearchRequest;
import com.velocity.ibe.dto.rooms.RoomSearchResponse;
import com.velocity.ibe.services.RoomService;

import jakarta.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.velocity.ibe.dto.rooms.DealDto;
import com.velocity.ibe.dto.rooms.RoomDetailResponseDto;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.UUID;

@RestController
@RequestMapping
public class RoomController {

    private final RoomService roomService;

    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    @GetMapping("/{tenantName}/properties/{propertyId}/rooms")
    public ResponseEntity<RoomSearchResponse> searchRooms(@PathVariable String tenantName,
            @PathVariable UUID propertyId, @Valid RoomSearchRequest request) {
        return ResponseEntity.ok(roomService.searchRooms(propertyId, request));
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