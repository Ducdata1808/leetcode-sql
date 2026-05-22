/* Write your T-SQL query statement below */
WITH temp AS (
    SELECT
        DISTINCT player_id,
        MIN(event_date) AS first_login
    FROM activity
    GROUP BY player_id
)
SELECT
    ROUND(CAST(COUNT(a.player_id) AS FLOAT) / (SELECT COUNT(player_id) FROM temp), 2) AS fraction
FROM temp AS t
JOIN activity AS a
ON t.player_id = a.player_id
    AND DATEADD(DAY, 1, t.first_login) = a.event_date;