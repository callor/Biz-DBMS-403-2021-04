SHOW DATABASES;

CREATE DATABASE myDB;
USE myDB;
CREATE TABLE tbl_todolist (
	td_seq BIGINT auto_increment PRIMARY KEY,
    td_sdate VARCHAR(10) NOT NULL, -- 추가된 날짜
    td_stime VARCHAR(10) NOT NULL, -- 추가된 시간
    td_doit VARCHAR(300) NOT NULL,
    
    td_edate VARCHAR(10) DEFAULT '', -- 완료날짜
    td_etime VARCHAR(10) DEFAULT '' -- 완료시간
)

