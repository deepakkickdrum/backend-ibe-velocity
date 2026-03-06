package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.LandingPageConfig;
import com.velocity.ibe.entities.Property;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LandingPageConfigRepository extends JpaRepository<LandingPageConfig, Property> {
}
