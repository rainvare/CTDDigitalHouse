# Clase 2 - Camada 1 - BD2
use adventureworks;

#Select 
select * 
from address  a 
inner join stateProvince sp 
	on a.StateProvinceId = sp.StateProvinceId;


#Where 
select * 
from address  a 
inner join stateProvince sp 
	on a.StateProvinceId = sp.StateProvinceId
where sp.stateProvinceId = 79;


#Order by 
select * 
from address  a 
inner join stateProvince sp 
	on a.StateProvinceId = sp.StateProvinceId
where sp.stateProvinceId = 79
order by AddressLine1 desc ;

#Limit 
select * 
from address  a 
inner join stateProvince sp 
	on a.StateProvinceId = sp.StateProvinceId
where sp.stateProvinceId = 79
order by AddressLine1 desc 
limit 10;


#Offset 
select * 
from address  a 
inner join stateProvince sp 
	on a.StateProvinceId = sp.StateProvinceId
where sp.stateProvinceId = 79
order by AddressLine1 desc 
limit 10
Offset 2;



#Alias 
select 
	 a.addressLine1
	,a.addressLine1 as Direccion 
from address  a 
inner join stateProvince sp 
	on a.StateProvinceId = sp.StateProvinceId;



#Group by 
SELECT 
    a.stateProvinceId
    , COUNT(*)
FROM
    address a
        INNER JOIN
    stateProvince sp ON a.StateProvinceId = sp.StateProvinceId
GROUP BY a.stateProvinceId;


#Having 
SELECT 
    sp.StateProvinceId, COUNT(*)
FROM
    address a
	INNER JOIN stateProvince sp 
		ON a.StateProvinceId = sp.StateProvinceId
GROUP BY sp.StateProvinceId
HAVING count(*)>15;



#Join
select * 
from address  a 
inner join stateProvince sp 
	on a.StateProvinceId = sp.StateProvinceId;