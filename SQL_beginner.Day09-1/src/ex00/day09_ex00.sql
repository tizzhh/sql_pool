CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE NOT NULL default CURRENT_TIMESTAMP,
    type_event CHAR(1) NOT NULL default 'I',
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);
ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'));

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
    BEGIN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        VALUES (new.id, new.name, new.age, new.gender, new.address);
        RETURN NEW;
    END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

SELECT * FROM person;
SELECT * FROM person_audit;

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person;
SELECT * FROM person_audit;