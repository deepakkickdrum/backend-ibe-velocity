package com.velocity.ibe.repositories;
import com.velocity.ibe.entities.RoomTypePackage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.UUID;

@Repository
public interface RoomTypePackageRepository 
    extends JpaRepository<RoomTypePackage, UUID> {
    List<RoomTypePackage> findByRoomTypeIdAndIsActiveTrue(UUID roomTypeId);
}

