use		Company_SD

--1
select *
from Employee

--2
select Fname, Lname, salary, Dno
from employee

--3
select *
from Project

--4
select Fname +' ' + Lname as [full name],salary * 0.10 as [ ANNUAL COMM ]
from Employee

--5
select SSN,  Fname +' ' + Lname as [full name] from Employee
where Salary > 1000

--6
select SSN,  Fname +' ' + Lname as [full name] from Employee
where Salary*12 > 10000

--7
select SSN,  Fname +' ' + Lname as [full name] from Employee
where Sex = 'f'

--8
select Dnum, Dname  from Departments
where MGRSSN= 968574

--9
select Pname, Pnumber, Plocation 
from Project 
where Project.Dnum = 10

--10
insert into Employee 
values ('Saleh','Mohammed',102672,1994-09-11,'alsharqyah','M',3000,112233,30)

--11
insert into Employee (Fname,lname,SSN,Bdate,address,Sex,Dno )
values ('Othan','omar',102660,1994-09-11,'Mandara','M',30)

--12
update Employee
set salary+= Salary*0.2
where ssn=102672

--Joins:

--1
select Dname,Dnum, Fname 
from Departments inner join Employee  on MGRSSN = SSN

--2
select Dname,Pname 
from Departments D inner join Project P on D.Dnum = P.Dnum

--3 
select D.*,E.Fname 
from Dependent D inner join Employee E on ESSN = SSn

--4
select Pname, Pnumber, Plocation, city 
from Project 
where city IN( 'cairo' ,'alex')

--5
select * 
from Project
where Pname like'a%'

--6
select * 
from Employee 
where Dno=30 and Salary between 1000 and 2000
 
--7
select  Fname+' '+Lname as fullNAme 

from Employee inner join Works_for on   SSN = ESSn  
   			  inner join Project   on	Pno=Pnumber	

where Pname = 'Al rabwah' and Hours>=10 and Dno =10

--8
select X.Fname+''+X.Lname as EmpName
from Employee X inner join Employee Y  on Y.SSN=X.Superssn
where y.Fname='kamel' and y.Lname='mohamed'

--9
select Fname ,Pname 
from Employee inner join Works_for on ESSn = SSN
              inner join project   on  Pno = Pnumber
order by Pname

--10
select Pnumber , Dname, Lname, Address, Bdate
from employee inner join Departments D on ssn = MGRSSN
              inner join Project P     on P.Dnum = D.Dnum 
where city = 'cairo'

--11
select M.* 
from employee m inner join Departments d on m.SSN = d.MGRSSN

--12
select * 
from employee e left join Dependent d on e.ssn=d.ESSN








   

