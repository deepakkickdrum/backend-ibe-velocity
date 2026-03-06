package com.velocity.ibe.repositories;

import com.velocity.ibe.entities.Property;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;
import java.util.Optional;

public interface PropertyRepository extends JpaRepository<Property, UUID> {

	@EntityGraph(attributePaths = {"tenant", "landingPageConfig", "guestTypes"})
	Optional<Property> findFirstByTenant_NameIgnoreCaseOrderByNameAsc(String tenantName);
}
