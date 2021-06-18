-- Two tables DEPT and EMP 
/* DEPT_ID INT PRIMARY KEY
DEPT_NAME VARCHAR(50)*/ 

/* EMP_ID INT PRIMARY KEY
EMP_NAME VARCHAR(50)
EMP_DEPT int REFERENCES DEPT(DEPT_ID)
EMP_SALARY decimal(10,2)*/ 

-- Update the department name to ADMINISTRATION instead of ADMIN
-- Create a new table called TEMP that contains all the records of EMP 
-- Increase employee salaries in EMP by 50% except for employees with highest salaries
-- Furthermore, raise the salary of all employees who are not in department number 10 by another $500

/* Something like
UPDATE ## SET ## WHERE ##;*/ 


ALTER TABLE albums
RENAME COLUMN Title to Title_test

UPDATE tracks
SET composer = 'AD/BC'
WHERE composer = 'AC/DC'

REATE TABLE  TEMP(
	AlbumId INTEGER PRIMARY KEY,
	title NVARCHAR,
	artistid INTEGER
);

--INSERT INTO TEMP
--SELECT albumid, title_test, artistid
--FROM albums


UPDATE tracks
SET bytes = bytes/100
WHERE bytes NOT IN (
SELECT bytes
FROM tracks
ORDER BY bytes DESC
LIMIT 10)

UPDATE tracks
SET unitprice = unitprice + 100
WHERE genreid = 20

