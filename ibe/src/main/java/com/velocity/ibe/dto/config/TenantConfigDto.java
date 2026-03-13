package com.velocity.ibe.dto.config;

import java.util.List;
import java.util.UUID;

public record TenantConfigDto(
        UUID id,
        String name,
        String logoUrl,
        String bannerImageUrl,
        List<PropertyConfigDto> properties
) {
}
