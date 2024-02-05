CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC
AS $$
BEGIN
    RETURN MIN(val) FROM unnest($1) AS val;
END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
