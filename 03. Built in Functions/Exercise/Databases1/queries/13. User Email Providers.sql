USE diablo;

SELECT user_name,
    (
		substring(u.email, locate('@', u.email) + 1, char_length(u.email))
    ) as provider
FROM users AS u
ORDER BY provider, user_name;
