use FinalProject
GO
create proc usp_ViewStock
@Pharmacy_ID varchar(10),
@Branch int = 1
AS
BEGIN

set @Branch = RTRIM(LTRIM(@Pharmacy_Id))
set @Branch = RTRIM(LTRIM(@Branch))

	Declare @PH_ID varchar(10)
	set @PH_ID = ( select Pharmacy_Id 
					from Pharmacy_Stock
					where Pharmacy_Stock.Pharmacy_Id = @Pharmacy_ID )
	if (@PH_ID != null)
		Begin
				select * from Pharmacy_Stock 
				where  Pharmacy_Stock.Pharmacy_Id = @PH_ID 
			
		END
	else
		print 'Invalid Pharmacy ID'	
END
GO

/*
Models
------
View
----
Pharmacy_Id string
Medicine_Id string
Quantity int
*/



















