-- which medicine is being sold frequently in which pharmacy 

-- sold medicine

-- 
alter Proc usp_Frequency
AS
BEGIN
select Pharmacy_Name,Medicine.Medicine_Name, count(*) as Frequency 
from Sold_Medicines left join Pharmacy on Pharmacy.Pharmacy_Id = Sold_Medicines.Pharmacy_Id 
left join Medicine  on Medicine.Medicine_Id = Sold_Medicines.Medicine_Id 
  group by Pharmacy_Name,Medicine_Name
  order by count(*) desc

END

exec usp_frequency

