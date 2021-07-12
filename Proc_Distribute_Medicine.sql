Alter proc usp_Distribute_Medicine
@Pharmacy_Id varchar(10),
@Medicine_Id varchar(10),
@Quantity int 
AS
BEGIN
---Checking if the pharmacy Id is correct
Declare @PH_Id varchar(10)
set @PH_Id = (Select Pharmacy.Pharmacy_Id 
				from Pharmacy
				where Pharmacy_Id = @Pharmacy_Id)
-- checking if the Medicine Id is correct 
Declare @Med_Id varchar(10)
set @Med_Id = (Select Medicine.Medicine_Id 
				from Medicine
				where Medicine.Medicine_Id = @Medicine_Id)

	IF @PH_Id IS NOT NULL
		BEGIN
			
			IF @Med_Id is not null 
				BEGIN
					insert into Pharmacy_Stock select @PH_Id,Medicine.Medicine_Id,@Quantity from Medicine
					where Medicine.Medicine_Id = @Med_Id
				END
			
			ELSE
				Select 'Inavlid Medicine ID'
		END
	
	ELSE
		select 'Invalid Pharmacy ID'
		
END

select * from Medicine

exec usp_Distribute_Medicine 'GIS-925-58', 'OME-MED-BR' ,15

select * from Pharmacy_Stock

SOL-925-01
OME-MED-BR 
select * from Pharmacy
