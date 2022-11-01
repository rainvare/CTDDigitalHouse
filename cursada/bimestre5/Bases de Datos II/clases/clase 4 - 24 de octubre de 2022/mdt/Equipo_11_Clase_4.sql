-- 1) Empleados
-- a) Crear un SP que liste los apellidos, nombres y edad de los empleados ordenados
-- alfabéticamente.
-- Tip: Para la edad, crear una función que tenga como parámetro de entrada la fecha de
-- nacimiento y devuelva la edad.
-- b) Invocar el SP para verificar el resultado.

DELIMITER $$
CREATE FUNCTION udf_obtenerEdad(fecha DATE)
RETURNS tinyint
DETERMINISTIC 
BEGIN 
DECLARE resultado tinyint;
SET resultado = (SELECT TIMESTAMPDIFF(YEAR, fecha, CURDATE()));
RETURN resultado; 
END; 
$$

DELIMITER $$
CREATE PROCEDURE usp_datosEmpleados()
BEGIN 
SELECT 
empleados.Nombre as nombre_empleado,
empleados.Apellido as apellido_empleado,
udf_obtenerEdad(empleados.FechaNacimiento) as edad_empleado
FROM empleados 
ORDER BY empleados.Nombre asc;
END;
$$

CALL usp_datosEmpleados();

-- 2) Empleados por ciudad
-- a) Crear un SP que reciba el nombre de una ciudad y liste los empleados de esa ciudad que
-- sean mayores a 25 años.
-- Tip: Utilizar la función creada en punto 1.
-- b) Invocar al SP para listar los empleados de London.

DELIMITER $$
CREATE PROCEDURE usp_empleadosXCiudad(IN ciudad VARCHAR(30))
BEGIN
SELECT 
empleados.Nombre as nombre_empleado,
empleados.Apellido as apellido_empleado,
udf_obtenerEdad(empleados.FechaNacimiento) as edad_empleado,
empleados.Ciudad as ciudad_empleado
FROM empleados 
WHERE empleados.Ciudad = ciudad AND udf_obtenerEdad(empleados.FechaNacimiento) > 25;
END;
$$

CALL usp_empleadosXCiudad("london");

-- 3) Clientes por país
-- a) Crear un SP que liste los apellidos, nombres, edad y la diferencia en años de edad con el
-- valor máximo de edad que tiene la tabla de clientes.
-- Tip: Utilizar la función creada en punto 1. Crear una función que devuelva la fecha de
-- nacimiento mínima de la tabla clientes.

DELIMITER $$
CREATE PROCEDURE usp_clienteXPais()
BEGIN
DECLARE edad_max tinyint;
SET edad_max =(SELECT max(udf_obtenerEdad(fechaNacimiento)) FROM empleados);
SELECT
apellido, nombre, udf_obtenerEdad(fechaNacimiento) edad, edad_max - udf_obtenerEdad(fechaNacimiento) diferencia_edad
FROM empleados;
END;
$$

CALL usp_clienteXPais();

-- 4) Ventas con descuento
-- a) Crear un SP que reciba un porcentaje y liste los nombres de los productos que hayan sido
-- vendidos con un descuento igual o superior al valor indicado, indicando además el nombre
-- del cliente al que se lo vendió. Además devolver el precio del producto con un aumento.
-- Tip: Para devolver el precio del producto con descuento, crear una función que reciba un
-- porcentaje y el precio del producto.

DELIMITER $$
CREATE FUNCTION udf_descuento(porcentaje TINYINT, precioProducto DOUBLE)
RETURNS double
DETERMINISTIC
BEGIN 
DECLARE resultado double;
SET resultado = (SELECT precioProducto - (precioProducto*porcentaje/100));
RETURN resultado;
END;
$$ 

DELIMITER $$ 
CREATE PROCEDURE usp_ventaConDescuento(IN porcentaje tinyint)
BEGIN 
SELECT
p.ProductoNombre as nombre_producto,
c.Contacto as nombre_cliente,
fd.PrecioUnitario as precio_original,
udf_descuento(porcentaje, fd.PrecioUnitario) as precioConDescuento
FROM productos p
INNER JOIN facturadetalle fd
ON p.ProductoID = fd.ProductoID
INNER JOIN facturas f
ON f.FacturaID = fd.FacturaID
INNER JOIN clientes c
ON c.ClienteID = f.ClienteID
WHERE fd.PrecioUnitario >= porcentaje;
END;
$$

CALL usp_ventaConDescuento(10);



