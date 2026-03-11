package com.velocity.ibe.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Entity
@Table(name = "room_type_packages")
@Getter
@Setter
public class RoomTypePackage extends BaseEntity {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_type_id", nullable = false)
    private RoomType roomType;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal offerPercentage;
    @Column(nullable = false)
    private Boolean isActive;
}

