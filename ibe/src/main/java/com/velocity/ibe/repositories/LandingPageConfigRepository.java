package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.LandingPageConfig;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface LandingPageConfigRepository extends JpaRepository<LandingPageConfig, UUID> {
}
