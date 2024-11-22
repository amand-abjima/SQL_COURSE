--======= STRING FUNCTIONS IN SQL ================

-- ASCII()

SELECT ASCII('L');  -- 76

SELECT ASCII('h');   -- 104

SELECT ASCII('*');   -- 42

--CHAR()

SELECT CHAR(78);   -- "N"

SELECT CHAR(109);    -- "M"

SELECT CHAR(7);

--NCHAR()

SELECT NCHAR(87);    -- "W"

SELECT NCHAR(113);   -- "q"

--LEFT()

SELECT * FROM HUMANRESOURCES.EMPLOYEE;

SELECT LEFT('DHANANJAY',5);  -- "DHANA"  IT WILL TRIM THE DATA FROM LEFT SIDE AND RETURNS TRIMMING DATA.

SELECT LEFT(JOBTITLE,4) AS LEFTTRIM, * FROM HUMANRESOURCES.EMPLOYEE;

-- RTRIM()

SELECT RIGHT('DHANANJAY',5);  -- "ANJAY"

SELECT RIGHT(JOBTITLE,4), * FROM HUMANRESOURCES.EMPLOYEE;

-- HOW WE CAN FIND THE NAME STARTING WITH VOWEL LETTER.

SELECT * FROM PERSON.PERSON;

SELECT * FROM PERSON.PERSON WHERE LEFT(FIRSTNAME,1) IN ('A','E','I','O','U');

-- HOW WE CAN FIND THE NAME ENDING WITH VOWEL LETTER.

SELECT * FROM PERSON.PERSON WHERE RIGHT(FIRSTNAME,1) IN ('A','E','I','O','U');

-- LTRIM()

SELECT LTRIM('AMAN','A'); -- "MAN"

SELECT LTRIM('       GAURAV');  --"GAURAV"

--RTRIM()

SELECT RTRIM('AMAN','N');  --"AMA"

SELECT RTRIM('AMAN       '); -- "AMAN"

SELECT LTRIM(RTRIM('   AMAN    '));   -- "AMAN"

-- TRIM()

SELECT TRIM('A' FROM 'AKANSHA');   -- "KANSH"

SELECT TRIM ('A' FROM 'AMAN');     -- "MAN"

SELECT TRIM('   AMAN    ');  -- "AMAN"

-- REPLACE()

-- REPLACE(FIND,REPLACE,STRING)

SELECT REPLACE('MY NAME IS AMAN','AMAN','GAURAV');

SELECT * FROM SALESLT.CUSTOMER;

SELECT * INTO CUSTOMER_DUP FROM SALESLT.CUSTOMER;

SELECT * FROM CUSTOMER_DUP;

SELECT REPLACE(EMAILADDRESS,'adventure-works.com','abjima.com') AS REPLACEEMAIL, * FROM CUSTOMER_DUP;

UPDATE CUSTOMER_DUP
SET EMAILADDRESS = REPLACE(EMAILADDRESS,'adventure-works.com','abjima.com');

-- STUFF()

SELECT STUFF(PHONE,3,9,'XXXXXXX') AS NUMBER, * FROM CUSTOMER_DUP;

--REVERSE()

SELECT REVERSE(FIRSTNAME), * FROM CUSTOMER_DUP;

-- CHARINDEX()  [IMPP]

SELECT CHARINDEX('SQL', 'MICROSFT SQL SERVER');

SELECT CHARINDEX('@', EMAILADDRESS), EMAILADDRESS, * FROM CUSTOMER_DUP;

--PATINDEX()

SELECT PATINDEX('%CD%','ABGHGHKECDJKJKJCD');  -- 9

--LEN()

SELECT LEN(FIRSTNAME), * FROM CUSTOMER_DUP;

SELECT * FROM CUSTOMER_DUP WHERE LEN(FIRSTNAME)> 7;

-- SUBSTRING() [V.IMPPP]

SELECT SUBSTRING('ANCDEFGHT',4,4);  -- "DEFG"

SELECT SUBSTRING('SQL SERVER IS USEFUL',5,3);  -- "SER"

SELECT SUBSTRING(EMAILADDRESS,1,CHARINDEX('@',EMAILADDRESS)) , * FROM CUSTOMER_DUP;

SELECT SUBSTRING(EMAILADDRESS,1,CHARINDEX('@',EMAILADDRESS)-1),* FROM CUSTOMER_DUP;

-- LOWER()

SELECT LOWER(FIRSTNAME), * FROM CUSTOMER_DUP;

-- UPPER()

SELECT UPPER(FIRSTNAME), * FROM CUSTOMER_DUP;
