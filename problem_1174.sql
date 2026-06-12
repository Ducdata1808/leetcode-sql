/* Write your T-SQL query statement below */
WITH first_order AS (
    SELECT 
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date ASC) AS date_rank
    FROM Delivery
),
immediate_order AS (
    SELECT
        customer_id
    FROM first_order
    WHERE date_rank = 1 AND order_date = customer_pref_delivery_date
)
SELECT
    CAST(COUNT(*) * 1.0 / (SELECT COUNT(customer_id) FROM first_order WHERE date_rank = 1) * 100 AS DECIMAL(10, 2)) AS immediate_percentage
FROM immediate_order;