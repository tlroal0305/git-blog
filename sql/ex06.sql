-- ex06.sql

-- 테이블과 뷰(view)

-- 새로운 데이터 베이스 생성하기
DROP DATABASE IF EXISTS naver_db; -- 데이터 베이스  삭제
CREATE DATABASE naver_db;
USE naver_db;


-- 새로운 테이블 생성
DROP TABLE if EXISTS member, buy;
CREATE TABLE member (
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL 
);
-- TINYINT UNSIGED : 표현 범위 0 ~ 255
-- NOT NULL : 제약 조건 nullL값을 insert시 오류 발생!

-- desc : 테이블의 정보를 보여줌
DESC MEMBER;


-- member 테이블 새로 생성
DROP TABLE if EXISTS MEMBER;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL,
  PRIMARY KEY (mem_id)
);

DESC MEMBER;


-- member 테이블 새로 생성
DROP TABLE if EXISTS member;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL
);

ALTER TABLE MEMBER
  ADD CONSTRAINT 
  PRIMARY KEY (mem_id);
  
DESC MEMBER;


-- member 테이블 새로 생성
DROP TABLE if EXISTS member;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL,
  CONSTRAINT PRIMARY KEY PK_member_mem_id (mem_id)
);
-- PK_member_mem_id : DBMS안에서 사용하는 PK 변수

DESC member;


-- [ 외래키 제약 조건 ]
-- 외래키 : foregin key - 한 테이블이 다른 테이블의 key열을 공유하는 것
-- 테이블 삭제 순서 : 외래키가 있는 테이블 -> 참조되는 테이블 순서로 삭제해야 함

DROP TABLE if EXISTS member, buy;

DROP TABLE buy;
DROP TABLE member;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL
);

CREATE TABLE buy(
  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  mem_id CHAR(8) NOT NULL,
  prod_name CHAR(6) NOT NULL,
  FOREIGN KEY (mem_id) REFERENCES member (mem_id)
);

-- FOREGIN KEY 제약 조건 

DESC member;
DESC buy; 

-- member 테이블 재 생성
DROP TABLE buy;
DROP TABLE member;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL
);

CREATE TABLE buy(
  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  mem_id CHAR(8) NOT NULL,
  prod_name CHAR(6) NOT NULL,
  FOREIGN KEY (mem_id) REFERENCES member (mem_id)
);

ALTER TABLE buy 
  ADD CONSTRAINT 
  FOREIGN KEY(mem_id) REFERENCES member(mem_id)

DESC buy;
  
-- MUL : Multiple Occurences Colume의 약자로서 다중 사용 컬럼이란 뜻
--       한쪽에서는 기본키, 다른 곳에서는 외래키로 사용


-- < 데이터 추가 >
INSERT INTO member VALUES ('BLK', '블랙핑크', 163);
SELECT * FROM member;
INSERT INTO buy VALUES ( NULL, 'BLK', '지갑');
-- member 테이블에 없는 PINK 외래키 입력시 오류 !
INSERT INTO buy VALUES ( NULL, 'PINK', '맥북'); -- 에러 발생
SELECT * FROM buy;


-- < 데이터 삭제 >
-- buy 테이블에서 참조하는 데이터를 삭제하는 경우 
-- => mamber 테이블의 mem_id를 삭제한다는 의미
-- 데이터를 지우는 순서 : 참조하는 테이블 -> 참조되는 테이블
DELETE FROM buy WHERE mem_id = 'BLK';
DELETE FROM member WHERE mem_id = 'BLK';


-- 케이스) member 테이블의 mem_id가 수정되는 경우 ? buy 테이블의 데이터는 ?
-- 외래키의 키 값이 수정되면, 자동으로 참조하는 키 값도 함께 수정되도록 가능
DROP TABLE member;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  mem_name VARCHAR(10) NOT NULL,
  height TINYINT UNSIGNED NULL
);

INSERT INTO member VALUES ('BLK', '블랙핑크', 163);

DROP TABLE buy;

CREATE TABLE buy(
  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  mem_id CHAR(8) NOT NULL,
  prod_name CHAR(6) NOT NULL
);

ALTER TABLE buy 
  ADD CONSTRAINT 
  FOREIGN KEY(mem_id) REFERENCES member(mem_id)
  ON UPDATE CASCADE -- 참조하는 키가 바뀌면 함께 바뀜
  ON DELETE CASCADE; -- 참조하는 키가 바뀌면 함께 지워짐
  -- CASCADE : 폭포수 
  
INSERT INTO buy VALUES (NULL, 'BLK', '지갑');
INSERT INTO buy VALUES (NULL, 'BLK', '맥북');
SELECT * FROM buy;

-- member 업데이트 !
UPDATE member 
  SET mem_id = 'PINK'
  WHERE mem_id = 'BLK';

SELECT * FROM member;
SELECT * FROM buy;


-- UNIQUE : 고유값 제약 조건 - 중복된 값을 넣으면 오류
DROP TABLE buy;
DROP TABLE member;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  email CHAR(30) NULL UNIQUE
);

DESC member;

INSERT INTO member VALUES ('BLK', 'pink@gamil.com');
INSERT INTO member VALUES ('APK', 'pink@gamil.com'); -- 중복 오류 발생


-- CHECK : 입력시 데이터에 조건을 주는 제약 조건
DROP TABLE member;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  height TINYINT UNSIGNED NULL CHECK (height >= 100) 
  -- CHECK (제약 조건문)
);

INSERT INTO member VALUES ('BLK', 163);
INSERT INTO member VALUES ('BLK', 83); -- 조건 오류 발생


DROP TABLE member;

CREATE TABLE member (
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  medal_grade CHAR(10) NULL 
);

ALTER TABLE member 
  ADD CONSTRAINT 
  CHECK (medal_grade IN ('금', '은', '동'));

INSERT INTO member VALUES ('BLK', '금');
INSERT INTO member VALUES ('BLK', '구리'); -- CHECK 제약 조건 오류 발생

-- DEFAULT : 기본값 지정
DROP TABLE member; 

CREATE TABLE member(
  mem_id CHAR(8) NOT NULL PRIMARY KEY,
  medal_grade CHAR(10) NULL DEFAULT '동' 
  -- insert될 때 기본값을 '동'으로 설정
  -- DEFAULT를 설정하지 않으면 NULL값이 들어갔었음
);

INSERT INTO member VALUES ('BLK', NULL); -- null도 하나의 값이므로 null로 출력
INSERT INTO member VALUES ('APN', ); -- 입력값이 없으면 오류 ! 
INSERT INTO member VALUES ('TWC', DEFAULT); -- 설정해놓은 기본값으로 설정
INSERT INTO member VALUES ('SPC', '금');

SELECT * FROM member;


-- < 뷰 >
-- 가상의 테이블 : 뷰 (view)
-- 사용하는 이유
-- 1. 보안 -> view는 기본적으로 Read Only 
--            DBMS 개발자는 여러명이 될 수 있음
--            모든 사람에게 최고권한(CRUD)을 주면 보안 문제 발생
-- 2. 복잡한 sql을 단순화
USE market_db;

CREATE VIEW v_member
AS 
   SELECT mem_id, mem_name, addr FROM member;

SELECT * FROM v_member;


-- 복잡한 SQL을 뷰테이블로 만들어 보기
SELECT b.mem_id, m.mem_name, b.prod_name, m.addr, CONCAT(m.phone1, m.phone2) '연락처'
  FROM buy b
    INNER JOIN member m
    ON b.mem_id = m.mem_id;
    
-- 검색 결과를 뷰 테이블에 저장하고 재사용함으로, SQL을 복잡한 것을 단순하게 
-- 일반 테이블에 있는 것처럼 뷰를 사용
CREATE VIEW v_member_buy
AS 
  SELECT b.mem_id, m.mem_name, b.prod_name, m.addr, CONCAT(m.phone1, m.phone2) '연락처'
  FROM buy b
    INNER JOIN member m
    ON b.mem_id = m.mem_id;
    
SELECT * FROM v_member_buy;
SELECT * FROM v_member_buy WHERE mem_name = '블랙핑크';


-- < 이벤트 감지>
-- 이벤트 감지 : trigger
-- INSERT DELETE UPDATE문이 작동할 때 자동으로 실행하는 SQL
-- 예) 회원 탈퇴
--       1. member 테이블에서 DELETE문이 작동할 때
--       2. exit_member 탈퇴 회원 테이블에 INSERT해 주도록 함
USE market_db;

DROP TABLE trigger_table;

CREATE TABLE trigger_table(
  id INT,
  txt VARCHAR(10)
);

INSERT INTO trigger_table VALUES(1, '홍길동');
INSERT INTO trigger_table VALUES(2, '변사또');
INSERT INTO trigger_table VALUES(3, '이순신');

SELECT * FROM trigger_table;


-- 트리거 선언 : 테이블에 트리거 부착
DROP TRIGGER exitTrigger;
-- 딜리미터 선언 - 일종의 배치 처리(일괄 처리)
DELIMITER $$

CREATE TRIGGER exitTrigger -- 트리거 이름
  AFTER DELETE -- 삭제 후 작동하도록 지정(DELETE, UPDATE, INSERT 중 하나)
  ON trigger_table -- 트리거를 부착할 테이블 이름
  FOR EACH ROW -- 각 행마다 적용
BEGIN 
  SET @msg := '회원이 탈퇴하셨습니다';
  
END $$
DELIMITER;


-- 트리거 사용
SET @mdg := '';

DELETE 
  FROM trigger_table 
  WHERE id = 2;
  
SELECT @msg;
SELECT FROM trigger_table;


-- member 테이블에서 singer 테이블 생성
-- singer 테이블 행 삭제시 백업용 테이블 backup_singer 생성
CREATE TABLE singer 
AS 
    (SELECT mem_id, mem_name, mem_number, addr FROM member);
    
SELECT * FROM singer;

DROP TABLE IF EXISTS backup_singer;
CREATE TABLE backup_singer (
    mem_id        CHAR(8) NOT NULL,
    mem_name     VARCHAR(10) NOT NULL,
    mem_number  INT NOT NULL,
    addr             CHAR(2) NOT NULL,
    modType        CHAR(2), -- 변경된 타입. '수정' 또는 '삭제'
    modDate         DATE,    -- 변경된 날짜
    modUser     VARCHAR(30)  -- 변경한 사용자.    '관리자' 'user_id'
);

DESC backup_singer;

-- 트리거 생성하기
DELIMITER $$

CREATE TRIGGER singer_updateTrigger -- 트리거 이름
  AFTER UPDATE -- 삭제 후 작동하도록 지정(DELETE, UPDATE, INSERT 중 하나)
  ON singer -- 트리거를 부착할 테이블 이름
  FOR EACH ROW -- 각 행마다 적용
BEGIN 
  -- OLD : 이벤트가 일어난 테이블
  INSERT INTO backup_singer VALUES ( OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr, '수정', CURDATE(), CURRENT_USER() );
END $$
DELIMITER;

UPDATE singer SET addr ='영국' WHERE mem_id = 'BLK';
SELECT * FROM singer;
SELECT * FROM backup_singer;


-- 삭제 - 트리거 생성하기
DELIMITER $$

CREATE TRIGGER singer_deleteTrigger
  AFTER DELETE 
  ON singer
  FOR EACH ROW 
BEGIN 
  -- OLD : 이벤트가 일어난 테이블
  INSERT INTO backup_singer VALUES ( OLD.mem_id, OLD.mem_name, OLD.mem_number, OLD.addr, '삭제', CURDATE(), CURRENT_USER() );
END $$
DELIMITER;

DELETE FROM singer WHERE mem_number >= 7;
SELECT * FROM singer;
SELECT * FROM backup_singer;