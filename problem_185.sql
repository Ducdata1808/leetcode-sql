SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee AS e
JOIN Department AS d
ON e.departmentId = d.id
WHERE Salary IN (
    SELECT salary
    FROM(
        SELECT
            salary,
            departmentId,
            DENSE_RANK() OVER(ORDER BY salary DESC) AS ranking
        FROM Employee AS e2
        WHERE e2.departmentId = e.departmentId
    ) AS temp
    WHERE temp.ranking = 1 OR temp.ranking = 2 OR temp.ranking = 3
)
ORDER BY Department;