-- 여기는 SCUSER 로 접속한 화면
-- SCUSER는 DBA 권한을 가지고 있으며
-- 데이터를 저장하기 위한 TABLE을 만들고
--      데이터를 추가, 조회, 수정, 삭제 실습 하기

-- TABLE
--  DBMS를 사용하여 데이터를 추가하면
--  마치 excel의 sheet에 데이터를 저장하는 것처럼
--  데이터가 저장된다.
--  실제 DBMS소프트웨어가 저장하는 방식은 
--      고유한 기술이 적용되어 있지만
--  DBMS 소프트웨어를 사용하는 사용자는 모든 데이터는
--      표(TABLE) 형식으로 저장된 것으로 인식하는 표준 형식이다
-- Oracle의 데이터 저장 구조 : TableSpace > Table > 데이터들
-- TABLE은 Java 코딩에서 VO 클래스를 만드는 원리와 비슷하다
--      데이터를 취급하는 최소한의 규격, 형식을 지정하여 생성한다

-- DDL 명령중에 Table 생성하기
--      Table은 데이터를 저장하기 위한 표를 작성하는 것으로
--      각 데이터의 이름을 지정하고, 각 데이터의 형식(type)을 지정하여
--      표를 작성한다.

-- 데이터 Type 
-- 문자열 데이터
--      CHAR : 저장되는 데이터의 길이가 (규칙으로)정해진경우, 
--          데이터 길이가 모두 같은 경우 
--          "고정길이 문자열" 
--      VARCHAR : 저장되는 데이터의 최대크기만 지정하고
--          최대 크기보다 짧은 길이의 데이터를 저장할 수 있다
--          최대 크기보다 짧은 데이터를 저장하면
--          자동으로 공간을 축소하여 데이터를 저장한다
--          "가변길이 문자열"
--      nVARCHAR : 한글과 같은 UNICODE 문자열을 저장할때
--          영문알파벳과 저장하는 방식이 달라서
--          문제를 일으킬수 있다
--          한글과 같은 UNICODE 데이터를 저장하는 칼럼은
--          nVARCHAR 키워드를 사용한다.
--  숫자 데이터
--      정수, 실수 등을 구분하여 저장하기도 하지만
--      오라클에서는 NUMBER 키워드로 일괄 지정하여도 상관 없다
--      저장되는 자릿수에 따라 자동으로 크기가 조절된다.
CREATE TABLE tbl_score (
    sc_num CHAR(5) , -- 문자열 5자리의 데이터만 저장, String num
    sc_name nVARCHAR2(20), -- String name
    sc_kor NUMBER,
    sc_eng NUMBER,
    sc_math NUMBER
);

-- DML(Data Manipulation Lang. 
--      Data Management Lang, 데이터 조작어, 데이터 관리)
-- 생성된 TABLE에 데이터추가, 조회, 수정, 삭제를 하는 명령어
-- DBMS 대표적인 CRUD 업무
--  데이터추가(데이터 생성 : create 업무) : INSERT
--  데이터조회(읽기 등등 : Read) : SELECT
--  데이터변경, 수정 : UPDATE
--  데이터삭제 : DELETE
INSERT INTO tbl_score(sc_num, sc_kor, sc_eng, sc_math)
VALUES ('00001',90,80,70);

INSERT INTO tbl_score(sc_name) VALUES('홍길동');
INSERT INTO tbl_score(sc_name) VALUES('성춘향');
INSERT INTO tbl_score(sc_name) VALUES('이몽룡');

-- 데이터 읽기
SELECT sc_num, sc_kor, sc_eng, sc_math
FROM tbl_score;

SELECT sc_name FROM tbl_score;

UPDATE tbl_score
SET sc_name = '임꺽정';

SELECT sc_name FROM tbl_score;











