-- ex05.sql

-- [ 조인 ]
-- 조인 JOIN : 두개의 테이블을 서로 묶어서 하나의 결과를 만들어내는 것.

-- 조인의 종류 5가지
-- INNER JOIN : 등가조인 - 특정열의 값을 기준으로 값이 같은 행을 출력
-- LEFT (OUTER) JOIN : 테이블1의 행을 출력
-- RIGHT (OUTER) JOIN : 테이블2의 행을 출력
-- FULL OUTER JOIN : 모든 테이블의 행을 출력
-- CROSS JOIN : 모든 경우의 수의 행을 출력함.

-- * mamber테이블과 buy테이블은 member_id로 연결되어있음


USE market_db;

--데카르트 곱(CROSS JOIN) : 각 집합을 이루는 모든 원소의 순서쌍
-- member * buy의 데카르트 곱 : member 10 * buy 20 = 120개의 행
-- 테이블 이름 별칭 : member m
SELECT *
  FROM member m, buy b ; -- 120개 

SELECT COUNT(*)
  FROM member m, buy b ;
  
SELECT m.mem_id, m.mem_name, b.mem_id
  FROM member m, buy b
  ORDER BY m.mem_id;
  
  -- < INNER JOIN : 등가 조인 (내부 조인) >
  --              교집합, 두 테이블의 특정 열의 값이 일치한 행만 검색
SELECT m.mem_id, m.mem_name, b.prod_name 
   FROM member m, buy b
   WHERE m.mem_id = b.mem_id
   ORDER BY m.mem_id;
  
SET @rownum := 0;
SELECT @rownum := @rownum+1 "행 번호", m.mem_id "아이디", m.mem_name "이름", b.prod_name "상품"
  FROM member m, buy b
  WHERE m.mem_id = b.mem_id
  ORDER BY @rownum;
  
  
-- ANSI(미국 표준 협회) SQL : JOIN절을 명시적으로 사용하는 것을 권장
SET @rownum := 0;
SELECT @rownum := @rownum+1 "행 번호", m.mem_id "아이디", m.mem_name "이름", b.prod_name "상품"
  FROM buy b
  INNER JOIN member m
  ON m.mem_id = b.mem_id  
  ORDER BY @rownum;
  
  
-- 연습문제 - INNER JOIN
-- 1. 지갑을 구매한 걸그룹의 이름과 아이디, 지갑의 가격, 구매 총액을 출력
SELECT m.mem_name, b.mem_id, b.price, SUM(price*amount)
  FROM member m
     INNER JOIN buy b
     ON m.mem_id = b.mem_id
  WHERE prod_name = '지갑'
  GROUP BY b.mem_id;
  
-- 2. 구매총액이 1000원이 넘어가는 걸그룹의 이름,주소,전화번호1+전화번호2,데뷔일
--    을 출력하시오.
SELECT m.mem_name, m.addr, CONCAT(m.phone1,m.phone2) phone, m.debut_date
  FROM member m
     INNER JOIN buy b
     ON m.mem_id = b.mem_id
  GROUP BY b.mem_id;
  HAVING SUM(amount * price) > 1000;
  
-- 3. 마마무 걸그룹이 구매한 제품이름 목록과 걸그룹이름과 구매 금액을 출력하시오.

SELECT b.prod_name, b.mem_id, b.price
  FROM member m
    INNER JOIN buy b
    ON m.mem_id = b.mem_id
  WHERE b.mem_id = 'MMU'
  GROUP BY prod_name;
  
-- 4. 데뷔일이 2013년도 이상인 걸그룹의 목록과 구매 총액과 주소를 출력하시오.
SELECT m.mem_id, SUM(amount*price), addr
  FROM member m
    INNER JOIN  buy b
    ON m.mem_id = b.mem_id
  WHERE DATEDIFF(debut_date, "2015-01-01") >= 0
  GROUP BY b.mem_id
  
  
-- GROUP BY : 컬럼의 UNIQUE한 값에 따라서 데이터를 그룹 짓고, 중복된 열은 제거
-- HAVING : GROUP BY 한 후 조건
-- ORDER BY : 오름차순, 내림차순


-- < OUTER JOIN : 외부 조인 >
-- LEFT OUTER JOIN : 왼쪽 테이블 행 전체 출력
--전체 회원의 구매 기록 (구매 기록이 없는 회원도 출력)
SELECT m.mem_id, m.mem_name, prod_name, m.addr
  FROM member m
    LEFT OUTER JOIN buy b
    ON m.mem_id = b.mem_id
  -- mem_id를 내림차순으로 정렬
  ORDER BY m.mem_id 

--한번도 구매하지 않은 회원 정보 출력
SELECT m.mem_id, m.mem_name, prod_name, m.addr
  FROM member m
    LEFT OUTER JOIN buy b
    ON m.mem_id = b.mem_id 
  WHERE b.prod_name IS NULL 
  ORDER BY m.mem_id 


-- RIGHT OUTER JOIN : 오른쪽 테이블 행 전체 출력
SELECT m.mem_id, m.mem_name, prod_name, b.group_name
  FROM member m 
    RIGHT OUTER JOIN buy b
    ON m.mem_id = b.mem_id
  WHERE b.group_name IS NULL 
  ORDER BY m.mem_id;
  
  
-- FULL OUTER JOIN : 왼쪽 + 오른쪽 테이블 행 전체 출력
--                 : A집합 + B집합
--                 : MySQL(MariaDB)에서는 지원X
-- 다른 방법 : LEFT JOIN + RIGHT JOIN
SELECT m.mem_id, b.prod_name, m.mem_name, m.addr
    FROM member m
        LEFT OUTER JOIN buy b
        ON m.mem_id = b.mem_id
UNION ALL
SELECT m.mem_id, b.prod_name, m.mem_name, m.addr
    FROM member m
        RIGHT OUTER JOIN buy b
        ON m.mem_id = b.mem_id;


-- < UNION >
-- JOIN은 열 + 열의 연결
-- UNION은 행 + 행의 연결
--      : 결과 행1(SELECT의 결과)
--                   +
--        결과 행2(SELECT의 결과)

-- UNION ALL : 중복된 결과도 허용
-- UNION DISTINCT : 중복된 결과는 제거
SELECT mem_id, addr FROM member -- 10개
UNION ALL -- 10 + 12 = 22, 총 22개의 값 출력
SELECT mem_id, prod_name  FROM buy; -- 12개

-- 열의 갯수를 맞춰야 함! (오류)
SELECT mem_id, addr FROM member -- 열 갯수 2개
UNION ALL 
SELECT mem_id FROM buy; -- 열 갯수 1개


-- < CROSS JOIN (상호 조인) >
-- : 모든 행과 행을 연결하는 조합 (데카르트 합) 
--   buy 12행 * member 10행 = 120행
SELECT COUNT(*)
  FROM buy
    CROSS JOIN member;
    
SELECT *
  FROM buy
    CROSS JOIN member
  WHERE buy.mem_id = 'BLK' AND member.addr = '서울';
  
  
-- < SELF JOIN (자체 조인) >
-- : 자신의 테이블과 조인
SELECT m1.mem_id, m1.mem_name
  FROM member m1
    INNER JOIN member m2
    ON m1.mem_id = m2.mem_id
  ORDER BY m1.mem_id;

-- 10 * 10 = 100
SELECT COUNT(*)
  FROM member m1
    CROSS JOIN member m2;
    
    
SELECT *
  FROM member m1
    CROSS JOIN member m2;
    
        
SELECT *
  FROM member m1
    CROSS JOIN member m2
  WHERE m1.mem_id = 'MMU' AND m2.addr = '경기';


-- 연습문제
-- 자체 조인을 통해  문제 해결
CREATE TABLE emp_table (
    emp CHAR(4),      -- 직책
    manager CHAR(4),  -- 직속상관
    phone VARCHAR(8)  -- 내선번호
);
INSERT INTO emp_table VALUES('대표', NULL, '0000');
INSERT INTO emp_table VALUES('영업이사', '대표', '1111');
INSERT INTO emp_table VALUES('관리이사', '대표', '2222');
INSERT INTO emp_table VALUES('정보이사', '대표', '3333');
INSERT INTO emp_table VALUES('영업과장', '영업이사', '1111-1');
INSERT INTO emp_table VALUES('경리부장', '관리이사', '2222-1');
INSERT INTO emp_table VALUES('인사부장', '관리이사', '2222-2');
INSERT INTO emp_table VALUES('개발팀장', '정보이사', '3333-1');
INSERT INTO emp_table VALUES('개발주임', '정보이사', '3333-1-1');

SELECT * FROM emp_table;

-- 경리부장의 직속상관 연락처를 알고 싶다.
-- 같은 테이블에서 셀프 조인으로 연결하여 결과를 출력
SELECT e1.emp '직책', e2.emp "직속상관", e2.phone "직속상관내선번호"
    FROM emp_table e1
        INNER JOIN emp_table e2
        ON e1.manager = e2.emp
    WHERE e1.emp = '경리부장';

-- SELECT 열 목록
--   FROM 테이블 명1
--     INNER JOIN 테이블 명2
--     ON 조인될 조건
--   WHERE 검색 조건    
    