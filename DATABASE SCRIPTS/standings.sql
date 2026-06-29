-- STANDINGS
CREATE VIEW big as
	select
		team_name as Team,
		match_no,
        match_type,
		group_name as Grp,
        home_team AS Home,
        htg,
        atg,
        away_team as Away,
        Winner,
        POTM,
        Stadium,
        City,
        Referee,
        Result_in
        from teams
        join matches on teams.team_name=matches.home_team or
        teams.team_name=matches.away_team;      


CREATE VIEW FAIR_PLAY_DEDUCTION AS
select y.team, YC_FPS,RC_FPS from
(select teams.team_name as team, ifnull(sum(fps),0) as YC_FPS
from teams left join yellowcards on teams.team_name = yellowcards.team_name
group by team) as y
join
(select teams.team_name as team, ifnull(sum(fps),0) as RC_FPS
from teams left join redcards on teams.team_name = redcards.team_name
group by team) as r on y.team = r.team;


CREATE VIEW STANDINGS_GRPA AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'A'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPB AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'B'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPC AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'C'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPD AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'D'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPE AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'E'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPF AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'F'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPG AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'G'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPH AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'H'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPI AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'I'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPJ AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'J'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPK AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'K'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_GRPL AS
select
rank() over(
order by
count(case when winner = big.Team then 1 end)*3 + count(case when winner = 'draw' then 1 end)*1 DESC,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) - (ifnull(sum(case when home = big.Team then atg end),0) + ifnull(sum(case when away = big.Team then htg end),0)) desc,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) desc,
RC_FPS + YC_FPS desc,big.Team) as '#',
Grp as Grp,
big.Team as TEAM,
count(*) as M,
count(case when winner = big.Team then 1 end) as W,
count(case when winner = 'draw' then 1 end) as D,
count(case when winner <> big.Team and Winner <> 'draw' then 1 end) as L,
(ifnull(sum(case when home = big.Team then htg end),0) + ifnull(sum(case when away = big.Team then atg end),0)) as GF,
(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GA,
(ifnull(sum(case when home = big.Team then htg end),0) +ifnull(sum(case when away = big.Team then atg end),0))-(ifnull(sum(case when home = big.Team then atg end),0) +ifnull(sum(case when away = big.Team then htg end),0)) as GD,
count(case when winner = big.Team then 1 end)*3 +
count(case when winner = 'draw' then 1 end)*1 as PTS,
RC_FPS + YC_FPS AS FPS
from big
join fair_play_deduction
on big.team = fair_play_deduction.team
group by big.Team, Grp
having Grp = 'L'
order by
PTS desc,
GD desc,
GF desc,
FPS desc,
TEAM;

CREATE VIEW STANDINGS_3RDRANKED AS
SELECT 
row_number() over(order by pts desc,gd desc,gf desc, fps desc, TEAM) as '#',
Grp,TEAM,M,W,D,L,GF,GA,GD,PTS,FPS FROM
(
SELECT * FROM Standings_GrpA
union all
SELECT * from Standings_GrpB
union all
SELECT * FROM Standings_GrpC
union all
SELECT * from Standings_GrpD
union all
SELECT * from Standings_GrpE
union all
SELECT * FROM Standings_GrpF
union all
SELECT * from Standings_GrpG
union all
SELECT * from Standings_GrpH
union all
SELECT * FROM Standings_GrpI
union all
SELECT * from Standings_GrpJ
union all
SELECT * from Standings_GrpK
union all
SELECT * FROM Standings_GrpL
)
as Whole
WHERE `#` = 3
ORDER BY
pts desc,
gd desc,
gf desc,
FPS desc,
TEAM
;