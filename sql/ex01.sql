--코멘트 
-- SQL 대소문자 구분이 없음.

-- DATABASE 선택
USE mydb;

--테이블 지우기
DROP TABLE member;

-- 테이블 생성
CREATE TABLE member (
-- NOT NULL : NULL 아님
-- AUTO_INCREMENT : 1씩 자동 증가
-- PRIMARY KEY, : 기본키, 모든 테이블에는 PK가 1개 있어야 됨
    memberno INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id VARCHAR(50),
    name VARCHAR(50)
);

--세션뷰를 새로고침 해야 생성된 테이블 확인 가능mydb

-- SQL에서 단따옴표, 쌍따옴표 구분X
-- 데이터(row, 행) 추가하기
INSERT INTO MEMBER (memberno, id, name) VALUES (1, 'hong', '홍길동');

-- 데이터 검색(조회)하기
-- * : 모든 컬럼의 데이터 출력
SELECT * FROM member;
SELECT id, name FROM member;

-- 데이터 추가하기 - 컬럼 이름 생략(단, 모든 컬럼의 데이터를 넣을 때)
INSERT INTO MEMBER VALUES (2, 'tom', '톰아저씨');
INSERT INTO MEMBER VALUES (3, 'son', '손흥민');
INSERT INTO MEMBER VALUES (4, 'mask', '머스크');
-- PK가 자동증가이므로 0으로 설정해도 됨
INSERT INTO MEMBER VALUES (0, 'john', '존');

SELECT * FROM member;

-- 데이터 수정하기
-- Mysql에서 예약어를 사용자정의로 사용하고 싶을 때
--  엑센트 문자로 좌우를 묶으면 됨. ex)`select` `table`
UPDATE member 
  SET id='lee', `name`='미스터리' 
  WHERE memberno=1;
  
-- UPDATE 테이블명
--   SET 수정한 내용
--   WHERE 수정할 내용

SELECT * FROM member;

-- 데이터 삭제하기
DELETE 
  FROM member 
  WHERE memberno=1;

SELECT * FROM member;

-- SQL CRUD
-- Create: insert
-- Read : select
-- Update : update
-- Delete : delete
 