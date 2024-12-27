DELIMITER $$
Create Procedure emp_info() 
begin
select * from employees order by salary;
End$$
DELIMITER ;

DELIMITER $$
Create Procedure get_empid( p_name varchar(50)) 
begin
select * from employees
where name = p_name;
End$$
DELIMITER ;
call get_empid("raju");


DELIMITER $$
Create Procedure get_sum_by_dept(IN p_dept varchar(100),OUT p_sum decimal(10,2)) 
begin
select SUm(salary) into p_sum from employees
where dept = p_dept;
End$$
DELIMITER ;
Select * from employees;

#Functions
