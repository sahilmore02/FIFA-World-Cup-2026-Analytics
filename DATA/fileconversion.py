import mysql.connector
import pandas as pd

#CONNECTING MYSQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="*******",
    database="wc2026"
)

#TEAMS
TEAMS = pd.read_sql("SELECT * FROM teams", connection)
TEAMS.to_csv("teams.csv", index=False)

#PLAYERS
PLAYERS = pd.read_sql("SELECT * FROM players", connection)
PLAYERS.to_csv("players.csv", index=False)

#VENUES
VENUES = pd.read_sql("SELECT * FROM venues", connection)
VENUES.to_csv("venues.csv", index=False)

#MATCHES
MATCHES = pd.read_sql("SELECT * FROM matches", connection)
MATCHES.to_csv("matches.csv", index=False)

#GOALS
GOALS = pd.read_sql("SELECT * FROM goals", connection)
GOALS.to_csv("goals.csv", index=False)

#MATCH STATS
MATCH_STATS = pd.read_sql("SELECT * FROM match_stats", connection)
MATCH_STATS.to_csv("match_stats.csv", index=False)

#TEAM STATS
TEAM_STATS = pd.read_sql("SELECT * FROM teamstats", connection)
TEAM_STATS.to_csv("teamstats.csv", index=False)

#ATTACK STATS - MATCH WISE
ATTACK_STATS = pd.read_sql("SELECT * FROM attack_stats", connection)
ATTACK_STATS.to_csv("attack_stats.csv", index=False)

#DEFENCE STATS - MATCH WISE
DEFENCE_STATS = pd.read_sql("SELECT * FROM defencestats", connection)
DEFENCE_STATS.to_csv("defencestats.csv", index=False)

#PLAYERS STATS
PLAYER_STATS = pd.read_sql("SELECT * FROM playersstats", connection)
PLAYER_STATS.to_csv("playersstats.csv", index=False)

connection.close()

print("All tables exported successfully.")
