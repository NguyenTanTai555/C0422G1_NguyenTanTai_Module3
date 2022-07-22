USE furuma_managerment ;
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Yên Bái ” và 
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “25/04/2021”.
CREATE VIEW v_nhan_vien as
SELECT 	nv.ma_nhan_vien,
		nv.ho_ten,
        nv.so_dien_thoai,
        nv.email,
        nv.dia_chi
FROM nhan_vien nv
	JOIN hop_dong hd
    ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE nv.dia_chi like '% Yên Bái%'  
		AND hd.ngay_lam_hop_dong = '2021-04-25';
        
select *
from v_nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu”
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set sql_safe_updates = 0;
UPDATE v_nhan_vien
SET v_nhan_vien.dia_chi = 'Liên Chiểu';
set sql_safe_updates = 1;
SELECT *
FROM v_nhan_vien;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang
-- được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter $$
create procedure sp_xoa_khach_hang (id int )
BEGIN
set foreign_key_checks = 0 ;
DELETE 
FROM khach_hang kh
WHERE kh.ma_khach_hang = id ;
END $$ 
delimiter ;
-- gọi sp :
call sp_xoa_khach_hang(2);
-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong 
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter $$
CREATE PROCEDURE sp_them_moi_hop_dong(ngay_lam DATETIME , ngay_ket DATETIME , tien_dat_coc DOUBLE ,ma_nhan_vien int , ma_khach_hang int , ma_dich_vu int )
BEGIN 
	SET FOREIGN_KEY_CHECKS = 0 ;
	IF (EXISTS 
		(SELECT nv.ma_nhan_vien FROM nhan_vien nv WHERE ma_nhan_vien = nv.ma_nhan_vien)
	AND 
        EXISTS(SELECT kh.ma_khach_hang FROM khach_hang kh WHERE ma_khach_hang = kh.ma_khach_hang)
	AND 
		EXISTS(SELECT dv.ma_dich_vu FROM dich_vu dv WHERE ma_dich_vu = dv.ma_dich_vu))
	THEN
	INSERT INTO hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
    VALUES (ngay_lam ,ngay_ket,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu);
    ELSE 
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Khong Them duoc hop dong ';
    END IF;
END $$
delimiter ;
-- gọi sp thêm hợp đồng:
call sp_them_moi_hop_dong('2022-07-21' , '2022-07-30','1000000',2,5,1);
call sp_them_moi_hop_dong('2022-07-11' , '2022-07-15','1000000',2,5,100); -- mã dịch vụ không tồn tại nên không thêm được
call sp_them_moi_hop_dong('2022-07-11' , '2022-07-15','1000000',2,100,100);-- mdv và mkh ko tồn tại nên ko thêm dc hợp đồng;

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì 
-- hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
