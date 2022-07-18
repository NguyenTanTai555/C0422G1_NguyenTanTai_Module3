USE furuma_managerment ;

SELECT *
FROM nhan_vien 
WHERE ho_ten REGEXP '^[HKT]' AND char_length(ho_ten) <= 15;

-- hiển thị khách hàng >18 và <50 tuổi , ở Đà Nẵng và Quảng Trị
SELECT 
    *
FROM
    khach_hang
WHERE
    (YEAR(CURDATE()) - YEAR(khach_hang.ngay_sinh) BETWEEN 18 AND 50)
        AND (khach_hang.dia_chi LIKE '% Đà Nẵng'
        OR khach_hang.dia_chi LIKE '% Quảng Trị');

-- task 4        
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    COUNT(hd.ma_khach_hang) AS so_lan_dat_phong
FROM
    khach_hang kh
        JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE
    lk.ma_loai_khach = 1
GROUP BY ma_khach_hang 
ORDER BY so_lan_dat_phong;

-- task 5 :
SELECT 	kh.ma_khach_hang ,
		kh.ho_ten ,
        lk.ten_loai_khach,
        hd.ma_hop_dong ,
        dv.ten_dich_vu ,
        hd.ngay_lam_hop_dong,
        hd.ngay_ket_thuc,
        (dv.chi_phi_thue + ifnull(hdct.so_luong*dvdk.gia,0)) as tong_tien 
FROM khach_hang kh
LEFT JOIN hop_dong hd
ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN hop_dong_chi_tiet hdct
ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk
ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
LEFT JOIN dich_vu dv
ON dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN loai_khach lk
ON lk.ma_loai_khach = kh.ma_loai_khach
GROUP BY hd.ma_hop_dong , kh.ma_khach_hang
ORDER BY kh.ma_khach_hang ;