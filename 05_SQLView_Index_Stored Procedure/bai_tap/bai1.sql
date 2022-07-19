-- Bước 1 :
DROP DATABASE IF EXISTS demo;

CREATE DATABASE demo;

USE demo ;

CREATE TABLE products(
	id int primary key auto_increment,
    productCode varchar(10) ,
    productName varchar(50),
    productPrice int ,
    productAmount int ,
    productDescription text ,
    productStatus int 
);

-- Bước 2:
INSERT INTO products (productCode,productName,productPrice,productAmount,productDescription,productStatus)
	VALUES 	('SP001','red bull','15000',15,'tăng lực','1'),
			('SP002','revice','15000',50,'bù nước','2'),
			('SP003','pepsi','15000',25,'vị quế','2'),
			('SP004','7up','15000',30,'vị chanh','1'),
			('SP005','aquafina',10000,100,'không màu không mùi','2');
            
SELECT *
FROM products;

-- Bước 3
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX i_productCode 
		ON products(productCode);
        
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX i_composite 
		ON products(productName , productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN
SELECT productCode
FROM  products;

-- Bước 4 :
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tạo view
CREATE VIEW w_product AS
SELECT 	s.productCode,
		s.productName,
		s.productPrice,
		s.productStatus
FROM products s;
-- Sử dụng view 
SELECT *
FROM w_product;

-- Tiến hành sửa đổi view
INSERT INTO w_product 
VALUES ('SP006','tiger',15000,1);

-- Tiến hành xoá view
DROP VIEW w_product;

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 -- tạo procedure hiển thị sản phẩm
 delimiter $$
 CREATE procedure display_all_product()
 begin
	select 	*
    from products p;
    end $$
delimiter ;

-- tạo procedure thêm mới sản phẩm
delimiter $$
create procedure insert_product(IN productCode varchar(10),productName varchar(50),productPrice int)
begin
insert into products(productCode,productName,productPrice)
values(productCode,productName,productPrice);
end$$
delimiter ;

-- tạo procedure  sửa sản phẩm theo id
delimiter $$
create procedure update_product(IN new_id int, newName varchar(50))
begin
UPDATE products
set productName = newName
where id = new_id ;
end $$
delimiter ;

-- tạo procedure xóa sản phẩm theo id
delimiter $$
create procedure delete_product(product_id int)
begin
DELETE
FROM products 
where id = product_id ;
end $$
delimiter ;

-- gọi procedure 
call display_all_product();
call insert_product('SP007','Huda','14000');
call update_product(1,'Heniken');
call delete_product(2)





