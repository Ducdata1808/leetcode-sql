/* Write your T-SQL query statement below */
WITH temp AS(
    SELECT  
        customer_number,
        COUNT(order_number) AS number_of_orders
    FROM Orders
    GROUP BY customer_number
)
SELECT
    customer_number
FROM temp
WHERE number_of_orders = (
    SELECT
        MAX(number_of_orders)
    FROM temp
);