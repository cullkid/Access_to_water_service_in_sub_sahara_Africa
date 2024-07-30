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
