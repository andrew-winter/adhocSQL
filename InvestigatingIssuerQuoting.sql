/* Please note: none of what I've written here belongs to any employer. This was written outside of work. Some of the data are similar but do not refer to anything owned by any employer. */



/* In two different time frames, what records can I expect to match? */
SELECT COUNT(*) AS count, responseID, response1, response2, response3, response4, response5, response6, response7, response8, response9, 
response10, response11, response12, response13, response14, response15
FROM ZDF.dbo.responses-legacy 
WHERE issuerID IN (80854, 80855, 80867, 80868) AND startframeID = 610 AND responseID NOT in (30)
GROUP BY responseID, response1, response2, response3, response4, response5, response6, response7, response8, response9, 
response10,response11,response12,response13,response14,response15
ORDER BY responseID


SELECT COUNT(*) AS count, responseID, response1, response2, response3, response4, response5, response6, response7, response8, response9, 
response10,response11,response12,response13,response14,response15
FROM ZDF.dbo.responses-legacy 
WHERE issuerID IN (80854, 80855, 80867, 80868) AND startframeID = 620 AND responseID NOT in (30)
GROUP BY responseID, response1, response2, response3, response4, response5, response6, response7, response8, response9, 
response10,response11,response12,response13,response14,response15
ORDER BY responseID



/* What about general eligibility to quote ? */
SELECT COUNT(*) AS record_count, minAge, maxAge, reltypeID, nearby, eligibleID
FROM ZDF.dbo.member-eligible 
WHERE issuerID IN (80854, 80855, 80867, 80868) AND startframeID = 610 and reltypeID in (1, 2, 3, 11, 19, 27, 31, 35)
GROUP BY minAge, maxAge, reltypeID, nearby, eligibleID
ORDER BY reltypeID, record_count DESC


SELECT COUNT(*) AS record_count, minAge, maxAge, reltypeID, nearby, eligibleID
FROM ZDF.dbo.member-eligible 
WHERE issuerID IN (80854, 80855, 80867, 80868) AND startframeID = 620 and reltypeID in (1, 2, 3, 11, 19, 27, 31, 35)
GROUP BY minAge, maxAge, reltypeID, nearby, eligibleID
ORDER BY reltypeID, record_count DESC



/* For particular subset responseIDs, is there anything new to 2021 ? */
SELECT DISTINCT responseID, response1, response2, response3, response4, response5, response6, response7, response8,
response9, response10,response11,response12, response13,response14,response15
FROM ZDF.dbo.responses-legacy
WHERE issuerID in (80854, 80855, 80867, 80868) AND startframeID = 620 /* 2021 */
AND responseID in (18, 26, 50, 51, 52, 54, 55)
EXCEPT
SELECT DISTINCT responseID, response1, response2, response3, response4, response5, response6, response7, response8,
response9, response10,response11,response12, response13,response14,response15
FROM ZDF.dbo.responses-legacy
WHERE issuerID in (80854, 80855, 80867, 80868) AND startframeID = 610 /* 2020 */
AND responseID in (18, 26, 50, 51, 52, 54, 55)



/* Easier to read 2021 and then 2020 */
SELECT DISTINCT responseID, response1, response2, response3, response4, response5, response6, response7, response8,
response9, response10,response11,response12, response13,response14,response15
FROM ZDF.dbo.responses-legacy
WHERE issuerID in (80854, 80855, 80867, 80868) AND startframeID = 620 /* 2021 */
AND responseID in (18, 26, 50, 51, 52, 54, 55)


SELECT DISTINCT responseID, response1, response2, response3, response4, response5, response6, response7, response8,
response9, response10,response11,response12, response13,response14,response15
FROM ZDF.dbo.responses-legacy
WHERE issuerID in (80854, 80855, 80867, 80868) AND startframeID = 610 /* 2020 */
AND responseID in (18, 26, 50, 51, 52, 54, 55)



/* Misc checks for other data */
SELECT *
FROM ZDF.dbo.responses-legacy
WHERE issuerID in (80854, 80855, 80867, 80868) AND startframeID = 620
AND responseID in (29, 53, 70, 71, 72, 73, 74, 75, 76)
ORDER BY responseID


SELECT DISTINCT responseID
FROM ZDF.dbo.responses-legacy
WHERE issuerID in (80854, 80855, 80867, 80868) AND startframeID = 620 /* 2021 */
ORDER BY responseID