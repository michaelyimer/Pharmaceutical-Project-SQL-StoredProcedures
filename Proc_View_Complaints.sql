alter proc usp_View_Complaint_By_Complaint_Id

@Com_Id varchar(10) = null,
@P_Id  varchar(10) = null
AS
BEGIN

 declare @CompID varchar(10)
 set @CompID = (select top 1 Complaints.Complaint_Id 
				from Complaints 
				where Complaints.Complaint_Id = @Com_Id)
 Declare @Pa_Id varchar(10)
 set @Pa_Id = (select top 1 Patient_Id 
				from Complaints
				where Complaints.Patient_Id = @P_Id )


	if @CompID is  not null 
		Begin
			select top 1 * from Complaints where Complaint_Id = @CompID
		END
	else if @Pa_Id is not null 
		BEGIN
			Select * from Complaints where Patient_Id = @P_Id 
		END
	else if @Pa_Id is null and @CompID is null
			Select * from Complaints
END

Go

exec usp_View_Complaint_By_Complaint_Id @com_Id = 'TA11:10 ' --@P_Id='TAD-SAI590' 








create proc usp_View_Complaint_By_Patient_Id

@P_Id int

AS
BEGIN

select * from Complaints where @P_Id = Patient_Id

End

