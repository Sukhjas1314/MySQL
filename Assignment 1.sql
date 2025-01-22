create database db1;

use db1;

create table student(Rno int,Name varchar(20),DOB date,Gender char(10),Class varchar(5),College varchar(50),City varchar(20),Marks float(5,2));

insert(101,"Sukhman","13-Oct-2004","M","2Q15","TIET","Patiala",99.5);
insert(102,"Daksh","22-Sep-2004","M","2C34","TIET","Patiala",89);
insert(103,"Harith","14-Aug-2004","M","2C40","TIET","Patiala",98);
insert(104,"Eshaan","3-Jan-2004","M","2Q15","TIET","Patiala",93);
insert(105,"Arshdeep","1-Mar-2004","M","2Q15","TIET","Patiala",95);

select * from student;
