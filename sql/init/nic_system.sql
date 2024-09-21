CREATE SCHEMA IF NOT EXISTS nic_system;

-- TABLES
CREATE TABLE IF NOT EXISTS nic_system.import (
    id SERIAL PRIMARY KEY,
    pid NOT NULL
    type ENUM('carriers', 'cell_towers') NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'processing', 'completed', 'failed') DEFAULT 'pending',
    error TEXT,
);