package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface PropertyRepository extends JpaRepository<Property, UUID> {

    @Query("""
        SELECT p FROM Property p
        LEFT JOIN FETCH p.landingPageConfig
        LEFT JOIN FETCH p.guestTypes
        WHERE p.id = :propertyId
    """)
    Optional<Property> findWithConfigByPropertyId(@Param("propertyId") UUID propertyId);
}