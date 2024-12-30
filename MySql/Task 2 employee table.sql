#fullname
DELIMITER $$
Create Function get_fullname(name varchar (50), Lastname varchar(100))
returns varchar(50)
deterministic
begin
	return Concat(name ,Lastname);
end $$
DELIMITER ;

#Leap year
DELIMITER $$
Create function is_leap_year(year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    IF (year % 4 = 0 AND (year % 100 != 0 OR year % 400 = 0)) THEN
        RETURN 1; 
    ELSE
        RETURN 0; 
    END IF;
END$$
DELIMITER ;


#sp
DELIMITER $$
Create Procedure get_all_salary( salary INT)
begin

end
