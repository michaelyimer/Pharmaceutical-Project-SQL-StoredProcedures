ALTER proc usp_Update_patient
@PatientID nvarchar(10),
@Patients_Fname varchar(20),
@Patients_Lname varchar(20),
@sex varchar(5),
@DOB date, 
@Phone_Number int, 
@Address varchar(20),
@Alergy varchar(20)

as
begin

set @PatientID = LTRIM(RTRIM(@PatientId))
set @Patients_Fname = LTRIM(RTRIM(@Patients_Fname))
set @Patients_Lname = LTRIM(RTRIM(@Patients_Lname))
set @sex = LTRIM(RTRIM(@sex))
set @DOB = LTRIM(RTRIM(@DOB))
set @Phone_Number = LTRIM(RTRIM(@Phone_Number))
set @Address = LTRIM(RTRIM(@Address))
set @Alergy = LTRIM(RTRIM(@Alergy)) 

update Patients 
set Patient_Fname = @Patients_Fname, Patient_Lname = @Patients_Lname,
Sex = @sex, Date_Of_Birth = @DOB, Phone_Number = @Phone_Number, Address = @Address,
Alergy = @Alergy
where Patient_Id = @PatientID 


return
end