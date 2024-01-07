SELECT name
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE menu.price < 800
AND person_visits.visit_date = '2022-01-08'
AND person_visits.person_id = (SELECT id FROM person WHERE name = 'Dmitriy');