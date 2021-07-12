Alter proc usp_Add_Medicine
@Medicine_Name varchar(20),
@Brand varchar(20),
@Made_In varchar(20),
@Country_Of_Origin varchar(max),
@Category varchar(20),
@Manufactured_Date date,
@Expiry_Date date,
@Type varchar(10),
@Replaced_By varchar(50),
@Price money,
-------------------------------------------------------------------
@Product_Description varchar(50)



AS
BEGIN
	select RTRIM(LTRIM(@Medicine_Name))
	select RTRIM(LTRIM(@Brand))
	select RTRIM(LTRIM(@Made_In))
    select RTRIM(LTRIM(@Country_Of_Origin))
	select RTRIM (LTRIM(@Category))
	select RTRIM(LTRIM(@Manufactured_Date))
	select RTRIM(LTRIM(@Expiry_Date))
	select RTRIM (LTRIM(@Type))
	select RTRIM(LTRIM(@Replaced_By))
	select RTRIM(LTRIM(@Price))



declare @Med_Id nvarchar(10)
set @Med_Id = (select substring(upper(@Brand),1,3) + '-' + 
					  Substring(upper(@Medicine_Name),1,3) + '-' + 
					  substring(upper(@Country_Of_Origin),1,2))

insert into Medicine values (@Med_Id, @Medicine_Name, @Brand, @Made_In, @Country_Of_Origin, @Category,
@Manufactured_Date, @Expiry_Date, @Type, @Replaced_By, @Price)
------------------------------------------------------------------------
DECLARE @URL nvarchar(max)
set @URL = 'https://www.drugs.com/search.php?searchterm=' + @Medicine_Name + '&a=1'

insert into Medicine_Description values (@Med_Id,@Product_Description,@URL)
-----------------------------------------------------------------------
END


exec usp_Add_Medicine 'Medoprazole','Ome','Indonesia','Brazil' , 'Stomach', '12-03-10','12-03-10','Anti Acid','non',154,'Used to reduce stomach acid'

select * from Medicine

select * from Medicine_Description


/*
Models
----------
ADD
---------
Medicine_Name 
Brand 
Made_In 
Country_Of_Origin 
Category 
Manufactured_Date date
Expiry_Date date
Type 
Replaced_By 
Price double
Product_Description 

Retrive
---------
Medicine_Name string
Brand string
Made_In string
Country_Of_Origin string 
Category string
Manufactured_Date date
Expiry_Date date
Type string
Replaced_By string
Price double string
Product_Description string 
full specification 
-----
Pharmacy Name
Pharmacy Address 
Branch
Phone Number
*/