-- truncate.sql

-- use when you are hard pressed for DB storage, e.g. free tier of heroku
-- you should probably dump the tables before deleting them

-- DELETE order matters because of foreign keys
DELETE FROM measurements;
DELETE FROM weather WHERE key != 0 AND ts != (SELECT max(ts) FROM weather);
