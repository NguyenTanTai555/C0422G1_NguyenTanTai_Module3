DROP DATABASE IF EXISTS user_management;
CREATE DATABASE user_management;
USE user_management;

CREATE TABLE users (
	id int(3) auto_increment not null ,
    `name` varchar(120) not null ,
    email varchar(120) not null ,
    country varchar(120) not null ,
    primary key(id)
);

Insert into users(`name`,email,country) 
values ('Minh','minh@codegym.com.vn','Viet Nam'),
		('Kante','kante@che.uk','Kenia');
