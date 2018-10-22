USE geography;

SELECT 
	c.country_name,
    r.river_name
FROM continents AS cont
LEFT JOIN countries AS c
	ON cont.continent_code = c.continent_code
LEFT JOIN countries_rivers AS cr
	ON c.country_code = cr.country_code
LEFT JOIN rivers AS r
	ON cr.river_id = r.id
WHERE cont.continent_name = 'Africa'
ORDER BY c.country_name ASC
LIMIT 5;