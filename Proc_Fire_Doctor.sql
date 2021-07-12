create table Fired_Doctor(
Doctors_Id nvarchar(10),
Doctor_Fname varchar(20),
Doctor_Lname varchar(20),
Sex varchar(6),
Address varchar(50),
Phone_number varchar(15),
Health_Center_Id varchar(10),
Date_Fired datetime)


GO

Alter proc usp_Fire_Doctor
@Doctor_Id varchar(10)

AS
BEGIN

declare @Check_Availability varchar(10)


set @Check_Availability = (select doctor_Id from Doctors where Doctor_Id = @Doctor_Id)

if @Check_Availability is not null

	begin
			
		insert into Fired_Doctor select *,getdate() from Doctors
		where Doctor_Id = @Check_Availability

		alter table Doctors_Prescription nocheck constraint all -- making the child table not to check constraints 
		
		delete from doctors where doctor_Id = @Check_Availability
		
		alter table doctors_Prescription check constraint all -- making the child table to check constraints 


	end
END

