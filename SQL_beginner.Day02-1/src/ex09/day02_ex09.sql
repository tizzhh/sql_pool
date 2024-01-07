WITH temp AS (
    SELECT DISTINCT person.name, menu.pizza_name
    FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
    WHERE gender = 'female'
    AND menu.pizza_name IN ('pepperoni pizza', 'cheese pizza')
)
SELECT name
FROM temp
GROUP BY name
HAVING COUNT(name) = 2
ORDER BY name;