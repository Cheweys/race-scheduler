INSERT INTO race_schedule.rider (rider_name)
    VALUES ('Morgan Chaffin');

INSERT INTO race_schedule.rider (rider_name)
    VALUES ('Patrick Schoening');

INSERT INTO 
    race_schedule.bike
    (
        rider_id, make, model
    )
SELECT 
   r.rider_id,
   'Alchemy',
   'Lycos'
FROM
    race_schedule.rider r
WHERE
    r.rider_name = 'Morgan Chaffin';

INSERT INTO 
    race_schedule.bike
    (
        rider_id, make, model
    )
SELECT 
   r.rider_id,
   'Specialized',
   'Tarmac SL7'
FROM
    race_schedule.rider r
WHERE
    r.rider_name = 'Morgan Chaffin';

INSERT INTO 
    race_schedule.bike
    (
        rider_id, make, model
    )
SELECT 
   r.rider_id,
   'Bearclaw',
   'Towmac'
FROM
    race_schedule.rider r
WHERE
    r.rider_name = 'Patrick Schoening';

INSERT INTO
    race_schedule.wheelset ( rider_id, model )
SELECT
    r.rider_id,
    'ZIPP'
FROM
    race_schedule.rider r
WHERE
    r.rider_name = 'Morgan Chaffin';

INSERT INTO
    race_schedule.wheelset ( rider_id, model )
SELECT
    r.rider_id,
    '27.5 HED Half BFD'
FROM
    race_schedule.rider r
WHERE
    r.rider_name = 'Patrick Schoening';

INSERT INTO race_schedule.cycling_event (year, event_name, city, state, start_date, end_date, event_url, registration_url)
    VALUES (2024, 'Oklahoma Gravel Growler', 'Tecumseh', 'OK', '2024-02-03', '2024-02-03',
    'https://www.facebook.com/OKGravelGrowler/', 'https://www.bikesignup.com/Race/OK/Shawnee/OklahomaGravelGrowler');

# TODO ...

INSERT INTO registration (
    event_id,
	rider_id,
	distance,
	distance_units,
    result_category,
    result_position
)
SELECT e.event_id, r.rider_id, 85, 'mi', 'Overall Women', 2 FROM rider r 
JOIN event e ON event_name = 'Oklahoma Gravel Growler'
WHERE r.rider_name = 'Morgan Chaffin';

INSERT INTO event (year, event_name, city, state, start_date, race_start_time, event_url, registration_url, results_url)
    VALUES (2024, 'Dirty South Roubaix', 'Alto Pass', 'IL', '2024-03-02', '09:00:00',
    'https://www.bikesignup.com/Race/IL/AltoPass/TheDirtySouthRoubaix100k',
    'https://www.bikesignup.com/Race/IL/AltoPass/TheDirtySouthRoubaix100k',
    'https://www.bikesignup.com/Race/Results/41183');

INSERT INTO race_schedule.cycling_event (
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