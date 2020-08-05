-- Create Two Tables
CREATE TABLE county (
  COUNTYFP INT PRIMARY KEY,
  County VARCHAR,
  STATE VARCHAR,
  CONFIRMED_CASES INT,
  CONFIRMED_DEATHS INT
);

CREATE TABLE mask (
  COUNTYFP INT PRIMARY KEY,
  NEVER VARCHAR ,
  RARELY VARCHAR,
  SOMETIMES VARCHAR,
  FREQUENTLY VARCHAR,
  ALWAYS VARCHAR
);


-- Covid19 Cases Progression VS Mask Usage
SELECT c.countyfp, c.county, c.state, c.confirmed_cases, c.confirmed_deaths, m. never, m.rarely, m.sometimes, m.frequently, m.always
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp;