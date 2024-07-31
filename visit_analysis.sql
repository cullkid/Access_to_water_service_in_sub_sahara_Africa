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

                              -- Maji_Ndogo_Part_2 Slides 10
-- Let's first look at the number of records each employee collected. So find the correct table, figure out what function to use and how to group, order and limit the results to only see the top 3 employee_ids with the highest number of locations visited.
SELECT 
    assigned_employee_id,
    COUNT(visit_count) AS visit_count
FROM md_water_services.visits
GROUP BY assigned_employee_id
ORDER BY visit_count DESC
LIMIT 3;

-- Make a note of the top 3 assigned_employee_id and use them to create a query that looks up the employee's info. Since you're a pro at finding stuff in a database now, you can figure this one out. You should have a column of names, email addresses and phone numbers for our top dogs.
SELECT 
	assigned_employee_id,
    employee_name,
    phone_number,
    email
FROM md_water_services.employee
WHERE assigned_employee_id = 1
OR assigned_employee_id = 30
OR assigned_employee_id = 34
;




