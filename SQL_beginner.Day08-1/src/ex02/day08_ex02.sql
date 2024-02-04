-- SESSION 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- SESSION 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--SESSION 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--SESSION 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION 1
UPDATE pizzeria SET rating = 4
WHERE id = (SELECT id FROM pizzeria WHERE name = 'Pizza Hut');

-- SESSION 2
UPDATE pizzeria SET rating = 3.6
WHERE id = (SELECT id FROM pizzeria WHERE name = 'Pizza Hut');


-- SESSION 1
COMMIT;

-- SESSION 2
COMMIT;

-- SESSION 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';