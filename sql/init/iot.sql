CREATE SCHEMA IF NOT EXISTS iot;

CREATE TABLE IF NOT EXISTS iot.cellphone_towers (
    tower_id SERIAL PRIMARY KEY,
    mcc INT NOT NULL,
    mnc INT NOT NULL,
    lac INT NOT NULL,                    
    cid INT NOT NULL,                    
    latitude DECIMAL(9, 6) NOT NULL,    
    longitude DECIMAL(9, 6) NOT NULL,  
    radio VARCHAR(50) NOT NULL,        
    range INT,                         
    average_signal INT DEFAULT 0,    
    samples INT DEFAULT 0,              
    changeable BOOLEAN DEFAULT TRUE,      
    created TIMESTAMP WITH TIME ZONE,     
    updated TIMESTAMP WITH TIME ZONE,  
    provider_name VARCHAR(100),         
    signal_strength INT,

    CONSTRAINT unique_tower UNIQUE (mcc, mnc, lac, cid),
    CREATE INDEX idx_tower_location ON iot.cellphone_towers (latitude, longitude),
    CREATE INDEX idx_tower_mcc_mnc ON iot.cellphone_towers (mcc, mnc)
);

CREATE INDEX idx_tower_range ON iot.cellphone_towers (range);
CREATE INDEX idx_tower_signal ON iot.cellphone_towers (average_signal);