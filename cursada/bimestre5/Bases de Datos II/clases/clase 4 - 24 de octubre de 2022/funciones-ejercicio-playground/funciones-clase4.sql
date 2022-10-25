#Tabla: Canciones
#1. Crear una función que solicite como parámetros de entrada los milisegundos 
#de la tabla de canciones, y que devuelva como resultado esa misma información, 
#pero con el formato de hora, minutos y segundos —sin milisegundos—. 
#En el caso de que el parámetro de ciudad esté vacío, se debe devolver 00:00:00.

DROP FUNCTION IF EXISTS "milisegundos"
DELIMITER $$
CREATE FUNCTION milisegundos(miliseg int)
RETURNS  varchar(50) 
DETERMINISTIC
BEGIN 
	DECLARE minutos INT default 0;
	DECLARE minutostotales INT default 0;
	DECLARE hora INT DEFAULT 0;
	DECLARE segundos INT DEFAULT 0;
	DECLARE segundostotales INT DEFAULT 0;
    SET segundostotales = miliseg/60;
    SET minutostotales = segundosTOTALES/60;
    set segundos = segundosTOTALES%60;	
    SET hora = minutostotales/60;
    SET minutos = hora%60;
    RETURN concat(hora, ':', minutos, ':', segundos);
END $$

SELECT milisegundos(milisegundos) from canciones;

#2. Invocar la función para obtener la información de todas las canciones del género rock,
# utilizando la función para mostrar la duración de las mismas.




#SP: Clientes y facturas 
#Tabla: Clientes 
#1. Crear una función que reciba como parámetro el id de un cliente y 
#devuelva la cantidad de facturas que posee el mismo.


#2. Invocar la función para obtener todos los clientes y su cantidad de facturas, 
#utilizando la función creada anteriormente.
