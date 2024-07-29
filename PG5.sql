-- Create cursor for Employee table & extract the values 
-- from the table. Declare the variables 
-- ,Open the cursor & extrct the values from the cursor. 
-- Close the cursor. 
-- Employee(E_id, E_name, Age, Salary) 


create database pg5;
use pg5;
CREATE TABLE Employee1 ( E_id INT, 
E_name VARCHAR(255), 
Age INT, 
Salary DECIMAL(10, 2)); 

INSERT INTO Employee1 (E_id, E_name, Age, Salary) 
VALUES (1, 'Samarth', 30, 50000.00); 
INSERT INTO Employee1 (E_id, E_name, Age, Salary) 
VALUES(2, 'Ramesh Kumar', 25, 45000.00); 
INSERT INTO Employee1 (E_id, E_name, Age, Salary) 
VALUES(3, 'Seema Banu', 35, 62000.00);
INSERT INTO Employee1 (E_id, E_name, Age, Salary) 
VALUES(4, 'Dennis Anil', 28, 52000.00);
INSERT INTO Employee1 (E_id, E_name, Age, Salary) 
VALUES(5, 'Rehman Khan', 32, 58000.00);

SELECT * FROM Employee1;

DELIMITER $$ 
CREATE PROCEDURE gettable1( INOUT Tableontents varchar(4000))  
BEGIN 
	DECLARE finished INTEGER DEFAULT 0; 
	DECLARE content varchar(100) DEFAULT ""; 
#Cursor declaration 
DEClARE curName1 CURSOR FOR 
	SELECT concat(E_id ,' , ' , E_name,Age ,' , ' , Salary) 
	FROM Employee1 
	order by E_id desc; 
#declare NOT FOUND handler 
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET finished = 1; 
#Open cursor 
OPEN curName1; 
#fetch records 
getName1: LOOP 
FETCH curName1 INTO content; 
IF finished = 1 THEN LEAVE getName1; 
END IF; 
SET Tableontents = CONCAT(content,";",Tableontents); 
END LOOP getName1; 
CLOSE curName1; 
END$$ 


SET @Tableontents = ""; 
CALL gettable1(@Tableontents); 
SELECT @Tableontents;