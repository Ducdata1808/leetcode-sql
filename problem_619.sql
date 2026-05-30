/* Write your T-SQL query statement below */
SELECT
    MAX(num) AS num
FROM (
    SELECT
        num,
        COUNT(*) OVER(PARTITION BY (num)) AS times
    FROM MyNumbers
) AS temp
WHERE times = 1;