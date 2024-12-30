Create Database Order_db;
Use order_db;
#1Table Creation and Constraints
Create Table orders
(
order_id INT auto_increment primary key,
c_name Varchar(50) NOT NULL,
order_date Datetime,
 enum('Pending','shipped','Deliverd') default 'Pending',
total_amount decimal(10,2) Default 0,
discount INT CHECK (discount BETWEEN 0 AND 50),
shipping_adress  varchar(250) Null
);

Alter Table orders
Add column discount INT CHECK (discount BETWEEN 0 AND 50);

#2. Insert Data
Select * from orders;
Insert into orders
(c_name,order_date,status ,total_amount,discount,shipping_adress)
values
('Raju','2024-07-01 15:20:00','Shipped',490,5,'Thaltej'),
('Shamu','2024-09-01 15:20:00','Deliverd',490,0,'Thaltej'),
('Alex','2024-03-12 1:20:00','Pending',300,10,'sarkhej'),
('Gopi','2024-02-01 12:20:00','Shipped',3500,20,'ahemdabad'),
('Rashi','2024-06-12 6:20:00','Deliverd',900,50,'Memnagar');
Insert into orders
(order_id,c_name,order_date,status ,total_amount,discount,shipping_adress)
values
(101,'Paul','2024-07-01 15:20:00','Shipped',490,5,'Thaltej');
Insert into orders(c_name,discount)
values('Paul',0),('Alex',10),('Shamu',25),('Alex',50),('Gopi',0),('Rashi',5);
#3  Null and Not Null
Select * from orders
where shipping_adress = null;
Select * from orders
where c_name Is Not null;

#4  Default Values
Select * from orders 
where status = 'Pending';
Select * from orders
where total_amount = 0;

#5. Primary Key
Insert into orders(order_id)
values(101);

#6. Use of Alias
Select c_name as customer ,total_amount as amount ,order_date as date
from orders;

#7Use of CONCAT and String Functions
Select  CONCAT(c_name , ' ' ,status) as order_summary from orders;  
Select c_name ,LENGTH(c_name)  from orders;

#8Datetime
Select * from orders
where Year(order_date) = 2024;

Select * from orders
where Date_sub(curdate() ,interval 30 day);

#9
Select c_name , status , SUM(total_amount) from orders
group by c_name ,status;

Select c_name ,status ,SUM(total_amount) from orders
group by c_name ,status
having SUM(total_amount) >300;

#10
Select * from orders
order by order_date DESC;

Select * from orders
order by total_amount ;

#11
Select * from orders
where total_amount >100 or discount > 20 ;

#12
Select * from orders
where total_amount > 100 And status = 'shipped';

#13
Select * from orders
where discount = 10 or discount=  20;

#14
Alter Table orders
Modify shipping_adress  varchar(250) Null  Unique;

#15 
Insert Into orders 
(c_name ,discount)
values('Manya',70);

#16
Create Table customers 
(
Cust_id Int auto_increment primary key,
cust_name varchar(100),
email varchar(100),
phone_number varchar(12)
);
Insert Into customers  (cust_name ,email,phone_number)
values('raju','raju@gmail.com','1090190911'),
('shamu','shamu@gmail.com',123456789),
('foo','foo@gmail.com','987654321');

Insert Into orders(Cust_id)
values(1),(2),(3),(4),(1),(3);
Select * from customers ;
Select * from orders;

#
ALTER TABLE orders
Add column Cust_id INT,
ADD CONSTRAINT 
FOREIGN KEY (Cust_id) REFERENCES customers(Cust_id)
ON DELETE CASCADE;  

Drop Table customers;
Update  orders
set  Cust_id =1
where Cust_id = Null;

Select order_id,cust_name,email,phone_number from customers
inner join  orders on orders.Cust_id = customers.Cust_id
group by order_id,cust_name,email,phone_number ;
 
ALTER TABLE orders
DROP COLUMN c_name;
Select * from orders;
Select * from customers;
Insert Into  orders (Cust_id)
values (101),(101),(102),(103);

Delete from orders
where order_id =114;
 Update orders
 set Cust_id = 1
 where Cust_id = NULL;
 
 #18
DELIMITER $$
CREATE FUNCTION calculate_final_amount(order_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE original_amount DECIMAL(10, 2);
    DECLARE discount_percentage DECIMAL(5, 2);
    DECLARE final_amount DECIMAL(10, 2);
    SELECT amount, discount
    INTO original_amount, discount_percentage
    FROM orders
    WHERE order_id = order_id;
    SET final_amount = original_amount - (original_amount * discount_percentage / 100);
    RETURN final_amount;
END$$
DELIMITER ;

#19
DELIMITER $$
Create Procedure get_status(IN order_status varchar(50))
begin
Select order_id,total_amount ,discount,Cust_id,Status
where status = order_status;
end$$
DELIMITER ;


