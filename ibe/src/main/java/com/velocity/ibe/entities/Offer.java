package com.velocity.ibe.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Entity
@Table(name = "offers")
@Getter
@Setter
public class Offer extends BaseEntity {

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal offerPercentage;

    @Column(nullable = false)
    private Boolean isActive;

    @Column(nullable = false)
    private Boolean isPromocode;
}