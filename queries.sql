USE Private_Bus_Company;

-- simple queries

-- Selecting all columns from the EMPLOYEE table
SELECT * FROM EMPLOYEE;


-- Selecting specific columns (EmployeeID, FirstName, LastName) from the EMPLOYEE table
SELECT EmployeeID, FirstName, LastName FROM EMPLOYEE;



-- Performing a Cartesian product of the EMPLOYEE and DRIVER tables
SELECT * FROM EMPLOYEE, DRIVER;




-- Creating a view named Manager_View to select details of managers
CREATE VIEW Manager_View AS
SELECT EmployeeID, Position, Salary
FROM EMPLOYEE
WHERE Position = 'Manager';




-- Renaming columns in the EMPLOYEE table
SELECT EmployeeID AS ID, FirstName AS First_Name, LastName AS Last_Name
FROM EMPLOYEE;




-- Calculating the average salary of employees
SELECT AVG(Salary) AS Average_Salary
FROM EMPLOYEE;





-- Selecting employees whose last name starts with 'F'
SELECT *
FROM EMPLOYEE
WHERE LastName LIKE 'F%';




-- complex union

-- Combining the results of two queries
SELECT EmployeeID, Position FROM EMPLOYEE
UNION
SELECT EmployeeID, Area FROM MANAGER;



-- Finding common employees between MANAGER and SUPERVISOR tables
SELECT EmployeeID FROM MANAGER
INTERSECT
SELECT EmployeeID FROM SUPERVISOR;




-- Finding employees who are drivers but not managers
SELECT EmployeeID FROM DRIVER
EXCEPT
SELECT EmployeeID FROM MANAGER;






-- Finding employees who are experienced enough to be drivers
SELECT EmployeeID FROM EMPLOYEE
WHERE EmployeeID IN (
    SELECT EmployeeID FROM DRIVER_EXPERIENCE
    WHERE Experience >= 3
);






-- Retrieving data from multiple tables based on a common column
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
INNER JOIN DRIVER d ON e.EmployeeID = d.EmployeeID;






-- Joining tables based on columns with the same name
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
NATURAL JOIN DRIVER d;









-- Retrieving all records from the left table and matching records from the right table
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
LEFT OUTER JOIN DRIVER d ON e.EmployeeID = d.EmployeeID;





-- Retrieving all records from the right table and matching records from the left table
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
RIGHT OUTER JOIN DRIVER d ON e.EmployeeID = d.EmployeeID;






-- Retrieving all records when there is a match in either table
SELECT e.EmployeeID, e.FirstName, d.LicenceNo
FROM EMPLOYEE e
FULL OUTER JOIN DRIVER d ON e.EmployeeID = d.EmployeeID;







-- Combining the results of two queries, including duplicates
SELECT EmployeeID, Position FROM EMPLOYEE
UNION ALL
SELECT EmployeeID, Area FROM MANAGER;









-- Using a nested query to find the maximum salary
SELECT EmployeeID, Salary
FROM EMPLOYEE
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);






-- Using a nested query to find employees who are managers
SELECT EmployeeID, Position
FROM EMPLOYEE
WHERE EmployeeID IN (SELECT EmployeeID FROM MANAGER);






-- Using a nested query to find supervisors for specific routes
SELECT *
FROM ROUTE
WHERE SupervisorID IN (SELECT SupervisorID FROM SUPERVISOR WHERE EmployeeID = 'EMP011');
