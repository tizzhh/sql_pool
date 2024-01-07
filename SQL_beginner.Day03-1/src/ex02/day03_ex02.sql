SELECT pizza_name, price,
    (SELECT name FROM pizzeria WHERE id = menu.pizzeria_id) AS pizzeria_name
FROM menu
EXCEPT
SELECT pizza_name, price,
    (SELECT name FROM pizzeria WHERE id = menu.pizzeria_id)
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
ORDER BY pizza_name, price;