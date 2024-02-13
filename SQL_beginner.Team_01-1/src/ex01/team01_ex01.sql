insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

-- делал тут раньше CTE, потом понял, что он нах не нужен
-- с CTE по какой-то причине первые 2 ряда меняются местами
-- (прям как в задании должно быть), но он по-факту лишний код.
SELECT DISTINCT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    currency.name AS currency_name,
    COALESCE((
        SELECT currency.rate_to_usd
        FROM currency
        WHERE currency.updated < balance.updated
        AND currency.id = balance.currency_id
        ORDER BY currency.updated DESC
        LIMIT 1
    ),
    (
        SELECT currency.rate_to_usd
        FROM currency
        WHERE currency.updated > balance.updated
        AND currency.id = balance.currency_id
        ORDER BY currency.updated
        LIMIT 1
    )) * balance.money AS currency_in_usd
FROM currency
JOIN balance ON currency.id = balance.currency_id
LEFT JOIN "user" ON balance.user_id = "user".id
ORDER BY name DESC, lastname, currency_name;