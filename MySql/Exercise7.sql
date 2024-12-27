#1find salary between this
select * from employees
where salary between 30000 and 40000;
#2
select * from employees
where name Like 'R%' or 'S%';
#3
Select * from employees
where salary = 25000 and dept ='Loan';

#4
Select * from employees
where desig In('Manager','Lead','Associate');

#5
Select name ,salary,
case
when salary !=0 then salary/80
end as 'salary in doller'
from employees;