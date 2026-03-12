package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.PropertyTypeFilter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.UUID;

@Repository
public interface PropertyTypeFilterRepository extends JpaRepository<PropertyTypeFilter, UUID> {
}