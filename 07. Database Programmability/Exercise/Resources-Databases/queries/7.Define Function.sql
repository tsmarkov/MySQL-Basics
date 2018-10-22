DELIMITER $$

DROP FUNCTION ufn_is_word_comprised;

CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BIT
BEGIN
	DECLARE result INT;
    DECLARE word_length INT;
    DECLARE char_index INT;
    
    SET result := 1;
    SET word_length := char_length(word);
    SET char_index := 1;
    
    WHILE (char_index <= word_length) DO
		IF (set_of_letters NOT LIKE (concat( '%', substring(word, char_index, 1), '%'))) 
			THEN SET result := 0;
        END IF;
        
        SET char_index = char_index + 1;
    END WHILE;
    RETURN result;
END
$$

SELECT ufn_is_word_comprised('oistmiahf', 'halves');