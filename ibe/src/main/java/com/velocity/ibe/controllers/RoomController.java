package com.velocity.ibe.controllers;

import com.velocity.ibe.dto.rooms.RoomSearchRequest;
import com.velocity.ibe.dto.rooms.RoomSearchResponse;
import com.velocity.ibe.services.RoomService;

import jakarta.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping
public class RoomController {

    private final RoomService roomService;

    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    @GetMapping("/{tenantName}/properties/{propertyId}/rooms")
    public ResponseEntity<RoomSearchResponse> searchRooms(@PathVariable String tenantName, @PathVariable UUID propertyId, @Valid RoomSearchRequest request) {        
        return ResponseEntity.ok(roomService.searchRooms(propertyId, request));
    }
}