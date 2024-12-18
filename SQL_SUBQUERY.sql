--===================== SUBQUERY IN SQL ==================================

SELECT * FROM EMPLOYEES;

SELECT * FROM EMP_DEPT;

-- INNER QUERY WILL EXECUTE FIRST THEN OUTER QUERY WILL EXECUTE.

SELECT * FROM EMPLOYEES WHERE EMP_ID IN (SELECT EMP_ID FROM EMP_DEPT);

SELECT * FROM EMPLOYEES WHERE EMP_ID NOT IN(SELECT EMP_ID FROM  EMP_DEPT);

-- SUBQUERY IS AN ALTERNATIVE WAY OF JOINS.

-- SUBQUERY IS SLOW PERFORMANCE WISE AS COMPARE TO JOINS.

-- NESTED SUBQUERY.

SELECT * FROM EMPLOYEES1;

SELECT * FROM EMP_DEPT1;

SELECT * FROM DEPARTMENT;

SELECT EMP_ID, EMP_FIRSTNAME, EMP_LASTNAME 
FROM EMPLOYEES1 
WHERE EMP_ID IN(SELECT EMP_ID FROM EMP_DEPT1 WHERE DEPT_ID IN(SELECT DEPT_HEAD_ID FROM DEPARTMENT));

-- CORRELATED SUBQUERY

SELECT * FROM EMPLOYEES;

SELECT * FROM EMP_DEPT;

SELECT E1.EMP_ID, E1.NAME, E1.GENDER, E1.AGE
FROM EMPLOYEES E1
WHERE EMP_ID IN(SELECT EMP_ID FROM EMP_DEPT E2 WHERE E1.EMP_ID = E2. EMP_ID);





