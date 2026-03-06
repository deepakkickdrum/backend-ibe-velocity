CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS tenant (
    id   UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS property (
    id                UUID PRIMARY KEY,
    tenant_id         UUID REFERENCES tenant (id) ON DELETE CASCADE,
    name              VARCHAR(255) NOT NULL,
    max_occupancy     INT,
    max_booking_rooms INT,
    banner_image_url  TEXT
);

CREATE TABLE IF NOT EXISTS landing_page_config (
    property_id        UUID PRIMARY KEY REFERENCES property (id) ON DELETE CASCADE,
    show_guests_option BOOLEAN,
    show_rooms_option  BOOLEAN,
    show_acc_option    BOOLEAN
);

CREATE TABLE IF NOT EXISTS guest_type (
    id          UUID PRIMARY KEY,
    property_id UUID REFERENCES property (id) ON DELETE CASCADE,
    name        VARCHAR(100) NOT NULL,
    min_age     INT,
    max_age     INT
);

CREATE TABLE IF NOT EXISTS bed_type (
    id   UUID PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS room_type (
    id            UUID PRIMARY KEY,
    property_id   UUID REFERENCES property (id) ON DELETE CASCADE,
    bed_type_id   UUID REFERENCES bed_type (id),
    title         VARCHAR(255) NOT NULL,
    description   TEXT,
    size_sqft     DECIMAL(10, 2),
    max_occupancy INT,
    images        JSONB
);

CREATE TABLE IF NOT EXISTS amenity (
    id          UUID PRIMARY KEY,
    property_id UUID REFERENCES property (id) ON DELETE CASCADE,
    label       VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS room_type_amenity (
    room_type_id UUID REFERENCES room_type (id) ON DELETE CASCADE,
    amenity_id   UUID REFERENCES amenity (id) ON DELETE CASCADE,
    PRIMARY KEY (room_type_id, amenity_id)
);

CREATE TABLE IF NOT EXISTS room_rates (
    id           UUID PRIMARY KEY,
    property_id  UUID REFERENCES property (id) ON DELETE CASCADE,
    room_type_id UUID REFERENCES room_type (id) ON DELETE CASCADE,
    date         DATE NOT NULL,
    price        DECIMAL(10, 2) NOT NULL
);