CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPT;

CREATE TABLE EMP_COPY
AS
SELECT * FROM EMP

SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;

CREATE VIEW EMP_VIEW30
AS 
SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;

SELECT * FROM EMP_VIEW30;

DESC EMP_VIEW30;

CREATE VIEW EMP_VIEW20
AS 
SELECT EMPNO, ENAME, DEPTNO, MGR
FROM EMP_COPY
WHERE DEPTNO=20;

SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

INSERT INTO EMP_VIEW30
VALUES(8000, 'ANGEL', 30);

SELECT * FROM EMP_VIEW30;

SELECT * FROM EMP_COPY;

CREATE OR REPLACE
VIEW EMP_VIEW(사원번호, 사원명, 급여, 부서번호)
AS 
SELECT EMPNO, ENAME, SAL, DEPTNO 
FROM EMP_COPY;

SELECT * 
FROM EMP_VIEW
WHERE 부서번호=30;

CREATE VIEW VIEW_SAL
AS
SELECT DEPTNO, SUM(SAL) AS "SalSum", AVG(SAL) AS "SalAvg"
FROM EMP_COPY
GROUP BY DEPTNO;

SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO DESC;

CREATE VIEW EMP_VIEW_DEPT
AS
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO DESC;

SELECT * FROM EMP_VIEW_DEPT;

CREATE VIEW SAL_VIEW
AS
SELECT DEPTNO, MAX(SAL) MAX_SAL, MIN(SAL) MIN_SAL
FROM EMP
GROUP BY DEPTNO;

DROP VIEW VIEW_SAL;

CREATE OR REPLACE VIEW EMP_VIEW30
AS 
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO 
FROM EMP_COPY
WHERE DEPTNO=30;

CREATE OR REPLACE VIEW EMPLOYEES_VIEW
AS
SELECT EMPNO, ENAME, DEPTNO
FROM EMPLOYEES
WHERE DEPTNO=30;

CREATE OR REPLACE FORCE VIEW NOTABLE_VIEW
AS
SELECT EMPNO, ENAME, DEPTNO
FROM EMPLOYEES
WHERE DEPTNO=30;

CREATE OR REPLACE NOFORCE EXISTTABLE_VIEW
AS
SELECT EMPNO, ENAME, DEPTNO
FROM EMPLOYEES
WHERE DEPTNO=30;

CREATE OR REPLACE VIEW EMP_VIEW30
AS 
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP_COPY
WHERE DEPTNO=30;

SELECT * FROM EMP_VIEW30;

UPDATE EMP_VIEW30 
SET DEPTNO=20
WHERE SAL >= 1200; 

CREATE OR REPLACE VIEW VIEW_CHK30
AS 
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO 
FROM EMP_COPY
WHERE DEPTNO=30 WITH CHECK OPTION;

UPDATE VIEW_CHK30 
SET DEPTNO=20
WHERE SAL >= 1200;

CREATE OR REPLACE VIEW VIEW_READ30
AS 
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO 
FROM EMP_COPY
WHERE DEPTNO=30 WITH READ ONLY;

UPDATE VIEW_READ30 SET COMM=2000;

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM EMP;

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;

CREATE OR REPLACE VIEW VIEW_HIRE
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE;

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE
WHERE ROWNUM<=5;

SELECT EMPNO, ENAME, HIREDATE
FROM ( SELECT ROWNUM rnum, EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE)
WHERE rnum<=5;

CREATE OR REPLACE VIEW EMP_VIEW
AS 
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP;

SELECT *
FROM EMP_VIEW
WHERE DEPTNO = 10;

CREATE OR REPLACE VIEW SAL_TOP3_VIEW
AS 
SELECT RNUM RANKING, EMPNO, ENAME, SAL
FROM (SELECT ROWNUM RNUM, EMPNO, ENAME, SAL FROM(SELECT EMPNO, ENAME, SAL FROM EMP ORDER BY SAL DESC, ENAME DESC))
WHERE RNUM <= 3;

SELECT *
FROM SAL_TOP3_VIEW;

CREATE SEQUENCE EMP_SEQ
INCREMENT BY 1
START WITH 1;

SELECT EMP_SEQ.NEXTVAL 
FROM DUAL;

SELECT EMP_SEQ.CURRVAL 
FROM DUAL;

CREATE SEQUENCE EMP_PK_SEQ
START WITH 1 
INCREMENT BY 1 
MAXVALUE 100000 ; 

DROP TABLE EMP01;

CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR(10),
HIREDATE DATE
);

INSERT INTO EMP01
VALUES(EMP_PK_SEQ.NEXTVAL, 'JULIA' , SYSDATE); 

DROP SEQUENCE EMP_SEQ;

CREATE SEQUENCE DEPT_DEPTNO_SEQ
START WITH 10
INCREMENT BY 10 
MAXVALUE 30; 

CREATE SEQUENCE TEST_SEQ
START WITH 1
INCREMENT BY 1 
MAXVALUE 999999; 

SELECT *
FROM USER_SEQUENCES;

SELECT TEST_SEQ.NEXTVAL
FROM DUAL;

SELECT TEST_SEQ.CURRVAL
FROM DUAL;

DROP SEQUENCE TEST_SEQ;

CREATE TABLE DEPT_EXAMPLE(
	DEPTNO NUMBER(4) PRIMARY KEY,
	DNAME VARCHAR(15),
	LOC VARCHAR(15));

CREATE SEQUENCE DEPT_EXAMPLE_SEQ
START WITH 10
INCREMENT BY 10;

INSERT INTO DEPT_EXAMPLE 
VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL,'인사과', '서울');

INSERT INTO DEPT_EXAMPLE 
VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL,'경리과', '서울');

INSERT INTO DEPT_EXAMPLE 
VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL,'총무과', '대전');

INSERT INTO DEPT_EXAMPLE 
VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL,'기술팀', '인천');

SELECT *
FROM DEPT_EXAMPLE; 

SELECT INDEX_NAME, TABLE_NAME , COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN('EMP', 'DEPT');

CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);

DROP INDEX IDX_EMP01_ENAME;

CREATE INDEX IDX_DEPT01_COM
ON DEPT01(DEPTNO, DNAME);

SELECT INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'DEPT01';

CREATE INDEX IDX_EMP_ANNSAL
ON EMP(SAL*12);

SELECT INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMP'

CREATE INDEX IDX_EMP_JOB
ON EMP(JOB);

SELECT INDEX_NAME, TABLE_NAME , COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN('EMP');

CREATE SYNONYM gubun
FOR salgrade;

SELECT *
FROM gubun;

DROP SYNONYM gubun;

CREATE SYNONYM EMPLOYEE
FOR EMP;





