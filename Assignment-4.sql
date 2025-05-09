-- Assignment 4


-- Q1.
  SELECT SYSDATE FROM DUAL;

-- Q2.
  SELECT TO_CHAR(SYSDATE,'DAY') AS DAY FROM DUAL;

-- Q3.
  SELECT TO_CHAR(SYSDATE,'MONTH,YYYYSP') FROM DUAL;

-- Q4.
  SELECT TO_CHAR(SYSDATE,'DDSP-MMSP-YYYYSP') FROM DUAL;

-- Q5.
  SELECT TO_CHAR(SYSDATE,'AM') AS AM_PM FROM DUAL;

-- Q6.
  SELECT NEXT_DAY(SYSDATE,'FRIDAY') AS NEXT_FRIDAY FROM DUAL;

-- Q7.
  SELECT ROUND(SYSDATE,'MONTH') AS ROUNDED_MONTH FROM DUAL;

-- Q8.
  SELECT TRUNC(SYSDATE,'MONTH') AS TRUNCATED_MONTH FROM DUAL;

-- Q9.
  SELECT ROUND(SYSDATE,'YEAR') AS ROUNDED_YEAR FROM DUAL;

-- Q10.
  SELECT TRUNC(SYSDATE,'YEAR') AS TRUNCATED_YEAR FROM DUAL;

-- Q11.
  SELECT ROUND(SYSDATE+3) AS 3_DAYS_AFTER_TODAY FROM DUAL;

-- Q12.
  CREATE TABLE EMP(EMPNO INT,NAME VARCHAR(20),DOJ DATE);
  INSERT INTO EMP5 VALUES(101,'SUKHMAN','01-OCT-2025');
  INSERT INTO EMP5 VALUES(102,'DAKSH','15-JAN-2024');
  INSERT INTO EMP5 VALUES(103,'HARITH','19-DEC-2024');
  INSERT INTO EMP5 VALUES(104,'ARSH','04-SEP-2025');
  INSERT INTO EMP5 VALUES(105,'ESHAAN','10-MAR-2025');

-- Q13.
  SELECT TO_CHAR(DOJ,'DAY') AS DAY_DOJ FROM EMP;

-- Q14.
  SELECT NAME FROM EMP WHERE TO_CHAR(DOJ,'FMDAY') = 'MONDAY';

-- Q15.
  SELECT NAME FROM EMP WHERE TO_CHAR(DOJ,'FMMONTH,FMYEAR') = TO_CHAR(SYSDATE,'FMMONTH,FMYEAR');

-- Q16.
  SELECT NAME FROM EMP WHERE DOJ BETWEEN ROUND(SYSDATE-31) AND SYSDATE;

-- Q17.
  CREATE TABLE TRAIN(TRAINNO INT PRIMARY KEY,DOD DATE,TOA TIMESTAMP,TOD TIMESTAMP);

-- Q18.
  INSERT INTO TRAIN VALUES(100001,'31-JAN-2025','31-JAN-2025 05:15:00 PM','31-JAN-2025 5:25:00 PM');
  INSERT INTO TRAIN VALUES(100002,'1-FEB-2025','1-FEB-2025 06:10:00 AM','1-FEB-2025 6:25:00 AM');
  INSERT INTO TRAIN VALUES(100003,'2-MAR-2025','2-MAR-2025 08:30:00 PM','31-MAR-2025 08:45:00 PM');
  INSERT INTO TRAIN VALUES(100004,'3-FEB-2025','3-FEB-2025 10:50:00 AM','3-FEB-2025 11:00:00 AM');
  INSERT INTO TRAIN VALUES(100005,'5-FEB-2025','5-FEB-2025 07:38:00 PM','5-FEB-2025 07:50:00 PM');

-- Q19.
  SELECT * FROM TRAIN;

-- Q20.
  SELECT TO_CHAR(TOA,'HH24:MI:SS') AS TOA_TIME,TO_CHAR(TOD,'HH24:MI:SS') AS TOD_TIME FROM TRAIN;

-- Q21.
  SELECT * FROM TRAIN WHERE TO_CHAR(TOA,'AM') = 'PM';

-- Q22.
  SELECT TRAINNO FROM TRAIN WHERE TOD BETWEEN CURRENT_TIMESTAMP AND CURRENT_TIMESTAMP + INTERVAL '1' HOUR;
      -- OR
  SELECT TRAINNO FROM TRAIN WHERE TOD BETWEEN SYSDATE AND (SYSDATE + 1/24);














