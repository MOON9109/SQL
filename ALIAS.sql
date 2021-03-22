SELECT * FROM CUSTOMER;

select 
		first_NAME
		, LAST_NAME
		, EMAIL
		
from 
		customer 
;

select 
	A.FIRST_NAME
	, A.LAST_NAME
	, A.EMAIL
from 
	CUSTOMER A 
;
-- ALIAS -> 코드의 가독성-> SQL성능 높여줌
