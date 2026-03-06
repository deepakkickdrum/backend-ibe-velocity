package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.RoomRate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface RoomRateRepository extends JpaRepository<RoomRate, UUID> {

	List<RoomRate> findByProperty_IdAndDateBetweenOrderByDateAsc(UUID propertyId, LocalDate startDate, LocalDate endDate);
}
