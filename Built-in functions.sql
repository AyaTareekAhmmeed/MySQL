-- Aggregation Functions
SELECT SUM(COST) FROM PETRESCUE;

SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;

SELECT MAX(QUANTITY) FROM PETRESCUE;

SELECT MIN(QUANTITY) FROM PETRESCUE;

SELECT AVG(COST) FROM PETRESCUE;


-- Scalar Functions and String Functions
SELECT ROUND(COST) FROM PETRESCUE; --The output of this query will be the value of each element in the column rounded to the specified number of decimal places.
-- also coluld be written as:
SELECT ROUND(COST, 0) FROM PETRESCUE;
-- round the value to 2 decimal places 
SELECT ROUND(COST, 2) FROM PETRESCUE;

SELECT LENGTH(ANIMAL) FROM PETRESCUE; -- The output of this query will be the length of each element in the column.

SELECT UCASE(ANIMAL) FROM PETRESCUE; --The output of this query will be each element in the column in upper case letters. 

SELECT LCASE(ANIMAL) FROM PETRESCUE; --The output of this query will be each element in the column in lower case letters. 


--Date Functions
SELECT DAY(RESCUEDATE) FROM PETRESCUE; --The output of this query will be only the DAY part of the date in the column.

SELECT MONTH(RESCUEDATE) FROM PETRESCUE;

SELECT YEAR(RESCUEDATE) FROM PETRESCUE;

SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE --Here, the quantity in Number and in Date_element will combine to form the interval to be added to the date in the column.
SELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE
SELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE

SELECT DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE --DATEDIFF(Date_1, Date_2). This function calculates the difference between the two given dates and gives the output in number of days.

SELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE --CURRENT_DATE is also an inbuilt function that returns the present date as known to the server.


-- Practice Problems
-- 1-Write a query that displays the average cost of rescuing a single dog. Note that the cost per dog would not be the same in different instances.
SELECT AVG(COST/QUANTITY) FROM PETRESCUE WHERE ANIMAL = 'Dog';

-- 2-Write a query that displays the animal name in each rescue in uppercase without duplications.
SELECT DISTINCT UCASE(ANIMAL) FROM PETRESCUE;

-- 3-Write a query that displays all the columns from the PETRESCUE table where the animal(s) rescued are cats. Use cat in lowercase in the query.
SELECT * FROM PETRESCUE WHERE LCASE(ANIMAL)="cat";

-- 4-Write a query that displays the number of rescues in the 5th month.
SELECT SUM(QUANTITY) FROM PETRESCUE WHERE MONTH(RESCUEDATE)="05";

-- 5-The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. Write a query that displays the ID and the target date.
SELECT ID, DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) FROM PETRESCUE;