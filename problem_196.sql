/* Write your T-SQL query statement below */
DELETE p1
FROM Person p1
WHERE email IN (
    SELECT
        email
    FROM Person AS p2
    WHERE p1.id > p2.id
)

