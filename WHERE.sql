-- where 절

SELECT * FROM usertbl WHERE name ='김경호';

SELECT userID, Name FROM usertbl WHERE birthYear >= 1970 AND Height >=182;

SELECT name, height FROM usertbl WHERE height >=180 and height <=183;

-- 위 방법 대신 SQL 사용할 수도 있다

SELECT name, height FROM usertbl WHERE height BETWEEN 180 AND 183;

-- or로 조건 달기

SELECT name, addr FROM usertbl WHERE addr ='경남' OR addr='전남' OR addr='경북';

-- or 대신 in 사용할 수도 있다

SELECT name, addr FROM usertbl WHERE addr IN ('경남', '전남', '경북');

-- 일부만 포함되는 것 찾을 수도 있다
-- 김 으로 시작되는 사람 찾기
-- = 사용하면 안됨, % 사용할 때는 LIKE 사용
SELECT name, height FROM usertbl WHERE name LIKE '김%';

-- 성은 상관없고 종신인것 검색
SELECT name, height FROM usertbl WHERE name LIKE '_종신'

-- 서브 쿼리는 쿼리문 안에 쿼리가 들어가 있는 것을 말함

SELECT name, height FROM usertbl
	WHERE height > (SELECT height FROM usertbl WHERE Name ='김경호');
    
SELECT name, height FROM usertbl
	WHERE height >= ANY (SELECT height FROM usertbl WHERE addr ='경남');
    -- 경남에 사는 아무 사람 중 한명 보다 큰사람 찾기

SELECT name, height FROM usertbl
	WHERE height >= ALL (SELECT height FROM usertbl WHERE addr ='경남')
    
-- ALL은 둘다 만족하는 사람 찾음

-- ORDER BY
-- 가입일이 빠른 순서대로 정렬됨
SELECT name, mDate FROM usertbl ORDER BY mDate;

-- 내림차순으로 정렬시 DESC 사용

SELECT name, mDate FROM usertbl ORDER BY mDate DESC;

-- 키가 같으면 가나다 순으로 이름 정렬

SELECT name, height FROM usertbl ORDER BY height DESC ,name ASC;






