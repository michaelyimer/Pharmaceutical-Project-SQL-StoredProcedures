alter proc usp_Add_Prescription 
@DoctorID nvarchar(10),
@PatientID nvarchar(10),
--@HealthCeneterID nvarchar(10)
@MedicineName nvarchar(20),
@SpecialDosage nvarchar(50)

AS
BEGIN

select LTRIM(RTRIM (@DoctorID))
select LTRIM(RTRIM (@PatientID))
select LTRIM(RTRIM (@MedicineName))
select LTRIM(RTRIM (@SpecialDosage))
--select LTRIM(RTRIM (@HealthCeneterID))



declare @DocID nvarchar(10) 
set @DocID = (select Doctor_Id 
				from Doctors
				where Doctor_Id = @DoctorID)
--select @DocID = Doctor_Id from Doctors where Doctor_Id = @DoctorID
Declare @Pa_ID nvarchar (10)
set @Pa_ID = (Select Patient_Id 
			from Patients
			where Patient_Id = @PatientID)
Declare @Med_Name nvarchar (20)
set @Med_Name = (Select Medicine_Name	
				from Medicine
				where Medicine_Name = @MedicineName)

Declare @HCID nvarchar (20)
Set @HCID = (Select Health_Center_Id 
			from Doctors	
			where Doctors.Doctor_Id = @DocID)

	IF @DocID is not null 
		BEGIN

			IF @Pa_ID is not null
				BEGIN

					IF @Med_Name is not null
						BEGIN

							IF @HCID is not null
								BEGIN
									insert into Doctors_Prescription 
									--substring (@Pa_ID,1,5) + '-' + substring (@DocID,1,5) + substring (substring (cast( GETDATE() as varchar),13,17),1,5)
									values ( substring (@Pa_ID,1,2) + '-' + substring (@DocID,1,2) + 
											substring (substring (cast( GETDATE() as varchar),13,17),1,5),
											@DocID,@Pa_ID,@Med_Name,@SpecialDosage,@HCID,GETDATE())
								END
							else 
								print 'Health center Id is not correct'
						END
				END
		END
END