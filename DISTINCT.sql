create table T1 (ID SERIAL not null primary key, BCLOLOR VARCHAR, FCOLOR VARCHAR);
--DDL 

insert 
	into T1 (BCLOLOR, FCOLOR)
values
		('red', 'red')
	 ,  ('red', 'red')
	 ,  ('red', NULL)
	 ,  (NULL, 'red')
	 ,  ('red', 'green')
	 ,  ('red', 'blue')
	 ,  ('green', 'red')
	 ,  ('green', 'blue')
	 ,  ('green', 'green')
	 ,  ('blue', 'red')
	 ,  ('blue', 'green')
	 ,  ('blue', 'blue')
	 
;

commit;

select * from T1;

select 
	DISTInCT BCLOLOR
from 
	t1 
order by
	bclolor 
;



	 
