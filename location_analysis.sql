                                                     -- Maji_Ndogo_Part_1 Slides 7
-- the md_water_services database have multiple tables we will analyze to  gain the access of drinking water in the world according to 'UNITED DEVELOPMENT GOAL'
-- So let's have a look at one of these tables, Let's use location so we can use that killer query, SELECT * but remember to limit it and tell it which table we are looking at. Normally "_id" columns are related to another table
SELECT 
	*
FROM md_water_services.location
LIMIT 5
;
-- So we can see that this table has information on a specific location, with an address, the province and town the location is in, and if it's
-- in a city (Urban) or not. We can't really see what location this is but we can see some sort of identifying number of that location.

                                   -- Maji_Ndogo_Part_2 Slides 11
-- Looking at the location table, let’s focus on the province_name, town_name and location_type to understand where the water sources are in Maji Ndogo.
-- Create a query that counts the number of records per town
SELECT 
	town_name,
    COUNT(town_name) AS record_per_town
FROM md_water_services.location
GROUP BY town_name
;

-- Now count the records per province
SELECT 
	province_name,
    COUNT(province_name) AS record_per_pronvice
FROM md_water_services.location
GROUP BY province_name
;

                                 -- Maji_Ndogo_Part_2 Slides 12, 13
-- From this table, it's pretty clear that most of the water sources in the survey are situated in small rural communities, scattered across Maji Ndogo.
-- If we count the records for each province, most of them have a similar number of sources, so every province is well-represented in the survey
-- find a way to do the following:
-- 1. Create a result set showing:
-- • province_name
-- • town_name
-- • An aggregated count of records for each town (consider naming this records_per_town).
-- • Ensure your data is grouped by both province_name and town_name.
-- 2. Order your results primarily by province_name. Within each province, further sort the towns by their record counts in descending order.
SELECT 
	province_name,
	town_name,
    COUNT(town_name) AS records_per_town
FROM md_water_services.location
GROUP BY town_name, province_name;
-- These results show us that our field surveyors did an excellent job of documenting the status of our country's water crisis. Every province and town has many documented sources.
-- This makes me confident that the data we have is reliable enough to base our decisions on. This is an insight we can use to communicate data integrity, so let's make a note of that.

-- Finally, look at the number of records for each location type
SELECT 
	location_type,
    COUNT(location_type) AS records_per_location_type
FROM md_water_services.location
GROUP BY location_type;

                        -- Maji_Ndogo_Part_2 Slides 14
-- We can see that there are more rural sources than urban, but it's really hard to understand those numbers. Percentages are more relatable.
-- If we use SQL as a very overpowered calculator:
SELECT 23740 / (15910 + 23740) * 100 AS rural_percentage;
-- We can see that 60% of all water sources in the data set are in rural communities.
-- o again, what are some of the insights we gained from the location table?
-- 1. Our entire country was properly canvassed, and our dataset represents the situation on the ground.
-- 2. 60% of our water sources are in rural communities across Maji Ndogo. We need to keep this in mind when we make decisions




