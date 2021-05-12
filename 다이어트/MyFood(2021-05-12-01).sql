-- 여기는 myfood로 접속
CREATE TABLE tbl_foods (
    fd_code	CHAR(7)		PRIMARY KEY,
    fd_name	nVARCHAR2(125)	NOT NULL,	
    fd_year	NUMBER(4),		
    fd_ccode	CHAR(6)	NOT NULL,	
    fd_icode	CHAR(4)	NOT NULL,	
    fd_once	NUMBER(10,2),		
    fd_capa	NUMBER(10,2),		
    fd_cal	NUMBER(10,2),		
    fd_protein	NUMBER(10,2),		
    fd_fat	NUMBER(10,2),		
    fd_carbo	NUMBER(10,2),		
    fd_sugar	NUMBER(10,2)		
);

CREATE TABLE tbl_company (
    cp_code	CHAR(6)		PRIMARY KEY,
    cp_name	nVARCHAR2(125)	NOT NULL,	
    cp_ceo	nVARCHAR2(50),		
    cp_tel	nVARCHAR2(20),		
    cp_addr	VARCHAR2(125),		
    cp_item	nVARCHAR2(30)		
);
CREATE TABLE tbl_items (
    it_code	CHAR(4)		PRIMARY KEY,
    it_name	nVARCHAR2(30)	NOT NULL	
);


CREATE TABLE tbl_myfoods (
    mf_seq	NUMBER		PRIMARY KEY,
    mf_date	VARCHAR2(10)	NOT NULL,	
    mf_fcode	CHAR(7)	NOT NULL,	
    mf_amt	NUMBER(10,2)	NOT NULL	
);

CREATE SEQUENCE seq_myfoods
START WITH 1 INCREMENT BY 1;

-- 임포트된 데이터 개수 확인
SELECT COUNT(*) FROM tbl_foods;
SELECT COUNT(*) FROM tbl_company;
SELECT COUNT(*) FROM tbl_items;

-- 식품정보와 제조자정보를 JOIN 하여 
-- 데이터가 정상으로 임포트되었는지 확인
-- 여기에서 데이터가 출력된다면
-- 제조사정보 테이블에 문제가 있는 것이다
SELECT *
FROM tbl_foods F
    LEFT JOIN tbl_company C
        ON F.fd_ccode = C.cp_code
    WHERE C.cp_code IS NULL;

-- 식품정보와 Item정보를 JOIN
SELECT *
FROM tbl_foods F
    LEFT JOIN tbl_items I
        ON F.fd_icode = I.it_code
    WHERE I.it_code IS NULL;

-- 세개의 table간에 참조무결성 설정
-- 누가 부모이고, 누가 자손인지 파악
-- 자손 : tbl_foods, 부모 : tbl_compny, tbl_items
-- FK 설정은 자손 table에 설정하기

ALTER TABLE tbl_foods
ADD CONSTRAINT fk_company
FOREIGN KEY(fd_ccode)
REFERENCES tbl_company(cp_code);

ALTER TABLE tbl_foods
ADD CONSTRAINT fk_item
FOREIGN KEY(fd_icode)
REFERENCES tbl_items(it_code);

CREATE VIEW view_식품정보 AS (
    SELECT 
        fd_code	식품코드,
        fd_name	식품명,
        fd_year	출시연도,
        fd_ccode	제조사코드,
        fd_icode	분류코드,
        fd_once	제공량,
        fd_capa	총내용량,
        fd_cal	에너지,
        fd_protein	단백질,
        fd_fat	지방,
        fd_carbo	탄수화물,
        fd_sugar	총당류,

        cp_name	제조사명,
        cp_ceo	대표,
        cp_tel	대표전화,
        cp_addr	주소,
        cp_item	주요품목,

        it_name	분류명
    FROM tbl_foods
        LEFT JOIN tbl_company
            ON fd_ccode = cp_code
        LEFT JOIN tbl_items
            ON fd_icode = it_code
);

CREATE VIEW view_섭취정보 AS (
    SELECT 
        mf_seq	 일련번호,
        mf_date	섭취일자,
        mf_fcode	식품코드,
        mf_amt	섭취량,
        식품명,
        출시연도,
        제조사코드,
        분류코드,
        제공량,
        총내용량,
        에너지,
        단백질,
        지방,
        탄수화물,
        총당류,
        
        제조사명,
        대표,
        대표전화,
        주소,
        주요품목,
    
        분류명
    FROM tbl_myfoods
        LEFT JOIN view_식품정보
            ON mf_fcode = 식품코드
);            

CREATE VIEW view_섭취량계산 AS (
    SELECT 
        mf_date	섭취일자,
        mf_fcode 식품코드,
        식품명,
        mf_amt 섭취량,
        제공량 * mf_amt AS 제공량,
        총내용량 * mf_amt AS 총내용량,
        에너지 * mf_amt AS 에너지,
        단백질 * mf_amt AS 단백질,
        지방 * mf_amt AS 지방,
        탄수화물 * mf_amt AS 탄수화물,
        총당류 * mf_amt AS 총당류
    FROM tbl_myfoods
        LEFT JOIN view_식품정보
            ON mf_fcode = 식품코드
);            








INSERT INTo tbl_myfoods(mf_seq, mf_fcode, mf_date,mf_amt)
VALUES(seq_myfoods.NEXTVAL,'PD00001','2021-05-12',2);





