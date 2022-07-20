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
