-- MATCH STATS
create table match_stats(
	match_no INT,
    team varchar(50),
    possession int,
    xg decimal(4,2),
    shots int,
    on_target int,
    BCM int,
    yellow_c int,
    red_c int,
    fouls int,
    foreign key (match_no) references matches(match_no)
    );

alter table match_stats add foreign key (team) references teams(team_name);
alter table match_stats
add constraint
unique(match_no,team);


-- TEAM STATS
CREATE VIEW TEAMSTATS AS
select
	match_stats.TEAM as TEAM,
    COUNT(match_no) as MATCHES,
    ifnull(most_teamgoals.GOALS,0) AS GOALS,
    ROUND(avg(possession),0) as AVG_POS,
    sum(xG) as xG,
    sum(shots) as SHOTS,
    SUM(ON_TARGET) AS ON_TARGET,
    SUM(BCM) AS BCM,
    SUM(YELLOW_C) AS YELLOW_C,
    SUM(RED_C) AS RED_C,
    SUM(FOULS) AS FOULS
    from match_stats LEFT JOIN most_teamgoals ON match_stats.team = most_teamgoals.team
    group by match_stats.TEAM, most_teamgoals.GOALS;
    
    
-- INDIVIDUAL ATTACK STATS
create table attack_stats(
	player_name varchar(100),
	match_no INT,
    goals int,
    assists int,
    xg decimal(4,2),
    shots int,
    on_target int,
    BCM int,
    dribbles int,
    Chances_Created int,
    passes_final3rd int,
    foreign key (match_no) references matches(match_no),
	foreign key (player_name) references players(player_name)
    );



alter table attack_stats add column team_name varchar(100) after player_name;
alter table attack_stats add foreign key (team_name) references teams(team_name);
alter table attack_stats add primary key(player_name,match_no);

  
-- INDIVIDUAL DEFENCE STATS
create table defencestats(
	player_name varchar(100),
	match_no INT,
    tackles int,
    interceptions int,
    clearances int,
    blocks int,
    recoveries int,
    dribble_past int,
    gk_saves int,
    foreign key (match_no) references matches(match_no),
	foreign key (player_name) references players(player_name)
    );
    
alter table defencestats add column team_name varchar(100) after player_name;
alter table defencestats add foreign key (team_name) references teams(team_name);
alter table defencestats add primary key(player_name,match_no);



-- PLAYER STATS
create view PLAYERSSTATS as
select
	attack_stats.player_name as PLAYER,
    playing_role as POSITION,
    attack_stats.team_name as TEAM,
    sum(GOALS) as GOALS,
    sum(ASSISTS) as ASSISTS,
    sum(xG) as xG,
    sum(BCM) AS BCM,
    sum(DRIBBLES) AS DRIBBLES,
    sum(CHANCES_CREATED) AS CHANCES_CREATED,
    sum(TACKLES) as TACKLES,
    sum(RECOVERIES) AS RECOVERIES,
    sum(gk_saves) as SAVES
    from attack_stats
    join defencestats on
    attack_stats.player_name = defencestats.player_name
    and
    attack_stats.match_no = defencestats.match_no
	join players
    on
    attack_stats.player_name = players.player_name
    group by player,TEAM,position
    ;