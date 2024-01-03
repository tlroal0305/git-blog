-- ex03.sql

-- 데이터의 추가/수정/삭제를 위한 SQL문

USE market_db;

-- toy1테이블 삭제
DROP TABLE toys1;

-- PK 추가 X
CREATE TABLE toys1(
  toy_id INT,
  toy_name CHAR(4),
  age INT 
);

-- 데이터 행을 추가 : INSERT INTO문
INSERT INTO toys1 ( toy_id, toy_name, age ) VALUES (1, '우디', 25);

SELECT * FROM toys1;

-- 열의 이름을 쓰지 않을 때 null로 들어감
INSERT INTO toys1 ( toy_id, toy_name ) VALUES (2, '버즈');

-- 모든 열의 데이터를 기입하면, 열 이름 생략 가능
INSERT INTO toys1 VALUES (3, '제시', 20);

-- 열의 갯수가 맞지 않으면, 오류!
INSERT INTO toys1 VALUES (4, '제시2');

SELECT * FROM toys1;

-- 테이블 삭제
DROP TABLE toys2;

-- 테이블 생성
CREATE TABLE toys2 (
  -- PRIMARY KEY : NOT NULL + UNIQUE 제약 조건
  -- NOT NULL : null값 허용 X
  -- AUTO_INCREMENT : 1부터 자동 증가하는 제약 조건
  toy_id INT PRIMARY KEY AUTO_INCREMENT,
  toy_name CHAR(4),
  age INT
  );
  
-- 데이터 추가
INSERT INTO toys2 VALUES ( NULL, '보핍', 25 );
INSERT INTO toys2 VALUES ( NULL, '슬링키', 22 );
INSERT INTO toys2 VALUES ( NULL, '렉스', 21 );

SELECT * FROM toys2;

-- 자동 증가된 마지막 ID를 출력
SELECT LAST_INSERT_ID();
 
 
 -- ALTER : 테이블이나 Database에 수정 작업을 하는 명령어
 -- AUTO_INCREMENT 시작값 설정하기
 ALTER TABLE toys2 AUTO_INCREMENT = 100;
 INSERT INTO toys2 VALUES (NULL, '재남', 35);
 

DROP TABLE city;

-- 행 데이터의 수정 : UPDATE문
CREATE TABLE city (
  city_name CHAR(35),
  population INT 
);

INSERT INTO city VALUES ('서울', 5000);
INSERT INTO city VALUES ('뉴욕', 7000);

SELECT * FROM city;

-- 주의점! : WHERE문을 쓰지 않으면, 모든 행에 대해 수정이 일어남
UPDATE city 
  SET city_name = 'LA', population = 2000
  WHERE city_name = '뉴욕';
  
-- 행 데이터 지우기 : DELET문
DROP TABLE city;

-- 테이블 다시 생성!
SELECT * FROM city;

DELETE 
  FROM city 
  WHERE city_name = '뉴욕';
  
DELETE 
  FROM city 
  WHERE city_name LIKE '서%';
  
-- 주의점 ! : WHERE문이 없으면, 모든 행이 지워짐
DELETE 
  FROM city;
  

SELECT COUNT(*) 
FROM city;


-- 연습문제
-- 테이블 생성 후
DROP TABLE city;

-- 테이블 다시 생성!
CREATE TABLE city (
  city_name CHAR(35),
  population INT 
);

INSERT INTO city VALUES ('서울', 5000);
INSERT INTO city VALUES ('인천', 3000);
INSERT INTO city VALUES ('수원', 2000);
INSERT INTO city VALUES ('안양', 1000);
INSERT INTO city VALUES ('성남', 1500);

SELECT * FROM city;
-- 1. 인구수가 1000명인 도시의 이름을 '중소도시-'+열 값으로 수정하시오.
--    CONCAT(문자열1, 문자열2) 문자열 연결 함수
UPDATE city
  SET city_name = CONCAT('중소도시-',city_name)
  WHERE population = 1000;
  
SELECT*FROM city;
  
-- 2. 도시 이름이 양으로 끝나는 도시의 인구수를 3500으로 수정하시오.
UPDATE city
  SET population = 3500
  WHERE city_name LIKE '%양'; 
  
SELECT * FROM city;

-- 3. 인구수 2000명이상 3000명 이하인 도시 목록을 삭제 후 출력하시오.
DELETE 
  FROM city 
  WHERE population between 2000 AND 3000; 
  
SELECT*FROM city;

-- < 해보기 >
-- 기존 데이터를 이용한 테이블 생성
DROP TABLE member_id;
CREATE TABLE member_id (SELECT member_id FROM member);
SELECT COUNT(*) FROM member_id;

-- 기존 데이터를 이용한 행 데이터 추가
INSERT INTO member_id (SELECT mamber_id FROM buy);
SELECT COUNT(*) FROM member_id;

-- 테이블의 구조를 확인하는 명령어 : DESCRIBE
DESCRIBE member_id;


mysql> DESC wp_links;
+------------------+---------------------+------+-----+---------------------+----------------+
| Field            | Type                | Null | Key | Default             | Extra          |
+------------------+---------------------+------+-----+---------------------+----------------+
| link_id          | bigint(20) unsigned | NO   | PRI | NULL                | auto_increment |
| link_url         | varchar(255)        | NO   |     |                     |                |
| link_name        | varchar(255)        | NO   |     |                     |                |
| link_image       | varchar(255)        | NO   |     |                     |                |
| link_target      | varchar(25)         | NO   |     |                     |                |
| link_description | varchar(255)        | NO   |     |                     |                |
| link_visible     | varchar(20)         | NO   | MUL | Y                   |                |
| link_owner       | bigint(20) unsigned | NO   |     | 1                   |                |
| link_rating      | int(11)             | NO   |     | 0                   |                |
| link_updated     | datetime            | NO   |     | 0000-00-00 00:00:00 |                |
| link_rel         | varchar(255)        | NO   |     |                     |                |
| link_notes       | mediumtext          | NO   |     | NULL                |                |
| link_rss         | varchar(255)        | NO   |     |                     |                |
+------------------+---------------------+------+-----+---------------------+----------------+
-- PRI : 기본키
-- MUL : 검색 속도 증가를 위한 키
-- UKI : 유일키 - 중복 허용하지 않는 키


-- DELETE와 비슷하지만 전체 행을 빨리 지우는 명령어 : TRUNCATE
TRUNCATE member_id;
SELECT COUNT(*) FROM member_id;