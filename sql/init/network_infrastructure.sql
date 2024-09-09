CREATE EXTENSION IF NOT EXISTS postgis;

CREATE SCHEMA IF NOT EXISTS network_infrastructure;

-- TABLES
CREATE TABLE IF NOT EXISTS network_infrastructure.cell_tower (
    radio VARCHAR(50) NOT NULL,
    mcc CHAR(3) NOT NULL,
    mnc CHAR(3) NOT NULL,
    area VARCHAR(20) NOT NULL,
    cell INTEGER NOT NULL,
    range INTEGER,
    samples INTEGER,
    changeable BOOLEAN NOT NULL,
    created TIMESTAMP NOT NULL,
    updated TIMESTAMP,
    average_signal DECIMAL(5, 2),
    location GEOMETRY(Point, :DEFAULT_CRS),
    PRIMARY KEY (mcc, mnc, area, cell)
);

CREATE TABLE IF NOT EXISTS network_infrastructure.carrier (
    type VARCHAR(50) NOT NULL,
    country_name VARCHAR(100),
    country_code CHAR(5),
    mcc CHAR(3) NOT NULL,
    mnc CHAR(3) NOT NULL,
    brand VARCHAR(100),
    operator VARCHAR(100),
    status VARCHAR(50),
    bands VARCHAR(255),
    notes TEXT,
    PRIMARY KEY (mcc, mnc)
);

-- CONSTRAINTS
ALTER TABLE
    network_infrastructure.cell_tower
ADD
    CONSTRAINT fk_carrier FOREIGN KEY (mcc, mnc) REFERENCES network_infrastructure.carrier (mcc, mnc) ON DELETE
SET
    NULL;

-- INDEXES
CREATE INDEX idx_cell_tower_mcc_mnc_area_cell ON network_infrastructure.cell_tower (mcc, mnc, area, cell);

CREATE INDEX idx_carrier_mcc_mnc ON network_infrastructure.carrier (mcc, mnc);

CREATE INDEX idx_cell_tower_location ON network_infrastructure.cell_tower USING GIST (location);