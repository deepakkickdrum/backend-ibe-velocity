package com.velocity.ibe.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "bed_types")
public class BedType extends BaseEntity {

    @Column(nullable = false, length = 100)
    private String name;
}