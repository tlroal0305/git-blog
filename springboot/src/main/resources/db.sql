-- db.sql
DROP DATABASE IF EXISTS kiosk;
CREATE DATABASE kiosk;

USE kiosk;

-- 회원정보
DROP TABLE if EXISTS kiosk.member;
CREATE TABLE kiosk.member(
   member_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   member_id VARCHAR(255) NOT NULL UNIQUE, -- 아이디
   member_pw VARCHAR(255) NOT NULL, -- 암호
	member_name VARCHAR(255) NOT NULL, -- 이름
	member_role VARCHAR(255) DEFAULT('ROLE_USER') NOT NULL, -- 권한
	member_point INT DEFAULT(0), -- 적립금
   member_join_datetime DATETIME DEFAULT NOW() -- 작성/수정 시간
);

INSERT INTO kiosk.member VALUES(
		0, 'hong', '1234', '홍길동', 'ROLE_USER', 0, DEFAULT);
SELECT * FROM kiosk.member;


-- 상품정보
DROP TABLE if EXISTS item;
CREATE TABLE item(
    item_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   item_code VARCHAR(255) NOT NULL UNIQUE, -- 상품 코드(UUID포맷-32자리)
   item_name VARCHAR(255) NOT NULL, -- 상품이름
    item_cate VARCHAR(255) NOT NULL, -- 카테고리
    item_recommend INT DEFAULT(0) NOT NULL, -- 추천메뉴 1 추천 0 추천아님
    item_price INT(255) NOT NULL, -- 가격
    item_image_url TEXT NOT NULL, -- 이미지
    item_update_datetime DATETIME DEFAULT NOW() -- 작성/수정 시간
);
INSERT INTO item VALUES(null, '123e4567-e89b-12d3-a456-556642440000', '빅맥® 세트',
        '버거&세트', 1, 7800, 'https://www.mcdonalds.co.kr/upload/product/pcList/1614163214488.png', DEFAULT);
INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440001', '불고기 버거 세트',
        '버거&세트', 1, 5800, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730880048.png', DEFAULT);
INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440002', '치즈버거 세트',
        '버거&세트', 0, 6000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730513407.png', DEFAULT);
INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440003', '더블치즈버거 세트',
        '버거&세트', 0, 7300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730095033.png', DEFAULT);

INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440004', '해피밀 불고기 버거',
        '해피밀', 1, 7300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583727790570.png', DEFAULT);
INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440005', '해피밀 햄버거™',
        '해피밀', 0, 5500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583728270768.png', DEFAULT);

INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440006', '아이스크림 라떼',
        '커피', 1, 4300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1655284674592.png', DEFAULT);
INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440007', '바닐라 라떼',
        '커피', 0, 4500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677678747710.png', DEFAULT);

INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440008', '베리 스트로베리 맥플러리',
        '디저트', 1, 3700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1617837791724.png', DEFAULT);
INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440009', '딸기 선데이 아이스크림',
        '디저트', 0, 4500, 'https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290248522400.png', DEFAULT);

INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440010', '7곡 쉐이크',
        '음료', 1, 3900, 'https://www.mcdonalds.co.kr/upload/product/pcList/1688445855221.png', DEFAULT);
INSERT INTO item VALUES(NULL, '456e4567-e89b-12d3-a456-556642440011', '코카-콜라',
        '음료', 0, 2400, 'https://www.mcdonalds.co.kr/upload/product/pcfile/1583889967380.png', DEFAULT);

SELECT * FROM item;

-- 장바구니
DROP TABLE if EXISTS cart;
CREATE TABLE cart (
    cart_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   cart_code VARCHAR(255) NOT NULL UNIQUE, -- 장바구니 코드(UUID포맷-32자리)
   item_code VARCHAR(255) NOT NULL UNIQUE, -- 상품 코드(UUID포맷-32자리)
    item_name TEXT NOT NULL, -- 상품이름
    item_image_url TEXT NOT NULL, -- 이미지
    item_price INT(255) NOT NULL, -- 가격
    cart_item_amount INT(255) NOT NULL, -- 구매갯수
    cart_date DATETIME DEFAULT NOW() -- 장바구니에 담긴 시간/날짜
);
INSERT INTO cart VALUES(NULL, '456e4567-e89b-12d3-a456-556642449999',
        '123e4567-e89b-12d3-a456-556642440000', '베이컨버거', 'buger1.jpg', 35000, 1,
        DEFAULT);
SELECT * FROM cart;

-- 결제정보
DROP TABLE if EXISTS `order`;

CREATE TABLE `order` (
    order_no INT AUTO_INCREMENT PRIMARY KEY, -- 고유키
    order_code VARCHAR(255) NOT NULL UNIQUE, -- 주문코드(UUID포맷-32자리)
      -- 구매상품 정보
    cart_item_code_1 VARCHAR(255) NOT NULL UNIQUE, -- 상품코드1(UUID포맷-32자리)
    cart_item_code_2 VARCHAR(255) UNIQUE, -- 상품코드2(UUID포맷-32자리)
    cart_item_code_3 VARCHAR(255) UNIQUE, -- 상품코드3(UUID포맷-32자리)
    cart_item_code_4 VARCHAR(255) UNIQUE, -- 상품코드4(UUID포맷-32자리)
    cart_item_code_5 VARCHAR(255) UNIQUE, -- 상품코드5(UUID포맷-32자리)
    order_total_price INT NOT NULL, -- 주문 총금액
    order_total_count TINYINT NOT NULL, -- 주문 상품 개수(최대 5개)
    -- 주문자/수령자 정보
    order_number INT NOT NULL, -- 주문자 임시번호(0 ~ 999)
    -- 결제방법
    order_pay_type INT DEFAULT(1) NOT NULL, -- 01 신용카드 또는 02 간편결제
    -- 주문상태
    -- 결제완료 -> 상품 준비중 -> 상품 준비완료 -> 수령 완료 or 기한후 폐기
    order_state VARCHAR(255) NOT NULL DEFAULT '결제완료',
    order_datetime DATETIME DEFAULT NOW() -- 결제시간
);
INSERT INTO `order` VALUES(0, '123e4567-e89b-12d3-a456-556642440000', NULL, NULL, NULL, NULL,
        35000, 1, 123, DEFAULT, '결제완료', DEFAULT);
INSERT INTO `order` VALUES(0, '123e4567-e89b-12d3-a456-556642441111', NULL, NULL, NULL, NULL,
        35000, 1, 123, DEFAULT, '결제완료', DEFAULT);
SELECT * FROM kiosk.`order`;
TRUNCATE kiosk.`order`;

-- 영수증 정보
DROP TABLE if EXISTS receipt;
CREATE TABLE receipt (
    receipt_no INT AUTO_INCREMENT PRIMARY KEY, -- 고유키
    receipt_number INT NOT NULL UNIQUE, -- 영수증 번호 = 주문자 임시번호(0 ~ 999)
    receipt_machine_no INT NOT NULL UNIQUE, -- 키오스크 기기 번호(01,02...)
    receipt_company_name VARCHAR(255) NOT NULL, -- 회사 이름
    receipt_company_number VARCHAR(255) NOT NULL, -- 사업자 번호 000-00-00000
    receipt_company_owner VARCHAR(255) NOT NULL, -- 대표자 이름
    receipt_company_phone VARCHAR(255) NOT NULL, -- 회사 전화번호
    receipt_datetime DATETIME DEFAULT NOW() -- 결제 시간
);
INSERT INTO receipt VALUES(NULL, 123, 01, '맥도날드 의정부점', '123-00-00000', '홍길동',
      '010-1234-5678', DEFAULT);
SELECT * FROM receipt;