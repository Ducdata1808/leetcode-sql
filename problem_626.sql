/* Write your T-SQL query statement below */
WITH temp AS (
    SELECT
        id,
        student,
        LEAD(student) OVER(ORDER BY id) AS next_student,
        LAG(student) OVER(ORDER BY id) AS prev_student
    FROM Seat
)
SELECT
    id,
    CASE
        WHEN id % 2 = 1 AND next_student IS NOT NULL THEN next_student
        WHEN id % 2 = 0 THEN prev_student
        ELSE student
    END AS student
FROM temp;