DELETE c
FROM colonists AS c
LEFT JOIN travel_cards AS tc
	ON tc.colonist_id = c.id
WHERE tc.id IS NULL;
