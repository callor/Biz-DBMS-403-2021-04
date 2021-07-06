CREATE DATABASE mybook;
USE mybook;
CREATE TABLE tbl_books (
	bk_isbn	CHAR(13)		PRIMARY KEY,
	bk_title	VARCHAR(125)	NOT NULL,	
	bk_ccode	CHAR(5)	NOT NULL,	
	bk_acode	CHAR(5)	NOT NULL,	
	bk_date	VARCHAR(10),		
	bk_price	INT,		
	bk_pages	INT		
);

CREATE TABLE tbl_company (
	cp_code	CHAR(5)		PRIMARY KEY,
	cp_title	VARCHAR(125)	NOT NULL,	
	cp_ceo	VARCHAR(20),		
	cp_tel	VARCHAR(20),		
	cp_addr	VARCHAR(125),		
	cp_genre	VARCHAR(10)		
);
CREATE TABLE tbl_author (
	au_code	CHAR(5) PRIMARY KEY,
	au_name	VARCHAR(50) NOT NULL,
	au_tel	VARCHAR(20),
	au_addr	VARCHAR(125),
	au_genre	VARCHAR(30)
);
SELECT * FROM tbl_company ;
DELETE FROM tbl_company WHERE cp_code ='C051';

use mybook;
SELECT * FROM tbl_author;
SELECT * FROM tbl_company;

use mybook;
DESC tbl_books;
SELECT * FROM tbl_books;








