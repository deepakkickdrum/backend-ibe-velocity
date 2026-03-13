package com.velocity.ibe.entities;

import java.util.List;
import java.util.UUID;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.Id;

@Entity
@Table(name = "filters")
@Getter
@Setter
public class Filter extends BaseEntity{

    @Id
    private UUID id;

    @Column(name = "filter_name", nullable = false, length = 50)
    private String filterName;

    @Column(nullable = false)
    private String type;

    @OneToMany(mappedBy = "filter", cascade = CascadeType.ALL)
    private List<FilterOption> options;

}