-- ex04.sql

-- [ MySQL / MariaDB의 데이터 타입 ]
-- 정수형 <-> INT INTEGER
-- INT : 4 바이트 -> -21억 ~ +21억
-- BIGINT : 8 바이트 -> -900경 ~ +900경
-- TINYINT : 1 바이트 -> -128~ +127
-- SMALLINT : 2 바이트 -> -32,768 ~ +32,767
CREATE TABLE `datatype_int`(
  tinyint_col TINYINT,
  smallint_col SMALLINT,
  int_col INT,
  bitint_col BIGINT 
);

-- 경 : 0이 18개
INSERT INTO `datatype_int`
  VALUES (127, 32767, 2147483647, 9000000000000000000);
  
SELECT * FROM datatype_int;

-- Out of Range 오류 발생!
INSERT INTO `datatype_int`
  VALUES (128, 32767, 2147483647, 9000000000000000000);
  
SELECT * FROM datatype_int;


-- 실수형
-- FLOAT : 4 바이트 -> -3 * 10^38 ~ +3 * 10^38  
-- DOUBLE : 8 바이트 -> -1.797 * 10^308 ~ +1.797 * 10^308


-- 문자형 <-> String
-- CHAR(갯수) : 1 ~ 255 바이트, 갯수를 생략하면 1, 자릿수 고정
-- VARCHER(갯수) : MySQL 1~16383 바이트, MariaDB 1~255 바이트
-- TEXT(갯수) : 1~65535 바이트
-- LONGTEXT : 최대크기 4GB
-- 1. CHAR는 고정형, VARCHAR는 유동형
--    예) CHAR(10) = "ABC" VARCHAR(10) = "ABC"
-- 2. CHAR가 속도가 더 빠르지만, 메모리 낭비가 생김
CREATE TABLE datatype_char(
  char_col CHAR(255),
  varchar_col VARCHAR(255),
  text_col TEXT(65535)
  );
  
INSERT INTO datatype_char VALUES ('문자열1', '문자열2', '문자열3');
SELECT * FROM datatype_char;


-- 날짜형
-- 날짜 타입 : DATE  <->  LocalDate
--           : 표현 범위 "1000-01-01" ~ "9999-12-31" : 심볼 yyyy-mm-dd
-- 시간 타입 : TIME  <->  LocalTime
--           : 표현 범위 "00:00:01" UTC ~ "23:59:59" UTC : 심볼 HH:MM:SS
-- 날짜/시간 타입 : DATETIME   <->  LocalDateTime
--           : 표현 범위 "1970-01-01 00:00:01" UTC ~ "9999-12-31 23:59:59" UTC 

-- 날짜관련 내장 함수
SELECT CURRENT_DATE(); -- 현재 날짜
SELECT CURRENT_TIME(); -- 현재 시간
SELECT NOW(); -- 현재 날짜시간

-- 회원가입 후 몇일 지났는가?
SELECT DATEDIFF('2023-12-15', CURRENT_DATE()); -- 날짜 간격


-- 바이너리 데이터형 : BLOB(Binary Long Object)
-- 그림이나 동영상 데이터를 기록 -> 파일 업로드로 대체하는 것이 좋음
--                               -> 파일 업로드 경로/이름을 VARCHAR/TEXT로 수록
-- BLOB 표현 범위 : 65535 바이트
-- LONGBLOB 표현 범위 : 4GB 
