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

DELIMITER $$ 
Create Function get_sum(p_name Varchar(50)) Returns Varchar(50)
deterministic no sql reads sql DATA
begin
 declare v_max Int;
 declare v_name Varchar(50);
 Select Max(Salary) into v_max from employees;
 select  name into v_name from employees
 where salary = v_max;
 return v_name;
 End $$
 
 DELIMITER ;
 
 ##Window function
 select emp_id,dept,salary ,Sum(salary) over(partition by dept)
 as sum_salary
 from employees;
 
 
 select emp_id,dept,salary ,Max(salary) over(partition by dept)
 as sum_salary
 from employees;
 
 select 
 Row_number() over(order by salary) as row_no,
 emp_id,
 dept,
 salary  from employees



