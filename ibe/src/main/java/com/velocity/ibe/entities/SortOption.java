package com.velocity.ibe.entities;

import jakarta.persistence.Table;
import jakarta.persistence.Id;
import java.util.UUID;
import java.time.LocalDateTime;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "sort_options")
@Getter
@Setter
public class SortOption {

    @Id
    private UUID id;

    @Column(nullable = false, length = 50)
    private String name;

    @Column(name = "default_order", nullable = false)
    private String defaultOrder;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

}