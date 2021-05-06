-- 여기는 관리자 접속

-- 시스템에 작성된 TableSpace를 확인하기
SELECT * FROM DBA_TABLESPACES;

-- 사용자 삭제
DROP USER iouser CASCADE;

-- TableSpace 삭제
DROP TABLESPACE iolistDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-- Iolist를 위한 TableSpace 생성
CREATE TABLESPACE iolistDB
DATAFILE 'C:/oraclexe/data/iolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER iouser IDENTIFIED BY iouser
DEFAULT TABLESPACE iolistDB;

GRANT DBA TO iouser;

-- 오라클의  System 값 
SELECT * FROM DBA_PROFILES;

--- 오라클에 새로 등록된 사용자의 Password 만료일자
-- 기본값이 180으로 되어 있어서
-- 새로운 사용자 등록 후 비번을 변경하지 않으면
-- 180일 후에는 접속이 불가능해 진다
SELECT * FROM DBA_PROFILES
WHERE RESOURCE_NAME = 'PASSWORD_LIFE_TIME';

-- 사용자의 Password 만료일자를 무제한으로 변경
ALTER PROFILE 
DEFAULT LIMIT PASSWORD_LIFE_TIME 
UNLIMITED;




