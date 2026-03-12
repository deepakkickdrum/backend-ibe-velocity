CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS tenants (
    id               UUID PRIMARY KEY,
    name             VARCHAR(255) NOT NULL,
    logo_url         TEXT,
    banner_image_url TEXT,
    created_at       TIMESTAMP NOT NULL,
    updated_at       TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS properties (
    id                  UUID PRIMARY KEY,
    tenant_id           UUID REFERENCES tenants (id) ON DELETE CASCADE,
    name                VARCHAR(255) NOT NULL,
    max_booking_rooms   INT,
    max_guests_per_room INT,
    min_stay            INT NOT NULL DEFAULT 1,
    max_stay            INT NOT NULL DEFAULT 7,
    banner_image_url    TEXT,
    created_at          TIMESTAMP NOT NULL,
    updated_at          TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS landing_page_configs (
    id                 UUID PRIMARY KEY,
    property_id        UUID UNIQUE REFERENCES properties (id) ON DELETE CASCADE,
    show_guests_option BOOLEAN,
    show_rooms_option  BOOLEAN,
    show_acc_option    BOOLEAN,
    created_at         TIMESTAMP NOT NULL,
    updated_at         TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS guest_types (
    id          UUID PRIMARY KEY,
    property_id UUID REFERENCES properties (id) ON DELETE CASCADE,
    name        VARCHAR(100) NOT NULL,
    min_age     INT,
    max_age     INT,
    created_at  TIMESTAMP NOT NULL,
    updated_at  TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS bed_types (
    id         UUID PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS room_types (
    id            UUID PRIMARY KEY,
    property_id   UUID REFERENCES properties (id) ON DELETE CASCADE,
    bed_type_id   UUID REFERENCES bed_types (id),
    title         VARCHAR(255) NOT NULL,
    description   TEXT,
    size_sqft     DECIMAL(10, 2),
    max_occupancy INT,
    images        JSONB,
    created_at    TIMESTAMP NOT NULL,
    updated_at    TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS amenities (
    id          UUID PRIMARY KEY,
    property_id UUID REFERENCES properties (id) ON DELETE CASCADE,
    label       VARCHAR(255) NOT NULL,
    created_at  TIMESTAMP NOT NULL,
    updated_at  TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS room_type_amenities (
    id           UUID PRIMARY KEY,
    room_type_id UUID REFERENCES room_types (id) ON DELETE CASCADE,
    amenity_id   UUID REFERENCES amenities (id) ON DELETE CASCADE,
    created_at   TIMESTAMP NOT NULL,
    updated_at   TIMESTAMP NOT NULL,
    UNIQUE (room_type_id, amenity_id)
);

CREATE TABLE IF NOT EXISTS room_rates (
    id           UUID PRIMARY KEY,
    property_id  UUID REFERENCES properties (id) ON DELETE CASCADE,
    room_type_id UUID REFERENCES room_types (id) ON DELETE CASCADE,
    date         DATE NOT NULL,
    price        DECIMAL(10, 2) NOT NULL,
    created_at   TIMESTAMP NOT NULL,
    updated_at   TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS bookings (
    id           UUID PRIMARY KEY,
    property_id  UUID REFERENCES properties (id) ON DELETE CASCADE,
    room_type_id UUID REFERENCES room_types (id) ON DELETE CASCADE,
    check_in     DATE NOT NULL,
    check_out    DATE NOT NULL,
    total_price  DECIMAL(10, 2) NOT NULL,
    status       VARCHAR(50) NOT NULL,
    created_at   TIMESTAMP NOT NULL,
    updated_at   TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS room_inventory (
    id              UUID PRIMARY KEY,
    property_id     UUID REFERENCES properties (id) ON DELETE CASCADE,
    room_type_id    UUID REFERENCES room_types (id) ON DELETE CASCADE,
    date            DATE NOT NULL,
    total_rooms     INT NOT NULL,
    available_rooms INT NOT NULL,
    version         INT NOT NULL DEFAULT 0,
    created_at      TIMESTAMP NOT NULL,
    updated_at      TIMESTAMP NOT NULL,
    UNIQUE (room_type_id, date)
);

CREATE TABLE IF NOT EXISTS offers (
    id               UUID PRIMARY KEY,
    name             VARCHAR(100) NOT NULL,
    description      TEXT NOT NULL,
    offer_percentage DECIMAL(10, 2) NOT NULL CHECK ( offer_percentage >= 0),
    is_active        BOOLEAN NOT NULL DEFAULT TRUE,
    is_promocode     BOOLEAN NOT NULL DEFAULT FALSE,
    created_at       TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at       TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS property_offers (
    id               UUID PRIMARY KEY,
    property_id      UUID REFERENCES properties (id) ON DELETE CASCADE,
    offer_id         UUID REFERENCES offers (id) ON DELETE CASCADE,
    created_at       TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at       TIMESTAMP NOT NULL DEFAULT NOW(),
    UNIQUE(property_id, offer_id)
);

CREATE TABLE IF NOT EXISTS room_type_offers (
    id               UUID PRIMARY KEY,
    room_type_id     UUID REFERENCES room_types (id) ON DELETE CASCADE,
    offer_id         UUID REFERENCES offers (id) ON DELETE CASCADE,
    created_at       TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at       TIMESTAMP NOT NULL DEFAULT NOW(),
    UNIQUE(room_type_id, offer_id)
);

CREATE TABLE IF NOT EXISTS filter_options (
    id               UUID PRIMARY KEY,
    filter_id        UUID REFERENCES filters (id) ON DELETE CASCADE,
    name             VARCHAR(50) NOT NULL,
    created_at       TIMESTAMP NOT NULL,
    updated_at       TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS property_type_filters (
    id               UUID PRIMARY KEY,
    property_id      UUID REFERENCES properties (id) ON DELETE CASCADE,
    filter_id        UUID REFERENCES filters (id) ON DELETE CASCADE,
    created_at       TIMESTAMP NOT NULL,
    updated_at       TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS sort_options (
    id               UUID PRIMARY KEY,
    name             VARCHAR(50) NOT NULL,
    default_order    VARCHAR(4) NOT NULL CHECK (default_order IN ('asc', 'desc')),
    created_at       TIMESTAMP NOT NULL,
    updated_at       TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS property_type_sort (
    id               UUID PRIMARY KEY,
    property_id      UUID REFERENCES properties (id) ON DELETE CASCADE,
    sort_options_id  UUID REFERENCES sort_options (id) ON DELETE CASCADE,
    created_at       TIMESTAMP NOT NULL,
    updated_at       TIMESTAMP NOT NULL
);