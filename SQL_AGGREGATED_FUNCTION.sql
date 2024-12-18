
-- REAL TIME USE CASES OF AGGREGATED FUNCTION.

SELECT * FROM EMPLOYEESDUP;

-- ============================ AVG() =========================================

/* WRITE A QUERY TO EXTRACT ALL EMPLOYEES WHO HAVE SALARIES HIGHER THAN THEN THE AVERAGE OF THEIR DEPARTMENT. */

SELECT DEPARTMENT, AVG(SALARY) AS AVGSALARY FROM EMPLOYEESDUP GROUP BY DEPARTMENT;

SELECT * FROM EMPLOYEESDUP T1
JOIN (SELECT DEPARTMENT, AVG(SALARY) AS AVGSALARY FROM EMPLOYEESDUP GROUP BY DEPARTMENT) AS T2
ON T1.DEPARTMENT = T2.DEPARTMENT
WHERE T1.SALARY > T2.AVGSALARY;

-- ============================ COUNT() =========================================

-- FIND THE LIST OF CUSTOMERS WHO ARE MARRIED AND THERE IS NO MIDDLE NAME.


SELECT * FROM CUSTOMER_DUP;

ALTER TABLE CUSTOMER_DUP DROP COLUMN GENDER;

ALTER TABLE CUSTOMER_DUP ADD MARITALSTATUS VARCHAR(10);

UPDATE CUSTOMER_DUP
SET MARITALSTATUS = 'M'
WHERE (CUSTOMERID % 2 = 0) AND TITLE = 'Mr.';

UPDATE CUSTOMER_DUP
SET MARITALSTATUS = 'S'
WHERE (CUSTOMERID % 2 != 0) AND TITLE = 'Mr.';

UPDATE CUSTOMER_DUP
SET MARITALSTATUS = 'M'
WHERE (CUSTOMERID % 2 = 0) AND TITLE = 'MS.';

UPDATE CUSTOMER_DUP
SET MARITALSTATUS = 'S'
WHERE (CUSTOMERID % 2 != 0) AND TITLE = 'Ms.';

---- FIND THE LIST OF CUSTOMERS WHO ARE MARRIED AND THERE IS A MIDDLE NAME.

SELECT MARITALSTATUS,COUNT(MIDDLENAME) FROM CUSTOMER_DUP GROUP BY MARITALSTATUS HAVING MARITALSTATUS = 'M';

SELECT *  FROM CUSTOMER_DUP WHERE MARITALSTATUS = 'M' AND MIDDLENAME IS NULL;

-- ==================================== SUM() ===================================================

SELECT * FROM SALESLT.PRODUCT;

-- FIND THE TOTAL LISTPRICE FOR EACH COLOR.

SELECT COLOR,CONVERT(INT,SUM(LISTPRICE)) FROM SALESLT.PRODUCT GROUP BY COLOR;

SELECT COLOR,CONVERT(INT,SUM(LISTPRICE)) FROM SALESLT.PRODUCT GROUP BY COLOR HAVING COLOR = 'WHITE';

-- ============================= MAX() AND MIN() =========================================================





