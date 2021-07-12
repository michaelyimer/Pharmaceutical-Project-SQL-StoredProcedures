create table employee(
Emp_Id nvarchar(10) primary key,
Emp_Fname varchar(20),
Emp_Lname varchar(20),
Permissions varchar(20))

GO


alter proc usp_Add_Employee
@Emp_Id nvarchar(10),
@Emp_Fname varchar(20),
@Emp_Lname varchar(20),
@Permissions varchar(20),
@Email varchar(30)
AS
BEGIN 

Set @Emp_Id = LTRIM(RTRIM(@Emp_Id))
set @Emp_Fname =  LTRIM(RTRIM(@Emp_Fname))
set @Emp_Lname =  LTRIM(RTRIM(@Emp_Lname))
set @Permissions =  LTRIM(RTRIM(@Permissions))
set @Email =  LTRIM(RTRIM(@Email))

--select substring (upper(@Emp_Fname),1,2) + '-' + substring (upper(@Emp_Lname),1,2) + substring (substring (cast( GETDATE() as varchar),13,17),1,5)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				insert into employee 
				values (substring (upper(@Emp_Fname),1,2) + '-' + substring (upper(@Emp_Lname),1,2) + substring (substring (cast( GETDATE() as varchar),13,17),1,5), 
						@Emp_Fname, @Emp_Lname, upper(@Permissions))
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				insert into tbl_login_Gov 
				values (substring (upper(@Emp_Fname),1,2) + '-' + substring (upper(@Emp_Lname),1,2) + substring (substring (cast( GETDATE() as varchar),13,17),1,5),
						substring (upper(@Emp_Fname),1,2) + '-' + substring (upper(@Emp_Lname),1,2) + '-' + SUBSTRING (@Permissions,1,3),
						@Email,
						(substring (upper('Urgessa'),1,2)  + '-' + substring (upper('Henok'),1,2)+  '-' + SUBSTRING ('ADMIN',1,3)),
						@Permissions)  
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			
END
--go
-----------------------------------------------
declare @Emp_ID varchar(20)
set @Emp_Id = '   Henok  '
set @Emp_ID = LTRIM(RTRIM(@Emp_Id))
select @Emp_Id



declare @username varchar(20)

-- set @username =  substring (upper(@Emp_Fname),1,2) + '-' + substring (upper(@Emp_Lname),1,2) + '-' + SUBSTRING (@Permissions,1,3)
select (substring (upper('Henok'),1,2) + '-' + substring (upper('Urgessa'),1,2) + '-' + SUBSTRING ('ADMIN',1,3))



select (substring (upper('Urgessa'),1,2)  + '-' + substring (upper('Henok'),1,2)+  '-' + SUBSTRING ('ADMIN',1,3))




create table tbl_login_gov(
Id varchar(30),
username varchar(20),
email varchar(30),
password varchar(max),
Emp_Role varchar(20))
