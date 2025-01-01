Use employee
#1
DELIMITER $$
Create Function mysqlfunction(input_string varchar(50)) 
Returns INT
deterministic no sql reads sql DATA 
Begin
 return length(input_string);
end
#2Convert the string 'mysql functions' to uppercase.
DELIMITER $$
Create Function Uppercase (input_string varchar(50))
returns varchar(50)
deterministic
Begin
return Upper(input_string);
end
#3Trim extra spaces from ' Hello, MySQL! '.
DELIMITER $$
Create Function Trimfun(input_string varchar(50))
returns varchar(50)
deterministic
Begin
return Trim(input_string);
end

#4Concatenate the first name and last name of an employee using the CONCAT function.
DELIMITER $$ 
Create Function Concatefu(fstring varchar(50),lstring varchar(50))
returns varchar(50)
deterministic
begin
return Concat(fstring ,lstring);
end
#5 Use CONCAT_WS to join 'First Name', 'Last Name', and 'Email' with a comma separator.
DELIMITER $$
Create Function ConcatWs(fname varchar(50),lname varchar(50),iemail varchar(50))
returns varchar(50)
deterministic
begin
Declare ConcatString varchar(50);
Set ConcatString = Concat_ws(',' ,fname,lname,iemail);
return ConcatString;
end

#6 total slaary of emoloyees
delimiter $$
Create Function SumSalary(ifname varchar(50))
returns decimal(10,2)
deterministic
begin
declare sumsalary decimal(10,2);
Select SUM(salary) Into sumsalary  from employees
where fname = ifname ;
return sumsalary;
end;
Drop function AvgSalary;
Select * from employees

#7 Avg salary
DELIMITER $$
Create Function Avgsalary(ifname varchar(50))
returns decimal(10,2)
deterministic
begin
Declare avg_salary decimal(10,2);
Select AVG(salary) into avg_salary from employees
where fname = ifname ;
return avg_salary;
end

#8 Count number

DELIMITER $$
Create Function Countdept(pdept varchar(50))
returns Int
deterministic 
begin
declare count_dept int;
Select Count(dept) Into count_dept from employees
where dept = pdept;
return count_dept;
end

#9 find max and min salary
DELIMITER $$
Create Function MAX_MINSALARY()
returns varchar(50)
deterministic
begin
declare max_salary decimal(10,2);
declare min_salary decimal(10,2);
declare result varchar(50);
Select MAX(salary)  , MIN(salary) into max_salary ,min_salary from employees;
Set result = CONCAT('Max salary :', max_salary ,'Min salary :' , min_salary);
return result;
end 

#10 Conditional 
DELIMITER $$
CREATE FUNCTION HighestSalary()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE max_salary DECIMAL(10,2);
    DECLARE message VARCHAR(50);
    SELECT MAX(salary) INTO max_salary FROM employees;
    IF max_salary > 5000 THEN
        SET message = 'Highest salary';
    ELSE
        SET message = 'Lowest salary';
    END IF;
    
    RETURN message;
END$$

DELIMITER ;

#11
DELIMITER $$
CREATE FUNCTION CreateJsonObject() 
RETURNS JSON
DETERMINISTIC
BEGIN
    RETURN JSON_OBJECT('name', 'John', 'age', 30, 'city', 'New York');
END;



