package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.RoomType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface RoomTypeRepository extends JpaRepository<RoomType, UUID> {
}
