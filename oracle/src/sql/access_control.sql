CREATE USER ggangpae1
IDENTIFIED BY tjoeun;

SELECT *
FROM system_privilege_map;

GRANT CREATE ROLE TO ggangpae1;

REVOKE create role FROM ggangpae1;

SELECT *
FROM table_privilege_map;

GRANT SELECT, INSERT ON EMP TO ggangpae1;

SELECT EMPNO, ENAME, JOB, HIREDATE, SAL
FROM scott.EMP
WHERE DEPTNO = 10;

REVOKE SELECT ON EMP 
FROM ggangpae1;

SELECT *
FROM ROLE_SYS_PRIVS;

CREATE ROLE LEVEL1;

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW
TO LEVEL1;

CREATE USER TEST1
IDENTIFIED BY TIGER1;

CREATE USER TEST2
IDENTIFIED BY TIGER2;

GRANT LEVEL1 
TO TEST1, TEST2;

CREATE USER IRIN
IDENTIFIED BY SM;

GRANT CONNECT, RESOURCE 
TO IRIN;

REVOKE CONNECT, RESOURCE 
FROM IRIN;

DROP USER IRIN;