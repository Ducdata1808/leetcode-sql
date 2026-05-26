/* Write your T-SQL query statement below */
WITH high_visit AS(
    SELECT *
    FROM Stadium
    WHERE people >= 100
)
SELECT *
FROM high_visit AS h1
WHERE (id + 1 = (SELECT id FROM high_visit AS h2 WHERE h2.id = h1.id + 1) AND id + 2 = (SELECT id FROM high_visit AS h3 WHERE h3.id = h1.id + 2))
    OR (id - 1 = (SELECT id FROM high_visit AS h2 WHERE h2.id = h1.id - 1) AND id - 2 = (SELECT id FROM high_visit AS h3 WHERE h3.id = h1.id - 2))
    OR (id + 1 = (SELECT id FROM high_visit AS h2 WHERE h2.id = h1.id + 1) AND id - 1 = (SELECT id FROM high_visit AS h3 WHERE h3.id = h1.id - 1));