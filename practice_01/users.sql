-- user 테이블 만들기
CREATE TABLE users (
  first_name TEXT,
  last_name TEXT,
  age INTEGER,
  country TEXT,
  phone BLOB,
  num INTEGER
);

-- 테이블 목록 조회
.tables

-- users 테이블 스키마 조회
.schema users

-- csv import하기
.mode csv
.import practice_01/users.csv users

-- 터미널 뷰 보기 좋게 변경하기
.headers on
.mode column

-- SELECT 이용해 조회하기
SELECT * FROM users limit 3;

-- INSERT 이용해 데이터 추가하기
INSERT INTO users VALUES ('혜진', '윤', 25, '경상북도', 010-1234-5678, 970102);

-- 방금 INSERT한 데이터 조회하기
SELECT rowid, * FROM users WHERE num=970102;

-- 성이 윤씨인 사람만 조회하기
SELECT rowid, * FROM users WHERE last_name='윤';

-- 성이 윤씨인 사람 수 조회하기
SELECT count(*) FROM users WHERE last_name='윤';

-- 성이 윤씨인 사람 중 3번째부터 5명 조회하기
SELECT rowid, * FROM users WHERE last_name='윤' LIMIT 5 OFFSET 2;

-- 성 종류 조회하기
SELECT DISTINCT last_name FROM users;

-- UPDATE 이용해 num=970102인 사람의 전화번호 바꾸기
UPDATE users SET phone=010-0000-0000 WHERE num=970102;

-- num=970102인 행 조회하기
SELECT * FROM users WHERE num=970102;

-- DELETE 이용해 num=970102인 사람 제거하기
DELETE FROM users WHERE num=970102;

-- users 테이블 삭제
DROP TABLE users;