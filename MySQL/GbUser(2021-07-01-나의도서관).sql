CREATE DATABASE myLibs;
USE myLibs;
CREATE TABLE tbl_books (
	title	VARCHAR(255),	
	link	VARCHAR(255),	
	image	VARCHAR(255),	
	author	VARCHAR(50)	,
	price	INT	,
	discount	INT,	
	publisher	VARCHAR(50),	
	isbn	CHAR(13)	PRIMARY KEY,
	description	VARCHAR(2000),	
	pubdate	VARCHAR(20),	
);


