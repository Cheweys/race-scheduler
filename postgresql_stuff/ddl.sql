CREATE SCHEMA IF NOT EXISTS race_schedule; 
DROP TABLE IF EXISTS race_schedule.race;
DROP TABLE IF EXISTS race_schedule.cycling_event;
DROP TABLE IF EXISTS race_schedule.bike;
DROP TABLE IF EXISTS race_schedule.wheelset;
DROP TABLE IF EXISTS race_schedule.rider;

CREATE TABLE race_schedule.cycling_event (
	cycling_event_id serial PRIMARY KEY,
	year integer NOT NULL,
	event_name TEXT NOT NULL,
	address TEXT,
	city TEXT NOT NULL,
	state TEXT NOT NULL,
	start_date date NOT NULL,
	end_date date,
	event_url text,
	registration_url text,
	results_url text,
	notes text,
	UNIQUE (year, event_name)
);

CREATE TABLE race_schedule.rider (
	rider_id serial PRIMARY KEY,
	rider_name text UNIQUE NOT NULL
);

CREATE TABLE race_schedule.bike (
	bike_id serial PRIMARY KEY,
	rider_id integer REFERENCES race_schedule.rider NOT NULL,
	make text UNIQUE NOT NULL,
	model text UNIQUE NOT NULL,
	retired text NOT NULL DEFAULT 'N' check (retired in ('Y', 'N'))
);

CREATE TABLE race_schedule.wheelset (
	wheelset_id serial PRIMARY KEY,
	rider_id integer REFERENCES race_schedule.rider NOT NULL,
	model text UNIQUE NOT NULL,
	retired text NOT NULL DEFAULT 'N' check (retired in ('Y', 'N'))
);

CREATE TABLE race_schedule.race (
	race_id SERIAL PRIMARY KEY,
	cycling_event_id integer REFERENCES race_schedule.cycling_event NOT NULL,
	rider_id integer REFERENCES race_schedule.rider NOT NULL,
	race_date date,
	race_start_time time,
	distance integer NOT NULL,
	distance_units text NOT NULL check (distance_units in ('mi', 'km')),
	route_url text,
	cost float(2),
	is_elite text NOT NULL DEFAULT 'N' check (is_elite in ('Y', 'N')),
	bike_id integer REFERENCES race_schedule.bike,
	wheelset_id integer REFERENCES race_schedule.wheelset,
	is_male_female_category text NOT NULL DEFAULT 'F' check (is_male_female_category in ('F', 'M')),
	is_age_group_category text NOT NULL DEFAULT 'N' check (is_age_group_category in ('Y', 'N')),
	age_group_category_desc text,
	category_result_position integer,
	overall_result_position integer,
	payout integer,
	notes text
);
