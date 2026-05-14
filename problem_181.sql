/* Write your T-SQL query statement below */

SELECT
    employee_name AS Employee
FROM(
    SELECT
        a.name AS employee_name,
        a.salary AS employee_salary,
        b.salary AS manager_salary
    FROM Employee AS a
    JOIN Employee AS b
    ON a.managerId = b.id
) AS temp
WHERE employee_salary > manager_salary;
