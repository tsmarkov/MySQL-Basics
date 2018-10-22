USE geography;

SELECT
	c.country_name,
    max(p.elevation) AS highest_peak_elevation,
	max(r.length) AS longest_river_length
FROM countries AS c
LEFT JOIN mountains_countries AS mc
	ON c.country_code = mc.country_code
LEFT JOIN countries_rivers as cr
	ON c.country_code = cr.country_code
LEFT JOIN peaks AS p
	ON mc.mountain_id = p.mountain_id
LEFT JOIN rivers AS r
	ON cr.river_id = r.id
GROUP BY c.country_code
ORDER BY highest_peak_elevation DESC,
	longest_river_length DESC,
    country_name ASC
LIMIT 5;

/*
SELECT c.country_name,
       max(p.elevation)as highest_peak_elevation,
       max(r.length)as longest_river_length
from countries as c
left join mountains_countries as mc
on mc.country_code=c.country_code
left join peaks as p
on mc.mountain_id=p.mountain_id
left join countries_rivers as cr
on c.country_code=cr.country_code
left join rivers as r
on cr.river_id=r.id
group by c.country_name
order by highest_peak_elevation desc,
longest_river_length desc, c.country_name asc
limit 5;
*/