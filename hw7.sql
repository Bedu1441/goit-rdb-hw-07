USE goit_rdb_hw_03;

-- 1. Рік, місяць і число з поля date

SELECT
    o.id,
    o.date,
    YEAR(o.date)  AS year_part,
    MONTH(o.date) AS month_part,
    DAY(o.date)   AS day_part
FROM orders AS o;

-- 2. Додати один день до date

SELECT
    o.id,
    o.date,
    DATE_ADD(o.date, INTERVAL 1 DAY) AS date_plus_one
FROM orders AS o;

-- 3. Кількість секунд від початку відліку (timestamp)

SELECT
    o.id,
    o.date,
    UNIX_TIMESTAMP(o.date) AS ts_seconds
FROM orders AS o;

-- 4. Кількість рядків у діапазоні дат

SELECT
    COUNT(*) AS orders_in_range
FROM orders AS o
WHERE o.date BETWEEN '1996-07-10 00:00:00'
                 AND '1996-10-08 00:00:00';

-- 5. JSON-об’єкт {"id": ..., "date": ...}

SELECT
    o.id,
    o.date,
    JSON_OBJECT(
        'id',   o.id,
        'date', o.date
    ) AS order_json
FROM orders AS o;
