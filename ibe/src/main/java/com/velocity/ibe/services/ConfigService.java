package com.velocity.ibe.services;

import com.velocity.ibe.dto.config.ConfigResponseDto;
import com.velocity.ibe.dto.config.TenantConfigDto;

import java.util.UUID;

public interface ConfigService {

    ConfigResponseDto getConfig(UUID propertyId);

    TenantConfigDto getTenantConfig(String tenantName);
}
