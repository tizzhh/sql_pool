CREATE SEQUENCE seq_person_discounts INCREMENT BY 1 START 1 OWNED BY person_discounts.id;
ALTER TABLE person_discounts ALTER COLUMN person_id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (SELECT COUNT(*) + 1 FROM person_discounts), false);
