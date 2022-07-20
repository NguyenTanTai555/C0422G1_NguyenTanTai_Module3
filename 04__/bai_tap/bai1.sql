DROP DATABASE IF EXISTS managerment_sinh_vien2;

CREATE DATABASE managerment_sinh_vien2;

USE managerment_sinh_vien2;

CREATE TABLE class
(
	class_id INT PRIMARY KEY ,
    class_name VARCHAR(40) NOT NULL ,
    start_day DATE ,
    `status` BOOLEAN 
);

CREATE TABLE student 
(
	student_id INT AUTO_INCREMENT PRIMARY KEY ,
	student_name VARCHAR(40) NOT NULL ,
	address VARCHAR(40) ,
    phone VARCHAR (15)  ,
    `status` BOOLEAN ,
    class_id INT ,
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE `subject` 
(
	sub_id INT PRIMARY KEY ,
	sub_name VARCHAR(40) ,
    credit INT ,
    `status` BOOLEAN 
    
);

CREATE TABLE mark 
(
	mark_id INT AUTO_INCREMENT PRIMARY KEY ,
    sub_id INT  ,
    FOREIGN KEY (sub_id) REFERENCES `subject`(sub_id),
    student_id INT ,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    mark INT ,
    exam_times INT 
);

INSERT INTO class 
	VALUES 	(1,'A1','2008-12-20',1),
			(2,'A2' ,'2008-12-22',1),
			(3,'B3',CURRENT_DATE(),0);
    
INSERT INTO student (student_name ,address,phone,`status`,class_id)
	VALUES 	('Hung' ,'Ha Noi ','0912113113',1,1) ,
			('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO student (student_name, address, `status`, class_id)
	VALUES ('Hoa', 'Hai phong', 1, 1);



INSERT INTO `subject`
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
FROM `subject`
WHERE
    credit = (SELECT 
            MAX(credit)
        FROM
            subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 	s.sub_id ,
		s.sub_name,
		m.mark
FROM `subject` s
JOIN mark m
ON s.sub_id = m.sub_id
WHERE m.mark = (SELECT max(m.mark) FROM mark m);

-- HiỂn thỊ CÁC thông tIn sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT 	s.student_id,
		s.student_name,
        s.address,
        AVG(m.mark) AS diem_trung_binh
FROM studeNt s
	JOIN mark m
	ON s.student_id = m.student_id
GROUP BY s.student_id
ORDER BY diem_trung_binh DESC;
