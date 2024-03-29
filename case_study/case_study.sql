DROP DATABASE IF EXISTS furuma_managerment;

create database furuma_managerment;

use furuma_managerment;

CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY auto_increment,
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach)
	REFERENCES loai_khach (ma_loai_khach),
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY auto_increment ,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT NOT NULL,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    ma_loai_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu),
    tieu_chuan_phong VARCHAR(45),
    mo_ta_ten_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT NOT NULL,
    ma_khach_hang INT NOT NULL,
    ma_dich_vu INT NOT NULL,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
	so_luong INT NOT NULL,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

insert into vi_tri(ma_vi_tri,ten_vi_tri) 
values 	(1,'Quản Lý'),
		(2,'Nhân Viên');
        
insert into trinh_do 
values 	(1,'Trung Cấp'),
		(2,'Cao Đẳng'),
        (3,'Đại Học'),
        (4,'Sau Đại Học');
        
insert into bo_phan
values 	(1,'Sales-Marketing'),
		(2,'Hành Chính'),
		(3,'Phục Vụ'),
        (4,'Quản Lý');

INSERT INTO
 furuma_managerment.nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) 
	VALUES 	('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
			('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
			('3', 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
			('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
			('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
			('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
			('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
			('8', 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
			('9', 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
			('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');

INSERT INTO furuma_managerment.loai_khach (ma_loai_khach, ten_loai_khach)
	 VALUES ('1', 'Diamond'),
			('2', 'Platinium'),
			('3', 'Gold'),
			('4', 'Silver'),
			('5', 'Member');
            
INSERT INTO furuma_managerment.kieu_thue (ma_kieu_thue, ten_kieu_thue)
	VALUES 	('1', 'year'),
			('2', 'month'),
			('3', 'day'),
			('4', 'hour');
            
INSERT INTO furuma_managerment.loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu) 
	VALUES 	('1', 'Villa'),
			('2', 'House'),
			('3', 'Room');
            
INSERT INTO furuma_managerment.dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai) 
	VALUES 	('1', 'Karaoke', '10000', 'giờ', 'tiện nghi, hiện tại'),	
			('2', 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe'),
			('3', 'Thuê xe đạp', '20000', 'chiếc', 'tốt'),
			('4', 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
			('5', 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
			('6', 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
            
 INSERT INTO furuma_managerment.khach_hang(ma_khach_hang, ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
VALUES ('1', '5', 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
  ('2', '3', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
  ('3', '1', 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
  ('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
  ('5', '4', 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
  ('6', '4', 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
  ('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
  ('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
  ('9', '1', 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
  ('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
  
INSERT INTO furuma_managerment.dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_ten_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem) 
VALUES	('1', 'Villa Beach Front', '25000', '1000000', '10', '3', '1', 'vip', 'Có hồ bơi', '500', '4', null),
		('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'vip', 'Có thêm bếp nướng', null, '3', null),
		('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp'),
		('4', 'Villa No Beach Front', '22000', '9000000', '8', '3', '1', 'normal', 'Có hồ bơi', '300', '3', 'null'),
		('5', 'House Princess 02', '10000', '4000000', '5', '3', '2', 'normal', 'Có thêm bếp nướng', null, '2', null),
		('6', 'Room Twin 02', '3000', '900000', '2', '4', '3', 'normal', 'Có tivi', null, null, '1 Xe máy');
	
INSERT INTO furuma_managerment.hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) 
VALUES 	('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3'),
     	('2', '2020-07-14', '2020-07-21', '2000000', '7', '3', '5'),
		('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2'),
		('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5'),
		('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6'),
		('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6'),
		('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4'),
		('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1'),
		('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3'),
		('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5'),
		('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1'),
		('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');

INSERT INTO hop_dong_chi_tiet (ma_hop_dong_chi_tiet, ma_hop_dong, ma_dich_vu_di_kem, so_luong) 
VALUES ('1', '2', '4', '5'),
 ('2', '2', '5', '8'),
 ('3', '2', '6', '15'),
 ('4', '3', '1', '1'),
 ('5', '3', '2', '11'),
 ('6', '1', '3', '1'),
 ('7', '1', '2', '2'),
 ('8', '12', '2', '2');
 Select *
 FRom dich_vu;
 
 DELIMITER $$
 create procedure findAllService()
 begin
 Select *
 From dich_vu;
 End $$
 DELIMITER ;
 
-- xóa khách hàng
DELIMITER $$ 
CREATE procedure delete_customer(IN id int)
BEGIN
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM khach_hang
		Where khach_hang.ma_khach_hang = id ;
SET FOREIGN_KEY_CHECKS=1;
END $$
DELIMITER ;

--
DELIMITER //
CREATE PROCEDURE edit_facility(
					IN id INT,
                    IN name VARCHAR(45),
                    IN area INT,
                    IN deposit DOUBLE,
                    IN max_people INT,
					IN rent_type INT,
					IN facility_type INT,
                    IN standard_room VARCHAR(45),
                    IN description VARCHAR(45),
                    IN pool_area DOUBLE,
                    IN number_floor INT,
                    IN facility_free VARCHAR(45))
BEGIN
SET sql_safe_updates = 0;
UPDATE dich_vu
	set 
		ten_dich_vu = name,
        dien_tich = area,
        chi_phi_thue = deposit,
        so_nguoi_toi_da = max_people,
        ma_kieu_thue = rent_type,
        ma_loai_dich_vu = facility_type,
        tieu_chuan_phong = standard_room,
        mo_ta_ten_tien_nghi_khac = description,
        dien_tich_ho_boi = pool_area,
        so_tang = number_floor,
        dich_vu_mien_phi_di_kem = facility_free
WHERE ma_dich_vu = id;
SET sql_safe_updates = 1;
END //                    
DELIMITER ;

-- all customer find
DELIMITER $$
Create Procedure findAllCustomer()
Begin
Select * 
From khach_hang;
END $$
DELIMITER ;
call findAllCustomer();
-- thêm customer
DELIMITER //
CREATE PROCEDURE insert_new_customer(
					 IN type_id INT,
                     IN name VARCHAR(45),
                     IN date_of_birth DATE,
                     IN gender BIT(1),
                     IN id_card VARCHAR(45),
                     IN phone_number VARCHAR(45),
                     IN email VARCHAR(45),
                     IN address VARCHAR(45))
BEGIN
INSERT INTO khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
VALUES (type_id, name, date_of_birth, gender, id_card, phone_number, email, address);
END //                     
DELIMITER ;

-- sửa
DELIMITER //
CREATE PROCEDURE edit_customer(
					 IN id INT,
					 IN type_id INT,
                     IN name VARCHAR(45),
                     IN date_of_birth DATE,
                     IN gender BIT(1),
                     IN id_card VARCHAR(45),
                     IN phone_number VARCHAR(45),
                     IN email VARCHAR(45),
                     IN address VARCHAR(45))
BEGIN
UPDATE khach_hang kh
	SET ma_loai_khach = type_id,
	    ho_ten = name,
	    ngay_sinh = date_of_birth,
		gioi_tinh = gender,
		so_cmnd = id_card,
		so_dien_thoai = phone_number,
		dia_chi = address
WHERE kh.ma_khach_hang = id AND 
		ma_loai_khach IN (SELECT lk.ma_loai_khach FROM loai_khach lk);
END //                     
DELIMITER ;


---
DELIMITER //
CREATE PROCEDURE edit_facility(
					IN id INT,
                    IN name VARCHAR(45),
                    IN area INT,
                    IN deposit DOUBLE,
                    IN max_people INT,
					IN rent_type INT,
					IN facility_type INT,
                    IN standard_room VARCHAR(45),
                    IN description VARCHAR(45),
                    IN pool_area DOUBLE,
                    IN number_floor INT,
                    IN facility_free VARCHAR(45))
BEGIN
UPDATE dich_vu
	set 
		ten_dich_vu = name,
        dien_tich = area,
        chi_phi_thue = deposit,
        so_nguoi_toi_da = max_people,
        ma_kieu_thue = rent_type,
        ma_loai_dich_vu = facility_type,
        tieu_chuan_phong = standard_room,
        mo_ta_ten_tien_nghi_khac = description,
        dien_tich_ho_boi = pool_area,
        so_tang = number_floor,
        dich_vu_mien_phi_di_kem = facility_free
WHERE ma_dich_vu = id;
END //                    
DELIMITER ;

---
DELIMITER //
CREATE PROCEDURE delete_facility(
				IN id INT)
BEGIN
SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM dich_vu 
	WHERE ma_dich_vu = id;
SET FOREIGN_KEY_CHECKS=1;
END //                
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE addNewFacility(in `name` varchar(55), 
								dien_tich_moi int,
                                gia double,
                                nguoi int,
                                phong varchar(55),
                                tien_nghi varchar(55),
                                ho_boi double,
                                tang int,
                                mien_phi varchar(100),
                                kieu_thue int,
                                loai_dich_vu int)
BEGIN
   INSERT INTO dich_vu ( ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_ten_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu)
   value(`name`,dien_tich_moi,gia,nguoi,phong,tien_nghi,ho_boi,tang,mien_phi,kieu_thue,loai_dich_vu);
END $$
DELIMITER ;




