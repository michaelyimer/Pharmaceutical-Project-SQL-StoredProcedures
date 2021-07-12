Create proc usp_Register_new_patient

@Patients_Fname varchar(20),
@Patients_Lname varchar(20),
@sex varchar(5),
@DOB date, 
@Phone_Number int, 
@Address varchar(20),
@Alergy varchar(20)

As
Begin
---Creating Patient Id by conactinating Name, Phone number and Minute part of time
	Declare @Pa_Id varchar(10)
	set @Pa_Id =  (select substring(upper(@Patients_Fname),1,3) + '-' + 
					  Substring(upper(@Patients_Lname),1,3) + SUBSTRING((CAST(@Phone_Number AS varchar(20))),7,3)
					  )
-----------------Checking if the patient is already registerd--------------------------------------------------------------
	DEclare @Check_Id varchar(10)
	set @Check_Id = (Select Patients.Patient_Id
					from Patients
					where Patient_Id = @Pa_Id)
-------------------------------------------------------------------------------
	IF @Check_Id is null 
		BEGIN 
			Insert into Patients values (@Pa_Id,@Patients_Fname,@Patients_Lname,
										@sex,@DOB,@Phone_Number,@Address,@Alergy) 
		END
	ELSE
		Select 'There is a patient already register with this information'
-------------------------------------------------------------------------------
END

/* 
Models 
-------
ADD
------
Patients_Fname string  
Patients_Lnam string
Sex string string 
DOB date
Phone_Number string
Address string
Alergy string 

Retrieving
------------
Patients_Id string 
Patients_Fname string  
Patients_Lnam string
Sex string string 
DOB date
Phone_Number string
Address string
Alergy string 

*/