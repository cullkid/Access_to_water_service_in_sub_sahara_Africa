                                 -- Maji_Ndogo_Part_1 Slides 9
-- the md_water_services database have multiple tables we will analyze to  gain the access of drinking water in the world according to 'UNITED DEVELOPMENT GOAL'
-- So let's have a look at one of these tables, Let's use water_source so we can use that killer query, SELECT * but remember to limit it and tell it which table we are looking at. Normally "_id" columns are related to another table
SELECT 
	*
FROM md_water_services.water_source
LIMIT 5
;
-- Nice! Ok, we're getting somewhere now... Water sources are where people get their water from! Ok, this database is actually complex, so maybe a good idea for you is to look at the rest of the tables quickly. 
-- You can just select them, but remember in good SQL there would be a data dictionary somewhere that documents all of this information, so you should read that as well, and even keep a copy of that close if we need to find information quickly.

                                           -- Maji_Ndogo_Part_1 Slides 10
-- Now that you're familiar with the structure of the tables, let's dive deeper. We need to understand the types of water sources we're dealing with. Can you figure out which table contains this information?
-- Once you've identified the right table, write a SQL query to find all the unique types of water sources.
SELECT 
	DISTINCT type_of_water_source AS type_of_water_source
FROM md_water_services.water_source; 

                      -- Maji_Ndogo_Part_1 Slides 17 & 18
-- I am wondering what type of water sources take this long to queue for. We will have to find that information in another table that lists the types of water sources.
 -- If I remember correctly, the table has type_of_water_source, and a source_id column. So let's write down a couple of these source_id values from our results, and search for them in the other table.
-- If we just select the first couple of records of the visits table without a WHERE filter, we can see that some of these rows also have 0 mins queue time. So let's write down one or two of these too
SELECT
	*
FROM md_water_services.water_source
WHERE source_id = 'AkRu04807224'
OR source_id = 'AmBe11056224'
OR source_id = 'AkKi00881224'
OR source_id = 'AmRu14449224'
OR source_id = 'KiRu25672224'
OR source_id = 'AkRu02691224' 
OR source_id = 'AkHa00001224';

                                   -- Maji_Ndogo_Part_2 Slides 15, 16, 17, 18
-- The way I look at this table; we have access to different water source types and the number of people using each source.
-- These are the questions that I am curious about.
-- 1. How many people did we survey in total?
SELECT 
    SUM(number_of_people_served) AS total_number_of_people_served
FROM md_water_services.water_source
;

-- 2. How many wells, taps and rivers are there?
SELECT 
	type_of_water_source,
    COUNT(type_of_water_source) AS total_type_of_water_source
FROM md_water_services.water_source
GROUP BY type_of_water_source
;

-- 3. How many people share particular types of water sources on average?
SELECT 
    type_of_water_source,
    ROUND(AVG(number_of_people_served)) AS average_of_number_of_people_served
FROM md_water_services.water_source
GROUP BY type_of_water_source;
-- These results are telling us that 644 people share a tap_in_home on average. Does that make sense?
-- No it doesn’t, right?
-- Remember I told you a few important things that apply to tap_in_home and broken_tap_in_home? The surveyors combined the data of many households together and added this as a single tap record, but each household actually has its own tap.
 -- In addition to this, there is an average of 6 people living in a home. So 6 people actually share 1 tap (not 644).
 -- This means that 1 tap_in_home actually represents 644 ÷ 6 = ± 100 taps.

-- Calculating the average number of people served by a single instance of each water source type helps us understand the typical capacity or load on a single water source. 
-- This can help us decide which sources should be repaired or upgraded, based on the average impact of each upgrade.
-- For example, wells don't seem to be a problem, as fewer people are sharing them. On the other hand, 2000 share a single public tap on average! We saw some of the queue times last time, and now we can see why. So looking at these results, we probably should focus on improving shared taps first.
-- 4. now lets calculate How many people are getting water from each type of source?
SELECT 
    type_of_water_source,
    SUM(number_of_people_served) AS number_of_people_served_per_water_source
FROM md_water_services.water_source
GROUP BY type_of_water_source 
ORDER BY number_of_people_served_per_water_source ASC
;


-- It's a little hard to comprehend these numbers, but you can see that one of these is dominating. To make it a bit simpler to interpret, let's use percentages.
-- First, we need the total number of citizens then use the result of that and divide each of the SUM(number_of_people_served) by that number, times 100, to get percentages.
-- Make a note of the number of people surveyed in the first question we answered. I get a total of about 27 million citizens!
-- Next, calculate the percentages using the total we just got and Having percentages with a bunch of decimals really doesn't help get the point across, does it?

Let's round that off to 0 decimals, and order the results.
SELECT 
    type_of_water_source,
    ROUND((SUM(number_of_people_served) / 27628140 * 100)) AS number_of_people_served_per_water_source
FROM md_water_services.water_source
GROUP BY type_of_water_source 
ORDER BY number_of_people_served_per_water_source
;




