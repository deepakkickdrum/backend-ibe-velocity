package com.velocity.ibe.dto.config;

import java.math.BigDecimal;
import java.time.LocalDate;

public record CalendarRateDto(
    LocalDate date,
    BigDecimal minNightlyRate
) {
}
