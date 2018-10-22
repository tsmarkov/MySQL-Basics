USE geography;

SELECT
	mc.country_code,
	count(m.mountain_range) AS mountain_range
FROM mountains_countries AS mc
JOIN mountains AS m
	ON mc.mountain_id = m.id
WHERE mc.country_code IN ('BG', 'RU', 'US')
GROUP BY mc.country_code
HAVING mountain_range > 0
ORDER BY count(m.mountain_range) DESC;