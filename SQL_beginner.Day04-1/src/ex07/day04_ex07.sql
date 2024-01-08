INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (
        SELECT MAX(id) + 1
        FROM person_visits
    ),
    (
        SELECT id
        FROM person
        WHERE name = 'Dmitriy'
    ),
    (
        SELECT id
        FROM pizzeria
        WHERE name = 'DoDo Pizza'
    ),
    '2022-01-08'
);

-- SELECT * FROM mv_dmitriy_visits_and_eats;
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
-- SELECT * FROM mv_dmitriy_visits_and_eats;