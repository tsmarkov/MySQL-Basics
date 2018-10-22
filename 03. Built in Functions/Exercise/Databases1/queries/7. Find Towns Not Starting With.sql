USE soft_uni;

SELECT t.town_id, t.name
FROM towns AS t
WHERE LEFT(t.name, 1) NOT IN('R', 'B', 'D')
ORDER BY t.name;
