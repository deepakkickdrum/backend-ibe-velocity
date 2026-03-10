package com.velocity.ibe.controllers;

import com.velocity.ibe.dto.config.CalendarRateDto;
import com.velocity.ibe.dto.config.ConfigResponseDto;
import com.velocity.ibe.dto.config.GuestTypeConfigDto;
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

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import static org.hamcrest.Matchers.hasSize;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(MockitoExtension.class)
class PropertyControllerTest {

    @Mock
    private ConfigService configService;

    @InjectMocks
    private PropertyController propertyController;

    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(propertyController).build();
    }

    // -----------------------------------------------------------------------
    // GET /{tenantName}/properties/{propertyId}/config  –  happy path
    // -----------------------------------------------------------------------

    @Test
    void getPropertyConfig_returns200WithBasicFields() throws Exception {
        UUID propertyId = UUID.randomUUID();
        ConfigResponseDto dto = new ConfigResponseDto(
                propertyId.toString(), "Grand Hotel",
                true, false, true,
                List.of(), List.of());

        when(configService.getConfig(propertyId)).thenReturn(dto);

        mockMvc.perform(get("/velocity/properties/{propertyId}/config", propertyId))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(propertyId.toString()))
                .andExpect(jsonPath("$.name").value("Grand Hotel"))
                .andExpect(jsonPath("$.showGuestsOption").value(true))
                .andExpect(jsonPath("$.showRoomsOption").value(false))
                .andExpect(jsonPath("$.showAccOption").value(true));
    }

    @Test
    void getPropertyConfig_returns200WithGuestTypes() throws Exception {
        UUID propertyId = UUID.randomUUID();
        List<GuestTypeConfigDto> guestTypes = List.of(
                new GuestTypeConfigDto("Adult", 18),
                new GuestTypeConfigDto("Child", 0));
        ConfigResponseDto dto = new ConfigResponseDto(
                propertyId.toString(), "Hotel Guests",
                true, true, false,
                guestTypes, List.of());

        when(configService.getConfig(propertyId)).thenReturn(dto);

        mockMvc.perform(get("/velocity/properties/{propertyId}/config", propertyId))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.guestTypes", hasSize(2)))
                .andExpect(jsonPath("$.guestTypes[0].type").value("Adult"))
                .andExpect(jsonPath("$.guestTypes[0].min").value(18))
                .andExpect(jsonPath("$.guestTypes[1].type").value("Child"))
                .andExpect(jsonPath("$.guestTypes[1].min").value(0));
    }

    @Test
    void getPropertyConfig_returns200WithCalendar() throws Exception {
        UUID propertyId = UUID.randomUUID();
        LocalDate today = LocalDate.now();
        List<CalendarRateDto> calendar = List.of(
                new CalendarRateDto(today, new BigDecimal("150.00")),
                new CalendarRateDto(today.plusDays(1), null));
        ConfigResponseDto dto = new ConfigResponseDto(
                propertyId.toString(), "Hotel Cal",
                false, false, false,
                List.of(), calendar);

        when(configService.getConfig(propertyId)).thenReturn(dto);

        mockMvc.perform(get("/velocity/properties/{propertyId}/config", propertyId))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.calendar", hasSize(2)))
                .andExpect(jsonPath("$.calendar[0].date").value(today.toString()))
                .andExpect(jsonPath("$.calendar[0].minNightlyRate").value(150.00))
                .andExpect(jsonPath("$.calendar[1].minNightlyRate").isEmpty());
    }

    @Test
    void getPropertyConfig_delegatesWithCorrectPropertyId() throws Exception {
        UUID propertyId = UUID.randomUUID();
        ConfigResponseDto dto = new ConfigResponseDto(
                propertyId.toString(), "Verify Hotel",
                false, false, false,
                List.of(), List.of());

        when(configService.getConfig(propertyId)).thenReturn(dto);

        mockMvc.perform(get("/any-tenant/properties/{propertyId}/config", propertyId))
                .andExpect(status().isOk());

        verify(configService).getConfig(propertyId);
    }

    // -----------------------------------------------------------------------
    // GET /{tenantName}/properties/{propertyId}/config  –  error path
    // -----------------------------------------------------------------------

    @Test
    void getPropertyConfig_returns404WhenPropertyNotFound() throws Exception {
        UUID propertyId = UUID.randomUUID();
        when(configService.getConfig(propertyId))
                .thenThrow(new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Config not found for propertyId: " + propertyId));

        mockMvc.perform(get("/velocity/properties/{propertyId}/config", propertyId))
                .andExpect(status().isNotFound());
    }

    @Test
    void getPropertyConfig_returns400WhenPropertyIdIsNotUuid() throws Exception {
        mockMvc.perform(get("/velocity/properties/not-a-uuid/config"))
                .andExpect(status().isBadRequest());
    }
}
