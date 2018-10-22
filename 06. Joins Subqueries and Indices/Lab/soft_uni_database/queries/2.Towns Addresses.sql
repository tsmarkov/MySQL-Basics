USE soft_uni;

SELECT 
	t.town_id, 
    t.name AS town_name,
    a.address_text
FROM addresses AS a
LEFT JOIN towns AS t
ON a.town_id = t.town_id
WHERE t.name IN ('Sofia', 'San Francisco', 'Carnation')
ORDER BY t.town_id, a.address_id;