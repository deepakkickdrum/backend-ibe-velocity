package com.velocity.ibe.dto.config;

import java.util.UUID;

public record PropertyConfigDto(
        UUID id,
        String name,
        Integer maxBookingRooms,
        Integer minStay,
        Integer maxStay,
        String bannerImageUrl,
        Integer maxGuestsPerRoom
) {
}
