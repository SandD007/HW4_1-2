use [AdventureWorks2019]

--������� ��� ���������� �� ������� Sales.Customer
select * from Sales.Customer

--������� ��� ���������� �� ������� Sales.Store ��������������� 
--�� Name � ���������� �������
select * from Sales.Store order by [Name] asc

--������� �� ������� HumanResources.Employee ��� ����������
--� ������ �����������, ������� �������� ����� 1989-09-28
select top 10* from HumanResources.Employee where BirthDate > '1989-09-28'

--������� �� ������� HumanResources.Employee �����������
--� ������� ��������� ������ LoginID �������� 0.
--������� ������ NationalIDNumber, LoginID, JobTitle.
--������ ������ ���� ������������� �� JobTitle �� ��������
select NationalIDNumber, LoginID, JobTitle
from HumanResources.Employee
where right(LoginID, 1) = '0'
order by JobTitle desc

--������� �� ������� Person.Person ��� ���������� � �������, ������� ���� 
--��������� � 2008 ���� (ModifiedDate) � MiddleName ��������
--�������� � Title �� �������� �������� 
select * from Person.Person 
where year(ModifiedDate) = 2008 
and MiddleName like '%'
and Title not like '%' or Title is null

--������� �������� ������ (HumanResources.Department.Name) ��� ����������
--� ������� ���� ����������
--������������ ������� HumanResources.EmployeeDepartmentHistory � HumanResources.Department
select distinct d.Name
from HumanResources.EmployeeDepartmentHistory edh
inner join HumanResources.Department d on edh.DepartmentID = d.DepartmentID

--������������ ������ �� ������� Sales.SalesPerson �� TerritoryID
--� ������� ����� CommissionPct, ���� ��� ������ 0
select TerritoryID, sum(CommissionPct) as TotalCommission
from Sales.SalesPerson
group by TerritoryID
having sum(CommissionPct) > 0

--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ����� ������� ���-�� 
--������� (HumanResources.Employee.VacationHours)
select * from HumanResources.Employee
where VacationHours = (select max(VacationHours)from HumanResources.Employee)

--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ������� (HumanResources.Employee.JobTitle)
--'Sales Representative' ��� 'Network Administrator' ��� 'Network Manager'
select * from HumanResources.Employee
where JobTitle in ('Sales Representative', 'Network Administrator', 'Network Manager')

--������� ��� ���������� � ����������� (HumanResources.Employee) � 
--�� ������� (Purchasing.PurchaseOrderHeader). ���� � ���������� ���
--������� �� ������ ���� ������� ����!!!
select * from HumanResources.Employee
left join Purchasing.PurchaseOrderHeader
on HumanResources.Employee.BusinessEntityID = Purchasing.PurchaseOrderHeader.EmployeeID


