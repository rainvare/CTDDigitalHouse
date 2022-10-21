#REsolución Clase 2 - Adventure works 

#Where
#1
select * from contact where lastname like '_a%';

#2
select concat(firstName ,  ' ', LastName)  from contact where title in ('Mr.', 'Ms.');

#3 
select name 
from product 
where productnumber like 'AR%' OR productnumber like 'BE%' or productnumber like 'DC%';

#4
select * from contact 
where firstName like 'C%' 
and firstName not like '_O%'
and firstName not like '_E%';

#5
select * from product where listPrice between 400 and 500;

#6 
select * from employee where year(birthDate) between 1960 and 1980 
and year(birthdate) % 2 = 0;



#operadores and joins

#1 
select *  #BusinessEntityID, HireDate, VacationHours 
from employee e 
where year(hireDate)>= 2000;

#2 
select p.name, p.productNumber,p.listPrice ,p.listPrice * 1.1
from product p 
where p.SellEndDate < now();


#Group By
#1 
select year(birthdate), count(*) 
from employee 
group by year(birthdate);

#2 
select year(SellStartDate)
	, productID
	, avg(ListPrice) 
from product  
group by year(SellStartDate)
, productID;


#3 
Select productID, sum(lineTotal)
from salesorderdetail so 
group by productID ;

#4
Select SalesOrderID, sum(lineTotal)
from SalesOrderDetail sd 
group by SalesOrderID;

#Having
#1
Select 
	ProductSubcategoryID
    , sum(ListPrice)
from product  
where listPrice <= 200
group by ProductSubcategoryID 
having count(distinct productId) >= 2;

#2 
Select 
	ProductSubcategoryID
    , avg(listPrice)
from product  
where listPrice >=100 
group by ProductSubcategoryID 
having avg(listPrice) < 300;

#Joins

#1
Select p.name,  sod.linetotal
from SalesOrderDetail sod 
inner join product p 
	on sod.productId = p.productId 
where unitprice < listprice 
order by p.name asc;


#2 
select distinct  p.ProductID, p.name, p2.productId , p2.name, p.ListPrice
from product p 
inner join product p2 on p.ListPrice = p2.ListPrice
order by p.ListPrice desc;

#3
select p.Name, p.ProductID,  v.name
from product p 
inner join productVendor pv  on pv.productID = p.productId 
inner join vendor v on pv.vendorId  = v.vendorId 
order by v.name desc;


#4 
select c.FirstName, c.LastName , e.LoginID
from contact c 
left join employee e 
	on e.contactId = c.contactID 






