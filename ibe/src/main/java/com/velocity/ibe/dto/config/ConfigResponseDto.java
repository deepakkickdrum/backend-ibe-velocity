package com.velocity.ibe.dto.config;

import java.util.List;

public record ConfigResponseDto(
    String id,
    String name,
    boolean showGuestsOption,
    boolean showRoomsOption,
    boolean showAccOption,
    List<GuestTypeConfigDto> guestTypes,
    List<CalendarRateDto> calendar
) {
}
