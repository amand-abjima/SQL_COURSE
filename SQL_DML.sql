-- DATA MANIPULATION LANGUAGE (DML)

CREATE TABLE EMPLOYEES(EID INT IDENTITY(1,1),ENAME VARCHAR(30),ESAL INT);

SELECT * FROM EMPLOYEES;

-- INSERT DATA MANUALLY IN ALL COLUMN.

INSERT INTO EMPLOYEES VALUES('RAM',20000);
INSERT INTO EMPLOYEES VALUES('SHYAM',15000);
INSERT INTO EMPLOYEES VALUES('OM',10000);

-- INSERT DATA MANUALLY IN ONE COLUMN.

INSERT INTO EMPLOYEES(ENAME) VALUES('GAURAV');
INSERT INTO EMPLOYEES(ESAL) VALUES(40000);
INSERT INTO EMPLOYEES(ENAME,ESAL) VALUES('AMAN',25000);


--COPY DATA FROM EXISTING TABLE TO NEW TABLE BUT MAKE SURE NEW TABLE IS NOT EXIST.
--                    OR
-- HOW WE CAN CREATE A DUPLICATE TABLE WITHOUT CREATE STATEMENT??

SELECT * FROM EMPLOYEES;

SELECT * INTO EMPLOYEESDUP FROM EMPLOYEES;

SELECT * FROM EMPLOYEESDUP;

--COPY ONLY COLUMN NAME WITHOUT DATA FROM EXISTING TABLE AND WITHOUT CREATE STATEMENT.
-- HERE WE NEED TO GIVE ONE FALSE CONDITION WITH WHERE CLAUSE SO DATA WILL NOT BE COPY.

SELECT EID,ENAME INTO EMPS FROM EMPLOYEES WHERE 8 = 2;

-- ALL COLUMN COPY WITHOUT DATA.

SELECT * INTO EMPS1 FROM EMPLOYEES WHERE 7 = 5;

SELECT * FROM EMPS1;

SELECT * FROM EMPS;

--COPY ONLY COLUMN NAME WITH DATA FROM EXISTING TABLE AND WITHOUT CREATE STATEMENT.
-- HERE WE NEED TO GIVE NO CONDITION AND NO NEED TO USE WHERE CLAUSE.

SELECT EID, ENAME INTO EMPS2 FROM EMPLOYEES;

SELECT * FROM EMPS2;

-- ALL COLUMN COPY WITH DATA.

SELECT * INTO EMPS3 FROM EMPLOYEES;

SELECT * FROM EMPS3;

-- INSERT DATA INTO TABLE FROM EXISTING TABLE

CREATE TABLE EMPLOYEES_COPY(EID INT,ENAME VARCHAR(30),ESAL INT);

INSERT INTO EMPLOYEES_COPY(EID,ENAME,ESAL) SELECT EID,ENAME,ESAL FROM EMPLOYEES;

SELECT * FROM EMPLOYEES_COPY;

-- UPDATE COMMAND

UPDATE EMPLOYEES 
SET ENAME = 'RAM SINGH'
WHERE EID = 1;

SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES_COPY;

UPDATE EMPLOYEES 
SET ENAME = 'RUDRA',
ESAL = 50000
WHERE EID = 3;