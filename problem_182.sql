SELECT
    email
FROM(
    SELECT
        DISTINCT(email),
        COUNT(id) AS count
    FROM Person
    GROUP BY email
) AS temp
WHERE count >= 2;

