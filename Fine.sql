create proc usp_search_medicine
@name varchar(20)


AS
BEGIN

if @name is not null 

begin

select * from soloda 

dbo.

end
END

SELECT TABLE_NAME 
FROM [<DATABASE_NAME>].INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'

declare @PH_Tables nvarchar(max)
set @PH_Tables = (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
and 
TABLE_NAME != 'Fired_Doctor'
and 
TABLE_NAME != 'Complaint_Doctor'
and 
TABLE_NAME != 'tbl_login_Doctor'
and 
TABLE_NAME != 'tbl_login_Pharmacy'
and 
TABLE_NAME != 'tbl_login_gov'
and 
TABLE_NAME != 'employee'
and 
TABLE_NAME != 'Med_Des'
and 
TABLE_NAME != 'Pharmacy'
and 
TABLE_NAME != 'Patients'
and 
TABLE_NAME != 'Health_Center'
and 
TABLE_NAME != 'Medicine'
and 
TABLE_NAME != 'Doctors'
and 
TABLE_NAME != 'Complaints'
and 
TABLE_NAME != 'Doctors_Prescription'
and 
TABLE_NAME != 'Pharmacy_Stock'
and 
TABLE_NAME != 'Feedback'
and 
TABLE_NAME != 'Sold_Medicines'
and 
TABLE_NAME != 'sysdiagrams'
and 
TABLE_NAME != 'Medicine_Description'
and 
TABLE_NAME != 'Complaint_Counter'
)
 select @PH_Tables where  


 select * from @PH_Tables

 select * from Table_Schema 

 


go



exec usp_search_medicine 'Panadol'


go

Declare @Med_Name1 nvarchar(20) = 'Panadol', @Medi_Id1 varchar(10)


select Pharmacy_Stock.Quantitiy,@Med_Name1 as MedicineName, Pharmacy.* ,Medicine.*
from Pharmacy_Stock 
left join Pharmacy on Pharmacy_Stock.Pharmacy_Id = Pharmacy.Pharmacy_Id
left join Medicine on Medicine.Medicine_Id = @Medi_Id1
left join Medicine_Description on Medicine_Description.Medicine_Id = @Medi_Id1

select * from Medicine 


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






