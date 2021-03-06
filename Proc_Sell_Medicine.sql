USE [FinalProject]
GO
/****** Object:  StoredProcedure [dbo].[usp_Sell_Medicine]    Script Date: 12/10/2020 2:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[usp_Sell_Medicine]
@Medicine_Name nvarchar(20) = null,
--@Medicine_Id nvarchar(10) = null,
@Patient_Id nvarchar (20) = null,
@Prescription_ID nvarchar (10),
@Pharmacy_ID nvarchar (10),
@Qty int
AS
BEGIN

 set @Medicine_Name = RTRIM(LTRIM(@Medicine_Name))
 --set @Medicine_Id = RTRIM(LTRIM(@Medicine_Id))
 set @Patient_Id = RTRIM(LTRIM(@Patient_Id))
 set @Prescription_ID = RTRIM(LTRIM(@Prescription_Id))
 set @Pharmacy_ID = RTRIM(LTRIM(@Pharmacy_ID))

	declare @Med_ID nvarchar(20)
	set @Med_ID = (select Medicine_Id 
					from Medicine
					where Medicine_Name = @Medicine_Name )
					
	declare @Medi_ID nvarchar (20)
	set @Medi_ID = (select Medicine_Id
					from Pharmacy_Stock
					where Medicine_Id = @Med_ID)

	Declare @Pre_Id varchar (10)
	set @Pre_Id = (select Sold_Medicines.Prescription_ID 
					from Sold_Medicines
					where Sold_Medicines.Prescription_ID = @Prescription_ID)
if @Medi_ID is not null 
	BEGIN 

	if @Pre_Id is not null

			BEGIN
					SELECT 'you can not buy same medicine more than once '
			END
	else 
		BEGin

			if (select Top 1 Quantitiy 
				from Pharmacy_Stock 
				where Medicine_Id = @Medi_ID and Pharmacy_Id = @Pharmacy_ID) = @Qty-- if the medicine in the store left 1 
			
			Begin
			-- moving a medicine from pharmacy stock to sold medicines and making the madicine unavailable for pharmacy stock 
				insert into Sold_Medicines (Prescription_ID,Patient_Id,Pharmacy_Id,Medicine_Id,Date_Sold) 
				select top 1 @Prescription_ID,@Patient_Id,@Pharmacy_ID, Medicine_Id ,Getdate()
				from Medicine
				where Medicine_Id = @Medi_ID 

				delete from Pharmacy_Stock 
				where Medicine_Id = @Medi_ID and Pharmacy_Id = @Pharmacy_ID
			END
		else 
			BEGIN
			-- if the medicine in the store is morethan 1 insert the medicine to sold medicine and update qunatity on the pharmacy stock table
				insert into Sold_Medicines (Prescription_ID,Patient_Id,Pharmacy_Id,Medicine_Id,Date_Sold) 
				select @Prescription_ID,@Patient_Id,@Pharmacy_ID, Medicine_Id,Getdate() 
				from Medicine
				where Medicine_Id = @Medi_ID 

				update Pharmacy_Stock 
				Set Quantitiy = (Quantitiy) - @Qty
				where Medicine_Id = @Medi_ID and Pharmacy_Id = @Pharmacy_ID
			END

		END

	END


END


select * from Sold_Medicines 

alter table Sold_Medicines
add Qty int

select * from Pharmacy_Stock
