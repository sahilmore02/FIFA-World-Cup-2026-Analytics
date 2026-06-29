-- MOST GOALS
CREATE VIEW Most_Goals as
	select
		scored_by,
        scored_for,
        count(*) as Goals
        from goals
        where goal_type <> 'own goal'
        group by scored_by,scored_for
        order by Goals desc,scored_by,scored_for;
        

    
-- MOST ASSISTS
CREATE VIEW Most_Assists as
	select
		assist_by,
        scored_for,
        count(*) as Assists
        from goals
        where assist_by is not null
        group by assist_by,scored_for
        order by Assists desc,assist_by,scored_for;
        
        
        
-- MOST GA
CREATE VIEW Most_GA as
	select
		player_name as Player,
		team_name as Team,
		IFNULL(Goals,0) as Goals,
		IFNULL(Assists,0) as Assists,
		IFNULL(Goals,0)+IFNULL(Assists,0) as GA
		from players
		left join most_goals on players.player_name=most_goals.scored_by
		left join most_assists on players.player_name=most_assists.assist_by
		where IFNULL(Goals,0)+IFNULL(Assists,0) <> 0
		order by GA DESC,Goals DESC, Assists DESC, Player, Team;


-- MOST OWN GOALS
create view Most_OG as
select
	scored_by,
    count(*) as 'Own Goals'
    from goals
    where goal_type = 'Own Goal'
    group by scored_by;

-- MOST CLEANSHEETS
create view most_cleansheets as
	select
		team,
        count(*) as CS
        from big
        where
        (team = home and atg = 0) or
        (team = away and htg = 0)
        group by team
        order by CS desc,team;
 
 
 
-- MOST TEAM GOALS
create view most_teamgoals
as
select
	SCORED_FOR AS TEAM,
    count(*) as GOALS
    from GOALS
    group by TEAM
    order by
    GOALS desc;



-- MOST POTM
create view most_potm
as
select
	POTM as Player,
    count(*) as Awards
    from matches
    group by Player
    order by
    Awards desc;