CREATE VIEW v_generated_dates AS
    SELECT generate_series('2022-01-01'::timestamp, '2022-01-31'::timestamp, '1 day'::interval)::date AS generated_date
    ORDER BY 1;

-- SELECT * FROM v_generated_dates;