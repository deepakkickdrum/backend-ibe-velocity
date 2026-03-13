INSERT INTO tenants (id, name, logo_url, banner_image_url, created_at, updated_at)
VALUES
    ('a0000000-0000-0000-0000-000000000001',
     'velocity-hotels',
     '/tenant-assets/velocity/branding/logo.svg',
     '/tenant-assets/velocity/branding/banner.jpg',
     NOW(), NOW()),

    ('a0000000-0000-0000-0000-000000000002',
     'taj',
     '/tenant-assets/taj/branding/logo.svg',
     '/tenant-assets/taj/branding/banner.jpg',
     NOW(), NOW());

-- ── Properties ───────────────────────────────────────────────
INSERT INTO properties (id, tenant_id, name, max_booking_rooms, max_guests_per_room, min_stay, max_stay, banner_image_url, created_at, updated_at)
VALUES
    -- Velocity properties
    ('b0000000-0000-0000-0000-000000000001',
     'a0000000-0000-0000-0000-000000000001',
     'Velocity Downtown', 5, 4, 1, 14,
     '/tenant-assets/velocity/downtown/branding/banner.jpg',
     NOW(), NOW()),

    ('b0000000-0000-0000-0000-000000000002',
     'a0000000-0000-0000-0000-000000000001',
     'Velocity Suburbs', 4, 3, 1, 10,
     '/tenant-assets/velocity/suburbs/branding/banner.jpg',
     NOW(), NOW()),

    ('b0000000-0000-0000-0000-000000000003',
     'a0000000-0000-0000-0000-000000000001',
     'Velocity Airport', 3, 2, 1, 7,
     '/tenant-assets/velocity/airport/branding/banner.jpg',
     NOW(), NOW()),

    -- Taj properties
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

-- ── Landing Page Configs ──────────────────────────────────────
INSERT INTO landing_page_configs (id, property_id, show_guests_option, show_rooms_option, show_acc_option, created_at, updated_at)
VALUES
    ('c0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001', TRUE,  TRUE,  FALSE, NOW(), NOW()),
    ('c0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000002', TRUE,  FALSE, FALSE, NOW(), NOW()),
    ('c0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000003', TRUE,  FALSE, TRUE,  NOW(), NOW()),
    ('c0000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000004', TRUE,  TRUE,  FALSE, NOW(), NOW()),
    ('c0000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000005', TRUE,  FALSE, TRUE,  NOW(), NOW()),
    ('c0000000-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000006', TRUE,  TRUE,  TRUE,  NOW(), NOW());

-- ── Guest Types ───────────────────────────────────────────────
INSERT INTO guest_types (id, property_id, name, min_age, max_age, created_at, updated_at)
VALUES
    -- Velocity Downtown
    ('d0000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000001', 'Child',   5,   17, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000001', 'Infant',  0,    4, NOW(), NOW()),
    -- Velocity Suburbs
    ('d0000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000002', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000002', 'Child',   5,   17, NOW(), NOW()),
    -- Velocity Airport
    ('d0000000-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000003', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000007', 'b0000000-0000-0000-0000-000000000003', 'Child',   2,   17, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000008', 'b0000000-0000-0000-0000-000000000003', 'Infant',  0,    1, NOW(), NOW()),
    -- Taj Downtown
    ('d0000000-0000-0000-0000-000000000009',  'b0000000-0000-0000-0000-000000000004', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000010',  'b0000000-0000-0000-0000-000000000004', 'Child',   2,   17, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000011',  'b0000000-0000-0000-0000-000000000004', 'Infant',  0,    1, NOW(), NOW()),
    -- Taj Airport
    ('d0000000-0000-0000-0000-000000000012',  'b0000000-0000-0000-0000-000000000005', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000013',  'b0000000-0000-0000-0000-000000000005', 'Child',   2,   17, NOW(), NOW()),
    -- Taj Beach
    ('d0000000-0000-0000-0000-000000000014',  'b0000000-0000-0000-0000-000000000006', 'Adult',  18, NULL, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000015',  'b0000000-0000-0000-0000-000000000006', 'Child',   5,   17, NOW(), NOW()),
    ('d0000000-0000-0000-0000-000000000016',  'b0000000-0000-0000-0000-000000000006', 'Infant',  0,    4, NOW(), NOW());

-- ── Bed Types ────────────────────────────────────────────────
-- Adding the actual INSERT statements for the referenced IDs
INSERT INTO bed_types (id, name, created_at, updated_at)
VALUES 
    ('e0000000-0000-0000-0000-000000000001', 'King', NOW(), NOW()),
    ('e0000000-0000-0000-0000-000000000002', 'Queen', NOW(), NOW()),
    ('e0000000-0000-0000-0000-000000000003', 'Twin', NOW(), NOW()),
    ('e0000000-0000-0000-0000-000000000004', 'Double', NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO room_types (id, property_id, bed_type_id, title, description, size_sqft, max_occupancy, images, created_at, updated_at)
VALUES
-- ── Velocity Downtown ────────────────────────────────────────
    ('f0000000-0000-0000-0000-000000000001',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000001',
     'Velocity Deluxe King',
     'Spacious king room with city views, premium bedding, and a large work desk.',
     450.00, 2,
     '[{"url":"/tenant-assets/velocity/downtown/rooms/king-1.jpg","alt":"Deluxe King Room"},
       {"url":"/tenant-assets/velocity/downtown/rooms/king-2.jpg","alt":"Deluxe King Bathroom"},
       {"url":"/tenant-assets/velocity/downtown/rooms/king-3.jpg","alt":"City View"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000002',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000002',
     'Velocity Standard Queen',
     'Comfortable queen room with modern decor and high-speed Wi-Fi.',
     320.00, 2,
     '[{"url":"/tenant-assets/velocity/downtown/rooms/queen-1.jpg","alt":"Standard Queen Room"},
       {"url":"/tenant-assets/velocity/downtown/rooms/queen-2.jpg","alt":"Queen Bathroom"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000003',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000001',
     'Velocity Deluxe Family King',
     'Extra-large room with a king bed, sofa bed, and connecting room option — perfect for families.',
     620.00, 4,
     '[{"url":"/tenant-assets/velocity/downtown/rooms/family-1.jpg","alt":"Family King Room"},
       {"url":"/tenant-assets/velocity/downtown/rooms/family-2.jpg","alt":"Family Room Lounge"},
       {"url":"/tenant-assets/velocity/downtown/rooms/family-3.jpg","alt":"Family Bathroom"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000004',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000003',
     'Velocity Twin Room',
     'Twin room with two single beds, ideal for colleagues or friends travelling together.',
     290.00, 2,
     '[{"url":"/tenant-assets/velocity/downtown/rooms/twin-1.jpg","alt":"Twin Room"},
       {"url":"/tenant-assets/velocity/downtown/rooms/twin-2.jpg","alt":"Twin Room Seating"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000005',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000001',
     'Velocity Executive Suite',
     'Premium suite with a separate living room, kitchenette, and panoramic city views.',
     780.00, 2,
     '[{"url":"/tenant-assets/velocity/downtown/rooms/suite-1.jpg","alt":"Executive Suite Living"},
       {"url":"/tenant-assets/velocity/downtown/rooms/suite-2.jpg","alt":"Executive Suite Bedroom"},
       {"url":"/tenant-assets/velocity/downtown/rooms/suite-3.jpg","alt":"Executive Suite Kitchenette"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000006',
     'b0000000-0000-0000-0000-000000000001',
     'e0000000-0000-0000-0000-000000000002',
     'Velocity Accessible Queen',
     'Fully accessible queen room with roll-in shower, lowered fixtures, and wide doorways.',
     380.00, 2,
     '[{"url":"/tenant-assets/velocity/downtown/rooms/accessible-1.jpg","alt":"Accessible Room"},
       {"url":"/tenant-assets/velocity/downtown/rooms/accessible-2.jpg","alt":"Accessible Bathroom"}]',
     NOW(), NOW()),

-- ── Velocity Suburbs ─────────────────────────────────────────
    ('f0000000-0000-0000-0000-000000000015',
     'b0000000-0000-0000-0000-000000000002',
     'e0000000-0000-0000-0000-000000000001',
     'Suburbs King Room',
     'Quiet king room surrounded by greenery, ideal for a relaxing retreat.',
     400.00, 2,
     '[{"url":"/tenant-assets/velocity/suburbs/rooms/king-1.jpg","alt":"Suburbs King Room"},
       {"url":"/tenant-assets/velocity/suburbs/rooms/king-2.jpg","alt":"Garden View"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000016',
     'b0000000-0000-0000-0000-000000000002',
     'e0000000-0000-0000-0000-000000000002',
     'Suburbs Queen Garden',
     'Charming queen room with a private garden patio and outdoor seating.',
     350.00, 2,
     '[{"url":"/tenant-assets/velocity/suburbs/rooms/queen-1.jpg","alt":"Queen Garden Room"},
       {"url":"/tenant-assets/velocity/suburbs/rooms/queen-2.jpg","alt":"Private Patio"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000017',
     'b0000000-0000-0000-0000-000000000002',
     'e0000000-0000-0000-0000-000000000003',
     'Suburbs Twin Bunk',
     'Fun twin-bunk room for kids and families, with dedicated play space.',
     330.00, 3,
     '[{"url":"/tenant-assets/velocity/suburbs/rooms/bunk-1.jpg","alt":"Twin Bunk Room"},
       {"url":"/tenant-assets/velocity/suburbs/rooms/bunk-2.jpg","alt":"Play Area"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000018',
     'b0000000-0000-0000-0000-000000000002',
     'e0000000-0000-0000-0000-000000000004',
     'Suburbs Double Studio',
     'Cosy studio double with kitchenette and weekly housekeeping, great for extended stays.',
     420.00, 2,
     '[{"url":"/tenant-assets/velocity/suburbs/rooms/studio-1.jpg","alt":"Double Studio"},
       {"url":"/tenant-assets/velocity/suburbs/rooms/studio-2.jpg","alt":"Studio Kitchenette"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000019',
     'b0000000-0000-0000-0000-000000000002',
     'e0000000-0000-0000-0000-000000000001',
     'Suburbs Family Suite',
     'Spacious family suite with two bedrooms, a shared lounge, and a kitchenette.',
     650.00, 4,
     '[{"url":"/tenant-assets/velocity/suburbs/rooms/family-1.jpg","alt":"Family Suite Lounge"},
       {"url":"/tenant-assets/velocity/suburbs/rooms/family-2.jpg","alt":"Family Suite Bedroom"}]',
     NOW(), NOW()),

-- ── Velocity Airport ─────────────────────────────────────────
    ('f0000000-0000-0000-0000-000000000020',
     'b0000000-0000-0000-0000-000000000003',
     'e0000000-0000-0000-0000-000000000001',
     'Transit King',
     'Soundproofed king room with express check-in, blackout curtains, and free shuttle.',
     380.00, 2,
     '[{"url":"/tenant-assets/velocity/airport/rooms/king-1.jpg","alt":"Transit King Room"},
       {"url":"/tenant-assets/velocity/airport/rooms/king-2.jpg","alt":"Transit King Bathroom"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000021',
     'b0000000-0000-0000-0000-000000000003',
     'e0000000-0000-0000-0000-000000000004',
     'Transit Double',
     'Compact double room with blackout blinds, quiet zone flooring, and 24hr room service.',
     280.00, 2,
     '[{"url":"/tenant-assets/velocity/airport/rooms/double-1.jpg","alt":"Transit Double Room"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000022',
     'b0000000-0000-0000-0000-000000000003',
     'e0000000-0000-0000-0000-000000000003',
     'Transit Twin',
     'Twin room great for two travellers sharing, with early departure breakfast option.',
     270.00, 2,
     '[{"url":"/tenant-assets/velocity/airport/rooms/twin-1.jpg","alt":"Transit Twin Room"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000023',
     'b0000000-0000-0000-0000-000000000003',
     'e0000000-0000-0000-0000-000000000001',
     'Business Lounge King',
     'Premium transit king with lounge access, work desk, and premium shower amenities.',
     460.00, 2,
     '[{"url":"/tenant-assets/velocity/airport/rooms/lounge-king-1.jpg","alt":"Business Lounge King"},
       {"url":"/tenant-assets/velocity/airport/rooms/lounge-king-2.jpg","alt":"Lounge Access"}]',
     NOW(), NOW()),

-- ── Taj Downtown ─────────────────────────────────────────────
    ('f0000000-0000-0000-0000-000000000008',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Executive King',
     'Elegant king room with floor-to-ceiling windows, city skyline views, and executive lounge access.',
     540.00, 2,
     '[{"url":"/tenant-assets/taj/downtown/rooms/king-1.jpg","alt":"Executive King Room"},
       {"url":"/tenant-assets/taj/downtown/rooms/king-2.jpg","alt":"Executive King Bathroom"},
       {"url":"/tenant-assets/taj/downtown/rooms/king-3.jpg","alt":"City Skyline View"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000009',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000002',
     'Taj Deluxe Queen',
     'Stylish queen room with modern decor, work desk, and premium bedding.',
     360.00, 2,
     '[{"url":"/tenant-assets/taj/downtown/rooms/queen-1.jpg","alt":"Deluxe Queen Room"},
       {"url":"/tenant-assets/taj/downtown/rooms/queen-2.jpg","alt":"Deluxe Queen Workspace"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000010',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000003',
     'Taj Twin Room',
     'Well-appointed twin room with two single beds, ideal for business travellers.',
     330.00, 2,
     '[{"url":"/tenant-assets/taj/downtown/rooms/twin-1.jpg","alt":"Twin Room"},
       {"url":"/tenant-assets/taj/downtown/rooms/twin-2.jpg","alt":"Twin Room Seating Area"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000024',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Presidential Suite',
     'The pinnacle of luxury — two-bedroom presidential suite with butler service and rooftop terrace.',
     1200.00, 4,
     '[{"url":"/tenant-assets/taj/downtown/rooms/presidential-1.jpg","alt":"Presidential Suite Living"},
       {"url":"/tenant-assets/taj/downtown/rooms/presidential-2.jpg","alt":"Presidential Suite Master"},
       {"url":"/tenant-assets/taj/downtown/rooms/presidential-3.jpg","alt":"Rooftop Terrace"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000025',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000002',
     'Taj Junior Suite Queen',
     'Refined junior suite with a queen bed, lounge area, and complimentary minibar.',
     520.00, 2,
     '[{"url":"/tenant-assets/taj/downtown/rooms/junior-1.jpg","alt":"Junior Suite Bedroom"},
       {"url":"/tenant-assets/taj/downtown/rooms/junior-2.jpg","alt":"Junior Suite Lounge"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000026',
     'b0000000-0000-0000-0000-000000000004',
     'e0000000-0000-0000-0000-000000000004',
     'Taj Heritage Double',
     'Classic double room with heritage decor, antique furnishings, and a bay window.',
     370.00, 2,
     '[{"url":"/tenant-assets/taj/downtown/rooms/heritage-1.jpg","alt":"Heritage Double Room"},
       {"url":"/tenant-assets/taj/downtown/rooms/heritage-2.jpg","alt":"Heritage Bay Window"}]',
     NOW(), NOW()),

-- ── Taj Airport ──────────────────────────────────────────────
    ('f0000000-0000-0000-0000-000000000011',
     'b0000000-0000-0000-0000-000000000005',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Airport King',
     'Soundproofed king room with blackout curtains and express check-in for transit guests.',
     410.00, 2,
     '[{"url":"/tenant-assets/taj/airport/rooms/king-1.jpg","alt":"Airport King Room"},
       {"url":"/tenant-assets/taj/airport/rooms/king-2.jpg","alt":"Airport King Bathroom"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000012',
     'b0000000-0000-0000-0000-000000000005',
     'e0000000-0000-0000-0000-000000000004',
     'Taj Airport Double',
     'Compact double room with complimentary shuttle and late checkout flexibility.',
     310.00, 2,
     '[{"url":"/tenant-assets/taj/airport/rooms/double-1.jpg","alt":"Airport Double Room"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000027',
     'b0000000-0000-0000-0000-000000000005',
     'e0000000-0000-0000-0000-000000000002',
     'Taj Airport Queen',
     'Comfortable queen room with noise isolation and complimentary airport transfer.',
     340.00, 2,
     '[{"url":"/tenant-assets/taj/airport/rooms/queen-1.jpg","alt":"Airport Queen Room"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000028',
     'b0000000-0000-0000-0000-000000000005',
     'e0000000-0000-0000-0000-000000000003',
     'Taj Airport Twin',
     'Twin room ideal for co-travellers with individual reading lamps and charging stations.',
     295.00, 2,
     '[{"url":"/tenant-assets/taj/airport/rooms/twin-1.jpg","alt":"Airport Twin Room"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000029',
     'b0000000-0000-0000-0000-000000000005',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Airport Business Suite',
     'Premium suite with lounge access, shower spa, and dedicated concierge for frequent flyers.',
     580.00, 2,
     '[{"url":"/tenant-assets/taj/airport/rooms/suite-1.jpg","alt":"Airport Business Suite"},
       {"url":"/tenant-assets/taj/airport/rooms/suite-2.jpg","alt":"Suite Lounge"}]',
     NOW(), NOW()),

-- ── Taj Beach Resort ─────────────────────────────────────────
    ('f0000000-0000-0000-0000-000000000013',
     'b0000000-0000-0000-0000-000000000006',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Oceanfront King Suite',
     'Premium beachfront suite with private terrace, plunge pool, and unobstructed ocean views.',
     700.00, 3,
     '[{"url":"/tenant-assets/taj/beach/rooms/suite-1.jpg","alt":"Oceanfront King Suite"},
       {"url":"/tenant-assets/taj/beach/rooms/suite-2.jpg","alt":"Private Terrace"},
       {"url":"/tenant-assets/taj/beach/rooms/suite-3.jpg","alt":"Plunge Pool View"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000014',
     'b0000000-0000-0000-0000-000000000006',
     'e0000000-0000-0000-0000-000000000002',
     'Taj Sea View Queen',
     'Airy queen room with panoramic sea views, tropical decor, and direct beach access.',
     430.00, 2,
     '[{"url":"/tenant-assets/taj/beach/rooms/queen-1.jpg","alt":"Sea View Queen Room"},
       {"url":"/tenant-assets/taj/beach/rooms/queen-2.jpg","alt":"Beach Access View"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000030',
     'b0000000-0000-0000-0000-000000000006',
     'e0000000-0000-0000-0000-000000000001',
     'Taj Beach Villa King',
     'Standalone beach villa with private garden, outdoor shower, and butler on call.',
     900.00, 3,
     '[{"url":"/tenant-assets/taj/beach/rooms/villa-1.jpg","alt":"Beach Villa Exterior"},
       {"url":"/tenant-assets/taj/beach/rooms/villa-2.jpg","alt":"Beach Villa Bedroom"},
       {"url":"/tenant-assets/taj/beach/rooms/villa-3.jpg","alt":"Private Garden"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000031',
     'b0000000-0000-0000-0000-000000000006',
     'e0000000-0000-0000-0000-000000000004',
     'Taj Lagoon Double',
     'Romantic double room overhanging the lagoon with glass floor panels and sunrise views.',
     550.00, 2,
     '[{"url":"/tenant-assets/taj/beach/rooms/lagoon-1.jpg","alt":"Lagoon Double Room"},
       {"url":"/tenant-assets/taj/beach/rooms/lagoon-2.jpg","alt":"Glass Floor Panel"},
       {"url":"/tenant-assets/taj/beach/rooms/lagoon-3.jpg","alt":"Sunrise View"}]',
     NOW(), NOW()),

    ('f0000000-0000-0000-0000-000000000032',
     'b0000000-0000-0000-0000-000000000006',
     'e0000000-0000-0000-0000-000000000002',
     'Taj Beach Garden Queen',
     'Tranquil queen room surrounded by lush tropical gardens with open-air bathroom.',
     390.00, 2,
     '[{"url":"/tenant-assets/taj/beach/rooms/garden-1.jpg","alt":"Garden Queen Room"},
       {"url":"/tenant-assets/taj/beach/rooms/garden-2.jpg","alt":"Open-Air Bathroom"}]',
     NOW(), NOW());

INSERT INTO room_rates (id, property_id, room_type_id, date, price, created_at, updated_at)
SELECT
    gen_random_uuid(),
    rt.property_id,
    rt.id,
    CURRENT_DATE + s.i,
    ROUND((rt.base_price * CASE
        WHEN EXTRACT(DOW FROM CURRENT_DATE + s.i) IN (5,6) THEN 1.25
        WHEN EXTRACT(DOW FROM CURRENT_DATE + s.i) = 0      THEN 1.10
        ELSE 1.00
    END)::numeric, 2),
    NOW(), NOW()
FROM (
    VALUES
--     -- Velocity Downtown
    ('f0000000-0000-0000-0000-000000000001'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,189.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000002'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,129.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000003'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,229.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000004'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,109.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000005'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,349.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000006'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,139.99::DECIMAL),
--     -- Velocity Suburbs
    ('f0000000-0000-0000-0000-000000000015'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID,149.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000016'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID,119.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000017'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID, 99.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000018'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID,139.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000019'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID,199.99::DECIMAL),
--     -- Velocity Airport
    ('f0000000-0000-0000-0000-000000000020'::UUID,'b0000000-0000-0000-0000-000000000003'::UUID,159.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000021'::UUID,'b0000000-0000-0000-0000-000000000003'::UUID,109.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000022'::UUID,'b0000000-0000-0000-0000-000000000003'::UUID, 99.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000023'::UUID,'b0000000-0000-0000-0000-000000000003'::UUID,219.99::DECIMAL),
--     -- Taj Downtown
    ('f0000000-0000-0000-0000-000000000008'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,269.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000009'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,169.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000010'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,149.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000024'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,699.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000025'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,319.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000026'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,179.99::DECIMAL),
--     -- Taj Airport
    ('f0000000-0000-0000-0000-000000000011'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,199.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000012'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,129.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000027'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,149.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000028'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,119.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000029'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,279.99::DECIMAL),
--     -- Taj Beach
    ('f0000000-0000-0000-0000-000000000013'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID,449.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000014'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID,299.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000030'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID,649.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000031'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID,389.99::DECIMAL),
    ('f0000000-0000-0000-0000-000000000032'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID,249.99::DECIMAL)
) AS rt(id, property_id, base_price)
CROSS JOIN generate_series(0, 89) AS s(i);
--
-- ── Room Inventory (next 90 days) ─────────────────────────────
INSERT INTO room_inventory (id, property_id, room_type_id, date, total_rooms, available_rooms, version, created_at, updated_at)
SELECT
    gen_random_uuid(),
    rt.property_id,
    rt.id,
    CURRENT_DATE + s.i,
    rt.total_rooms,
    GREATEST(0, rt.total_rooms - CASE
        WHEN EXTRACT(DOW FROM CURRENT_DATE + s.i) IN (5,6) THEN (rt.total_rooms * 0.6)::INT
        WHEN EXTRACT(DOW FROM CURRENT_DATE + s.i) = 0      THEN (rt.total_rooms * 0.4)::INT
        ELSE (rt.total_rooms * 0.2)::INT
    END),
    0, NOW(), NOW()
FROM (
    VALUES
--     -- Velocity Downtown
    ('f0000000-0000-0000-0000-000000000001'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,20),
    ('f0000000-0000-0000-0000-000000000002'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,30),
    ('f0000000-0000-0000-0000-000000000003'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,12),
    ('f0000000-0000-0000-0000-000000000004'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID,15),
    ('f0000000-0000-0000-0000-000000000005'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID, 6),
    ('f0000000-0000-0000-0000-000000000006'::UUID,'b0000000-0000-0000-0000-000000000001'::UUID, 8),
--     -- Velocity Suburbs
    ('f0000000-0000-0000-0000-000000000015'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID,18),
    ('f0000000-0000-0000-0000-000000000016'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID,12),
    ('f0000000-0000-0000-0000-000000000017'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID,10),
    ('f0000000-0000-0000-0000-000000000018'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID,14),
    ('f0000000-0000-0000-0000-000000000019'::UUID,'b0000000-0000-0000-0000-000000000002'::UUID, 6),
--     -- Velocity Airport
    ('f0000000-0000-0000-0000-000000000020'::UUID,'b0000000-0000-0000-0000-000000000003'::UUID,16),
    ('f0000000-0000-0000-0000-000000000021'::UUID,'b0000000-0000-0000-0000-000000000003'::UUID,24),
    ('f0000000-0000-0000-0000-000000000022'::UUID,'b0000000-0000-0000-0000-000000000003'::UUID,18),
    ('f0000000-0000-0000-0000-000000000023'::UUID,'b0000000-0000-0000-0000-000000000003'::UUID, 8),
--     -- Taj Downtown
    ('f0000000-0000-0000-0000-000000000008'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,12),
    ('f0000000-0000-0000-0000-000000000009'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,18),
    ('f0000000-0000-0000-0000-000000000010'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,14),
    ('f0000000-0000-0000-0000-000000000024'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID, 3),
    ('f0000000-0000-0000-0000-000000000025'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID, 8),
    ('f0000000-0000-0000-0000-000000000026'::UUID,'b0000000-0000-0000-0000-000000000004'::UUID,10),
--     -- Taj Airport
    ('f0000000-0000-0000-0000-000000000011'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,10),
    ('f0000000-0000-0000-0000-000000000012'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,22),
    ('f0000000-0000-0000-0000-000000000027'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,14),
    ('f0000000-0000-0000-0000-000000000028'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID,20),
    ('f0000000-0000-0000-0000-000000000029'::UUID,'b0000000-0000-0000-0000-000000000005'::UUID, 6),
--     -- Taj Beach
    ('f0000000-0000-0000-0000-000000000013'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID, 8),
    ('f0000000-0000-0000-0000-000000000014'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID,16),
    ('f0000000-0000-0000-0000-000000000030'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID, 5),
    ('f0000000-0000-0000-0000-000000000031'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID,10),
    ('f0000000-0000-0000-0000-000000000032'::UUID,'b0000000-0000-0000-0000-000000000006'::UUID,14)
) AS rt(id, property_id, total_rooms)
CROSS JOIN generate_series(0, 89) AS s(i);
--
-- ── Bookings ──────────────────────────────────────────────────
INSERT INTO bookings (id, property_id, room_type_id, check_in, check_out, total_price, status, created_at, updated_at)
VALUES
<<<<<<< HEAD
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

<<<<<<< HEAD
-- ── Packages ────────────────────────────────────────────────

INSERT INTO property_type_packages (id, property_id, name, description, offer_percentage, is_active, created_at, updated_at)
VALUES
    -- Downtown — property-wide
    ('aa000000-0000-0000-0000-000000000001',
     'b0000000-0000-0000-0000-000000000004',
     'Early Bird',
     'Book 30 days in advance and save on any room at Taj Downtown.',
     10.00, TRUE, NOW(), NOW()),

    ('aa000000-0000-0000-0000-000000000002',
     'b0000000-0000-0000-0000-000000000004',
     'Executive Weekend Escape',
     'Exclusive 15% off the Taj Executive King room on Friday and Saturday stays.',
     15.00, TRUE, NOW(), NOW()),

    --  taj -airport
    ('aa000000-0000-0000-0000-000000000003',
     'b0000000-0000-0000-0000-000000000005',
     'Senior Citizen Discount',
     'Flat 20% off for guests over 60 years age',
     20.00, TRUE, NOW(), NOW()),


    -- Beach — property-wide
    ('aa000000-0000-0000-0000-000000000004',
     'b0000000-0000-0000-0000-000000000006',
     'Long Stay Discount',
     'Stay 7 or more nights at Taj Beach Resort and get 25% off your entire booking.',
     25.00, TRUE, NOW(), NOW()),

    ('aa000000-0000-0000-0000-000000000005',
     'b0000000-0000-0000-0000-000000000006',
     'Sea View Weekend',
     'Book the Sea View Queen on weekends and enjoy 10% off.',
     10.00, TRUE, NOW(), NOW());

-- ── Room Type Packages ──────────────────────
INSERT INTO room_type_packages (id, room_type_id, name, description, offer_percentage, is_active, created_at, updated_at)
VALUES
    -- Taj Executive King (Downtown) - 15% off for Business Pro members
    ('ba000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000008', 
     'Business Pro Member Rate', 'Exclusive discount for registered business travellers.', 15.00, TRUE, NOW(), NOW()),
    
    -- Taj Oceanfront King Suite (Beach) - 20% Honeymoon Special
    ('ba000000-0000-0000-0000-000000000002', 'f0000000-0000-0000-0000-000000000013', 
     'Honeymoon Special', 'Includes sparkling wine and 20% off for newly-weds.', 20.00, TRUE, NOW(), NOW()),
     
    -- Taj Airport Double (Airport) - 10% Layover Deal
    ('ba000000-0000-0000-0000-000000000003', 'f0000000-0000-0000-0000-000000000012', 
     'Quick Layover', 'Special discounted rate for stays under 12 hours.', 10.00, TRUE, NOW(), NOW());
-- ── Filters ─────────────────────────────────
INSERT INTO filters (id, filter_name, type, created_at, updated_at)
VALUES
    ('f0000000-0000-0000-0000-000000000001', 'Bed Type',    'single_select', NOW(), NOW()),
    ('f0000000-0000-0000-0000-000000000002', 'Amenities',   'multi_select',  NOW(), NOW()),
    ('f0000000-0000-0000-0000-000000000003', 'Room Size',   'range',         NOW(), NOW()),
    ('f0000000-0000-0000-0000-000000000004', 'Price Range', 'range',         NOW(), NOW()),
    ('f0000000-0000-0000-0000-000000000005', 'Occupancy',   'range', NOW(), NOW());

-- ── Filter Options───────────────────────────
INSERT INTO filter_options (id, filter_id, name, created_at, updated_at)
VALUES
    -- Bed Type options
    ('ff000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000001', 'King',    NOW(), NOW()),
    ('ff000000-0000-0000-0000-000000000002', 'f0000000-0000-0000-0000-000000000001', 'Queen',   NOW(), NOW()),
    ('ff000000-0000-0000-0000-000000000003', 'f0000000-0000-0000-0000-000000000001', 'Twin',    NOW(), NOW()),
    ('ff000000-0000-0000-0000-000000000004', 'f0000000-0000-0000-0000-000000000001', 'Double',  NOW(), NOW());

-- ── Property Type Filters───────────────────
INSERT INTO property_type_filters (id, property_id, filter_id, created_at, updated_at)
VALUES
    -- Downtown
    ('af000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000004', 'f0000000-0000-0000-0000-000000000001', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000004', 'f0000000-0000-0000-0000-000000000002', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000004', 'f0000000-0000-0000-0000-000000000003', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000004', 'f0000000-0000-0000-0000-000000000004', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000004', 'f0000000-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Airport
    ('af000000-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000005', 'f0000000-0000-0000-0000-000000000001', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000007', 'b0000000-0000-0000-0000-000000000005', 'f0000000-0000-0000-0000-000000000002', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000009', 'b0000000-0000-0000-0000-000000000005', 'f0000000-0000-0000-0000-000000000004', NOW(), NOW()),
    -- Beach
    ('af000000-0000-0000-0000-000000000011', 'b0000000-0000-0000-0000-000000000006', 'f0000000-0000-0000-0000-000000000001', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000012', 'b0000000-0000-0000-0000-000000000006', 'f0000000-0000-0000-0000-000000000002', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000013', 'b0000000-0000-0000-0000-000000000006', 'f0000000-0000-0000-0000-000000000003', NOW(), NOW()),
    ('af000000-0000-0000-0000-000000000014', 'b0000000-0000-0000-0000-000000000006', 'f0000000-0000-0000-0000-000000000004', NOW(), NOW());

-- ── Sort Options  ────────────────────────────
INSERT INTO sort_options (id, name, default_order, created_at, updated_at)
VALUES
    ('e0000000-0000-0000-0000-000000000001', 'price', 'asc',  NOW(), NOW()),
    ('e0000000-0000-0000-0000-000000000002', 'size_sqft', 'asc', NOW(), NOW()),
    ('e0000000-0000-0000-0000-000000000003', 'max_occupancy', 'desc', NOW(), NOW());

-- ── Property Type Sort ──────────────────────
INSERT INTO property_type_sort (id, property_id, sort_options_id, created_at, updated_at)
VALUES
    -- Downtown
    ('ae000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000004', 'e0000000-0000-0000-0000-000000000001', NOW(), NOW()),
    ('ae000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000004', 'e0000000-0000-0000-0000-000000000002', NOW(), NOW()),
    ('ae000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000004', 'e0000000-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Airport
    ('ae000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000005', 'e0000000-0000-0000-0000-000000000001', NOW(), NOW()),
    ('ae000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000005', 'e0000000-0000-0000-0000-000000000002', NOW(), NOW()),
    ('ae000000-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000005', 'e0000000-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Beach
    ('ae000000-0000-0000-0000-000000000007', 'b0000000-0000-0000-0000-000000000006', 'e0000000-0000-0000-0000-000000000001', NOW(), NOW()),
    ('ae000000-0000-0000-0000-000000000008', 'b0000000-0000-0000-0000-000000000006', 'e0000000-0000-0000-0000-000000000002', NOW(), NOW());
=======
-- offers (all packages migrated here)
INSERT INTO offers (id, name, description, offer_percentage, is_active, is_promocode, created_at, updated_at)
VALUES
    ('of000000-0000-0000-0000-000000000001', 'Early Bird',              'Book 30 days in advance and save on any room at Taj Downtown.',              10.00, TRUE, FALSE, NOW(), NOW()),
    ('of000000-0000-0000-0000-000000000002', 'Executive Weekend Escape','Exclusive 15% off the Taj Executive King room on Friday and Saturday stays.',15.00, TRUE, FALSE, NOW(), NOW()),
    ('of000000-0000-0000-0000-000000000003', 'Senior Citizen Discount', 'Flat 20% off for guests over 60 years age.',                                 20.00, TRUE, FALSE, NOW(), NOW()),
    ('of000000-0000-0000-0000-000000000004', 'Long Stay Discount',      'Stay 7 or more nights at Taj Beach Resort and get 25% off.',                 25.00, TRUE, FALSE, NOW(), NOW()),
    ('of000000-0000-0000-0000-000000000005', 'Sea View Weekend',        'Book the Sea View Queen on weekends and enjoy 10% off.',                     10.00, TRUE, FALSE, NOW(), NOW()),
    ('of000000-0000-0000-0000-000000000006', 'Business Pro Member Rate','Exclusive discount for registered business travellers.',                     15.00, TRUE, FALSE, NOW(), NOW()),
    ('of000000-0000-0000-0000-000000000007', 'Honeymoon Special',       'Includes sparkling wine and 20% off for newly-weds.',                        20.00, TRUE, FALSE, NOW(), NOW()),
    ('of000000-0000-0000-0000-000000000008', 'Quick Layover',           'Special discounted rate for stays under 12 hours.',                          10.00, TRUE, FALSE, NOW(), NOW()),
    -- one promocode offer to verify it is excluded from display price
    ('of000000-0000-0000-0000-000000000009', 'WELCOME20',               'New user promo code for 20% off.',                                           20.00, TRUE, TRUE,  NOW(), NOW());
-- property_offers (property-wide offers)
INSERT INTO property_offers (id, property_id, offer_id, created_at, updated_at)
VALUES
    ('po000000-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000004', 'of000000-0000-0000-0000-000000000001', NOW(), NOW()),
    ('po000000-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000004', 'of000000-0000-0000-0000-000000000002', NOW(), NOW()),
    ('po000000-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000005', 'of000000-0000-0000-0000-000000000003', NOW(), NOW()),
    ('po000000-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000006', 'of000000-0000-0000-0000-000000000004', NOW(), NOW()),
    ('po000000-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000006', 'of000000-0000-0000-0000-000000000005', NOW(), NOW()),
    -- attach promocode to downtown to verify it does NOT affect display price
    ('po000000-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000004', 'of000000-0000-0000-0000-000000000009', NOW(), NOW());

-- room_type_offers (room-type specific offers)
INSERT INTO room_type_offers (id, room_type_id, offer_id, created_at, updated_at)
VALUES
    ('ro000000-0000-0000-0000-000000000001', 'f0000000-0000-0000-0000-000000000008', 'of000000-0000-0000-0000-000000000006', NOW(), NOW()),
    ('ro000000-0000-0000-0000-000000000002', 'f0000000-0000-0000-0000-000000000013', 'of000000-0000-0000-0000-000000000007', NOW(), NOW()),
    ('ro000000-0000-0000-0000-000000000003', 'f0000000-0000-0000-0000-000000000012', 'of000000-0000-0000-0000-000000000008', NOW(), NOW());
```


-- ── Filters ─────────────────────────────────
=======
--     -- Velocity Downtown
    ('b9000000-0000-0000-0000-000000000001','b0000000-0000-0000-0000-000000000001','f0000000-0000-0000-0000-000000000001',CURRENT_DATE+3, CURRENT_DATE+6,  569.97,'CONFIRMED',NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000002','b0000000-0000-0000-0000-000000000001','f0000000-0000-0000-0000-000000000002',CURRENT_DATE+5, CURRENT_DATE+8,  389.97,'CONFIRMED',NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000003','b0000000-0000-0000-0000-000000000001','f0000000-0000-0000-0000-000000000005',CURRENT_DATE+10,CURRENT_DATE+13,1049.97,'CONFIRMED',NOW(),NOW()),
--     -- Velocity Suburbs
    ('b9000000-0000-0000-0000-000000000004','b0000000-0000-0000-0000-000000000002','f0000000-0000-0000-0000-000000000015',CURRENT_DATE+2, CURRENT_DATE+5,  449.97,'CONFIRMED',NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000005','b0000000-0000-0000-0000-000000000002','f0000000-0000-0000-0000-000000000019',CURRENT_DATE+7, CURRENT_DATE+14,1399.93,'PENDING',  NOW(),NOW()),
--     -- Velocity Airport
    ('b9000000-0000-0000-0000-000000000006','b0000000-0000-0000-0000-000000000003','f0000000-0000-0000-0000-000000000020',CURRENT_DATE+1, CURRENT_DATE+3,  319.98,'CONFIRMED',NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000007','b0000000-0000-0000-0000-000000000003','f0000000-0000-0000-0000-000000000021',CURRENT_DATE+4, CURRENT_DATE+6,  219.98,'PENDING',  NOW(),NOW()),
--     -- Taj Downtown
    ('b9000000-0000-0000-0000-000000000008','b0000000-0000-0000-0000-000000000004','f0000000-0000-0000-0000-000000000008',CURRENT_DATE+3, CURRENT_DATE+6,  809.97,'CONFIRMED',NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000009','b0000000-0000-0000-0000-000000000004','f0000000-0000-0000-0000-000000000009',CURRENT_DATE+8, CURRENT_DATE+11, 509.97,'CONFIRMED',NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000010','b0000000-0000-0000-0000-000000000004','f0000000-0000-0000-0000-000000000024',CURRENT_DATE+20,CURRENT_DATE+24,2799.96,'CONFIRMED',NOW(),NOW()),
--     -- Taj Airport
    ('b9000000-0000-0000-0000-000000000011','b0000000-0000-0000-0000-000000000005','f0000000-0000-0000-0000-000000000011',CURRENT_DATE+1, CURRENT_DATE+3,  399.98,'PENDING',  NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000012','b0000000-0000-0000-0000-000000000005','f0000000-0000-0000-0000-000000000029',CURRENT_DATE+6, CURRENT_DATE+8,  559.98,'CONFIRMED',NOW(),NOW()),
--     -- Taj Beach
    ('b9000000-0000-0000-0000-000000000013','b0000000-0000-0000-0000-000000000006','f0000000-0000-0000-0000-000000000013',CURRENT_DATE+12,CURRENT_DATE+19,3149.93,'CONFIRMED',NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000014','b0000000-0000-0000-0000-000000000006','f0000000-0000-0000-0000-000000000030',CURRENT_DATE+5, CURRENT_DATE+9, 2599.96,'CONFIRMED',NOW(),NOW()),
    ('b9000000-0000-0000-0000-000000000015','b0000000-0000-0000-0000-000000000006','f0000000-0000-0000-0000-000000000014',CURRENT_DATE+4, CURRENT_DATE+7,  899.97,'CANCELLED', NOW(),NOW());
-- ── Offers 
INSERT INTO offers (id, name, description, offer_percentage, is_active, is_promocode, created_at, updated_at)
VALUES
--     -- ── Regular Deals (shown in Deals & Packages) ──────────
    ('0f000000-0000-0000-0000-000000000001',
     'Early Bird',
     'Book 7 days in advance and save 10% on your stay.',
     10.00, TRUE, FALSE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000002',
     'Long Weekend Deal',
     'Stay over the long weekend and enjoy 15% off your entire booking.',
     15.00, TRUE, FALSE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000003',
     'Senior Citizen Discount',
     'Exclusive 20% discount for guests aged 60 and above. Valid ID required.',
     20.00, TRUE, FALSE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000006',
     'Executive Weekend Escape',
     'Exclusive 15% off for guests checking in on Friday or Saturday.',
     15.00, TRUE, FALSE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000007',
     'Business Pro Member Rate',
     'Exclusive discount for registered corporate business travellers.',
     15.00, TRUE, FALSE, NOW(), NOW()),
--
-- Corrected invalid UUID prefix(es): of000000- -> 0f000000-
    ('0f000000-0000-0000-0000-000000000008',
     'Long Stay Discount',
     'Stay 7 or more nights and get 25% off your total booking.',
     25.00, TRUE, FALSE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000009',
     'Honeymoon Special',
     'Celebrate love with sparkling wine on arrival and 20% off for newly-weds.',
     20.00, TRUE, FALSE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000010',
     'Quick Layover Rate',
     'Special discounted rate for transit guests with stays under 12 hours.',
     10.00, TRUE, FALSE, NOW(), NOW()),


    ('0f000000-0000-0000-0000-000000000013',
     'Family Fun Package',
     'Book a family room and save 12% — kids meals included on request.',
     12.00, TRUE, FALSE, NOW(), NOW()),


    ('0f000000-0000-0000-0000-000000000014',
     'Garden Retreat Offer',
     'Unwind in nature — 10% off all garden-view rooms in the suburbs.',
     10.00, TRUE, FALSE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000015',
     'Beach Bliss Deal',
     'Save 18% on beachfront villas and suites for stays of 4 nights or more.',
     18.00, TRUE, FALSE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000016',
     'Winter Warmer',
     'Warm up your stay — 12% off during the cooler months.',
     12.00, TRUE, FALSE, NOW(), NOW()),

--     -- ── Promo Codes ─────────────────
    ('0f000000-0000-0000-0000-000000000004',
     'SUMMER25',
     'Summer special! Enjoy 25% off your entire stay.',
     25.00, TRUE, TRUE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000005',
     'WELCOME10',
     'Welcome offer for first-time guests — 10% off any room.',
     10.00, TRUE, TRUE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000011',
     'TAJVIP20',
     'VIP exclusive! 20% off for loyal Taj guests.',
     20.00, TRUE, TRUE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000012',
     'BEACH15',
     'Exclusive beach resort promo — 15% off at Taj Beach Resort.',
     15.00, TRUE, TRUE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000017',
     'VELOCITY20',
     'Special Velocity loyalty code — 20% off any Velocity property.',
     20.00, TRUE, TRUE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000018',
     'MONSOON30',
     'Monsoon madness! 30% off during the rainy season.',
     30.00, TRUE, TRUE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000019',
     'AIRPORT10',
     '10% off for all airport hotel bookings. Show your boarding pass.',
     10.00, TRUE, TRUE, NOW(), NOW()),

    ('0f000000-0000-0000-0000-000000000020',
     'NEWYR25',
     'New Year special — 25% off stays over the new year period.',
     25.00, TRUE, TRUE, NOW(), NOW());



-- ── Property Offers ───────────────────────────────────────────

INSERT INTO property_offers (id, property_id, offer_id, created_at, updated_at)
VALUES
--     -- Velocity Downtown

    ('a9000000-0000-0000-0000-000000000001','b0000000-0000-0000-0000-000000000001','0f000000-0000-0000-0000-000000000001',NOW(),NOW()),

    ('a9000000-0000-0000-0000-000000000002','b0000000-0000-0000-0000-000000000001','0f000000-0000-0000-0000-000000000002',NOW(),NOW()),

    ('a9000000-0000-0000-0000-000000000003','b0000000-0000-0000-0000-000000000001','0f000000-0000-0000-0000-000000000016',NOW(),NOW()),
--     -- Velocity Downtown promo codes
    ('a9000000-0000-0000-0000-000000000004','b0000000-0000-0000-0000-000000000001','0f000000-0000-0000-0000-000000000004',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000005','b0000000-0000-0000-0000-000000000001','0f000000-0000-0000-0000-000000000005',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000006','b0000000-0000-0000-0000-000000000001','0f000000-0000-0000-0000-000000000017',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000007','b0000000-0000-0000-0000-000000000001','0f000000-0000-0000-0000-000000000018',NOW(),NOW()),


--     -- Velocity Suburbs
    ('a9000000-0000-0000-0000-000000000008','b0000000-0000-0000-0000-000000000002','0f000000-0000-0000-0000-000000000014',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000009','b0000000-0000-0000-0000-000000000002','0f000000-0000-0000-0000-000000000016',NOW(),NOW()),

--     -- Velocity Suburbs promo codes
    ('a9000000-0000-0000-0000-000000000010','b0000000-0000-0000-0000-000000000002','0f000000-0000-0000-0000-000000000017',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000011','b0000000-0000-0000-0000-000000000002','0f000000-0000-0000-0000-000000000018',NOW(),NOW()),


--     -- Velocity Airport
    ('a9000000-0000-0000-0000-000000000012','b0000000-0000-0000-0000-000000000003','0f000000-0000-0000-0000-000000000010',NOW(),NOW()),

--     -- Velocity Airport promo codes
    ('a9000000-0000-0000-0000-000000000013','b0000000-0000-0000-0000-000000000003','0f000000-0000-0000-0000-000000000019',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000014','b0000000-0000-0000-0000-000000000003','0f000000-0000-0000-0000-000000000017',NOW(),NOW()),


--     -- Taj Downtown
    ('a9000000-0000-0000-0000-000000000015','b0000000-0000-0000-0000-000000000004','0f000000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000016','b0000000-0000-0000-0000-000000000004','0f000000-0000-0000-0000-000000000006',NOW(),NOW()),


--     -- Taj Downtown promo codes
    ('a9000000-0000-0000-0000-000000000017','b0000000-0000-0000-0000-000000000004','0f000000-0000-0000-0000-000000000011',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000018','b0000000-0000-0000-0000-000000000004','0f000000-0000-0000-0000-000000000020',NOW(),NOW()),

--     -- Taj Airport
    ('a9000000-0000-0000-0000-000000000019','b0000000-0000-0000-0000-000000000005','0f000000-0000-0000-0000-000000000010',NOW(),NOW()),

--     -- Taj Airport promo codes
    ('a9000000-0000-0000-0000-000000000020','b0000000-0000-0000-0000-000000000005','0f000000-0000-0000-0000-000000000011',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000021','b0000000-0000-0000-0000-000000000005','0f000000-0000-0000-0000-000000000019',NOW(),NOW()),

--     -- Taj Beach
    ('a9000000-0000-0000-0000-000000000022','b0000000-0000-0000-0000-000000000006','0f000000-0000-0000-0000-000000000008',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000023','b0000000-0000-0000-0000-000000000006','0f000000-0000-0000-0000-000000000015',NOW(),NOW()),


--     -- Taj Beach promo codes
    ('a9000000-0000-0000-0000-000000000024','b0000000-0000-0000-0000-000000000006','0f000000-0000-0000-0000-000000000012',NOW(),NOW()),
    ('a9000000-0000-0000-0000-000000000025','b0000000-0000-0000-0000-000000000006','0f000000-0000-0000-0000-000000000020',NOW(),NOW());


--
-- ── Room Type Offers ──────────────────────────────────────────
-- Links offers to specific room types only
INSERT INTO room_type_offers (id, room_type_id, offer_id, created_at, updated_at)
VALUES
--     -- Velocity Deluxe King → Senior Citizen Discount
    ('a9100000-0000-0000-0000-000000000001','f0000000-0000-0000-0000-000000000001','0f000000-0000-0000-0000-000000000003',NOW(),NOW()),

--     -- Velocity Deluxe Family King → Family Fun Package
    ('a9100000-0000-0000-0000-000000000002','f0000000-0000-0000-0000-000000000003','0f000000-0000-0000-0000-000000000013',NOW(),NOW()),

--     -- Velocity Executive Suite → Long Weekend Deal
    ('a9100000-0000-0000-0000-000000000003','f0000000-0000-0000-0000-000000000005','0f000000-0000-0000-0000-000000000002',NOW(),NOW()),

--     -- Velocity Suburbs Family Suite → Family Fun Package
    ('a9100000-0000-0000-0000-000000000004','f0000000-0000-0000-0000-000000000019','0f000000-0000-0000-0000-000000000013',NOW(),NOW()),

--     -- Velocity Airport Business Lounge King → Early Bird
    ('a9100000-0000-0000-0000-000000000005','f0000000-0000-0000-0000-000000000023','0f000000-0000-0000-0000-000000000001',NOW(),NOW()),

--     -- Taj Executive King → Business Pro Member Rate
    ('a9100000-0000-0000-0000-000000000006','f0000000-0000-0000-0000-000000000008','0f000000-0000-0000-0000-000000000007',NOW(),NOW()),

--     -- Taj Presidential Suite → Long Weekend Deal
    ('a9100000-0000-0000-0000-000000000007','f0000000-0000-0000-0000-000000000024','0f000000-0000-0000-0000-000000000002',NOW(),NOW()),

--     -- Taj Presidential Suite → Senior Citizen
    ('a9100000-0000-0000-0000-000000000008','f0000000-0000-0000-0000-000000000024','0f000000-0000-0000-0000-000000000003',NOW(),NOW()),

--     -- Taj Junior Suite Queen → Early Bird
    ('a9100000-0000-0000-0000-000000000009','f0000000-0000-0000-0000-000000000025','0f000000-0000-0000-0000-000000000001',NOW(),NOW()),

--     -- Taj Airport Business Suite → Business Pro
    ('a9100000-0000-0000-0000-000000000010','f0000000-0000-0000-0000-000000000029','0f000000-0000-0000-0000-000000000007',NOW(),NOW()),

--     -- Taj Oceanfront King Suite → Honeymoon Special
    ('a9100000-0000-0000-0000-000000000011','f0000000-0000-0000-0000-000000000013','0f000000-0000-0000-0000-000000000009',NOW(),NOW()),

--     -- Taj Beach Villa King → Honeymoon Special + Long Stay
    ('a9100000-0000-0000-0000-000000000012','f0000000-0000-0000-0000-000000000030','0f000000-0000-0000-0000-000000000009',NOW(),NOW()),
    ('a9100000-0000-0000-0000-000000000013','f0000000-0000-0000-0000-000000000030','0f000000-0000-0000-0000-000000000008',NOW(),NOW()),

--     -- Taj Lagoon Double → Honeymoon Special
    ('a9100000-0000-0000-0000-000000000014','f0000000-0000-0000-0000-000000000031','0f000000-0000-0000-0000-000000000009',NOW(),NOW());
--


-- ── Filters ───────────────────────────────────────────────────
>>>>>>> origin/feature/velibe-32-entity-jpa
INSERT INTO filters (id, filter_name, type, created_at, updated_at)
VALUES
    ('f1000000-0000-0000-0000-000000000001', 'Bed Type',    'single_select', NOW(), NOW()),
    ('f1000000-0000-0000-0000-000000000002', 'Amenities',   'multi_select',  NOW(), NOW()),
    ('f1000000-0000-0000-0000-000000000003', 'Room Size',   'range',         NOW(), NOW()),
    ('f1000000-0000-0000-0000-000000000004', 'Price Range', 'range',         NOW(), NOW()),
    ('f1000000-0000-0000-0000-000000000005', 'Occupancy',   'range',         NOW(), NOW());
--


-- ── Filter Options ────────────────────────────────────────────
INSERT INTO filter_options (id, filter_id, name, created_at, updated_at)
VALUES
    ('f2000000-0000-0000-0000-000000000001', 'f1000000-0000-0000-0000-000000000001', 'King',   NOW(), NOW()),
    ('f2000000-0000-0000-0000-000000000002', 'f1000000-0000-0000-0000-000000000001', 'Queen',  NOW(), NOW()),
    ('f2000000-0000-0000-0000-000000000003', 'f1000000-0000-0000-0000-000000000001', 'Twin',   NOW(), NOW()),
    ('f2000000-0000-0000-0000-000000000004', 'f1000000-0000-0000-0000-000000000001', 'Double', NOW(), NOW());
--
-- ── Property Type Filters ─────────────────────────────────────
INSERT INTO property_type_filters (id, property_id, filter_id, created_at, updated_at)
VALUES
--     -- Velocity Downtown
    ('a9200000-0000-0000-0000-000000000001','b0000000-0000-0000-0000-000000000001','f1000000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000002','b0000000-0000-0000-0000-000000000001','f1000000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000003','b0000000-0000-0000-0000-000000000001','f1000000-0000-0000-0000-000000000003',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000004','b0000000-0000-0000-0000-000000000001','f1000000-0000-0000-0000-000000000004',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000005','b0000000-0000-0000-0000-000000000001','f1000000-0000-0000-0000-000000000005',NOW(),NOW()),

--     -- Velocity Suburbs
    ('a9200000-0000-0000-0000-000000000006','b0000000-0000-0000-0000-000000000002','f1000000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000007','b0000000-0000-0000-0000-000000000002','f1000000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000008','b0000000-0000-0000-0000-000000000002','f1000000-0000-0000-0000-000000000004',NOW(),NOW()),

--     -- Velocity Airport
    ('a9200000-0000-0000-0000-000000000009','b0000000-0000-0000-0000-000000000003','f1000000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000010','b0000000-0000-0000-0000-000000000003','f1000000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000011','b0000000-0000-0000-0000-000000000003','f1000000-0000-0000-0000-000000000004',NOW(),NOW()),

--     -- Taj Downtown
    ('a9200000-0000-0000-0000-000000000012','b0000000-0000-0000-0000-000000000004','f1000000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000013','b0000000-0000-0000-0000-000000000004','f1000000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000014','b0000000-0000-0000-0000-000000000004','f1000000-0000-0000-0000-000000000003',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000015','b0000000-0000-0000-0000-000000000004','f1000000-0000-0000-0000-000000000004',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000016','b0000000-0000-0000-0000-000000000004','f1000000-0000-0000-0000-000000000005',NOW(),NOW()),


--     -- Taj Airport
    ('a9200000-0000-0000-0000-000000000017','b0000000-0000-0000-0000-000000000005','f1000000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000018','b0000000-0000-0000-0000-000000000005','f1000000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000019','b0000000-0000-0000-0000-000000000005','f1000000-0000-0000-0000-000000000004',NOW(),NOW()),

--     -- Taj Beach
    ('a9200000-0000-0000-0000-000000000020','b0000000-0000-0000-0000-000000000006','f1000000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000021','b0000000-0000-0000-0000-000000000006','f1000000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000022','b0000000-0000-0000-0000-000000000006','f1000000-0000-0000-0000-000000000003',NOW(),NOW()),
    ('a9200000-0000-0000-0000-000000000023','b0000000-0000-0000-0000-000000000006','f1000000-0000-0000-0000-000000000004',NOW(),NOW());


--
-- ── Sort Options ──────────────────────────────────────────────
INSERT INTO sort_options (id, name, default_order, created_at, updated_at)
VALUES
    ('a9300000-0000-0000-0000-000000000001', 'price',         'asc',  NOW(), NOW()),
    ('a9300000-0000-0000-0000-000000000002', 'size_sqft',     'asc',  NOW(), NOW()),
    ('a9300000-0000-0000-0000-000000000003', 'max_occupancy', 'desc', NOW(), NOW());


--
-- ── Property Type Sort ────────────────────────────────────────
INSERT INTO property_type_sort (id, property_id, sort_options_id, created_at, updated_at)
VALUES
--     -- Velocity Downtown

    ('a9400000-0000-0000-0000-000000000001','b0000000-0000-0000-0000-000000000001','a9300000-0000-0000-0000-000000000001',NOW(),NOW()),

    ('a9400000-0000-0000-0000-000000000002','b0000000-0000-0000-0000-000000000001','a9300000-0000-0000-0000-000000000002',NOW(),NOW()),

    ('a9400000-0000-0000-0000-000000000003','b0000000-0000-0000-0000-000000000001','a9300000-0000-0000-0000-000000000003',NOW(),NOW()),
--     -- Velocity Suburbs
    ('a9400000-0000-0000-0000-000000000004','b0000000-0000-0000-0000-000000000002','a9300000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000005','b0000000-0000-0000-0000-000000000002','a9300000-0000-0000-0000-000000000002',NOW(),NOW()),

--     -- Velocity Airport
    ('a9400000-0000-0000-0000-000000000006','b0000000-0000-0000-0000-000000000003','a9300000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000007','b0000000-0000-0000-0000-000000000003','a9300000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000008','b0000000-0000-0000-0000-000000000003','a9300000-0000-0000-0000-000000000003',NOW(),NOW()),
--     -- Taj Downtown
    ('a9400000-0000-0000-0000-000000000009','b0000000-0000-0000-0000-000000000004','a9300000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000010','b0000000-0000-0000-0000-000000000004','a9300000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000011','b0000000-0000-0000-0000-000000000004','a9300000-0000-0000-0000-000000000003',NOW(),NOW()),

--     -- Taj Airport
    ('a9400000-0000-0000-0000-000000000012','b0000000-0000-0000-0000-000000000005','a9300000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000013','b0000000-0000-0000-0000-000000000005','a9300000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000014','b0000000-0000-0000-0000-000000000005','a9300000-0000-0000-0000-000000000003',NOW(),NOW()),

--     -- Taj Beach
    ('a9400000-0000-0000-0000-000000000015','b0000000-0000-0000-0000-000000000006','a9300000-0000-0000-0000-000000000001',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000016','b0000000-0000-0000-0000-000000000006','a9300000-0000-0000-0000-000000000002',NOW(),NOW()),
    ('a9400000-0000-0000-0000-000000000017','b0000000-0000-0000-0000-000000000006','a9300000-0000-0000-0000-000000000003',NOW(),NOW());
--
--

-- Amenities ---------------------------------------------------
INSERT INTO amenities (id, property_id, label, created_at, updated_at)
VALUES
    -- Velocity Downtown
    ('a0000001-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000001', 'Free Wi-Fi',         NOW(), NOW()),
    ('a0000001-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000001', 'Air Conditioning',   NOW(), NOW()),
    ('a0000001-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000001', 'Flat-screen TV',     NOW(), NOW()),
    ('a0000001-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000001', 'Room Service',       NOW(), NOW()),
    ('a0000001-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000001', 'City View',          NOW(), NOW()),
    ('a0000001-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000001', 'Mini Bar',           NOW(), NOW()),
    ('a0000001-0000-0000-0000-000000000007', 'b0000000-0000-0000-0000-000000000001', 'Safe',               NOW(), NOW()),
    -- Velocity Suburbs
    ('a0000002-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000002', 'Free Wi-Fi',         NOW(), NOW()),
    ('a0000002-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000002', 'Air Conditioning',   NOW(), NOW()),
    ('a0000002-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000002', 'Garden View',        NOW(), NOW()),
    ('a0000002-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000002', 'Kitchenette',        NOW(), NOW()),
    ('a0000002-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000002', 'Free Parking',       NOW(), NOW()),
    -- Velocity Airport
    ('a0000003-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000003', 'Free Wi-Fi',         NOW(), NOW()),
    ('a0000003-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000003', 'Airport Shuttle',    NOW(), NOW()),
    ('a0000003-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000003', 'Soundproof Rooms',   NOW(), NOW()),
    ('a0000003-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000003', '24hr Front Desk',    NOW(), NOW()),
    ('a0000003-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000003', 'Blackout Curtains',  NOW(), NOW()),
    -- Taj Downtown
    ('a0000004-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000004', 'Free Wi-Fi',         NOW(), NOW()),
    ('a0000004-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000004', 'Air Conditioning',   NOW(), NOW()),
    ('a0000004-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000004', 'Flat-screen TV',     NOW(), NOW()),
    ('a0000004-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000004', 'Executive Lounge',   NOW(), NOW()),
    ('a0000004-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000004', 'Room Service',       NOW(), NOW()),
    ('a0000004-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000004', 'City View',          NOW(), NOW()),
    ('a0000004-0000-0000-0000-000000000007', 'b0000000-0000-0000-0000-000000000004', 'Butler Service',     NOW(), NOW()),
    -- Taj Airport
    ('a0000005-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000005', 'Free Wi-Fi',         NOW(), NOW()),
    ('a0000005-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000005', 'Airport Shuttle',    NOW(), NOW()),
    ('a0000005-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000005', 'Air Conditioning',   NOW(), NOW()),
    ('a0000005-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000005', 'Soundproof Rooms',   NOW(), NOW()),
    ('a0000005-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000005', '24hr Front Desk',    NOW(), NOW()),
    -- Taj Beach
    ('a0000006-0000-0000-0000-000000000001', 'b0000000-0000-0000-0000-000000000006', 'Free Wi-Fi',         NOW(), NOW()),
    ('a0000006-0000-0000-0000-000000000002', 'b0000000-0000-0000-0000-000000000006', 'Ocean View',         NOW(), NOW()),
    ('a0000006-0000-0000-0000-000000000003', 'b0000000-0000-0000-0000-000000000006', 'Private Beach',      NOW(), NOW()),
    ('a0000006-0000-0000-0000-000000000004', 'b0000000-0000-0000-0000-000000000006', 'Swimming Pool',      NOW(), NOW()),
    ('a0000006-0000-0000-0000-000000000005', 'b0000000-0000-0000-0000-000000000006', 'Air Conditioning',   NOW(), NOW()),
    ('a0000006-0000-0000-0000-000000000006', 'b0000000-0000-0000-0000-000000000006', 'Spa Access',         NOW(), NOW()),
    ('a0000006-0000-0000-0000-000000000007', 'b0000000-0000-0000-0000-000000000006', 'Butler Service',     NOW(), NOW());


-- Room Type Amenities ----------------------------------------
INSERT INTO room_type_amenities (id, room_type_id, amenity_id, created_at, updated_at)
VALUES
    -- Velocity Deluxe King (f001)
    ('b0000001-0000-0000-0001-000000000001', 'f0000000-0000-0000-0000-000000000001', 'a0000001-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000001-0000-0000-0001-000000000002', 'f0000000-0000-0000-0000-000000000001', 'a0000001-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000001-0000-0000-0001-000000000003', 'f0000000-0000-0000-0000-000000000001', 'a0000001-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000001-0000-0000-0001-000000000004', 'f0000000-0000-0000-0000-000000000001', 'a0000001-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000001-0000-0000-0001-000000000005', 'f0000000-0000-0000-0000-000000000001', 'a0000001-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Velocity Standard Queen (f002)
    ('b0000001-0000-0000-0002-000000000001', 'f0000000-0000-0000-0000-000000000002', 'a0000001-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000001-0000-0000-0002-000000000002', 'f0000000-0000-0000-0000-000000000002', 'a0000001-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000001-0000-0000-0002-000000000003', 'f0000000-0000-0000-0000-000000000002', 'a0000001-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Velocity Deluxe Family King (f003)
    ('b0000001-0000-0000-0003-000000000001', 'f0000000-0000-0000-0000-000000000003', 'a0000001-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000001-0000-0000-0003-000000000002', 'f0000000-0000-0000-0000-000000000003', 'a0000001-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000001-0000-0000-0003-000000000003', 'f0000000-0000-0000-0000-000000000003', 'a0000001-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000001-0000-0000-0003-000000000004', 'f0000000-0000-0000-0000-000000000003', 'a0000001-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000001-0000-0000-0003-000000000005', 'f0000000-0000-0000-0000-000000000003', 'a0000001-0000-0000-0000-000000000006', NOW(), NOW()),
    -- Velocity Twin Room (f004)
    ('b0000001-0000-0000-0004-000000000001', 'f0000000-0000-0000-0000-000000000004', 'a0000001-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000001-0000-0000-0004-000000000002', 'f0000000-0000-0000-0000-000000000004', 'a0000001-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000001-0000-0000-0004-000000000003', 'f0000000-0000-0000-0000-000000000004', 'a0000001-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Velocity Executive Suite (f005)
    ('b0000001-0000-0000-0005-000000000001', 'f0000000-0000-0000-0000-000000000005', 'a0000001-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000001-0000-0000-0005-000000000002', 'f0000000-0000-0000-0000-000000000005', 'a0000001-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000001-0000-0000-0005-000000000003', 'f0000000-0000-0000-0000-000000000005', 'a0000001-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000001-0000-0000-0005-000000000004', 'f0000000-0000-0000-0000-000000000005', 'a0000001-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000001-0000-0000-0005-000000000005', 'f0000000-0000-0000-0000-000000000005', 'a0000001-0000-0000-0000-000000000005', NOW(), NOW()),
    ('b0000001-0000-0000-0005-000000000006', 'f0000000-0000-0000-0000-000000000005', 'a0000001-0000-0000-0000-000000000006', NOW(), NOW()),
    ('b0000001-0000-0000-0005-000000000007', 'f0000000-0000-0000-0000-000000000005', 'a0000001-0000-0000-0000-000000000007', NOW(), NOW()),
    -- Velocity Accessible Queen (f006)
    ('b0000001-0000-0000-0006-000000000001', 'f0000000-0000-0000-0000-000000000006', 'a0000001-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000001-0000-0000-0006-000000000002', 'f0000000-0000-0000-0000-000000000006', 'a0000001-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000001-0000-0000-0006-000000000003', 'f0000000-0000-0000-0000-000000000006', 'a0000001-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Velocity Suburbs King (f015)
    ('b0000002-0000-0000-0015-000000000001', 'f0000000-0000-0000-0000-000000000015', 'a0000002-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000002-0000-0000-0015-000000000002', 'f0000000-0000-0000-0000-000000000015', 'a0000002-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000002-0000-0000-0015-000000000003', 'f0000000-0000-0000-0000-000000000015', 'a0000002-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Velocity Suburbs Queen Garden (f016)
    ('b0000002-0000-0000-0016-000000000001', 'f0000000-0000-0000-0000-000000000016', 'a0000002-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000002-0000-0000-0016-000000000002', 'f0000000-0000-0000-0000-000000000016', 'a0000002-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000002-0000-0000-0016-000000000003', 'f0000000-0000-0000-0000-000000000016', 'a0000002-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000002-0000-0000-0016-000000000004', 'f0000000-0000-0000-0000-000000000016', 'a0000002-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Velocity Suburbs Twin Bunk (f017)
    ('b0000002-0000-0000-0017-000000000001', 'f0000000-0000-0000-0000-000000000017', 'a0000002-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000002-0000-0000-0017-000000000002', 'f0000000-0000-0000-0000-000000000017', 'a0000002-0000-0000-0000-000000000002', NOW(), NOW()),
    -- Velocity Suburbs Double Studio (f018)
    ('b0000002-0000-0000-0018-000000000001', 'f0000000-0000-0000-0000-000000000018', 'a0000002-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000002-0000-0000-0018-000000000002', 'f0000000-0000-0000-0000-000000000018', 'a0000002-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000002-0000-0000-0018-000000000003', 'f0000000-0000-0000-0000-000000000018', 'a0000002-0000-0000-0000-000000000004', NOW(), NOW()),
    -- Velocity Suburbs Family Suite (f019)
    ('b0000002-0000-0000-0019-000000000001', 'f0000000-0000-0000-0000-000000000019', 'a0000002-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000002-0000-0000-0019-000000000002', 'f0000000-0000-0000-0000-000000000019', 'a0000002-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000002-0000-0000-0019-000000000003', 'f0000000-0000-0000-0000-000000000019', 'a0000002-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000002-0000-0000-0019-000000000004', 'f0000000-0000-0000-0000-000000000019', 'a0000002-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Velocity Airport Transit King (f020)
    ('b0000003-0000-0000-0020-000000000001', 'f0000000-0000-0000-0000-000000000020', 'a0000003-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000003-0000-0000-0020-000000000002', 'f0000000-0000-0000-0000-000000000020', 'a0000003-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000003-0000-0000-0020-000000000003', 'f0000000-0000-0000-0000-000000000020', 'a0000003-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000003-0000-0000-0020-000000000004', 'f0000000-0000-0000-0000-000000000020', 'a0000003-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Velocity Airport Transit Double (f021)
    ('b0000003-0000-0000-0021-000000000001', 'f0000000-0000-0000-0000-000000000021', 'a0000003-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000003-0000-0000-0021-000000000002', 'f0000000-0000-0000-0000-000000000021', 'a0000003-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000003-0000-0000-0021-000000000003', 'f0000000-0000-0000-0000-000000000021', 'a0000003-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000003-0000-0000-0021-000000000004', 'f0000000-0000-0000-0000-000000000021', 'a0000003-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Velocity Airport Transit Twin (f022)
    ('b0000003-0000-0000-0022-000000000001', 'f0000000-0000-0000-0000-000000000022', 'a0000003-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000003-0000-0000-0022-000000000002', 'f0000000-0000-0000-0000-000000000022', 'a0000003-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Velocity Airport Business Lounge King (f023)
    ('b0000003-0000-0000-0023-000000000001', 'f0000000-0000-0000-0000-000000000023', 'a0000003-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000003-0000-0000-0023-000000000002', 'f0000000-0000-0000-0000-000000000023', 'a0000003-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000003-0000-0000-0023-000000000003', 'f0000000-0000-0000-0000-000000000023', 'a0000003-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000003-0000-0000-0023-000000000004', 'f0000000-0000-0000-0000-000000000023', 'a0000003-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000003-0000-0000-0023-000000000005', 'f0000000-0000-0000-0000-000000000023', 'a0000003-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Taj Executive King (f008)
    ('b0000004-0000-0000-0008-000000000001', 'f0000000-0000-0000-0000-000000000008', 'a0000004-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000004-0000-0000-0008-000000000002', 'f0000000-0000-0000-0000-000000000008', 'a0000004-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000004-0000-0000-0008-000000000003', 'f0000000-0000-0000-0000-000000000008', 'a0000004-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000004-0000-0000-0008-000000000004', 'f0000000-0000-0000-0000-000000000008', 'a0000004-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000004-0000-0000-0008-000000000005', 'f0000000-0000-0000-0000-000000000008', 'a0000004-0000-0000-0000-000000000005', NOW(), NOW()),
    ('b0000004-0000-0000-0008-000000000006', 'f0000000-0000-0000-0000-000000000008', 'a0000004-0000-0000-0000-000000000006', NOW(), NOW()),
    -- Taj Deluxe Queen (f009)
    ('b0000004-0000-0000-0009-000000000001', 'f0000000-0000-0000-0000-000000000009', 'a0000004-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000004-0000-0000-0009-000000000002', 'f0000000-0000-0000-0000-000000000009', 'a0000004-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000004-0000-0000-0009-000000000003', 'f0000000-0000-0000-0000-000000000009', 'a0000004-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000004-0000-0000-0009-000000000004', 'f0000000-0000-0000-0000-000000000009', 'a0000004-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Taj Twin Room (f010)
    ('b0000004-0000-0000-0010-000000000001', 'f0000000-0000-0000-0000-000000000010', 'a0000004-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000004-0000-0000-0010-000000000002', 'f0000000-0000-0000-0000-000000000010', 'a0000004-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000004-0000-0000-0010-000000000003', 'f0000000-0000-0000-0000-000000000010', 'a0000004-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Taj Presidential Suite (f024)
    ('b0000004-0000-0000-0024-000000000001', 'f0000000-0000-0000-0000-000000000024', 'a0000004-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000004-0000-0000-0024-000000000002', 'f0000000-0000-0000-0000-000000000024', 'a0000004-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000004-0000-0000-0024-000000000003', 'f0000000-0000-0000-0000-000000000024', 'a0000004-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000004-0000-0000-0024-000000000004', 'f0000000-0000-0000-0000-000000000024', 'a0000004-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000004-0000-0000-0024-000000000005', 'f0000000-0000-0000-0000-000000000024', 'a0000004-0000-0000-0000-000000000005', NOW(), NOW()),
    ('b0000004-0000-0000-0024-000000000006', 'f0000000-0000-0000-0000-000000000024', 'a0000004-0000-0000-0000-000000000007', NOW(), NOW()),
    -- Taj Junior Suite Queen (f025)
    ('b0000004-0000-0000-0025-000000000001', 'f0000000-0000-0000-0000-000000000025', 'a0000004-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000004-0000-0000-0025-000000000002', 'f0000000-0000-0000-0000-000000000025', 'a0000004-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000004-0000-0000-0025-000000000003', 'f0000000-0000-0000-0000-000000000025', 'a0000004-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Taj Heritage Double (f026)
    ('b0000004-0000-0000-0026-000000000001', 'f0000000-0000-0000-0000-000000000026', 'a0000004-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000004-0000-0000-0026-000000000002', 'f0000000-0000-0000-0000-000000000026', 'a0000004-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000004-0000-0000-0026-000000000003', 'f0000000-0000-0000-0000-000000000026', 'a0000004-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Taj Airport King (f011)
    ('b0000005-0000-0000-0011-000000000001', 'f0000000-0000-0000-0000-000000000011', 'a0000005-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000005-0000-0000-0011-000000000002', 'f0000000-0000-0000-0000-000000000011', 'a0000005-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000005-0000-0000-0011-000000000003', 'f0000000-0000-0000-0000-000000000011', 'a0000005-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000005-0000-0000-0011-000000000004', 'f0000000-0000-0000-0000-000000000011', 'a0000005-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000005-0000-0000-0011-000000000005', 'f0000000-0000-0000-0000-000000000011', 'a0000005-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Taj Airport Double (f012)
    ('b0000005-0000-0000-0012-000000000001', 'f0000000-0000-0000-0000-000000000012', 'a0000005-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000005-0000-0000-0012-000000000002', 'f0000000-0000-0000-0000-000000000012', 'a0000005-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000005-0000-0000-0012-000000000003', 'f0000000-0000-0000-0000-000000000012', 'a0000005-0000-0000-0000-000000000003', NOW(), NOW()),
    -- Taj Airport Queen (f027)
    ('b0000005-0000-0000-0027-000000000001', 'f0000000-0000-0000-0000-000000000027', 'a0000005-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000005-0000-0000-0027-000000000002', 'f0000000-0000-0000-0000-000000000027', 'a0000005-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000005-0000-0000-0027-000000000003', 'f0000000-0000-0000-0000-000000000027', 'a0000005-0000-0000-0000-000000000004', NOW(), NOW()),
    -- Taj Airport Twin (f028)
    ('b0000005-0000-0000-0028-000000000001', 'f0000000-0000-0000-0000-000000000028', 'a0000005-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000005-0000-0000-0028-000000000002', 'f0000000-0000-0000-0000-000000000028', 'a0000005-0000-0000-0000-000000000004', NOW(), NOW()),
    -- Taj Airport Business Suite (f029)
    ('b0000005-0000-0000-0029-000000000001', 'f0000000-0000-0000-0000-000000000029', 'a0000005-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000005-0000-0000-0029-000000000002', 'f0000000-0000-0000-0000-000000000029', 'a0000005-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000005-0000-0000-0029-000000000003', 'f0000000-0000-0000-0000-000000000029', 'a0000005-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000005-0000-0000-0029-000000000004', 'f0000000-0000-0000-0000-000000000029', 'a0000005-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000005-0000-0000-0029-000000000005', 'f0000000-0000-0000-0000-000000000029', 'a0000005-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Taj Oceanfront King Suite (f013)
    ('b0000006-0000-0000-0013-000000000001', 'f0000000-0000-0000-0000-000000000013', 'a0000006-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000006-0000-0000-0013-000000000002', 'f0000000-0000-0000-0000-000000000013', 'a0000006-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000006-0000-0000-0013-000000000003', 'f0000000-0000-0000-0000-000000000013', 'a0000006-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000006-0000-0000-0013-000000000004', 'f0000000-0000-0000-0000-000000000013', 'a0000006-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000006-0000-0000-0013-000000000005', 'f0000000-0000-0000-0000-000000000013', 'a0000006-0000-0000-0000-000000000005', NOW(), NOW()),
    ('b0000006-0000-0000-0013-000000000006', 'f0000000-0000-0000-0000-000000000013', 'a0000006-0000-0000-0000-000000000006', NOW(), NOW()),
    -- Taj Sea View Queen (f014)
    ('b0000006-0000-0000-0014-000000000001', 'f0000000-0000-0000-0000-000000000014', 'a0000006-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000006-0000-0000-0014-000000000002', 'f0000000-0000-0000-0000-000000000014', 'a0000006-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000006-0000-0000-0014-000000000003', 'f0000000-0000-0000-0000-000000000014', 'a0000006-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000006-0000-0000-0014-000000000004', 'f0000000-0000-0000-0000-000000000014', 'a0000006-0000-0000-0000-000000000005', NOW(), NOW()),
    -- Taj Beach Villa King (f030)
    ('b0000006-0000-0000-0030-000000000001', 'f0000000-0000-0000-0000-000000000030', 'a0000006-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000006-0000-0000-0030-000000000002', 'f0000000-0000-0000-0000-000000000030', 'a0000006-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000006-0000-0000-0030-000000000003', 'f0000000-0000-0000-0000-000000000030', 'a0000006-0000-0000-0000-000000000003', NOW(), NOW()),
    ('b0000006-0000-0000-0030-000000000004', 'f0000000-0000-0000-0000-000000000030', 'a0000006-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000006-0000-0000-0030-000000000005', 'f0000000-0000-0000-0000-000000000030', 'a0000006-0000-0000-0000-000000000006', NOW(), NOW()),
    ('b0000006-0000-0000-0030-000000000006', 'f0000000-0000-0000-0000-000000000030', 'a0000006-0000-0000-0000-000000000007', NOW(), NOW()),
    -- Taj Lagoon Double (f031)
    ('b0000006-0000-0000-0031-000000000001', 'f0000000-0000-0000-0000-000000000031', 'a0000006-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000006-0000-0000-0031-000000000002', 'f0000000-0000-0000-0000-000000000031', 'a0000006-0000-0000-0000-000000000002', NOW(), NOW()),
    ('b0000006-0000-0000-0031-000000000003', 'f0000000-0000-0000-0000-000000000031', 'a0000006-0000-0000-0000-000000000005', NOW(), NOW()),
    ('b0000006-0000-0000-0031-000000000004', 'f0000000-0000-0000-0000-000000000031', 'a0000006-0000-0000-0000-000000000006', NOW(), NOW()),
    -- Taj Beach Garden Queen (f032)
    ('b0000006-0000-0000-0032-000000000001', 'f0000000-0000-0000-0000-000000000032', 'a0000006-0000-0000-0000-000000000001', NOW(), NOW()),
    ('b0000006-0000-0000-0032-000000000002', 'f0000000-0000-0000-0000-000000000032', 'a0000006-0000-0000-0000-000000000004', NOW(), NOW()),
    ('b0000006-0000-0000-0032-000000000003', 'f0000000-0000-0000-0000-000000000032', 'a0000006-0000-0000-0000-000000000005', NOW(), NOW());
>>>>>>> origin/testing
