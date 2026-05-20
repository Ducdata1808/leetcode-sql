/* Write your T-SQL query statement below */

SELECT
    id
FROM Weather AS w1
WHERE temperature > (
    SELECT
        temperature
    FROM Weather AS w2
    WHERE DATEADD(DAY, 1, w2.recordDate) = w1.recordDate
)