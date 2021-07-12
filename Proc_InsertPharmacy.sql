alter proc Add_Pharmacy
@Pharmacy_Name varchar(20),
@Branch varchar(20),
@Phone_Number varchar(15)

As
Begin
----Sustring the Minute from the current date to add as a postfix to the Pharmacy ID to make it unique
declare @DT varchar(20)
set @DT = (select getdate())
set @DT = (Select substring(@DT,16,2))
---Creating Pharmacy Id by conactinating Name, Phone number and Minute part of time
declare @Ph_Id varchar(10)
set @Ph_Id =  (select substring(upper(@Pharmacy_Name),1,3) + '-' + 
					  Substring(upper(@Phone_Number),1,3) + '-' + @DT
					  )
---Checking If The pharmacy is already Registerd 
declare @check_ID varchar(20)
set @check_ID = (select Pharmacy_Id from Pharmacy 
				where Pharmacy_Id = @Ph_Id)
---If not try to add the pharmacy with the given Information
		IF @check_ID is null 
			BEGIN

				declare @AddressMap varchar(max)
				set @AddressMap = 'https://www.google.com/maps/search/' + @Pharmacy_Name +  '+pharmacy+' + @Branch + '/@9.0337249,38.7446345,14z?hl=am'
				----------------------------------------------------------------------------------------------
				insert into Pharmacy values (@Ph_Id,@Pharmacy_Name,@AddressMap,@Branch,@Phone_Number)
		

			END

		ELSE 
			Select 'There is a pharmacy registerd with this information'
				
End
--------------------------------------------------------------------

-- trigger 
go

ALTER TABLE Pharmacy
ALTER COLUMN Address varchar(Max)


select * from Pharmacy

exec Add_Pharmacy 'Soloda2', 'Mexico', 925299709
