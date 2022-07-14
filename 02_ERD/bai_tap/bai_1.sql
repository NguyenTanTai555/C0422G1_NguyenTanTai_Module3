DROP DATABASE IF EXISTS xuat_nhap_hang;

CREATE DATABASE xuat_nhap_hang;

use xuat_nhap_hang;

CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY,
    ngay_xuat DATE NOT NULL
);

CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY,
    ten_vat_tu VARCHAR(50)
);

CREATE TABLE chi_tiet_phieu_xuat (
    don_gia_xuat DOUBLE NOT NULL,
    so_luong_xuat INT,
    so_phieu_xuat INT,
    PRIMARY KEY (ma_vat_tu , so_phieu_xuat),
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    ma_vat_tu INT,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE chi_tiet_phieu_nhap (
    don_gia_nhap DOUBLE,
    so_luong_nhap INT,
    ma_vat_tu INT,
    PRIMARY KEY (ma_vat_tu , so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    so_phieu_nhap INT,
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap)
);
 
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50)
);
 
CREATE TABLE so_dien_thoai (
    so_dien_thoai VARCHAR(50) primary key,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
 
CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY,
    ngay_dat_hang DATE,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
 
CREATE TABLE chi_tiet_don_dat_hang (
    PRIMARY KEY (ma_vat_tu , so_don_hang),
    ma_vat_tu INT,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    so_don_hang INT,
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang)
);