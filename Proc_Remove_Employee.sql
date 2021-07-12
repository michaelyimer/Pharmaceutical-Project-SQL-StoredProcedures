alter proc usp_Remove_Employee
@Emp_Id nvarchar(10),
@Emp_Fname varchar(20),
@Emp_Lname varchar(20)

AS

BEGIN

delete from employee where Emp_Id = @Emp_Id and Emp_Fname = @Emp_Fname and Emp_Lname = @Emp_Lname

END