alter proc usp_Gov_Login
@UserName varchar(20)
,@Password varchar(max)
AS
BEGIN
 Declare @U_Name varchar(20)
 set @U_Name = (select username 
				from tbl_login_gov
				where username = @UserName)
 if @U_Name is not null 
	BEGIN
			if  @Password is not null
				BEGIN
					Select username, Password, tbl_login_gov.Emp_Role
					from tbl_login_gov 
					where username = @U_Name and password = @Password
				END
	else 
		select 'NULL' as Username, tbl_login_gov.password as Password
		from tbl_login_gov

	END 
else 
		select username as Username, 'NULL' as Password
		from tbl_login_gov
   if @U_Name is null and @Password is null
		BEGIN
			Select 'NULL' as username, 'NULL' as password
		END
END
-------------------------------------------
GO
create Proc usp_Gov_Change_Password
@Username varchar(20),
@Password varchar(30),
@Email varchar(30)
,@NewPassword varchar(max)
AS
BEGIN
--------------------------------------------------------------
	Declare @U_Name varchar(20)
	set @U_Name = (Select tbl_login_gov.username 
					from tbl_login_gov
					where tbl_login_gov.username = @Username)
--------------------------------------------------------------
	Declare @P_Word varchar(max)
	set @P_Word = (Select tbl_login_gov.password
					from tbl_login_gov
					where tbl_login_gov.password = @Password)
-------------------------------------------------------------
	Declare @Em_ail varchar(30)
	set @Em_ail = (Select tbl_login_gov.email 
					from tbl_login_gov
					where tbl_login_gov.email = @Email)
------------------------------------------------------------
	IF @U_Name is not null 
		BEGIN
			
			IF @P_Word is not null 
				BEGIN
						
						IF @Em_ail is not null
							BEGIN
								Update tbl_login_gov
								set password = @NewPassword
								where tbl_login_gov.username = @U_Name and password = @P_Word
								 
							END

						ELse 
							Select 'Email confirmation faild'
				END
			Else 
				Select 'older password not correct'
		END
	Else
		Select 'User name is not correct'
		
END


/* 
Models 
-------
Login
------
Username string 
Password stirng
Permission string

Update
------------
Username string
Password string
Email string
NewPassword string

*/