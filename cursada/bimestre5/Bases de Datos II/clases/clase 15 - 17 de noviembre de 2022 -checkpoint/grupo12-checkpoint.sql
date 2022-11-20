-- CHECKPOINT
-- GRUPO 12

-- Integrantes: 
-- R. Indira Valentina Réquiz
-- Victoria Stancic
-- Laura Velazquez
-- Mateo Adan

-- --------------------------------------------------------------
/*
1. Crear un sp que inserte un registro en la tabla ReporteDiario.
Nombre del sp: usp_reporte_diario_insertar
Parámetros de entrada: NombreActividad, NombreMedicion,
NombreUnidadMedida,Fecha, Valor, idUsuario
*/

delimiter $$
create procedure usp_reporte_diario_insertar(pNombreActividad varchar(45),pNombreMedicion varchar(45), pNombreUnidadMedida varchar(45), pFecha date, pValor float, pidUsuario int)
begin
	insert into reporteDiario(idReporte, NombreActividad ,NombreMedicion , NombreUnidadMedida , Fecha , Valor , Usuario_idUsuario)
    values(Default, pNombreActividad, pNombreMedicion, pNombreUnidadMedida, pFecha, pValor , pidUsuario );
end;
$$


/*
2. Crear una función que verifique si un registro en la tabla ReporteDiario ya existe.
Nombre de la función: udf_existe_reporteDiario
Parametros: idUsuario, NombreActividad, NombreMedicion, Date
Tipo de Resultado: TINYINT
Devolver 1 si en la tabla ReporteDiario existe un registro con TODOS los parametros
de entrada. Se puede utilizar lo siguiente para validar la existencia: SELECT EXISTS
(consulta)
*/

delimiter $$
create function udf_existe_reporteDiario(pidUsuario int, pNombreActividad varchar(45), pNombreMedicion varchar(45), pDate date)
returns TINYINT deterministic
begin
	declare exist TINYINT;
    set exist=(exists(select * from reportediario 
						where reportediario.NombreActividad=pNombreActividad
						 and reportediario.NombreMedicion=pNombreMedicion
						 and reportediario.Fecha=pDate
						 and reportediario.Usuario_idUsuario=pidUsuario));
    return exist;
end;
$$

select udf_existe_reporteDiario(3, "Ciclismo", "metros","2022-11-16"); -- debe retornar 0

/*
 3. Crear un sp que recorra todos los valores de las mediciones diarias de un año e
inserte los valores correspondientes en la tabla ReporteDiario. Tener en cuenta no
insertar registros duplicados en la tabla ReporteDiario.
Nombre Sp: usp_reporte_diario_insertar_anio
Parámetros Entrada: anio smallint

El sp debe de contener:
Un cursor: el cual recorrerá todas las mediciones para el año
Error handling: SQLEXCEPTION
Transacción: se tienen que insertar TODOS los valores si no hay errores. en caso de
haber error no insertar NINGÚN valor.

Notas
Además, se debe utilizar el sp creado en el ejercicio 1 y la función creada en el
ejercicio 2.
Mediciones diarias: promedio del campo valor por: usuario, unidad de medida, tipo de
medición y actividad
 */
 
 delimiter $$
 create procedure usp_reporte_diario_insertar_anio(anio smallInt) 
 begin
 declare actividad varchar(45);
 declare medicion varchar(45);
 declare unidadMedida varchar(45);
 declare idUsuario int;
 declare fecha date;
 declare valor float;
 declare terminado TINYINT DEFAULT 0;
 declare numeroDeError int;
 declare mensajeDeError varchar(255);

 DECLARE cursorReporte CURSOR FOR SELECT actividad.nombre 'actividad',
 tipo_medicion.nombre 'medicion',
 unidadmedida.Nombre 'unidadMedida',
 medicion.Usuario_idUsuario 'idUsuario',
 ROUND(AVG(medicion.valor)) 'valor',
 DATE(medicion.timestamp) as 'fecha'
FROM
medicion
INNER JOIN 
actividad ON medicion.Actividad_id = actividad.id
INNER JOIN 
tipo_medicion ON medicion.Tipo_Medicion_id = tipo_medicion.id
INNER JOIN 
unidadmedida ON medicion.UnidadMedida_Id = unidadmedida.Id
INNER JOIN 
usuario ON usuario.idUsuario = medicion.Usuario_idUsuario
WHERE YEAR(medicion.timestamp) = anio
GROUP BY actividad.nombre, tipo_medicion.nombre,unidadmedida.Nombre,
 medicion.Usuario_idUsuario, DATE(medicion.timestamp);
-- limit 10;
			
DECLARE CONTINUE HANDLER FOR NOT FOUND SET terminado=1;
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
GET DIAGNOSTICS CONDITION 1
                numeroDeError     = MYSQL_ERRNO,
                mensajeDeError    = MESSAGE_TEXT;

rollback;
SELECT numeroDeError , mensajeDeError;
END;
                
OPEN cursorReporte;
START transaction;
BEGIN
agregarMedic: LOOP
FETCH cursorReporte INTO actividad,medicion,unidadMedida,idUsuario,fecha,valor;
	
	IF terminado = 1 THEN 
		LEAVE agregarMedic;
	END IF;
    IF( udf_existe_reporteDiario(idUsuario,actividad,unidadMedida,fecha)=0)THEN
		CALL usp_reporte_diario_insertar(actividad,medicion,unidadMedida,fecha,valor,idUsuario);
        END IF;
END LOOP;
CLOSE cursorReporte;
COMMIT;
END;
END;
 $$
 call usp_reporte_diario_insertar_anio(2022);
 