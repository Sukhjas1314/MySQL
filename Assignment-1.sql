-- ASSIGNMENT 1

--  Q1.
  CREATE TABLE STUDENT(RNO INT,NAME VARCHAR(20),DOB DATE,GENDER CHAR(10),CLASS VARCHAR(5),COLLEGE VARCHAR(50),CITY VARCHAR(20),MARKS FLOAT);

--  Q2.
  INSERT INTO STUDENT VALUES(101,"SUKHMAN","13-OCT-2004","M","2Q15","TIET","PATIALA",99.5);
  INSERT INTO STUDENT VALUES(102,"DAKSH","22-SEP-2004","M","2C34","PEC","CHANDIGARH",89);
  INSERT INTO STUDENT VALUES(103,"HARITH","14-AUG-2004","M","2C40","TIET","PATIALA",98);
  INSERT INTO STUDENT VALUES(104,"ESHAAN","3-JAN-2004","M","2Q15","CHITKARA","MOHALI",93);
  INSERT INTO STUDENT VALUES(105,"ARSHDEEP","1-MAR-2004","M","2Q15","TIET","DERABASI",95);

--  Q3.
  SELECT * FROM STUDENT;

--  Q4.
  DESCRIBE STUDENT;

--  Q5.
  SELECT RNO,NAME,CLASS FROM STUDENT WHERE CITY = "PATIALA";

--  Q6.
  SELECT * FROM STUDENT ORDER BY MARKS ASC;

--  Q7.
  UPDATE STUDENT SET MARKS = 89 WHERE RNO = 105;

--  Q8.
  UPDATE STUDENT SET NAME = "JASHAN", CITY = "GURGAON" WHERE RNO = 104;

--  Q9.
  DELETE FROM STUDENT WHERE CITY = "DERABASI";

--  Q10.
  DELETE FROM STUDENT WHERE MARKS < 30;
