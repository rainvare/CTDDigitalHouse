/* Consigna
1) Empleados
a) Crear un SP que liste los apellidos, nombres y edad de los empleados ordenados
alfabéticamente.
Tip: Para la edad, crear una función que tenga como parámetro de entrada la fecha de
nacimiento y devuelva la edad.*/

CREATE TABLE empleado_edad(Nombre varchar(50), Apellido varchar(50), Edad TinyInt);

DELIMITER $$
CREATE FUNCTION udf_edad(pi_date date) returns tinyint  
DETERMINISTIC
BEGIN 
DECLARE result TINYINT;
SET result = (SELECT TIMESTAMPDIFF(YEAR,pi_date,CURDATE()));
RETURN result;
END;
$$

DELIMITER $$
CREATE PROCEDURE usp_datosEmpleado() 
BEGIN 
SELECT 
	e.Nombre as 'Nombre'
	, e.Apellido as 'Apellido'
    , udf_edad(e.FechaNacimiento) as 'Edad'
FROM  empleados e 
order by e.Nombre Asc;

END;
$$ 

call usp_datosEmpleado();


/*
b) Invocar el SP para verificar el resultado.
2) Empleados por ciudad
a) Crear un SP que reciba el nombre de una ciudad y liste los empleados de esa ciudad que
sean mayores a 25 años.
Tip: Utilizar la función creada en punto 1.
b) Invocar al SP para listar los empleados de London.*/

DELIMITER $$
CREATE PROCEDURE sp_ciudad(IN ciudad varchar(25))
BEGIN
	SELECT 
		e.Nombre as 'Nombre'
		, e.Apellido as 'Apellido'
		, udf_edad(e.FechaNacimiento) as 'Edad'
        , e.Ciudad as "Ciudad"
	FROM empleados e
    WHERE e.Ciudad = ciudad and udf_edad(e.FechaNacimiento) > 25;
END;
$$

call sp_ciudad ("London")


/*
3) Clientes por país
a) Crear un SP que liste los apellidos, nombres, edad y la diferencia en años de edad con el
valor máximo de edad que tiene la tabla de clientes.
*/

DELIMITER $$
CREATE PROCEDURE sp_clientes_x_pais()
BEGIN
DECLARE edad_max tinyint;
set edad_max = (SELECT max(udf_edad(fechaNacimiento)) FROM empleados);
SELECT apellido, nombre, udf_edad(fechaNacimiento) edad, edad_max - udf_edad(fechaNacimiento) diferencia_edad 
FROM empleados;
end;
$$


call sp_clientes_x_pais();
/*
2
Tip: Utilizar la función creada en punto 1. Crear una función que devuelva la fecha de
nacimiento mínima de la tabla clientes.*/


/*
4) Ventas con descuento
a) Crear un SP que reciba un porcentaje y liste los nombres de los productos que hayan sido
vendidos con un descuento igual o superior al valor indicado, indicando además el nombre
del cliente al que se lo vendió. Además devolver el precio del producto con un aumento.

*/

DELIMITER $$
CREATE function udf_aumento(precio double, porcentaje tinyint(1)) returns double 
deterministic
BEGIN
DECLARE result double;
SET result = (precio + (precio * porcentaje));
RETURN result;
END;
 $$
 

delimiter $$
CREATE PROCEDURE sp_clientes_x_pais( IN pi_descuento TINYINT(1) )
BEGIN
select p.productoNombre, c.compania, udf_aumento(fd.precioUnitario, pi_descuento)
from facturadetalle fd 
INNER JOIN facturas f on fd.facturaId = f.facturaId
INNER JOIN clientes c on f.ClienteId = c.ClienteId
inner join productos p on fd.productoId = p.productoId
where fd.descuento >= pi_descuento;
end;
$$
