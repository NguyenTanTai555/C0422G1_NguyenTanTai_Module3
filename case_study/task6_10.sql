USE furruma_managerment;

-- task 6

SELECT 	dv.ma_dich_vu,
		dv.ten_dich_vu,
        dv.dien_tich,
        dv.chi_phi_thue,
        ldv.ten_loai_dich_vu,
        hd.ngay_lam_hop_dong
FROM dich_vu dv
JOIN loai_dich_vu ldv 
ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
JOIN hop_dong hd 
ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE
 dv.ma_dich_vu NOT IN (
 SELECT hd.ma_dich_vu 
 FROM hop_dong hd
 WHERE 
 (hd.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-03-31')
 OR (hd.ngay_ket_thuc BETWEEN '2021-01-01' AND '2021-03-31'))
 GROUP BY dv.ma_dich_vu;

-- task 7 
SELECT  dv.ma_dich_vu ,
		dv.ten_dich_vu,
        dv.dien_tich ,
		dv.so_nguoi_toi_da,
        dv.chi_phi_thue ,
        ldv.ten_loai_dich_vu ,
        hd.ngay_lam_hop_dong
FROM dich_vu dv  
JOIN loai_dich_vu ldv
ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
JOIN hop_dong hd
ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE
(hd.ngay_lam_hop_dong and hd.ngay_ket_thuc BETWEEN '2020-01-01' AND '2020-12-31') 
AND hd.ma_dich_vu 
NOT IN (SELECT  hd.ma_dich_vu
FROM hop_dong hd
where
(hd.ngay_lam_hop_dong and hd.ngay_ket_thuc between '2021-01-01' AND '2021-12-31'))
group by dv.ma_dich_vu; 

-- task 8 :

-- cach 1
SELECT ho_ten
FROM khach_hang
GROUP BY ho_ten;

-- cach 2
SELECT distinct ho_ten
FROM 
khach_hang ;

-- cach 3
SELECT 
    t.ho_ten
FROM
    (SELECT 
        ho_ten, COUNT(ho_ten) AS a
    FROM
        khach_hang
    GROUP BY ho_ten
    HAVING a > 1) AS t;
    
-- task 9 :

SELECT 
MONTH(hd.ngay_lam_hop_dong) as thang ,
COUNT(MONTH(hd.ngay_lam_hop_dong)) as so_luong_khach
FROM hop_dong hd
WHERE
hd.ngay_lam_hop_dong  between '2021-01-01' and '2021-12-31'
GROUP BY thang
ORDER BY thang; 

-- task 10 :

SELECT 	hd.ma_hop_dong ,
		hd.ngay_lam_hop_dong,
        hd.ngay_ket_thuc,
        hd.tien_dat_coc,
        sum(hdct.so_luong) as so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;

    
