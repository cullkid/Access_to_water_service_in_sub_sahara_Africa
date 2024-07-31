              -- Part 2 Slides 5
-- Cleaning our data
-- Ok, bring up the employee table. It has info on all of our workers, but note that the email addresses have not been added. We will have to send them reports and figures, so let's update it. Luckily the emails for our department are easy: first_name.last_name@ndogowater.gov.
-- We have to update the database again with these email addresses, so before we do, let's use a SELECT query to get the format right, then use UPDATE and SET to make the changes.
SELECT 
	*
FROM md_water_services.employee;

                    -- Part 2 Slides 6
-- let's remove the space between the first and last names using REPLACE()
-- Then we can use LOWER() with the result we just got
-- We then use CONCAT() to add the rest of the email address
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),'@ndogowater.gov');

                              -- Part 2 Slides 5,6,7
-- Often when databases are created and updated, or information is collected from different sources, errors creep in. For example, if you look at the phone numbers in the phone_number column, the values are stored as strings.
-- The phone numbers should be 12 characters long, consisting of the plus sign, area code (99), and the phone number digits. However, when we use the LENGTH(column) function, it returns 13 characters, indicating there's an extra character.
-- That's because there is a space at the end of the number! If you try to send an automated SMS to that number it will fail.
SELECT
LENGTH(phone_number)
FROM
employee;

                             -- Part 2 Slides 7
-- Use TRIM() to write a SELECT query again, make sure we get the string without the space, and then UPDATE the record like you just did for the emails. If you need more information about TRIM()
SELECT
    phone_number,
    LENGTH(phone_number) AS original_length,
    TRIM(phone_number) AS trimmed_phone_number,
    LENGTH(TRIM(phone_number)) AS trimmed_length
FROM
    employee;
UPDATE employee
SET phone_number = TRIM(phone_number);

                              -- Part 2 Slides 8
-- Use the employee table to count how many of our employees live in each town. Think carefully about what function we should use and how we should aggregate the data.
-- Note how many of our workers are living in smaller communities in the rural parts of Maji Ndogo.
SELECT 
	town_name,
    COUNT(town_name) AS counted_town_name
FROM md_water_services.employee
GROUP BY town_name




