/* Write your T-SQL query statement below */
WITH number_of_products AS (
    SELECT 
        customer_id,
        COUNT(DISTINCT product_key) AS quantity
    FROM Customer
    GROUP BY customer_id
)
SELECT 
    customer_id
FROM number_of_products
WHERE quantity = (SELECT COUNT(*) FROM Product);