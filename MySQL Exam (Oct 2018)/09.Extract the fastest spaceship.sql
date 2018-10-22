SELECT
	ss.name AS spaceship_name,
    sp.name AS spaceport_name
FROM journeys AS j
JOIN spaceships AS ss
	ON ss.id = j.spaceship_id
JOIN spaceports AS sp
	ON sp.id = j.destination_spaceport_id
ORDER BY ss.light_speed_rate DESC
LIMIT 1;