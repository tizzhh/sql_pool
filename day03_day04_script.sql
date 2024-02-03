insert into menu(id,pizzeria_id,pizza_name,price) values (19,2, 'greek pizza', '800');

insert into menu(id,pizzeria_id,pizza_name,price) values
((select max(id)+1 from menu),(select id from pizzeria where name = 'Dominos'), 'sicilian pizza' ,900);

insert into person_visits(id, person_id, pizzeria_id, visit_date) values
((select max(id)+1 from person_visits), (select id from person where name = 'Denis'),
(select id from pizzeria where name = 'Dominos'), '2022-02-24');
insert into person_visits(id, person_id, pizzeria_id, visit_date) values
((select max(id)+1 from person_visits), (select id from person where name = 'Irina'),
(select id from pizzeria where name = 'Dominos'), '2022-02-24');

insert into person_order(id, person_id, menu_id, order_date) values
((select max(id)+1 from person_order), (select id from person where name = 'Denis'),
(select id from menu where pizza_name = 'sicilian pizza'), '2022-02-24');

insert into person_order(id, person_id, menu_id, order_date) values
((select max(id)+1 from person_order), (select id from person where name = 'Irina'),
(select id from menu where pizza_name = 'sicilian pizza'), '2022-02-24');

update menu
set price = price-price*0.1
where pizza_name ='greek pizza';

insert into person_order(id,person_id,menu_id,order_date)
select
g+(select max(id) from person_order) as id,
id as person_id,
(select id from menu where pizza_name = 'greek pizza') as menu_id,
'2022-02-25' as order_date
from person inner join
generate_series(1,(select count(*) from person)) as g on g= person.id;

delete from person_order where order_date = '2022-02-25';
delete from menu where pizza_name = 'greek pizza';


INSERT INTO person_visits
values ((SELECT max(id) FROM person_visits) + 1,
(SELECT id FROM person WHERE name = 'Dmitriy'),
(SELECT id FROM pizzeria WHERE name = 'DoDo Pizza'),
'2022-01-08');