INSERT INTO race_schedule_rider ( rider_name, notes )
    VALUES ('Morgan Chaffin', 'badass');

INSERT INTO race_schedule_rider ( rider_name, notes )
    VALUES ('Patrick Schoening', 'not an athlete lol');

INSERT INTO 
    race_schedule_bike
    (
        rider_id, make, model, notes
    )
SELECT 
   r.rider_id,
   'Alchemy',
   'Lycos',
   'Name is Aurora. Black gravel bike.'
FROM
    race_schedule_rider r
WHERE
    r.rider_name = 'Morgan Chaffin';

INSERT INTO 
    race_schedule_bike
    (
        rider_id, make, model, notes
    )
SELECT 
   r.rider_id,
   'Specialized',
   'Tarmac SL7',
   'White road bike.'
FROM
    race_schedule_rider r
WHERE
    r.rider_name = 'Morgan Chaffin';

INSERT INTO 
    race_schedule_bike
    (
        rider_id, make, model, notes
    )
SELECT 
   r.rider_id,
   'Bearclaw',
   'Towmac',
   'Ti drop bar fat bike.'
FROM
    race_schedule_rider r
WHERE
    r.rider_name = 'Patrick Schoening';

INSERT INTO
    race_schedule_wheelset ( rider_id, make, model, size )
SELECT
    r.rider_id,
    'ZIPP',
    'Firecrest 303',
    '700c'
FROM
    race_schedule_rider r
WHERE
    r.rider_name = 'Morgan Chaffin';

INSERT INTO
    race_schedule_wheelset ( rider_id, make, model, size )
SELECT
    r.rider_id,
    'HED',
    'Half BFD',
    '27.5 x fat'
FROM
    race_schedule_rider r
WHERE
    r.rider_name = 'Patrick Schoening';

INSERT INTO race_schedule_cycling_event (year, event_name, city, state, start_date, end_date, event_url, registration_url)
    VALUES (2024, 'Oklahoma Gravel Growler', 'Tecumseh', 'OK', '2024-02-03', '2024-02-03',
    'https://www.facebook.com/OKGravelGrowler/', 'https://www.bikesignup.com/Race/OK/Shawnee/OklahomaGravelGrowler');

INSERT INTO race_schedule_race (
    cycling_event_id,
	rider_id,
    race_date,
    race_start_time,
	distance,
	distance_units,
    terrain_type,
	cost,
	is_elite,
	bike_id,
	wheelset_id,
    results_url,
    total_time,
	overall_female_male_position,
	overall_result_position,
	notes
)
SELECT
    e.cycling_event_id,
    r.rider_id,
    '2024-02-03',
    '09:00:00',
    85,
    'mi',
    'gravel',
    60.00,
    'Y',
    b.bike_id,
    w.wheelset_id,
    'https://www.bikesignup.com/Race/Results/82295#resultSetId-437789;perpage:100',
    '5:49:14.87',
    2,
    4,
    'Rainy, muddy day. Second to Emily Newsome (pro). Alison Tetrick (pro) was third.'
FROM race_schedule_rider r 
JOIN race_schedule_cycling_event e ON event_name = 'Oklahoma Gravel Growler'
JOIN race_schedule_bike b ON make = 'Alchemy' and model = 'Lycos'
JOIN race_schedule_wheelset w ON w.model = 'ZIPP'
WHERE r.rider_name = 'Morgan Chaffin';

/*
INSERT INTO event (year, event_name, city, state, start_date, race_start_time, event_url, registration_url, results_url)
    VALUES (2024, 'Dirty South Roubaix', 'Alto Pass', 'IL', '2024-03-02', '09:00:00',
    'https://www.bikesignup.com/Race/IL/AltoPass/TheDirtySouthRoubaix100k',
    'https://www.bikesignup.com/Race/IL/AltoPass/TheDirtySouthRoubaix100k',
    'https://www.bikesignup.com/Race/Results/41183');

INSERT INTO race_schedule_cycling_event (
    event_id,
	rider_id,
	distance,
	distance_units,
    result_category,
    result_position
)
SELECT e.event_id, r.rider_id, 100, 'km', 'Overall Women', 1 FROM rider r 
JOIN event e ON event_name = 'Dirty South Roubaix'
WHERE r.rider_name = 'Morgan Chaffin';

INSERT INTO event (year, event_name, city, state, start_date, race_start_time, event_url, registration_url)
    VALUES (2024, 'Louisville Classic Gravel Grinder', 'Louisville', 'NE', '2024-04-06', '09:00:00',
    'https://www.facebook.com/profile.php?id=61553912115482&mibextid=LQQJ4d',
    'https://www.bikereg.com/63540');

INSERT INTO registration (
    event_id,
	rider_id,
	distance,
	distance_units
)
SELECT e.event_id, r.rider_id, 100, 'km' FROM rider r 
JOIN event e ON event_name = 'Louisville Classic Gravel Grinder'
WHERE r.rider_name = 'Morgan Chaffin';


INSERT INTO event (year, event_name, city, state, start_date, event_url, registration_url)
    VALUES (2024, 'Hazel Valley Rally', 'Fayetteville', 'AR', '2024-04-13',
    'https://www.ruleofthree.bike/',
    'https://www.bikereg.com/62840');

INSERT INTO registration (
    event_id,
	rider_id,
	distance,
	distance_units
)
SELECT e.event_id, r.rider_id, 64, 'mi' FROM rider r 
JOIN event e ON event_name = 'Hazel Valley Rally'
WHERE r.rider_name = 'Patrick Schoening';
*/