WITH aboba AS (
    SELECT
    person.name AS name,
    CASE
        WHEN COUNT(*) > 3 THEN COUNT(*)
    ELSE
        null
    END AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person.name
)
SELECT aboba.name, aboba.count_of_visits
FROM aboba
JOIN aboba ab ON ab.count_of_visits = aboba.count_of_visits;