Create database Stores;
use Stores;
#Custmores
Create Table custmores
(
cust_id Int auto_increment primary key,
name varchar(50),
email varchar(5)
);

Alter Table custmores
modify email varchar(50);

desc custmores;

#order
Create Table orders
(
ord_id int auto_increment primary key,
date date,
amount decimal(10,2),
cust_id int ,
Foreign key (cust_id) references custmores(cust_id) On delete cascade
);
desc orders;

Insert into custmores (name,email)
values("Raju","raju@"),
("Paul","paul@");

Insert into custmores (name,email)
values("Alex","alex@gmail.com");
Update custmores 
set email = "raju@gmail.com"
where email = "raju@";

Update custmores 
set email = "paul@gmail.com"
where email = "paul@";
Select * from custmores;

Insert into orders (date ,amount,cust_id)
values(curdate() ,300,1);
Insert into orders (date ,amount,cust_id)
values(curdate() ,500.50,3);
select * from orders;
#Cross join
Select * from custmores , orders;

#Inner join

Select name ,SUM(amount) from custmores
Inner join orders 
on orders.cust_id = custmores.cust_id
group by name ,amount;

#left join

Select name ,ifnull((amount),0) from custmores
Left join orders 
on orders.cust_id = custmores.cust_id
group by name ,amount;

#Right join
Select * from orders
Right join custmores
on orders.cust_id = custmores.cust_id;

Drop table orders;

#delete cascade
Delete  from custmores
where name = "Raju";

Select emp_id, name ,dept,Sum(Salary) from employees
where dept = "loan"
group by name ,emp_id ,dept;

use bank_db;

Select dept ,Count(name) from employees
group by dept