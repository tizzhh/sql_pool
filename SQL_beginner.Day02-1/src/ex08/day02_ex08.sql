SELECT name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
WHERE address IN ('Moscow', 'Samara')
AND menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
AND gender = 'male'
ORDER BY name DESC;