/* Write your T-SQL query statement below */
WITH temp AS (
    SELECT 
        p.product_id
    FROM Product AS p
    RIGHT JOIN Sales AS s
    ON p.product_id = s.product_id
    WHERE s.sale_date < '2019-01-01' OR s.sale_date > '2019-03-31'
),
not_use_product AS(
    SELECT  
        p.product_id
    FROM Product AS p
    WHERE NOT EXISTS (
        SELECT
            s.product_id
        FROM Sales AS s
        WHERE p.product_id = s.product_id
    )
)
SELECT
    p.product_id,
    p.product_name
FROM Product AS p
WHERE NOT EXISTS(
    SELECT
        t.product_id          
    FROM temp AS  t
    WHERE p.product_id = t.product_id
)
AND NOT EXISTS (
    SELECT
        n.product_id
    FROM not_use_product AS n
    WHERE p.product_id = n.product_id
);
