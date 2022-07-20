USE furuma_managerment;

-- task 16 : xóa những nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021

SET sql_safe_updates = 0 ;
DELETE 
	FROM nhan_vien
	WHERE 
		ma_nhan_vien NOT IN (SELECT temp.ma_nhan_vien FROM (SELECT 
            hd.ma_nhan_vien
            FROM hop_dong hd 
				JOIN nhan_vien nv
				ON hd.ma_nhan_vien = nv.ma_nhan_vien
            WHERE 
            DATE (hd.ngay_lam_hop_dong) between '2019-01-01' AND '2021-12-31'
            GROUP BY hd.ma_nhan_vien)temp);
            
	SET sql_safe_updates = 1 ;
    
-- task 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinium lên Diamond
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ
UPDATE khach_hang
SET  khach_hang.ma_loai_khach = 1
WHERE 
	khach_hang.ma_khach_hang = (select temp.ma_khach_hang from (SELECT 
            kh.ma_khach_hang
        FROM
            khach_hang kh
                JOIN
            hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
                JOIN
            hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
                JOIN
            dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
                JOIN
            dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
                JOIN
            loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        WHERE
            (lk.ten_loai_khach = 'Platinium'
                AND YEAR(hd.ngay_lam_hop_dong) = '2021')
                AND (dvdk.gia * hdct.so_luong + dv.chi_phi_thue) > 1000000)temp);
                
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates = 0 ;
set Foreign_key_checks = 0;
DELETE
FROM khach_hang
WHERE ma_khach_hang IN (SELECT
			ma_khach_hang
		FROM hop_dong hd
        WHERE YEAR(ngay_lam_hop_dong)<2021);
set sql_safe_updates = 1;
set Foreign_key_checks = 1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates =0;
UPDATE dich_vu_di_kem
SET gia = gia*2
WHERE ma_dich_vu_di_kem IN (
				SELECT
				ma_dich_vu_di_kem
				FROM hop_dong_chi_tiet hdct 
                JOIN hop_dong hd
                ON hdct.ma_hop_dong = hd.ma_hop_dong
                WHERE 
                YEAR (hd.ngay_lam_hop_dong) = 2020 
                GROUP BY hdct.ma_dich_vu_di_kem
                HAVING SUM(hdct.so_luong)>10
                );
set sql_safe_updates =1;

-- task 20 :	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi

SELECT 	ma_nhan_vien ,
		ho_ten,
        email,
        so_dien_thoai,
        ngay_sinh,
        dia_chi
FROM nhan_vien
UNION
SELECT
		ma_khach_hang,
        ho_ten,
        email,
        so_dien_thoai,
		ngay_sinh,
        dia_chi
FROM khach_hang ;