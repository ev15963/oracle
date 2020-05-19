DESC DUAL;

SELECT * 
FROM DUAL;

SELECT 60 * 60 * 24 
FROM DUAL;

SELECT sysdate
FROM DUAL;

SELECT -10, ABS(-10)
FROM DUAL;

SELECT   34.5678,  FLOOR(34.5678)
FROM DUAL;

SELECT 34.5678, ROUND(34.5678)
FROM DUAL;

SELECT 34.5678, ROUND(34.5678, 2)
FROM DUAL;

SELECT 34.5678, ROUND(34.5678, -1)
FROM DUAL;

SELECT TRUNC(34.5678, 2), TRUNC(34.5678, -1), TRUNC(34.5678)
FROM DUAL;

SELECT MOD(27, 2), MOD(27, 5), MOD(27, 7) 
FROM DUAL;

SELECT *
FROM EMP
WHERE mod(empno, 2) = 1;

SELECT 'Welcome to Oracle', UPPER('Welcome to Oracle')
FROM DUAL;

SELECT 'Welcome to Oracle', LOWER('Welcome to Oracle')
FROM DUAL;

SELECT 'WELCOME TO ORACLE', INITCAP('WELCOME TO ORACLE')
FROM DUAL;

SELECT EMPNO, ENAME, JOB 
FROM EMP 
WHERE JOB='manager';

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE LOWER(JOB) ='manager';

SELECT LENGTH('Oracle'), LENGTH('오라클')
FROM DUAL;

SELECT LENGTHB('Oracle'), LENGTHB('오라클')
FROM DUAL;

SELECT SUBSTR('Welcome to Oracle', 4, 3)
FROM DUAL;

SELECT SUBSTR('Welcome to Oracle', -4, 3) 
FROM DUAL;

SELECT SUBSTR(HIREDATE, 1, 2) 년도, SUBSTR(HIREDATE, 4, 2) 달
FROM EMP;

SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE, 4, 2)='12';

SELECT *
FROM EMP
WHERE substr(hiredate, 1, 2) = '81'; 

SELECT *
FROM EMP
WHERE substr(ename, -1, 1) ='E';

SELECT SUBSTR('Welcome To Oracle', 3, 4), SUBSTRB('Welcome To Oracle', 3, 4)
FROM DUAL;

SELECT SUBSTR('웰컴투오라클', 3, 4), SUBSTRB('웰컴투오라클', 3, 4)
FROM DUAL;

SELECT INSTR('WELCOME TO ORACLE', 'O')
FROM DUAL;

SELECT INSTR('WELCOME TO ORACLE', 'O', 6, 2)
FROM DUAL;

SELECT INSTR('데이터베이스', '이', 3, 1), INSTRB('데이터베이스', '이', 3, 1)
FROM DUAL;

SELECT *
FROM emp
WHERE INSTR(ename, 'N') = 3;

SELECT LPAD('Oracle', 20, '#')
FROM DUAL;

SELECT RPAD('Oracle', 20, '#')
FROM DUAL;

SELECT LTRIM(' Oracle ') 
FROM DUAL;

SELECT RTRIM(' Oracle ') 
FROM DUAL;

SELECT TRIM(' Oracle ') 
FROM DUAL;

SELECT TRIM('a' FROM 'aaaaOracleaaaa') 
FROM DUAL;

SELECT CONCAT('Oracle', 'Java')
FROM DUAL;

SELECT CONVERT('Ä Ê Í Ó Ø A B C D E ', 'UTF8', 'WE8ISO8859P1') 
FROM DUAL; 

SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE-1 '어제', SYSDATE '오늘', SYSDATE+1 '내일'
FROM DUAL;

SELECT sysdate-hiredate 근무일수
FROM emp;

SELECT HIREDATE, ROUND (HIREDATE, 'MONTH') 
FROM EMP;

SELECT HIREDATE, TRUNC(HIREDATE, 'MONTH')
FROM EMP;

SELECT HIREDATE, TRUNC(HIREDATE, 'MONTH')
FROM EMP;

SELECT MONTHS_BETWEEN(sysdate, hiredate) AS "근무한 개월수"
FROM emp;

SELECT add_months(sysdate, 6) AS "6개월 후 날짜"
FROM dual;

SELECT NEXT_DAY(sysdate, '토요일') AS "다음 주 토요일" , LAST_DAY(sysdate) AS "이번 달 마지막 날"
FROM dual;


SELECT HIREDATE, TO_CHAR (HIREDATE, 'YYYY/MM/DD DAY') 
FROM EMP;

SELECT HIREDATE, TO_CHAR (HIREDATE, 'YY/MON/DD DY') 
FROM EMP;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS')
FROM DUAL;

SELECT TO_CHAR (1230000) 
FROM DUAL;

SELECT ENAME, SAL, TO_CHAR (SAL, 'L999,999') 
FROM EMP;

SELECT TO_CHAR (123456, '000000000'), 
              TO_CHAR (123456, '999,999,999') 
FROM DUAL;

SELECT ENAME, HIREDATE FROM EMP
WHERE HIREDATE=TO_DATE(19810220,'YYYYMMDD')

SELECT TRUNC(SYSDATE-TO_DATE('2008/01/01', 'YYYY/MM/DD'))
FROM DUAL;

SELECT TO_NUMBER('20,000', '99,999') - TO_NUMBER('10,000', '99,999')
FROM DUAL;

SELECT ENAME, SAL, COMM, SAL*12+COMM, 
  NVL(COMM, 0), SAL*12+NVL(COMM, 0)
FROM EMP
ORDER BY JOB;

SELECT ENAME, SAL, COMM, SAL*12+COMM, 
  NVL2(COMM,SAL*12+COMM, SAL*12)
FROM EMP
ORDER BY JOB;

SELECT NULLIF('korea','korea'), NULLIF('korea','KOREA')
from dual;

SELECT ENAME, SAL, COMM, COALESCE(COMM, SAL,0)
FROM EMP;

SELECT ENAME, DEPTNO, 
              DECODE(DEPTNO,  10, 'ACCOUNTING', 
                              20, 'RESEARCH', 
                              30, 'SALES', 
                              40, 'OPERATIONS' ) 
               AS DNAME
FROM EMP;

SELECT empno, ename, job, sal, decode(JOB, 'ANALYST', sal * 1.05,
										   'SALESMAN', sal * 1.1,
										   'MANAGER', sal * 1.15,
										   'CLERK', sal * 1.2,
										   sal) AS upsal
FROM emp;

SELECT ENAME, DEPTNO,
              CASE WHEN DEPTNO=10 THEN 'ACCOUNTING' 
                        WHEN DEPTNO=20 THEN 'RESEARCH' 
                        WHEN DEPTNO=30 THEN 'SALES' 
                        WHEN DEPTNO=40 THEN 'OPERATIONS'
               END AS DNAME
FROM EMP;

-------------------------------------------

select sysdate "CURRENT_DATE" 
from dual;

SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE, 4, 2) = '09';

select ename,hiredate,add_months(hiredate,5)
from emp;

select ename, hiredate, months_between(sysdate, hiredate), 
	sal*months_between(sysdate, hiredate) 
from emp;

select ename ||' earns'||to_char(sal,'$999,999')||' monthly but wants'||
	to_char(sal*3,'$999,999')"dream salary" 
from emp;

select lpad(ename || 'sal', 15, '*') 
from emp;

select ename, job, hiredate, to_char(hiredate, 'day') 
from emp;

select ename, length(ename), job 
from emp 
where length(ename) >= 6;

select ename, job, sal, nvl(comm,0) comm, sal+nvl(comm,0) 
from emp ;
