package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.Amenity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.UUID;

@Repository
public interface AmenityRepository extends JpaRepository<Amenity, UUID> {

    @Query("""
        SELECT a FROM Amenity a
        JOIN RoomTypeAmenity rta ON rta.amenity.id = a.id
        WHERE rta.roomType.id = :roomTypeId
        """)
    List<Amenity> findByRoomTypeId(
        @Param("roomTypeId") UUID roomTypeId
    );
}