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
    race_schedule_bike
    (
        rider_id, make, model, notes
    )
SELECT 
   r.rider_id,
   'Cervelo',
   'Aspero',
   'Green beater bike lol.'
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

INSERT INTO
    race_schedule_wheelset ( rider_id, make, model, size )
SELECT
    r.rider_id,
    'Reserve',
    '32 Carbon',
    '700c'
FROM
    race_schedule_rider r
WHERE
    r.rider_name = 'Patrick Schoening';

INSERT INTO race_schedule_cycling_event (year, event_name, address, city, state, start_date, end_date,
    event_url, registration_url, photos_url)
    VALUES (2024, 'Oklahoma Gravel Growler', '111 N Broadway Street', 'Tecumseh', 'OK', '2024-02-03', '2024-02-03',
    'https://www.facebook.com/OKGravelGrowler/', 'https://www.bikesignup.com/Race/OK/Shawnee/OklahomaGravelGrowler',
    'https://adobe.ly/3HMYrAM');

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
JOIN race_schedule_wheelset w ON w.make = 'ZIPP' and w.model = 'Firecrest 303'
WHERE r.rider_name = 'Morgan Chaffin';

INSERT INTO race_schedule_cycling_event (year, event_name, city, state, start_date, end_date, event_url, registration_url)
    VALUES (2024, 'Dirty South Roubaix', 'Alto Pass', 'IL', '2024-03-02', '2024-03-02',
    'https://www.facebook.com/dirtysouthgravel',
    'https://www.bikesignup.com/Race/IL/AltoPass/TheDirtySouthRoubaix100k');

INSERT INTO race_schedule_race (
    cycling_event_id,
	rider_id,
    race_date,
	distance,
	distance_units,
    terrain_type,
	is_elite,
	bike_id,
	wheelset_id,
    results_url,
    total_time,
	overall_female_male_position,
	overall_result_position
)
SELECT
    e.cycling_event_id,
    r.rider_id,
    '2024-03-02',
    100,
    'km',
    'gravel',
    'N',
    b.bike_id,
    w.wheelset_id,
    'https://www.bikesignup.com/Race/Results/41183#resultSetId-440291;perpage:250',
    '3:18:35.44',
    1,
    22
FROM race_schedule_rider r 
JOIN race_schedule_cycling_event e ON event_name = 'Dirty South Roubaix'
JOIN race_schedule_bike b ON make = 'Alchemy' and model = 'Lycos'
JOIN race_schedule_wheelset w ON w.make = 'ZIPP' and w.model = 'Firecrest 303'
WHERE r.rider_name = 'Morgan Chaffin';

INSERT INTO race_schedule_cycling_event (year, event_name, address, city, state, start_date, end_date, event_url, registration_url)
    VALUES (2024, 'Louisville Classic Gravel Grinder', '14704 156th St.', 'Louisville', 'NE', '2024-04-06', '2024-04-06',
    'https://www.facebook.com/profile.php?id=61553912115482&mibextid=LQQJ4d',
    'https://www.bikereg.com/63540');

INSERT INTO race_schedule_race (
    cycling_event_id,
	rider_id,
    race_date,
	distance,
	distance_units,
    terrain_type,
	is_elite,
	bike_id,
	wheelset_id,
	overall_female_male_position
)
SELECT
    e.cycling_event_id,
    r.rider_id,
    '2024-04-06',
    100,
    'km',
    'gravel',
    'N',
    b.bike_id,
    w.wheelset_id,
    1
FROM race_schedule_rider r 
JOIN race_schedule_cycling_event e ON event_name = 'Louisville Classic Gravel Grinder'
JOIN race_schedule_bike b ON make = 'Alchemy' and model = 'Lycos'
JOIN race_schedule_wheelset w ON w.make = 'ZIPP' and w.model = 'Firecrest 303'
WHERE r.rider_name = 'Morgan Chaffin';

INSERT INTO race_schedule_cycling_event (year, event_name, city, state, start_date, end_date, event_url, registration_url)
    VALUES (2024, 'Hazel Valley Rally', 'Fayetteville', 'AR', '2024-04-13', '2024-04-13',
    'https://www.ruleofthree.bike/hazelvalleyrally',
    'https://www.bikereg.com/62840');

INSERT INTO race_schedule_race (
    cycling_event_id,
	rider_id,
    race_date,
	distance,
	distance_units,
    terrain_type,
    route_url,
	is_elite,
	bike_id,
	wheelset_id
)
SELECT
    e.cycling_event_id,
    r.rider_id,
    '2024-04-13',
    62.5,
    'mi',
    'gravel',
    'https://ridewithgps.com/routes/41912593',
    'N',
    b.bike_id,
    w.wheelset_id
FROM race_schedule_rider r 
JOIN race_schedule_cycling_event e ON event_name = 'Hazel Valley Rally'
JOIN race_schedule_bike b ON make = 'Cervelo' and model = 'Aspero'
JOIN race_schedule_wheelset w ON w.make = 'Reserve' and w.model = '32 Carbon'
WHERE r.rider_name = 'Patrick Schoening';

INSERT INTO race_schedule_cycling_event (year, event_name, address, city, state, start_date, end_date, event_url)
    VALUES (2024, 'Highlands Gravel Classic', '244 Clark Street', 'Goshen', 'AR', '2024-04-27', '2024-04-27',
    'https://www.highlandsgravelclassic.com/');

INSERT INTO race_schedule_race (
    cycling_event_id,
	rider_id,
    race_date,
	distance,
	distance_units,
    terrain_type,
	is_elite,
	bike_id,
	wheelset_id,
    results_url,
	overall_female_male_position
)
SELECT
    e.cycling_event_id,
    r.rider_id,
    '2024-04-27',
    68,
    'mi',
    'gravel',
    'Y',
    b.bike_id,
    w.wheelset_id,
    'https://my.raceresult.com/286410/',
    1
FROM race_schedule_rider r 
JOIN race_schedule_cycling_event e ON event_name = 'Highlands Gravel Classic'
JOIN race_schedule_bike b ON make = 'Alchemy' and model = 'Lycos'
JOIN race_schedule_wheelset w ON w.make = 'ZIPP' and w.model = 'Firecrest 303'
WHERE r.rider_name = 'Morgan Chaffin';

INSERT INTO race_schedule_cycling_event (year, event_name, city, state, start_date, end_date, event_url, registration_url)
    VALUES (2024, 'La Grind', 'Emporia', 'KS', '2024-05-06', '2024-05-07',
    'https://www.ridelagrind.com/', 'https://register.chronotrack.com/r/77092');

INSERT INTO race_schedule_race (
    cycling_event_id,
	rider_id,
    race_date,
	distance,
	distance_units,
    terrain_type,
	is_elite,
	bike_id,
	wheelset_id,
	overall_female_male_position
)
SELECT
    e.cycling_event_id,
    r.rider_id,
    '2024-05-06',
    50,
    'mi',
    'gravel',
    'Y',
    b.bike_id,
    w.wheelset_id,
    1
FROM race_schedule_rider r 
JOIN race_schedule_cycling_event e ON event_name = 'La Grind'
JOIN race_schedule_bike b ON make = 'Alchemy' and model = 'Lycos'
JOIN race_schedule_wheelset w ON w.make = 'ZIPP' and w.model = 'Firecrest 303'
WHERE r.rider_name = 'Morgan Chaffin';

INSERT INTO race_schedule_race (
    cycling_event_id,
	rider_id,
    race_date,
	distance,
	distance_units,
    terrain_type,
	is_elite,
	bike_id,
	wheelset_id,
	overall_female_male_position
)
SELECT
    e.cycling_event_id,
    r.rider_id,
    '2024-05-07',
    65,
    'mi',
    'gravel',
    'Y',
    b.bike_id,
    w.wheelset_id,
    1
FROM race_schedule_rider r 
JOIN race_schedule_cycling_event e ON event_name = 'La Grind'
JOIN race_schedule_bike b ON make = 'Alchemy' and model = 'Lycos'
JOIN race_schedule_wheelset w ON w.make = 'ZIPP' and w.model = 'Firecrest 303'
WHERE r.rider_name = 'Morgan Chaffin';