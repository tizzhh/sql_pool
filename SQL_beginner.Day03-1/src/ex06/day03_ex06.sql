SELECT m1.pizza_name,
    (SELECT name FROM pizzeria WHERE id = m1.pizzeria_id) AS pizzeria_name_1,
    (SELECT name FROM pizzeria WHERE id = m2.pizzeria_id) AS pizzeria_name_2,
    m1.price
FROM menu AS m1
JOIN menu AS m2 ON m2.price = m1.price AND m2.pizzeria_id < m1.pizzeria_id AND m1.pizza_name = m2.pizza_name
ORDER BY m1.pizza_name;
