USE geography;

SELECT mountain_range, peak_name, elevation AS peak_elevation
FROM mountains AS m
JOIN peaks AS p
ON m.id = p.mountain_id
WHERE m.mountain_range = 'Rila'
ORDER BY peak_elevation DESC;