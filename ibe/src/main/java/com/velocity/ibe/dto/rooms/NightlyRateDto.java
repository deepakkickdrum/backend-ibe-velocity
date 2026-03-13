package com.velocity.ibe.dto.rooms;

import java.math.BigDecimal;
import java.time.LocalDate;

public record NightlyRateDto(
    LocalDate date,
    BigDecimal pricePerRoom,
    BigDecimal totalForNight
) {}