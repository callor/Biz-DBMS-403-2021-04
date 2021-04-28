-- 여기는 SCUSER 접속

-- SELECT 명령문을 사용하여
-- 간단한 연산을 수행할수 있다
-- 표준 SQL에서는 SELECT 연산식 형식으로 수행해 볼수 있는데
-- Oracle에서는 FROM 절이 없는 SELECT를 허용하지 않는다
-- DUAL 이라는 DUMMY TABLE을 준비해 놓고
-- SQL연산을 수행할때 사용하도록 만들어 놨다
SELECT 30 + 40 FROM DUAL;
SELECT 30 * 40 FROM DUAL;
SELECT 40 - 30 FROM DUAL;
SELECT 40 / 15 FROM DUAL;

SELECT 30 + 40, 30 * 40, 40 - 30, 40 / 15 FROM DUAL;

SELECT * FROM dual;

-- 정수부분만 출력, 소수점 첫째자리에서 반올림
SELECT ROUND(333.33) FROM DUAL;
SELECT ROUND(333.33, 0 ) FROM DUAL;
SELECT ROUND(333.55) FROM DUAL;

-- 소수 첫째자리에서 반올림하여 정수표현
SELECT ROUND(333.33) AS 삼삼, 
        ROUND(333.44) AS 사사, 
        ROUND(333.55) AS 오오 FROM DUAL;

-- 소수 둘째자리에서 반올림하여 첫째자리까지 표현
SELECT ROUND(333.33,1) AS 삼삼, 
        ROUND(333.44,1) AS 사사, 
        ROUND(333.55,1) AS 오오 FROM DUAL;

-- 일반적인 코딩과 달리 정수부분도 
-- 반올림 연산을 수행할 수 있다        
SELECT ROUND(555,-1),
        ROUND(555,-2),
        ROUND(555,-3)
        FROM DUAL;
        
-- 단순 문자열 출력        
SELECT '2021-04-28' FROM DUAL;        

-- 문자열 연결할때 +를 사용하지 않고 || 를 사용한다.
SELECT '2021-04-28' || '11:20:00' FROM DUAL;

-- 실제 날짜값으로 변환하여 표현하기
-- 문자열로 되어있는 날짜시간을 실제 Date Type의 데이터로 변환
SELECT TO_DATE('2021-04-28' || '11:20:00',
            'yyyy-mm-ddhh:mi:ss') FROM DUAL;
            

-- DBMS의 자동 형변환
-- + 연산을 수행하면 문자열형 숫자데이터를 실제 숫자형으로
-- 변환하여 연산을 수행한다
-- 자동형변환은 예상하지 못하는 연산결과를 얻을 수 있다
SELECT '30' + '40' FROM DUAL;

-- DBMS의 강제 형변환
-- 문자열형 숫자를 실제 숫자로 강제로 변환하여 사용하기
-- 강제 형변환이 다소 불편할수 있지만
-- 결과를 정확히 에측할수 있기 때문에
-- 자동 형변환보다는 권하는 방식이다
-- 문자열형 숫자데이터를 실제 숫자형으로 변환하기            
SELECT to_number('30') + to_number('40') FROM DUAL;            

-- 날짜와 시간데이터에 ROUND를 입히기
-- 보이는 것과 달리 실제 데이터는
-- 2021-04-28:00:00:00 형식으로 ROUND가 적용된다
SELECT 
ROUND(TO_DATE('2021-04-2811:27:33','yyyy-mm-ddhh24:mi:ss')) 
FROM DUAL;

-- 무조건 소수점 이하 값을 절사
SELECT TRUNC(333.55), TRUNC(333.99), TRUNC(333.33) 
FROM DUAL;

-- 소수점 둘째자리 이하를 절사
SELECT TRUNC(333.55,1), TRUNC(333.99,1), TRUNC(333.33,1) 
FROM DUAL;

-- 음수(-)를 사용하면 정수부분을 절사하여 표현
SELECT TRUNC(333.55,-1), TRUNC(333.99,-2), TRUNC(333.33,-3) 
FROM DUAL;

-- 나머지 연산을 위한 함수
SELECT MOD(3,2),MOD(4,2),MOD(5,2) FROM DUAL;

-- 150초가 몇분 몇초인가?
SELECT TRUNC(150/60) || '분 ' || MOD(150,60) || '초'
FROM DUAL;

-- 11을 2로 나눈 나머지가 1이면 홀수, 아니면
-- 짝수 라고 표현
SELECT CASE WHEN MOD(11,2) = 1 THEN '홀수'
        ELSE '짝수'
       END CASE
FROM DUAL;







