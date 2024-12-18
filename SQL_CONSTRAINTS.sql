-- INTEGRITY CONSTRAINTS

-- DOMAIN INTEGRITY CONSTRAINTS

-- NOT NULL AND CHECK

CREATE TABLE MY_CONSTRAINTS(
ID INT NOT NULL,
NAME NVARCHAR(100),
AGE INT CHECK(AGE>18)
);

INSERT INTO MY_CONSTRAINTS(ID,NAME,AGE) VALUES(1,'AMAN',25);

INSERT INTO MY_CONSTRAINTS(NAME,AGE) VALUES('MANIK',29);

INSERT INTO MY_CONSTRAINTS(ID,NAME,AGE) VALUES(3,'NAMAN',17);

INSERT INTO MY_CONSTRAINTS(ID,NAME,AGE) VALUES(2,'GAURAV',29);

INSERT INTO MY_CONSTRAINTS(ID,AGE) VALUES(3,27);

SELECT * FROM MY_CONSTRAINTS;

-- ADD A CONSTRAINT TO A COLUMN.

/* BUT IT IS NECESSARY THAT THE COLUMN CAN'T CONTAIN NULL VALUE THEN WE CAN APPLY NOT NULL NULL CONSTRAINTS ON THAT COLUMN 
BY USING ALTER COMMAND. */

ALTER TABLE MY_CONSTRAINTS ALTER COLUMN NAME NVARCHAR(100) NOT NULL; 

DELETE FROM MY_CONSTRAINTS WHERE ID = 3;

-- DROP CONSTRAINTS

SP_HELP MY_CONSTRAINTS;

ALTER TABLE MY_CONSTRAINTS DROP CONSTRAINT CK__MY_CONSTRAI__AGE__58BC2184;

-- DEFAULT CONSTRAINTS

CREATE TABLE COUNTRY(
ID INT IDENTITY,
NAME VARCHAR(100),
SAL INT CHECK(SAL>10000),
COUNTRY VARCHAR(100) DEFAULT('INDIA')
);

INSERT INTO COUNTRY(NAME,SAL) VALUES('SHRI RAM',11000);

INSERT INTO COUNTRY(NAME,SAL,COUNTRY) VALUES('SHRI SHYAM',12000,'USA');

SELECT * FROM COUNTRY;

-- ENTITY INTEGRITY CONSTRAINT

-- UNIQUE CONSTRAINTS

CREATE TABLE EMP_UNIQUE(
EID INT IDENTITY,
ENAME VARCHAR(100),
MOBILE BIGINT UNIQUE,
ESAL INT CHECK(ESAL>500),
COUNTRY VARCHAR(100) DEFAULT('INDIA')
);

INSERT INTO EMP_UNIQUE(ENAME,MOBILE,ESAL,COUNTRY) VALUES('AMAN',4567892310,700,'NEPAL');

INSERT INTO EMP_UNIQUE(ENAME,MOBILE,ESAL) VALUES('AMAN',4567892310,700);

INSERT INTO EMP_UNIQUE(ENAME,ESAL,COUNTRY) VALUES('AMAN',7900,'USA');

INSERT INTO EMP_UNIQUE(ENAME,ESAL,COUNTRY) VALUES('RAJAN',8900,'USA');

SELECT * FROM EMP_UNIQUE;

-- PRIMARY KEY CONSTRAINT

CREATE TABLE EMPP(
EID INT PRIMARY KEY,
ENAME VARCHAR(50),
DEPARTMENT VARCHAR(20),
DEPTID INT);

INSERT INTO EMPP VALUES(1,'GAURAV','IT',8);

INSERT INTO EMPP VALUES(1,'RAMESH','HR',7);

INSERT INTO EMPP(ENAME,DEPARTMENT,DEPTID) VALUES('RAMESH','HR',7);

SELECT * FROM EMPP;

-- FOREIGN KEY CONSTRAINT

CREATE TABLE DEPTT(
DID INT PRIMARY KEY,
DNAME VARCHAR(100));

INSERT INTO DEPTT VALUES(1,'IT');
INSERT INTO DEPTT VALUES(2,'HR');
INSERT INTO DEPTT VALUES(3,'MARKETING');
INSERT INTO DEPTT VALUES(4,'OPERATION');

SELECT * FROM DEPTT;

CREATE TABLE EMPL(
EID INT PRIMARY KEY,
ENAME VARCHAR(100),
ESAL INT,
DID INT FOREIGN KEY REFERENCES DEPTT(DID)
);

SELECT * FROM EMPL;

INSERT INTO EMPL VALUES(101,'AMAN',20000,1);

INSERT INTO EMPL VALUES(102,'NMAN',25000,2);

INSERT INTO EMPL VALUES(103,'GAURAV',30000,4);

INSERT INTO EMPL VALUES(104,'NISHA',40000,6);

DROP TABLE DEPTT;

DROP TABLE EMPL;