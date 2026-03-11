package com.velocity.ibe.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Entity
@Table(name = "property_type_packages")
@Getter
@Setter
public class PropertyTypePackage extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "property_id", nullable = false)
    private Property property;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal offerPercentage;
    @Column(nullable = false)
    private Boolean isActive;
}
