CREATE VIEW v_price_with_discount AS
    SELECT 
        (SELECT name FROM person WHERE id = person_order.person_id),
        pizza_name,
        price,
        CAST(price * 0.9 AS INT) AS discount_price
    FROM menu
    JOIN person_order ON person_order.menu_id = menu.id
    ORDER BY name, pizza_name;

-- SELECT * FROM v_price_with_discount;