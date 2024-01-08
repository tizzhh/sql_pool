INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    (SELECT MAX(id) + i FROM person_order),
    i::bigint,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM generate_series(
    (SELECT MIN(id) FROM person),
    (SELECT MAX(id) FROM person)
) AS t(i);

-- SELECT *
-- FROM person_order;