Create proc usp_View_Pharmacy_By_Id 
@Pharmacy_Id varchar(10)
AS
BEGIN
	declare @PH_ID varchar(10)
	set @PH_ID = (select Pharmacy.Pharmacy_Id
					from Pharmacy
					where Pharmacy.Pharmacy_Id = @Pharmacy_Id )
	IF @PH_ID is not null
		BEGIN
			Select * from Pharmacy
			where Pharmacy.Pharmacy_Id = @PH_ID
		END
	ELSE 
		select 'Inavlid Pharmacy ID'
	
	
END

select * from Medicine

select * from Pharmacy_Stock
PH id          med id      pa Id        
SOL-925-01 - OME-MED-BR		TAD-SAI590 

exec usp_Sell_Medicine 'Panadol','OME-MED-BR','TAD-SAI590','TA-HE11:52','SOL-925-01'


select * from Patients

@Patients_Fname varchar(20),
@Patients_Lname varchar(20),
@sex varchar(5),
@DOB date, 
@Phone_Number int, 
@Address varchar(20),
@Alergy varchar(20)

Exec usp_Register_new_patient 
'Tadesse','Saifu','Male','1998-02-26', 910902590,'Kirkos kifleketema','Henok'

select * from Health_Center BIR-091-59 

select * from Doctors HEN-URG970 

exec usp_Add_Prescription 'HEN-URG970','TAD-SAI590','Panadol','Take 5 times per day','BIR-091-59'

select * from Doctors_Prescription TA-HE11:52 



exec usp_Sell_Medicine 'Medoprazole','OME-MED-BR','TAD-SAI590','TA-HE11:52','SOL-925-01'

select * from Pharmacy_Stock

Select * from Medicine

select * from Sold_Medicines

delete from Sold_Medicines where Prescription_ID = 'TA-HE11:52'
