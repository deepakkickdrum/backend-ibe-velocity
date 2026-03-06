CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS tenants (
    id              UUID PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
);

CREATE TABLE IF NOT EXISTS properties (
    id                UUID PRIMARY KEY,
    tenant_id         UUID REFERENCES tenants (id) ON DELETE CASCADE,
    name              VARCHAR(255) NOT NULL,
    max_booking_rooms INT,
    banner_image_url  TEXT
);

CREATE TABLE IF NOT EXISTS landing_page_configs (
    id                 UUID PRIMARY KEY,
    property_id        UUID UNIQUE REFERENCES properties (id) ON DELETE CASCADE,
    show_guests_option BOOLEAN,
    show_rooms_option  BOOLEAN,
    show_acc_option    BOOLEAN,
    logo_url        TEXT,
    banner_image_url TEXT,
    created_at         TIMESTAMP NOT NULL,
    updated_at         TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS guest_types (
    id          UUID PRIMARY KEY,
    property_id UUID REFERENCES properties (id) ON DELETE CASCADE,
    name        VARCHAR(100) NOT NULL,
    min_age     INT,
    max_age     INT
);

CREATE TABLE IF NOT EXISTS bed_types (
    id   UUID PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS room_types (
    id            UUID PRIMARY KEY,
    property_id   UUID REFERENCES properties (id) ON DELETE CASCADE,
    bed_type_id   UUID REFERENCES bed_types (id),
    title         VARCHAR(255) NOT NULL,
    description   TEXT,
    size_sqft     DECIMAL(10, 2),
    max_occupancy INT,
    images        JSONB
);

CREATE TABLE IF NOT EXISTS amenities (
    id          UUID PRIMARY KEY,
    property_id UUID REFERENCES properties (id) ON DELETE CASCADE,
    label       VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS room_type_amenities (
    room_type_id UUID REFERENCES room_types (id) ON DELETE CASCADE,
    amenity_id   UUID REFERENCES amenities (id) ON DELETE CASCADE,
    PRIMARY KEY (room_type_id, amenity_id)
);

CREATE TABLE IF NOT EXISTS room_rates (
    id           UUID PRIMARY KEY,
    property_id  UUID REFERENCES properties (id) ON DELETE CASCADE,
    room_type_id UUID REFERENCES room_types (id) ON DELETE CASCADE,
    date         DATE NOT NULL,
    price        DECIMAL(10, 2) NOT NULL
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