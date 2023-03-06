DROP DATABASE IF EXISTS cis197_summer_2022;

CREATE DATABASE IF NOT EXISTS cis197_summer_2022;

USE cis197_summer_2022;

CREATE USER IF NOT EXISTS 'pccUser'@'localhost';
SET PASSWORD FOR 'pccUser'@'localhost' = 'pccUser';
GRANT ALL PRIVILEGES ON `pccUser`.* TO 'pccUser'@'localhost' WITH GRANT OPTION;

CREATE USER IF NOT EXISTS 'pccUser'@'%';
SET PASSWORD FOR 'pccUser'@'%' = 'pccUser';
GRANT ALL PRIVILEGES ON `pccUser`.* TO 'pccUser'@'%' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `cis197_summer_2022`.* TO 'pccUser'@'localhost';

FLUSH PRIVILEGES;

CREATE TABLE user (
	username VARCHAR(20) NOT NULL,
	pass VARCHAR(20) NOT NULL,
	display_name VARCHAR(20) NOT NULL,
	user_role VARCHAR(20) NOT NULL,
	PRIMARY KEY(username)
);

CREATE TABLE cimt(
	username VARCHAR(20) NOT NULL,
	phone_num VARCHAR(10) NOT NULL,
	PRIMARY KEY(username)
);

CREATE TABLE resource_provider (
	username VARCHAR(20) NOT NULL,
	strt_addr VARCHAR(50) NOT NULL,
	PRIMARY KEY(username)
);

CREATE TABLE admin_user (
	username VARCHAR(20) NOT NULL,
	email VARCHAR(30) UNIQUE NOT NULL,
	PRIMARY KEY(username)
);

CREATE TABLE incident (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	descript VARCHAR(50) NOT NULL,
	inc_date DATE DEFAULT (current_date()) NOT NULL,
	inc_owner VARCHAR(20) NOT NULL,
	cat_id VARCHAR(5) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE category (
	id VARCHAR(5)  NOT NULL ,
	cat_type VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE emergency_resource (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	res_owner VARCHAR(20) NOT NULL, 
	res_name VARCHAR (20) NOT NULL,
	prim_func_num MEDIUMINT NOT NULL,
	price DECIMAL(7,2) NOT NULL,
	unit_id MEDIUMINT NOT NULL,
	descript VARCHAR(50) DEFAULT NULL,
	distance DECIMAL(4,1)DEFAULT NULL,
	sec_func_num MEDIUMINT DEFAULT NULL,
	capabilities VARCHAR(200)DEFAULT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE unit (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
	unit_name VARCHAR(20) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE func (
	func_num MEDIUMINT NOT NULL AUTO_INCREMENT,
	func_name VARCHAR(20) NOT NULL,
	PRIMARY KEY(func_num)	
);

ALTER TABLE cimt
	ADD CONSTRAINT cimts_user_fk FOREIGN KEY (username) REFERENCES user(username);

ALTER TABLE resource_provider
	ADD CONSTRAINT res_user_fk FOREIGN KEY (username) REFERENCES user(username);

ALTER TABLE admin_user
	ADD CONSTRAINT admin_user_fk FOREIGN KEY (username) REFERENCES user(username);

ALTER TABLE incident
	ADD CONSTRAINT inc_owner_fk FOREIGN KEY (inc_owner) REFERENCES user(username);

ALTER TABLE incident
    ADD CONSTRAINT inc_cat_id_fk FOREIGN KEY (cat_id) REFERENCES category(id);

ALTER TABLE emergency_resource
	ADD CONSTRAINT res_owner_fk FOREIGN KEY (res_owner) REFERENCES user(username);

ALTER TABLE emergency_resource
	ADD CONSTRAINT res_prim_func_fk FOREIGN KEY (prim_func_num) REFERENCES func(func_num);

ALTER TABLE emergency_resource
	ADD CONSTRAINT unit_id_fk FOREIGN KEY (unit_id) REFERENCES unit(id);