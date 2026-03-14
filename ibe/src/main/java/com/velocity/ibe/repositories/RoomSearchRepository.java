package com.velocity.ibe.repositories;

import com.velocity.ibe.dto.rooms.RoomSearchRequest;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Repository
public class RoomSearchRepository {

    private final NamedParameterJdbcTemplate jdbc;

    public RoomSearchRepository(NamedParameterJdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    //max_booking_rooms
    public Integer getMaxBookingRooms(UUID propertyId) {
        String sql = """ 
        SELECT max_booking_rooms FROM properties WHERE id = :propertyId 
        """;
        return jdbc.queryForObject(sql, new MapSqlParameterSource("propertyId", propertyId), Integer.class);
    }

    //search rooms
    public List<Map<String, Object>> searchRooms(UUID propertyId, RoomSearchRequest req) {
        StringBuilder sql = new StringBuilder("""
                SELECT
                    rt.id,
                    rt.title,
                    rt.size_sqft,
                    rt.max_occupancy,
                    rt.images,
                    bt.name AS bed_type,
                    inv.min_available_rooms,
                    rates.base_total_price,
                    rates.base_price_per_night
                FROM room_types rt
                JOIN bed_types bt
                    ON bt.id = rt.bed_type_id
                JOIN (
                    SELECT room_type_id, MIN(available_rooms) AS min_available_rooms, COUNT(date) as days_covered
                    FROM room_inventory
                    WHERE date >= :checkIn AND date <  :checkOut
                    GROUP BY room_type_id
                ) inv ON inv.room_type_id = rt.id
                JOIN (
                    SELECT room_type_id,SUM(price) AS base_total_price, min(price) as base_price_per_night
                    FROM room_rates
                    WHERE date >= :checkIn AND date < :checkOut
                    GROUP BY room_type_id
                ) rates ON rates.room_type_id = rt.id
                WHERE rt.property_id = :propertyId AND inv.min_available_rooms >= :rooms AND inv.days_covered = :numNights
                """);

        MapSqlParameterSource params = buildRequiredParams(propertyId, req);
        appendOptionalFilters(sql, params, req);

        // sort
        String sortColumn = switch (req.getSortField() != null ? req.getSortField() : "") {
            case "size_sqft" -> "rt.size_sqft";
            case "max_occupancy" -> "rt.max_occupancy";
            default -> "rates.base_total_price";
        };
        String sortDir = "desc".equalsIgnoreCase(req.getSortDirection()) ? "DESC" : "ASC";
        sql.append(" ORDER BY ").append(sortColumn).append(" ").append(sortDir);

        sql.append(" LIMIT :limit OFFSET :offset ");
        params.addValue("limit", req.getLimit());
        params.addValue("offset", req.getOffset());

        return jdbc.queryForList(sql.toString(), params);
    }

    // count query for pagination
    public int countRooms(UUID propertyId, RoomSearchRequest req) {
        StringBuilder sql = new StringBuilder("""
                SELECT COUNT(*) FROM (
                    SELECT rt.id
                    FROM room_types rt
                    JOIN (
                        SELECT room_type_id,MIN(available_rooms) AS min_available_rooms, COUNT(date) AS days_covered
                        FROM room_inventory
                        WHERE date >= :checkIn AND date < :checkOut
                        GROUP BY room_type_id
                    ) inv ON inv.room_type_id = rt.id
                    JOIN (
                        SELECT room_type_id, MIN(price) AS base_price_per_night
                        FROM room_rates
                        WHERE date >= :checkIn AND date <  :checkOut
                        GROUP BY room_type_id
                    ) rates ON rates.room_type_id = rt.id
                    WHERE rt.property_id = :propertyId AND inv.min_available_rooms >= :rooms AND inv.days_covered = :numNights
                """);

        MapSqlParameterSource params = buildRequiredParams(propertyId, req);
        appendOptionalFilters(sql, params, req);
        sql.append(") AS counted_rooms");

        return jdbc.queryForObject(sql.toString(), params, Integer.class);
    }

    //property offers
    public List<Map<String, Object>> getPropertyOffers(UUID propertyId) {
        String sql = """
                SELECT o.offer_percentage
                FROM offers o
                JOIN property_offers po ON po.offer_id = o.id
                WHERE po.property_id = :propertyId AND o.is_active = TRUE AND o.is_promocode = FALSE
                """;
        return jdbc.queryForList(sql, new MapSqlParameterSource("propertyId", propertyId));
    }

    // room type offers
    public List<Map<String, Object>> getRoomTypeOffers(UUID roomTypeId) {
        String sql = """
                SELECT o.offer_percentage
                FROM offers o
                JOIN room_type_offers rto ON rto.offer_id = o.id
                WHERE rto.room_type_id = :roomTypeId AND o.is_active = TRUE AND o.is_promocode = FALSE
                """;
        return jdbc.queryForList(sql, new MapSqlParameterSource("roomTypeId", roomTypeId));
    }

    //filters
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

    // sort options
    public List<Map<String, Object>> getSortOptionsForProperty(UUID propertyId) {
        String sql = """
                SELECT so.id, so.name, so.default_order
                FROM property_type_sort pts
                JOIN sort_options so ON so.id = pts.sort_options_id
                WHERE pts.property_id = :propertyId
                """;
        return jdbc.queryForList(sql, new MapSqlParameterSource("propertyId", propertyId));
    }

    private MapSqlParameterSource buildRequiredParams(UUID propertyId, RoomSearchRequest req) {
        return new MapSqlParameterSource()
                .addValue("propertyId", propertyId)
                .addValue("checkIn", req.getCheckIn())
                .addValue("checkOut", req.getCheckOut())
                .addValue("rooms", req.getRooms())
                .addValue("numNights", req.getNumNights());
    }

    // optional filters
    private void appendOptionalFilters(StringBuilder sql, MapSqlParameterSource params, RoomSearchRequest req) {

        if (req.getBedTypeId() != null) {
            sql.append("""
                    AND rt.bed_type_id = (
                        SELECT bt2.id FROM bed_types bt2
                        JOIN filter_options fo ON fo.name = bt2.name
                        WHERE fo.id = :bedTypeId
                    )
                    """);
            params.addValue("bedTypeId", req.getBedTypeId());
        }

        if (req.getPriceMin() != null) {
            sql.append(" AND rates.base_price_per_night >= :priceMin ");
            params.addValue("priceMin", req.getPriceMin());
        }
        if (req.getPriceMax() != null) {
            sql.append(" AND rates.base_price_per_night <= :priceMax ");
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
                        JOIN amenities a ON a.id = rta.amenity_id
                        WHERE a.label = ANY(:amenities)
                        GROUP BY rta.room_type_id
                        HAVING COUNT(DISTINCT a.label) = :amenityCount
                    )
                    """);
            params.addValue("amenities", req.getAmenities().toArray(new String[0]));
            params.addValue("amenityCount", req.getAmenities().size());
        }
    }
}