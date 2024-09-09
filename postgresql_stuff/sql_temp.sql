 select r.rider_id, e.event_id, 85, 'miles' from rider r 
 join event e on event_name = 'Oklahoma Gravel Growler'
 where r.rider_name = 'Morgan Chaffin';