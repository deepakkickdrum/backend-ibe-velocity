package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.RoomRate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface RoomRateRepository extends JpaRepository<RoomRate, UUID> {

    @Query(value = """
        SELECT rr.* FROM room_rates rr
        JOIN room_inventory ri ON ri.room_type_id = rr.room_type_id AND ri.date = rr.date
        WHERE rr.property_id = :propertyId
          AND rr.date BETWEEN :startDate AND :endDate
          AND ri.available_rooms > 0
        ORDER BY rr.date ASC
    """, nativeQuery = true)
    List<RoomRate> findAvailableMinRatesByProperty(
        @Param("propertyId") UUID propertyId,
        @Param("startDate")  LocalDate startDate,
        @Param("endDate")    LocalDate endDate
    );
}
