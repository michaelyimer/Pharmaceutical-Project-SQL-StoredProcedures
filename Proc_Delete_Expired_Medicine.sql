alter proc usp_Delete_Medicine_By_Id

@Medicine_Id nvarchar(10)

AS

BEGIN

declare @Medi_Id varchar(10)
set @Medi_Id = (select Medicine_Id 
				from Medicine
				where Medicine.Medicine_Id = @Medicine_Id)

		if @Medi_Id is not null 
		BEGIN
		    -------------------------------------------------------------------------
			insert into Forbiden_Medicines select Medicine.Medicine_Id 
											from Medicine
											where Medicine.Medicine_Id = @Medi_Id
			--------------------------making the child table not to check constraints -----------------------------------------------
			alter table Medicine_Description nocheck constraint all -- 
			alter table Pharmacy_Stock nocheck constraint all 
			alter table Sold_Medicines nocheck constraint all 
			alter table Feedback nocheck constraint all 
			-------------------------------------------------------------------------
			delete from Medicine where Medicine_Id = @Medi_Id
			--------------------------making the child table to check constraints -----------------------------------------------

			alter table Medicine_Description check constraint all -- 
			alter table Pharmacy_Stock check constraint all
			alter table Sold_Medicines check constraint all
			alter table Feedback check constraint all
		END
		
		Else
			select 'Invalid Medicine Id'

END
select * from Forbiden_Medicines

Go

alter proc usp_Delete_Medicine_By_Date

AS

BEGIN

delete from Medicine where Expiry_Date < getdate()

END

-------------------
create table Forbiden_Medicines
(
Medicine_Id varchar(10) references Medicine (Medicine_Id ) 
)