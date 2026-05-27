/* Write your T-SQL query statement below */

WITH request_table AS (
    SELECT
        DISTINCT requester_id,
        COUNT(requester_id) AS number_of_requests
    FROM RequestAccepted
    GROUP BY requester_id
),
accept_table AS (
    SELECT
        DISTINCT accepter_id,
        COUNT(accepter_id) AS number_of_accepts
    FROM RequestAccepted
    GROUP BY accepter_id
),
number_of_friends AS (
    SELECT
        id,
        SUM(num) AS num
    FROM (
        SELECT 
            requester_id AS id,
            number_of_requests AS num
        FROM request_table
        UNION ALL
        SELECT
            accepter_id,
            number_of_accepts
        FROM accept_table
    ) AS temp
    GROUP BY id
)
SELECT
    TOP 1 *
FROM number_of_friends
ORDER BY num DESC;