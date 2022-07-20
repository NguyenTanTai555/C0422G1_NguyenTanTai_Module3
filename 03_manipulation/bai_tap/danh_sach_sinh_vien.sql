DROP DATABASE IF EXISTS managerment_sinh_vien;

CREATE DATABASE managerment_sinh_vien;

USE managerment_sinh_vien;

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
	VALUES ('Hung' ,'Ha Noi ','0912113113',1,1) ,
			('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO student (student_name, address, `status`, class_id)
	VALUES ('Hoa', 'Hai phong', 1, 1);

INSERT INTO `Subject`
	VALUES (1, 'CF', 5, 1),
		   (2, 'C', 6, 1),
		   (3, 'HDJ', 5, 1),
		   (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, student_id, mark, exam_times)
	VALUES (1, 1, 8, 1),
		   (1, 2, 10, 2),
		   (2, 1, 12, 1);
           
SELECT *
FROM student
WHERE student_name REGEXP '^[h]';

SELECT *
FROM student s
        JOIN class c ON c.class_id = s.class_id;

SELECT *
	FROM student s
	JOIN class c ON c.class_id = s.class_id
	WHERE c.class_name = 'A1';

SELECT *
		FROM student s
        JOIN`subject` x ON s.`status` = x.`status`
		WHERE x.sub_name = 'CF';

SELECT 
    s.student_id,
    s.student_name,
    x.sub_name,
    m.mark
FROM student s
	JOIN mark m ON s.student_id = m.student_id
	JOIN`subject` x ON m.sub_id = x.sub_id;

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT *
FROM class
WHERE MONTH(start_day) >= 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT *
FROM `subject` sub
WHERE sub.credit BETWEEN 3 AND 5;

 -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET sql_safe_updates = 0 ;

UPDATE student 
	SET class_id = 2
	WHERE student_name = 'Hung';

SET sql_safe_updates = 1;

SELECT 	student_name,
		sub_name, mark
FROM student s
        JOIN`subject` sub ON s.`status` = sub.`status`
        LEFT JOIN mark m ON sub.sub_id = mark_id
WHERE m.mark
ORDER BY m.mark ASC;




