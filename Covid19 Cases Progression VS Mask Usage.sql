-- Covid19 Cases Progression VS Mask Usage
SELECT c.countyfp, c.county, c.state, c.confirmed_cases, c.confirmed_deaths, m. never, m.rarely, m.sometimes, m.frequently, m.always
FROM county AS c
INNER JOIN mask AS m ON
m.countyfp=c.countyfp;