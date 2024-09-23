--CREATE SCHEMA IF NOT EXISTS race_schedule; 
DROP TABLE IF EXISTS race_schedule_race;
DROP TABLE IF EXISTS race_schedule_cycling_event;
DROP TABLE IF EXISTS race_schedule_bike;
DROP TABLE IF EXISTS race_schedule_wheelset;
DROP TABLE IF EXISTS race_schedule_sponsor;
DROP TABLE IF EXISTS race_schedule_social_media_tag;
DROP TABLE IF EXISTS race_schedule_rider;

CREATE TABLE race_schedule_cycling_event (
	cycling_event_id serial PRIMARY KEY,
	year integer NOT NULL,
	event_name VARCHAR(200) NOT NULL,
	address VARCHAR(100),
	city VARCHAR(100) NOT NULL,
	state VARCHAR(2) NOT NULL,
	start_date date NOT NULL,
	end_date date,
	event_url VARCHAR(250),
	registration_url VARCHAR(250),
	photos_url VARCHAR(250),
	notes text,
	UNIQUE (year, event_name)
);

CREATE TABLE race_schedule_rider (
	rider_id serial PRIMARY KEY,
	rider_name VARCHAR(250) UNIQUE NOT NULL,
	facebook_handle VARCHAR(200),
	instagram_handle VARCHAR(200),
	twitter_handle VARCHAR(200),
	strava_handle VARCHAR(200),
	notes text
);

CREATE TABLE race_schedule_bike (
	bike_id serial PRIMARY KEY,
	rider_id integer REFERENCES race_schedule_rider NOT NULL,
	make VARCHAR(250) NOT NULL,
	model VARCHAR(250) NOT NULL,
	retired VARCHAR(1) NOT NULL DEFAULT 'N' check (retired in ('Y', 'N')),
	notes text,
	UNIQUE (rider_id, make, model)
);

CREATE TABLE race_schedule_wheelset (
	wheelset_id serial PRIMARY KEY,
	rider_id integer REFERENCES race_schedule_rider NOT NULL,
	make VARCHAR(250) NOT NULL,
	model VARCHAR(250) NOT NULL,
	size  VARCHAR(100),
	retired VARCHAR(1) NOT NULL DEFAULT 'N' check (retired in ('Y', 'N')),
	notes text,
	UNIQUE (rider_id, make, model)
);

CREATE TABLE race_schedule_sponsor (
	sponsor_id serial PRIMARY KEY,
	rider_id integer REFERENCES race_schedule_rider NOT NULL,
	sponsor_name VARCHAR(250) NOT NULL,
	url VARCHAR(250) NOT NULL,
	facebook_handle VARCHAR(200),
	instagram_handle VARCHAR(200),
	twitter_handle VARCHAR(200),
	notes text,
	UNIQUE (rider_id, sponsor_name)
);

CREATE TABLE race_schedule_social_media_tag (
	tag_id serial PRIMARY KEY,
	rider_id integer REFERENCES race_schedule_rider NOT NULL,
	tag VARCHAR(250) NOT NULL,
	UNIQUE (rider_id, tag)
);

CREATE TABLE race_schedule_race (
	race_id SERIAL PRIMARY KEY,
	cycling_event_id integer REFERENCES race_schedule_cycling_event NOT NULL,
	rider_id integer REFERENCES race_schedule_rider NOT NULL,
	race_date date,
	race_start_time time,
	distance integer NOT NULL,
	distance_units VARCHAR(2) NOT NULL check (distance_units in ('mi', 'km')),
	terrain_type VARCHAR(20) check (terrain_type in ('gravel', 'road', 'mountain', 'criterium', 'other')),
	route_url VARCHAR(250),
	cost float(2),
	is_elite VARCHAR(1) NOT NULL DEFAULT 'N' check (is_elite in ('Y', 'N')),
	bike_id integer REFERENCES race_schedule_bike,
	wheelset_id integer REFERENCES race_schedule_wheelset,
	results_url VARCHAR(250),
	total_time time,
	total_elevation_gain_feet integer,
	average_speed float(1),
	average_power integer,
	normalized_power integer,
	category_desc VARCHAR(250),
	category_result_position integer,
	age_group_position integer,
	overall_female_male_position integer,
	overall_result_position integer,
	overall_multiday_result_position integer,
	payout integer,
	primary_race_photo_url VARCHAR(500),
	social_media_post text,
	prize text,
	notes text
);
