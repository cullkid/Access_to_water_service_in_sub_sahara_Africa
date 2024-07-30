                                  -- Maji_Ndogo_Part_1 Slides 19
-- The quality of our water sources is the whole point of this survey. We have a table that contains a quality score for each visit made about a water source that was assigned by a Field surveyor. 
-- They assigned a score to each source from 1, being terrible, to 10 for a good, clean water source in a home. Shared taps are not rated as high, and the score also depends on how long the queue times are.
-- Look through the table record to find the table.
SELECT 
	* 
FROM md_water_services.water_quality;

-- Let's check if this is true. The surveyors only made multiple visits to shared taps and did not revisit other types of water sources. 
-- So there should be no records of second visits to locations where there are good water sources, like taps in homes.
-- So please write a query to find records where the subject_quality_score is 10 -- only looking for home taps -- and where the source was visited a second time. What will this tell us?
SELECT 
	* 
FROM md_water_services.water_quality
WHERE subjective_quality_score = 10
AND visit_count = 2
;
