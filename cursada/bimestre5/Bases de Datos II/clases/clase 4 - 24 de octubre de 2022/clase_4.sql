# Clase  4 - BD 2 

#Use AdventureWorks
# Crear un SP que dada una edad como parametro de entrada, inserte en la tabla Employee_Age todos los registros de Employee que cumplan con la edad pasada
# por parametro. Insertar los datos FirstName, LastName y Age (datos en tabla Contact).
# Para calcular la edad, crear una funcion.

CREATE TABLE Employee_Age(FirstName varchar(50), LastName varchar(50), Age TinyInt);

DELIMITER $$
CREATE FUNCTION udf_Age_Get(pi_date date) returns tinyint  
NOT DETERMINISTIC
BEGIN 
DECLARE result TINYINT;
SET result = (SELECT TIMESTAMPDIFF(YEAR,pi_date,CURDATE()));

RETURN result;
END;
$$ 

SELECT EmployeeId, BirthDate , udf_Age_Get(BirthDate) as Edad
FROM employee 
LIMIT 10





DELIMITER $$
CREATE PROCEDURE usp_Employee_Age_Insert(IN pi_edad tinyint) 
BEGIN 

INSERT INTO Employee_Age(FirstName, LastName, Age)
SELECT 
	c.FirstName as 'Nombre'
	, c.LastName as 'Apellido'
    , udf_Age_Get(BirthDate) as 'Edad'
FROM  employee e 
INNER JOIN contact c 
	ON e.ContactID = c.ContactID
WHERE  udf_Age_Get(BirthDate) = pi_edad;

END;
$$ 


#Como Podemos Mejorar nuestro Codigo del SP? (Spoiler> Vista)

select * from vi_Employee where edad > 70

CREATE VIEW vi_Employee AS 
SELECT 
	c.FirstName as 'Nombre'
	, c.LastName as 'Apellido'
    , udf_Age_Get(e.BirthDate) as 'Edad'
FROM  employee e 
INNER JOIN contact c 
	ON e.ContactID = c.ContactID;

DELIMITER $$
CREATE PROCEDURE usp_Employee_Age_Insert2(IN pi_edad tinyint) 
BEGIN 

INSERT INTO Employee_Age(FirstName, LastName, Age)
SELECT 
	 ve.Nombre
    ,ve.Apellido
    ,ve.Edad 
FROM vi_Employee ve 
WHERE ve.Edad= pi_edad;

END;
$$ 



-- Ejercicio PG 

#Functions: Canciones
#Tabla: Canciones
#1. Crear una función que solicite como parámetros de entrada los milisegundos de la 
#tabla de canciones, y que devuelva como resultado esa misma información
#, pero con el formato de hora, minutos y segundos —sin milisegundos—. 
#En el caso de que el parámetro de milisegundos esté vacío, se debe devolver 00:00:00.

#params Entrada: milisegundos int 
#Return varchar 
#Logica de la funcion
	# if milisegundos is null 		--> Return 00:00:00
    # if milisegundos is not null 	--> Return calculo 
    
    
    
    
    


