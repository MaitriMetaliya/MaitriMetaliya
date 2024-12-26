Alter table employees
Add column Lastname varchar(100)  ; 

update employees set Lastname = 'shah' where emp_id = 106;
 

Select  * from employees;
Select emp_id ,name from employees;
Use bank_db;
Insert Into employees (name ,desig,dept)
values ('mm','asscoiate','deposite');

Select * from employees
where dept = 'Loan';

Select * from employees
where emp_id = 101;

Select emp_id , name from employees
where emp_id = 101 ;

update employees 
set  dept = 'IT'
where emp_id = 101;

DELETE Lastname FROM employees;

Alter table employees
ADD Column Salary INt Not null
Default 25000; 


select distinct(dept) from employees;

update employees set salary = 33000 where emp_id = 102;

Select * from employees
order by  salary desc ;

Select * from employees
where name LIKE "A%";

Select * from employees
where name LIke "____";

Select desig ,Count(emp_id) from employees group by desig;

Select emp_id ,name ,salary from employees
where Salary = (Select Max(Salary) from employees);

Select dept, Sum(Salary) from employees
group by dept;

Select Count(emp_id) from employees;

Select dept ,Count(emp_id) from employees
group by dept;

Select Min(Salary) from employees;

Select *from employees
where salary = (select Max(Salary) from employees);
select  MAX(Salary) from employees;

Select emp_id, name ,dept,Sum(Salary) from employees
where dept = "loan"
group by name ,emp_id ,dept;

Select  dept,desig, AVG(salary) from employees
group by dept ,desig;

select Max(salary) from employees
where salary < (Select Max(salary) from employees);

Select curdate();
Select  curtime();

Select date_format(Now() ,'%d/%m/%y');

Select date_format(Now() ,'%D');

Select date_format(Now() ,'%D %a');

Select datediff('2024-03-03','2024-02-03');

Select date_sub(Now() , interval 1 Year);

Select  date_format(Now() ,'%H:%M:%S');
Select date_format(Now(),'%y-%m-%d');
Select dayofweek(curdate());


Select * from employees
where salary > 33000