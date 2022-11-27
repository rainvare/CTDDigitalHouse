-- CHECKPOINT
-- GRUPO 12

-- Integrantes: 
-- R. Indira Valentina Réquiz
-- Victoria Stancic
-- Laura Velazquez
-- Mateo Adan

-- --------------------------------------------------------------
/*1. Crear una tabla de auditoría para almacenar todas los eventos de la tabla
ReporteDiario.
Nombre de la tabla: reporteDiario_hist
Campos: Mismos campos que la tabla ReporteDiario + fecha_creacion(DATE) +
usuario_creacion (VARCHAR) + accion (VARCHAR)*/

CREATE TABLE reporteDiario_hist(idReporte int NOT NULL AUTO_INCREMENT,
NombreActividad varchar(50) DEFAULT NULL,
NombreMedicion varchar(50) DEFAULT NULL ,
NombreUnidadMedida varchar(50) DEFAULT NULL,
Fecha datetime DEFAULT NULL,
Valor float DEFAULT NULL,
Usuario_creacion int DEFAULT NULL, primary key (idReporte))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*2. Crear un trigger sobre la tabla ReporteDiario y que guarde los registros en la tabla
creada en el punto 1.
Nombre del trigger: trg_after_insert
Evento: Insertar
Tiempo: After
Insertar un registro en la tabla creada en el punto 1 con los mismos campos de la
tabla, fecha de creación, usuario y accion (‘Insertar’)*/

DROP TRIGGER IF EXISTS trg_after_insert;
DELIMITER $$;
CREATE TRIGGER trg_after_insert
AFTER INSERT ON reportediario FOR EACH ROW
BEGIN
INSERT INTO reporteDiario_hist
values (Default, NEW.NombreActividad, NEW.NombreMedicion, NEW.NombreUnidadMedida, NEW.Fecha, NEW.Valor , NEW.Usuario_idUsuario, curdate(), 
current_user(), 'Insert');
END $$;

/*3. Crear un sp que recorra todos los valores de las mediciones diarias de un mes-año e
inserte los valores correspondientes en la tabla ReporteDiario.
Nombre Sp: usp_reporte_diario_insertar_anio
Parámetros Entrada: mes tinyint - anio smallint
El sp debe de contener:
Un cursor: el cual recorrerá el promedio de todas las mediciones para el mes - año
Error handling: SQLEXCEPTION + NOTFOUND
Transacción: se tienen que insertar TODOS los valores si no hay errores. en caso de
haber error no insertar NINGÚN valor.
Mediciones diarias: promedio del campo valor por: usuario, unidad de medida, tipo de
medición y actividad*/

delimiter $$
 create procedure usp_reporte_diario_insertar_anio(mes tinyint, anio smallInt) 
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
WHERE MONTH(medicion.timestamp) = mes AND YEAR(medicion.timestamp) = anio 
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
   INSERT INTO reporteDiario_hist values (default, actividad,medicion,unidadMedida,fecha,valor,idUsuario);
END LOOP;
CLOSE cursorReporte;
COMMIT;
END;
END;
 $$
 
 call usp_reporte_diario_insertar_anio(2,2022);

Select * from reportediario;