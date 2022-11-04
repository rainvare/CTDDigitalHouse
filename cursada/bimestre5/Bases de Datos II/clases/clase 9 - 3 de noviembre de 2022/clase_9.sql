# Clase 9 
delimiter $$
CREATE FUNCTION fn_diahabil(fecha date) RETURNS date
    DETERMINISTIC
BEGIN
	DECLARE diahabil date;
    if weekday(fecha) < 5 then
			set diahabil = fecha;
	elseif weekday(fecha)=5 then 
			# es sabado
			set diahabil = date_add(fecha,INTERVAL 2 DAY);
	else
			# es domingo
			set diahabil = date_add(fecha,INTERVAL 1 DAY);
    end if ;

RETURN diahabil;
END $$


DELIMITER $$
CREATE FUNCTION `fn_validaedad`(fechanac  datetime, fechainicio datetime, cantcuo integer) RETURNS int
    DETERMINISTIC
BEGIN
	Declare validaOK integer default 1; 
	Declare fechafinal datetime ;
    Declare fechafinalEdad datetime ;
    
    set fechafinal = Date_add(fechainicio,Interval cantcuo month);
    set fechafinalEdad  = Date_add(fechanac,Interval 80 year);
    
    if fechafinal > fechafinalEdad  THEN 
		set validaOK = 0;
    END IF ; 
RETURN validaOK;
END

01-01-1950 --> Fecha Nacimiento
01-01-2022 --> Fecha Inicio del Prestamo
36		   --> Cantidad Cuotas del prestamo

01-01-1950 + 80 anios --> 01-01-2030
01-01-2022 + 36 meses --> 01-01-2025

Si 01-01-2025 > 01-01-2030 --> devolver false 
Si 01-01-2025 < 01-01-2030 --> devolver True 

DELIMITER $$
CREATE PROCEDURE `sp_cliente_insert`(`pcedulaident` VARCHAR(10),`papellido` VARCHAR(45),`pnombres` VARCHAR(100),`pfecha_nac` DATE)
BEGIN
INSERT INTO `dhprestamos`.`clientes`
(
`cedulaident`,
`apellido`,
`nombres`,
`fecha_nac`)
VALUES
(
pcedulaident,
papellido,
pnombres,
pfecha_nac
);

END $$ 


DELIMITER $$
CREATE  PROCEDURE `SP_Genera_cuota`(IN pImporte decimal(10,2) , pFechaInicio date, pCuotas int)
BEGIN
	declare valorCuota decimal(10,2) default 1;
    declare vCuota int DEFAULT 1;
    declare fechaCuota date;
   
    
    /* Valor de la cuota */
    set valorCuota = (pImporte / pCuotas) ;
	
    /*Creacion de tabla temporal para las cuotas */
    Drop table tmpCuotas;
    CREATE TEMPORARY TABLE tmpCuotas
		(nrocuota int, fecha date, importe decimal(10,2));
    
    set fechaCuota = pFechaInicio;
    WHILE vCuota <= pCuotas DO
		/*Select vCuota,valorCuota, fechaCuota;*/
        insert into tmpCuotas (nrocuota,fecha,importe) values  (vCuota,fn_diahabil(fechaCuota),valorCuota);
        
       set fechaCuota = Date_add(fechaCuota,Interval 30 day);
		Set vCuota = vCuota +1 ;
    END WHILE;
    
	Select 
		nrocuota as 'Nro de Cuota ',
        DATE_FORMAT(fecha,'%d %M %Y') as 'Fecha de Cuota',
        importe as 'Valor Cuota'
    from tmpCuotas;
    
END

$$ 


