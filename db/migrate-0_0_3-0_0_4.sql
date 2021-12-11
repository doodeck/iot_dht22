-- migrate-0_0_3-0_0_4.sql

/*
Changes:
introduced:
    weather_key INTEGER REFERENCES weather(key) DEFAULT 0
*/

/* to test in productive DB create a temporary table
create table measurements_n as (select * from measurements LIMIT 50);
ALTER TABLE measurements_n ALTER COLUMN ts SET DEFAULT now();
ALTER TABLE measurements_n
    ADD CONSTRAINT "measurements_n_id_key_fkey" FOREIGN KEY (id_key) REFERENCES credentials_ids(key);
*/

ALTER TABLE measurements
    ADD COLUMN weather_key INTEGER DEFAULT 0;

ALTER TABLE measurements
    ADD CONSTRAINT "measurements_n_weather_key_fkey" FOREIGN KEY (weather_key) REFERENCES weather(key);
