/*1. Necesitamos crear un procedimiento almacenado que inserta un cliente,
SP_Cliente_Insert que recibe los datos del cliente y lo inserta en caso que no exista
un cliente con el mismo número de DNI o Cédula de identidad.
2. Armar una función fn_ValidadEdad que, dada la fecha de nacimiento de una persona
(YYYYMMDD), la fecha de inicio del préstamo (YYYYMMDD) y la cantidad de cuotas,
verifique que cumpla con la condición que la persona no tenga más de 80 años al
finalizar el préstamo.
3. Armar una función fn_diaHabil que, dada una fecha (YYYYMMDD), devuelva la
misma fecha si es un día hábil —lunes a viernes— o en caso de no serlo —si es
sábado o domingo— devuelva la fecha del primer día hábil siguiente.
4. Crear un stored procedure SP_Genera_Cuota que, dado un importe, fecha de inicio,
y cantidad de cuotas, genere el detalle de las cuotas.*/

-- 1 
DELIMITER $$
CREATE PROCEDURE SP_Cliente_Insert(sp_cedulaident varchar(10), apellido varchar(45), nombres varchar(50), fecha_nac DATE)
BEGIN
IF NOT EXISTS (SELECT * FROM clientes WHERE cedulaident = sp_cedulaident) THEN
INSERT INTO clientes(cedulaident, apellido, nombres, fecha_nac)
VALUES(sp_cedulaident, apellido, nombres, fecha_nac);
END IF;
END $$
DELIMITER ;


CALL sp_cliente_insert('75167980', 'Requiz', 'Indira', '1991-06-17');
CALL sp_cliente_insert('75235646', 'Ruiz', 'Marina', '2005-03-11');
CALL sp_cliente_insert('75167980', 'Requiz', 'Indira', '1991-06-17');

Select * from clientes;

-- 2

DELIMITER $$
CREATE FUNCTION fn_ValidarEdad(fecha_nac datetime, fechainicio datetime, cuotas int)
RETURNS int
DETERMINISTIC
BEGIN
DECLARE valida int default 1;
DECLARE fechafinal datetime;
DECLARE fechafinalEdad datetime;

SET fechafinal = date_add(fechainicio, Interval cuotas month);
SET fechafinalEdad = date_add(fecha_nac, Interval 80 year);
IF fechafinal  > fechafinalEdad
THEN SET valida = 0;
END IF;
RETURN valida;
END $$
DELIMITER ;

SELECT fn_ValidarEdad('1970-08-02', '2022-11-02', 20);

-- 3
DELIMITER $$
CREATE FUNCTION fn_diaHabil(fn_fecha date)
RETURNS date
DETERMINISTIC
BEGIN
DECLARE diaHabil date;
IF weekday(fn_fecha) < 5
THEN SET diaHabil = fn_fecha;
ELSEIF weekday(fn_fecha) = 5
THEN SET diaHabil = date_add(fn_fecha, INTERVAL 2 day);
ELSE
SET diaHabil = date_add(fn_fecha, INTERVAL 1 day);
END IF;
RETURN diaHabil;
END $$
DELIMITER ;

SELECT fn_diaHabil('2022-11-02');
SELECT fn_diaHabil('2022-11-05');


-- 4
DELIMITER $$
CREATE PROCEDURE SP_Genera_Cuota(IN sp_importe decimal(10,2), sp_fechaInicio date, sp_cuotas int)
BEGIN
DECLARE valorCuota decimal(10,2) default 1;
DECLARE vCuota int;
DECLARE fechaCuota date;

SET vCuota = 1;
SET valorCuota = (sp_importe / sp_cuotas);

DROP TABLE IF EXISTS tmp_cuotas;
CREATE TEMPORARY TABLE tmp_cuotas(tmp_num_cuota int, tmp_fecha date, importe decimal(10,2));
SET fechaCuota = sp_fechaInicio;
WHILE vCuota <= sp_cuotas DO
INSERT INTO tmp_cuotas(tmp_num_cuota, tmp_fecha, importe)
VALUES(vCuota, fn_diaHabil(fechaCuota), valorCuota);
SET fechaCuota = date_add(fechaCuota, INTERVAL 30 day);
SET vCuota = vCuota + 1;
END WHILE;
SELECT tmp_num_cuota AS 'Número de cuota',
DATE_FORMAT(tmp_fecha, '%d/%m/%Y') AS 'Fecha',
importe AS 'Importe'
FROM tmp_cuotas;
END $$
DELIMITER ;

CALL SP_Genera_Cuota(30000, '2022-11-02', 3);
