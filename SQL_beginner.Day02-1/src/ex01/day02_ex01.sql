SELECT missing_date::date
FROM generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval) AS missing_date
LEFT JOIN 
(
    SELECT *
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
) AS visited_by_1_or_2
ON missing_date = visited_by_1_or_2.visit_date
WHERE person_id IS NULL
ORDER BY missing_date;