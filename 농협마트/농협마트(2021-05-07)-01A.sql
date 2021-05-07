-- 여기는 nhuser 접속

CREATE TABLE tbl_iolist(
    io_seq	NUMBER		PRIMARY KEY,
    io_date	VARCHAR2(10)	NOT NULL,
    io_time	VARCHAR2(10)	NOT NULL,
    io_pname	nVARCHAR2(50)	NOT NULL,
    io_dname	nVARCHAR2(50)	NOT NULL,
    io_dceo	nVARCHAR2(20)	NOT NULL,
    io_inout	VARCHAR2(1)	NOT NULL,
    io_qty	NUMBER	NOT NULL,
    io_price	NUMBER	NOT NULL	

);

SELECT io_inout, COUNT(*) 
FROM tbl_iolist
GROUP BY io_inout;

-- io_inout 칼럼의 데이터가 1이면 매입을 표시
-- 아니면 매출을 표시하라
-- IF io_inout == 1 THEN '매입
-- ELSE '매출'
SELECT DECODE(io_inout,'1','매입','매출') AS 구분,
    COUNT(*)
FROM tbl_iolist
GROUP BY DECODE(io_inout,'1','매입','매출');

-- IF io_inout == 1 THEN '매입'
-- ELSE IF io_inout == 2  THEN '매출'
SELECT DECODE(io_inout,'1','매입','2','매출') AS 구분,
    COUNT(*)
FROM tbl_iolist
GROUP BY DECODE(io_inout,'1','매입','2','매출');

/*
매입매출 데이터를 DB import 한후
테이블에서 상품정보와 거래처정보를 분리하여
제3정규화를 수행하기

현재 매입매출 테이블에 상품이름과 거래처명(대표포함)이 
저장되어 있다
현재 테이블에서 만약 상품이름이나 거래처명이 변경되어야 하는
일이 발생한다면
다수의 데이터(레코드)에 변경(update)가 되는 상황이 만들어진다
다수의 데이터를 변경하는 명령은
데이터 무결성을 해치는 원인중의 하나이다

상품테이블을 별도로 분리하고
상품코드, 상품명 형식으로 저장한 후
매입매출 테이블에는 상품명 대신 상품코드를 포함하고
이후에 JOIN을 통해 데이터를 조회하는 것이 좋다
*/

-- 1. 매입매출 테이블에서 상품정보를 중복없이 추출하기
SELECT io_pname
FROM tbl_iolist
GROUP BY io_pname
ORDER BY io_pname;
-- 2. 매입매출 테이블에서 상품정보와 
--      매입단가 매출단가도 같이 추출하기
--      전체 데이터에서 상품별로 가장 높은 가격을 가져와서
--      매입 매출 단가로 사용하자
SELECT io_pname, 
    MAX(DECODE(io_inout,'1',io_price,0)) AS 매입단가,
    MAX(DECODE(io_inout,'2',io_price,0)) AS 매출단가
FROM tbl_iolist
GROUP BY io_pname
ORDER BY io_pname;

/*
상품 리스트를 추출했는데 매입단가가 0, 또는 매출단가가 0인 경우
매입단가와 매출단가를 계산하기

매입단가가 0 인경우
매출단가에서 마진(20%)을 빼고, 다시 부가세(10%)뺀 가격으로 계산
매입단가 = (매출단가 / 1.2)/1.1

매출단가는 매입단가에 20% 마진 추가, 부가세 10% 추가
매출단가 = (매입단가 * 1.2) * 1.1

10원단위 절사
매출단가 = INT(매출단가 / 10) * 10

*/

-- 추출된 상품정보를 저장할 테이블 생성
CREATE TABLE tbl_product(
    p_code	CHAR(6)		PRIMARY KEY,
    p_name	nVARCHAR2(50)	NOT NULL,	
    p_iprice	NUMBER	NOT NULL,	
    p_oprice	NUMBER	NOT NULL,	
    p_vat	VARCHAR2(1)	DEFAULT 'Y'	
);

-- 매입매출 데이터에서 상품정보를 생성했다
-- 생성된 상품정보가 맞게 되었는지 검증하기
-- 두 테이블을 JOIN하여 혹시 null 값이 있는지 확인하기

SELECT IO.io_pname, P.p_name
FROM tbl_iolist IO
    LEFT JOIN tbl_product P
        ON IO.io_pname = P.p_name;

-- 리스트가 너무많아서 null을 찾기가 어려울때
-- JOIN된 상품정보의 상품이름이 NULL인 데이터만 조회하기
-- 이 조회에서 데이터가 한건도 나타나지 않아야 한다
SELECT IO.io_pname, P.p_name
FROM tbl_iolist IO
    LEFT JOIN tbl_product P
        ON IO.io_pname = P.p_name
WHERE P.p_name IS NULL;        
        





