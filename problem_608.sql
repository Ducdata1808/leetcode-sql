/* Write your T-SQL query statement below */
WITH root_table AS (
    SELECT
        id
    FROM Tree
    WHERE p_id IS NULL
),
leaf_table AS (
    SELECT
        id
    FROM Tree AS t1
    WHERE NOT EXISTS(
        SELECT
            t2.p_id
        FROM Tree AS t2
        WHERE t1.id = t2.p_id
    )
)
SELECT
    id,
    CASE
        WHEN id IN (SELECT * FROM root_table) THEN 'Root'
        WHEN id IN (SELECT * FROM leaf_table) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree;