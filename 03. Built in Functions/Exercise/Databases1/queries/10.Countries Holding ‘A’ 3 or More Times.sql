USE geography;

SELECT c.country_name, c.iso_code
FROM countries AS c
WHERE c.country_name LIKE '%a%a%a%'
ORDER BY c.iso_code;