-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Player (
    PlayerID varchar   NOT NULL,
    Name varchar   NOT NULL,
    CollegeID int   NOT NULL,
    Position varchar   NOT NULL,
    CONSTRAINT pk_Player PRIMARY KEY (
        PlayerID
     )
);

CREATE TABLE Player_Stats (
    PlayerID varchar   NOT NULL,
    First4AVG int   NOT NULL,
    Age int   NOT NULL,
    To_Year int   NOT NULL,
    AP1 int   NOT NULL,
    PB int   NOT NULL,
    St int   NOT NULL,
    Career_Avg int   NOT NULL,
    Dr_Avg int   NOT NULL,
    Games_Count int   NOT NULL,
    Completion int   NOT NULL,
    Pass_Att int   NOT NULL,
    Pass_Yds int   NOT NULL,
    Pass_TD int   NOT NULL,
    Pass_Int int   NOT NULL,
    Rush_Att int   NOT NULL,
    Rush_Yds int   NOT NULL,
    Rush_TDs int   NOT NULL,
    Rec int   NOT NULL,
    Rec_Yds int   NOT NULL,
    Rec_Tds int   NOT NULL,
    Tackle int   NOT NULL,
    Def_Int int   NOT NULL,
    Sk int   NOT NULL,
    CONSTRAINT pk_Player_Stats PRIMARY KEY (
        PlayerID
     )
);

CREATE TABLE College (
    CollegeID int   NOT NULL,
    College varchar   NOT NULL,
    CONSTRAINT pk_College PRIMARY KEY (
        CollegeID
     )
);

CREATE TABLE Draft (
    PlayerID varchar   NOT NULL,
    Year int   NOT NULL,
    Round int   NOT NULL,
    Pick int   NOT NULL,
    NFL_TeamID varchar   NOT NULL,
    CONSTRAINT pk_Draft PRIMARY KEY (
        PlayerID
     )
);


CREATE TABLE Combine_Data (
    PlayerID varchar   NOT NULL,
    Height int   NOT NULL,
    Weight int   NOT NULL,
    HandSize int   NOT NULL,
    Arm_Length int   NOT NULL,
    Wonderlic int   NOT NULL,
    forty_yard int   NOT NULL,
    Bench_Press int   NOT NULL,
    Vert_Leap int   NOT NULL,
    Broad_Jump int   NOT NULL,
    Shuttle int   NOT NULL,
    threeCone int   NOT NULL,
    sixty_Yd_Shuttle int   NOT NULL,
    CONSTRAINT pk_Combined_Data PRIMARY KEY (
        PlayerID
     )
);

ALTER TABLE Player_Stats ADD CONSTRAINT fk_Player_Stats_PlayerID FOREIGN KEY(PlayerID)
REFERENCES Player (PlayerID);

ALTER TABLE Draft ADD CONSTRAINT fk_Draft_PlayerID FOREIGN KEY(PlayerID)
REFERENCES Player (PlayerID);

ALTER TABLE Combine_Data ADD CONSTRAINT fk_Combine_Data_PlayerID FOREIGN KEY(PlayerID)
REFERENCES Player (PlayerID);

ALTER TABLE Player ADD CONSTRAINT fk_Player_CollegeID FOREIGN KEY(CollegeID)
REFERENCES College (CollegeID);

