-- 여기는 SCUSER로 접속
CREATE TABLE tbl_student(
    st_num CHAR(5),
    st_name nVARCHAR2(20),
    st_dept nVARCHAR2(10),
    st_grade VARCHAR2(5),   -- 숫자값을 입력, 숫자값을 문자형으로 인식
    st_tel VARCHAR2(20),    -- 000-0000-0000
    st_addr nVARCHAR2(125)
);

-- 생성한 Table에 데이터 추가
-- DML(데이터조작어) 명령를 사용하여 데이터 추가(create)
--  create : 테이블에 존재하지 않는 데이터를 새로 추가한다 라는 개념
INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade)
VALUES('00001','홍길동','국어국문','3');

-- 데이터를 추가한 후에는 잘 추가되었는지 확인
-- tbl_student table에 저장되어있는 모든 데이터를 무조건 보여달라
SELECT * FROM tbl_student;

INSERT INTO tbl_student(st_num, st_dept, st_grade)
VALUES('00001','컴퓨터공학','2');
SELECT * FROM tbl_student;

-- 위에서 생성한 tbl_student 테이블에는
-- 데이터를 추가하려고 할때
-- 이름 데이터가 없어도 데이터가 정상적으로 추가가 되어버린다
-- 같은 학번의 데이터가 이미 추가되어 있어도 또다시 추가가 되어버린다
-- 이런식으로 데이터가 계속 추가된다면 전체 데이터의 신뢰성에
-- 문제가 될 것이다
-- DBMS에서는 table(Entity)를 설계할때 이러한 오류를 방지하기 위하여
-- Table을 생성할때 "제약조건"을 설정하여 데이터가 INSERT 되지 못하도록
-- 하는 기능이 있다.
-- 작성된 table을 삭제하고 다시 제약조건을 설정하여 생성하자

DROP TABLE tbl_student;

-- 1. 학생의 이름은 데이터가 반드시 있어야 만 한다.
--      st_name(학생 이름) 칼럼은 NOT NULL 이어야 한다
-- 2. 학번은 절대 중복되면 안된다.
--      tbl_student 테이블의 모든데이터의 학번은 유일해야 한다
CREATE TABLE tbl_student(
    st_num CHAR(5) UNIQUE NOT NULL,
    st_name nVARCHAR2(20) NOT NULL ,
    st_dept nVARCHAR2(10),
    st_grade VARCHAR2(5),   -- 숫자값을 입력, 숫자값을 문자형으로 인식
    st_tel VARCHAR2(20),    -- 000-0000-0000
    st_addr nVARCHAR2(125) 
);

-- 학생이름 데이터가 없으므로 INSERT 불가
INSERT INTO tbl_student( st_num, st_dept )
VALUES ('00001','컴퓨터공학');

-- 학생이름 데이터를 같이 포함하여 INSERT 수행
-- 칼럼보다 데이터 개수가 적어서 INSERT 불가
INSERT INTO tbl_student( st_num, st_dept,st_name )
VALUES ('00001','컴퓨터공학','홍길동');

-- 아예 학번 칼럼을 제거하고 INSERT 수행
-- 학번칼럼이 NOT NULL되어있어서 INSERT 불가
INSERT INTO tbl_student( st_dept,st_name )
VALUES ('사회과학','이몽룡');

-- st_num 칼럼이 UNIQUE인데 이미 존재하는 00001 학번으로
-- 데이터를 추가하려고 하니 문제가 있어서 INSERT 불가
-- Table의 제약조건을 설정할때
--      UNIQUE는 매우 신중하게 선택해야 한다.
INSERT INTO tbl_student( st_dept,st_name,st_num )
VALUES ('사회과학','이몽룡','00001');

INSERT INTO tbl_student( st_dept,st_name,st_num )
VALUES ('사회과학','이몽룡','00100');

INSERT INTO tbl_student( st_dept,st_name,st_num )
VALUES ('법학과','성춘향','00002');
SELECT * FROM tbl_student;

-- 기본키 칼럼(PRIMARY KEY) 
-- 데이터를 조회(SELECT)할때 st_num 칼럼을 기준으로 조회를 하면
-- 반드시 원하는 데이터 1개만 보여지는 조건을 만족하게 하는 칼럼
-- 제약조건이 반드시 UNIQUE 하면서 NOT NULL 이어야 한다.
-- 기본키는 제약조건에 UNIQUE 와 NOT NULL을 같이 설정해야 하는데
-- DBMS에서는 기본키 제약조건을 설정하는 키워가 별도로 있다

-- PRIMARY KEY : UNIQUE + NOT NULL + 기타 조건 + INDEX 자동생성
--      매우 강력한, 가장 우선순위가 높은 제약조건이다
DROP TABLE tbl_student;
CREATE TABLE tbl_student(
    st_num CHAR(5) PRIMARY KEY,
    st_name nVARCHAR2(20) NOT NULL ,
    st_dept nVARCHAR2(10),
    st_grade VARCHAR2(5),   -- 숫자값을 입력, 숫자값을 문자형으로 인식
    st_tel VARCHAR2(20),    -- 000-0000-0000
    st_addr nVARCHAR2(125) 
);

-- TABLE의 구조를 보여달라
DESCRIBE tbl_student;
DESC tbl_student;

INSERT INTO tbl_student( st_dept,st_name,st_num )
VALUES ('사회과학','이몽룡','00001');

INSERT INTO tbl_student( st_dept,st_name,st_num )
VALUES ('법학과','성춘향','00100');

INSERT INTO tbl_student( st_dept,st_name,st_num )
VALUES ('컴퓨터공학','홍길동','00002');
SELECT * FROM tbl_student;

-- PK 로 설정된 칼럼에 조건을 부여하여 데이터 조회하기
SELECT * 
FROM tbl_student
WHERE st_num = '00001';

SELECT * FROM tbl_student;






