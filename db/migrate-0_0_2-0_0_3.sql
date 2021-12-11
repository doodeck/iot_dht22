-- migrate-0_0_2-0_0_3.sql

/*
Changes:
introduced:
    CREATE TABLE weather
*/

CREATE TABLE weather ( -- external weather
    key SERIAL PRIMARY KEY,
    ts timestamp default now(), -- when inserted into DB
    temp real,
    hum real,
    pressure smallint
);
INSERT INTO weather (key, ts, temp, hum, pressure) VALUES (0, '1/1/70'::timestamp, 0., 0., 0); -- key value important - default foreign key
