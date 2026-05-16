/* Write your T-SQL query statement below */
SELECT
    customer_name AS Customers
FROM(
    SELECT
        c.name  AS customer_name,
        o.id AS order_id
    FROM Customers AS c
    LEFT JOIN Orders AS o
    ON c.id = o.customerId
) AS temp
WHERE order_id IS NULL;