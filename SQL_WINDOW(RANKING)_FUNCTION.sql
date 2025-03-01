-- RANKING FUNCTION

-- RANK, DENSE_RANK, ROW_NUMBER, NTILE.


SELECT * FROM EMPLOYEES;

SELECT * INTO EMPLOYEESDUP FROM EMPLOYEES;

SELECT * FROM EMPLOYEESDUP;

-- ADD A COLUMN IN EXISTING TABLE.

ALTER TABLE EMPLOYEESDUP ADD DEPARTMENT VARCHAR(100);

INSERT INTO EMPLOYEESDUP(EMP_ID,NAME,GENDER,AGE,SALARY) VALUES(202,'GAURAV','MALE',29,560000);

INSERT INTO EMPLOYEESDUP(EMP_ID,NAME,GENDER,AGE,SALARY) VALUES(209,'AMAN','MALE',25,560000);

INSERT INTO EMPLOYEESDUP(EMP_ID,NAME,GENDER,AGE,SALARY) VALUES(211,'NISHA','FEMALE',25,460000);

INSERT INTO EMPLOYEESDUP(EMP_ID,NAME,GENDER,AGE,SALARY) VALUES(212,'GARIMA','FEMALE',29,500000);

INSERT INTO EMPLOYEESDUP(EMP_ID,NAME,GENDER,AGE,SALARY) VALUES(213,'PRIYA','FEMALE',27,650000);

INSERT INTO EMPLOYEESDUP(EMP_ID,NAME,GENDER,AGE,SALARY) VALUES(214,'KRISHNA','MALE',27,160000);

-- INSERT A DATA IN A PARTICULAR COLUMN OF TABLE.

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'IT' WHERE EMP_ID = 201;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'BPO' WHERE EMP_ID = 202;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'BPO' WHERE EMP_ID = 203;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'IT' WHERE EMP_ID = 204;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'IT' WHERE EMP_ID = 205;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'IT' WHERE EMP_ID = 214;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'BPO' WHERE EMP_ID = 206;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'IT' WHERE EMP_ID = 207;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'IT' WHERE EMP_ID = 208;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'BPO' WHERE EMP_ID = 209;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'BPO' WHERE EMP_ID = 210;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'IT' WHERE EMP_ID = 211;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'IT' WHERE EMP_ID = 212;

UPDATE EMPLOYEESDUP SET DEPARTMENT = 'BPO' WHERE EMP_ID = 213;

SELECT * FROM EMPLOYEESDUP ORDER BY SALARY DESC;

-- RANK()

SELECT *, RANK() OVER(ORDER BY SALARY DESC) AS RANKS FROM EMPLOYEESDUP;

SELECT *, RANK() OVER(ORDER BY AGE DESC) AS RANKS FROM EMPLOYEESDUP;

-- WRITE A QUERY TO RETURN THE HIGHEST SALARY OF EACH DEPARMENT.

SELECT RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RANKS, * FROM EMPLOYEESDUP;

--DENSE_RANK()

SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RANKS FROM EMPLOYEESDUP;

SELECT *, DENSE_RANK() OVER(ORDER BY AGE DESC) AS RANKS FROM EMPLOYEESDUP;

-- WRITE A QUERY TO RETURN THE HIGHEST SALARY OF EACH DEPARMENT.

SELECT DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DENSE_RANKS , * FROM EMPLOYEESDUP;

--ROW_NUMBER()

SELECT *,ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS SEQUENCES FROM EMPLOYEESDUP;

SELECT *, ROW_NUMBER() OVER(ORDER BY AGE DESC) AS SEQUENCES FROM EMPLOYEESDUP; 

SELECT ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS SEQUENCES, * FROM EMPLOYEESDUP;

-- NTILE()

SELECT * , NTILE(4) OVER(ORDER BY SALARY DESC) AS NTILES_COUNT FROM EMPLOYEESDUP;

SELECT * INTO #TEMPEMP FROM EMPLOYEESDUP;

SELECT * FROM #TEMPEMP;

DROP TABLE #TEMPEMP;

SELECT * , NTILE(4) OVER(ORDER BY SALARY DESC) AS NTILES_COUNT INTO #TEMPEMP FROM EMPLOYEESDUP;

-- WRITE A QUERY TO RETRIEVE 25% RECORD FROM #TEMPEMP TABLE.

SELECT * FROM #TEMPEMP WHERE NTILES_COUNT = 1;

-- WRITE A QUERY TO RETRIEVE 50% RECORD FROM #TEMPEMP TABLE.

SELECT * FROM #TEMPEMP WHERE NTILES_COUNT IN (1,2);

--=================== How to find Nth(1st,2nd,3rd....N) Highest Salary ===============================================================

-- 1) BY TEMP TABLE AND DENSE_RANK().

SELECT * FROM EMPLOYEESDUP;

-- SELECT TOP 5 SALARY.

SELECT TOP 5 * FROM EMPLOYEESDUP;  --This query retrieves the first 5 rows from the EMPLOYEESDUP table without any specific ordering.

SELECT TOP 5 * FROM EMPLOYEESDUP ORDER BY SALARY DESC;-- The second query will specifically return the 5 employees with the highest salaries.

-- 1) BY USING TEMP TABLE.

SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANKS FROM EMPLOYEESDUP;

SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANKS INTO #HIGHESTSALARY FROM EMPLOYEESDUP;

SELECT * FROM #HIGHESTSALARY;

SELECT * FROM #HIGHESTSALARY WHERE DENSE_RANKS = 3;

SELECT * FROM #HIGHESTSALARY WHERE DENSE_RANKS = 2;

SELECT * FROM #HIGHESTSALARY WHERE DENSE_RANKS = 5;

-- WRITE A SQL QUERY TO FIND THE 3RD HIGHEST SALARY OF IT DEPARTMENT.

SELECT *, DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DENSE_RANKS INTO #DEPARTMENTSALARY FROM EMPLOYEESDUP;

SELECT * FROM #DEPARTMENTSALARY;

SELECT * FROM #DEPARTMENTSALARY WHERE DENSE_RANKS = 2 AND DEPARTMENT = 'BPO'; 

SELECT * FROM #DEPARTMENTSALARY WHERE DENSE_RANKS = 4 AND DEPARTMENT = 'IT'; 

