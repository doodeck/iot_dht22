-- migrate-0_0_1-0_0_2.sql

/*
Changes:
obsoleted:
    id char(12), -- board id - MAC address
introduced:
    id_key INTEGER REFERENCES credentials_ids(key),
*/

/* to test in productive DB create a temporary table
create table measurements_n as (select * from measurements LIMIT 50);
ALTER TABLE measurements_n ALTER COLUMN ts SET DEFAULT now();
*/

ALTER TABLE measurements
    ADD COLUMN id_key INTEGER;

UPDATE measurements m SET id_key = (SELECT key FROM credentials_ids c WHERE c.id = m.id);

ALTER TABLE measurements
    ADD CONSTRAINT "measurements_id_key_fkey" FOREIGN KEY (id_key) REFERENCES credentials_ids(key);

ALTER TABLE measurements
    DROP COLUMN id;

