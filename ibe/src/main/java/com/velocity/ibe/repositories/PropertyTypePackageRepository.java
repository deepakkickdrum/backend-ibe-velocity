package com.velocity.ibe.repositories;
import com.velocity.ibe.entities.PropertyTypePackage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.UUID;

@Repository
public interface PropertyTypePackageRepository 
    extends JpaRepository<PropertyTypePackage, UUID> {
    List<PropertyTypePackage> findByPropertyIdAndIsActiveTrue(UUID propertyId);
}


