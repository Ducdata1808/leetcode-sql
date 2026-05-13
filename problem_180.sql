/* Write your T-SQL query statement below */
SELECT
    DISTINCT num AS ConsecutiveNums
FROM Logs AS l1
WHERE num = (SELECT num FROM Logs AS l2 WHERE l1.id - 1 = l2.id)
AND num = (SELECT num FROM Logs AS l3 WHERE l1.id + 1 = l3.id);