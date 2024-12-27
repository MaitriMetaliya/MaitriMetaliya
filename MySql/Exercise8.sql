#Make table author and books 
Create Table Author
(
au_id Int auto_increment Primary key,
au_name varchar(50)
);
Drop table Books;
Create Table Books
(
book_id int auto_increment primary key,
tittle varchar(50),
ratings int,
au_id int,
foreign key (au_id) references Author(au_id) on delete cascade
);
Select * from Author;
Insert Into Author (au_name)
values('Raju'),('Sham'),('Alex');
Insert Into Author (au_name)
values('Paul');
Select * from books;
Insert into Books(tittle,ratings,au_id)
values('Story of raju',3,1),('Story of sham',4,2),('Alexa',5,3);

Insert into Books(tittle,ratings,au_id)
values('Rajuuu',3,2);

Select * from books;
select * from Author;

Select au_name ,tittle ,ratings from Author
Inner join Books
On books.au_id = Author.au_id
group by au_name ,tittle,ratings ; 


Select au_name ,tittle ,ratings from Author
Left join Books
On books.au_id = Author.au_id
group by au_name ,tittle,ratings ; 


Select au_name ,ifnull(tittle,'Not Found') As Title,ifnull(ratings,0) As Ratings from Author
Left join Books
On books.au_id = Author.au_id
group by au_name ,tittle,ratings ; 

Select au_name,ratings,
Case
When ratings >3 then 'Good'
else 'Average'
End As remark
from Author
Inner join Books 
On books.au_id = Author.au_id
group by au_name ,tittle,ratings ; 

