package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.Offer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface OfferRepository extends JpaRepository<Offer, UUID> {
    @Query("""
        SELECT o FROM Offer o
        WHERE o.isActive = true AND o.isPromocode = false
        AND (
            EXISTS (
                SELECT 1 FROM PropertyOffer po
                WHERE po.offer = o AND po.property.id = :propertyId
            )
            OR EXISTS (
                SELECT 1 FROM RoomTypeOffer rto
                WHERE rto.offer = o AND rto.roomType.id = :roomTypeId
            )
        )
        """)
    List<Offer> findAllActiveOffersForRoom(
        @Param("propertyId") UUID propertyId,
        @Param("roomTypeId") UUID roomTypeId
    );
    @Query("""
        SELECT o FROM Offer o
        WHERE o.isActive = true AND o.isPromocode = true
        AND UPPER(o.name) = UPPER(:promoCode)
        AND (
            EXISTS (
                SELECT 1 FROM PropertyOffer po
                WHERE po.offer = o AND po.property.id = :propertyId
            )
            OR EXISTS (
                SELECT 1 FROM RoomTypeOffer rto
                WHERE rto.offer = o AND rto.roomType.id = :roomTypeId
            )
        )
        """)
    Optional<Offer> findPromoCode(
        @Param("propertyId") UUID propertyId,
        @Param("roomTypeId") UUID roomTypeId,
        @Param("promoCode") String promoCode
    );
}