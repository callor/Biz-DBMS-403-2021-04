-- 여기는 scuser 접속
INSERT INTO tbl_score(sc_num, sc_kor, sc_eng, sc_math)
VALUES ('S0100',90,100,100);

SELECT * FROM tbl_score
WHERE sc_num = 'S0100';

-- SQL Developer에서
-- 데이터를 INSERT(추가), UPDATE(변경), DELETE(삭제)명령을 수행하면
-- Oracle Server와 SQL Developer 사이에서 중간에
--  임시로 데이터가 보관되는 상태가된다
--  이 상태는 아직 Oracle Server의 저장소에 확정이 안된상태이다
--  확정이 안된 상태에서
--  ROLLBACK 명령을 수행하면 
--      모든 CUD(Insert, Update, Delet)가 취소된다
-- CUD를 수행하여 데이터에 변화가 발생하면
--      명령을 완료한 후에 반드시 확정을 지어야 한다
--      이때 사용하는 명령이 COMMIT
-- COMMIT이 실행되어야만 저장소에 데이터가 확정된다
ROLLBACK;




