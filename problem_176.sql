/* Write your T-SQL query statement below */
SELECT (
    SELECT DISTINCT(salary)
    FROM (
        SELECT
            salary,
            DENSE_RANK() OVER (ORDER BY salary DESC) AS ranking
        FROM Employee
    ) AS temp
    WHERE ranking = 2
) AS SecondHighestSalary