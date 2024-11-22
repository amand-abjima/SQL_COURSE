-- DATA QUERY LANGUAGE(DQL)

--FIND THE ALL TABLE NAME FROM A PARTICULAR DATABASE.

SELECT * FROM SYS.TABLES;

SELECT * FROM SYS.TABLES WHERE CREATE_DATE BETWEEN '05/08/2023' AND '09/07/2024';

--FIND THE ALL OBJECTS NAME.

SELECT * FROM SYS.OBJECTS;

SELECT DISTINCT TYPE,TYPE_DESC FROM SYS.OBJECTS;

-- HOW WE CAN FIND THE TOTAL NUMBER OF USER TABLE IN A PARTICULAR DATABASE.

SELECT * FROM SYS.OBJECTS WHERE TYPE = 'U';

-- HOW WE CAN FIND THE TOTAL NUMBER OF STORED PROCEDURE IN A PARTICULAR DATABASE.

SELECT * FROM SYS.OBJECTS WHERE TYPE = 'P';

-- HOW YOU CAN CHECK THE TABLE IN THE DATABASE IF IT IS EXIST OR NOT IF IT IS ALREADY THERE FIRST YOU NEED TO DROP IT THEN CREATE.

--BY USING " EXISTS " COMMAND.

IF EXISTS(SELECT 1 FROM SYS.OBJECTS WHERE NAME = 'KEYBORAD' AND TYPE = 'U')
DROP TABLE KEYBOARD

CREATE TABLE KEYBOARD(
ID INT NOT NULL,
NAMES VARCHAR(30),
MODEL VARCHAR(100));

INSERT INTO KEYBOARD VALUES(1,'ERT','UIOY8794');
INSERT INTO KEYBOARD VALUES(2,'GRT','UIOY8795');
INSERT INTO KEYBOARD VALUES(3,'FRT','UIOY8796');

SELECT * FROM AMAN;

--WHERE CLUASE

SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEE WHERE ID = 100 AND GENDER = 'MALE';

SELECT * FROM EMPLOYEE WHERE ID = 200 OR GENDER = 'MALE';

--ORDER BY CLAUSE.

SELECT * FROM EMPLOYEES ORDER BY NAME DESC;

SELECT * FROM EMPLOYEES ORDER BY AGE ASC;

SELECT * FROM EMPLOYEES ORDER BY NAME,AGE DESC;

-- WE CAN ALSO USE COLUMN POSITITON WITH ORDER BY CLAUSE.

SELECT * FROM EMPLOYEES ORDER BY 2 DESC;

SELECT * FROM EMPLOYEES ORDER BY 2,3 DESC;

--DISTINCT KEYWORD

SELECT DISTINCT * FROM AMAN ORDER BY 1;

--IS NULL

SELECT * FROM PERSON.PERSON;

SELECT * FROM PERSON.PERSON WHERE MIDDLENAME IS NULL;

-- ISNULL()

SELECT * FROM PERSON.PERSON WHERE ISNULL(MIDDLENAME,' ') = ' ';

SELECT ISNULL(MIDDLENAME,' '),* FROM PERSON.PERSON WHERE ISNULL(MIDDLENAME,' ') = ' ';

--HOW WE CAN REPLACE A NULL VALUE WITH 'N/A'.

SELECT ISNULL(MIDDLENAME,'N/A'),* FROM PERSON.PERSON WHERE ISNULL(MIDDLENAME,' ')=' ';

SELECT ISNULL(MIDDLENAME,'N/A'),* FROM PERSON.PERSON WHERE MIDDLENAME IS NULL;

--IS NOT NULL

--HOW WE CAN FIND THE EMPLOYEE INFORMATION WHICH HAS MIDDLE NAME.

SELECT * FROM PERSON.PERSON WHERE MIDDLENAME IS NOT NULL;

SELECT * FROM PERSON.PERSON WHERE ISNULL(MIDDLENAME,' ') <> ' ';

--COLUMN ALIAS

SELECT * FROM PERSON.PERSON;

SELECT BUSINESSENTITYID AS ID,TITLE,CONCAT(FIRSTNAME,' ',MIDDLENAME,' ',LASTNAME) AS FULLNAME FROM PERSON.PERSON;

--BETWEEN OPERATOR

SELECT * FROM PERSON.PERSON WHERE BUSINESSENTITYID BETWEEN 1 AND 20;

--IN OPERATOR

SELECT * FROM PERSON.PERSON WHERE BUSINESSENTITYID IN (1,2,11,12,20);

--LIKE OPERATOR

-- WRITE A QUERY TO FIND AAL INFORMATION WHERE FIRST NAME START WITH 'K'.

SELECT * FROM PERSON.PERSON WHERE FIRSTNAME LIKE 'K%';

-- WRITE A QUERY TO FIND AAL INFORMATION WHERE FIRST NAME END WITH 'K'.

SELECT * FROM PERSON.PERSON WHERE FIRSTNAME LIKE '%K';

-- WRITE A QUERY TO FIND AAL INFORMATION WHERE FIRST NAME START WITH 'K' SECOND LETTER CAN BE ANYTHING AND THIRD LETTER WILL BE 'R'.

SELECT * FROM PERSON.PERSON WHERE FIRSTNAME LIKE 'K_R%';

-- WRITE A QUERY TO FIND AAL INFORMATION WHERE ROWGUID CONTAIN '4038'.

SELECT * FROM PERSON.PERSON WHERE ROWGUID LIKE '%4038%';

--WRITE A QUERY TO FIND INFORMATION ABOUT HOW MANY TABLE CONTAIN THE WORD EMPLOYEE;

SELECT * FROM SYS.OBJECTS WHERE TYPE = 'U' AND NAME LIKE '%EMPLOYEE%';







