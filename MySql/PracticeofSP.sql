Create Database Employee;
Use Employee;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    dept VARCHAR(50),
    salary DECIMAL(10, 2) NOT NULL,
    manager_id INT
);
#1 Insert data
DELIMITER //
Create Procedure Insertemp
(IN p_fname varchar(50),
In p_lname varchar(50),
IN p_dept varchar(50),
IN p_salary  decimal(10,2),
In pmanager_id INt)
begin
Insert into employees (fname ,lname,dept,salary,manager_id) 
values(p_fname ,p_lname,p_dept,p_salary,pmanager_id);
end //
Delimiter $$

#2 GetEmployeebydept
DELIMITER //
Create Procedure GetEmployeebydept (IN p_dept varchar(50))
BEGIN
 Select * from employees
 where dept = p_dept;
END //
DELIMITER $$

#3 UpdateSalary
DELIMITER //
Create Procedure Updatesalary(
 p_empid INT,
 p_newsalary decimal(10,2)
)
begin
	Update employees
    Set 
    salary = p_newsalary
    where emp_id = p_empid;
end//
DELIMITER $$
Select * from employees

#4 Deleterecord
DELIMITER //
Create Procedure DeleteRecord(p_empid Int)
BEGIN
Delete from employees
where emp_id = p_empid;
END//
DELIMITER $$

Drop procedure DeleteRecord;

#5 Default values
DELIMITER //
Create  Procedure AddDefaultvalues(p_fname varchar(50) ,p_lname varchar(50),p_dept varchar(50)) 
begin
Insert into employees(fname,lname ,dept ,salary)
values (p_fname ,p_lname ,p_dept ,3000);
end //
DELIMITER $$

Drop procedure AddDefaultvalues;

Delete from employees
where emp_id =3

#6 Conditional logic 
DELIMITER //
CREATE PROCEDURE PromoteEmployee(
    IN p_empid INT
)
BEGIN
    UPDATE employees
    SET 
        salary = salary * 1.10
    WHERE emp_id = p_empid AND (salary < 5000 OR salary = 6000);
END //
DELIMITER ;

#7 Record with agregate
DELIMITER //
Create Procedure getavgsalary(In p_dept varchar(50)) 
deterministic 
begin
	Select avg(salary) from employees
    where dept = p_dept;
end//
DELIMITER $$
drop procedure getavgsalary;

select * from employees

#8 Min salary
DELIMITER //
Create Procedure Getemployeebycriteria (IN minsalary decimal(10,2) ,p_dept varchar(50))
deterministic
begin
Select dept ,fname ,lname from employees
where salary >= minsalary And dept = p_dept ;
end//
DELIMITER $$

drop Procedure Getemployeebycriteria

#9 Order by
DELIMITER //
Create Procedure GetAllEmployeesSorted(In SortedColumn varchar(50))
BEGIN
Select * from employees
order by dept ,salary;
End//
Delimiter $$ 
Drop procedure GetAllEmployeesSorted

#10 Transcation
DELIMITER //
Create Procedure Transferdepartment(In newemp_id Int ,newdept varchar(50))
Begin
Update employees
set dept = newdept
where emp_id = newemp_id;
End//
DELIMITER $$

Drop procedure Transferdepartment

#11 Safedelete employee
DELIMITER //
Create procedure Safedelete(In newemp_id Int) 
Begin
If EXISTS 
	(Select * from employees where emp_id = newemp_id)
    then 
     DELETE FROM employees WHERE emp_id = newemp_id;
        SELECT 'Successfully deleted' AS message;
	else 
    Select 'emp_id does not exists' As message;
    end IF;
end//
DELIMITER $$
Drop procedure Safedelete;
Select * from employees;
Select * from Department;
#12 Create table 
Create Table Department 
(
dept_id Int Primary key auto_increment,
dept_name varchar(50)
);
Insert into Department(dept_id ,dept_name)
values(1 ,"It"),(2 ,"Manager");

ALTER TABLE employees
ADD COLUMN dept_id INT,  
ADD CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE;

Insert into employees(emp_id,fname ,lname,dept,salary,manager_id,dept_id)
values(5,'Nisha','Shah' ,'Associate',10000,4,1)

Delete from employees
where emp_id =4

#Procedure for Joining Tables
DELIMITER //
Create Procedure GetEmployeedetails(In nemp_id Int)
BEGIN
Select emp_id,fname,dept_name from employees
INNER JOIN 
Department 
ON 
employees.dept_id = Department.dept_id
WHERE 
employees.emp_id = nemp_id;
End//
DELIMITER $$