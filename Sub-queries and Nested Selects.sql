-- Sub-queries and Nested Selects
SELECT *
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);-- the group function is AVG and cannot be used directly in the condition since it has not been retrieved from the data. Therefore, the condition will use a sub-query to retrieve the average salary information to compare the existing salary.

SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY --uery that retrieves all employee records with EMP_ID, SALARY, and maximum salary as MAX_SALARY in every row. 
FROM EMPLOYEES;

SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE b_date = (SELECT MIN(b_date) FROM EMPLOYEES); --extract the first and last names of the oldest employee. Since the oldest employee will be the one with the smallest date of birth

--use sub-queries inside from to create derived tables, which can then be used to query specific information.
SELECT AVG(SALARY) 
FROM (SELECT SALARY 
      FROM EMPLOYEES 
      ORDER BY SALARY DESC 
      LIMIT 5) AS SALARY_TABLE;
	  

--Practice Problems
--1) Write a query to find the average salary of the five least-earning employees.
SELECT AVG(SALARY) 
FROM (SELECT SALARY 
      FROM EMPLOYEES 
      ORDER BY SALARY 
      LIMIT 5) AS SALARY_TABLE;
	  
--2) Write a query to find the records of employees older than the average age of all employees.
SELECT * 
FROM EMPLOYEES 
WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,b_date))) > 
    (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE,b_date)))) 
    FROM Employees);
	
--3) From the Job_History table, display the list of Employee IDs, years of service, and average years of service for all entries.
SELECT EMPL_ID, YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, start_date))), 
    (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, start_date)))) 
    FROM JOB_HISTORY)
FROM JOB_HISTORY;