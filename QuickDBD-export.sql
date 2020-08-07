-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "county" (
    "countyfp" int   NOT NULL,
    "county" VARCHAR   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "confirmed_cases" INT   NOT NULL,
    "confirmed_deaths" INT   NOT NULL,
    CONSTRAINT "pk_county" PRIMARY KEY (
        "countyfp"
     )
);

CREATE TABLE "mask" (
    "countyfp" int   NOT NULL,
    "never" VARCHAR   NOT NULL,
    "rarely" VARCHAR   NOT NULL,
    "sometimes" VARCHAR   NOT NULL,
    "frequently" VARCHAR   NOT NULL,
    "always" VARCHAR   NOT NULL,
    CONSTRAINT "pk_mask" PRIMARY KEY (
        "countyfp"
     )
);

ALTER TABLE "mask" ADD CONSTRAINT "fk_mask_countyfp" FOREIGN KEY("countyfp")
REFERENCES "county" ("countyfp");

