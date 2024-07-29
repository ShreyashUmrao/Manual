
USE dbemployee;

CREATE TABLE Employee2 (E_id INT,
E_name VARCHAR(100),Age INT,
Salary DECIMAL(10, 2));

DESC Employee2;

INSERT INTO Employee2 (E_id, E_name, Age, Salary) VALUES
(101, 'John Doe', 30, 50000.00);

INSERT INTO Employee2 (E_id, E_name, Age, Salary) VALUES
(102, 'ABC', 40, 60000.00);

INSERT INTO Employee2 (E_id, E_name, Age, Salary) VALUES
(103, 'XYZ', 350, 45000.00);

INSERT INTO Employee2 (E_id, E_name, Age, Salary) VALUES
(104, 'PQR', 36, 46000.00);

-- TO DISPLAY
SELECT * FROM  Employee2;

-- Count number of employee names from employeetable 
SELECT COUNT(E_name) AS NumberOfEmployees FROM Employee2; 

-- Find the Maximum age from employee table. 
SELECT MAX(Age) AS MaxAge FROM Employee2; 

-- Find the Minimum age from employeetable.
SELECT MIN(Age) AS MinAge FROM Employee2; 

-- Find salaries of employee in Ascending Order. 
SELECT Salary FROM Employee2 ORDER BY Salary ASC;


SELECT COUNT(E_name) AS NumberOfEmployees FROM Employee2;



--  Count number of employee names from employeetable
SELECT COUNT(ENAME) AS NumberOfEmployees FROM employee1;