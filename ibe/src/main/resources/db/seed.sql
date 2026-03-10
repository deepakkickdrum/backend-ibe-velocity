-- ============================================================
-- SEED DATA — taj
-- UUID sequences continue from velocity-hotels:
--   tenant:              ...0002
--   properties:          ...0004–0006
--   landing_page_configs: ...0004–0006
--   guest_types:         ...0009–0016
--   room_types:          ...0008–0014
--   amenities:           ...0018–0034
--   room_type_amenities: b000...0002-XXXX-XXXXXXXXX
--   bookings:            ...0008–0014
-- ============================================================

-- ── Tenant ──────────────────────────────────────────────────
INSERT INTO tenants (id, name, logo_url, banner_image_url, created_at, updated_at)
VALUES (
    'a0000000-0000-0000-0000-000000000002',
    'taj',
    '/tenant-assets/taj/branding/logo.svg',
    '/tenant-assets/taj/branding/banner.jpg',
    NOW(), NOW()
);

-- ── Properties ──────────────────────────────────────────────
INSERT INTO properties (id, tenant_id, name, max_booking_rooms, max_guests_per_room, min_stay, max_stay, banner_image_url, created_at, updated_at)
VALUES
    ('b0000000-0000-0000-0000-000000000004',
     'a0000000-0000-0000-0000-000000000002',
     'Taj Downtown', 5, 4, 1, 14,
     '/tenant-assets/taj/downtown/branding/banner.jpg',
     NOW(), NOW()),
    ('b0000000-0000-0000-0000-000000000005',
     'a0000000-0000-0000-0000-000000000002',
     'Taj Airport', 3, 2, 1, 7,
     '/tenant-assets/taj/airport/branding/banner.jpg',
     NOW(), NOW()),
    ('b0000000-0000-0000-0000-000000000006',
     'a0000000-0000-0000-0000-000000000002',
     'Taj Beach Resort', 4, 4, 2, 21,
     '/tenant-assets/taj/beach/branding/banner.jpg',
     NOW(), NOW());

-- ── Landing Page Configs ─────────────────────────────────────
INSERT INTO landing_page_configs (id, property_id, show_guests_option, show_rooms_option, show_acc_option, created_at, updated_at)
VALUES
    ('c0000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000004', TRUE,  TRUE,  FALSE, NOW(), NOW()),
    ('c0000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000005', TRUE,  FALSE, TRUE,  NOW(), NOW()),
    ('c0000000-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000006', TRUE,  TRUE,  TRUE,  NOW(), NOW());

-- ── Guest Types ──────────────────────────────────────────────
INSERT INTO guest_types (id, property_id, name, min_age, max_age, created_at, updated_at)
VALUES
    -- Downtown
    ('d0000000-0000-0000-0000-000000000009', 'b0000000-0000-0000-0000-000000000004', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000010', 'b0000000-0000-0000-0000-000000000004', 'Child',   2,   17, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000011', 'b0000000-0000-0000-0000-000000000004', 'Infant',  0,    1, NOW(), NOW()),
    -- Airport
    ('d0000000-0000-0000-0000-000000000012', 'b0000000-0000-0000-0000-000000000005', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000013', 'b0000000-0000-0000-0000-000000000005', 'Child',   2,   17, NOW(), NOW()),
    -- Beach
    ('d0000000-0000-0000-0000-000000000014', 'b0000000-0000-0000-0000-000000000006', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000015', 'b0000000-0000-0000-0000-000000000006', 'Child',   5,   17, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000016', 'b0000000-0000-0000-0000-000000000006', 'Infant',  0,    4, NOW(), NOW());

-- ── Bed Types ────────────────────────────────────────────────
-- Reuse existing bed types — no new inserts needed
-- King:   e0000000-0000-0000-0000-000000000001
-- Queen:  e0000000-0000-0000-0000-000000000002
-- Twin:   e0000000-0000-0000-0000-000000000003
-- Double: e0000000-0000-0000-0000-000000000004

-- ── Room Types ───────────────────────────────────────────────
INSERT INTO room_types (id, property_id, bed_type_id, title, description, size_sqft, max_occupancy, images, created_at, updated_at)
VALUES
    -- Downtown
    ('f0000000-0000-0000-0000-000000000008',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Executive King',
     'Elegant king room with floor-to-ceiling windows, city skyline views, and executive lounge access.',
     540.00, 2,
     '[{"url": "/tenant-assets/taj/downtown/rooms/king-1.jpg", "alt": "Executive King Room"},
       {"url": "/tenant-assets/taj/downtown/rooms/king-2.jpg", "alt": "Executive King Bathroom"},
       {"url": "/tenant-assets/taj/downtown/rooms/king-3.jpg", "alt": "City Skyline View"}]',
     NOW(), NOW()),
    ('f0000000-0000-0000-0000-000000000009',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000002',
     'Taj Deluxe Queen',
     'Stylish queen room with modern decor, work desk, and premium bedding.',
     360.00, 2,
     '[{"url": "/tenant-assets/taj/downtown/rooms/queen-1.jpg", "alt": "Deluxe Queen Room"},
       {"url": "/tenant-assets/taj/downtown/rooms/queen-2.jpg", "alt": "Deluxe Queen Workspace"}]',
     NOW(), NOW()),
    ('f0000000-0000-0000-0000-000000000010',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000003',
     'Taj Twin Room',
     'Well-appointed twin room with two single beds, ideal for business travellers.',
     330.00, 2,
     '[{"url": "/tenant-assets/taj/downtown/rooms/twin-1.jpg", "alt": "Twin Room"},
       {"url": "/tenant-assets/taj/downtown/rooms/twin-2.jpg", "alt": "Twin Room Seating Area"}]',
     NOW(), NOW()),
    -- Airport
    ('f0000000-0000-0000-0000-000000000011',
     'b0000000-0000-0000-0000-000000000005',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Airport King',
     'Soundproofed king room with blackout curtains and express check-in for transit guests.',
     410.00, 2,
     '[{"url": "/tenant-assets/taj/airport/rooms/king-1.jpg", "alt": "Airport King Room"},
       {"url": "/tenant-assets/taj/airport/rooms/king-2.jpg", "alt": "Airport King Bathroom"}]',
     NOW(), NOW()),
    ('f0000000-0000-0000-0000-000000000012',
     'b0000000-0000-0000-0000-000000000005',
     'e0000000-0000-0000-0000-000000000004',
     'Taj Airport Double',
     'Compact double room with complimentary shuttle and late checkout flexibility.',
     310.00, 2,
     '[{"url": "/tenant-assets/taj/airport/rooms/double-1.jpg", "alt": "Airport Double Room"}]',
     NOW(), NOW()),
    -- Beach
    ('f0000000-0000-0000-0000-000000000013',
     'b0000000-0000-0000-0000-000000000006',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Oceanfront King Suite',
     'Premium beachfront suite with private terrace, plunge pool, and unobstructed ocean views.',
     700.00, 3,
     '[{"url": "/tenant-assets/taj/beach/rooms/suite-1.jpg", "alt": "Oceanfront King Suite"},
       {"url": "/tenant-assets/taj/beach/rooms/suite-2.jpg", "alt": "Private Terrace"},
       {"url": "/tenant-assets/taj/beach/rooms/suite-3.jpg", "alt": "Plunge Pool View"}]',
     NOW(), NOW()),
    ('f0000000-0000-0000-0000-000000000014',
     'b0000000-0000-0000-0000-000000000006',
     'e0000000-0000-0000-0000-000000000002',
     'Taj Sea View Queen',
     'Airy queen room with panoramic sea views, tropical decor, and direct beach access.',
     430.00, 2,
     '[{"url": "/tenant-assets/taj/beach/rooms/queen-1.jpg", "alt": "Sea View Queen Room"},
       {"url": "/tenant-assets/taj/beach/rooms/queen-2.jpg", "alt": "Beach Access View"}]',
     NOW(), NOW());

-- ── Amenities ────────────────────────────────────────────────
INSERT INTO amenities (id, property_id, label, created_at, updated_at)
VALUES
    -- Downtown amenities
    ('a0000000-0000-0000-0007-000000000018', 'b0000000-0000-0000-0000-000000000004', 'Free Wi-Fi',          NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000019', 'b0000000-0000-0000-0000-000000000004', 'Air Conditioning',    NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000020', 'b0000000-0000-0000-0000-000000000004', 'Flat-screen TV',      NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000021', 'b0000000-0000-0000-0000-000000000004', 'Executive Lounge',    NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000022', 'b0000000-0000-0000-0000-000000000004', 'Room Service',        NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000023', 'b0000000-0000-0000-0000-000000000004', 'City View',           NOW(), NOW()),
    -- Airport amenities
    ('a0000000-0000-0000-0007-000000000024', 'b0000000-0000-0000-0000-000000000005', 'Free Wi-Fi',          NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000025', 'b0000000-0000-0000-0000-000000000005', 'Airport Shuttle',     NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000026', 'b0000000-0000-0000-0000-000000000005', 'Air Conditioning',    NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000027', 'b0000000-0000-0000-0000-000000000005', 'Soundproof Rooms',    NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000028', 'b0000000-0000-0000-0000-000000000005', '24hr Front Desk',     NOW(), NOW()),
    -- Beach amenities
    ('a0000000-0000-0000-0007-000000000029', 'b0000000-0000-0000-0000-000000000006', 'Free Wi-Fi',          NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000030', 'b0000000-0000-0000-0000-000000000006', 'Ocean View',          NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000031', 'b0000000-0000-0000-0000-000000000006', 'Private Beach',       NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000032', 'b0000000-0000-0000-0000-000000000006', 'Swimming Pool',       NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000033', 'b0000000-0000-0000-0000-000000000006', 'Air Conditioning',    NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000034', 'b0000000-0000-0000-0000-000000000006', 'Spa Access',          NOW(), NOW());

-- ── Room Type Amenities ──────────────────────────────────────
INSERT INTO room_type_amenities (id, room_type_id, amenity_id, created_at, updated_at)
VALUES
    -- Taj Executive King → all Downtown amenities
    ('b0000000-0000-0002-0008-000000000001', 'f0000000-0000-0000-0000-000000000008', 'a0000000-0000-0000-0007-000000000018', NOW(), NOW()),
    ('b0000000-0000-0002-0008-000000000002', 'f0000000-0000-0000-0000-000000000008', 'a0000000-0000-0000-0007-000000000019', NOW(), NOW()),
    ('b0000000-0000-0002-0008-000000000003', 'f0000000-0000-0000-0000-000000000008', 'a0000000-0000-0000-0007-000000000020', NOW(), NOW()),
    ('b0000000-0000-0002-0008-000000000004', 'f0000000-0000-0000-0000-000000000008', 'a0000000-0000-0000-0007-000000000021', NOW(), NOW()),
    ('b0000000-0000-0002-0008-000000000005', 'f0000000-0000-0000-0000-000000000008', 'a0000000-0000-0000-0007-000000000022', NOW(), NOW()),
    ('b0000000-0000-0002-0008-000000000006', 'f0000000-0000-0000-0000-000000000008', 'a0000000-0000-0000-0007-000000000023', NOW(), NOW()),
    -- Taj Deluxe Queen
    ('b0000000-0000-0002-0009-000000000001', 'f0000000-0000-0000-0000-000000000009', 'a0000000-0000-0000-0007-000000000018', NOW(), NOW()),
    ('b0000000-0000-0002-0009-000000000002', 'f0000000-0000-0000-0000-000000000009', 'a0000000-0000-0000-0007-000000000019', NOW(), NOW()),
    ('b0000000-0000-0002-0009-000000000003', 'f0000000-0000-0000-0000-000000000009', 'a0000000-0000-0000-0007-000000000020', NOW(), NOW()),
    ('b0000000-0000-0002-0009-000000000004', 'f0000000-0000-0000-0000-000000000009', 'a0000000-0000-0000-0007-000000000022', NOW(), NOW()),
    -- Taj Twin Room
    ('b0000000-0000-0002-0010-000000000001', 'f0000000-0000-0000-0000-000000000010', 'a0000000-0000-0000-0007-000000000018', NOW(), NOW()),
    ('b0000000-0000-0002-0010-000000000002', 'f0000000-0000-0000-0000-000000000010', 'a0000000-0000-0000-0007-000000000019', NOW(), NOW()),
    ('b0000000-0000-0002-0010-000000000003', 'f0000000-0000-0000-0000-000000000010', 'a0000000-0000-0000-0007-000000000020', NOW(), NOW()),
    -- Taj Airport King → all Airport amenities
    ('b0000000-0000-0002-0011-000000000001', 'f0000000-0000-0000-0000-000000000011', 'a0000000-0000-0000-0007-000000000024', NOW(), NOW()),
    ('b0000000-0000-0002-0011-000000000002', 'f0000000-0000-0000-0000-000000000011', 'a0000000-0000-0000-0007-000000000025', NOW(), NOW()),
    ('b0000000-0000-0002-0011-000000000003', 'f0000000-0000-0000-0000-000000000011', 'a0000000-0000-0000-0007-000000000026', NOW(), NOW()),
    ('b0000000-0000-0002-0011-000000000004', 'f0000000-0000-0000-0000-000000000011', 'a0000000-0000-0000-0007-000000000027', NOW(), NOW()),
    ('b0000000-0000-0002-0011-000000000005', 'f0000000-0000-0000-0000-000000000011', 'a0000000-0000-0000-0007-000000000028', NOW(), NOW()),
    -- Taj Airport Double
    ('b0000000-0000-0002-0012-000000000001', 'f0000000-0000-0000-0000-000000000012', 'a0000000-0000-0000-0007-000000000024', NOW(), NOW()),
    ('b0000000-0000-0002-0012-000000000002', 'f0000000-0000-0000-0000-000000000012', 'a0000000-0000-0000-0007-000000000025', NOW(), NOW()),
    ('b0000000-0000-0002-0012-000000000003', 'f0000000-0000-0000-0000-000000000012', 'a0000000-0000-0000-0007-000000000026', NOW(), NOW()),
    ('b0000000-0000-0002-0012-000000000004', 'f0000000-0000-0000-0000-000000000012', 'a0000000-0000-0000-0007-000000000028', NOW(), NOW()),
    -- Taj Oceanfront King Suite → all Beach amenities
    ('b0000000-0000-0002-0013-000000000001', 'f0000000-0000-0000-0000-000000000013', 'a0000000-0000-0000-0007-000000000029', NOW(), NOW()),
    ('b0000000-0000-0002-0013-000000000002', 'f0000000-0000-0000-0000-000000000013', 'a0000000-0000-0000-0007-000000000030', NOW(), NOW()),
    ('b0000000-0000-0002-0013-000000000003', 'f0000000-0000-0000-0000-000000000013', 'a0000000-0000-0000-0007-000000000031', NOW(), NOW()),
    ('b0000000-0000-0002-0013-000000000004', 'f0000000-0000-0000-0000-000000000013', 'a0000000-0000-0000-0007-000000000032', NOW(), NOW()),
    ('b0000000-0000-0002-0013-000000000005', 'f0000000-0000-0000-0000-000000000013', 'a0000000-0000-0000-0007-000000000033', NOW(), NOW()),
    ('b0000000-0000-0002-0013-000000000006', 'f0000000-0000-0000-0000-000000000013', 'a0000000-0000-0000-0007-000000000034', NOW(), NOW()),
    -- Taj Sea View Queen
    ('b0000000-0000-0002-0014-000000000001', 'f0000000-0000-0000-0000-000000000014', 'a0000000-0000-0000-0007-000000000029', NOW(), NOW()),
    ('b0000000-0000-0002-0014-000000000002', 'f0000000-0000-0000-0000-000000000014', 'a0000000-0000-0000-0007-000000000030', NOW(), NOW()),
    ('b0000000-0000-0002-0014-000000000003', 'f0000000-0000-0000-0000-000000000014', 'a0000000-0000-0000-0007-000000000032', NOW(), NOW()),
    ('b0000000-0000-0002-0014-000000000004', 'f0000000-0000-0000-0000-000000000014', 'a0000000-0000-0000-0007-000000000033', NOW(), NOW());

-- ── Room Rates (next 90 days, realistic weekend pricing) ─────
-- Weekday base | Friday/Saturday +25% | Sunday +10%
INSERT INTO room_rates (id, property_id, room_type_id, date, price, created_at, updated_at)
SELECT
    gen_random_uuid(),
    rt.property_id,
    rt.id,
    CURRENT_DATE + s.i,
    ROUND((rt.base_price * CASE
        WHEN EXTRACT(DOW FROM CURRENT_DATE + s.i) IN (5, 6) THEN 1.25
        WHEN EXTRACT(DOW FROM CURRENT_DATE + s.i) = 0       THEN 1.10
        ELSE 1.00
    END)::numeric, 2),
    NOW(), NOW()
FROM (
    VALUES
        ('f0000000-0000-0000-0000-000000000008'::UUID, 'b0000000-0000-0000-0000-000000000004'::UUID, 269.99::DECIMAL),
        ('f0000000-0000-0000-0000-000000000009'::UUID, 'b0000000-0000-0000-0000-000000000004'::UUID, 169.99::DECIMAL),
        ('f0000000-0000-0000-0000-000000000010'::UUID, 'b0000000-0000-0000-0000-000000000004'::UUID, 149.99::DECIMAL),
        ('f0000000-0000-0000-0000-000000000011'::UUID, 'b0000000-0000-0000-0000-000000000005'::UUID, 199.99::DECIMAL),
        ('f0000000-0000-0000-0000-000000000012'::UUID, 'b0000000-0000-0000-0000-000000000005'::UUID, 129.99::DECIMAL),
        ('f0000000-0000-0000-0000-000000000013'::UUID, 'b0000000-0000-0000-0000-000000000006'::UUID, 449.99::DECIMAL),
        ('f0000000-0000-0000-0000-000000000014'::UUID, 'b0000000-0000-0000-0000-000000000006'::UUID, 299.99::DECIMAL)
) AS rt(id, property_id, base_price)
CROSS JOIN generate_series(0, 89) AS s(i);

-- ── Room Inventory (next 90 days) ────────────────────────────
-- Weekdays  → 80% available (20% occupied)
-- Sundays   → 60% available (40% occupied)
-- Fri/Sat   → 40% available (60% occupied)
INSERT INTO room_inventory (id, property_id, room_type_id, date, total_rooms, available_rooms, version, created_at, updated_at)
SELECT
    gen_random_uuid(),
    rt.property_id,
    rt.id,
    CURRENT_DATE + s.i,
    rt.total_rooms,
    GREATEST(0, rt.total_rooms - CASE
        WHEN EXTRACT(DOW FROM CURRENT_DATE + s.i) IN (5, 6) THEN (rt.total_rooms * 0.6)::INT
        WHEN EXTRACT(DOW FROM CURRENT_DATE + s.i) = 0       THEN (rt.total_rooms * 0.4)::INT
        ELSE (rt.total_rooms * 0.2)::INT
    END),
    0,
    NOW(), NOW()
FROM (
    VALUES
        ('f0000000-0000-0000-0000-000000000008'::UUID, 'b0000000-0000-0000-0000-000000000004'::UUID, 12),
        ('f0000000-0000-0000-0000-000000000009'::UUID, 'b0000000-0000-0000-0000-000000000004'::UUID, 18),
        ('f0000000-0000-0000-0000-000000000010'::UUID, 'b0000000-0000-0000-0000-000000000004'::UUID, 14),
        ('f0000000-0000-0000-0000-000000000011'::UUID, 'b0000000-0000-0000-0000-000000000005'::UUID, 10),
        ('f0000000-0000-0000-0000-000000000012'::UUID, 'b0000000-0000-0000-0000-000000000005'::UUID, 22),
        ('f0000000-0000-0000-0000-000000000013'::UUID, 'b0000000-0000-0000-0000-000000000006'::UUID,  8),
        ('f0000000-0000-0000-0000-000000000014'::UUID, 'b0000000-0000-0000-0000-000000000006'::UUID, 16)
) AS rt(id, property_id, total_rooms)
CROSS JOIN generate_series(0, 89) AS s(i);

-- ── Bookings ─────────────────────────────────────────────────
INSERT INTO bookings (id, property_id, room_type_id, check_in, check_out, total_price, status, created_at, updated_at)
VALUES
    -- Downtown — confirmed
    ('a0000000-0000-0000-0009-000000000008',
     'b0000000-0000-0000-0000-000000000004',
     'f0000000-0000-0000-0000-000000000008',
     CURRENT_DATE +  3, CURRENT_DATE +  6,
     809.97, 'CONFIRMED', NOW(), NOW()),
    ('a0000000-0000-0000-0009-000000000009',
     'b0000000-0000-0000-0000-000000000004',
     'f0000000-0000-0000-0000-000000000009',
     CURRENT_DATE +  8, CURRENT_DATE + 11,
     509.97, 'CONFIRMED', NOW(), NOW()),
    ('a0000000-0000-0000-0009-000000000010',
     'b0000000-0000-0000-0000-000000000004',
     'f0000000-0000-0000-0000-000000000010',
     CURRENT_DATE + 15, CURRENT_DATE + 18,
     449.97, 'CONFIRMED', NOW(), NOW()),
    -- Airport
    ('a0000000-0000-0000-0009-000000000011',
     'b0000000-0000-0000-0000-000000000005',
     'f0000000-0000-0000-0000-000000000011',
     CURRENT_DATE +  1, CURRENT_DATE +  3,
     399.98, 'PENDING', NOW(), NOW()),
    ('a0000000-0000-0000-0009-000000000012',
     'b0000000-0000-0000-0000-000000000005',
     'f0000000-0000-0000-0000-000000000012',
     CURRENT_DATE +  6, CURRENT_DATE +  9,
     389.97, 'CONFIRMED', NOW(), NOW()),
    -- Beach
    ('a0000000-0000-0000-0009-000000000013',
     'b0000000-0000-0000-0000-000000000006',
     'f0000000-0000-0000-0000-000000000013',
     CURRENT_DATE + 12, CURRENT_DATE + 19,
     3149.93, 'CONFIRMED', NOW(), NOW()),
    ('a0000000-0000-0000-0009-000000000014',
     'b0000000-0000-0000-0000-000000000006',
     'f0000000-0000-0000-0000-000000000014',
     CURRENT_DATE +  4, CURRENT_DATE +  7,
     899.97, 'CANCELLED', NOW(), NOW());
