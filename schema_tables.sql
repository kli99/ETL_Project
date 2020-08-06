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