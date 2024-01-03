-- ex02.sql

USE market_db;

-- 데이터 조회(검색)
SELECT * FROM member;

SELECT * 
  FROM market_db.member;

SELECT member.mem_name 
  FROM member;

-- select문 : 데이터 검색(조회)시에 사용
-- 형식
-- select 열이름(*)
--    FROM 테이블 이름
--    WHERE 조건식

-- 모든 열(컬럼) 가져오기
SELECT * 
  FROM member;
  
-- 특정 열만 가져오기
-- SELECT 가지고 오고 싶은 열 
--   FROM 가지고 올 테이블 명
SELECT mem_id, mem_name, addr, debut_date 
  FROM member;
  

-- 출력창에 열 별칭(alias) 지어주기
SELECT addr 주소, debut_date "데뷔 일자" 
  FROM member;

-- 조건식을 넣어서 검색 : WHERE
SELECT * 
  FROM member 
  WHERE mem_name = "블랙핑크";
  
SELECT * 
  FROM member 
    WHERE mem_number = 4;

-- 조건식에 비교, 논리 연산자 사용
-- 비교 : < > = != <>(같지 않음) <= >=
-- 논리 : AND, OR
SELECT mem_id, mem_name 
  FROM member 
    WHERE height <= 162;
    
SELECT mem_id, mem_name 
  FROM member 
    WHERE height >= 165 AND mem_number > 6;

-- BETWEEN AND 구문 : ~부터 ~까지
SELECT * 
  FROM member 
  WHERE height >= 163 AND height <= 165;
-- =
SELECT * 
  FROM member 
  WHERE height BETWEEN 163 AND 165;


-- 연습문제1
-- 1. member 테이블에서 키가 163이상인 모든  멤버의
--    이름과 아이디, 키높이를 출력하시오
SELECT mem_name, mem_id, height
FROM member
WHERE height > 163;

-- 2. 주소가 경기이거나 경남인 모든 멤버의
--    이름과 주소를 출력하시오.
SELECT mem_name, addr
FROM member
WHERE addr = "경남" OR addr = "경기";

-- 3. 멤버수(mem_number)가 5명이상 7명이하 사이인 모든 멤버의
--    멤버수와 멤버이름을 출력하시오.(BETWEEN AND 사용)
SELECT mem_number, mem_name
FROM member
WHERE mem_number BETWEEN 5 AND 7;


-- IN() 함수 : ~중에 하나이면 
SELECT mem_name, mem_number 
FROM member
WHERE mem_number = 5 OR mem_number = 6 OR mem_number = 7;

SELECT mem_name, mem_number
FROM member
WHERE mem_number IN (5,6,7);

-- 문자열 일부 검색 : LIKE 
-- % : 여러 문자열을 대치
-- _(언더바) : 한 문자를 대치 

-- 멤버명이 '우'로 시작하는 걸그룹 검색
SELECT *
FROM member
WHERE mem_name LIKE '우%';

-- 멤버명이 '걸'로 끝나는 걸그룹 검색
SELECT *
FROM member
WHERE mem_name LIKE '%걸';

-- 멤버명이 '오'로 시작하고 '걸'로 끝나는 걸그룹 검색
SELECT *
FROM member
WHERE mem_name LIKE '오%걸';

-- 멤버명이 '블'로 시작하고 '크'로 끝나는 걸그룹 검색
SELECT *
FROM member
WHERE mem_name LIKE '블%크';

--멤버명이 ~~핑크로 끝나는 걸그룹 검색
SELECT *
FROM member
WHERE mem_name LIKE '__핑크';


-- 연습문제
-- 1. 주소가 서울이거나 경기인 걸그룹의 모든 열을 출력(IN()함수 사용)
SELECT *
FROM member
WHERE addr IN ('서울', '경기');

-- 2. 걸그룹 이름안에 '벨'자와 '오'자가 들어가는 모든 멤버의 이름만 출력
SELECT mem_name
FROM member
WHERE mem_name LIKE '%벨%' OR  mem_name LIKE '%오%';

-- 3. 이름이 4자이고 뒤부분이 친구로 끝나는 멤버의 이름과 주소를 출력
SELECT mem_name, addr
FROM member
WHERE mem_name LIKE '__친구';


-- 서브 쿼리 사용
SELECT * FROM member
WHERE height > (SELECT height FROM member WHERE mem_name = '에이핑크');

SELECT * FROM member
WHERE addr = (SELECT addr FROM member WHERE mem_name = '트와이스');


-- 검색 결과의 정렬 : ORDER BY절
-- 내림차순 DESC
SELECT mem_id, mem_name, debut_date 
FROM member
ORDER BY debut_date DESC ; 
-- 오름차순 ASC
SELECT mem_id, mem_name, debut_date 
FROM member
ORDER BY debut_date ASC ; 


-- 조건절(WHERE)과 정렬(ORDER BY)는 함께 사용 가능
-- 단, 순서를 지켜야 됨
-- WHERE 먼저, ODER BY 나중
SELECT *
FROM member
ORDER BY height DESC
WHERE height >= 164; -- 오류!

SELECT *
FROM member
WHERE height >= 164
ORDER BY height DESC; 
--정렬 컬럼을 2개로 
SELECT *
FROM member
WHERE height >= 164
ORDER BY height DESC, debut_date ASC; -- 첫번째 정렬값이 같다면, 두번째 정렬값 사용

-- 검색 갯수 제한 : LIMIT문
SELECT *
FROM member
LIMIT 3;

--데뷔일이 가장 빠른 걸그룹 3개만 출력
SELECT * 
FROM member
ORDER BY debut_date desc
LIMIT 3;
--데뷔일이 4,5,6번째로 빠른 걸그룹 3개만 출력
SELECT * 
FROM member
ORDER BY debut_date desc
LIMIT 3, 3; -- 첫번째 : 인덱스(0부터 시작), 두번째 : 갯수

-- 중복 제거하기 : DISTINCT문
SELECT distinct addr
FROM member
ORDER BY addr;

-- addr + mem_number 합한 값이 유일한 결과값이면 출력
-- SELECT DISTINCT addr, mem_number
-- FROM member;

-- 갯수 세는 함수 : COUNT() 함수
SELECT COUNT(DISTINCT addr)
FROM member; 

SELECT COUNT(*)
from member;


-- 연습문제
-- 1. 여자친구 걸그룹의 멤버수보다 큰 걸그룹의 멤버수와 이름을 출력하시오.
--   (서브 쿼리 사용)
SELECT mem_number, mem_name
FROM member
WHERE mem_number > (SELECT mem_number FROM member WHERE mem_name='여자친구');

-- 2. 걸그룹 이름이 4자인 멤버만 출력하되, 걸그룹 이름 오름차순, 
--    데뷔일 내림차순으로 정렬하여 출력하시오. 문자열길이 : CHAR_LENGTH(컬럼명)함수
SELECT *
FROM member
WHERE mem_name LIKE '____'
ORDER BY mem_name ASC,debut_date DESC;

SELECT *
FROM member
WHERE CHAR_LENGTH(mem_name) = 4
ORDER BY mem_name ASC,debut_date DESC;

-- 3. 주소에 서울이나 경기가 들어간 걸그룹의 주소와 이름을 출력하되, 
--        2번째 데이타부터 3개만 출력하시오.
SELECT addr, mem_name
FROM member 
WHERE addr = '서울' OR addr = '경기'
LIMIT 2, 3;

SELECT addr, mem_name
FROM member 
WHERE addr IN('서울', '경기')
LIMIT 2, 3;


-- 줄 번호 붙이는 법
SET @rownum := 0; -- rownum이라는 변수를 선언, 0으로 초기화
SELECT @rownum := @rownum + 1 줄번호, mem_name 걸그룹, addr 주소
FROM member;

-- 집계(sumerize)하는 구문 : GROUP BY절
--                 열의 값을 기준으로 줄을 줄이는 것

-- DISTINCT문과 GROUP BY절 차이점
-- DISTINCT문 : 집계만 함 (중복 제거)
-- GROUP BY절 : 집계 + 조건 처리(HAVING문)

-- buy 테이블
SELECT *
FROM buy;

SELECT mem_id, amount 
FROM buy
ORDER BY mem_id;

-- 구매한 총량을 집계(합)을 구하고 싶다.
-- GROUP BY절 + 집계 함수 이용
SELECT mem_id,  SUM(amount)
FROM buy
GROUP BY mem_id;

-- 별칭 이용
SELECT mem_id "회원 아이디", SUM(amount) "총 구매 개수"
FROM buy
GROUP BY mem_id;

-- < 집계 함수 종류 >
-- SUM() : 합계
-- AVG() : 평균
-- MIN() : 최소값
-- MAX() : 최대값
-- COUNT() : 행(줄)의 갯수
-- COUNT(DISTINCT 컬럼명) : 행 (줄)의 갯수(중복은 1개만 인정)
SELECT mem_id "회원 아이디", SUM(amount * price ) "총 구매 금액"
FROM buy
GROUP BY mem_id;

SELECT mem_id, AVG(amount) "평균 구매 개수"
FROM buy
GROUP BY mem_id;

SELECT COUNT(*)
FROM buy;

SELECT * FROM member;
SELECT COUNT(*) FROM member;.
-- null인 행의 데이터는 제외
SELECT COUNT(phone1) "연락처가 있는 회원" FROM member;

-- GROUP BY절의 조건 넣기 : HAVING문
SELECT mem_id "회원 아이디", SUM(amount * price) "총 구매 금액"
FROM buy 
GROUP BY mem_id
HAVING SUM(amount * price) > 1000
ORDER BY SUM(amount * price) desc;


-- 연습문제
-- 1. 전체 걸그룹의 '아이폰' 구매 총액을 구하시오.
SELECT SUM(amount*price)
FROM buy
WHERE prod_name = '아이폰';

-- 2. BLK 걸그룹이 구매한 제품 목록과 구매 갯수와 구매 총액을 구하시오.
SELECT prod_name, amount, SUM(amount*price)
FROM buy 
WHERE mem_id ='BLK'

-- where절에 집계함수 있으면 오류!

-- 3. 구매 총액이 가장 작은 걸그룹의 아이디를 출력하시오.
SELECT mem_id, SUM(amount * price)
FROM buy
GROUP BY mem_id
ORDER BY SUM(amount * price) DESC
LIMIT 1;


-- 4. 구매 갯수가 가장 많은 걸그룹의 아이디를 출력하시오.
SELECT mem_id, SUM(amount)
FROM buy
GROUP BY mem_id
ORDER BY sum(amount) DESC
LIMIT 1;

-- 5. 구매 제품 이름을 중복없이 출력하시오.
SELECT distinct prod_name
FROM buy

-- 6. 제품별 구매 갯수와 총액을 출력하시오. 중복없음.
SELECT DISTINCT prod_name, SUM(amount), SUM(amount * price)
FROM buy
GROUP BY prod_name;