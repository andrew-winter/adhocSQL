/* General Query Structure */
SELECT * 
FROM ZDFIMAGE_STG.ZDF.dbo.member-eligible 
WHERE issuerID = 40263 and periodID = 615 and
planID = 'AZSMI05'
ORDER BY reltypeID


SELECT * FROM ZDF.dbo.member-eligible
WHERE issuerID in (40266, 40267, 40274)
ORDER BY reltypeID


/* Find an issuer */
SELECT *
FROM ZDF.dbo.issuers
WHERE loclicense = 'LA' AND 
issuername LIKE '%blue%' OR issuername LIKE 'an%'


/* For a set of issuers, which zips should they all be available? */
SELECT zipcode, countyname, COUNT(*) AS zip_count
FROM EDF.dbo.zipcodes
WHERE  issuerID in (71070, 71071, 71074, 71076, 8615) AND startframeID = 620
GROUP BY zipcode, countyname
ORDER BY zip_count DESC


/* Counties? */
SELECT countyID, COUNT(*) AS county_count
FROM EDF.dbo.areacounties
WHERE issuerID in (71070, 71071, 71074, 71076, 8615) AND startframeID = 620
GROUP BY countyID
ORDER BY county_count DESC


/* General method to find rates using a issuerID, not rates-categorys */
SELECT *
FROM ZDF.dbo.rates-engine
WHERE ratecatID IN (
    SELECT DISTINCT ratecatID
	FROM ZDF.dbo.rates-category
	WHERE issuerID IN (71802) AND startframeID = 620)


/* General method to find rates using specific planIDs */
SELECT *
FROM EDF.dbo.rates-engine AS rs
INNER JOIN EDF.dbo.rates-category AS cs
	ON cs.ratecatID = rs.ratecatID
WHERE cs.ratecatID IN (
	SELECT DISTINCT ratecatID
	FROM EDF.dbo.rates-category
	WHERE issuerID = 30020 AND categoryendFrame = '6/30/2021') 
AND locID = 9 AND rateminage IN (47, 48)