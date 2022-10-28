#Clase 6 BD 2

-- Consigna 1

-- Paso 1, modificamos la tabla
ALTER TABLE musimundos.empleados 
ADD COLUMN edad INT NULL AFTER email;

-- Paso 2, generamos la funcion edad()
DELIMITER $$
CREATE FUNCTION edad (fecha_nacimiento DATE)
RETURNS INT DETERMINISTIC
BEGIN
	RETURN TIMESTAMPDIFF (YEAR, fecha_nacimiento, CURDATE());
END$$

-- Paso 3, generamos el stored procedure
DELIMITER $$
USE musimundos$$
#DROP PROCEDURE actualiza_edad
DELIMITER $$
CREATE PROCEDURE actualiza_edad ()
BEGIN
	UPDATE empleados
    SET edad = edad(fecha_nacimiento);
END$$

-- Paso 4, ejecutamos el stored
CALL actualiza_edad();

-- Paso 5, corroboramos que queden iguales las edades
SELECT *, edad(fecha_nacimiento) as edad_calculada_en_el_select FROM empleados;