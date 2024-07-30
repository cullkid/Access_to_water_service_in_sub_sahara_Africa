                             -- Maji_Ndogo_Part_1 Slides 8
-- the md_water_services database have multiple tables we will analyze to  gain the access of drinking water in the world according to 'UNITED DEVELOPMENT GOAL'
-- So let's have a look at one of these tables, Let's use visit so we can use that killer query, SELECT * but remember to limit it and tell it which table we are looking at. Normally "_id" columns are related to another table
SELECT 
	*
FROM md_water_services.visits
LIMIT 5
;
-- Yeah, so this is a list of location_id, source_id, record_id, and a date and time, so it makes sense that someone (assigned_employee_id) visited some location (location_id) at some time (time_of_record ) and found a 'source' there (source_id). Often the
-- "_id" columns are related to another table. In this case, the source_id in the visits table refers to source_id in the water_source table. This is what we call a foreign key, but we'll get more into this next time.

                                          -- Maji_Ndogo_Part_1 Slides 16
-- Write an SQL query that retrieves all records from this table where the time_in_queue is more than some crazy time, say 500 min. How would it feel to queue 8 hours for water?
SELECT 
	*
FROM md_water_services.visits
WHERE time_in_queue > 500;

                              -- Maji_Ndogo_Part_1 Slides 17 & 18

