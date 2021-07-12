Alter proc usp_Doctor_Login
@UserName varchar(20),
@Password varchar(max)
AS
BEGIN
 Declare @U_Name varchar(20)
 set @U_Name = (select username 
				from tbl_login_Doctor
				where username = @UserName)
 if @U_Name is not null 
	BEGIN
	if  @Password is not null
		BEGIN
		 Select username, Password
		 from tbl_login_Doctor
		 where username = @U_Name and password = @Password

		 END
	else 
		select 'Incorrect Password'

	END 
else 
	select 'Incorrect User Name'
END

select * from Medicine
select * from Medicine_Description
-------------------------------------------------------------------
GO

Alter Proc usp_Doctor_Change_Password
@Username varchar(20),
@Password varchar(30),
@Email varchar(30)
,@NewPassword varchar(max)
AS
BEGIN
--------------------------------------------------------------
	Declare @U_Name varchar(20)
	set @U_Name = (Select tbl_login_Doctor.username 
					from tbl_login_Doctor
					where tbl_login_Doctor.username = @Username)
--------------------------------------------------------------
	Declare @P_Word varchar(max)
	set @P_Word = (Select tbl_login_Doctor.password
					from tbl_login_Doctor
					where tbl_login_Doctor.password = @Password)
-------------------------------------------------------------
	Declare @Em_ail varchar(30)
	set @Em_ail = (Select tbl_login_Doctor.email 
					from tbl_login_Doctor
					where tbl_login_Doctor.email = @Email)
------------------------------------------------------------
	IF @U_Name is not null 
		BEGIN
			
			IF @P_Word is not null 
				BEGIN
						
						IF @Em_ail is not null
							BEGIN
								IF @P_Word = @NewPassword
									BEGIN 
										Select 'You can not use same password as the older'
									END
								ELSE
									BEGIN
										Update tbl_login_Doctor
										set password = @NewPassword
										where tbl_login_Doctor.username = @U_Name and password = @P_Word
									END
								 
							END

						ELse 
							Select 'Email confirmation failed'
				END
			Else 
				Select 'older password not correct'
		END
	Else
		Select 'User name is not correct'
		
END

select * from tbl_login_Doctor

exec usp_Doctor_Login 'TadesseSaifu','Tafu0990'

exec usp_Doctor_Change_Password 'TadesseSaifu','AbebeBikila','Tadeee.ss@gmail.com','AbebeBikil'



select Count(*) from sys.procedures

