package com.velocity.ibe.dto.rooms;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.UUID;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomSearchRequest {

   @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
   @NotNull(message = "Check-in date is required") 
   private LocalDate checkIn;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @NotNull(message = "Check-out date is required")
    private LocalDate checkOut;
    @Min(1)
    private int guests;
    @Min(1)
    private int rooms;
    private int page = 1;
    private int limit = 10;

    private UUID bedTypeId;
    private List<UUID> amenities;
    private BigDecimal priceMin;
    private BigDecimal priceMax;
    private Integer occupancyMin;
    private Integer occupancyMax;

    private String sortField;
    private String sortDirection;

    public int getOffset() {
        return (page - 1) * limit;
    }

    public long getNumNights() {
        return ChronoUnit.DAYS.between(checkIn, checkOut);
    }
}
