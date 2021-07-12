alter Proc usp_Search_Medicine 
@Name nvarchar(20)
AS
BEGIN

declare @Med_id nvarchar(10)
set @Med_id = (select Medicine_Id 
				from Medicine 
				where Medicine.Medicine_Name = @Name) 
/*				
declare @Medi_Id nvarchar(10)
set @Medi_id = (select Medicine_Id 
				from  Pharmacy_Stock
				where Pharmacy_Stock.Medicine_Id = @Med_id)
				*/
declare @Med_Name nvarchar(20)
set @Med_Name =  (select Medicine.Medicine_Name 
					from Medicine 
					where Medicine.Medicine_Id = @Med_Id)


	if @Med_Id is  not null 
			BEGIN
			           
			select Pharmacy_Stock.Quantitiy,@Med_Name as MedicineName, Pharmacy.* ,Medicine.*
					from Pharmacy_Stock 
					left join Pharmacy on Pharmacy_Stock.Pharmacy_Id = Pharmacy.Pharmacy_Id
					left join Medicine on Medicine.Medicine_Id = @Med_Id
					left join Medicine_Description on Medicine_Description.Medicine_Id = @Med_Id
					where Pharmacy_Stock.Medicine_Id = @Med_id
					


			
			END
   
		

END

select * from Pharmacy_Stock
select * from Medicine


EXec usp_Search_Medicine 'Medoprazole' 

exec usp_Dis



----------------------------------------------------------------
------------------- Model For Search Result --------------------

create Table Search_Med_Model 
(
Quantity int, 
Medicine_Name varchar(20)
,Pharmacy_Id varchar(20)
,Pharmacy_Name varchar(20)
,Address nvarchar (50)
,Branch varchar(20)
,Phone_Number varchar(15)
,Medicine_Id varchar(10)
,Brand varchar(20)
,Made_In varchar(20)
,Country_Of_Origin varchar(20)
,Category varchar(20)
,Manufactured_Date date
,Expiry_Date date
,Type varchar(10)
,Replaced_By varchar(50)
,Price money
)
