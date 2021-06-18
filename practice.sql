SELECT artistid, name,
CASE
	WHEN artistid BETWEEN 1 AND 10
		THEN 'LOW'
	ELSE 'MEDIUM'
END ranking
FROM artists