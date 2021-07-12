create proc usp_Review_Feedback

@M_Name varchar(20)

AS

BEGIN

	select Feedback from Feedback where @M_Name = Medicine_name
END

