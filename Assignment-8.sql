                                        -- ASSIGNMENT 8
CREATE TABLE Sailors (
    sid INTEGER PRIMARY KEY,
    sname VARCHAR2(50),
    rating INTEGER,
    age NUMBER
);
CREATE TABLE Boats (
    bid INTEGER PRIMARY KEY,
    bname VARCHAR2(50),
    color VARCHAR2(20)
);
CREATE TABLE Reserves (
    sid INTEGER,
    bid INTEGER,
    day DATE,
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

INSERT INTO Sailors VALUES (1, 'John', 7, 25);
INSERT INTO Sailors VALUES (2, 'Paul', 8, 30);
INSERT INTO Sailors VALUES (3, 'Horatio', 5, 35);
INSERT INTO Sailors VALUES (4, 'Anna', 6, 28);

INSERT INTO Boats VALUES (101, 'Voyager', 'red');
INSERT INTO Boats VALUES (102, 'Neptune', 'green');
INSERT INTO Boats VALUES (103, 'Titanic', 'blue');
INSERT INTO Boats VALUES (104, 'Falcon', 'red');

INSERT INTO Reserves VALUES (1, 101, TO_DATE('2024-01-01','YYYY-MM-DD'));
INSERT INTO Reserves VALUES (1, 102, TO_DATE('2024-01-05','YYYY-MM-DD'));
INSERT INTO Reserves VALUES (2, 101, TO_DATE('2024-01-07','YYYY-MM-DD'));
INSERT INTO Reserves VALUES (3, 102, TO_DATE('2024-01-08','YYYY-MM-DD'));
INSERT INTO Reserves VALUES (3, 103, TO_DATE('2024-01-10','YYYY-MM-DD'));
INSERT INTO Reserves VALUES (4, 103, TO_DATE('2024-01-12','YYYY-MM-DD'));


-- Q1.
  SELECT DISTINCT s.sname
  FROM Sailors s
  JOIN Reserves r ON s.sid = r.sid 
  JOIN Boats b ON r.bid = b.bid 
  WHERE b.color IN ('red', 'green');


-- Q2.
  SELECT s.sname
  FROM Sailors s
  WHERE s.sid IN (
      SELECT r1.sid
      FROM Reserves r1
      JOIN Boats b1 ON r1.bid = b1.bid
      WHERE b1.color = 'red'
  )
  AND s.sid IN (
      SELECT r2.sid
      FROM Reserves r2
      JOIN Boats b2 ON r2.bid = b2.bid
      WHERE b2.color = 'green'
  );


-- Q3.
  SELECT DISTINCT s.sname
  FROM Sailors s
  JOIN Reserves r ON s.sid = r.sid
  WHERE r.bid = 103;


-- Q4.
  SELECT DISTINCT s.sname
  FROM Sailors s
  JOIN Reserves r ON s.sid = r.sid
  JOIN Boats b ON r.bid = b.bid
  WHERE b.color = 'red';


-- Q5.
  SELECT s.sname
  FROM Sailors s
  WHERE s.sid NOT IN (
      SELECT r.sid
      FROM Reserves r
      JOIN Boats b ON r.bid = b.bid
      WHERE b.color = 'red'
  );


-- Q6.
  SELECT DISTINCT s.sname
  FROM Sailors s
  JOIN Reserves r ON s.sid = r.sid;


-- Q7.
  SELECT s.sname
  FROM Sailors s
  WHERE s.rating > ANY (
      SELECT rating FROM Sailors WHERE sname = 'Horatio'
  );


-- Q8.
  SELECT s.sname
  FROM Sailors s
  WHERE s.rating > ALL (
      SELECT rating FROM Sailors WHERE sname = 'Horatio'
  );


-- Q9.
  SELECT sname
  FROM Sailors
  WHERE rating = (
      SELECT MAX(rating) FROM Sailors
  );


-- Q10.
  SELECT s.sname
  FROM Sailors s
  WHERE NOT EXISTS (
      SELECT b.bid
      FROM Boats b
      MINUS
      SELECT r.bid
      FROM Reserves r
      WHERE r.sid = s.sid
  );




