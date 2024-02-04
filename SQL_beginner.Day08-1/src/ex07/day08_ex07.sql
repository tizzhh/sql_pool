-- SESSION 1
BEGIN;

-- SESSION 2
BEGIN;

-- SESSION 1
UPDATE pizzeria SET rating = 1.69
WHERE id = 1;

-- SESSION 2
UPDATE pizzeria SET rating = 1.69
WHERE id = 2;

-- SESSION 1
UPDATE pizzeria SET rating = 4.20
WHERE id = 2;

-- SESSION 2
UPDATE pizzeria SET rating = 4.20
WHERE id = 1;

-- SESSION 1
COMMIT;

-- SESSION 2
COMMIT;