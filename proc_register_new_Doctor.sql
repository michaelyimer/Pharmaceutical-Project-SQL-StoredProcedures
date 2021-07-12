alter proc usp_Register_Doctor 

@Doctors_Fname nvarchar (20), 
@Doctors_Lname nvarchar (20), 
@Sex nvarchar (5), 
@Address nvarchar(20), 
@Phone_Number nvarchar (20), 
@HealthCenter_Id nvarchar (10),
@Email nvarchar(100)
AS
BEGIN

declare @DT varchar(20)
set @DT = (select getdate())
set @DT = (Select substring(@DT,16,2))
---Creating Doctor Id by conactinating Name, Phone number and Minute part of time
declare @Do_Id varchar(10)
set @Do_Id =  (select substring(upper(@Doctors_Fname),1,3) + '-' + 
					  Substring(upper(@Doctors_Lname),1,3) + SUBSTRING((CAST(@Phone_Number AS varchar(20))),7,3)
					  )
declare @check_ID varchar(10),@CheckH_ID nvarchar(10)

set @check_ID = (select Doctor_Id 
				from Doctors 
				where Doctor_Id = @Do_Id)
set @CheckH_ID = (Select Health_Center_Id 
				from Health_Center
				where Health_Center_Id = @HealthCenter_Id)
				
			if @check_ID is null 
				BEGIN
					if @CheckH_ID is not null 
						BEGIN
							set @Doctors_Fname = (LTRIM(@Doctors_Fname))
							set @Doctors_Lname = (LTRIM(@Doctors_Lname))
							set @Sex = RTRIM(LTRIM(@Sex))
							set @Address = RTRIM(LTRIM(@Address))
							set @Phone_Number = RTRIM(LTRIM(@Phone_Number))
							set @HealthCenter_Id = RTRIM(LTRIM(@HealthCenter_Id))
							set @Email = RTRIM(LTRIM(@Email))

							 insert into Doctors 
							 values (@Do_Id, @Doctors_Fname,@Doctors_Lname,@Sex,@Address,@Phone_Number,@HealthCenter_Id )

							 insert into tbl_login_Doctor (username,email,password)values (@Doctors_Fname + @Doctors_Lname,@Email, (select substring(@Doctors_Fname,1,2) + 
							 substring(@Doctors_Lname,(select len(@Doctors_Lname)-1),(select len(@Doctors_Lname))) + substring(@Phone_Number,4,2) + SUBSTRING(@Phone_Number,9,2))) 

						END
				END

END
go


exec usp_Register_Doctor 'Tadesse','Saifu','Male','Yeka kifleketema','0910902590','BIR-091-59','Tadeee.ss@gmail.com' 

select * from Health_Center

select * from Doctors
select * from tbl_login_Doctor

GO

declare @DT varchar(20)
set @DT = (select getdate())
set @DT = (Select substring(@DT,16,2))
---Creating Doctor Id by conactinating Name, Phone number and Minute part of time
declare @Do_Id varchar(10)
set @Do_Id =  (select substring(upper('Henock'),1,3) + '-' + 
					  Substring(upper('Urgessa'),1,3) + SUBSTRING((CAST(0925299709 AS varchar(20))),7,3)
					  )
select @Do_Id

SELECT CAST(0925299709 AS varchar(20))

