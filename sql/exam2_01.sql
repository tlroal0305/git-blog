-- exam2.sql

DROP DATABASE if EXISTS exam;
CREATE DATABASE exam;
USE exam;

-- 상품 정보
DROP TABLE if EXISTS item;
CREATE TABLE item(
       item_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 기본키
       item_name VARCHAR(255) NOT NULL, -- 상품 이름
       item_price INT NOT NULL -- 가격
 );

INSERT INTO item VALUES (NULL, '와퍼주니어', 5000);
INSERT INTO item VALUES (NULL, '와퍼', 6000);
INSERT INTO item VALUES (NULL, '불고기', 7000); 
SELECT * FROM item;

SELECT * 
  FROM item
  WHERE item_price >= 6000;

-- 장바구니

DROP TABLE if EXISTS cart;
CREATE TABLE cart(
       cart_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 기본키
       cart_item_no INT NOT NULL, -- item테이블 PK
       cart_item_name VARCHAR(255) NOT NULL, -- 상품 이름
       cart_item_price INT NOT NULL, -- 가격
       cart_item_count INT NOT NULL DEFAULT 1
 );
 ALTER TABLE cart
      ADD CONSTRAINT 
      FOREIGN KEY(cart_item_no) REFERENCES item(item_no);
DESC cart;


INSERT INTO cart VALUES (NULL, 1, '와퍼주니어', 5000, DEFAULT );
INSERT INTO cart VALUES (NULL, 2, '와퍼', 6000, DEFAULT );
INSERT INTO cart VALUES (NULL, 3, '불고기', 7000, DEFAULT );
INSERT INTO cart VALUES (NULL, 2, '와퍼', 6000, 2 ); 


SELECT * FROM cart;

SELECT cart_item_name, SUM(cart_item_count), SUM(cart_item_price *  cart_item_count)
  FROM cart
  GROUP BY cart_item_name;
  
SELECT cart_item_name, SUM(cart_item_count)
  FROM cart
  GROUP BY cart_item_name
  ORDER BY SUM(cart_item_count) DESC
  LIMIT 1;
  


  girl_groupkioskkioskkioskmydbmydb