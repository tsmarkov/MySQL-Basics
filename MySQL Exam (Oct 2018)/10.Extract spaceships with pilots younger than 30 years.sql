SELECT
	ss.id,
	ss.name,
    ss.manufacturer,
    c.birth_date
FROM spaceships AS ss
JOIN journeys AS j
	ON j.spaceship_id = ss.id
JOIN travel_cards AS tc
	ON tc.journey_id = j.id
JOIN colonists AS c
	ON c.id = tc.colonist_id AND job_during_journey = 'Pilot'
WHERE (c.birth_date + INTERVAL 30 YEAR) > str_to_date('2019-01-01', '%Y-%m-%d') 
GROUP BY ss.name
ORDER BY ss.name;