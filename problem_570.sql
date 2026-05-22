/* Write your T-SQL query statement below */
WITH temp AS (
    SELECT
        managerId,
        COUNT(managerId) AS reports
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)
SELECT
    name
FROM Employee
WHERE id IN (SELECT managerId FROM temp);