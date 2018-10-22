USE geography;

SELECT p.peak_name, r.river_name,
	lower(
		concat(
			p.peak_name,
            right(r.river_name, char_length(r.river_name)-1)
        )
	) AS mix
FROM peaks AS p,
	rivers AS r
WHERE right(p.peak_name, 1) = left(r.river_name, 1)
ORDER BY mix;
