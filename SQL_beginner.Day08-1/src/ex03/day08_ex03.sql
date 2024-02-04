-- SESSION 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- SESSION 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- SESSION 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION 2
UPDATE pizzeria SET rating = 3.6
WHERE id = (SELECT id FROM pizzeria WHERE name = 'Pizza Hut');
-- случайно сделал селект в сессии 1 до коммита, поэтому на скрине лишний вывод
COMMIT;

-- SESSION 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';