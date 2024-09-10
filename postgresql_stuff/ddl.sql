--CREATE SCHEMA IF NOT EXISTS race_schedule; 
DROP TABLE IF EXISTS race_schedule_race;
DROP TABLE IF EXISTS race_schedule_cycling_event;
DROP TABLE IF EXISTS race_schedule_bike;
DROP TABLE IF EXISTS race_schedule_wheelset;
DROP TABLE IF EXISTS race_schedule_rider;

CREATE TABLE race_schedule_cycling_event (
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
	notes text,
	UNIQUE (year, event_name)
);

CREATE TABLE race_schedule_rider (
	rider_id serial PRIMARY KEY,
	rider_name text UNIQUE NOT NULL
);

CREATE TABLE race_schedule_bike (
	bike_id serial PRIMARY KEY,
	rider_id integer REFERENCES race_schedule_rider NOT NULL,
	make text UNIQUE NOT NULL,
	model text UNIQUE NOT NULL,
	retired text NOT NULL DEFAULT 'N' check (retired in ('Y', 'N'))
);

CREATE TABLE race_schedule_wheelset (
	wheelset_id serial PRIMARY KEY,
	rider_id integer REFERENCES race_schedule_rider NOT NULL,
	model text UNIQUE NOT NULL,
	retired text NOT NULL DEFAULT 'N' check (retired in ('Y', 'N'))
);

CREATE TABLE race_schedule_race (
	race_id SERIAL PRIMARY KEY,
	cycling_event_id integer REFERENCES race_schedule_cycling_event NOT NULL,
	rider_id integer REFERENCES race_schedule_rider NOT NULL,
	race_date date,
	race_start_time time,
	distance integer NOT NULL,
	distance_units text NOT NULL check (distance_units in ('mi', 'km')),
	terrain_type text check (terrain_type in ('gravel', 'road', 'mountain', 'criterium', 'other')),
	route_url text,
	cost float(2),
	is_elite text NOT NULL DEFAULT 'N' check (is_elite in ('Y', 'N')),
	bike_id integer REFERENCES race_schedule_bike,
	wheelset_id integer REFERENCES race_schedule_wheelset,
	results_url text,
	total_time time,
	total_elevation_gain_feet int,
	average_speed float(1),
	average_power int,
	normalized_power int,
	category_desc text,
	category_result_position integer,
	age_group_position integer,
	overall_female_male_position integer,
	overall_result_position integer,
	overall_multiday_result_position integer,
	payout integer,
	prize text,
	notes text
);
