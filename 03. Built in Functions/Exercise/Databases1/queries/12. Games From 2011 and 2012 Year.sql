USE diablo;

SELECT g.name, date_format(g.start, '%Y-%m-%d') AS start
FROM games AS g
WHERE extract(year FROM g.start) BETWEEN 2011 AND 2012
ORDER BY g.start, g.name
LIMIT 50;