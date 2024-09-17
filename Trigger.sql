-- create function syntax
CREATE FUNCTION trigger_function()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
BEGIN
	-- trigger logic
END;
$$

--create trigger function
CREATE TRIGGER tigger_name
	{BEFORE | AFTER } {event} ON table_name

	[FOR [EACH] { ROW |STATEMENT}]
		EXECUTE PROCEDURE trigger_function

-- 행수준 trigger : FOR EACH ROW
-- statement 수준 trigger : FOR EACH STATEMENT