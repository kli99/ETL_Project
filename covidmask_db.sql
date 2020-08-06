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

---- Covid19 Cases Progression VS Mask Usage
-- Join two tables on county FIPS
SELECT c.countyfp, c.county, c.state, c.confirmed_cases, c.confirmed_deaths, 
m. never, m.rarely, m.sometimes, m.frequently, m.always
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp;

-- Comparing confirmed cases with mask usage 
SELECT c.countyfp, c.county, c.state, c.confirmed_cases, m.always, m.never
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
ORDER BY c.confirmed_cases DESC; 

-- Comparing confirmed deaths with mask usage 
SELECT c.countyfp, c.county, c.state, c.confirmed_deaths, m.always, m.never
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
ORDER BY c.confirmed_deaths DESC;

-- Finding which NY county has the most confirmed cases
SELECT c.countyfp, c.county, c.state, c.confirmed_cases, m.always, m.never
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
WHERE c.state = 'New York'
ORDER BY c.confirmed_cases DESC;

-- Finding which NY county has the most confirmed deaths
SELECT c.countyfp, c.county, c.state, c.confirmed_deaths, m.always, m.never
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
WHERE c.state = 'New York'
ORDER BY c.confirmed_deaths DESC;

-- Finding the state with the most confirmed cases
SELECT c.state, sum(confirmed_cases) AS confirmed_cases
FROM county AS c
GROUP BY c.state
ORDER BY confirmed_cases DESC;

-- Finding the state with the most confirmed deaths
SELECT c.state, sum(confirmed_deaths) AS confirmed_deaths
FROM county AS c
GROUP BY c.state
ORDER BY confirmed_deaths DESC;

-- Finding which county said 'Always' wore their masks the most
SELECT c.countyfp, c.county, c.state, m.always
FROM COUNTY AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
ORDER BY m.always DESC;

-- Finding which county said 'Frequently' wore their masks the most
SELECT c.countyfp, c.county, c.state, m.frequently
FROM COUNTY AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
ORDER BY m.frequently DESC;

-- Finding which county said 'Sometimes' wore their masks the most
SELECT c.countyfp, c.county, c.state, m.sometimes
FROM COUNTY AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
ORDER BY m.sometimes DESC;

-- Finding which county said 'Rarely' wore their masks the most
SELECT c.countyfp, c.county, c.state, m.rarely
FROM COUNTY AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
ORDER BY m.rarely DESC;

-- Finding which county said 'Never' wore their masks the most
SELECT c.countyfp, c.county, c.state, m.never
FROM COUNTY AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp
ORDER BY m.never DESC;

-- Finding which state on average said the most that they 'Always' wore their masks
SELECT c.state, ROUND(AVG(CAST(left(m.always, 4) AS decimal)), 2) AS alw
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp = c.countyfp
GROUP BY c.state
ORDER BY alw DESC;

-- Finding which state on average said the most that they 'Frequently' wore their masks
SELECT c.state, ROUND(AVG(CAST(left(m.frequently, 4) AS decimal)), 2) AS frequently
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp = c.countyfp
GROUP BY c.state
ORDER BY frequently DESC;

-- Finding which state on average said the most that they 'Sometimes' wore their masks
SELECT c.state, ROUND(AVG(CAST(left(m.sometimes, 4) AS decimal)), 2) AS sometimes
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp = c.countyfp
GROUP BY c.state
ORDER BY sometimes DESC;

-- Finding which state on average said the most that they 'Rarley' wore their masks
SELECT c.state, ROUND(AVG(CAST(left(m.rarely, 4) AS decimal)), 2) AS rarely
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp = c.countyfp
GROUP BY c.state
ORDER BY rarely DESC;

-- Finding which state on average said the most that they 'Never' wore their masks
SELECT c.state, ROUND(AVG(CAST(left(m.never, 4) AS decimal)), 2) AS never
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp = c.countyfp
GROUP BY c.state
ORDER BY never DESC;
