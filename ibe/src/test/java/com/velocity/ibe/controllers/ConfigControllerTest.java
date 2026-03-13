package com.velocity.ibe.controllers;

import com.velocity.ibe.dto.config.PropertyConfigDto;
import com.velocity.ibe.dto.config.TenantConfigDto;
import com.velocity.ibe.services.ConfigService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.UUID;

import static org.hamcrest.Matchers.hasSize;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(MockitoExtension.class)
class ConfigControllerTest {

    @Mock
    private ConfigService configService;

    @InjectMocks
    private ConfigController configController;

    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(configController).build();
    }

    // -----------------------------------------------------------------------
    // GET /{tenant-name}/config  –  happy path
    // -----------------------------------------------------------------------

    @Test
    void getTenantConfig_returns200WithTenantFields() throws Exception {
        UUID id = UUID.randomUUID();
        TenantConfigDto dto = new TenantConfigDto(
                id, "velocity", "http://logo.png", "http://banner.png", List.of());

        when(configService.getTenantConfig("velocity")).thenReturn(dto);

        mockMvc.perform(get("/velocity/config"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(id.toString()))
                .andExpect(jsonPath("$.name").value("velocity"))
                .andExpect(jsonPath("$.logoUrl").value("http://logo.png"))
                .andExpect(jsonPath("$.bannerImageUrl").value("http://banner.png"));
    }

    @Test
    void getTenantConfig_returns200WithEmptyPropertiesList() throws Exception {
        TenantConfigDto dto = new TenantConfigDto(
                UUID.randomUUID(), "velocity", null, null, List.of());

        when(configService.getTenantConfig("velocity")).thenReturn(dto);

        mockMvc.perform(get("/velocity/config"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.properties").isArray())
                .andExpect(jsonPath("$.properties", hasSize(0)));
    }

    @Test
    void getTenantConfig_returns200WithPropertiesList() throws Exception {
        UUID tenantId = UUID.randomUUID();
        UUID propId   = UUID.randomUUID();
        PropertyConfigDto prop = new PropertyConfigDto(
                propId, "Grand Hotel", 5, 1, 30, "http://img.png", 3);
        TenantConfigDto dto = new TenantConfigDto(
                tenantId, "velocity", null, null, List.of(prop));

        when(configService.getTenantConfig("velocity")).thenReturn(dto);

        mockMvc.perform(get("/velocity/config"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.properties", hasSize(1)))
                .andExpect(jsonPath("$.properties[0].id").value(propId.toString()))
                .andExpect(jsonPath("$.properties[0].name").value("Grand Hotel"))
                .andExpect(jsonPath("$.properties[0].maxBookingRooms").value(5))
                .andExpect(jsonPath("$.properties[0].minStay").value(1))
                .andExpect(jsonPath("$.properties[0].maxStay").value(30))
                .andExpect(jsonPath("$.properties[0].maxGuestsPerRoom").value(3));
    }

    @Test
    void getTenantConfig_delegatesWithCorrectTenantName() throws Exception {
        TenantConfigDto dto = new TenantConfigDto(
                UUID.randomUUID(), "my-hotel", null, null, List.of());

        when(configService.getTenantConfig("my-hotel")).thenReturn(dto);

        mockMvc.perform(get("/my-hotel/config")).andExpect(status().isOk());

        verify(configService).getTenantConfig("my-hotel");
    }

    // -----------------------------------------------------------------------
    // GET /{tenant-name}/config  –  error path
    // -----------------------------------------------------------------------

    @Test
    void getTenantConfig_returns404WhenTenantNotFound() throws Exception {
        when(configService.getTenantConfig("unknown"))
                .thenThrow(new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Tenant not found: unknown"));

        mockMvc.perform(get("/unknown/config"))
                .andExpect(status().isNotFound());
    }
}
