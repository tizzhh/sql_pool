WITH result AS (
    SELECT pizzeria.name AS pizzeria_name, person.gender
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    WHERE gender = 'female'
    UNION
    SELECT pizzeria.name AS pizzeria_name, person.gender
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    WHERE gender = 'male'
)
SELECT pizzeria_name
FROM result
GROUP BY pizzeria_name
HAVING COUNT(pizzeria_name) = 1;