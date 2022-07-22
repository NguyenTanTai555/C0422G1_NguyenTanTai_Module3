USE internship;

-- 1.	Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
SELECT 	instructor_id,
		instructor_name,
        faculty_name
FROM instructor
JOIN faculty
ON instructor.faculty_id = faculty.faculty_id; 

-- 2.	Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’
SELECT 	i.instructor_id,
		i.instructor_name,
        f.faculty_name
FROM instructor i
JOIN faculty f
ON f.faculty_id = i.faculty_id
WHERE f.faculty_name = 'Dia ly va QLTN';

-- 3.	Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
SELECT 	COUNT(faculty_id) as sl_sv_bio
FROM student 
where faculty_id = 'Bio'
group by faculty_id;

-- 4.	Đưa ra danh sách gồm mã số, họ tên và tuổi của các sinh viên khoa ‘TOAN’
SELECT 	s.student_id,
		s.student_name,
        year(now()) - date_of_birth as age
FROM student s
WHERE s.faculty_id = 'Math';

-- 5.	Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’
SELECT count(*) as sl_instructor
FROM instructor i
WHERE i.faculty_id = 'Bio' ;

-- 6.	Cho biết thông tin về sinh viên không tham gia thực tập


