

-- Question 1

-- Write a SQL query that produces a list of Chinook employees—first name and last—along with their employee ID and title. The list should be sorted by employee title in reverse alphabetic order. 

SELECT "FirstName", "LastName", "EmployeeId", "Title" 
FROM "Employee" 
ORDER BY "Title" DESC;


-- Question 2

-- Referencing the results of previous query, what is the first employee title listed? 

-- SALES SUPPORT AGENT


-- Question 3

--  Write a SQL query that produces a list of Chinook employees—first name and last—plus their job title, employee ID, along with the employee ID of the person they report to. The list should be limited to employees who report to Nancy Edwards. 

SELECT "FirstName", "LastName", "Title", "EmployeeId", "ReportsTo" 
FROM "Employee" 
WHERE "ReportsTo" = (SELECT "EmployeeId" FROM "Employee" WHERE "FirstName" = 'Nancy' AND "LastName" = 'Edwards');
							
							
-- Question 4

-- Referencing the results of previous query, which of the following employees DO NOT report to Nancy Edwards? 

-- Callahan


--Question 5

-- Write a SQL query that tells us the average age of a Chinook employee when hired (based on all employees).

SELECT AVG(DATE_PART('year', "HireDate") - DATE_PART('year', "BirthDate")) 
FROM "Employee";


-- Question 6

-- Referencing the results of previous query, rounded to the nearest year, what is the average age of a Chinook employee on their hire date? 

-- 38


-- Question 7

-- Write a SQL query that provides a list of the three oldest Chinook employees—first name and last—plus their job title and employee ID.

SELECT "FirstName", "LastName", "Title", "EmployeeId" 
FROM "Employee" 
ORDER BY "BirthDate" LIMIT 3;


--IF you haven’t figured out how to use the LIMIT Key word. You could have just listed all employees and just looked at the first 3

-- Question 8

-- Referencing the results of previous query, who is NOT one of the three oldest Chinook employees? 

-- Johnson


-- Question 9

-- Write a SQL query that produces a list of Chinook customers (first name and last) and the city they live in. This list should be limited to customers living in the United States, excluding California customers.

SELECT "FirstName", "LastName", "City" 
FROM "Customer" 
WHERE "Country" = 'USA' AND "State" <> 'CA';

-- Question 10

-- Referencing the results of previous query, how many Chinook customers live in the USA outside of California? 

-- 10


-- Question 11

-- Write a SQL query that produces a list of the customer IDs, last names and countries of all Chinook customers (sorted by country and then customer last name) who have null values for the company field.

SELECT "CustomerId", "LastName", "Country" 
FROM "Customer" 
WHERE "Company" IS NULL 
ORDER BY "Country", "LastName";


-- Question 12

-- Referencing the results of previous query, which of the following American Chinook customers has a null value for Company affiliation? 

-- Ralston


-- Q 13

-- Write a SQL query that produces a list of the last names, customer IDs, country and company of all Chinook customers (sorted by country and customer last name) who DO NOT have null values for the company field.

SELECT "LastName", "CustomerId", "Country", "Company" 
FROM "Customer" 
WHERE "Company" IS NOT NULL 
ORDER BY "Country", "LastName";


-- Q14

-- Referencing the results of previous query, which of the following Canadian Chinook customers DOES NOT have a null value for Company affiliation? 

-- Peterson


-- Q15

-- Write a SQL query that produces a list of the customer IDs, last names, countries and company affiliations of all Chinook customers sorted by country and then customer last name. Company affiliation for any customer with a null value for the company field should read "Individual".

SELECT "CustomerId", "LastName", "Country", 
COALESCE("Company", 'Individual') AS "Company" 
FROM "Customer" 
ORDER BY "Country", "LastName";


-- Q16

-- Referencing the results of previous query, which of the following countries has more corporate customers than individual customers? 

-- Brazil


--Q17

-- Using the newly created My_Albums table, write the SQL statement that will INSERT a new row where My_AlbumID is the next one available; AlbumID is your favorite album from the Chinook album table. Additionally, leave the My_notes field blank (or NULL) and add your rating (where 1 is bad and 5 is great).

INSERT INTO "My_Albums" ("My_AlbumId", "AlbumId", "My_Rating", "My_Notes") VALUES((SELECT MAX("My_AlbumId")+1 FROM "My_Albums"), 254, 5, '');


-- Q18

-- Using the newly created My_Albums table, write the SQL statement that will UPDATE the favorite album record that you just added to include a note of your own.

UPDATE "My_Albums" SET "My_Notes" = 'My most favourite' 
WHERE "My_AlbumId" = (SELECT MAX("My_AlbumId") FROM "My_Albums");

--------------------------------------------------------------------------------

-- Q19

-- Using the newly created My_Albums table, write the SQL statement that will DELETE your favorite album record that you added and edited in Questions 9 and 10.

DELETE FROM "My_Albums" 
WHERE "My_AlbumId" = (SELECT MAX("My_AlbumId") FROM "My_Albums");