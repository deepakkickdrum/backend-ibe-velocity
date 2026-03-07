package com.velocity.ibe.services.impl;

import com.velocity.ibe.dto.config.CalendarRateDto;
import com.velocity.ibe.dto.config.ConfigResponseDto;
import com.velocity.ibe.dto.config.GuestTypeConfigDto;
import com.velocity.ibe.dto.config.PropertyConfigDto;
import com.velocity.ibe.dto.config.TenantConfigDto;
import com.velocity.ibe.entities.GuestType;
import com.velocity.ibe.entities.LandingPageConfig;
import com.velocity.ibe.entities.Property;
import com.velocity.ibe.entities.RoomRate;
import com.velocity.ibe.entities.Tenant;
import com.velocity.ibe.repositories.PropertyRepository;
import com.velocity.ibe.repositories.RoomRateRepository;
import com.velocity.ibe.repositories.TenantRepository;
import com.velocity.ibe.services.ConfigService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
@Transactional(readOnly = true)
public class ConfigServiceImpl implements ConfigService {

    private final PropertyRepository propertyRepository;
    private final RoomRateRepository roomRateRepository;
    private final TenantRepository tenantRepository;
    private final int calendarDays;

    public ConfigServiceImpl(
        PropertyRepository propertyRepository,
        RoomRateRepository roomRateRepository,
        TenantRepository tenantRepository,
        @Value("${ibe.config.calendar-days:90}") int calendarDays
    ) {
        this.propertyRepository = propertyRepository;
        this.roomRateRepository = roomRateRepository;
        this.tenantRepository = tenantRepository;
        this.calendarDays = calendarDays;
    }

    @Override
    public ConfigResponseDto getConfig(UUID propertyId) {
        Property property = propertyRepository
            .findWithConfigByPropertyId(propertyId)
            .orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND, "Config not found for propertyId: " + propertyId));

        LandingPageConfig landingPageConfig = property.getLandingPageConfig();

        return new ConfigResponseDto(
            property.getId().toString(),
            property.getName(),
            Boolean.TRUE.equals(landingPageConfig != null && landingPageConfig.getShowGuestsOption()),
            Boolean.TRUE.equals(landingPageConfig != null && landingPageConfig.getShowRoomsOption()),
            Boolean.TRUE.equals(landingPageConfig != null && landingPageConfig.getShowAccOption()),
            mapGuestTypes(property.getGuestTypes()),
            mapCalendar(propertyId)
        );
    }

    private List<GuestTypeConfigDto> mapGuestTypes(List<GuestType> guestTypes) {
        return Optional.ofNullable(guestTypes)
            .orElse(List.of())
            .stream()
            .sorted(Comparator.comparing(GuestType::getName, String.CASE_INSENSITIVE_ORDER))
            .map(guestType -> new GuestTypeConfigDto(
                guestType.getName(),
                Optional.ofNullable(guestType.getMinAge()).orElse(0)
            ))
            .toList();
    }

    private List<CalendarRateDto> mapCalendar(UUID propertyId) {
        LocalDate startDate = LocalDate.now(ZoneOffset.UTC);
        LocalDate endDate = startDate.plusDays(calendarDays - 1L);

        Map<LocalDate, BigDecimal> minRatesByDate = roomRateRepository
            .findAvailableMinRatesByProperty(propertyId, startDate, endDate)
            .stream()
            .collect(Collectors.toMap(
                RoomRate::getDate,
                RoomRate::getPrice,
                BigDecimal::min
            ));

        return IntStream.range(0, calendarDays)
            .mapToObj(i -> {
                LocalDate date = startDate.plusDays(i);
                return new CalendarRateDto(date, minRatesByDate.get(date));
            })
            .toList();
    }

    @Override
    public TenantConfigDto getTenantConfig(String tenantName) {
        Tenant tenant = tenantRepository
            .findByNameWithProperties(tenantName)
            .orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND, "Tenant not found: " + tenantName));

        List<PropertyConfigDto> properties = tenant.getProperties().stream()
            .map(p -> new PropertyConfigDto(
                p.getId(),
                p.getName(),
                p.getMaxBookingRooms(),
                p.getMinStay(),
                p.getMaxStay(),
                p.getBannerImageUrl()
            ))
            .toList();

        return new TenantConfigDto(
            tenant.getId(),
            tenant.getName(),
            tenant.getLogoUrl(),
            tenant.getBannerImageUrl(),
            properties
        );
    }
}