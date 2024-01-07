SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE price BETWEEN 800 AND 1000
AND person_visits.person_id = (SELECT id FROM person WHERE name = 'Kate')
ORDER BY pizza_name, price, pizzeria.name;