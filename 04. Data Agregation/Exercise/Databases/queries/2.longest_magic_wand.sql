USE `gringotts`;

SELECT MAX(wizzard_deposits.magic_wand_size) AS `longest_magic_wand`
FROM wizzard_deposits
LIMIT 1;