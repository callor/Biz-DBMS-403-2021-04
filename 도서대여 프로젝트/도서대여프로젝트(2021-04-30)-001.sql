-- bookUser 접속
CREATE TABLE tbl_books (
    bk_isbn	CHAR(13)		PRIMARY KEY,
    bk_title	nVARCHAR2(125)	NOT NULL,	
    bk_ccode	CHAR(5)	NOT NULL,	
    bk_acode	CHAR(5)	NOT NULL,	
    bk_date	VARCHAR2(10),		
    bk_price	NUMBER,		
    bk_pages	NUMBER		
);
CREATE TABLE tbl_company (

    cp_code	CHAR(5)		PRIMARY KEY,
    cp_title	nVARCHAR2(125)	NOT NULL,	
    cp_ceo	nVARCHAR2(20),		
    cp_tel	VARCHAR2(20),		
    cp_addr	nVARCHAR2(125),		
    cp_genre	nVARCHAR2(10)		

);

CREATE TABLE tbl_author (
    au_code	CHAR(5)		PRIMARY KEY,
    au_name	nVARCHAR2(50)	NOT NULL,	
    au_tel	VARCHAR2(20),		
    au_addr	nVARCHAR2(125),		
    au_genre	nVARCHAR2(30)		
);

SELECT COUNT(*) FROM tbl_books;
SELECT COUNT(*) FROM tbl_company;
SELECT COUNT(*) FROM tbl_author;

-- 3의 table을 JOIN
DROP VIEW view_도서정보;
CREATE VIEW view_도서정보 AS
(
    SELECT B.bk_isbn AS ISBN,
            B.bk_title AS 도서명,
            C.cp_title AS 출판사명,
            C.cp_ceo AS 출판사대표,
            A.au_name AS 저자명,
            A.au_tel AS 저자연락처,
            B.bk_date AS 출판일,
            B.bk_price As 가격,
            B.bk_pages AS 페이지
    FROM tbl_books B
        LEFT JOIN tbl_company C
            ON B.bk_ccode = C.cp_code
        LEFT JOIN tbl_author A
            ON B.bk_acode = A.au_code
);

-- 단독 Table로 생성된 VIEW는 INSERt, UPDATE, DELETE를
-- 실행할 수 있다
-- Table JOIN한 결과로 생성된 VIEW는 읽기전용
--      INSERT, UPDATE, DELETE를 실행할 수 없다

SELECT * FROM view_도서정보;

DELETE FROM tbl_books;
COMMIT;






