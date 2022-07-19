DROP DATABASE IF EXISTS managerment_sinh_vien2;

CREATE DATABASE managerment_sinh_vien2;

USE managerment_sinh_vien2;

CREATE TABLE class
(
	class_id int primary key ,
    class_name varchar(40) not null ,
    start_day date ,
    `status` boolean 
);

CREATE TABLE student 
(
	student_id int auto_increment primary key ,
	student_name varchar(40) not null ,
	address varchar(40) ,
    phone varchar (15)  ,
    `status` boolean ,
    class_id int ,
    foreign key (class_id) references class(class_id)
);

CREATE TABLE `subject` 
(
	sub_id int primary key ,
	sub_name varchar(40) ,
    credit int ,
    `status` boolean 
    
);

CREATE TABLE mark 
(
	mark_id int auto_increment primary key ,
    sub_id int  ,
    foreign key (sub_id) references `subject`(sub_id),
    student_id int ,
    foreign key (student_id) references student(student_id),
    mark int ,
    exam_times int 
);

INSERT INTO class 
	VALUES (1,'A1','2008-12-20',1) ;

INSERT INTO class
	VALUES (2,'A2' ,'2008-12-22',1);
    
INSERT INTO	class
	VALUES (3,'B3',current_date(),0);
    
INSERT INTO student (student_name ,address,phone,`status`,class_id)
	VALUES ('Hung' ,'Ha Noi ','0912113113',1,1) ;

INSERT INTO student (student_name, address, `status`, class_id)
	VALUES ('Hoa', 'Hai phong', 1, 1);

INSERT INTO student (student_name, address, phone, `status`, class_id)
	VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO `Subject`
	VALUES (1, 'CF', 5, 1),
		   (2, 'C', 6, 1),
		   (3, 'HDJ', 5, 1),
		   (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, student_id, mark, exam_times)
	VALUES (1, 1, 8, 1),
		   (1, 2, 10, 2),
		   (2, 1, 12, 1);
           
-- hiển thị credit lớn nhất trong bảng subject
SELECT *
FROM subject
WHERE
    Credit = (SELECT 
            MAX(Credit)
        FROM
            subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 	s.sub_id ,
		s.sub_name,
		m.mark
FROM `subject` s
	JOIN mark m
	ON s.sub_id = m.sub_id
where m.mark = (select max(m.mark) from mark m);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT 	s.student_id,
		s.student_name,
        s.address,
        avg(m.mark) as diem_trung_binh
FROM student s
	JOIN mark m
	ON s.student_id = m.student_id
group by s.student_name
order by m.mark desc;
