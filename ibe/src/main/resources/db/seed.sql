-- ============================================================
-- SEED DATA
-- ============================================================

-- ── Tenants ─────────────────────────────────────────────────
INSERT INTO tenants (id, name, logo_url, banner_image_url, created_at, updated_at)
VALUES
    ('a0000000-0000-0000-0000-000000000001', 'velocity-hotels',
     'https://cdn.velocity-hotels.com/logo.png',
     'https://cdn.velocity-hotels.com/banner.jpg',
     NOW(), NOW());

-- ── Properties ──────────────────────────────────────────────
INSERT INTO properties (id, tenant_id, name, max_booking_rooms, min_stay, max_stay, banner_image_url, created_at, updated_at)
VALUES
    ('b0000000-0000-0000-0000-000000000001',
     'a0000000-0000-0000-0000-000000000001',
     'Velocity Downtown', 5, 1, 14,
     'https://cdn.velocity-hotels.com/downtown/banner.jpg',
     NOW(), NOW()),

    ('b0000000-0000-0000-0000-000000000002',
     'a0000000-0000-0000-0000-000000000001',
     'Velocity Airport', 3, 1, 7,
     'https://cdn.velocity-hotels.com/airport/banner.jpg',
     NOW(), NOW());

-- ── Landing Page Configs ─────────────────────────────────────
INSERT INTO landing_page_configs (id, property_id, show_guests_option, show_rooms_option, show_acc_option, created_at, updated_at)
VALUES
    ('c0000000-0000-0000-0000-000000000001',
     'b0000000-0000-0000-0000-000000000001',
     TRUE, TRUE, FALSE, NOW(), NOW()),

    ('c0000000-0000-0000-0000-000000000002',
     'b0000000-0000-0000-0000-000000000002',
     TRUE, FALSE, TRUE, NOW(), NOW());

-- ── Guest Types ──────────────────────────────────────────────
INSERT INTO guest_types (id, property_id, name, min_age, max_age, created_at, updated_at)
VALUES
    ('d0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000001', 'Child',   2,   17, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000001', 'Infant',  0,    1, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000002', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000002', 'Child',   2,   17, NOW(), NOW());

-- ── Bed Types ────────────────────────────────────────────────
INSERT INTO bed_types (id, name, created_at, updated_at)
VALUES
    ('e0000000-0000-0000-0000-000000000001', 'King',   NOW(), NOW()),
    ('e0000000-0000-0000-0000-000000000002', 'Queen',  NOW(), NOW()),
    ('e0000000-0000-0000-0000-000000000003', 'Twin',   NOW(), NOW()),
    ('e0000000-0000-0000-0000-000000000004', 'Double', NOW(), NOW());

-- ── Room Types ───────────────────────────────────────────────
INSERT INTO room_types (id, property_id, bed_type_id, title, description, size_sqft, max_occupancy, images, created_at, updated_at)
VALUES
    ('f0000000-0000-0000-0000-000000000001',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000001',
     'Deluxe King Suite',
     'Spacious suite with city views and a king-size bed.',
     520.00, 2,
     '[{"url": "https://cdn.velocity-hotels.com/downtown/rooms/king-1.jpg", "alt": "King Suite"},
       {"url": "https://cdn.velocity-hotels.com/downtown/rooms/king-2.jpg", "alt": "King Suite Bathroom"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000002',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000002',
     'Standard Queen Room',
     'Comfortable room with a queen-size bed, ideal for couples.',
     350.00, 2,
     '[{"url": "https://cdn.velocity-hotels.com/downtown/rooms/queen-1.jpg", "alt": "Queen Room"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000003',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000003',
     'Twin Room',
     'Two twin beds, perfect for friends or colleagues travelling together.',
     320.00, 2,
     '[{"url": "https://cdn.velocity-hotels.com/downtown/rooms/twin-1.jpg", "alt": "Twin Room"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000004',
     'b0000000-0000-0000-0000-000000000002',
     'e0000000-0000-0000-0000-000000000001',
     'Airport King Room',
     'Quiet king room close to airport terminals.',
     400.00, 2,
     '[{"url": "https://cdn.velocity-hotels.com/airport/rooms/king-1.jpg", "alt": "Airport King Room"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000005',
     'b0000000-0000-0000-0000-000000000002',
     'e0000000-0000-0000-0000-000000000004',
     'Airport Double Room',
     'Affordable double room with complimentary shuttle access.',
     300.00, 2,
     '[{"url": "https://cdn.velocity-hotels.com/airport/rooms/double-1.jpg", "alt": "Airport Double Room"}]',
     NOW(), NOW());

-- ── Amenities ────────────────────────────────────────────────
INSERT INTO amenities (id, property_id, label, created_at, updated_at)
VALUES
    ('a0000000-0000-0000-0007-000000000001', 'b0000000-0000-0000-0000-000000000001', 'Free Wi-Fi',        NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000002', 'b0000000-0000-0000-0000-000000000001', 'Air Conditioning',  NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000003', 'b0000000-0000-0000-0000-000000000001', 'Flat-screen TV',    NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000004', 'b0000000-0000-0000-0000-000000000001', 'Mini Bar',          NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000005', 'b0000000-0000-0000-0000-000000000002', 'Free Wi-Fi',        NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000006', 'b0000000-0000-0000-0000-000000000002', 'Airport Shuttle',   NOW(), NOW()),
    ('a0000000-0000-0000-0007-000000000007', 'b0000000-0000-0000-0000-000000000002', 'Air Conditioning',  NOW(), NOW());

-- ── Room Type Amenities ──────────────────────────────────────
INSERT INTO room_type_amenities (id, room_type_id, amenity_id, created_at, updated_at)
VALUES
    -- Deluxe King Suite
    ('a0000000-0000-0000-0008-000000000001', 'f0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0007-000000000001', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000002', 'f0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0007-000000000002', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000003', 'f0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0007-000000000003', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000004', 'f0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0007-000000000004', NOW(), NOW()),
    -- Standard Queen Room
    ('a0000000-0000-0000-0008-000000000005', 'f0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0007-000000000001', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000006', 'f0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0007-000000000002', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000007', 'f0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0007-000000000003', NOW(), NOW()),
    -- Twin Room
    ('a0000000-0000-0000-0008-000000000008', 'f0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0007-000000000001', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000009', 'f0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0007-000000000002', NOW(), NOW()),
    -- Airport King Room
    ('a0000000-0000-0000-0008-000000000010', 'f0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0007-000000000005', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000011', 'f0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0007-000000000006', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000012', 'f0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0007-000000000007', NOW(), NOW()),
    -- Airport Double Room
    ('a0000000-0000-0000-0008-000000000013', 'f0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0007-000000000005', NOW(), NOW()),
    ('a0000000-0000-0000-0008-000000000014', 'f0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0007-000000000006', NOW(), NOW());

-- ── Room Rates (next 30 days) ────────────────────────────────
INSERT INTO room_rates (id, property_id, room_type_id, date, price, created_at, updated_at)
SELECT
    gen_random_uuid(),
    rt.property_id,
    rt.id,
    CURRENT_DATE + s.i,
    (ARRAY[149.99, 159.99, 174.99, 189.99, 199.99, 129.99, 139.99])[((s.i + rt.seq) % 7) + 1],
    NOW(),
    NOW()
FROM (
    VALUES
        ('f0000000-0000-0000-0000-000000000001'::UUID, 'b0000000-0000-0000-0000-000000000001'::UUID, 0),
        ('f0000000-0000-0000-0000-000000000002'::UUID, 'b0000000-0000-0000-0000-000000000001'::UUID, 1),
        ('f0000000-0000-0000-0000-000000000003'::UUID, 'b0000000-0000-0000-0000-000000000001'::UUID, 2),
        ('f0000000-0000-0000-0000-000000000004'::UUID, 'b0000000-0000-0000-0000-000000000002'::UUID, 3),
        ('f0000000-0000-0000-0000-000000000005'::UUID, 'b0000000-0000-0000-0000-000000000002'::UUID, 4)
) AS rt(id, property_id, seq)
CROSS JOIN generate_series(0, 29) AS s(i);

-- ── Room Inventory (next 30 days) ────────────────────────────
INSERT INTO room_inventory (id, property_id, room_type_id, date, total_rooms, available_rooms, version, created_at, updated_at)
SELECT
    gen_random_uuid(),
    rt.property_id,
    rt.id,
    CURRENT_DATE + s.i,
    10,
    (7 + (s.i % 4)),
    0,
    NOW(),
    NOW()
FROM (
    VALUES
        ('f0000000-0000-0000-0000-000000000001'::UUID, 'b0000000-0000-0000-0000-000000000001'::UUID),
        ('f0000000-0000-0000-0000-000000000002'::UUID, 'b0000000-0000-0000-0000-000000000001'::UUID),
        ('f0000000-0000-0000-0000-000000000003'::UUID, 'b0000000-0000-0000-0000-000000000001'::UUID),
        ('f0000000-0000-0000-0000-000000000004'::UUID, 'b0000000-0000-0000-0000-000000000002'::UUID),
        ('f0000000-0000-0000-0000-000000000005'::UUID, 'b0000000-0000-0000-0000-000000000002'::UUID)
) AS rt(id, property_id)
CROSS JOIN generate_series(0, 29) AS s(i);

-- ── Bookings ─────────────────────────────────────────────────
INSERT INTO bookings (id, property_id, room_type_id, check_in, check_out, total_price, status, created_at, updated_at)
VALUES
    ('a0000000-0000-0000-0009-000000000001',
     'b0000000-0000-0000-0000-000000000001',
     'f0000000-0000-0000-0000-000000000001',
     CURRENT_DATE + 2, CURRENT_DATE + 5,
     524.97, 'CONFIRMED', NOW(), NOW()),

    ('a0000000-0000-0000-0009-000000000002',
     'b0000000-0000-0000-0000-000000000001',
     'f0000000-0000-0000-0000-000000000002',
     CURRENT_DATE + 7, CURRENT_DATE + 10,
     449.97, 'CONFIRMED', NOW(), NOW()),

    ('a0000000-0000-0000-0009-000000000003',
     'b0000000-0000-0000-0000-000000000002',
     'f0000000-0000-0000-0000-000000000004',
     CURRENT_DATE + 1, CURRENT_DATE + 3,
     299.98, 'PENDING', NOW(), NOW());
