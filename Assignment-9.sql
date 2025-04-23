                                                        -- Assignment 9


-- Q1.
DECLARE
	a Number := 65;
	b Number := 70;
	c Number := 63;
	greatest Number;
BEGIN
	IF a > b AND a > c THEN
		greatest := a;
	ELSIF b > c THEN
		greatest := b;
	ELSE
		greatest := c;
	END IF;
	dbms_output.put_line('Greatest number of the 3 is : ' || greatest);
END;


-- Q2.
DECLARE
	a number := 8;
BEGIN
	IF mod(a,2) = 0 THEN
		dbms_output.put_line('It is an even number');
	ELSE
		dbms_output.put_line('It is an odd number');
	END IF;
END;


-- Q3.
DECLARE
	marks number := 88;
	grade char(5);
BEGIN
	IF marks > 80 THEN
		grade := 'A';
	ELSIF marks > 70 THEN
		grade := 'B';
	ELSIF marks > 50 THEN
		grade := 'C';
	ELSIF marks > 40 THEN
		grade := 'D';
	ELSE
		grade := 'E';
	END IF;
	dbms_output.put_line('Your grade is : ' || grade);
END;


-- Q4.
DECLARE 
    num number := 20;
BEGIN 
    dbms_output.put_line('Table of ' || num);
	FOR i in 1..10 LOOP 
        dbms_output.put_line(num || ' * ' || i || ' = ' || num * i);
	END LOOP;
END;
		

-- Q5.
DECLARE 
	num number := 10;
	fact number := 1;
	i number := 1;
BEGIN
	while i <= num LOOP
		fact := fact * i;
		i := i + 1;
	END LOOP;
	dbms_output.put_line('Factorial of ' || num || ' : ' || fact);
END;


-- Q6.
DECLARE
	n1 number := 1;
	n2 number := 1;
	n3 number;
	i number := 3;
	num number := 10;
BEGIN 
	dbms_output.put_line('Fibonacci Series : ');
	dbms_output.put_line(n1);
	dbms_output.put_line(n2);
	WHILE i <= num LOOP
		n3 := n1 + n2;
		dbms_output.put_line(n3);
		n1 := n2;
		n2 := n3;
		i := i + 1;
	END LOOP;
END;


-- Q7.
DECLARE
	num number := 12544;
	remainder number;
	reverse1 number := 0;
BEGIN
	WHILE num > 0 LOOP
		remainder := MOD(num,10);
		reverse1 := (reverse1 * 10) + remainder;
		num := TRUNC(num/10);
	END LOOP;
	dbms_output.put_line('Reverse number is : ' || reverse1);
END;


-- Q8.
DECLARE 
	a number := 10;
	b number := 5;
	operator char(1) := '-';
	result1 real;
BEGIN
	CASE operator
		WHEN '+' THEN result1 := a + b;
		WHEN '-' THEN result1 := a - b;
		WHEN '*' THEN result1 := a * b;
		WHEN '/' THEN result1 := a / b;
		ELSE 
			dbms_output.put_line('No such operator');
	END CASE;
	dbms_output.put_line(a || operator || b || ' = ' || result1);
END;


-- Q9.
BEGIN
    dbms_output.put_line('Series : ');
	FOR i in 1..4 LOOP
		dbms_output.put_line(i*5);
	END LOOP;
END;


-- Q10.
DECLARE
    hour number;
BEGIN
    SELECT TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) INTO hour FROM DUAL;
	dbms_output.put_line('Message : ');
	IF hour BETWEEN 5 AND 12 THEN
        dbms_output.put_line('Good Morning');
	ELSIF hour BETWEEN 12 AND 16 THEN
        dbms_output.put_line('Good Afternoon');
	ELSIF hour BETWEEN 16 AND 20 THEN
        dbms_output.put_line('Good Evening');
	ELSE
        dbms_output.put_line('Good Night');
	END IF;
END;
END;
