use  furuma_managerment;

-- task 11 :
SELECT 
    dvdk.ma_dich_vu_di_kem ,
    dvdk.ten_dich_vu_di_kem
FROM
hop_dong hd
JOIN khach_hang kh
ON hd.ma_khach_hang = kh.ma_khach_hang
JOIN hop_dong_chi_tiet hdct
ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk
ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
JOIN loai_khach lk
ON lk.ma_loai_khach = kh.ma_loai_khach
JOIN dich_vu dv
ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE lk.ten_loai_khach like 'Diamond'
		and kh.dia_chi like '% Vinh' or kh.dia_chi like '% Quảng Ngãi';
        
-- task 12 :
SELECT 
    hd.ma_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM
    hop_dong hd
        left join
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        left join
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        left join
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        left join
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
		left join
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE
    (MONTH(hd.ngay_lam_hop_dong) in (10,11,12))
        AND hd.ngay_lam_hop_dong NOT IN (SELECT 
            hd.ma_hop_dong
        FROM
            hop_dong hd
        WHERE
            (hd.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-06-30'))
            group by ma_hop_dong;
            
-- task 13 :Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT 	dvdk.ma_dich_vu_di_kem,
		dvdk.ten_dich_vu_di_kem,
        sum(hdct.so_luong) as so_luong
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
JOIN hop_dong hd 
ON hd.ma_hop_dong = hdct.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem
HAVING so_luong = (SELECT max(hdct.so_luong)
	FROM hop_dong_chi_tiet hdct
);

-- task 14 :.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
SELECT 	dvdk.ma_dich_vu_di_kem,
		dvdk.ten_dich_vu_di_kem,
        sum(hdct.so_luong) as so_luong
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
JOIN hop_dong hd 
ON hd.ma_hop_dong = hdct.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem
HAVING so_luong =1;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT 	nv.ma_nhan_vien,
		nv.ho_ten,
        td.ten_trinh_do,
        bp.ten_bo_phan,
        nv.so_dien_thoai,
        nv.dia_chi
FROM nhan_vien nv
JOIN trinh_do td
on nv.ma_trinh_do = td.ma_trinh_do
JOIN bo_phan bp
on nv.ma_bo_phan = bp.ma_bo_phan
JOIN hop_dong hd
on hd.ma_nhan_vien = nv.ma_nhan_vien
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3
order by nv.ma_nhan_vien







    