SELECT SUM(SAL) 
FROM EMP;

SELECT SUM(COMM) 
FROM EMP;

SELECT AVG(SAL) 
FROM EMP;

SELECT MAX(SAL), MIN(SAL)
FROM EMP;

SELECT MAX(SAL)
FROM EMP;

SELECT ENAME,MAX(SAL)
FROM EMP;

SELECT MIN(HIREDATE), MAX(HIREDATE)
FROM EMP;

SELECT COUNT(COMM) 
FROM EMP; 

SELECT COUNT(*), COUNT(COMM) 
FROM EMP;

SELECT count(*) AS �����
FROM EMP
WHERE deptno = 10 AND comm IS NULL;

SELECT COUNT(JOB) ������
FROM EMP;

SELECT COUNT(DISTINCT JOB) ������
FROM EMP;

SELECT rank(3000) within group(ORDER BY sal desc) as ����
FROM EMP;

SELECT DEPTNO 
FROM EMP 
GROUP BY DEPTNO;

SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, MAX(SAL), MIN(SAL)
FROM EMP 
GROUP BY DEPTNO;

SELECT DEPTNO, count(*), count(comm)
FROM EMP 
GROUP BY DEPTNO;

SELECT DEPTNO, JOB,  count(*), sum(sal)
FROM EMP 
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

SELECT max(avg(sal))
FROM EMP 
GROUP BY DEPTNO;

SELECT ROUND(AVG(SAL)) 
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;

SELECT DEPTNO, MAX(SAL), MIN(SAL) 
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) > 2900;

SELECT DEPTNO, avg(sal)
FROM EMP 
GROUP BY DEPTNO
HAVING deptno in (10,20);

SELECT DEPTNO, avg(sal)
FROM EMP 
WHERE deptno in(10,20)
GROUP BY DEPTNO;

---------------------------------------------------

select count(ename), max(sal), min(sal), sum(sal) 
from emp;

select job, max(sal), min(sal), sum(sal) 
from emp 
group by job;

select job, count(job) 
from emp 
group by job;

select max(sal), min(sal), max(sal)-min(sal) 
from emp;

SELECT count(DISTINCT mgr)
FROM emp;

SELECT job, min(sal)
FROM EMP
WHERE mgr IS NOT NULL AND sal >= 2000
GROUP BY job;

select to_char(hiredate, 'yy') "H_YEAR", count(*), min(sal), max(sal), avg(sal), sum(sal) 
from emp 
group by to_char(hiredate,'yy')
order by to_char(hiredate,'yy') asc;

select count(hiredate) total, 
	count(decode(to_char(hiredate,'yyyy'),1980,0)) "1980",
	count(decode(to_char(hiredate,'yyyy'),1981,0))"1981",
	count(decode(to_char(hiredate,'yyyy'),1982,0))"1982",
	count(decode(to_char(hiredate,'yyyy'),1987,0))"1987" 
from emp;

select job, 
	sum(decode(deptno,10,sal)) "10",
	sum(decode(deptno,20,sal)) "20",
	sum(decode(deptno,30,sal)) "30", sum(sal) total
from emp 
group by job 
order by job asc;