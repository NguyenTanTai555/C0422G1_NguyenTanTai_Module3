create database student_managerment;
DROP DATABASE IF EXISTS Student_managerment;

CREATE TABLE class (
    id INT AUTO_INCREMENT,
    name_class VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE teacher (
    id INT AUTO_INCREMENT,
    name_teacher VARCHAR(50),
    age DATE,
    country VARCHAR(50),
    PRIMARY KEY (id)
);

insert into class(name_class) 
	values ('C04'),('C05');
insert into Teacher(name_teacher,age,country) 
	values ('Hùng','1990-01-13','Đà Nẵng');
    
select *
from class;
select *
from Teacher;

