alter proc usp_InsertComplaints
@Complaint varchar(100),
@Pa_Id varchar (20),
@Pharmacy_Name varchar (20),
@Branch varchar(20)
AS
BEGIN


declare @PharmacyName varchar (20)
set @PharmacyName = (select Pharmacy.Pharmacy_Name 
						from Pharmacy
						where Pharmacy.Pharmacy_Name = @Pharmacy_Name) 


Declare @PatientID varchar(20)
set @PatientID = (Select Patient_Id 
						from Patients
						where Patient_Id = @Pa_Id)

	if @PharmacyName != '' 
	begin
		if @PatientID is not null
		begin
			

			declare @C_id varchar(10)
			set @C_id = SUBSTRING(@PatientID,1,2) +   SUBSTRING (Cast(getdate() as varchar(20)),13,5) 

---------------------------------------------------------------------------------------------------------	--		
			declare @Count varchar(10)
			set @Count = (select Complaints.Complaint_Id 
							from Complaints
							where Complaints.Complaint_Id = @C_id)
---------------------------------------------------------------------------------------------------
			Declare @Ph_Name varchar(20)
			set @Ph_Name = (select top 1 Complaint_Counter.Pharmacy_Name 
							from Complaint_Counter
							where Complaint_Counter.Pharmacy_Name = @PharmacyName  )
------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------
						if @Count is not null 
							BEGIN
								select 'You cannot complaint more than one within 1 minute '
							END
						Else
							BEGIN

									Insert into Complaints (Complaint_Id,Patient_Id,Complaint,date,     Pharmacy_Name,  Branch)
									values ( @C_id,     @Pa_Id,     @Complaint,GETDATE(),@PharmacyName,  @Branch)

									IF @Ph_Name is null
										BEGIN
												
													insert into Complaint_Counter (Pharmacy_Name,No_Complaints) values 
														(@PharmacyName,1)

									    END
									ELSE
										BEGIN
											
											update Complaint_Counter
											set No_Complaints = No_Complaints + 1
													
											where Pharmacy_Name = @PharmacyName
										END
		End					END
	end 


END

insert into Complaint_Counter (Pharmacy_Name,No_Complaints) values 
('Soloda',((SELECT COUNT(Complaint_Counter.Pharmacy_Name)
	FROM Complaint_Counter
WHERE Complaint_Counter.Pharmacy_Name = 'Soloda') +1 ))






Go
alter table Complaints nocheck constraint all -- making the child table not to check constraints 
alter table Complaints 
alter column Branch varchar(20)



select * from Patients TAD-SAI590 
select * from Pharmacy Gishen 
select * from Complaints

select * from Complaint_Counter


exec usp_InsertComplaints 'Complaints on pharmacy', 'TAD-SAI590','Gishen','Mexico'
 

GO
			declare @C_id varchar(10)
			set @C_id = SUBSTRING('TAD-SAI590',1,2) +  SUBSTRING (cast (getdate() as varchar (20)) ,7,5) 
			select @C_id

			select SUBSTRING (cast (getdate() as varchar (20)) ,12,6) 

			select substring (cast(GETDATE() as varchar(20)),7,5)

			select
GO

Select * from Complaints

declare @PharmacyName varchar (20)
set @PharmacyName = (select Pharmacy_Name 
						from Pharmacy
						where Pharmacy_Name = 'Soloda')
select @PharmacyName

Select * from Pharmacy



DISABLE TRIGGER dbo.Trg_Complaints_Counter ON dbo.Complaints


-- trigger 
Go
alter trigger Trg_Complaints_Counter
On Complaints After Insert 
As
Begin
declare @ID int
set @ID = (select SCOPE_IDENTITY() as Last_Inserted_Pharmacy
				from inserted  )
Declare @Ph_Name varchar(20)
set @Ph_Name = (Select Pharmacy_Name
				from Pharmacy
				where Pharmacy_Id = @ID) 

declare @Ph_n varchar(20)
set @Ph_n = (select Pharmacy_Name
			from Complaint_Counter 
			where Pharmacy_Name = @Ph_n)
			
	if @Ph_n is null 
		BEGIN
insert into Complaint_Counter (Pharmacy_Name, No_Complaints)
			values (@Ph_Name,1 )
		END
	Else 
		BEGIN
		 update Complaint_Counter
		 set No_Complaints = (select No_Complaints 
								from Complaint_Conunter 
								where Pharmacy_Name = @Ph_n)
		where Pharmacy_Name = @Ph_n

		END






END
Go

 DROP TRIGGER Complaints_Counter

 delete from Complaint_Counter
