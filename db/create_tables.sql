-- create_tables.sql

CREATE TABLE measurements (
    ts timestamp default now(), -- when inserted into DB
    id char(12), -- board id - MAC address
    gpio smallint, -- gpio input id
    temp real, -- temperature
    hum real -- humidity
);
