DROP DATABASE managerment_ban_hang1;

create database managerment_ban_hang1;

use managerment_ban_hang1;

CREATE TABLE customer (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(25),
    c_age TINYINT
);

CREATE TABLE `order` (
    o_id INT PRIMARY KEY,
    c_id INT,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id),
    o_date DATETIME,
    o_total_price INT
);

CREATE TABLE product (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(25),
    p_price INT
);

CREATE TABLE order_detail (
    o_id INT,
    FOREIGN KEY (o_id)
        REFERENCES `order` (o_id),
    p_id INT,
    FOREIGN KEY (p_id)
        REFERENCES product (p_id),
    od_qty INT
);

insert into customer(c_id,c_name,c_age)
	values 	(1,'Minh Quan',10),
			(2,'Ngoc Oanh',20),
			(3,'Hong Ha',50);

insert into `order`(o_id,c_id,o_date,o_total_price)
	values 	('1','1','2006/03/21',null),
			('2','2','2006/03/23',null),
			('3','1','2006/03/16',null);
        
insert into product(p_id,p_name,p_price)
	values 	(1,'May Giat',3),
			(2,'Tu Lanh',5),
			(3,'Dieu Hoa',7),
			(4,'Quat',1),
			(5,'Bep Dien',2);

insert into order_detail(o_id,p_id,od_qty)
	values 	(1,1,3),
			(1,3,7),
			(1,4,2),
			(2,1,1),
			(3,1,8),
			(2,5,4),
			(2,3,3);
        
-- hiển thị các thông tin o_id,o_date,o_price
SELECT 
    o_id, o_date, o_total_price
FROM
    `order`;

-- hiển thị danh sách khách đã mua hàng , và các sản phẩm đã được mua bởi khách hàng 
SELECT c.c_name , o.o_id , od.od_qty,p.p_name
FROM customer c
join `order` o 
on c.c_id = o.c_id 
join order_detail od 
on o.o_id = od.o_id 
join product p on od.p_id = p.p_id ; 

-- Hiển thị khách hàng không mua hàng .
SELECT c.c_id ,c.c_name
FROM customer c 
left join `order`o 
on c.c_id = o.c_id 
where o.c_id is null ;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn  
SELECT 	o.o_id , o.o_date , 
		sum(od.od_qty*p.p_price) as total_price
FROM `order`o
join order_detail od on o.o_id = od.o_id 
join product p on od.p_id = p.p_id 
group by o.o_id;

