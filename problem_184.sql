/* Write your T-SQL query statement below */

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee AS e
JOIN Department AS d
ON e.departmentId = d.id
WHERE Salary = (
    SELECT
        MAX(salary)
    FROM Employee as e2
    WHERE e2.departmentId = e.departmentId
)