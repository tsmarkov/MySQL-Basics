USE hotel;

SET SQL_SAFE_UPDATES = 0;

# --- 20 ---

UPDATE `payments`
SET `tax_rate` = `tax_rate` * 0.97;

SELECT `tax_rate` FROM `payments`;

# --- 22 ---

TRUNCATE TABLE `occupancies`;
