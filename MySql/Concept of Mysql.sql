#1 Relational operator
Use bank_db;
Select * from employees;
#And Operator
Select * from employees
where name = 'Paul' And dept = 'Loan';
#Or operator
Select * from employees
where desig = 'Manager' or name='Paul';
#In and Not in insert
select * from employees
where dept in('IT','Loan','Account');

select * from employees
where dept Not In('IT','Loan','Account');

#between 
Select * from employees
where Salary between 43000 And 73000; 

#Case ex1
Select name ,
salary ,
case 
when salary >43000 then 'Higher salary'
else 'Lower salary'
end as 'salary category'
from employees;

#Case ex2
select name ,salary,
case 
when salary >= 45000 then 'higher salary'
when salary >=40000 then 'Midd salary'
else 'Lower salary'
end as 'salry category'
from employees;