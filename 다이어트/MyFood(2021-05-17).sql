-- 여기는 MyFood 접속
SELECT * 
FROM tbl_myfoods
ORDER BY mf_seq;

SELECT  *
FROM view_섭취량계산;

CREATE VIEW VIEW_섭취량계산 AS 
  (
    SELECT 
        mf_seq 일련번호,
        mf_date	섭취일자,
        mf_fcode 식품코드,
        식품명,
        mf_amt 섭취량,
        제공량 * mf_amt AS 제공량,
        총내용량 * mf_amt AS 총내용량,
        에너지 * mf_amt AS 에너지,
        단백질 * mf_amt AS 단백질,
        지방 * mf_amt AS 지방,
        탄수화물 * mf_amt AS 탄수화물,
        총당류 * mf_amt AS 총당류
    FROM tbl_myfoods
        LEFT JOIN view_식품정보
            ON mf_fcode = 식품코드
);





