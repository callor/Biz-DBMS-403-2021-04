-- 여기는 SCUSER
SELECT * FROM VIEW_성적정보;

-- Sub Query
-- SQL 명령문 내에 또다른 SQL명령문을 포함하는 코드
-- JOIN 대신 사용하는 코드이고
-- Sub Query의 99%정도는 JOIN을 사용하여 대체할수 있다
SELECT sc_num AS 학번,
    (
        SELECT st_name 
        FROM tbl_student 
        WHERE sc_num = st_num
    ) AS 이름,
    (
        SELECT st_dept
        FROM tbl_student 
        WHERE sc_num = st_num
    ) AS 학과
FROM tbl_score;

/*
 tbl_score 테이블은 학번, 국어, 영어. 수학 칼럼으로 구성되어 있다
 만약 이 테이블을 사용하던 중 과목의 수가 추가가 되면
 기존 사용하던 table을 변경해야하는 상황이 발생한다
 테이블을 변경하는 것은 많은 데이터가 담겨있는 경우
 매우 위험한 실행이 될수 있다
 테이블이 변경되는 동안에는 테이블에 Lock이 걸리고
 그 동안은 해당 테이블에 어떠한 쿼리도 적용할수 없다
 경우에 따라 기존 데이터가 손상되는 경우 있다
 때문에 어쩔수 없는 상황이 아니면 table을 변경하는 것은
 별로 좋지 않다
 
 하지만 지금 설계된 tbl_score는 과목의 변동이 발생하면
 어쩔수 없이 테이블을 변경해야 한다
 이러한 테이블은 설계 단계부터 잘못된 설계이다


*/

-- 학생점수를 저장할 테이블을 정규화를 하기 위해
-- 재 설계를 하였다
-- 칼럼으로 되어 있던 과목을 데이터 화 하여
-- 학번, 과목 형식으로 입력하도록 설계하였다
-- 이렇게 설계를 하고 나니
-- 학번, 과목명 어떤 칼럼도 단독으로 PK로 설정할수 없게 되었다
-- 테이블에 PK가 없으면
-- 데이터의 무결성 유지가 매우 힘든 상황이 될수 있다
-- 이 테이블은 학번 + 과목명을 묶어서 PK로 선언을 해야
--      할수 밖에 없게 되었다
-- PK는 단독 칼럼으로 사용하는 것이 가장 좋은데
--      단독 칼럼으로 만들수 없는 경우는 
--      2개 이상의 칼럼을 묶어서
--      만들어야 하는 경우도 있다

-- 이런 상황에 직면하면 실제 데이터에는 없는
-- 칼럼을 하나 추가하고 별도로 PK로 설정한다.
DROP  TABLE tbl_score_V2;
CREATE TABLE tbl_score_V2(
    sc_seq NUMBER PRIMARY KEY,
    sc_num	CHAR(5)	NOT NULL,
    sc_subject	nVARCHAR2(20)	NOT NULL,
    sc_score	NUMBER	NOT NULL	
);

-- 두개 이상의 칼럼을 묶어서 PK로 선언하는 경우
-- 삭제나, 갱신을 할때 다음과 같은 코드를 사용해야 하는데
-- 코드 사용중에 실수를 많이 일으킬수 있다
-- 삭제나 갱신할때는 WHERE 조건문에 PK를 대상으로
-- 실행하는 것이 좋은데, 아래와 같은 코드를 사용하면
-- 잦은 실수를 반복할 수 있다.
-- 때문에 tbl_score_v2 테이블에는 별도로 SEQ 칼럼을 만들고
-- PK로 설정을 한다.
UPDATE tbl_score_V2 SET sc_score = 90
WHERE sc_num = ?? AND sc_subject = ??;
DELETE FROM tbl_score
WHERE sc_num = ?? AND sc_subject = ??;

SELECT COUNT(*) FROM tbl_score_v2;

-- 정규화가 된 테이블에서 학생별 총점과 평균 계산
SELECT  sc_num,  SUM(sc_score), ROUND(AVG(sc_score),0)
FROM tbl_score_v2
GROUP BY sc_num 
ORDER BY sc_num;

-- 전체학생의 과목별 총점
SELECT sc_subject, sum(sc_score), ROUND(AVG(sc_score),0)
FROM tbl_score_v2
GROUP BY sc_subject
ORDER BY sc_subject;









