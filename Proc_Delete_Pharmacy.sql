alter proc usp_Remove_Pharmacy_By_Id

@Pharmacy_Id varchar(10)

AS
BEGIN
	declare @Ph_Id varchar(10) 
	set @Ph_Id = (select Pharmacy_Id 
				  from Pharmacy
				  where Pharmacy_Id = @Pharmacy_Id)
			if @Ph_Id is not null
				Begin
					alter table Pharmacy_Stock nocheck constraint all
					alter table Sold_Medicine nocheck constraint all
					--------  Making the child table not to check constraints 
					delete from Pharmacy where Pharmacy_Id = @Pharmacy_Id 
					-------- Making the child table not to check constraints 
					alter table Pharmacy_Stock check constraint all
					alter table Sold_Medicines check constraint all
					
				END 
END

Go

alter proc usp_Remove_Pharmacy_By_Name

@Pharmacy_Name varchar(20),
@Branch varchar(20)

AS
BEGIN

delete from Pharmacy where @Pharmacy_Name = Pharmacy_Name and @Branch = Branch


END

