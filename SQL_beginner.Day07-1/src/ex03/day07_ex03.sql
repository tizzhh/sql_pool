WITH res AS ((SELECT pizzeria.name
   FROM person_order
   JOIN menu ON person_order.menu_id = menu.id
   JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
UNION ALL
  (SELECT pizzeria.name
   FROM person_visits
   JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
))
SELECT 
    res.name,
    COUNT(res.name) AS total_count
FROM res
GROUP BY res.name
ORDER BY total_count DESC, res.name;