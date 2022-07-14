DROP DATABASE IF EXISTS  managerment_ban_hang;

CREATE DATABASE managerment_ban_hang;

use managerment_ban_hang;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    age INT
);

CREATE TABLE `order` (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    total_price DOUBLE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_price DOUBLE NOT NULL
);

CREATE TABLE order_detail (
    order_detail_qty INT NOT NULL PRIMARY KEY,
    order_id INT,
    product_id INT,
    FOREIGN KEY (order_id)
        REFERENCES `order` (order_id),
    FOREIGN KEY (product_id)
        REFERENCES product (product_id)
);