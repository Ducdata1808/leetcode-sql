/* Write your T-SQL query statement below */
SELECT
    class
FROM (
    SELECT
        class,
        COUNT(student) AS number_of_students
    FROM Courses
    GROUP BY class
) AS temp
WHERE number_of_students >= 5;