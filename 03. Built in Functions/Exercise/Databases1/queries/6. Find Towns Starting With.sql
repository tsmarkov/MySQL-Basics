USE soft_uni;

SELECT t.town_id, t.name
FROM towns AS t
WHERE LEFT(t.name, 1) IN('M', 'K', 'B', 'E')
ORDER BY t.name;