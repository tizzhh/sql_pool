SELECT coalesce(person.name, '-') AS person_name, visit_date, coalesce(pizzeria.name, '-') AS pizzeria_name
FROM person
FULL JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pv ON pv.person_id = person.id
FULL JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
ORDER BY person_name, visit_date, pizzeria_name;