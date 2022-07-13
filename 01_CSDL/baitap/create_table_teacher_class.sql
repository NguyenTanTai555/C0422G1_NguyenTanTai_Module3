create database Student_managerment;
create table class(
	id int auto_increment,
    name_class varchar(50),
    primary key(id)
);
create table Teacher(
	id int auto_increment,
    name_teacher varchar(50),
    age date ,
    country varchar(50),
    primary key(id)
);
insert into class(name_class) values ('C04'),('C05');
insert into Teacher(name_teacher,age,country) values ('Hùng','1990-01-13','Đà Nẵng');
select *from class;
select *from Teacher;

