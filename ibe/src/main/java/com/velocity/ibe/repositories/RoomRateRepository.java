package com.velocity.ibe.repositories;

import com.velocity.ibe.dto.config.CalendarDayDto;
import com.velocity.ibe.entities.RoomRate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface RoomRateRepository extends JpaRepository<RoomRate, UUID> {

    @Query("""
        SELECT new com.velocity.ibe.dto.config.CalendarDayDto(rr.date, MIN(rr.price))
        FROM RoomRate rr
        JOIN RoomInventory ri ON ri.roomType = rr.roomType AND ri.date = rr.date
        WHERE rr.property.id = :propertyId
          AND rr.date BETWEEN :startDate AND :endDate
          AND ri.availableRooms > 0
        GROUP BY rr.date
        ORDER BY rr.date ASC
    """)
    List<CalendarDayDto> findAvailableMinRatesByProperty(
        @Param("propertyId") UUID propertyId,
        @Param("startDate")  LocalDate startDate,
        @Param("endDate")    LocalDate endDate
    );
}
