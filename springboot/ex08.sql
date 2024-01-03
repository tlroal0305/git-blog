-- ex08.sql

DROP DATABASE IF EXISTS kiosk; -- 'kiosk' DB가 이미 있다면, 삭제함
CREATE DATABASE kiosk; -- 'kiosk' DB 생성

USE kiosk;

-- (1) 상품 테이블
DROP TABLE if EXISTS item; -- item 테이블이 있다면, 삭제함
CREATE TABLE item( -- 'item' 테이블 생성
    item_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 상품 번호(고유키, Null 없음)
   item_code VARCHAR(255) NOT NULL UNIQUE, -- 상품 코드(UUID포맷-32자리)
   item_name VARCHAR(255) NOT NULL, -- 상품명
    item_cate VARCHAR(255) NOT NULL, -- 카테고리
    item_recommend INT DEFAULT(0) NOT NULL, -- 추천 메뉴(추천('1'), 비추천('2')
    item_price INT(255) NOT NULL, -- 상품 가격
    item_image_url TEXT NOT NULL, -- 상품 이미지 링크
    item_update_datetime DATETIME DEFAULT NOW() -- 작성/수정 시간
);

-- 추천 메뉴 상품 데이터 삽입
INSERT INTO item (item_no, item_code, item_name, item_cate, item_recommend, item_price, item_image_url, item_update_datetime)
VALUES
    (null, '123e4567-e89b-12d3-a456-556642440100', '빅맥®', '버거&세트', 1, 5200, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583727841393.png', default),
    (null, '345e4567-e89b-12d3-a456-556642440104', '오레오 맥플러리', '디저트', 1, 3000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1615378570338.png', default),
    (null, '678e4567-e89b-12d3-a456-556642440105', '베리 스트로베리 맥플러리', '디저트', 1, 3000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1617837791724.png', default),
    (null, '234e4567-e89b-12d3-a456-556642440107', '맥윙™콤보', '디저트', 1, 4000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1619158576990.png', default),
    (null, '567e4567-e89b-12d3-a456-556642440108', '허니버터 맥쉐이커 후라이', '디저트', 1, 2700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1688446192658.png', DEFAULT),
    (null, '789e4567-e89b-12d3-a456-556642440109', '빅맥® 베이컨 버거', '버거&세트', 1, 7000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1697006298373.png', default),
    (null, '901e4567-e89b-12d3-a456-556642440110', '진도 대파 크림 크로켓 버거', '버거&세트', 1, 7500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1688446441647.png', DEFAULT);

-- 버거 세트 아이템 데이터 삽입
INSERT INTO item (item_no, item_code, item_name, item_cate, item_recommend, item_price, item_image_url, item_update_datetime)
VALUES
    (null, '012e4567-e89b-12d3-a456-556642440103', '맥치킨® 모짜렐라', '버거&세트', 0, 4700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583727633823.png', default),
    (null, '456e4567-e89b-12d3-a456-556642440101', '1955 버거™', '버거&세트', 0, 5500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1599119588089.png', default),
	 (null, '789e4567-e89b-12d3-a456-556642440200', '진도 대파 크림 크로켓 버거 세트', '버거&세트', 0, 8900, 'https://www.mcdonalds.co.kr/upload/product/pcList/1688446541898.png', default),
	 (null, '789e4567-e89b-12d3-a456-556642440102', '맥스파이시® 상하이 버거', '버거&세트', 0, 5200, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583728339451.png', default),
	 (null, '901e4567-e89b-12d3-a456-556642440106', '창녕 갈릭 치킨 버거', '버거&세트', 0, 7400, 'https://www.mcdonalds.co.kr/upload/product/pcList/1690777108407.png', default),
	 (null, '123e4567-e89b-12d3-a456-556642440001', '창녕 갈릭 치킨 버거 세트', '버거&세트', 0, 10900, 'https://www.mcdonalds.co.kr/upload/product/pcList/1690777293665.png', DEFAULT),
 	 (null, '123e4567-e89b-12d3-a456-556642440002', '창녕 갈릭 비프 버거 세트', '버거&세트', 0, 10200, 'https://www.mcdonalds.co.kr/upload/product/pcList/1690777625183.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440003', '빅맥® 세트', '버거&세트', 0, 7800, 'https://www.mcdonalds.co.kr/upload/product/pcList/1614163214488.png', DEFAULT),
 	 (null, '123e4567-e89b-12d3-a456-556642440004', '더블 쿼터파운더® 치즈 세트', '버거&세트', 0, 10400, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730166912.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440005', '쿼터파운더® 치즈 세트', '버거&세트', 0, 8900, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730926203.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440006', '맥크리스피™ 디럭스 버거 세트', '버거&세트', 0, 9200, 'https://www.mcdonalds.co.kr/upload/product/pcList/1653437184803.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440007', '맥크리스피™ 클래식 버거 세트', '버거&세트', 0, 8700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1653437044613.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440008', '맥스파이시® 상하이 버거 세트', '버거&세트', 0, 7800, 'https://www.mcdonalds.co.kr/upload/product/pcList/1614163251951.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440009', '1955® 버거 세트', '버거&세트', 0, 8800, 'https://www.mcdonalds.co.kr/upload/product/pcList/1599120019760.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440010', '맥치킨® 모짜렐라 세트', '버거&세트', 0, 8500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730423662.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440011', '맥치킨® 세트', '버거&세트', 0, 6300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730386510.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440012', '더블 불고기 버거 세트', '버거&세트', 0, 7300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730048428.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440013', '에그 불고기 버거 세트', '버거&세트', 0, 6500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1644572745053.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440014', '불고기 버거 세트', '버거&세트', 0, 5800, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730513407.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440015', '슈슈 버거 세트', '버거&세트', 0, 7300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730764292.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440016', '슈비 버거 세트', '버거&세트', 0, 9100, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730718094.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440017', '베이컨 토마토 디럭스 세트', '버거&세트', 0, 8700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730466187.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440018', '치즈버거 세트', '버거&세트', 0, 6000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730880048.png', DEFAULT),
	 (null, '123e4567-e89b-12d3-a456-556642440019', '더블치즈버거 세트', '버거&세트', 0, 7300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583730095033.png', DEFAULT);

-- 해피밀 상품 데이터 삽입
INSERT INTO item (item_no, item_code, item_name, item_cate, item_recommend, item_price, item_image_url, item_update_datetime)
VALUES
(null, '123e4567-e89b-12d3-a456-556642440020', '해피밀 불고기 버거', '해피밀', 0, 5500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583727790570.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440021', '해피밀 햄버거™', '해피밀', 0, 5500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583728270768.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440022', '해피밀 맥너겟® 4조각', '해피밀', 0, 5500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1612402426518.png', DEFAULT);

-- 커피 상품 데이터 삽입
INSERT INTO item (item_no, item_code, item_name, item_cate, item_recommend, item_price, item_image_url, item_update_datetime)
VALUES
(null, '123e4567-e89b-12d3-a456-556642440030', '디카페인 아이스크림 라떼', '커피', 0, 4300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1658814730858.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440031', '아이스크림 라떼', '커피', 0, 4300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1655284674592.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440032', '자두 천도복숭아 칠러', '커피', 0, 3700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1680590857356.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440033', '제주 한라봉 칠러', '커피', 0, 3700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1681287171454.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440034', '바닐라 라떼', '커피', 0, 4500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677678747710.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440035', '아이스 바닐라 라떼', '커피', 0, 4500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1654652258015.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440036', '카페라떼', '커피', 0, 4000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677680098077.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440037', '디카페인 카페라떼', '커피', 0, 4000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677679191098.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440038', '아이스 카페라떼', '커피', 0, 4000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1610885438226.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440039', '디카페인 아이스 카페라떼', '커피', 0, 4000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1610887213766.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440040', '아메리카노', '커피', 0, 3300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677680268942.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440041', '디카페인 아메리카노', '커피', 0, 3300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677679695867.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440042', '아이스 아메리카노', '커피', 0, 3300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1610887612850.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440043', '디카페인 아이스 아메리카노', '커피', 0, 3300, 'https://www.mcdonalds.co.kr/upload/product/pcList/1610889471102.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440044', '카푸치노', '커피', 0, 4000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677679931462.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440045', '디카페인 카푸치노', '커피', 0, 4000, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677679466906.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440046', '드립 커피', '커피', 0, 2700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1677680438743.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440047', '아이스 드립 커피', '커피', 0, 2500, 'https://www.mcdonalds.co.kr/upload/product/pcList/1610889794131.png', DEFAULT);

-- 디저트 상품 데이터 삽입
INSERT INTO item (item_no, item_code, item_name, item_cate, item_recommend, item_price, item_image_url, item_update_datetime)
VALUES
(null, '123e4567-e89b-12d3-a456-556642440048', '베리 스트로베리 맥플러리', '디저트', 0, 3700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1617837791724.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440050', '딸기 오레오 맥플러리', '디저트', 0, 3700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1615378501027.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440051', '초코 오레오 맥플러리', '디저트', 0, 3700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1615378442605.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440052', '딸기 선데이 아이스크림', '디저트', 0, 2800, 'https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290248522400.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440053', '초코 선데이 아이스크림', '디저트', 0, 2800, 'https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290248295110.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440054', '바닐라 선데이 아이스크림', '디저트', 0, 2800, 'https://www.mcdonalds.co.kr/upload/product/pcList/1657246835409.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440055', '코울슬로', '디저트', 0, 2700, 'https://www.mcdonalds.co.kr/upload/product/pcList/1676460052498.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440056', '상하이 치킨 스낵랩', '디저트', 1, 3100, 'https://www.mcdonalds.co.kr/uploadFolder/product/prol_201902080435011620.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440057', '소시지 스낵랩', '디저트', 1, 3100, 'https://www.mcdonalds.co.kr/upload/product/pcList/1697007357140.png', DEFAULT);

-- 음료 상품 데이터 삽입
INSERT INTO item (item_no, item_code, item_name, item_cate, item_recommend, item_price, item_image_url, item_update_datetime) VALUES
(null, '123e4567-e89b-12d3-a456-556642440058', '7곡 쉐이크', '음료', 0, 3900, 'https://www.mcdonalds.co.kr/upload/product/pcList/1688445855221.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440059', '코카-콜라', '음료', 0, 2400, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583889953745.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440060', '코카-콜라 제로', '음료', 0, 2400, 'https://www.mcdonalds.co.kr/upload/product/pcList/1583890010342.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440061', '스프라이트', '음료', 0, 2400, 'https://www.mcdonalds.co.kr/upload/product/pcList/1631160642498.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440062', '환타', '음료', 0, 2400, 'https://www.mcdonalds.co.kr/upload/product/pcList/1631160682409.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440063', '바닐라 쉐이크', '음료', 0, 3500, 'https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290255488970.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440064', '딸기 쉐이크', '음료', 0, 3500, 'https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290257347040.png', DEFAULT),
(null, '123e4567-e89b-12d3-a456-556642440065', '초코 쉐이크', '음료', 0, 3500, 'https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290257444640.png', DEFAULT);



SELECT * FROM item; -- 'item' 테이블 확인

-- (2) 장바구니 테이블
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
        '123e4567-e89b-12d3-a456-556642440058', '7곡 쉐이크', 'https://www.mcdonalds.co.kr/upload/product/pcList/1688445855221.png', 3900, 1, 
        DEFAULT);
SELECT * FROM cart;

-- 결제정보
DROP TABLE if EXISTS `order`;
CREATE TABLE `order` (
    order_no INT AUTO_INCREMENT PRIMARY KEY, -- 고유키
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
    order_pay_type INT DEFAULT(01) NOT NULL, -- 01 신용카드 또는 02 간편결제
  -- 주문상태
  -- 결제완료 -> 상품 준비중 -> 상품 준비완료 -> 수령 완료 or 기한후 폐기
    order_state VARCHAR(255) NOT NULL DEFAULT '결제완료',
    order_datetime DATETIME DEFAULT NOW() -- 결제시간
);
INSERT INTO `order` VALUES(NULL, '123e4567-e89b-12d3-a456-556642440000', NULL, NULL, NULL, NULL,
        35000, 1, 123, DEFAULT, '결제완료', DEFAULT);
SELECT * FROM `order`;

-- 영수증 정보
DROP TABLE if EXISTS receipt;kiosk
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