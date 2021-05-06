-- 여기는 IOUSER 접속화면

CREATE TABLE tbl_iolist (

    io_seq	NUMBER		PRIMARY KEY,
    io_date	VARCHAR2(10)	NOT NULL,	
    io_pname	nVARCHAR2(50)	NOT NULL,	
    io_dname	nVARCHAR2(50)	NOT NULL,	
    io_dceo	nVARCHAR2(20)	NOT NULL,	
    io_inout	nVARCHAR2(5)	NOT NULL,	
    io_qty	NUMBER	NOT NULL,	
    io_price	NUMBER	NOT NULL,	
    io_total	NUMBER		

);


SELECT COUNT(*) FROM tbl_iolist
WHERE io_inout = '매입';

SELECT COUNT(*) FROM tbl_iolist
WHERE io_inout = '매출';

SELECT io_inout, COUNT(*)
FROM tbl_iolist
GROUP BY io_inout;

-- 매입과 매출금액 총합
SELECT io_inout, SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout;

SELECT io_inout,
    SUM(DECODE(io_inout,'매입',io_total)) AS 매입합계,
    SUM(DECODE(io_inout,'매출',io_total)) AS 매출합계
FROM tbl_iolist
GROUP BY io_inout;

SELECT 
    SUM(DECODE(io_inout,'매입',io_total)) AS 매입합계,
    SUM(DECODE(io_inout,'매출',io_total)) AS 매출합계
FROM tbl_iolist;

-- 일년동안 매입과 매출금액을 계산하고
-- 단순 이익금 계산해 보기
SELECT 
    SUM(DECODE(io_inout,'매입',io_total)) AS 매입합계,
    SUM(DECODE(io_inout,'매출',io_total)) AS 매출합계,
    SUM(DECODE(io_inout,'매출',io_total)) -
    SUM(DECODE(io_inout,'매입',io_total)) AS 이익금
FROM tbl_iolist;

-- 매입매출관련하여
-- 소매점에서 상품을 매입하여 소비자한테 판매할때
-- 매입할때 매입부가세 발생
-- 판매할때 매출부가세 발생
-- 매출부가세 - 매입부가세를 계산하여 일년에 2 ~ 4회에 
-- 부가가치세를 납부한다.

-- 농사를 지어서 쌀 20KG를 생산하여 판매를 하면
-- 5만원 정도의 금액에 판매하게 된다
-- 쌀을 공장에서 가공하여 생산품(공산품)으로 만들게 되면
-- 실제 20KG의 쌀을 직접 한매하는 것보다 더 비싼 가격에 판매하게 된다
-- 이때 실제 쌀보다 더 많은 이익이 발생하게 되므로
-- 가치가 부가 되었다 라고 표현한다
-- 가치가 부가 된 만큼 세금을 납부하도록 한다
-- 부가 가치 세(Value Add Tax, VAT)
-- 매입을 할때는 매입금액의 10% 만큼으로 세금을 포함하여 매입하고
-- 매출을 할때는 매출금액의 10% 만큼 세금을 포함하여 판매한다

-- 매입매출 데이터에서 보면
-- 매입금액은 부가세 10%를 제외한 금액으로 입력하고
-- 매출금액은 부가세 10%가 포함된 금액으로 입력한다
-- 샘플데이터의 매입금액은 VAT 제외금액이고
--      매출금액은 VAT 포함된 금액이다
-- 매입과 매출 데이터로 지난 1년간 납부한 VAT 끔액을 계산해 보자

-- 매입금액 : 22737397
-- 매출금액 : 41683800
-- VAT = (매출금액에 포함된 VAT) - (매입금액 * 0.1)
-- 매출금액의 VAT 제외된 합계 = 매출금액 / 1.1
-- 매출부가세 = VAT 제외된 매출금액 * 0.1

-- 일년동안 매입매출 결과에 납부한 부가세 계산
SELECT 
SUM(DECODE(io_inout,'매입',ROUND(io_total * 0.1 )))  AS 매입부가세,

SUM(DECODE(io_inout,'매출', ROUND((io_total / 1.1) * 0.1))) AS 매출부가세,

SUM(DECODE(io_inout,'매출', ROUND((io_total / 1.1) * 0.1)))
- SUM(DECODE(io_inout,'매입',ROUND(io_total * 0.1 ))) AS 납부세액

FROM tbl_iolist;

-- 거래처별로 매입과 매출 합계
-- DECODE(칼럼명, 조건값, true일때, false일때)
-- 실제 저장된 데이터를 PIVOT 으로 보여주기
SELECT io_dname, 
    SUM(DECODE(io_inout,'매입',io_total,0)) AS 매입합계,
    SUM(DECODE(io_inout,'매출',io_total,0)) AS 매출합계
FROM tbl_iolist
GROUP BY io_dname;





