#Mostrar las personas cuya segunda letra de su apellido sea una “a”
SELECT LastName 
FROM contact
WHERE LastName LIKE '_a%';

#Mostrar el nombre concatenado con el apellido de las personas que tengan 
#como “Title” los valores “Mr.” y “Ms.”
SELECT Title, concat(FirstName, ' ', LastName) AS NombreCompleto
FROM contact
WHERE Title = 'Mr.' OR Title = 'Ms.';



#Mostrar los nombres de los productos cuyo número de producto
#comiencen con “AR” o “BE” o “DC”
SELECT Name, ProductNumber
FROM product
WHERE ProductNumber LIKE 'AR%' OR ProductNumber LIKE 'BE%' OR ProductNumber LIKE 'DC%';


#Mostrar las personas cuyos nombres tengan una C como primer caracter y que el
#segundo caracter no sea ni “O”, ni “E”.

SELECT FirstName
FROM contact
WHERE (FirstName LIKE 'C%') AND (FirstName NOT LIKE 'CE%' AND FirstName NOT LIKE 'CO%');   

#Mostrar todos los productos cuyo precio de lista esté entre 400 y 500
SELECT ListPrice
FROM product
WHERE ListPrice BETWEEN 400 AND 500; 

#Mostrar todos los empleados que nacieron entre 1960 y 1980 y cuyos años de
#nacimiento sean pares.

SELECT *
FROM employee
WHERE year(BirthDate) BETWEEN 1960 AND 1980 
AND year(BirthDate)%2 = 0; 

#Mostrar el código, fecha de ingreso y horas de vacaciones de los empleados
#que ingresaron a partir del año 2000

SELECT EmployeeID, HireDate, VacationHours
FROM employee
WHERE year(HireDate)>= 2000;

#Mostrar el nombre, número de producto, precio de lista y el precio de lista
#incrementado en un 10% de los productos cuya fecha de fin de venta sea anterior al
#día de hoy.

SELECT Name, ProductNumber, ListPrice, ListPrice * 0.1 AS 'Precio10%', SellEndDate
FROM product
WHERE SellEndDate < now();





