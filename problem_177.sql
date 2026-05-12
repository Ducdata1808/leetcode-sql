CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        SELECT
            DISTINCT salary
        FROM(
            SELECT
                salary,
                DENSE_RANK() OVER (ORDER BY salary DESC) AS ranking
            FROM Employee
        ) AS temp
        WHERE ranking = @N
    );
END