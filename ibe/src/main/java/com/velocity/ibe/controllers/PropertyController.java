package com.velocity.ibe.controllers;

import com.velocity.ibe.dto.config.ConfigResponseDto;
import com.velocity.ibe.services.ConfigService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping
public class PropertyController {

    private final ConfigService configService;

    public PropertyController(ConfigService configService) {
        this.configService = configService;
    }

    @GetMapping("/{tenantName}/properties/{propertyId}/config")
    public ConfigResponseDto getPropertyConfig(
            @PathVariable String tenantName,
            @PathVariable UUID propertyId) {
        return configService.getConfig(propertyId);
    }
}
