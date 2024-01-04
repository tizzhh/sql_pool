SELECT order_date AS action_date, person_order.person_id AS person_id
FROM person_order
INTERSECT
SELECT visit_date AS action_date, person_visits.person_id AS person_id
FROM person_visits
ORDER BY action_date, person_id DESC;