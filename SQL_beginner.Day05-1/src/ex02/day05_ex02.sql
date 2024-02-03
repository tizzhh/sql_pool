CREATE INDEX idx_person_name ON person(UPPER(NAME));
set enable_seqscan =off;
EXPLAIN ANALYZE SELECT name
FROM person
WHERE UPPER(name) = 'ANNA';