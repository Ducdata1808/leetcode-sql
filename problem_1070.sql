/* Write your T-SQL query statement below */
WITH temp AS (
    SELECT
        product_id,
        year,
        RANK() OVER(PARTITION BY product_id ORDER BY year ASC) AS orders,
        quantity,
        price
    FROM Sales
)
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM temp
WHERE orders = 1; 