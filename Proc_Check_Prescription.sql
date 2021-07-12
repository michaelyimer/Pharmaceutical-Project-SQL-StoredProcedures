create proc usp_check_prescribed_medicine
@Pres_Id nvarchar(10)
as

begin

declare @Pa_ID nvarchar(10), @Pa_Name varchar (20)
set @Pa_ID = (Select Patient_Id 
				from Doctors_Prescription
				where Prescription_Id = @Pres_Id)


set @Pa_Name = (Select Patient_Fname
					from Patients
					where Patient_Id = @Pa_ID)


declare @Do_ID nvarchar(10), @DO_Name nvarchar(20)
set @Do_ID = (Select Doctor_Id
				from Doctors_Prescription
				where Prescription_Id = @Pres_Id)

set @DO_Name = (select Doctor_FName
				from Doctors
				where Doctor_Id = @Do_ID)

declare @HC_ID nvarchar(10), @HC_Name nvarchar(20)
set @HC_ID = (Select Health_Center_Id
				from Doctors_Prescription
				where Prescription_Id = @Pres_Id)

set @HC_Name = (select Health_Center_Name
				from Health_Center
				where Health_Center_Id = @HC_ID)



select Prescription_Id, (select @Pa_Name),(select @DO_Name), Medicine_Name,Special_Dosage,(select @HC_Name) 
from Doctors_Prescription 
where @Pres_Id = Prescription_Id



end

