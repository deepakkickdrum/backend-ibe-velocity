package com.velocity.ibe.dto.config;

public record SearchFormDto(
    boolean guestsEnabled,
    boolean roomsEnabled,
    boolean accessibleEnabled
) {
}
