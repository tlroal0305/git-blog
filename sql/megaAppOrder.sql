DROP DATABASE IF EXISTS apporder;
CREATE DATABASE apporder;
USE apporder;

-- 상품 테이블
DROP TABLE if EXISTS item;
CREATE TABLE item(
    item_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   item_code VARCHAR(255) NOT NULL UNIQUE, -- 상품 코드(UUID포맷-32자리)
   item_name VARCHAR(255) NOT NULL, -- 상품이름
   item_content VARCHAR(255) NOT NULL, -- 상품 상세정보
    item_cate VARCHAR(255) NOT NULL, -- 카테고리
    item_recommend INT DEFAULT(0) NOT NULL, -- 추천메뉴 1 추천 0 추천아님
    item_price INT(255) NOT NULL, -- 가격
    item_image_url TEXT NOT NULL, -- 이미지
    item_update_datetime DATETIME DEFAULT NOW() -- 작성/수정 시간
);

INSERT INTO item VALUES(NULL, '14d9017d-9fb1-42b8-982b-243125457b66', '왕할메가커피', '우리 할머니께서 즐겨드시던 달달한 믹스 커피 스타일로 만든 메가MGC커피만의 메가사이즈 커피 음료',
        '커피(ICE)', 0, 3000, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20230905185855_1693907935536_aXkP_SjplJ.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, '13c5023f-d8cb-44f5-91fd-2afefcc64a3c', '할메가커피', '우리 할머니께서 즐겨드시던 달달한 믹스 커피 스타일로 만든 메가MGC커피만의 시원한 커피 음료',
        '커피(ICE)', 0, 2500, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20230905185615_1693907775304_fenhtXqy4y.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, 'd70a2c3a-24a1-4c85-a721-77bfabd39d2a', '디카페인 헤이즐넛 아메리카노', '디카페인 아메리카노에 헤이즐넛의 풍성한 향과 달콤함을 담아 향긋하고 부드럽게 즐기는 커피',
        '커피(HOT)', 0, 2000, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20230217162028_1676618428061_TbHsToNMcN.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, '3fde9a4c-cd2d-4d36-a99e-9d6f7ad454c1', '디카페인 바닐라 아메리카노', '디카페인 아메리카노에 바닐라의 부드러운 향과 달콤함을 조화롭게 담아낸 커피',
        '커피(HOT)', 0, 2000, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20230217162028_1676618428061_TbHsToNMcN.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, '2fa72da6-c7ad-4b0f-9242-99aad1c43b0d', '에스프레소', '메가MGC커피 원두의 향미를 온전히 즐길 수 있는 에스프레소',
        '커피(HOT)', 0, 1500, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20220818143216_1660800736386_C007eosz5G.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, '15b814c7-49b9-4798-a64a-23c214cfdd5e', '라임모히또', '상큼한 라임과 달콤한 향기의 애플민트가 어우러져 상쾌함을 한잔에 가득 채운 모히또 음료',
        '에이드&주스', 0, 2500, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20220630175423_1656579263944_ycn4t3hwxa.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, '3d584402-7db9-44af-b8c1-53396ae78ea7', '레몬에이드', '시트러스향 가득한 레몬의 상큼함과 톡쏘는 탄산의 상쾌함이 만난 청량 에이드',
        '에이드&주스', 0, 2500, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20220630175526_1656579326607_5YlsYvYbOp.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, 'aff8a316-f26f-4bbb-9ace-e8fa33eaaffa', '딸기쿠키프라페', '부드러운 바닐라와 달달한 딸기, 바삭한 오레오 쿠키가 달콤한 하모니를 선물하는 프라페',
        '스무디&프라페', 0, 2500, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20220630172226_1656577346336_z_d4URoCvB.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, 'd7c32a62-f48c-460a-a136-d9fe48fbaeb6', '쿠키프라페', '바삭하고 달콤한 오레오와 고소한 우유, 부드러운 바닐라향의 조화를 느낄 수 있는 프라페',
        '스무디&프라페', 0, 2500, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20220630173946_1656578386691_VAWfjgN1Yy.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, 'd92e690a-8341-4059-8642-5c44b0a38527', '초코스모어쿠키', '초코칩이 콕콕 박힌 촉촉한 초코 쿠키에 달콤하게 구운 마시멜로우가 만나 더 진한 초코 맛 쿠키',
        '디저트', 1, 2500, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20220701140929_1656652169641_bB76y9JSan.jpg', DEFAULT);
INSERT INTO item VALUES(NULL, '6187b605-fe3e-498c-a729-a54d86e43060', '오트밀 팬케이크', '건강한 오트밀가루로 만든 팬케이크에 달콤한 메이플 시럽과 프레지덩 버터, 쥬에그 과일잼이 더해진 팬케이크',
        '디저트', 0, 2500, 'https://img.79plus.co.kr/megahp/manager/upload/menu/20230706143342_1688621622949_aBPbL39jYS.jpg', DEFAULT);

SELECT * FROM item;


-- 장바구니 테이블1
DROP TABLE if EXISTS cart;
CREATE TABLE cart (
    cart_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   cart_code VARCHAR(255) NOT NULL , -- 장바구니 코드(UUID포맷-32자리)
   item_code VARCHAR(255) NOT NULL , -- 상품 코드(UUID포맷-32자리)
    item_name TEXT NOT NULL, -- 상품이름;
    item_image_url TEXT NOT NULL, -- 이미지
    cart_price INT(255) NOT NULL, -- 가격
    option_name_1 VARCHAR(255) NOT NULL DEFAULT ('해당없음'),
	 option_name_2 VARCHAR(255) NOT NULL DEFAULT ('해당없음'),
	 option_name_3 VARCHAR(255) NOT NULL DEFAULT ('해당없음'), -- 옵션이름
    cart_item_amount INT(255) NOT NULL, -- 구매갯수
    cart_date DATETIME DEFAULT NOW() -- 장바구니에 담긴 시간/날짜
);

SELECT * FROM cart;

-- 장바구니 테이블2
DROP TABLE if EXISTS cart2;
CREATE TABLE cart2 (
    cart_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   cart_code VARCHAR(255) NOT NULL , -- 장바구니 코드(UUID포맷-32자리)
   item_code VARCHAR(255) NOT NULL , -- 상품 코드(UUID포맷-32자리)
    item_name TEXT NOT NULL, -- 상품이름;
    item_image_url TEXT NOT NULL, -- 이미지
    cart_price INT(255) NOT NULL, -- 가격
    option_name_1 VARCHAR(255) NOT NULL DEFAULT ('해당없음'),
	 option_name_2 VARCHAR(255) NOT NULL DEFAULT ('해당없음'),
	 option_name_3 VARCHAR(255) NOT NULL DEFAULT ('해당없음'), -- 옵션이름
    cart_item_amount INT(255) NOT NULL, -- 구매갯수
    cart_date DATETIME DEFAULT NOW() -- 장바구니에 담긴 시간/날짜
);

SELECT * FROM cart2;


-- 주문 테이블
DROP TABLE if EXISTS `order`;
CREATE TABLE `order` (
    order_no INT AUTO_INCREMENT PRIMARY KEY, -- 고유키
    order_code VARCHAR(255) NOT NULL UNIQUE, -- 주문코드(UUID포맷-32자리)
      -- 구매상품 정보
    cart_item_code_1 VARCHAR(255) NOT NULL UNIQUE, -- 상품코드1(UUID포맷-32자리) -> 카트 코드
    cart_item_code_2 VARCHAR(255) UNIQUE, -- 상품코드2(UUID포맷-32자리)
    cart_item_code_3 VARCHAR(255) UNIQUE, -- 상품코드3(UUID포맷-32자리)
    cart_item_code_4 VARCHAR(255) UNIQUE, -- 상품코드4(UUID포맷-32자리)
    cart_item_code_5 VARCHAR(255) UNIQUE, -- 상품코드5(UUID포맷-32자리)

    order_total_price INT NOT NULL, -- 주문 총금액
    order_total_count TINYINT NOT NULL, -- 주문 상품 개수(최대 5개)
    -- 주문자/수령자 정보
    order_number INT NOT NULL, -- 주문자 임시번호(0 ~ 999)
    -- 결제방법
    order_pay_type VARCHAR(255) NOT NULL, -- 0 현금 또는 1 카드
    -- 주문상태
    order_datetime DATETIME DEFAULT NOW() -- 결제시간
);

INSERT INTO `order` VALUES (NULL, '4444e4567-e89b-12d3-b456-556642440113', '5555e4567-e89b-12d3-a456-556642441111', 
NULL, NULL, NULL, NULL, 5000, 2, 10, '현금', DEFAULT);


SELECT * FROM `order`;


-- 회원 테이블
DROP TABLE if EXISTS apporder.member;
CREATE TABLE apporder.member(
   member_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   member_id VARCHAR(255) NOT NULL UNIQUE, -- 아이디
   member_pw VARCHAR(255) NOT NULL, -- 암호
   member_name VARCHAR(255) NOT NULL, -- 이름
   member_role VARCHAR(255) DEFAULT('ROLE_USER') NOT NULL, -- 권한
   member_point INT DEFAULT(0), -- 쿠폰
   member_join_datetime DATETIME DEFAULT NOW() -- 작성/수정 시간
);

INSERT INTO apporder.member VALUES(NULL, 'admin', '1234',
        '관리자', 'ROLE_ADMIN', DEFAULT, DEFAULT);
INSERT INTO apporder.member VALUES(NULL, 'hong', '1111',
        '홍길동', 'ROLE_USER', 6, DEFAULT);
INSERT INTO apporder.member VALUES(NULL, 'lee', '0000',
        '이순신', 'ROLE_USER', 4, DEFAULT);



SELECT * FROM apporder.member;



-- 옵션 테이블
DROP TABLE if EXISTS apporder.p_option;
CREATE TABLE apporder.p_option(
   option_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   option_item_cate VARCHAR(255) NOT NULL,
   option_cate VARCHAR(255) NOT NULL, -- 옵션 카테고리
   option_name VARCHAR(255) NOT NULL, -- 옵션 이름
   option_price int(255) NOT NULL DEFAULT('0') -- 옵션 가격
);

INSERT INTO apporder.p_option VALUES(NULL, '커피(ICE)', '농도', '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(ICE)', '농도', '연하게', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(ICE)', '농도', '샷 추가', 500);
INSERT INTO apporder.p_option VALUES(NULL, '커피(ICE)', '농도', '2샷 추가', 1000);
INSERT INTO apporder.p_option VALUES(NULL, '커피(ICE)', '꿀 추가', '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(ICE)', '꿀 추가', '꿀 추가', 700);
INSERT INTO apporder.p_option VALUES(NULL, '커피(ICE)', '개인 텀블러 사용', '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(ICE)', '개인 텀블러 사용' ,'텀블러(개인컵) 사용', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(HOT)', '농도', '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(HOT)', '농도', '연하게', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(HOT)', '농도', '샷 추가', 500);
INSERT INTO apporder.p_option VALUES(NULL, '커피(HOT)', '농도', '2샷 추가', 1000);
INSERT INTO apporder.p_option VALUES(NULL, '커피(HOT)', '꿀 추가', '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(HOT)', '꿀 추가', '꿀 추가', 700);
INSERT INTO apporder.p_option VALUES(NULL, '커피(HOT)', '개인 텀블러 사용', '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '커피(HOT)', '개인 텀블러 사용' ,'텀블러(개인컵) 사용', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '에이드&주스', '개인 텀블러 사용' , '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '에이드&주스', '개인 텀블러 사용' , '텀블러(개인컵) 사용', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '스무디&프라페', '개인 텀블러 사용' , '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '스무디&프라페', '개인 텀블러 사용' , '텀블러(개인컵) 사용', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '디저트', '개인 텀블러 사용' , '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '디저트', '농도' , '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '디저트', '꿀 추가' , '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '에이드&주스', '농도' , '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '에이드&주스', '꿀 추가' , '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '스무디&프라페', '농도' , '해당없음', DEFAULT);
INSERT INTO apporder.p_option VALUES(NULL, '스무디&프라페', '꿀 추가' , '해당없음', DEFAULT);


SELECT * FROM apporder.p_option;



-- 공지사항 테이블
DROP TABLE if EXISTS notice;
CREATE TABLE notice(
   notice_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   notice_user VARCHAR(255) NOT NULL, -- 작성자
   notice_title VARCHAR(255) NOT NULL, -- 제목
   notice_content VARCHAR(255) NOT NULL, -- 내용
   notice_datetime DATETIME DEFAULT NOW(), -- 작성/수정 시간
   notice_image_url TEXT NOT NULL -- 이미지
);

INSERT INTO notice VALUES(NULL, 'admin', '공지사항1', '공지사항 글입니다.', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202311071550131533460215.jpg');
INSERT INTO notice VALUES(NULL, 'admin', '공지사항2', '공지사항 글입니다.', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202309061636491550818394.jpg');
INSERT INTO notice VALUES(NULL, 'admin', '공지사항3', '공지사항 글입니다.', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202312070204231798459983.jpg');
INSERT INTO notice VALUES(NULL, 'admin', '공지사항4', '공지사항 글입니다.', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202309061636491550818394.jpg');
INSERT INTO notice VALUES(NULL, 'admin', '공지사항5', '공지사항 글입니다.', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202309061636491550818394.jpg');
INSERT INTO notice VALUES(NULL, 'admin', '공지사항6', '공지사항 글입니다.', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202309061636491550818394.jpg');





SELECT * FROM notice;



-- 이벤트 테이블
DROP TABLE if EXISTS event;
CREATE TABLE event(
   event_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 고유키
   event_user VARCHAR(255) NOT NULL, -- 작성자
   event_title VARCHAR(255) NOT NULL, -- 제목
   event_content VARCHAR(255) NOT NULL, -- 내용
   event_datetime DATETIME DEFAULT NOW(), -- 작성/수정 시간
   event_image_url TEXT NOT NULL -- 이미지
);

INSERT INTO event VALUES(NULL,'admin', '[이벤트]메가MGC커피 X CJONE, MEGA ONE DAY', '이벤트글', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202311071550131533460215.jpg');
INSERT INTO event VALUES(NULL,'admin', '[이벤트]겨울시즌 오픈기념 이벤트', '이벤트글', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202310260947041163410733.jpg');
INSERT INTO event VALUES(NULL,'admin', '[이벤트]메가MGC커피 X 카카오페이, 5,000원 결제시 500원 즉시 할인!', '이벤트글', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/202310231602261447755798.png');
INSERT INTO event VALUES(NULL,'admin', '[이벤트]9~12월 메가MGC커피 X 하나페이 적립 EVENT', '이벤트글', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/20230925152421656240179.jpg');
INSERT event VALUES(NULL,'admin', '[이벤트]메가MGC커피 X 우주패스 가입 혜택 EVENT(10/1~)', '이벤트글', 
DEFAULT, 'http://img.79plus.co.kr/megahp/manager/upload/bbs/2023092515271929366099.png');


SELECT * FROM event;





