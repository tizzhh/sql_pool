(SELECT pizzeria.name,
        COUNT(*) AS COUNT,
        'order' AS action_type
   FROM person_order
   JOIN menu ON person_order.menu_id = menu.id
   JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
   GROUP BY pizzeria.name
   ORDER BY action_type, COUNT DESC
   LIMIT 3)
UNION
  (SELECT pizzeria.name,
        COUNT(*) AS COUNT,
        'visit' AS action_type
   FROM person_visits
   JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
   GROUP BY pizzeria.name
   ORDER BY action_type, COUNT DESC
   LIMIT 3)
ORDER BY action_type, COUNT DESC;