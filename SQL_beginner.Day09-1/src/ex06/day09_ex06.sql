CREATE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson VARCHAR = 'Dmitriy', IN pprice NUMERIC = 500, IN pdate DATE = '08-01-2022')
RETURNS SETOF VARCHAR
AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pizzeria.name
    FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
    WHERE
        person.name = pperson
        AND menu.price < pprice
        AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
