package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.BedType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface BedTypeRepository extends JpaRepository<BedType, UUID> {
}
