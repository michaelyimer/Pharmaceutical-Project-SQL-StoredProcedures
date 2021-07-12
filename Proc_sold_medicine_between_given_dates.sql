create Proc usp_sold_medicine_between_given_dates
@date_from date,
@date_to date

As
Begin

select * from Sold_Medicines
where Date_Sold between @Date_from and @date_to
End 

select * from Sold_Medicines

exec usp_sold_medicine_between_given_dates '2020-01-01','2021-02-02'
