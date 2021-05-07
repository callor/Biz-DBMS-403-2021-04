-- 여기는 관리자 접속

CREATE TABLESPACE nonghyupDB
DATAFILE 'C:/oraclexe/data/nonghyup.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER nhuser IDENTIFIED BY nhuser
DEFAULT TABLESPACE nonghyupDB;

GRANT DBA to nhuser;