create proc usp_HC_Login
@UserName varchar(20),
@Password varchar(max)
AS
BEGIN
 Declare @U_Name varchar(20)
 set @U_Name = (select tbl_login_HC.Username 
				from tbl_login_HC
				where tbl_login_HC.username = @UserName)
 if @U_Name is not null 
	BEGIN
	if  @Password is not null
		BEGIN
		 Select username, Password
		 from tbl_login_HC
		 where username = @U_Name and password = @Password

		 END
	else 
		select 'Incorrect Password'

	END 
else 
	select 'Incorrect User Name'
END


-------------------------------------------------------------------
GO

Create Proc usp_HC_Change_Password
@Username varchar(20),
@Password varchar(30),
@Email varchar(30)
,@NewPassword varchar(max)
AS
BEGIN
--------------------------------------------------------------
	Declare @U_Name varchar(20)
	set @U_Name = (Select tbl_login_HC.username 
					from tbl_login_HC
					where tbl_login_HC.username = @Username)
--------------------------------------------------------------
	Declare @P_Word varchar(max)
	set @P_Word = (Select tbl_login_HC.password
					from tbl_login_HC
					where tbl_login_HC.password = @Password)
-------------------------------------------------------------
	Declare @Em_ail varchar(30)
	set @Em_ail = (Select tbl_login_HC.email 
					from tbl_login_HC
					where tbl_login_HC.email = @Email)
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
										Update tbl_login_HC
										set password = @NewPassword
										where tbl_login_HC.username = @U_Name and password = @P_Word
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


/* 
Models 
-------
Login
------
Username string 
Password stirng

Update
------------
Username string
Password string
Email string
NewPassword string

*/