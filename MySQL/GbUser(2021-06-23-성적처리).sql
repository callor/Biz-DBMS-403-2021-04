CREATE DATABASE db_school;
USE db_school;
CREATE TABLE tbl_student (
	st_num	CHAR(8)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,	
	st_dept	VARCHAR(20)	NOT NULL,	
	st_grade	INT	NOT NULL,	
	st_tel	VARCHAR(15)	NOT NULL,	
	st_addr	VARCHAR(125)		
);
INSERT INTO 
tbl_student(st_num, 
	st_name,
	st_dept, 
	st_grade,
	st_tel)
VALUES('2021001',
	'홍길동',
    '컴공과',3,
    '010-111-1234');    
    COMMIT ;

DROP tbl_score;
CREATE TABLE tbl_score (
	sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	sc_stnum	char(8)	NOT NULL,	
	sc_sbcode	char(4)	NOT NULL,	
	sc_score	INT	NOT NULL	
);

INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S001',90);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S002',90);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S003',90);
SELECT * FROm tbl_score;

CREATE TABLE tbl_subject (
	sb_code	CHAR(4)	PRIMARY KEY,
	sb_name	varchar(20)	NOT NULL,	
	sb_prof	varchar(20)		
);
INSERT INTO tbl_subject(sb_code,sb_name)
VALUES('S001','국어');
INSERT INTO tbl_subject(sb_code,sb_name)
VALUES('S002','영어');
INSERT INTO tbl_subject(sb_code,sb_name)
VALUES('S003','수학');
INSERT INTO tbl_subject(sb_code,sb_name)
VALUES('S004','음악');
INSERT INTO tbl_subject(sb_code,sb_name)
VALUES('S005','과학');







