                                                              -- Assignmnet 10


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
DECLARE
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
DECLARE
	FUNCTION sum_to_n(n in number) RETURN number IS
		s number := 0;
	BEGIN
		FOR i in 1..n LOOP
			s := s + i;
		END LOOP;
		RETURN s;
	END;
	result2 number;
BEGIN
	result2 := sum_to_n(5);
	dbms_output.put_line('Sum is : ' || result2);
END;
	

























