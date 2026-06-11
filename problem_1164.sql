/* Write your T-SQL query statement below */
WITH latest_update AS (
    SELECT 
        product_id,
        MAX(change_date) AS newest_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
),
merge_price AS (
    SELECT
        l.product_id,
        p.new_price,
        l.newest_date
    FROM latest_update AS l
    JOIN products AS p
    ON l.product_id = p.product_id AND l.newest_date = p.change_date
)
SELECT
    DISTINCT p.product_id,
    CASE 
        WHEN p.product_id IN (SELECT product_id FROM merge_price) THEN (SELECT new_price FROM merge_price AS m WHERE m.product_id = p.product_id)
        ELSE 10
    END AS price
FROM Products AS p;

-- window function
SELECT Product_id, new_Price as Price
FROM (
    SELECT Product_id, new_Price, 
    ROW_NUMBER() OVER (Partition BY Product_id Order BY Change_date DESC) AS RN
    FROM 
    (
        SELECT * 
        FROM Products

        UNION 

        SELECT Product_id, 10 AS new_Price, '0001-01-01' as change_date
        FROM Products
    ) Pn
    WHERE Change_date <= '2019-08-16'
) PC
WHERE PC.RN = 1
ORDER BY Price DESC