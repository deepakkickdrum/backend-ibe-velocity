package com.velocity.ibe.dto.rooms;

import java.math.BigDecimal;

public record DealDto(
    String title,
    String description,
    BigDecimal totalPrice
) {}