use [AdventureWorks2019]

--Вывести всю информацию из таблицы Sales.Customer
select * from Sales.Customer

--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
select * from Sales.Store order by [Name] asc

--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
select top 10* from HumanResources.Employee where BirthDate > '1989-09-28'

--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
select NationalIDNumber, LoginID, JobTitle
from HumanResources.Employee
where right(LoginID, 1) = '0'
order by JobTitle desc

--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
select * from Person.Person 
where year(ModifiedDate) = 2008 
and MiddleName like '%'
and Title not like '%' or Title is null

--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
select distinct d.Name
from HumanResources.EmployeeDepartmentHistory edh
inner join HumanResources.Department d on edh.DepartmentID = d.DepartmentID

--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
select TerritoryID, sum(CommissionPct) as TotalCommission
from Sales.SalesPerson
group by TerritoryID
having sum(CommissionPct) > 0

--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
select * from HumanResources.Employee
where VacationHours = (select max(VacationHours)from HumanResources.Employee)

--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
select * from HumanResources.Employee
where JobTitle in ('Sales Representative', 'Network Administrator', 'Network Manager')

--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
select * from HumanResources.Employee
left join Purchasing.PurchaseOrderHeader
on HumanResources.Employee.BusinessEntityID = Purchasing.PurchaseOrderHeader.EmployeeID


