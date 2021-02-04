USE employees;

SELECT * FROM employees;

SELECT * FROM titles;

USE mysql;

SELECT * FROM employees.titles;
/*데이터베이스 USE  안하고 사용하기
*/
-- 특정한 열만 사용할때

USE employees
SELECT first_name FROM employees
SELECT first_name, last_name, gender FROM employees

-- 데이터 베이스 확인

SHOW DATABASES;

USE employees;

-- 테이블 확인

SHOW TABLE STATUS;

-- 테이블 정보 확인

DESCRIBE employees; -- 또는  DESC employees;

SELECT first_name, gender FROM employees;




