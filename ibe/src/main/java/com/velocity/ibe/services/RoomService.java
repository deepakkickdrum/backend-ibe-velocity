package com.velocity.ibe.services;

import java.util.UUID;

import com.velocity.ibe.dto.rooms.RoomSearchRequest;
import com.velocity.ibe.dto.rooms.RoomSearchResponse;

public interface RoomService {
    RoomSearchResponse searchRooms(UUID propertyId, RoomSearchRequest req);
}
