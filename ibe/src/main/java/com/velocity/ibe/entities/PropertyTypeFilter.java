package com.velocity.ibe.entities;

import jakarta.persistence.Table;
import jakarta.persistence.Id;
import java.util.UUID;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "property_type_filters")
@Getter
@Setter
public class PropertyTypeFilter extends BaseEntity {

    @Id
    private UUID id;

    @Column(name = "property_id",nullable = false)
    private UUID propertyId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "filter_id")
    private Filter filter;

}