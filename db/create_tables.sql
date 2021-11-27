-- create_tables.sql

CREATE TABLE measurements (
    ts timestamp default now(), -- when inserted into DB
    -- 0.0.1: id char(12), -- board id - MAC address
    /* 0.0.2 */ id_key INTEGER REFERENCES credentials_ids(key),
    gpio smallint, -- gpio input id
    temp real, -- temperature
    hum real -- humidity
);

-- also run:
--   credentials.sql