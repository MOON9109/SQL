USE employees

SELECT userID, amount FROM buytbl ORDER BY userID;


-- ID 별로 합계를 내서 출력해줌
SELECT userID, SUM(amount) FROM buytbl GROUP BY userID;

-- 이름 지정할 수도 있음
SELECT userID AS '사용자 아이디' , SUM(amount) AS '총 구매 개수'
	FROM buytbl GROUP BY userID;

-- 총 구매액 SUM 이용해서 사용할 수 있음

SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총구매액'
	FROM buytbl GROUP BY userID;
    
-- 평균 구하기

USE employees
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;

SELECT userID, AVG(amount) AS '평균 구매 개수 ' FROM buytbl GROUP BY userID;

-- 키가 가장 큰사람과 작은사람 이름 구하기

SELECT name, height
	FROM usertbl
    WHERE height =(SELECT MAX(height) FROM usertbl)
		OR height =(SELECT MIN(height) FROM usertbl);

-- 핸드폰이 있는 사람 카운트하기
        
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자 ' FROM usertbl

-- groupby랑 사용할 때 where 절이 아닌 having 절 사용,  쓰임

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
	FROM buytbl
    GROUP BY userID
    HAVING SUM(price*amount) >1000;
    
-- 총 구매액이 적은 사용자부터 나타내려면 ORDER BY를 사용하면 된다. 

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
	FROM buytbl
    GROUP BY userID
    HAVING SUM(price*amount) >1000
    ORDER BY SUM(price*amount);
    
    
-- ROLL UP 총합 또는 중간 합계가 필요하면 GROUP BY와 함께 WITH ROLLUP문을 사용하면 된다. 
-- 목록 별로 총합

SELECT num, groupName, SUM(price*amount) AS '비용'
	FROM buytbl
    GROUP BY groupName, num
    WITH ROLLUP;
    
-- 그룹별로 합계만 간략히 나타낼 수도 있다.

SELECT groupName, SUM(price*amount) AS '비용'
	FROM buytbl
    GROUP BY groupName
    WITH ROLLUP;
    

    
    
    

    
    




    


    
    


    