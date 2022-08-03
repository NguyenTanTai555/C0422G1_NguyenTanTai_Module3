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
        Insert into users(`name`,email,country) 
values ('Minh','minh@codegym.com.vn','Viet Nam'),
		('Kante','kante@che.uk','Kenia');

Insert into users(`name`,email,country) 
values ('Minh','minh@codegym.com.vn','Viet Nam'),
		('Kante','kante@che.uk','Kenia');


CREATE TABLE Permision(
	id int(11) primary key,
    name varchar(50)
);

CREATE TABLE User_Permision(
	permision_id int(11),
    user_id int(11)
);

INSERT INTO Permision(id,name) 
	VALUES 	(1,'add'),
			(2,'edit'),
			(3,'delete'),
			(4,'view');
            
-- Định nghĩa Stored Procedures get_user_by_id và insert_user

-- tìm kiếm user từ id 
DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users
    where users.id = user_id;
    END$$
DELIMITER ;

-- phương thức thêm user
DELIMITER $$

CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END$$
DELIMITER ;

-- display user
DELIMITER $$
CREATE PROCEDURE display_list_user()
BEGIN
	SELECT *
	FROM users;
    END $$
DELIMITER ;

-- edit user
DELIMITER $$
CREATE PROCEDURE update_user(IN id int ,`name` varchar(50),email varchar(50),country varchar(50))
	BEGIN
	UPDATE users
	set `name` = `name` , email = email , country = country
	where users.id = id;
	END $$
DELIMITER ;

-- delete user
DELIMITER $$
CREATE PROCEDURE delete_user(IN user_id int)
	BEGIN
	DELETE  
	FROM users
	WHERE id = user_id ; 
	END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE select_all_user(in id int)
	BEGIN
	SELECT *
    FROM users where id = id;
	END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE 
DELIMITER ;
