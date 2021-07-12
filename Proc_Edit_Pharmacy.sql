Create proc usp_Edit_Pharmacy

@Pharmacy_Id varchar(10),
@P_Name varchar(10),
@Location varchar(20),
@Branch varchar(20),
@Phone_number varchar(15)

AS
BEGIN

declare @Ph_ID nvarchar(10)
set @Ph_ID = (Select Pharmacy_Id 
			from Pharmacy 
			where Pharmacy_Id = @Pharmacy_Id)

if @Ph_ID is not null 

	BEGIN

		update Pharmacy 
		set Pharmacy_Name = @P_Name, Address = @Location , Branch = @Branch , Phone_Number =@Phone_number
		where Pharmacy_Id = @Pharmacy_Id

	END
END
