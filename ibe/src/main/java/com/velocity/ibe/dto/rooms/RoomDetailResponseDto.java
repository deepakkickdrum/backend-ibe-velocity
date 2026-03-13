package com.velocity.ibe.dto.rooms;

import com.fasterxml.jackson.annotation.JsonInclude;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record RoomDetailResponseDto(
    UUID id,
    String title,
    String description,
    BigDecimal sizeSqft,
    Integer maxOccupancy,
    String bedType,
    List<RoomImageDto> images,
    List<String> amenities,
    StandardRateDto standardRate,
    List<DealDto> deals
) {}