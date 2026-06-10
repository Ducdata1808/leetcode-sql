/* Write your T-SQL query statement below */
WITH temp AS (
SELECT
    buyer_id,
    CASE
        WHEN YEAR(order_date) = 2019 THEN 1
        ELSE 0
    END AS is_in_2019
FROM Orders
),
not_order AS (
    SELECT 
        u.user_id,
        u.join_date,
        0 AS orders_in_2019
    FROM Users AS u
    WHERE NOT EXISTS (
        SELECT
            o.buyer_id
        FROM Orders AS o
        WHERE o.buyer_id = u.user_id
    )
)
SELECT
    t.buyer_id,
    u.join_date,
    SUM(is_in_2019) AS orders_in_2019
FROM Users AS u
JOIN temp AS t
ON t.buyer_id = u.user_id
GROUP BY t.buyer_id, u.join_date
UNION(
    SELECT
        *
    FROM not_order
)
ORDER BY buyer_id ASC;