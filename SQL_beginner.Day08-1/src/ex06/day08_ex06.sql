-- SESSION 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- SESSION 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- SESSION 1
SELECT SUM(rating) FROM pizzeria;

-- SESSION 2
UPDATE pizzeria SET rating = 5
WHERE id = (SELECT id FROM pizzeria WHERE name = 'Pizza Hut');
COMMIT;

-- SESSION 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- SESSION 2
SELECT SUM(rating) FROM pizzeria;