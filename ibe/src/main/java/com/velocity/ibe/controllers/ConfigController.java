package com.velocity.ibe.controllers;

import com.velocity.ibe.dto.config.TenantConfigDto;
import com.velocity.ibe.services.ConfigService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class ConfigController {

    private final ConfigService configService;

    public ConfigController(ConfigService configService) {
        this.configService = configService;
    }

    @GetMapping("/{tenant-name}/config")
    public TenantConfigDto getTenantConfig(@PathVariable("tenant-name") String tenantName) {
        return configService.getTenantConfig(tenantName);
    }
}
