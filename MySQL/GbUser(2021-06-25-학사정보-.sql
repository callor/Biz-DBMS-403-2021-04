CREATE DATABASE db_school;
USE db_school;
drop table tbl_student;
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

DROP TABLE tbl_score;
CREATE TABLE tbl_score (
	-- sc_seq	BIGINT	AUTO_INCREMENT, --	PRIMARY KEY,
	sc_stnum	char(8)	NOT NULL,	
	sc_sbcode	char(4)	NOT NULL,	
	sc_score	INT	NOT NULL,
    PRIMARY KEY(sc_stnum,sc_sbcode)
);

INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S001',90);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S002',90);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S003',90);
SELECT * FROm tbl_score;

DROP TABLE tbl_subject;
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

SELECT * FROM tbl_score;
SELECT * FROm tbl_subject;

SELECT sc_seq,
					sc_stnum,
					ST.st_name stname,
					sc_sbcode,
					SB.sb_name sbname,
					sc_score
			FROM tbl_score SC
				LEFT JOIN tbl_student ST
					ON SC.sc_stnum = ST.st_num
				LEFT JOIN tbl_subject SB
					ON SC.sc_sbcode = SB.sb_code
			ORDER BY sc_stnum, sc_sbcode;

select * from tbl_subject;
DELETE FROM tbl_subject WHERE sb_code = '과목코드';
select * from tbl_student;

USE db_school;
select * from tbl_score;
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
VALUES('20210001','S001',88);
/*
tbl_subject, tbl_score table을 가지고
각 학생의 성적 리스트를 출력해보기
과목 리스트를 출력하고,
각 과목의 성적이 입력된 학생의 리스트를 확인하기

학번을 조건으로하여 한 학생의 성적입력 여부를 확인하기

학생의 점수가 입력된 과목과 입력되지 않은 과목을
확인하고 싶다
*/
-- subquery
SELECT SB.sb_code, SB.sb_name, SB.sb_prof,
		SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN 
		(SELECT * FROM tbl_score WHERE sc_stnum = '2021001' ) SC
		ON SC.sc_sbcode = SB.sb_code;
/*
과목리스트를 전체 보여주고,
학생의 성적 table을 JOIN하여
학생의 점수가 있으면 점수를 보이고
없으면 null로 보여주는 JOI SQL문

이 JOIN 명령문에
특정한 학번을 조건으로 부여하여
한 학생의 성적여부를 조회하는 SQL만들기

순수한 JOIN을 사용하여 한 학생의 성적을 조회하는데
학생의 성적이 tbl_score table에 있으면 점수를 보이고
없으면 NULL 표현하기 위하여
WHERE 절에서 학번을 조건으로 부여하지 않고
JOIN문의 ON 절에 학번을 조건으로 부여한다

*/
SELECT SB.sb_code, SB.sb_name, SB.sb_prof,
		SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN tbl_score SC
		ON SC.sc_sbcode = SB.sb_code 
        AND SC.sc_stnum = '2021001' LIMIT 5;

 
USE db_school;

SELECT COUNT(*) FROM tbl_score
WHERE sc_stnum = '2021002';

SELECT * FROM tbl_score;




