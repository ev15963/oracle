DELETE FROM DEPT01;

SELECT *
FROM DEPT01;

ROLLBACK;

SELECT *
FROM DEPT01;

DELETE FROM DEPT01 
WHERE DEPTNO=20;

SELECT *
FROM DEPT01;

COMMIT;

SELECT *
FROM DEPT01;

DELETE FROM DEPTO2
WHERE DEPTNO=40;

CREATE TABLE DEPT03
AS 
SELECT * FROM DEPT;

ROLLBACK;

SELECT *
FROM DEPT02;

SELECT *
FROM DEPT03;

DELETE FROM DEPT03
WHERE DEPTNO=20;

TRUNCATE TABLE DEPTPPP;

ROLLBACK;

SELECT *
FROM DEPT03;

DELETE FROM DEPT01
WHERE DEPTNO=40;

COMMIT;

DELETE FROM DEPT01 
WHERE DEPTNO=30; 

SAVEPOINT C1; 

DELETE FROM DEPT01 
WHERE DEPTNO =20; 

SAVEPOINT C2; 

DELETE FROM DEPT01 
WHERE DEPTNO =10; 

ROLLBACK TO C2; 

SELECT *
FROM DEPT01;

ROLLBACK;

SELECT *
FROM DEPT01;





