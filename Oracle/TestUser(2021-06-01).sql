-- 여기는 TestUser 접속

CREATE TABLE tbl_books (

    bk_isbn	CHAR(13)		PRIMARY KEY,
    bk_comp	CHAR(5)	NOT NULL,	
    bk_title	nVARCHAR2(125)	NOT NULL,	
    bk_author	CHAR(5)	NOT NULL,	
                
    bk_date	VARCHAR2(10),		
    bk_pages	NUMBER,		
    bk_price	NUMBER		
);

CREATE TABLE tbl_company (
    cp_code	CHAR(5)		PRIMARY KEY,
    cp_name	nVARCHAR2(125)	NOT NULL,	
    cp_ceo	nVARCHAR2(30)	NOT NULL,	
    cp_tel	VARCHAR2(20)	NOT NULL,	
    cp_addr	nVARCHAR2(125)		
);


CREATE TABLE tbl_author (
    au_code	CHAR(5)		PRIMARY KEY,
    au_name	nVARCHAR2(125)	NOT NULL,	
    au_tel	VARCHAR2(20),		
    au_addr	nVARCHAR2(125)		
    );

-- import 된데이터 확인
SELECT COUNT(*) FROM tbl_books;
SELECT COUNT(*) FROM tbl_company;
SELECT COUNT(*) FROM tbl_author;

-- tbl_books 테이블에서
-- 각 출판사별로 몇권의 도서를 출판했는지 조회
SELECT bk_comp, COUNT(*)
FROM tbl_books
GROUP BY bk_comp;

SELECT bk_comp AS 코드
    ,cp_name AS 출판사명
    , COUNT(*) AS 권수
FROM tbl_books B
    LEFT JOIN tbl_company C
        ON B.bk_comp = C.cp_code
GROUP BY bk_comp, cp_name
ORDER BY bk_comp;

-- tbl_books 테이블에서
-- 1. 도서 가격이 2만원 이상인 도서들의 리스트
-- 2. 도서 가격이 2만원 이상인 도서들의 전체 합계금액
SELECT *
FROM tbl_books
WHERE bk_price >= 20000;

SELECT SUM(bk_price)
FROM tbl_books
WHERE bk_price >= 20000;

-- tbl_books, tbl_company, tbl_author 세개의 table  JOIN하여
-- ISBN, 도서명, 출판사명, 출판사대표, 저자, 저자연락처 으로
-- 출력되도록 SQL 작성

SELECT 
    B.bk_isbn AS ISBN,
    B.bk_title AS 도서명,
    C.cp_name AS 출판사,
    C.cp_ceo AS 출판사대표,
    A.au_name AS 저자,
    A.au_tel AS 저자연락처
FROM tbl_books B
    LEFT JOIN tbl_company C
        ON B.bk_comp = C.cp_code
    LEFT JOIN tbl_author A
        ON B.bk_author = A.au_code;

-- tbl_books, tbl_company, tbl_author 세개의 table  JOIN하여
-- ISBN, 도서명, 출판사명, 출판사대표, 
--      저자, 저자연락처, 출판일
-- 출력되도록 SQL 작성
-- 출판일이 2018년 데이터만


SELECT 
    B.bk_isbn AS ISBN,
    B.bk_title AS 도서명,
    C.cp_name AS 출판사,
    C.cp_ceo AS 출판사대표,
    A.au_name AS 저자,
    A.au_tel AS 저자연락처,
    B.bk_date AS 출판일
FROM tbl_books B
    LEFT JOIN tbl_company C
        ON B.bk_comp = C.cp_code
    LEFT JOIN tbl_author A
        ON B.bk_author = A.au_code
-- WHERE B.bk_date BETWEEN '2018-01-01' AND '2018-12-31';        
WHERE SUBSTR(B.bk_date,0,4) = '2018';
/*
    SUBSTR(문자열 칼럼, 시작위치, 개수)
    MySQL : LEFT(문자열 칼럼, 앞에서 몇개)
*/

CREATE VIEW view_도서정보 AS (
    SELECT 
        B.bk_isbn AS ISBN,
        B.bk_title AS 도서명,
        C.cp_name AS 출판사,
        C.cp_ceo AS 출판사대표,
        A.au_name AS 저자,
        A.au_tel AS 저자연락처,
        B.bk_date AS 출판일
    FROM tbl_books B
        LEFT JOIN tbl_company C
            ON B.bk_comp = C.cp_code
        LEFT JOIN tbl_author A
            ON B.bk_author = A.au_code
);

SELECT * FROM view_도서정보
WHERE SUBSTR(출판일,0,4) = '2018';

/*
자주 사용할 것 같은 SELECT SQL은 view로 등록하면
언제든지 사용이 가능하다

그런데 자주 사용할 것 같지 않은경우
view 생성하면 아무래도 저장공간을 차지하게 된다

이럴때 한개의 SQL(SELECT)를 마치 가상의 table처럼
FROM 절에 부착하여 사용할수 있다
*/
SELECT * FROM
(
    SELECT 
        B.bk_isbn AS ISBN,
        B.bk_title AS 도서명,
        C.cp_name AS 출판사,
        C.cp_ceo AS 출판사대표,
        A.au_name AS 저자,
        A.au_tel AS 저자연락처,
        B.bk_date AS 출판일
    FROM tbl_books B
        LEFT JOIN tbl_company C
            ON B.bk_comp = C.cp_code
        LEFT JOIN tbl_author A
            ON B.bk_author = A.au_code
)
WHERE SUBSTR(출판일,0,4) = '2018';








