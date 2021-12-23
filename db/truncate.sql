-- truncate.sql

-- use when you are hard pressed for DB storage, e.g. free tier of heroku
-- you should probably dump the tables before deleting them, e.g.
-- for i in measurements weather ; do heroku pg:psql -c "\copy (SELECT * FROM ${i} order by ts) TO latest_${i}.csv CSV DELIMITER ','" ; done
-- heroku pg:backups:capture
-- heroku pg:backups:download b006

-- DELETE order matters because of foreign keys
DELETE FROM measurements;
DELETE FROM weather WHERE key != 0 AND ts != (SELECT max(ts) FROM weather);
