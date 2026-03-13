package com.velocity.ibe.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "landing_page_configs")
public class LandingPageConfig extends BaseEntity {

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "property_id", nullable = false, unique = true)
    private Property property;

    @Column(name = "show_guests_option")
    private Boolean showGuestsOption;

    @Column(name = "show_rooms_option")
    private Boolean showRoomsOption;

    @Column(name = "show_acc_option")
    private Boolean showAccOption;
}