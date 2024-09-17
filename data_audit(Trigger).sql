-- create function syntax
CREATE FUNCTION fn_players_name_changes_log()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
BEGIN
	-- trigger logic
	IF NEW.name <> OLD.name THEN
		INSERT INTO players_audits
		(
			player_id,
			name,
			edit_date

		)
		VALUES
		(
			OLD.player_id,
			OLD.name,
			NOW()

		);


	END IF;

	RETURN NEW;
END;
$$

-- update 될때마다 변경사항 저장
CREATE TRIGGER trg_player_name_changes
	BEFORE UPDATE
	ON players
	FOR EACH ROW
	EXECUTE PROCEDURE fn_players_name_changes_log();