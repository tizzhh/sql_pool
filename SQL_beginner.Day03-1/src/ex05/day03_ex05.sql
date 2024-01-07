SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person.id = person_visits.person_id
WHERE person.name = 'Andrey' AND person_visits.pizzeria_id NOT IN 
(SELECT pizzeria_id FROM menu WHERE id IN 
(SELECT menu_id FROM person_order WHERE person_id = person.id));