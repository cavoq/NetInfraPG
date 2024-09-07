CREATE SCHEMA IF NOT EXISTS iot;
CREATE TABLE IF NOT EXISTS iot.cell_towers (
    radio VARCHAR(50) NOT NULL,
    mcc CHAR(3) NOT NULL,
    net CHAR(3) NOT NULL,
    area VARCHAR(20) NOT NULL,
    cell INTEGER NOT NULL,
    lat DECIMAL(9, 6) NOT NULL,
    long DECIMAL(9, 6) NOT NULL,
    range INTEGER,
    samples INTEGER,
    changeable BOOLEAN NOT NULL,
    created TIMESTAMP NOT NULL,
    updated TIMESTAMP,
    average_signal DECIMAL(5, 2),
    PRIMARY KEY (mcc, net, area, cell)
);