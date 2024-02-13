WITH row_numb_currency AS (
    SELECT
        id,
        name,
        rate_to_usd,
        updated,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) AS RowNum
    FROM currency
), last_upd_cur AS (
    SELECT *
    FROM row_numb_currency
    WHERE RowNum = 1
)
SELECT 
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    balance.type AS type,
    SUM(balance.money) AS volume,
    COALESCE(last_upd_cur.name, 'not defined') AS currency_name,
    COALESCE((rate_to_usd), 1) AS last_rate_to_usd,
    SUM(balance.money) * COALESCE((rate_to_usd), 1) AS total_volume_in_usd
FROM last_upd_cur
RIGHT JOIN balance ON last_upd_cur.id = balance.currency_id
FULL JOIN "user" ON balance.user_id = "user".id
GROUP BY 
    "user".name,
    lastname,
    type,
    currency_name,
    balance.currency_id,
    last_upd_cur.rate_to_usd
ORDER BY
    name DESC,
    lastname,
    type;