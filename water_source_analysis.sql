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
