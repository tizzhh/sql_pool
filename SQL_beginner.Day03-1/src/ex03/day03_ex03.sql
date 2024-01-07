WITH result AS (
    SELECT pizzeria.name AS pizzeria_name, COUNT(person.name)
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
    WHERE gender = 'female'
    GROUP BY pizzeria_name
    EXCEPT ALL
    SELECT pizzeria.name AS pizzeria_name, COUNT(person.name)
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
    WHERE gender = 'male'
    GROUP BY pizzeria_name
)
SELECT pizzeria_name
FROM result
ORDER BY pizzeria_name;