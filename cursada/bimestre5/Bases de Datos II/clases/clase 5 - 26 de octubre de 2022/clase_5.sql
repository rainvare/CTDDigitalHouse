
# Clase 5 
use dhtube;

delimiter $$
CREATE  FUNCTION tinyint_to_bool(pi_dato TINYINT(1)) RETURNS char(2) 
    DETERMINISTIC
BEGIN

RETURN (CASE WHEN pi_dato = 0 THEN 'No' ELSE 'Si' END);

END
$$ 

# TEst de la funcion tinyint_to_bool
select idVideo, privado, tinyint_to_bool(privado) 
from video


#Entre todos vamos a crear una función que para 
#los campos que tengan rutas de archivo o nombres, 
#nos devuelvan la extensión del mismo.
DELIMITER $$
CREATE FUNCTION udf_extension_c1(pi_nombreARchivo varchar(200)) 
returns varchar(5) deterministic 
begin 
return SUBSTRING_INDEX(pi_nombreARchivo, '.', -1);

end $$ 


select nombreArchivo 
	, SUBSTRING_INDEX(nombreArchivo, '.', -1)
    , SUBSTR(nombreArchivo, LOCATE('.',nombreArchivo)+1)
    ,udf_extension_c1(nombreArchivo)
from video


SELECT 
	CASE 
		WHEN cantidadReproducciones > 1000000 THEN CONCAT(ROUND(cantidadReproducciones / 1000000), ' M') 
		ELSE CONCAT(ROUND(cantidadReproducciones / 1000), ' K') 
    END AS Reproducciones
FROM video


# Funciones de Ventana
# OVER() --> La ventana de datos son todos los registros de la consulta
SELECT *
, LAG(fechaNacimiento, 1) OVER() AS FechaNacUsuarioAnterior
, LEAD(fechaNacimiento, 1) OVER(PARTITION BY Pais_idPais ORDER BY fechaNacimiento ASC) AS FechaNacUsuarioSiguiente
, NTILE(9) OVER () -1 +  9
, row_number() over(PARTITION BY Pais_idPais)
,LAST_VALUE(fechaNacimiento) over (PARTITION BY Pais_idPais)
,LAST_VALUE(fechaNacimiento) over ()
FROM usuario


# como tiene un Auto Incremental (AI)
INSERT INTO tiporeaccion (nombre) VALUES ('Instaaaa');
SELECT LAST_INSERT_ID();


select * 
from tiporeaccion
