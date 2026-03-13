package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.RoomType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface RoomTypeRepository extends JpaRepository<RoomType, UUID> {
    @Query("""
        SELECT rt FROM RoomType rt
        JOIN FETCH rt.property p
        JOIN FETCH p.tenant t
        JOIN FETCH p.landingPageConfig
        LEFT JOIN FETCH rt.bedType
        LEFT JOIN FETCH rt.amenities rta
        LEFT JOIN FETCH rta.amenity
        WHERE rt.id = :roomTypeId
        AND p.id = :propertyId
        AND t.name = :tenantName
        """)
    Optional<RoomType> fetchRoomDetailWithContext(
        @Param("roomTypeId") UUID roomTypeId,
        @Param("propertyId") UUID propertyId,
        @Param("tenantName") String tenantName
    );
}