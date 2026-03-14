package com.velocity.ibe.repositories;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.velocity.ibe.dto.rooms.RoomSearchRequest;

@Repository
public class RoomSearchRepository {

    private final NamedParameterJdbcTemplate jdbc;

    public RoomSearchRepository(NamedParameterJdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public Integer getMaxBookingRooms(UUID propertyId) {
        String sql = "SELECT max_booking_rooms FROM properties WHERE id = :propertyId";
        return jdbc.queryForObject(sql, new MapSqlParameterSource("propertyId", propertyId), Integer.class);
    }

    public List<Map<String, Object>> searchRooms(UUID propertyId, RoomSearchRequest req) {
        StringBuilder sql = new StringBuilder("""
            WITH 
            Availability AS (
                SELECT room_type_id, MIN(available_rooms) AS min_available_rooms, COUNT(date) AS days_covered
                FROM room_inventory
                WHERE date >= :checkIn AND date < :checkOut
                GROUP BY room_type_id
            ),
            Pricing AS (
                SELECT room_type_id, SUM(price) AS base_total_price, MIN(price) AS base_price_per_night
                FROM room_rates
                WHERE date >= :checkIn AND date < :checkOut
                GROUP BY room_type_id
            ),
            BestOffers AS (
                SELECT rt.id AS room_type_id, 
                       COALESCE(MAX(o.offer_percentage), 0) AS discount_pct
                FROM room_types rt
                LEFT JOIN offers o ON o.is_active = TRUE AND o.is_promocode = FALSE
                LEFT JOIN property_offers po ON po.offer_id = o.id AND po.property_id = rt.property_id
                LEFT JOIN room_type_offers rto ON rto.offer_id = o.id AND rto.room_type_id = rt.id
                WHERE rt.property_id = :propertyId
                GROUP BY rt.id
            )
            SELECT 
                rt.id, rt.title, rt.size_sqft, rt.max_occupancy, rt.images,
                bt.name AS bed_type,
                inv.min_available_rooms,
                p.base_total_price,
                p.base_price_per_night,
                off.discount_pct AS best_offer_percentage,
                -- Calculated display price for one room
                (p.base_total_price * (1 - off.discount_pct / 100.0)) AS display_price_per_room
            FROM room_types rt
            JOIN bed_types bt ON bt.id = rt.bed_type_id
            JOIN Availability inv ON inv.room_type_id = rt.id
            JOIN Pricing p ON p.room_type_id = rt.id
            JOIN BestOffers off ON off.room_type_id = rt.id
            WHERE rt.property_id = :propertyId
              AND inv.min_available_rooms >= :rooms
              AND inv.days_covered = :numNights
        """);

        MapSqlParameterSource params = buildRequiredParams(propertyId, req);
        appendOptionalFilters(sql, params, req);

        String sortField = req.getSortField() != null ? req.getSortField() : "";
        String sortColumn = switch (sortField) {
            case "size_sqft" -> "rt.size_sqft";
            case "max_occupancy" -> "rt.max_occupancy";
            default -> "display_price_per_room"; 
        };
        String sortDir = "desc".equalsIgnoreCase(req.getSortDirection()) ? "DESC" : "ASC";
        sql.append(" ORDER BY ").append(sortColumn).append(" ").append(sortDir);

        sql.append(" LIMIT :limit OFFSET :offset ");
        params.addValue("limit", req.getLimit());
        params.addValue("offset", req.getOffset());

        return jdbc.queryForList(sql.toString(), params);
    }

    public int countRooms(UUID propertyId, RoomSearchRequest req) {
        StringBuilder sql = new StringBuilder("""
            WITH Availability AS (
                SELECT room_type_id, MIN(available_rooms) AS min_available_rooms, COUNT(date) AS days_covered
                FROM room_inventory
                WHERE date >= :checkIn AND date < :checkOut
                GROUP BY room_type_id
            ),
            Pricing AS (
                SELECT room_type_id, SUM(price) AS base_total_price FROM room_rates
                WHERE date >= :checkIn AND date < :checkOut
                GROUP BY room_type_id
            ),
            BestOffers AS (
                SELECT rt.id AS room_type_id, COALESCE(MAX(o.offer_percentage), 0) AS discount_pct
                FROM room_types rt
                LEFT JOIN offers o ON o.is_active = TRUE AND o.is_promocode = FALSE
                LEFT JOIN property_offers po ON po.offer_id = o.id AND po.property_id = rt.property_id
                LEFT JOIN room_type_offers rto ON rto.offer_id = o.id AND rto.room_type_id = rt.id
                WHERE rt.property_id = :propertyId
                GROUP BY rt.id
            )
            SELECT COUNT(*) FROM room_types rt
            JOIN Availability inv ON inv.room_type_id = rt.id
            JOIN Pricing p ON p.room_type_id = rt.id
            JOIN BestOffers off ON off.room_type_id = rt.id
            WHERE rt.property_id = :propertyId
              AND inv.min_available_rooms >= :rooms
              AND inv.days_covered = :numNights
        """);

        MapSqlParameterSource params = buildRequiredParams(propertyId, req);
        appendOptionalFilters(sql, params, req);

        return jdbc.queryForObject(sql.toString(), params, Integer.class);
    }

    private void appendOptionalFilters(StringBuilder sql, MapSqlParameterSource params, RoomSearchRequest req) {
        if (req.getBedTypeId() != null) {
            sql.append("""
                AND rt.bed_type_id IN (
                    SELECT bt2.id FROM bed_types bt2
                    JOIN filter_options fo ON fo.name = bt2.name
                    WHERE fo.id = :bedTypeId
                )
            """);
            params.addValue("bedTypeId", req.getBedTypeId());
        }

        if (req.getPriceMin() != null) {
            sql.append("""
                AND (p.base_total_price * (1 - off.discount_pct / 100.0)) 
                    * CEIL(:guests::float / NULLIF(rt.max_occupancy, 0)) >= :priceMin
            """);
            params.addValue("priceMin", req.getPriceMin());
        }

        if (req.getPriceMax() != null) {
            sql.append("""
                AND (p.base_total_price * (1 - off.discount_pct / 100.0)) 
                    * CEIL(:guests::float / NULLIF(rt.max_occupancy, 0)) <= :priceMax
            """);
            params.addValue("priceMax", req.getPriceMax());
        }

        if (req.getOccupancyMin() != null) {
            sql.append(" AND rt.max_occupancy >= :occupancyMin ");
            params.addValue("occupancyMin", req.getOccupancyMin());
        }
        if (req.getOccupancyMax() != null) {
            sql.append(" AND rt.max_occupancy <= :occupancyMax ");
            params.addValue("occupancyMax", req.getOccupancyMax());
         }

        if (req.getAmenities() != null && !req.getAmenities().isEmpty()) {
    sql.append("""
        AND rt.id IN (
            SELECT rta.room_type_id
            FROM room_type_amenities rta
            WHERE rta.amenity_id = ANY(:amenityIds)
            GROUP BY rta.room_type_id
            HAVING COUNT(DISTINCT rta.amenity_id) = :amenityCount
        )
    """);
    params.addValue("amenityIds", req.getAmenities().toArray(new UUID[0]));
    params.addValue("amenityCount", req.getAmenities().size());
}
    }

    private MapSqlParameterSource buildRequiredParams(UUID propertyId, RoomSearchRequest req) {
        return new MapSqlParameterSource()
                .addValue("propertyId", propertyId)
                .addValue("checkIn", req.getCheckIn())
                .addValue("checkOut", req.getCheckOut())
                .addValue("rooms", req.getRooms())
                .addValue("numNights", req.getNumNights())
                .addValue("guests", req.getGuests());
    }

    public List<Map<String, Object>> getPropertyOffers(UUID propertyId) {
        String sql = """
            SELECT o.offer_percentage FROM offers o
            JOIN property_offers po ON po.offer_id = o.id
            WHERE po.property_id = :propertyId AND o.is_active = TRUE AND o.is_promocode = FALSE
            """;
        return jdbc.queryForList(sql, new MapSqlParameterSource("propertyId", propertyId));
    }

    public List<Map<String, Object>> getFiltersForProperty(UUID propertyId) {
        String sql = """
            SELECT f.id AS filter_id, f.filter_name, f.type, fo.id AS option_id, fo.name AS option_name
            FROM property_type_filters ptf
            JOIN filters f ON f.id = ptf.filter_id
            LEFT JOIN filter_options fo ON fo.filter_id = f.id
            WHERE ptf.property_id = :propertyId
            ORDER BY f.filter_name, fo.name
            """;
        return jdbc.queryForList(sql, new MapSqlParameterSource("propertyId", propertyId));
    }

    public List<Map<String, Object>> getSortOptionsForProperty(UUID propertyId) {
        String sql = """
            SELECT so.id, so.name, so.default_order FROM property_type_sort pts
            JOIN sort_options so ON so.id = pts.sort_options_id
            WHERE pts.property_id = :propertyId
            """;
        return jdbc.queryForList(sql, new MapSqlParameterSource("propertyId", propertyId));
    }
}