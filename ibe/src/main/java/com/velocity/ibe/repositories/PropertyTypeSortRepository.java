package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.PropertyTypeSort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.UUID;

@Repository
public interface PropertyTypeSortRepository extends JpaRepository<PropertyTypeSort, UUID> {
}