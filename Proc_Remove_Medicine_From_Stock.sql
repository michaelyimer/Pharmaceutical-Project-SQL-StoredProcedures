create proc usp_Delete_Medicine_From_Stock
@Pharmacy_Id varchar(10),
@Medicine_Id varchar(10),
@Medicine_Name varchar(20)
AS
BEGIN
    declare @Medi_Id varchar(10)
	set @Medi_Id = (select Medicine_Id
					from Pharmacy_Stock 
					where Medicine_Id = @Medicine_Id)
	Declare @Medi_Id2 varchar(10)
	set @Medi_Id2 = (Select Medicine_Id 
					from Medicine 
					where Medicine_Name = @Medicine_Name )

	declare @PH_ID varchar(10)
	set @PH_ID = (select Pharmacy_Name
					from Pharmacy
					where Pharmacy_Id = @PH_ID)

	if @Medi_Id2 is not null  
		Begin
			Set @Medi_Id2 = (Select Medicine_Id
							 from Pharmacy_Stock
							 where Medicine_Id = @Medi_Id2)
		END
  
  if @PH_ID is not null 
	BEGIN 
		if @Medi_Id is not null 
			BEGIN 
				delete from Pharmacy_Stock 
				where Pharmacy_Id = @Pharmacy_Id and Medicine_Id = @Medicine_Id 
			END
		Else if @Medi_Id2 is not null 
			BEGIN
				delete from Pharmacy_Stock 
				where Pharmacy_Id = @Pharmacy_Id and Medicine_Id = @Medicine_Id 
			END
		else 
			print 'Invalid Medicine Name'
			
	END
   ELSE 
		Print 'Invalid Pharmacy Name'
END

