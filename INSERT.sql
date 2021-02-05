-- INSERT 데이터 입력

USE sqldb;
CREATE TABLE testTbl1 (id int, username char(3), age int);
INSERT INTO testTbl1 VALUES(1, '홍길동', 25);

INSERT INTO testTbl1(userName, age, id) VALUES ('하니', 26, 3);

SELECT * FROM testTbl1;

-- AUTO INCREMENT
USE sqldb;
CREATE TABLE testTbl2
	(id int AUTO_INCREMENT PRIMARY KEY,
	userName char(3),
    age int);

INSERT INTO testTbl2 VALUES (NULL, '지민' ,25);
INSERT INTO testTbl2 VALUES (NULL, '유나' ,22);
INSERT INTO testTbl2 VALUES (NULL, '유경' ,21);

SELECT * FROM testTbl2;

-- AUTO INCREMENT 입력값을 100으로 입력되도록 변경
ALTER TABLE testTbl2 AUTO_INCREMENT =100;
INSERT INTO testTbl2 VALUES(NULL, '찬미', 23);
SELECT * FROM testTbl2;

-- AUTO INCREMENT 증가 3씩 변경

USE sqldb;
CREATE TABLE testTbl3
	(id int AUTO_INCREMENT PRIMARY KEY,
    userName char(3),
    age int);
ALTER TABLE testTbl3 AUTO_INCREMENT =1000;
SET @@auto_increment_increment=3;
INSERT INTO testTbl3 VALUES (NULL, '나연', 20);
INSERT INTO testTbl3 VALUES (NULL, '정연', 18);
INSERT INTO testTbl3 VALUES (NULL, '모모', 19);

SELECT * FROM testTbl3;

-- 대량의 샘플 데이터 생성

USE sqldb;
CREATE TABLE testTbl4 (id int, Fname VARCHAR(50), Lname VARCHAR(50));
INSERT INTO testTbl4
	SELECT emp_no, first_name, last_name
		FROM employees.employees ;
        
SELECT * FROM testTbl4;

-- UPDATE 문 ,일반적으로 WHERE와 동시에 사용

UPDATE testTbl4
	SET Lname = '없음'
    WHERE Fname = 'Kyoichi';
-- WHERE 빼놓으면 모든 데이터가 바뀜


-- DELETE 문 , 일반적으로 WHERE와 같이 사용

USE sqldb;
DELETE FROM testTbl4 WHERE Fname = 'Aamer';

-- 228건 삭제됨

USE sqldb;
CREATE TABLE bigTbl1 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl2 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl3 (SELECT * FROM employees.employees);

-- DELETE 느림
-- DROP, TRUNCATE 빠름
-- DROP 테이블 완전히 없어짐

DELETE FROM bigTbl1;
DROP TABLE bigTbl2;
TRUNCATE TABLE bigTbl3;

USE employees;
CREATE TABLE memberTBL (SELECT userID, name, addr FROM usertbl LIMIT 3);
ALTER TABLE memberTBL
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID);
SELECT * FROM memberTBL;

-- 키 값 중복된게 있으면 아래 값 입력이 안됨

INSERT INTO memberTBL VALUES('BBK', '바비코', '미국');
INSERT INTO memberTBL VALUES('SJH', '서장훈', '서울');
INSERT INTO memberTBL VALUES('HJY', '현주엽', '경기');

SELECT * FROM memberTBL;

-- IGNORE 하면 에러나더라도 무시하고 실행됨

INSERT IGNORE INTO memberTBL VALUES('BBK', '바비코', '미국');
INSERT IGNORE INTO memberTBL VALUES('SJH', '서장훈', '서울');
INSERT IGNORE INTO memberTBL VALUES('HJY', '현주엽', '경기');

SELECT * FROM memberTBL;
-- 키가 중복되면 업데이트하는 구문

INSERT INTO memberTBL VALUES('BBK', '비비코', '미국')
	ON DUPLICATE KEY UPDATE name='비비코', addr='미국';

INSERT INTO memberTBL VALUES('DJM', '동짜몽', '일본')
	ON DUPLICATE KEY UPDATE name='동짜몽', addr='일본';

SELECT * FROM memberTBL;

-- WITH 절과 CTE
-- SELECT 문 결과를 TABLE로 사용

WITH abc(userid, total)
AS
(SELECT userID, SUM(price*amount)
	FROM buytbl GROUP BY userid)

SELECT * FROM abc ORDER BY total DESC; 









