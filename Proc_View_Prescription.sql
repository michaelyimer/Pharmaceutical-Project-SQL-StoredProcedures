alter Proc usp_View_Prescription
@PrescriptionID nvarchar(20) = null,
@DocID nvarchar (20) = null,
@DocName nvarchar (20) = null,
@Pa_ID nvarchar (10) = null,
@Pa_Name nvarchar (20) = null
AS
BEGIN

set @PrescriptionID = RTRIM(LTRIM(@PrescriptionId))
set @DocID = RTRIM(LTRIM(@DocName))
set @DocName =RTRIM(LTRIM(@DocName))
set @Pa_ID = RTRIM(LTRIM(@Pa_Name))
set @Pa_Name = RTRIM(LTRIM(@Pa_Name))


declare @PreID nvarchar (20),@DoctorID nvarchar (20), @DoctorName nvarchar (20), 
@PatientID nvarchar (20),@PatientName nvarchar(20)
set @PreID = (select Prescription_Id 
				from Doctors_Prescription
				where Prescription_Id = @PrescriptionID)
set @DoctorID = (select Doctor_Id 
					from Doctors
					where Doctor_Id = @DocID) 

----------------------------------------------------------
	if @DoctorID is null 
		BEGIN
			Set @DoctorID = (select Doctors_Id 
							from Fired_Doctor
							where Doctors_Id = @DocID)
		END
-------------------------------------------------------

set @DoctorName = (select Doctor_Fname + Doctor_Lname
					from Doctors
					where Doctor_FName = @DocName)
set @PatientID = (select Patient_Id 
					from Patients
					where Patient_Id = @Pa_ID)
set @PatientName = (select Patient_FName + Patient_Lname
					from Patients
					where Patient_Fname = @PatientName)


if @PreID is not null 
	BEGIN 
		Select * From Doctors_Prescription 
		where Prescription_Id = @PreID
	END
else if @DoctorID is not null 
	Begin
		Select * From Doctors_Prescription 
		where Doctor_Id = @DocID
	END
else if @DoctorName is not null
	Begin
		declare @D_ID nvarchar (20)
		select @D_ID = Doctor_Id from Doctors
		Select * From Doctors_Prescription 
		where Doctor_Id = @D_ID 
	END
else if @PatientID is not null
	BEGIN
		Select * From Doctors_Prescription 
		where Patient_Id = @PatientID
	END
else if @PatientName is not null 
	BEGIN
		declare @P_Name nvarchar (20)
		select @P_Name = Patient_Fname from Patients

		Select * From Doctors_Prescription 
		where Patient_Id = @P_Name  
	END
END
GO

exec usp_View_Prescription @DocID= 5

exec usp_View_Prescription @DocName= a

exec usp_View_Prescription @DocID= 5



select * from Fired_Doctor

select Doctors_Id 
							from Fired_Doctor