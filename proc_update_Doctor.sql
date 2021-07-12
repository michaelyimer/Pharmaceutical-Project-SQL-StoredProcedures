create proc usp_Update_Doctor
@Doctors_Id nvarchar(10), 
@Doctors_Fname nvarchar (20), 
@Doctors_Lname nvarchar (20), 
@Sex nvarchar (5), 
@Address nvarchar(20), 
@Phone_Number nvarchar (20), 
@HealthCenter_Id nvarchar (10)
AS
BEGIN
 
declare @check_ID varchar(10),@CheckH_ID nvarchar(10)

set @check_ID = (select Doctor_Id 
				from Doctors 
				where Doctor_Id = @Doctors_Id)
set @CheckH_ID = (Select Health_Center_Id 
				from Health_Center
				where Health_Center_Id = @HealthCenter_Id)
				
			if @check_ID is null 
				BEGIN
					if @CheckH_ID is not null 
						BEGIN
							update Doctors 
							set Doctor_Id = @check_ID, 
								Doctor_FName = @Doctors_Fname,
								Doctor_Lname =  @Doctors_Lname,
								Sex = @Sex,
								Address = @Address,
								Phone_Number = @Phone_Number,
								Health_Center_Id = @HealthCenter_Id 
						END
				END

END 