SELECT name, rating
FROM person_visits
RIGHT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE pizzeria_id IS NULL;  

SELECT name, rating
FROM pizzeria
LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE person_id IS NULL;  
