package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.RoomInventory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface RoomInventoryRepository extends JpaRepository<RoomInventory, UUID> {
}