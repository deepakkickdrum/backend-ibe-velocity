package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.Tenant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;
import java.util.UUID;

public interface TenantRepository extends JpaRepository<Tenant, UUID> {

    @Query("SELECT t FROM Tenant t LEFT JOIN FETCH t.properties WHERE t.name = :name")
    Optional<Tenant> findByNameWithProperties(@Param("name") String name);
}
