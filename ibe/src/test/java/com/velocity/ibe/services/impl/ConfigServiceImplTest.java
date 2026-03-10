package com.velocity.ibe.services.impl;

import com.velocity.ibe.dto.config.TenantConfigDto;
import com.velocity.ibe.entities.Property;
import com.velocity.ibe.entities.Tenant;
import com.velocity.ibe.repositories.PropertyRepository;
import com.velocity.ibe.repositories.RoomRateRepository;
import com.velocity.ibe.repositories.TenantRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ConfigServiceImplTest {

    @Mock
    private PropertyRepository propertyRepository;

    @Mock
    private RoomRateRepository roomRateRepository;

    @Mock
    private TenantRepository tenantRepository;

    private ConfigServiceImpl configService;

    @BeforeEach
    void setUp() {
        configService = new ConfigServiceImpl(
                propertyRepository, roomRateRepository, tenantRepository, 10);
    }

    @Test
    void getConfig_throwsNotFound_whenPropertyDoesNotExist() {
        UUID propertyId = UUID.randomUUID();
        when(propertyRepository.findWithConfigByPropertyId(propertyId))
                .thenReturn(Optional.empty());

        assertThatThrownBy(() -> configService.getConfig(propertyId))
                .isInstanceOf(ResponseStatusException.class)
                .hasMessageContaining("Config not found for propertyId: " + propertyId);
    }

    @Test
    void getTenantConfig_returnsMappedDto_withAllTenantAndPropertyFields() {
        UUID tenantId   = UUID.randomUUID();
        UUID propertyId = UUID.randomUUID();

        Property property = new Property();
        ReflectionTestUtils.setField(property, "id", propertyId);
        property.setName("Sea View");
        property.setMaxBookingRooms(5);
        property.setMinStay(2);
        property.setMaxStay(14);
        property.setBannerImageUrl("http://sea.png");
        property.setMaxGuestsPerRoom(3);

        Tenant tenant = new Tenant();
        ReflectionTestUtils.setField(tenant, "id", tenantId);
        tenant.setName("velocity");
        tenant.setLogoUrl("http://logo.png");
        tenant.setBannerImageUrl("http://banner.png");
        tenant.setProperties(List.of(property));

        when(tenantRepository.findByNameWithProperties("velocity"))
                .thenReturn(Optional.of(tenant));

        TenantConfigDto result = configService.getTenantConfig("velocity");

        assertThat(result.id()).isEqualTo(tenantId);
        assertThat(result.name()).isEqualTo("velocity");
        assertThat(result.logoUrl()).isEqualTo("http://logo.png");
        assertThat(result.bannerImageUrl()).isEqualTo("http://banner.png");

        assertThat(result.properties()).hasSize(1);
        var prop = result.properties().get(0);
        assertThat(prop.id()).isEqualTo(propertyId);
        assertThat(prop.name()).isEqualTo("Sea View");
        assertThat(prop.maxBookingRooms()).isEqualTo(5);
        assertThat(prop.minStay()).isEqualTo(2);
        assertThat(prop.maxStay()).isEqualTo(14);
        assertThat(prop.bannerImageUrl()).isEqualTo("http://sea.png");
        assertThat(prop.maxGuestsPerRoom()).isEqualTo(3);
    }
}
