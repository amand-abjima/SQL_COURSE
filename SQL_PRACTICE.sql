CREATE DATABASE WORKER;
GO

USE WORKER;

CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');

SELECT * FROM WORKER;

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2023-02-20'),
    (2, 3000, '2023-06-11'),
    (3, 4000, '2023-02-20'),
    (1, 4500, '2023-02-20'),
    (2, 3500, '2023-06-11');

SELECT * FROM BONUS;

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2023-02-20 00:00:00'),
    (2, 'Executive', '2023-06-11 00:00:00'),
    (8, 'Executive', '2023-06-11 00:00:00'),
    (5, 'Manager', '2023-06-11 00:00:00'),
    (4, 'Asst. Manager', '2023-06-11 00:00:00'),
    (7, 'Executive', '2023-06-11 00:00:00'),
    (6, 'Lead', '2023-06-11 00:00:00'),
    (3, 'Lead', '2023-06-11 00:00:00');

SELECT * FROM WORKER;

SELECT * FROM BONUS;

SELECT * FROM TITLE;

-- Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.

SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;

-- Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.

SELECT UPPER(FIRST_NAME) FROM WORKER;

-- Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.

SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;

-- Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.

SELECT LEFT(FIRST_NAME,3) FROM WORKER;

SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;

-- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.

SELECT CHARINDEX('A','AMITABH') FROM WORKER;

-- Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.

SELECT RTRIM(FIRST_NAME,' ') FROM WORKER;

-- Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.

SELECT LTRIM(DEPARTMENT,' ') FROM WORKER;

-- Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.

SELECT DEPARTMENT, LEN(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;

-- Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.

SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER;

/* Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME.
A space char should separate them. */

SELECT FIRST_NAME+' '+LAST_NAME AS COMPLETE_NAME FROM WORKER;

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME FROM WORKER;

-- SELECT FIRST_NAME || ' ' || LAST_NAME AS COMPLETE_NAME FROM WORKER;   ORACLE QUERY

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

SELECT * FROM WORKER ORDER BY FIRST_NAME;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT * FROM WORKER ORDER BY FIRST_NAME ASC,DEPARTMENT DESC;

-- Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.

SELECT * FROM WORKER WHERE FIRST_NAME IN('VIPUL','SATISH');

-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.

SELECT * FROM WORKER WHERE FIRST_NAME NOT IN('VIPUL','SATISH');

-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

SELECT * FROM WORKER WHERE DEPARTMENT = 'ADMIN';

-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%A%';

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%A';

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____H';

-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000

SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;

-- Write an SQL query to print details of the Workers who joined in Feb 2021.

SELECT * FROM WORKER WHERE MONTH(JOINING_DATE) = '02' AND YEAR(JOINING_DATE) ='2021';

-- SELECT * FROM WORKER WHERE JOINING_DATE BETWEEN '02/01/2021' AND '02/29/2021';

SELECT * FROM WORKER WHERE JOINING_DATE BETWEEN '2021-02-01' AND '2021-02-28';

-- Write an SQL query to fetch the count of employees working in the department ‘Admin’.

SELECT COUNT(*) FROM WORKER WHERE DEPARTMENT = 'ADMIN';

-- Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT FIRST_NAME+' '+LAST_NAME,SALARY FROM WORKER WHERE SALARY >= 50000 AND SALARY <= 100000;

SELECT FIRST_NAME+' '+LAST_NAME,SALARY FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000;

-- Write an SQL query to fetch the number of workers for each department in descending order.

SELECT DEPARTMENT,COUNT(*) AS TOTALEMPLOYEE FROM WORKER GROUP BY DEPARTMENT ORDER BY  TOTALEMPLOYEE DESC;

-- Write an SQL query to print details of the Workers who are also Managers.

SELECT * FROM WORKER W JOIN TITLE T ON W.WORKER_ID = T.WORKER_REF_ID WHERE T.WORKER_TITLE = 'MANAGER';

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE FROM Worker W INNER JOIN Title T 
ON W.WORKER_ID = T.WORKER_REF_ID AND T.WORKER_TITLE in ('Manager');

-- Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT DEPARTMENT,COUNT(*) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(*) > 1;

SELECT WORKER_TITLE,AFFECTED_FROM,COUNT(*) FROM TITLE GROUP BY WORKER_TITLE,AFFECTED_FROM HAVING COUNT(*) > 1;

--  Write an SQL query to show only odd rows from a table.

SELECT * FROM WORKER WHERE (WORKER_ID % 2 != 0);

-- Write an SQL query to show only even rows from a table.

SELECT * FROM WORKER WHERE WORKER_ID % 2 = 0;

-- Write an SQL query to clone a new table from another table. 

SELECT * INTO WORKER_DUP FROM WORKER;

-- CREATE TABLE WORKER_DUP AS SELECT * FROM WORKER;  ORACLE QUERY.

-- Write an SQL query to fetch intersecting records of two tables.

SELECT WORKER_ID FROM WORKER
INTERSECT
SELECT WORKER_REF_ID FROM BONUS;

-- Write an SQL query to show records from one table that another table does not have.

SELECT WORKER_ID FROM WORKER
EXCEPT
SELECT WORKER_REF_ID FROM BONUS;

-- Write an SQL query to show the current date and time.

SELECT GETDATE();

SELECT CURRENT_TIMESTAMP;

-- Write an SQL query to show the top n (say 10) records of a table.

SELECT TOP 5 * FROM WORKER;

-- Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT * , DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK FROM WORKER;

SELECT * FROM(SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK FROM WORKER) AS K WHERE K.RNK = 5;

SELECT *,DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK INTO #TEMP_WORKER FROM WORKER;

SELECT * FROM #TEMP_WORKER WHERE RNK = 5;

--  Write an SQL query to determine the 5th highest salary without using the TOP or limit method.

SELECT * FROM(SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK FROM WORKER) AS K WHERE K.RNK = 5;

-- Write an SQL query to fetch the list of employees with the same salary.

SELECT * FROM (SELECT *,DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK FROM WORKER) AS K WHERE K.RNK = 1;

SELECT * FROM WORKER WHERE SALARY IN(SELECT SALARY,COUNT(*) FROM WORKER GROUP BY SALARY HAVING COUNT(*) > 1) ;

-- SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 2; MYSQL QUERY

--  Write an SQL query to show the second-highest salary from a table.

SELECT * FROM (SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK FROM WORKER) AS K WHERE K.RNK = 2;

SELECT MAX(SALARY) FROM WORKER WHERE SALARY NOT IN(SELECT MAX(SALARY) FROM WORKER);

-- Write an SQL query to show one row twice in the results from a table.

SELECT FIRST_NAME,DEPARTMENT FROM WORKER W WHERE W.DEPARTMENT = 'HR'
UNION ALL
SELECT FIRST_NAME,DEPARTMENT FROM WORKER W1 WHERE W1.DEPARTMENT = 'HR';

-- Write an SQL query to fetch intersecting records of two tables.

SELECT WORKER_ID FROM WORKER
INTERSECT
SELECT WORKER_REF_ID FROM BONUS;

-- Write an SQL query to fetch the first 50% of records from a table.

SELECT TOP 50 PERCENT * FROM WORKER;

SELECT * FROM WORKER WHERE WORKER_ID <=(SELECT COUNT(WORKER_ID) / 2 FROM WORKER);

--  Write an SQL query to fetch the departments that have less than five people in them.

SELECT DEPARTMENT,COUNT(*) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(*) < 5;

-- Write an SQL query to show all departments along with the number of people in there.

SELECT DEPARTMENT, COUNT(*) FROM WORKER GROUP BY DEPARTMENT;

-- Write an SQL query to show the last record from a table.

SELECT * FROM WORKER WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM WORKER);

-- Write an SQL query to fetch the first row of a table.

SELECT * FROM WORKER WHERE WORKER_ID IN(SELECT MIN(WORKER_ID) FROM WORKER);

-- Write an SQL query to fetch the last five records from a table.

SELECT TOP 5 * FROM WORKER ORDER BY WORKER_ID DESC;

-- SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5; MYSQL QUERY

-- Write an SQL query to print the names of employees having the highest salary in each department.

SELECT * FROM(SELECT *,ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RNK FROM WORKER) AS K WHERE K.RNK = 1;

-- Write an SQL query to fetch three max salaries from a table.

SELECT TOP 3 * FROM WORKER ORDER BY SALARY DESC;

--Write an SQL query to fetch three min salaries from a table.

SELECT TOP 3 * FROM WORKER ORDER BY SALARY ASC;

-- SELECT * FROM WORKER ORDER BY SALARY ASC LIMIT 3; MYSQL QUERY

-- Write an SQL query to fetch nth max salaries from a table.

-- Write an SQL query to fetch departments along with the total salaries paid for each of them.

SELECT DEPARTMENT,SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- Write an SQL query to fetch the names of workers who earn the highest salary.

SELECT (FIRST_NAME+' '+LAST_NAME) AS FULLNAME,SALARY FROM (SELECT *,ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RNK FROM WORKER) AS K WHERE K.RNK = 1; 

SELECT FIRST_NAME,SALARY FROM WORKER WHERE SALARY = (SELECT MAX(SALARY) FROM WORKER);














