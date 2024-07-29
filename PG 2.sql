-- Create the Employee table:
CREATE TABLE Employee1 (EMPNO INT,
ENAME VARCHAR(100),
JOB VARCHAR(50),
MGR INT,
SAL DECIMAL(10, 2));

--  Add a column commission with domain to the Employeetable.
ALTER TABLE Employee1
ADD COMMISSION DECIMAL(10, 2) CHECK (COMMISSION >= 0);

-- Insert any five records into the table. 
INSERT INTO Employee1 (EMPNO, ENAME, JOB, MGR, SAL, COMMISSION) VALUES
(101, 'John Doe', 'Manager', NULL, 50000.00, 1500.00);
INSERT INTO Employee1 (EMPNO, ENAME, JOB, MGR, SAL, COMMISSION) VALUES 
(102, 'Jane Smith', 'Developer', 101, 45000.00, 1000.00);
INSERT INTO Employee1 (EMPNO, ENAME, JOB, MGR, SAL, COMMISSION) VALUES
(103, 'Eric Johnson', 'Analyst', 101, 40000.00, 800.00);
INSERT INTO Employee1 (EMPNO, ENAME, JOB, MGR, SAL, COMMISSION) VALUES 
(104, 'Mary Jane', 'Designer', 103, 35000.00, 500.00);
INSERT INTO Employee1 (EMPNO, ENAME, JOB, MGR, SAL, COMMISSION) VALUES
 (105, 'Alice Brown', 'Tester', 104, 30000.00, 300.00);

select * from employee1;

--  Update the column details of the job 
UPDATE Employee1
SET JOB = 'Quality Analyst'
WHERE EMPNO = '105';

-- Rename a column of the Employee table using the ALTER command 
ALTER TABLE Employee1
CHANGE COLUMN MGR  MANAGER_ID INT;

-- Delete the employee whose EMPNO is 105 
DELETE FROM Employee1
WHERE EMPNO = 105;
