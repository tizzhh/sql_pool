INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    row_number() OVER () AS id,
    person_order.person_id,
    menu.pizzeria_id,
    CASE
        WHEN COUNT(person_order.person_id) = 1 THEN 10.5
        WHEN COUNT(person_order.person_id) = 2 THEN 22
    ELSE
        30
    END AS discount
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
GROUP BY person_order.person_id, menu.pizzeria_id;
