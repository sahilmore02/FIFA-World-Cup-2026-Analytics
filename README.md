# FIFA World Cup 2026 Analytics Dashboard

> An end-to-end football analytics project that recreates the FIFA World Cup 2026 using **MySQL**, **SQL**, **Python**, and **Power BI**. From raw match statistics to an interactive analytics platform, this project demonstrates the complete data analytics lifecycle.

---

## Project Overview

The **FIFA World Cup 2026 Analytics Dashboard** is a comprehensive sports analytics project developed to analyze every stage of the FIFA World Cup 2026 through data.

Unlike traditional dashboard projects that rely on pre-built datasets, this project was built from the ground up. Every team, player, venue, match, goal, disciplinary event, and statistical record is stored inside a custom-designed relational database before being transformed into meaningful insights using SQL and visualized through Power BI.

The dashboard is continuously updated as the tournament progresses, making it a living analytics platform rather than a static academic project.

The primary objective was not simply to create attractive dashboards, but to build an end-to-end analytics solution covering database design, data engineering, SQL development, Python automation, and interactive visualization.

---

# Project Objectives

This project was designed to demonstrate the complete workflow of a modern data analytics project.

The objectives include:

- Designing a normalized MySQL database for tournament data
- Structuring football event data into relational tables
- Automating tournament statistics using SQL
- Implementing official FIFA group-stage standings
- Creating interactive Power BI dashboards
- Demonstrating practical SQL, DAX and Python skills
- Building a continuously updated analytics platform

---

# Dashboard Preview

## Tournament Overview

*(Insert Tournament Overview screenshot here)*

The Tournament Overview page provides a high-level summary of the competition.

Key features include:

- Tournament KPIs
- Goals scored
- Goal timing distribution
- Goal type distribution
- Yellow & Red cards
- Countries represented
- Venues used
- Top goal scorers
- Tournament progression

This page acts as the landing page for the entire dashboard.

---

## Team Analysis

*(Insert Team Analysis screenshot here)*

The Team Analysis dashboard enables detailed comparison between all participating teams.

Users can analyze:

- Goals Scored
- Goals Conceded
- Expected Goals (xG)
- Possession
- Passing Accuracy
- Shots
- Shots on Target
- Shot Efficiency
- Big Chances Created
- Big Chances Missed
- Fouls
- Corners
- Clean Sheets

Interactive filters allow users to compare teams across different performance metrics.

---

## Player Analysis

*(Insert Player Analysis screenshot here)*

The Player Analysis page focuses on individual player performance throughout the tournament.

Metrics include:

- Goals
- Assists
- Goal Contributions
- Expected Goals (xG)
- Chances Created
- Successful Dribbles
- Tackles
- Recoveries
- Goalkeeper Saves
- Minutes Played
- Player Rankings

The dashboard combines both attacking and defensive metrics to provide a complete view of player performance.

---

## Match Analysis

*(Insert Match Analysis screenshot here)*

Each match contains a complete statistical breakdown.

Users can explore:

- Match Statistics
- Possession Comparison
- Expected Goals Comparison
- Passing Statistics
- Goal Timeline
- Cards Timeline
- Player Statistics
- Player of the Match

This page allows detailed post-match tactical analysis.

---

## Group Stage Dashboard

*(Insert Group Stage screenshot here)*

The Group Stage page automatically generates tournament standings using official FIFA World Cup rules.

Standings update dynamically after every completed match and include:

- Matches Played
- Wins
- Draws
- Losses
- Goals For
- Goals Against
- Goal Difference
- Points

Official FIFA tie-break rules have been implemented using SQL to ensure standings remain accurate throughout the tournament.

---

# Project Architecture

```text
                  Raw Match Statistics (FotMob)
                               │
                               ▼
                   Data Cleaning & Validation
                               │
                               ▼
                AI-assisted SQL Data Generation
                               │
                               ▼
                 Manual Verification & Validation
                               │
                               ▼
                   MySQL Relational Database
                               │
                               ▼
               SQL Views & Statistical Aggregation
                               │
                               ▼
             Python (Pandas + MySQL Connector)
                               │
                               ▼
                    CSV Export for Power BI
                               │
                               ▼
               Interactive Power BI Dashboard
```

---

# Database Design

One of the main objectives of this project was to build a properly normalized relational database rather than relying on a flat spreadsheet.

The database currently consists of the following tables:

| Table | Purpose |
|--------|---------|
| Teams | Stores information about participating nations |
| Players | Stores player information |
| Venues | Tournament stadiums |
| Matches | Match schedule and results |
| Goals | Every goal scored during the tournament |
| Yellow Cards | Yellow card events |
| Red Cards | Red card events |
| Match Stats | Team-level statistics for every match |
| Attack Stats | Individual attacking statistics |
| Defence Stats | Individual defensive statistics |
| Team Stats | Aggregated team statistics |
| Player Stats | Aggregated player statistics |

Primary keys and foreign keys were used throughout the database to ensure data consistency while reducing redundancy.

The relational design allows the dashboard to perform complex analytical queries efficiently.

---

# Data Engineering Workflow

Unlike many Power BI projects that import ready-made datasets, this project creates the analytical dataset from raw football statistics.

The workflow includes:

1. Collecting raw match statistics from FotMob.
2. Cleaning and validating player and team names.
3. Mapping statistics to a normalized MySQL database.
4. Generating SQL INSERT statements using predefined AI-assisted prompts.
5. Manually validating generated records.
6. Creating SQL Views to automate player, team and tournament statistics.
7. Exporting processed tables using Python (Pandas + MySQL Connector).
8. Importing the final datasets into Power BI.

This workflow significantly reduces repetitive manual work while maintaining data quality and consistency.

---

# SQL Implementation

SQL forms the backbone of this project. Instead of performing calculations directly in Power BI, the majority of the business logic is handled within MySQL.

The database contains custom SQL scripts that automate tournament analytics and eliminate repetitive calculations inside Power BI.

Major SQL implementations include:

- Dynamic FIFA Group Stage Standings
- Team Statistics Aggregation
- Player Statistics Aggregation
- Goal Contribution Calculation
- Team Rankings
- Match Statistics
- Attack Statistics
- Defence Statistics
- Card Statistics
- Player Performance Metrics

By pushing analytical calculations to the database layer, the Power BI model remains lightweight and easier to maintain.

---

# Power BI Implementation

Power BI serves as the visualization layer of the project.

The dashboard was designed to allow users to explore tournament data interactively using slicers, filters, drill-through pages, and custom DAX measures.

Features implemented include:

- Interactive filtering
- Cross-highlighting
- Dynamic rankings
- Conditional formatting
- KPI Cards
- Custom DAX Measures
- Drill-through pages
- Dynamic titles
- Tooltips
- Bookmark Navigation

The dashboard allows users to move seamlessly between tournament-level insights and individual player performance.

---

# Data Analysis Methodology

The dashboard focuses on answering practical football analytics questions rather than simply displaying statistics.

Examples include:

### Team Performance

Which teams:

- scored the most goals?
- created the highest Expected Goals (xG)?
- converted chances most efficiently?
- dominated possession?
- defended most effectively?
- accumulated the most disciplinary cards?

---

### Player Performance

Which players:

- lead the Golden Boot race?
- created the most chances?
- generated the highest xG?
- completed the most successful dribbles?
- contributed the most tackles and recoveries?
- produced the strongest overall performances?

---

### Match Analysis

Each fixture is analysed individually using:

- Possession
- Passing Accuracy
- xG
- Shot Distribution
- Goal Timeline
- Cards Timeline
- Player Statistics
- Player of the Match

This enables detailed tactical analysis beyond the final scoreline.

---

# Why This Project Is Different

Most football dashboards available online rely on already prepared datasets.

This project follows an entirely different approach.

Instead of importing a finished dataset, the entire analytical pipeline was built manually.

The workflow includes:

Raw Statistics

↓

Database Design

↓

SQL Development

↓

Data Validation

↓

Data Engineering

↓

Power BI Visualization

This demonstrates practical experience across multiple areas of data analytics rather than dashboard development alone.

---

# Repository Structure

```text
FIFA-World-Cup-2026-Analytics/
│
├── dashboard/
│   └── FIFA_World_Cup_2026.pbix
│
├── data/
│   ├── teams.csv
│   ├── players.csv
│   ├── venues.csv
│   ├── matches.csv
│   ├── goals.csv
│   ├── yellowcards.csv
│   ├── redcards.csv
│   ├── attack_stats.csv
│   ├── defence_stats.csv
│   ├── match_stats.csv
│   ├── team_stats.csv
│   └── player_stats.csv
│
├── database/
│   ├── schema/
│   ├── views/
│   ├── procedures/
│   ├── triggers/
│   └── export/
│
├── images/
│
├── README.md
├── ANALYSIS.md
└── LICENSE
```

---

# Repository Contents

### dashboard/

Contains the complete Power BI dashboard used for visualization.

---

### data/

Contains CSV exports from the MySQL database used within Power BI.

---

### database/

Contains SQL scripts used throughout the project.

These include:

- Table creation scripts
- SQL Views
- Standings Logic
- Statistical Aggregations
- Export Scripts

---

### images/

Contains screenshots used throughout the project documentation.

---

# Technologies Used

| Technology | Purpose |
|------------|---------|
| MySQL | Relational Database |
| SQL | Data Modelling & Analytics |
| Python | Data Processing |
| Pandas | CSV Export |
| MySQL Connector | Database Connectivity |
| Power BI | Dashboard Development |
| DAX | Analytical Measures |
| Git | Version Control |
| GitHub | Project Hosting |

---

# Current Project Status

Current implementation includes:

- Complete Group Stage
- Dynamic FIFA Standings
- Tournament Dashboard
- Team Dashboard
- Player Dashboard
- Match Dashboard
- Automated SQL Analytics
- Relational Database
- Python Export Pipeline

The repository will continue to evolve as the FIFA World Cup progresses through the knockout stages.

---

# Future Roadmap

Planned additions include:

- Round of 32 Analysis
- Round of 16 Dashboard
- Quarter-final Dashboard
- Semi-final Dashboard
- Final Dashboard
- Tournament Bracket
- Passing Networks
- Expected Points (xPts)
- Player Radar Charts
- Team Comparison Reports
- Predictive Analytics

---

# Data Source

Match events and player statistics were sourced from **FotMob**.

Raw match statistics were transformed into structured relational data using predefined AI-assisted prompts, followed by manual validation before being stored in the MySQL database.

The objective was to automate repetitive data entry while maintaining consistency and accuracy throughout the project.

---

# About the Author

Developed by **Sahil More**

MCA Student | Data Analyst | SQL | Python | Power BI

This project reflects my interest in combining sports with data analytics by designing complete analytical systems rather than simply building dashboards.

---

# License

This project is licensed under the MIT License.

---

# Acknowledgements

Special thanks to:

- FIFA World Cup 2026
- FotMob
- Microsoft Power BI
- MySQL
- Python
- The open-source community for providing the tools that made this project possible.

---

## Live Project Progress

This repository is actively maintained throughout the FIFA World Cup 2026.

As new matches are played, the database, dashboards, and analyses are updated to reflect the latest tournament statistics.

For detailed analytical insights from the tournament, including player performances, team trends, and statistical observations, refer to **ANALYSIS.md**.
