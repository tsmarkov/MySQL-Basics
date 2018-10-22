DELIMITER $$

SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS udf_count_colonists_by_destination_planet;

CREATE FUNCTION udf_count_colonists_by_destination_planet(planet_name VARCHAR (30))
RETURNS INT
BEGIN
	DECLARE count INT;
	SET count := (
		SELECT 
			count(tc.colonist_id) AS  colonists_count
		FROM spaceports AS sp
		JOIN journeys AS j
			ON j.destination_spaceport_id = sp.id
		JOIN travel_cards AS tc
			ON tc.journey_id = j.id
		JOIN planets AS p
			ON p.id = sp.planet_id
		WHERE p.name = planet_name
    );
    
    RETURN count;
END;
$$

SELECT p.name, udf_count_colonists_by_destination_planet('Otroyphus') AS count
FROM planets AS p
WHERE p.name = 'Otroyphus';