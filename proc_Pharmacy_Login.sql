Alter proc usp_Pharmacy_Login
@UserName varchar(20)
,@Password varchar(max)

AS
BEGIN
 Declare @U_Name varchar(20)
 set @U_Name = (select username 
				from tbl_login_Pharmacy
				where username = @UserName)
 if @U_Name is not null 
	BEGIN
	if  @Password is not null
		BEGIN
		 Select username, Password
		 from tbl_login_Pharmacy
		 where username = @U_Name and password = @Password
		 END
	else 
		select 'Incorrect Password'

	END 
else 
	select 'Incorrect User Name'
END

Go
-------------------------------------------------------
create Proc usp_Pharmacy_Change_Password
@Username varchar(20),
@Password varchar(30),
@Email varchar(30)
,@NewPassword varchar(max)
AS
BEGIN
--------------------------------------------------------------
	Declare @U_Name varchar(20)
	set @U_Name = (Select tbl_login_Pharmacy.username 
					from tbl_login_Pharmacy
					where tbl_login_Pharmacy.username = @Username)
--------------------------------------------------------------
	Declare @P_Word varchar(max)
	set @P_Word = (Select tbl_login_Pharmacy.password
					from tbl_login_Pharmacy
					where tbl_login_Pharmacy.password = @Password)
-------------------------------------------------------------
	Declare @Em_ail varchar(30)
	set @Em_ail = (Select tbl_login_Pharmacy.email 
					from tbl_login_Pharmacy 
					where tbl_login_Pharmacy.email = @Email)
------------------------------------------------------------
	IF @U_Name is not null 
		BEGIN
			
			IF @P_Word is not null 
				BEGIN
						
						IF @Em_ail is not null
							BEGIN
								Update tbl_login_Pharmacy 
								set password = @NewPassword
								where tbl_login_Pharmacy.username = @U_Name and password = @P_Word
								 
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
