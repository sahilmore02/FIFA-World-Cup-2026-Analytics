create database WC2026;
create database dryrunwc2026;
use dryrunwc2026;
use WC2026;



-- TEAMS
create table teams (
	team_id int unique,
    team_name varchar(100) unique,
    manager varchar(150) unique)
    ;



-- PLAYERS
create table players(
	player_id int unique,
    player_name varchar(100) unique ,
    player_age int not null,
    playing_role varchar(20),
    team_name varchar(100),
    foreign key (team_name) references teams(team_name));
   
   

-- VENUES  
create table venues(
	stadium_id int primary key,
    stadium_name varchar(100) unique,
    city varchar(100),
    country varchar(100));
    

    
-- MATCHES
create table matches(
	match_no int primary key,
    Group_name varchar(1),
    home_team varchar(100),
    HTG int,
    ATG int,
    away_team varchar(100),
    winner varchar(100),
    potm varchar(100),
    stadium varchar(150),
    city varchar(100),
    referee varchar(100),
    foreign key (home_team) references teams(team_name),
    foreign key (away_team) references teams(team_name),
    foreign key (potm) references players(player_name));
    
alter table matches add column result_in varchar(50);
alter table matches add foreign key (stadium) references venues(stadium_name);
alter table matches add column match_type varchar(50) after match_no;
alter table matches modify column Group_name varchar(10);
select * from matches;



-- GOALS
create table goals(
	goal_no int primary key,
    scored_for varchar(150),
    scored_by varchar(150),
    minute int,
    half varchar(6),
    assist_by varchar(150),
    goal_type varchar(25),
    scored_ag varchar(150),
    match_no int,
    foreign key (scored_for) references teams(team_name),
    foreign key (scored_ag) references teams(team_name),
    foreign key (scored_by) references players(player_name),
    foreign key (assist_by) references players(player_name),
    foreign key (match_no) references matches(match_no)
    );
 
 
 
-- YELLOW AND RED CARDS
create table yellowcards(
yc_id int primary key,
player_name varchar(100),
team_name varchar(50),
against varchar(50),
foreign key (player_name) references players(player_name),
foreign key (team_name) references teams(team_name),
foreign key (against) references teams(team_name)
);

alter table yellowcards add column fps int generated always as (-1);

create table redcards(
rc_id int primary key,
player_name varchar(100),
team_name varchar(50),
against varchar(50),
foreign key (player_name) references players(player_name),
foreign key (team_name) references teams(team_name),
foreign key (against) references teams(team_name)
);

alter table redcards add column card_type varchar(20) after player_name;
alter table redcards
add column fps int generated always as (case when card_type = 'Direct Red' then -4 else -3 end);