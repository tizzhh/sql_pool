COMMENT ON TABLE person_discounts IS 'Таблица для хранения скидок посетителей в зависимости от количества заказов';
COMMENT ON COLUMN person_discounts.id IS 'primary key таблицы person_discounts';
COMMENT ON COLUMN person_discounts.person_id IS 'foreign key на id человека из таблицы person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'foreign key на id пиццерии из таблицы pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'скидка человека на заказ';