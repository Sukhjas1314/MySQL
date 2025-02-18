-- ASSIGNMENT 5

-- Q1.
  CREATE TABLE dept(deptno INT PRIMARY KEY,dept_name VARCHAR(20) CHECK (dept_name IN ('Acc','comp','elect')));

-- Q2.
  CREATE TABLE emp (
    empno NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50) UNIQUE,
    job VARCHAR2(20) CHECK (job IN ('Prof', 'AP', 'Lect')),
    sal NUMBER(10,2) NOT NULL,
    deptno NUMBER,
    mgr_no NUMBER,
    CONSTRAINT fk_dept FOREIGN KEY (deptno) REFERENCES dept(deptno),
    CONSTRAINT fk_mgr FOREIGN KEY (mgr_no) REFERENCES emp(empno)
  );

-- Q3.
  CREATE TABLE S(sno INT PRIMARY KEY,sname VARCHAR(50),city VARCHAR(50));

-- Q4.
  CREATE TABLE P(pno INT PRIMARY KEY,pname VARCHAR(50),color VARCHAR(20));

-- Q5.
  CREATE TABLE J(jno INT PRIMARY KEY,jname VARCHAR(50),city VARCHAR(50));

-- Q6.
  CREATE TABLE SPJ (
    sno NUMBER,
    pno NUMBER,
    jno NUMBER,
    qty NUMBER,
    CONSTRAINT pk_spj PRIMARY KEY (sno, pno, jno),
    CONSTRAINT fk_s FOREIGN KEY (sno) REFERENCES S(sno),
    CONSTRAINT fk_p FOREIGN KEY (pno) REFERENCES P(pno),
    CONSTRAINT fk_j FOREIGN KEY (jno) REFERENCES J(jno)
  );

-- Q7.
  INSERT INTO dept VALUES (101, 'Acc');
  INSERT INTO dept VALUES (102, 'comp');
  INSERT INTO dept VALUES (103, 'elect');

  INSERT INTO emp VALUES (100, 'Alice', 'Prof', 50000, 101, NULL);
  INSERT INTO emp VALUES (101, 'Bob', 'AP', 40000, 102, 100);
  INSERT INTO emp VALUES (102, 'Charlie', 'Lect', 35000, 103, 101);
  INSERT INTO emp VALUES (103, 'David', 'Prof', 60000, 101, NULL);
  INSERT INTO emp VALUES (104, 'Eve', 'AP', 45000, 102, 100);

  INSERT INTO S VALUES (1, 'John', 'New York');
  INSERT INTO S VALUES (2, 'Mike', 'Los Angeles');
  INSERT INTO S VALUES (3, 'Sara', 'Chicago');

  INSERT INTO P VALUES (10, 'PartA', 'Red');
  INSERT INTO P VALUES (20, 'PartB', 'Blue');
  INSERT INTO P VALUES (30, 'PartC', 'Green');

  INSERT INTO J VALUES (1001, 'ProjectX', 'Boston');
  INSERT INTO J VALUES (1002, 'ProjectY', 'Seattle');
  INSERT INTO J VALUES (1003, 'ProjectZ', 'Austin');

  INSERT INTO SPJ VALUES (1, 10, 1001, 5);
  INSERT INTO SPJ VALUES (2, 20, 1002, 10);
  INSERT INTO SPJ VALUES (3, 30, 1003, 15);

-- Q8.
  ALTER TABLE emp MODIFY sal NULL;

-- Q9.
  SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP';

-- Q10.
  ALTER TABLE emp DROP CONSTRAINT UNIQUE;

-- Q11.
  ALTER TABLE emp DROP CONSTRAINT fk_dept;

-- Q12.
  ALTER TABLE emp ADD CONSTRAINT fk_dept FOREIGN KEY (deptno) REFERENCES dept(deptno);

-- Q13.
  ALTER TABLE dept DROP CONSTRAINT CHECK;

-- Q14.
  ALTER TABLE emp ADD comm NUMBER(10,2) DEFAULT 0;

-- Q15.
  ALTER TABLE emp MODIFY comm DEFAULT NULL;

-- Q16.
  CREATE TABLE emp_copy AS SELECT * FROM emp;

-- Q17.
  CREATE TABLE new_dept AS SELECT deptno AS department_id, dept_name AS department_name FROM dept WHERE 1=0;

-- Q18.
  CREATE TABLE dept_structure AS SELECT * FROM dept WHERE 1=0;

-- Q19.
  UPDATE emp SET emp_name = 'Alice Smith', job = 'Lect' WHERE empno = 100;

-- Q20.
  DELETE FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE dept_name = 'comp');

-- Q21.
  UPDATE emp SET deptno = NULL WHERE deptno = 101;
  DELETE FROM dept WHERE deptno = 101;

-- Q22.
  DELETE FROM emp WHERE deptno = 102;
  DELETE FROM dept WHERE deptno = 102;

-- Q23.
  DELETE FROM emp WHERE empno = 111 
  AND empno IN (SELECT mgr_no FROM emp WHERE empno = 114);

-- Q24.
  UPDATE emp SET mgr_no = NULL WHERE mgr_no = 112;
  DELETE FROM emp WHERE empno = 112;

-- Q25.
  DROP TABLE emp_copy;
