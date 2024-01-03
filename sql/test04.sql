-- test4

DROP DATABASE IF EXISTS exam;
examexamCREATE DATABASE exam;
USE exam;

-- 테이블을 2개 만들자
-- 걸그룹 목록 테이블
DROP TABLE girl_group;
CREATE TABLE girl_group
(
  girl_group_id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL,
  debut DATE NOT NULL,
  hit_song_id INT(3) NULL
);

SELECT * FROM girl_group;

-- 걸그룹 데이타 추가
INSERT INTO girl_group VALUES (NULL, '원더걸스', '2007-09-12', 101);
INSERT INTO girl_group VALUES (NULL, '소녀시대', '2009-06-03', 102);
INSERT INTO girl_group VALUES (NULL, '카라', '2009-07-30', 103);
INSERT INTO girl_group VALUES (NULL, '브라운아이드걸스', '2008-01-17', 104);
INSERT INTO girl_group VALUES (NULL, '다비치', '2009-02-27', 105);
INSERT INTO girl_group VALUES (NULL, '2NE1', '2009-07-08', 107);
INSERT INTO girl_group VALUES (NULL, 'f(x)', '2011-04-20', 109);
INSERT INTO girl_group VALUES (NULL, '시크릿', '2011-01-06', 110);
INSERT INTO girl_group VALUES (NULL, '레인보우', '2010-08-12', 111);
INSERT INTO girl_group VALUES (NULL, '에프터 스쿨', '2009-11-25', null);
INSERT INTO girl_group VALUES (NULL, '포미닛', '2009-08-28', null);


DROP TABLE song;
-- 히트송 목록 테이블
CREATE TABLE song
(
  song_id INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  lyrics VARCHAR(100) NULL
);
ALTER TABLE song AUTO_INCREMENT = 101;

SELECT * FROM song;

-- 히트송 데이타 추가
INSERT INTO song VALUES (NULL, 'Tell Me', 'tell me tell me tetetete tel me');
INSERT INTO song VALUES (NULL, 'Gee', 'GEE GEE GEE GEE GEE BABY BABY');
INSERT INTO song VALUES (NULL, '미스터', '이름이 뭐야 미스터');
INSERT INTO song VALUES (NULL, 'Abracadabra', '이러다 미쳐 내가 여리여리');
INSERT INTO song VALUES (NULL, '8282', 'Give me a call Baby baby');
INSERT INTO song VALUES (NULL, '기대해', '기대해');
INSERT INTO song VALUES (NULL, 'I Dont car', '다른여자들의다리를');
INSERT INTO song VALUES (NULL, 'Bad Girl Good Girl', '앞에선한마디말도');
INSERT INTO song VALUES (NULL, '피노키오', '뉴예삐오');
INSERT INTO song VALUES (NULL, '별빛달빛', '너는내별빛내마음의별빛');
INSERT INTO song VALUES (NULL, 'A', 'A워오우워오우워우우우');
INSERT INTO song VALUES (NULL, '나혼자', '나 혼자 밥을 먹고 나 혼자 영화 보고');
INSERT INTO song VALUES (NULL, 'LUV', '설레이나요');
INSERT INTO song VALUES (NULL, '짧은치마', '짧은 치마를 입고 내가 길을 걸으면');
INSERT INTO song VALUES (NULL, '위아래', '위 아래 위위 아래');
INSERT INTO song VALUES (NULL, 'Dumb Dumb' , '너 땜에 하루종일'); 

SELECT * 
  FROM girl_group 
  ORDER BY debut ASC;
  
SELECT * 
  FROM girl_group 
  WHERE NAME = '소녀시대';
  
SELECT * 
  FROM girl_group 
  WHERE hit_song_id BETWEEN 101 AND 105;
  
SELECT g.girl_group_id, g.NAME, g.hit_song_id
  FROM girl_group g
     INNER JOIN song s 
     ON g.hit_song_id = s.song_id
  WHERE title = '미스터';
   