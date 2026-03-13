package com.velocity.ibe.services.impl;

import java.math.BigDecimal;
import java.util.List;

import com.velocity.ibe.dto.rooms.*;

record RoomInfoResult(
    String title,
    String description,
    BigDecimal sizeSqft,
    Integer maxOccupancy,
    String bedType,
    List<RoomImageDto> images,
    List<String> amenities,
    StandardRateDto standardRate
) {}