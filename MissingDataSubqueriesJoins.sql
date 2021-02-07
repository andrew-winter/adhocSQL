/* Please note: none of what I've written here belongs to any employer. This was written outside of work. Some of the data are similar but do not refer to anything owned by any employer. */



/* Sub-queries and joins to find information easier */
SELECT *
FROM EDF.dbo.rates-engine AS rs
INNER JOIN EDF.dbo.rates-category AS cs
	ON cs.ratecatID = rs.ratecatID
WHERE cs.ratecatID IN (
	SELECT DISTINCT ratecatID
	FROM EDF.dbo.rates-category
	WHERE issuerID = 30020 AND categoryendFrame = '6/30/2021') 


SELECT rs.ratecatID, rs.locID, rs.rateminage, COUNT(*) AS count
FROM EDF.dbo.rates-engine AS rs
INNER JOIN EDF.dbo.rates-category AS cs
	ON cs.ratecatID = rs.ratecatID
WHERE cs.ratecatID IN (
	SELECT DISTINCT ratecatID
	FROM EDF.dbo.rates-category
	WHERE issuerID = 30020 AND categoryendFrame = '6/30/2021') 
GROUP BY rs.ratecatID, rs.locID, rs.rateminage
ORDER BY count DESC



/* Where are there missing rates for particular ages and geographic locations? */
SELECT rs.locID, rs.rateminage, COUNT(*) AS count
FROM EDF.dbo.rates-engine AS rs
INNER JOIN EDF.dbo.rates-category AS cs
	ON cs.ratecatID = rs.ratecatID
WHERE cs.ratecatID IN (
	SELECT DISTINCT ratecatID
	FROM EDF.dbo.rates-category
	WHERE issuerID = 30020 AND categoryendFrame = '6/30/2021')
GROUP BY rs.locID, rs.rateminage
ORDER BY count DESC



/* What about particular ages and plans? */
SELECT rs.ratecatID, rs.rateminage, COUNT(*) AS count
FROM EDF.dbo.rates-engine AS rs
INNER JOIN EDF.dbo.rates-category AS cs
	ON cs.ratecatID = rs.ratecatID
WHERE cs.ratecatID IN (
	SELECT DISTINCT ratecatID
	FROM EDF.dbo.rates-category
	WHERE issuerID = 30020 AND categoryendFrame = '6/30/2021') 
GROUP BY rs.ratecatID, rs.rateminage
ORDER BY count DESC


SELECT rs.ratecatID, rs.rateminage, COUNT(*) AS count
FROM EDF.dbo.rates-engine AS rs
INNER JOIN EDF.dbo.rates-category AS cs
	ON cs.ratecatID = rs.ratecatID
WHERE rs.ratecatID LIKE '67107%' AND issuerID = 30020
GROUP BY rs.ratecatID, rs.rateminage
ORDER BY count DESC