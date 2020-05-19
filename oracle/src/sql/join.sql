SELECT *
FROM EMP, DEPT;

SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT ENAME, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND ENAME='MILLER';

SELECT ENAME, DNAME, DEPTNO
FROM EMP, DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME='MILLER';

SELECT EMP.ENAME, DEPT.DNAME, EMP.DEPTNO
FROM EMP, DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO
AND ENAME='MILLER';

SELECT E.ENAME, D.DNAME, E.DEPTNO, D.DEPTNO
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.ENAME='MILLER';

SELECT ename, sal, loc
FROM dept, emp
WHERE dept.deptno = emp.deptno AND loc = 'NEW YORK';

SELECT ename, hiredate
FROM emp, dept 
WHERE emp.deptno = dept.deptno AND dname = 'ACCOUNTING';

SELECT ename, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno AND job = 'MANAGER';

SELECT * FROM SALGRADE;

SELECT ENAME, SAL, GRADE
FROM EMP, SALGRADE 
WHERE SAL BETWEEN LOSAL AND HISAL;

select employee.ename || '의 매니저는 ' || manager.ename
from emp employee, emp manager
where employee.mgr = manager.empno

SELECT e1.ename, e1.job
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno AND e2.ename ='KING';

SELECT employee.ename || '의 매니저는'
             || manager.ename || '입니다.' 
FROM emp employee, emp manager
WHERE employee.mgr = manager.empno(+);

SELECT ename, dept.deptno, dname
FROM emp, dept
WHERE emp.deptno(+) = dept.deptno;

SELECT * 
FROM EMP CROSS JOIN DEPT;

SELECT ENAME, DNAME 
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO=DEPT.DEPTNO
WHERE ENAME='MILLER';

SELECT EMP.ENAME, DEPT.DNAME 
FROM EMP INNER JOIN DEPT
USING (DEPTNO);

SELECT EMP.ENAME, DEPT.DNAME 
FROM EMP NATURAL JOIN DEPT;

DROP TABLE DEPT01;

CREATE TABLE DEPT01( 
DEPTNO NUMBER(2), 
DNAME VARCHAR2(14)); 

INSERT INTO DEPT01 VALUES(10, 'ACCOUNTING');
INSERT INTO DEPT01 VALUES (20, 'RESEARCH');

DROP TABLE DEPT02;

CREATE TABLE DEPT02( 
DEPTNO NUMBER(2), 
DNAME VARCHAR2(14)); 

INSERT INTO DEPT02 VALUES(10, 'ACCOUNTING');
INSERT INTO DEPT02 VALUES (30, 'SALES'); 

SELECT * FROM DEPT02;

SELECT *
FROM DEPT01 LEFT OUTER JOIN DEPT02
ON DEPT01.DEPTNO = DEPT02.DEPTNO;

SELECT *
FROM DEPT01 RIGHT OUTER JOIN DEPT02
USING(DEPTNO);

SELECT *
FROM DEPT01 FULL OUTER JOIN DEPT02
USING(DEPTNO);

SELECT deptno			
    	FROM dept				 
	UNION				    
	SELECT deptno			    
	FROM emp;

SELECT deptno			
    	FROM dept				 
	UNION	ALL			    
	SELECT deptno			    
	FROM emp;

SELECT deptno
FROM dept
INTERSECT
SELECT deptno
FROM emp;

SELECT deptno
FROM dept
MINUS
SELECT deptno
FROM emp;

select deptno, job, sum(sal)
from emp
group by grouping sets(deptno, job)

---------------------------------------------------------------------------------------------------

select ename, emp.deptno, dname from emp join dept on emp.deptno = dept.deptno;

select ename, emp.deptno, dname from emp join dept on emp.deptno = dept.deptno and loc='NEW YORK';

select ename, emp.deptno, loc from emp join dept on emp.deptno=dept.deptno and comm is not null;

select ename, job, emp.deptno, loc from emp join dept on emp.deptno = dept.deptno and ename like '%L%'

select e.ename, e.hiredate, m.ename, m.hiredate
from emp e, emp m where e.mgr = m.empno and e.hiredate<m.hiredate;