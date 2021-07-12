create proc usp_Add_HealthCenter
@Health_Center_Name varchar(20),
@Address varchar(50),
@Branch varchar(20),
@Phone_Number varchar(15),
@Email varchar (30)
AS
BEGIN

declare @DT varchar(20)
set @DT = (select getdate())
set @DT = (Select substring(@DT,16,2))
---Creating Health_Center Id by conactinating Name, Phone number and Minute part of time
declare @HC_Id varchar(10)
set @HC_Id =  (select substring(upper(@Health_Center_Name),1,3) + '-' + 
					  Substring(upper(CAst (@Phone_Number as varchar (20))),1,3) + '-' + @DT
					  )
----------------------------------------------------------------------------
declare @Pass varchar(10)
set @Pass =  (select substring(upper(@Health_Center_Name),1,3) + 
					  Substring(upper(CAst (@Phone_Number as varchar (20))),1,5) 
					  )
-----------------------------------------------------------------------------
Declare @Check_Id varchar(10)
set @Check_Id = (select Health_Center.Health_Center_Id
				from Health_Center
				where Health_Center.Health_Center_Id = @HC_Id)

----------------------------------------------------------------------------
 IF @Check_Id is null 
	BEGIN
	    -----------------------------------
		Insert into Health_Center values (@HC_Id,@Health_Center_Name,@Address,@Branch,@Phone_Number)
		----------------------------------
		Insert Into tbl_login_HC values (@HC_Id,@Email,@Pass)
	END

END
go


exec usp_Add_HealthCenter 'Biruk Hospital', 'Bisrat Gebriel','1','0911657651','BirukHospital@Gmail.com'

GO

select * from Health_Center

Select * from tbl_login_HC


/* 
Models 
-------
ADD
------
Health_Center_Name string
Address string
Branch string
Phone_Number string
Email string

Retrive
------------
Health_Center_Name string
Address string
Branch string
Phone_Number string
Email string


*/