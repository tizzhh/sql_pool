DROP FUNCTION fnc_persons_male;
DROP FUNCTION fnc_persons_female;

CREATE FUNCTION fnc_persons(IN pgender VARCHAR = 'female') RETURNS SETOF person AS $$
    SELECT *
    FROM person
    WHERE gender = pgender
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
