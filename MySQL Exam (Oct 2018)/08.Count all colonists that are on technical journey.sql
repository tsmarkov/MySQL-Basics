SELECT
	count(c.id)
FROM travel_cards AS tc
JOIN colonists AS c
	ON c.id = tc.colonist_id
JOIN journeys AS j
	ON j.id = tc.journey_id AND j.purpose = 'Technical';
