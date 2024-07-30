                      -- Maji_Ndogo_Part_1 Slides 20
-- Did you notice that we recorded contamination/pollution data for all of the well sources? Find the right table and print the first few rows.
-- Find the right table and print the first few rows.
SELECT 
	* 
FROM md_water_services.well_pollution;

                  -- Maji_Ndogo_Part_1 Slides 21
-- It looks like our scientists diligently recorded the water quality of all the wells. Some are contaminated with biological contaminants,
-- while others are polluted with an excess of heavy metals and other pollutants. Based on the results, each well was classified as Clean,
-- Contaminated: Biological or Contaminated: Chemical. It is important to know this because wells that are polluted with bio- or
-- other contaminants are not safe to drink. It looks like they recorded the source_id of each test, so we can link it to a source, at some place in Maji Ndogo.
-- In the well pollution table, the descriptions are notes taken by our scientists as text, so it will be challenging to process it. 
-- he biological column is in units of CFU/mL, so it measures how much contamination is in the water. 0 is clean, and anything more than 0.01 is contaminated.
-- Let's check the integrity of the data. The worst case is if we have contamination, but we think we don't. People can get sick, so we need to make sure there are no errors here.
-- So, write a query that checks if the results is Clean but the biological column is > 0.01.
SELECT 
	*
FROM md_water_services.well_pollution
WHERE biological > 0.01
AND results = 'Clean'
;

                               -- Maji_Ndogo_Part_1 Slides 22, 23, 24, 25, 26, 27, 28 & 29
-- Hint: To find these descriptions, search for the word Clean with additional characters after it. As this is what separates incorrect descriptions from the records that should have "Clean"
-- to fix this error on the description column, let's first filter out description that has clean with other sentense
SELECT 
	*
FROM md_water_services.well_pollution
WHERE description LIKE '%Clean%'
;

-- then update the description where mistake was made:
-- Case 1a: Update descriptions that mistakenly mention
-- `Clean Bacteria: E. coli` to `Bacteria: E. coli`
-- Case 1b: Update the descriptions that mistakenly mention
-- `Clean Bacteria: Giardia Lamblia` to `Bacteria: Giardia Lamblia
-- Case 2: Update the `result` to `Contaminated: Biological` where
-- `biological` is greater than 0.01 plus current results is `Clean`
use md_water_services;
SET SQL_SAFE_UPDATES=0;
UPDATE
	well_pollution
SET description = 'Bacteria: E. coli'
WHERE description = 'Clean Bacteria: E. coli';

UPDATE
	well_pollution
SET description = 'Bacteria: Giardia Lamblia'
WHERE description = 'Clean Bacteria: Giardia Lamblia';

UPDATE
	well_pollution
SET results = '`Contaminated: Biological'
WHERE results > 0.01
AND results = 'Clean'
;
