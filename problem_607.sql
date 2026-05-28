/* Write your T-SQL query statement below */
WITH not_related_RED AS (
    SELECT
        sales_id
    FROM SalesPerson
    EXCEPT(
        SELECT
            o.sales_id
        FROM Orders AS o
        JOiN Company AS c
        ON o.com_id = c.com_id
        WHERE c.name = 'RED')
)
SELECT
    DISTINCT name
FROM SalesPerson
WHERE sales_id IN (SELECT * FROM not_related_RED);
