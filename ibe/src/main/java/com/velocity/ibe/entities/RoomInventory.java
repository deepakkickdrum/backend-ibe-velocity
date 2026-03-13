package com.velocity.ibe.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(
    name = "room_inventory",
    uniqueConstraints = @UniqueConstraint(columnNames = {"room_type_id", "date"})
)
public class RoomInventory extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "property_id", nullable = false)
    private Property property;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_type_id", nullable = false)
    private RoomType roomType;

    @Column(nullable = false)
    private LocalDate date;

    @Column(name = "total_rooms", nullable = false)
    private Integer totalRooms;

    @Column(name = "available_rooms", nullable = false)
    private Integer availableRooms;

    @Version
    @Column(nullable = false)
    private Integer version = 0;
}