                                                              -- Assignment 10


-- Q1.
CREATE TABLE emp (
    eno NUMBER, 
    ename VARCHAR2(30), 
    bp NUMBER, 
    da NUMBER, 
    hra NUMBER, 
    total NUMBER
);
INSERT INTO emp VALUES (101, 'Rahul', 10000, 3000, 2000, NULL);

CREATE OR REPLACE PROCEDURE calc_total(p_eno IN emp.eno%TYPE) IS v_total emp.total%TYPE;
BEGIN
	SELECT bp + da + hra INTO v_total FROM emp WHERE eno = p_eno;
	UPDATE emp SET total = v_total WHERE eno = p_eno;
	dbms_output.put_line('Total Salary : ' || v_total);
END;

BEGIN
	calc_total(101);
END;


-- Q2.
DECLARE
	FUNCTION factorial(n IN number) RETURN number IS
		f number := 1;
	BEGIN
		FOR i in 1..n LOOP
			f := f * i;
		END LOOP;
		RETURN f;
	END;
	result1 number;
BEGIN
	result1 := factorial(5);
	dbms_output.put_line('Factorial is : ' || result1);
END;


-- Q3.
CREATE OR REPLACE PROCEDURE check_number(n IN number) IS
BEGIN
	IF n > 0 THEN
		dbms_output.put_line('Positive');
	ELSIF n < 0 THEN
		dbms_output.put_line('Negative');
	ELSE 
		dbms_output.put_line('Zero');
	END IF;
END;
BEGIN 
	check_number(-5);
END;


-- Q4.
CREATE OR REPLACE FUNCTION sum_to_n(n in number) RETURN number IS
		s number := 0;
	BEGIN
		FOR i in 1..n LOOP
			s := s + i;
		END LOOP;
		RETURN s;
	END;
DECLARE
	result2 number;
BEGIN
	result2 := sum_to_n(5);
	dbms_output.put_line('Sum is : ' || result2);
END;
	

-- Q5.
DECLARE
	res number;
	PROCEDURE sum_of_averages(n1 IN number,n2 IN number,result OUT number) IS
		avg number := 0;
	BEGIN 
		avg := (n1 + n2) / 2;
		result := avg + avg;
	END;
BEGIN
	sum_of_averages(10,20,res);
	dbms_output.put_line('Sum of Averages : ' || res);
END;


-- Q6.
DECLARE
	FUNCTION print_string(s IN varchar,n IN number) IS
		BEGIN
			IF n > 0 THEN
				dbms_output.put_line(s);
				print_string(s,n - 1);
			END IF;
		END;
BEGIN
	print_string('hello world',10);
END;


-- Q7. - Q10.
CREATE table student(rollno number,name varchar(30),subId number,mark1 number,mark2 number,mark3 number);
INSERT INTO student values(1,'Raju',101,99,97,100);


-- Q7.
CREATE OR REPLACE PROCEDURE p1(rno IN number,total OUT number) IS
	BEGIN
		SELECT mark1+mark2+mark3 INTO total FROM student where rollno = rno;
	END;
DECLARE
	total number;
BEGIN
	p1(1,total);
	dbms_output.put_line('Total marks : ' || total);
END;


-- Q8.
DECLARE
	FUNCTION fun2(rno in number) RETURN number IS
	total number;
	avg number;
BEGIN
	p1(rno,total);
	avg := total / 3;
	return avg;
END;
DECLARE
	a number;
BEGIN
	a := fun2(1);
	dbms_output.put_line('Average marks : ' || a);
END;


-- Q9.
CREATE OR REPLACE FUNCTION fun3(rno IN number) RETURN number IS
	n1 number;
	n2 number;
	n3 number;
BEGIN 
	SELECT mark1,mark2,mark3 INTO n1,n2,n3 FROM student where rollno = rno;
	return GREATEST(n1,n2,n3);
END;
/
DECLARE
	highest number;
BEGIN
	highest := fun3(1);
	dbms_output.put_line('The highest marks are : ' || highest);
END;


-- Q10.
CREATE OR REPLACE PROCEDURE p2(rno IN number) IS
	n1 number;
	n2 number;
	n3 number;
	total number;
BEGIN
	p1(rno,total);
	SELECT mark1,mark2,mark3 INTO n1,n2,n3 FROM student where rollno = rno;
	dbms_output.put_line('Marks are : ' || n1 || ' , ' || n2 || ' , ' || n3);
	dbms_output.put_line('Total marks are : ' || total);
END;
/
BEGIN
	p2(1);
END;








