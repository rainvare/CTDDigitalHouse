# Clase 8 

#Use AdventureWorks
#Modificar el procedimiento usp_Employee_Age_Insertar_bulk para que permita 
#insertar los valores a la tabla Employee_Age utilizando el Procedimiento almacenado usp_Employee_Age_Insertar
#La edad tiene que ser parametro de entrada en el procedimiento almacenado.

/*CREATE VIEW vi_Employee AS 
SELECT 
    c.FirstName as 'Nombre'
    , c.LastName as 'Apellido'
    , udf_Age_Get(e.BirthDate) as 'Edad'
FROM  employee e 
INNER JOIN contact c 
    ON e.ContactID = c.ContactID;*/



DELIMITER $$
CREATE PROCEDURE usp_Employee_Age_Insertar(pi_FirstName varchar(50), pi_LastName VARCHAR(50), IN pi_edad tinyint) 
BEGIN 

INSERT INTO Employee_Age(FirstName, LastName, Age) VALUES (pi_FirsName, pi_LastName, pi_edad);

END;
$$ 

#Utilizando un cursor

DELIMITER $$
CREATE PROCEDURE usp_Employee_Age_Insertar_Bulk_Cursor(IN pi_edad tinyint) 
BEGIN 
DECLARE v_nombre, v_apellido VARCHAR(50);
DECLARE v_edad TINYINT;

DECLARE finished INT DEFAULT 0; # Flag - Verificar la finalizacion de un cursor

DECLARE cur1 CURSOR FOR SELECT * FROM vi_employee WHERE edad = pi_edad; # DEclaro el cursor

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1; # Declaro el Handler para controlar el ultimo registro del cursor

OPEN cur1; # Abro el cursor

loopempleados: LOOP #comienzo a iterar 

	FETCH cur1 INTO v_nombre, v_apellido, v_edad; # asignar los valores del cursor en variables 
    
    IF finished = 1 THEN  # if para controlar si existen registros en el cursor
		LEAVE loopempleados;
	END IF;

	CALL usp_Employee_Age_Insertar(v_nombre, v_apellido, v_edad); #Llamo a procedimiento	

END LOOP; #termina iteracion
CLOSE cur1;

END;
$$ 

#Test
CALL usp_Employee_Age_Insertar_Bulk_Cursor(50)
SELECT * FROM Employee_Age




#Tablas Temporales
#Crear una tabla temporal que tenga nombre y apellido y cantidad de la vista vi_employee. 
#Luego realizar las siguientes consultas: 1-Listar los nombres que se repitan. 2-Listar los apellido que se repitan. 3-Listar los nombres y apellidos que se repitan.

create temporary table if not exists t_employee 
select * from vi_employee;

select count(*) from vi_employee;

select count(*) from t_employee;
select  Nombre, count(*) from t_employee group by Nombre having count(*) > 1;
select  apellido, count(*) from t_employee group by apellido having count(*) > 1;
select  Nombre, apellido, count(*) from t_employee group by Nombre, apellido having count(*) > 1;









#Ejercicio 1 utilizando Cursor y Tabla Temporal
#Utilizando cursor y tabla temporal

DELIMITER $$
CREATE PROCEDURE usp_Employee_Age_Insertar_Bulk(IN pi_edad tinyint) 
BEGIN 
DECLARE nombre, apellido VARCHAR(50);
DECLARE edad TINYINT;

DECLARE finished INT DEFAULT 0; # Flag - Verificar la finalizacion de un cursor

DECLARE  cur1 CURSOR FOR SELECT * FROM t_employee; 

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1; # Declaro el Handler para controlar el ultimo registro del cursor

CREATE  TEMPORARY  TABLE IF NOT EXISTS t_employee
SELECT * FROM vi_Employee WHERE edad = pi_edad;

OPEN cur1;

loopempleados: LOOP
FETCH cur1 INTO nombre, apellido, edad;

 IF finished = 1 THEN  # if para controlar si existen registros en el cursor
		LEAVE loopempleados;
	END IF;

CALL usp_Employee_Age_Insertar(nombre, apellido, edad);

END LOOP;
CLOSE cur1;

END;
$$ 

