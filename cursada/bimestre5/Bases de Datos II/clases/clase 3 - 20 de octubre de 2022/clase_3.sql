
# BD2 - Clase 3 

select a.AddressLine1, sp.stateProvinceCode, count(*)
FROM
    address a
	INNER JOIN  stateProvince sp 
		ON a.StateProvinceId = sp.StateProvinceId
group by a.AddressLine1,sp.stateProvinceCode;


select 
	count(AddressId)
    ,count(*)
    ,count(AddressLine1)
    ,count(AddressLine2)
    ,count(case when AddressLine2 is null then 1 else null end)
    ,sum(case when AddressLine2 is null then 1 else null end)
    ,sum(case when AddressLine2 is null then 1 else 0 end)
    ,count(AddressId) - count(AddressLine2)    
 from address




#Grupo 1 

-- Where
-- 1. Mostrar las personas cuya segunda letra de su apellido sea una “a”.
-- Tablas: Contact
-- Campos: LastName
SELECT LastName FROM contact
WHERE LastName LIKE '_a%';
-- 2. Mostrar el nombre concatenado con el apellido de las personas que tengan como “Title” los valores “Mr.” y “Ms.”
-- Tablas: Contact
-- Campos: FirstName, LastName, Title
SELECT CONCAT(FirstName, " ", LastName) AS Nombre_Completo, Title FROM contact
WHERE Title = "Mr." OR Title = "Ms.";
	  Title IN ("Mr.", "Ms.")
	  Title like "Mr.%" OR Title like "Ms.%"
-- 3. Mostrar los nombres de los productos cuyo número de producto comiencen con “AR” o “BE” o “DC”.
-- Tablas: Product
-- Campos: Name, ProductNumber
SELECT Name, ProductNumber FROM product
WHERE  ProductNumber LIKE 'AR%' 
	OR ProductNumber LIKE 'BE%' 
	OR ProductNumber LIKE 'DC%';
-- 4. Mostrar las personas cuyos nombres tengan una C como primer caracter y que el segundo caracter no sea ni “O”, ni “E”.
-- Tablas: Contact
-- Campos: FirstName
SELECT FirstName FROM contact
WHERE FirstName LIKE 'C%' 
	AND FirstName NOT LIKE '_O%' 
    AND FirstName NOT LIKE '_E%';
-- 5. Mostrar todos los productos cuyo precio de lista esté entre 400 y 500
-- Tablas: Product
-- Campos: ListPrice
SELECT ListPrice FROM product
WHERE ListPrice BETWEEN 400 AND 500;
-- 6. Mostrar todos los empleados que nacieron entre 1960 y 1980 y cuyos años de nacimiento sean pares.
-- Tablas: Employee
-- Campos: BirthDate
SELECT BirthDate from employee
WHERE (YEAR(BirthDate) BETWEEN 1960 AND 1980) 
	AND (YEAR(BirthDate)%2=0);

-- Operadores & joins
-- 1. Mostrar el código, fecha de ingreso y horas de vacaciones de los empleados que ingresaron a partir del año 2000.
-- Tablas: Employee
-- Campos: BusinessEntityID, HireDate, VacationHours
SELECT EmployeeID, HireDate, VacationHours FROM employee
WHERE YEAR(HireDate) >= 2000;
-- 2. Mostrar el nombre, número de producto, precio de lista y el precio de lista incrementado en un 10% de los productos 
-- cuya fecha de fin de venta sea anterior al día de hoy.
-- Tablas: Product
-- Campos: Name, ProductNumber, ListPrice, SellEndDate
SELECT Name, ProductNumber, ListPrice, (ListPrice*1.1) AS Incremento, SellEndDate FROM product
WHERE SellEndDate < CURDATE();

select curdate(), now(), sysdate();

-- Group By
-- 1. Mostrar la cantidad de empleados por año de nacimiento.
-- Tablas: Employee
-- Campos: BirthDate
SELECT YEAR(BirthDate), COUNT(*) AS Cantidad_Empleados FROM employee
GROUP BY YEAR(BirthDate);
-- 2. Mostrar el promedio de precios de productos por año de inicio de venta.
-- Tablas: Product
-- Campos: ListPrice, SellStartDate
SELECT YEAR(SellStartDate), AVG(ListPrice) FROM product
GROUP BY YEAR(SellStartDate);
-- 3. Mostrar los productos y el total vendido de cada uno de ellos, ordenados por el total vendido.
-- Tablas: SalesOrderDetail
-- Campos: ProductID, LineTotal
SELECT ProductID, SUM(LineTotal) AS Total_Vendido FROM salesorderdetail
GROUP BY ProductID
ORDER BY Total_Vendido asc;
-- 4. Mostrar el promedio vendido por factura.
-- Tablas: SalesOrderDetail
-- Campos: SalesOrderID, LineTotal
SELECT SalesOrderID, AVG(LineTotal) AS Promedio_Vendido FROM salesorderdetail
GROUP BY SalesOrderID;

-- Having
-- 1. Mostrar las subcategorías de los productos que tienen dos o más productos que cuestan menos de $200.
-- Tablas: Product
-- Campos: ProductSubcategoryID, ListPrice
SELECT ProductSubcategoryID, COUNT(ProductID) AS Conteo FROM product
WHERE ListPrice < 200
GROUP BY ProductSubcategoryID
HAVING Conteo >= 2;
-- 2. Mostrar todos los códigos de subcategorías existentes junto con la cantidad para los
-- productos cuyo precio de lista sea mayor a $100 y el precio promedio sea menor a $300.
-- Tablas: Product
-- Campos: ProductSubcategoryID, ListPrice
SELECT ProductSubcategoryID, COUNT(ProductID) AS Conteo, AVG(ListPrice) AS Promedio FROM product
WHERE ListPrice > 100
GROUP BY ProductSubcategoryID
HAVING Promedio < 300;

-- Joins
-- 1. Mostrar los precios de venta de aquellos productos donde la cifra sea inferior al
-- precio de lista recomendado para ese producto ordenados por nombre de producto.
-- Tablas: SalesOrderDetail, Product
-- Campos: ProductID, Name, ListPrice, UnitPrice
SELECT p.ProductID, p.Name, p.ListPrice, sod.UnitPrice FROM product p
INNER JOIN SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.UnitPrice < p.ListPrice
ORDER BY p.Name;
-- 2. Mostrar todos los productos que tengan igual precio. Se deben mostrar de a pares,
-- código y nombre de cada uno de los dos productos y el precio de ambos. Ordenar
-- por precio en forma descendente.
-- Tablas: Product
-- Campos: ProductID, ListPrice, Name
-- 3. Mostrar el nombre de los productos y de los proveedores ordenados por nombre
-- de proveedor descendente.
-- Tablas: Product, ProductVendor, Vendor
-- Campos: Name ,ProductID, BusinessEntityID, ProductSubcategoryID
-- 4. Mostrar todas las personas —nombre y apellido— y en el caso que sean
-- empleados mostrar también el login id, caso contrario, mostrar null.
-- Tablas: Contact, Employee
-- Campos: FirstName, LastName, LoginID, BusinessEntityID







