#fullname
DELIMITER $$
Create Function get_fullname(name varchar (50), Lastname varchar(100))
returns varchar(50)
deterministic
begin
	return Concat(name ,Lastname);
end $$
DELIMITER ;

