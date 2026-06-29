-- INVALID MATCH
delimiter //
create trigger invalidMATCH
before insert on matches for each row
begin
if new.home_team = new.away_team
then signal sqlstate '12000'
set message_text = "A TEAM CAN'T PLAY THEMSELVES";
end if;
end;
//
delimiter ;



-- INVALID GOAL
delimiter //
create trigger invalidgoal
before insert on goals for each row
begin
if new.minute < 1
then signal sqlstate '11000'
set message_text = "INVALID GOAL MINUTE. Goal Minute can't be less than 1(one)";
end if;
end;
//
delimiter ;



-- PENALTY ASSIST
delimiter +
create trigger penalty
before insert on goals for each row
begin
if new.goal_type = 'Penalty'
and new.assist_by is not null
then signal sqlstate '11600'
set message_text = "Penalties can't be assisted";
end if;
end;
+
delimiter ;



-- SELFASSIST
delimiter //
create trigger assist
before insert on goals for each row
begin
if new.scored_by = new.assist_by
then signal sqlstate '11500'
set message_text = "One can't assist himself";
end if;
end;
//
delimiter ;