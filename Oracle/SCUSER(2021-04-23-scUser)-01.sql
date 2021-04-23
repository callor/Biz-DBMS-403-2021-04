-- 여기는 scuser 접속

-- 학생의 점수를 저장할 Table생성하기
-- 학번, 국어, 영어, 수학 항목을 저장
-- 고정문자열 :  CHAR(최대크기)
-- 가변문자열 : VARCHAR2(최대크기)
-- 한글가변문자열 : nVARCHAR2(최대크기)
-- 숫자 : NUMBER(자릿수,소수)
DROP TABLE tbl_score;
CREATE TABLE tbl_score (
    sc_num CHAR(5),
    sc_kor NUMBER,
    sc_eng NUMBER,
    sc_math NUMBER
);
-- CREATE 로 작성한 칼럼의 순서대로 모든 데이터를 포함하여
-- INSERT 수행하기
-- 항상 CREATE로 작성한 칼럼의 순서를 기억해야 하고
--      순서가 바뀌면 전혀 엉뚱한 데이터가 INSERT 될수 있다
-- 모든 칼럼에 데이터를 포함해야 한다.
INSERT INTO tbl_score
VALUES('00001',90,80,70);

-- INSERT를 수행할때 데이터칼럼을 나열하면
-- 순서를 몰라도 상관없고, 필요한 칼럼만 데이터를 포함하여
-- 수행할수 있다
INSERT INTO tbl_score(sc_kor, sc_eng, sc_math, sc_num)
VALUES(90,70,80,'00002');
SELECT * FROM tbl_score;

-- 위에서 생성한 tbl_score는 
-- 중복된 학번의 점수가 INSERT 될수 있다
-- 한 학생의 점수가 2중 3중으로 INSERT되어 엉뚱한 결과가
-- 나타 날수 있다
-- 제약조건부여
-- 1. 학번은 중복될수 없고 절대 NULL이어서는 안된다.
--      NOT NULL UNIQUE : PK 선언하는 것도 좋은 방법
-- 2. 점수가 없는 학생의 데이터는 이후에 연산을 수행할때
--      문제를 일으킬수 있기 때문에 NULL 값이 없도록 하자
DROP TABLE tbl_score;
CREATE TABLE tbl_score(
    sc_num CHAR(5) PRIMARY KEY,
    sc_kor NUMBER NOT NULL,
    sc_eng NUMBER NOT NULL,
    sc_math NUMBER NOT NULL
);
CREATE TABLE tbl_score(
    sc_num CHAR(5),
    sc_kor NUMBER NOT NULL,
    sc_eng NUMBER NOT NULL,
    sc_math NUMBER NOT NULL,
    PRIMARY KEY (sc_num)
);













