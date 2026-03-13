package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.RoomRate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Repository
public interface RoomRateRepository extends JpaRepository<RoomRate, UUID> {

    @Query(
        value = """
            SELECT DISTINCT ON (rr.date) rr.*
            FROM room_rates rr
            WHERE rr.room_type_id = :roomTypeId
              AND rr.date >= :checkIn
              AND rr.date < :checkOut
            ORDER BY rr.date, rr.created_at ASC, rr.id ASC
            """,
        nativeQuery = true
    )
    List<RoomRate> findDistinctByRoomTypeIdAndDateRange(
        @Param("roomTypeId") UUID roomTypeId,
        @Param("checkIn") LocalDate checkIn,
        @Param("checkOut") LocalDate checkOut
    );
    @Query("""
        SELECT rr FROM RoomRate rr
        WHERE rr.property.id = :propertyId
        AND rr.date >= :startDate
        AND rr.date < :endDate
        """)
    List<RoomRate> findAvailableMinRatesByProperty(
        @Param("propertyId") UUID propertyId,
        @Param("startDate") LocalDate startDate,
        @Param("endDate") LocalDate endDate
    );
}
