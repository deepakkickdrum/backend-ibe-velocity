package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.GuestType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface GuestTypeRepository extends JpaRepository<GuestType, UUID> {
}
