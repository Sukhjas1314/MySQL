                                          -- Assignment 6


-- Q1.
CREATE TABLE DEPT1(DEPTNO NUMBER PRIMARY KEY,DEPTNAME VARCHAR(20));
INSERT INTO DEPT1 VALUES(10, 'Accounts');
INSERT INTO DEPT1 VALUES(20, 'Sales');
INSERT INTO DEPT1 VALUES(30, 'HR');
INSERT INTO DEPT1 VALUES(40, 'IT');
INSERT INTO DEPT1 VALUES(50, 'Marketing');

CREATE TABLE EMP1(EMPNO NUMBER,EMPNAME VARCHAR(20),DEPTNO NUMBER,JOB VARCHAR(30),SALARY NUMBER,FOREIGN KEY(DEPTNO) REFERENCES DEPT1(DEPTNO));
INSERT INTO EMP1 VALUES(101, 'Alice', 10, 'Manager', 5000);
INSERT INTO EMP1 VALUES(102, 'Bob', 20, 'Salesman', 3000);
INSERT INTO EMP1 VALUES(103, 'Carol', 30, 'HR', 3500);
INSERT INTO EMP1 VALUES(104, 'David', 10, 'Clerk', 2000);
INSERT INTO EMP1 VALUES(105, 'Eve', 20, 'Salesman', 2800);
INSERT INTO EMP1 VALUES(106, 'Frank', 30, 'HR', 4000);
INSERT INTO EMP1 VALUES(107, 'Grace', 40, 'Developer', 4500);
INSERT INTO EMP1 VALUES(108, 'Heidi', 50, 'Executive', 3800);
INSERT INTO EMP1 VALUES(109, 'Ivan', 40, 'Developer', 4700);
INSERT INTO EMP1 VALUES(110, 'Judy', 50, 'Manager', 5500);


-- Q2.
SELECT COUNT(*) FROM EMP1;


-- Q3.
SELECT COUNT(*) FROM DEPT1;


-- Q4.
SELECT D.DEPTNAME,E.* FROM EMP1 E JOIN DEPT1 D ON E.DEPTNO = D.DEPTNO;


-- Q5.
SELECT SUM(SALARY),MAX(SALARY),MIN(SALARY) FROM EMP1 WHERE DEPTNO = 30;


-- Q6.
SELECT EMPNAME FROM EMP1 WHERE SALARY = (SELECT MAX(SALARY) FROM EMP1);


-- Q7.
SELECT DEPTNO,SUM(SALARY) AS TOTAL_SALARY FROM EMP1 GROUP BY DEPTNO;


-- Q8.
SELECT JOB,SUM(SALARY) AS TOTAL_SALARY FROM EMP1 GROUP BY JOB;


-- Q9.
SELECT DEPTNO,JOB,SUM(SALARY) AS TOTAL_SALARY FROM EMP1 GROUP BY DEPTNO,JOB;


-- Q10.
SELECT JOB,AVG(SALARY) FROM EMP1 WHERE DEPTNO = 20 GROUP BY JOB;


-- Q11.
SELECT JOB,SUM(SALARY) FROM EMP1 WHERE JOB NOT IN('MANAGER','SALESMAN') GROUP BY JOB;


-- Q12.
SELECT JOB,AVG(SALARY) AS AVG_SALARY FROM EMP1 WHERE DEPTNO = 20 GROUP BY JOB HAVING AVG(SALARY) > 2000 ORDER BY AVG_SALARY DESC;


-- Q13.
SELECT DEPTNO,COUNT(*) AS TOTAL_EMP FROM EMP1 WHERE DEPTNO <> 10 GROUP BY DEPTNO HAVING COUNT(*) > 5 ORDER BY TOTAL_EMP DESC;


-- Q14.
SELECT E.DEPTNO,D.DEPTNAME,COUNT(*) AS TOTAL_EMP FROM EMP1 E JOIN DEPT1 D ON E.DEPTNO = D.DEPTNO WHERE DEPTNAME <> 'COMP' GROUP BY E.DEPTNO,D.DEPTNAME HAVING COUNT(*) > 5 ORDER BY TOTAL_EMP DESC;


-- Q15.
SELECT DEPTNO,JOB,COUNT(*) AS TOTAL_EMP FROM EMP1 GROUP BY DEPTNO,JOB;


-- Q16.
SELECT D.DEPTNAME,E.EMPNAME FROM DEPT1 D LEFT JOIN EMP1 E ON E.DEPTNO = D.DEPTNO;


-- Q17.
SELECT E.EMPNAME,D.DEPTNAME FROM EMP1 E LEFT JOIN DEPT1 D ON E.DEPTNO = D.DEPTNO;


-- Q18.
SELECT D.DEPTNAME,E.EMPNAME FROM DEPT1 D FULL OUTER JOIN EMP1 E ON D.DEPTNO = E.DEPTNO;
