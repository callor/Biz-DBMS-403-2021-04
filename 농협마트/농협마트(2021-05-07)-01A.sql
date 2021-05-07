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

SELECT DECODE(io_inout,'1','매입','매출') AS 구분,
    COUNT(*)
FROM tbl_iolist
GROUP BY DECODE(io_inout,'1','매입','매출');



