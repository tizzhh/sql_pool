CREATE FUNCTION fnc_fibonacci(IN pstop INTEGER = 10)
RETURNS SETOF INTEGER
AS $$
DECLARE 
    a INTEGER := 0;
    b INTEGER := 1;
BEGIN
    RETURN NEXT 0;
    RETURN NEXT 1;
    LOOP
        a := a + b;
        EXIT WHEN a >= pstop;
        RETURN NEXT a;

        b := b + a;
        EXIT WHEN b >= pstop;
        RETURN NEXT b;
    END LOOP;
    RETURN;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);