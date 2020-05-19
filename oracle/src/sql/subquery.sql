SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME='MILLER' );
               
SELECT ename, deptno
FROM emp
WHERE deptno = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME='MILLER' );
               
SELECT *
FROM emp
WHERE job = (SELECT job
                FROM EMP
                WHERE ENAME='MILLER' );
               
SELECT ename, sal
FROM emp
WHERE sal >= (SELECT sal
                FROM EMP
                WHERE ENAME='MILLER' );               
               
SELECT ename, deptno
FROM emp
WHERE deptno = (SELECT deptno
                FROM dept
                WHERE LOC='DALLAS' );
               
SELECT ename, sal
FROM emp
WHERE deptno = (SELECT deptno
                FROM dept
                WHERE dname='SALES' );  
               
                
SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno
                FROM emp
                WHERE ename='KING' );  
               
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ( SELECT AVG(SAL)
              FROM EMP); 
             
SELECT ENAME, SAL, DEPTNO 
FROM EMP
WHERE DEPTNO IN ( SELECT DISTINCT DEPTNO
				  FROM EMP 
				  WHERE SAL>=3000);

SELECT empno, ename, sal, deptno
FROM emp
WHERE sal in (SELECT max(sal)
				FROM EMP
				GROUP BY deptno);

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO =30);
             
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE JOB='SALESMAN');
             
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY ( SELECT SAL 
                  FROM EMP 
                  WHERE DEPTNO = 30 );
                 
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ANY ( SELECT SAL 
                  FROM EMP 
                  WHERE JOB='SALESMAN' ) AND JOB != 'SALESMAN';
                 
-----------------------------------------------------------------

select ename, hiredate 
from emp 
where deptno = (select deptno 
				from emp 
				where ename='BLAKE');
			
select empno, ename 
from emp 
where sal > (select avg(sal) 
			 from emp) 
order by sal desc;

select empno, ename, sal 
from emp 
where ename in (select ename 
				from emp 
				where ename like '%T%');
			
select ename, job, sal 
from emp join dept 
on emp.deptno = dept.deptno
where loc=(select loc 
		   from dept 
		   where loc='DALLAS');

select ename, sal 
from emp 
where mgr in (select empno 
			  from emp 
			  where ename='KING');
			 
select * 
from emp 
where sal> (select min(sal) 
			from emp 
			where deptno =30) and deptno !=30;


		  