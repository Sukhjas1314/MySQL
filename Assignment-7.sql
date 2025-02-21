-- ASSIGNMENT 7

-- Q1.
-- Table 1 : Salespeople
  CREATE TABLE SalesPeople (Snum NUMBER PRIMARY KEY,Sname VARCHAR2(50) UNIQUE,City VARCHAR2(50),Comm NUMBER(5,2));

  INSERT INTO SalesPeople VALUES (1001,'Peel','London',0.12);
  INSERT INTO SalesPeople VALUES (1002,'Serres','Sanjose',0.13);
  INSERT INTO SalesPeople VALUES (1004,'Motika','London',0.11);
  INSERT INTO SalesPeople VALUES (1007,'Rifkin','Barcelona',0.15);
  INSERT INTO SalesPeople VALUES (1003,'Axelrod','New York',0.10);


-- Table 2 : Customers
  CREATE TABLE Customers(Cnum NUMBER PRIMARY KEY,Cname VARCHAR2(50),City VARCHAR2(50) NOT NULL,Snum NUMBER,CONSTRAINT fk_snum FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum));

  INSERT INTO Customers VALUES (2001,'Hoffman','London',1001);
  INSERT INTO Customers VALUES (2002,'Giovanni','Rome',1003);
  INSERT INTO Customers VALUES (2003,'Liu','Sanjose',1002);
  INSERT INTO Customers VALUES (2004,'Grass','Berlin',1002);
  INSERT INTO Customers VALUES (2006,'Clemens','London',1001);
  INSERT INTO Customers VALUES (2008,'Cisneros','Sanjose',1007);
  INSERT INTO Customers VALUES (2007,'Pereira','Rome',1004);


-- Table 3 : Orders
  CREATE TABLE Orders(Onum NUMBER PRIMARY KEY,Amt NUMBER(10,2),Odate DATE,Cnum NUMBER,Snum NUMBER,CONSTRAINT fk_cnum FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),CONSTRAINT fk_snum_orders FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum));

  INSERT INTO Orders VALUES (3001,18.69,TO_DATE('03-10-1990','DD-MM-YYYY'),2008,1007);
  INSERT INTO Orders VALUES (3003,767.19,TO_DATE('03-10-1990','DD-MM-YYYY'),2001,1001);
  INSERT INTO Orders VALUES (3002,1900.10,TO_DATE('03-10-1990','DD-MM-YYYY'),2007,1004);
  INSERT INTO Orders VALUES (3005,5160.45,TO_DATE('03-10-1990','DD-MM-YYYY'),2003,1002);
  INSERT INTO Orders VALUES (3006,1098.16,TO_DATE('03-10-1990','DD-MM-YYYY'),2008,1007);
  INSERT INTO Orders VALUES (3009,1713.23,TO_DATE('04-10-1990','DD-MM-YYYY'),2002,1003);
  INSERT INTO Orders VALUES (3007,75.75,TO_DATE('04-10-1990','DD-MM-YYYY'),2004,1002);
  INSERT INTO Orders VALUES (3008,4273.00,TO_DATE('05-10-1990','DD-MM-YYYY'),2006,1001);
  INSERT INTO Orders VALUES (3010,1309.95,TO_DATE('06-10-1990','DD-MM-YYYY'),2004,1002);
  INSERT INTO Orders VALUES (3011,9891.88,TO_DATE('06-10-1990','DD-MM-YYYY'),2006,1001);


-- Q2.
  SELECT SNUM,SNAME FROM SALESPEOPLE WHERE SNUM IN (SELECT SNUM FROM ORDERS GROUP BY SNUM HAVING SUM(AMT) > 2000);


-- Q3.
  SELECT SNUM FROM CUSTOMERS GROUP BY SNUM HAVING COUNT(CNUM) >= 2;


-- Q4.
  SELECT SNAME FROM SALESPEOPLE WHERE SNUM IN (SELECT SNUM FROM CUSTOMERS GROUP BY SNUM HAVING COUNT(CNUM) >= 2);


-- Q5.
  SELECT CITY,COUNT(*) FROM SALESPEOPLE WHERE CITY IN ('London','Paris') GROUP BY CITY;


-- Q6.
  SELECT CNAME FROM CUSTOMERS WHERE SNUM IN (SELECT SNUM FROM SALESPEOPLE WHERE CITY IN ('London','Paris'));


-- Q7.
  SELECT CNAME FROM CUSTOMERS WHERE CNUM IN (SELECT CNUM FROM ORDERS WHERE AMT = 1200);


-- Q8.
  SELECT CNAME FROM CUSTOMERS WHERE CITY IN (SELECT CITY FROM SALESPEOPLE WHERE SALESPEOPLE.SNUM = CUSTOMERS.SNUM);


-- Q9.
  SELECT SNAME FROM SALESPEOPLE WHERE COMM > 0.10 AND SNUM IN (SELECT SNUM FROM CUSTOMERS GROUP BY SNUM HAVING COUNT(CNUM) > 2);


-- Q10.
  SELECT C.CNAME,S.SNAME FROM CUSTOMERS C JOIN SALESPEOPLE S ON C.SNUM = S.SNUM WHERE C.CNUM IN (SELECT CNUM FROM ORDERS GROUP BY CNUM HAVING COUNT(ONUM) = 1);


-- Q11.
  INSERT INTO SALESPEOPLE (SNUM,SNAME,CITY,COMM) VALUES (1010,'NewSales','Paris',0.09);
  SELECT SNAME FROM SALESPEOPLE WHERE SNUM NOT IN (SELECT DISTINCT SNUM FROM CUSTOMERS);


-- Q12.
  SELECT ODATE,COUNT(*) AS COUNT_SALESPEOPLE FROM ORDERS GROUP BY ODATE;


-- Q13.
  SELECT COUNT(*) FROM SALESPEOPLE WHERE (CITY,COMM) IN (SELECT CITY,COMM FROM SALESPEOPLE GROUP BY CITY,COMM HAVING COUNT(*) > 1);
