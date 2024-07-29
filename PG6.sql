-- Lab Program 6 
-- Write a PL/SQL block of code using parameterized Cursor, 
-- that will merge the data available 
-- in the newly created table N_RollCall with the 
-- data available in the table O_RollCall. 
-- If the data in the first table already exist 
-- in the second table, then that data should be skipped. 
   
   CREATE DATABASE ROLLCALL; 
   USE ROLLCALL; 
   -- Create N_RollCall table 
CREATE TABLE N_RollCall ( 
student_id INT PRIMARY KEY, 
student_name VARCHAR (255), 
birth_date DATE); 

-- Create O_RollCall table with common data 
CREATE TABLE O_RollCall ( 
student_id INT PRIMARY KEY, 
student_name VARCHAR (255), 
birth_date DATE); 

INSERT INTO O_RollCall (student_id, student_name, birth_date)
VALUES (1, 'Amith', '1995-08-15'); 
INSERT INTO O_RollCall (student_id, student_name, birth_date)
VALUES(2, 'Ajay', '1990-12-10'); 

SELECT * FROM O_RollCall;

INSERT INTO N_RollCall (student_id, student_name, birth_date) 
VALUES (1, 'Amith', '1995-08-15'); -- Common record with O_RollCall 
INSERT INTO N_RollCall (student_id, student_name, birth_date) 
VALUES(2, 'Ajay', '1990-12-10'); 
INSERT INTO N_RollCall (student_id, student_name, birth_date) 
VALUES(3, 'Ravi', '1990-12-10'); -- Common record with O_RollCall 
INSERT INTO N_RollCall (student_id, student_name, birth_date) 
VALUES(4, 'Rakesh', '2000-05-18'); 
INSERT INTO N_RollCall (student_id, student_name, birth_date) 
VALUES(5, 'Vinay', '1997-09-03');

SELECT * FROM N_RollCall;

-- DROP PROCEDURE merge_rollcall_data;

DELIMITER // 

CREATE PROCEDURE merge_rollcall_data() 
BEGIN 
		DECLARE done INT DEFAULT FALSE; 
		DECLARE n_id INT; 
		DECLARE n_name VARCHAR (255); 
		DECLARE n_birth_date DATE; 
-- Declare cursor for N_RollCall table 
		DECLARE n_cursor CURSOR FOR 
		SELECT student_id, student_name, birth_date FROM N_RollCall; -- Declare handler for cursor 
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET done = TRUE; 
-- Open the cursor 
OPEN n_cursor; 
-- Start looping through cursor results 
cursor_loop: LOOP -- Fetch data from cursor into variables 
FETCH n_cursor INTO n_id, n_name, n_birth_date; 
-- Check if no more rows to fetch 
IF done THEN 
LEAVE cursor_loop; 
END IF; 
-- Check if the data already exists in O_RollCall IF NOT EXISTS  
(SELECT 1 FROM O_RollCall WHERE student_id = n_id);
 -- Insert the record into O_RollCall 
INSERT INTO O_RollCall(student_id, student_name, birth_date) VALUES (n_id, n_name, n_birth_date); 

END LOOP; 
-- Close the cursor 
CLOSE n_cursor; 
END// 
DELIMITER ;

call merge_rollcall_data();
delete FROM O_RollCall;
SELECT * FROM O_RollCall;

