SELECT 
	tc.job_during_journey AS job_name
FROM (
	SELECT 
		j.id,
		p.name AS planet_name,
		sp.name AS spaceport_name,
		j.purpose AS journey_purpose
	FROM journeys as j
	JOIN spaceports AS sp
		ON sp.id = j.destination_spaceport_id
	JOIN planets AS p
		ON p.id = sp.planet_id
	ORDER BY timestampdiff(second, j.journey_start, j.journey_end) DESC
	LIMIT 1
) AS t1
JOIN travel_cards AS tc
	ON tc.journey_id = t1.id
GROUP BY tc.job_during_journey
ORDER BY count(tc.job_during_journey)
LIMIT 1;
