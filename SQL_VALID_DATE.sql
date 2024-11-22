--HOW TO CHECK VALID DATE IN SQL QUERY.

CREATE TABLE ISDATETEST(ID INT, JOININGDATE VARCHAR(100));

INSERT INTO ISDATETEST SELECT 1,'12-DEC-2024';

INSERT INTO ISDATETEST SELECT 2,'22-OCT-2024';

INSERT INTO ISDATETEST SELECT 3,'12-NOV';

INSERT INTO ISDATETEST SELECT 4,'XYZ123';

INSERT INTO ISDATETEST SELECT 5,'2-FEB-2025';

SELECT * FROM ISDATETEST;

CREATE TABLE #VALIDDATE(ID INT, JOININGDATE DATETIME);

INSERT INTO #VALIDDATE SELECT ID,JOININGDATE FROM ISDATETEST; /* IT WILL SHOW ERROR "Conversion failed when converting date and/or time
                                                                 from character string.*/

-- ISDATE() 

-- IT WILL RETURN 1 FOR VALOD DATE AND 0 FOR INVALID DATE.

SELECT ISDATE(JOININGDATE),* FROM ISDATETEST;

INSERT INTO #VALIDDATE SELECT ID,JOININGDATE FROM ISDATETEST WHERE ISDATE(JOININGDATE) = 1;

SELECT * FROM #VALIDDATE;