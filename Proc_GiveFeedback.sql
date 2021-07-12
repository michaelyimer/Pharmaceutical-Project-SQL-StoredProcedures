alter proc usp_GiveFeedBack  
@Pa_ID varchar(10),
@Medicine varchar(10),
@Feedback nvarchar(100)
AS
BEGIN



set @Pa_ID = RTRIM(LTRIM(@Pa_ID))
set @Medicine = RTRIM(LTRIM(@Medicine))
set @Feedback = RTRIM(LTRIM(@Feedback))


Declare @PatientID varchar(20) 
set @PatientID = (Select Patient_Id 
						from Patients
						where Patient_Id = @Pa_Id)
Declare @PA_Name varchar(20)
set @PA_Name = (select top 1 Patients.Patient_Fname + ' ' + Patients.Patient_Lname
				from Patients
				where Patient_Id = @PatientID)

Declare @MedicineID varchar(20) 
set @MedicineID = (Select Medicine_Id
						from Medicine
						where Medicine_Id = @Medicine)

						
if @PatientID is not null 
	BEGIN
		  if @MedicineID is not null 
			BEGIN
				declare @Med_Name varchar(20)
				set @Med_Name = (Select Medicine_Name 
				from Medicine
				where Medicine_Id = @MedicineID)

				insert into Feedback values (substring (@PatientID,1,5) + substring (substring (cast( GETDATE() as varchar),13,17),1,5)
,@Med_Name ,@PA_Name ,@Feedback,GETDATE())
				
			END
			Else
				print 'no patientregisterd with this ID'
	END


END
exec usp_InsertComplaints 'Complaints on pharmacy', 'TAD-SAI590','Gishen','Mexico'
 
Exec usp_GiveFeedBack 'TAD-SAI590','OME-MED-BR','This medicine is not good, it has too many side effects'


select * from Feedback

exec usp_Review_Feedback '<e'


exec usp_Review_Feedback 'Medoprazole'




select * from Medicine






alter table Feedback check constraint all
alter table Feedback
alter column Feedback_Id  varchar(30)

select len(getdate())

select substring(cast)etdate(),20,3)

select datepart(month,getdate())

select SUBSTRING(cast(getdate()as varchar(30)),20,3)
------------------------------------------------




select substring (substring (cast( GETDATE() as varchar),13,17),1,5)








select cast (getdate() as varchar )

-------------------------------------------------
substring 

select cast(getdate() as varchar)
