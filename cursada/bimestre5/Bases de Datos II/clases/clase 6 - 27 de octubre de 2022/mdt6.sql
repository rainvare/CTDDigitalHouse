-- 1. Vamos a crear un store procedure llamado facturacion_cliente() que dadas 2 fechas
-- como parámetros de entrada, nos devuelva los datos de todos los clientes y un campo donde
-- mostremos el monto total de facturas creadas entre las fechas recibidas por parámetro para
-- cada cliente. Recordemos que puede haber más de 1 factura por cliente. Para realizar ese
-- cálculo, vamos a crear una función llamada facturas_por_cliente() donde le vamos a pasar
-- como parámetro el id del cliente, las fechas desde y hasta y nos va a devolver la suma total
-- de las facturas por cada uno de ellos. Por último, si este campo nos devuelve null o 0
-- debemos mostrar la palabra ‘Sin Datos’ en ese cálculo. Ejecutar el store para las fechas
-- '2010-02-01' hasta '2010-02-11' y luego para '2010-02-01' hasta '2010-02-12'.

DELIMITER $$
CREATE FUNCTION udf_facturas_por_cliente(pi_id_cliente INT, pi_fecha_desde DATE, pi_fecha_hasta DATE) RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
	DECLARE suma_total DOUBLE;
    DECLARE valor_final VARCHAR(10) DEFAULT 'Sin Datos';
    SET suma_total = 
	(SELECT SUM(f.total) FROM clientes c
    LEFT JOIN facturas f ON c.id = f.id_cliente
    WHERE c.id = pi_id_cliente AND (f.fecha_factura BETWEEN pi_fecha_desde AND pi_fecha_hasta));
    IF suma_total IS NULL THEN RETURN valor_final;
    ELSEIF suma_total = 0 THEN RETURN valor_final;
    ELSE RETURN CAST(suma_total AS NCHAR(12));
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_facturacion_cliente(IN pi_fecha_desde DATE, IN pi_fecha_hasta DATE)
BEGIN
	SELECT *, udf_facturas_por_cliente(c.id, pi_fecha_desde, pi_fecha_hasta) AS Total FROM clientes c;
END$$
DELIMITER ;

CALL sp_facturacion_cliente('2010-02-01','2010-02-11');
CALL sp_facturacion_cliente('2010-02-01','2010-02-12');

-- 2. Vamos a generar un SP llamado calcular_impuesto(), donde vamos a pasarle un primer
-- parámetro de un valor de un producto y, como segundo parámetro, el impuesto que vamos a
-- calcularle a dicho valor. Una vez que realizamos el cálculo del impuesto, vamos a devolver en
-- el primer parámetro que teníamos, el valor del nuevo precio del producto con el impuesto
-- agregado. Probar el SSP con los siguientes valores: para el importe vamos a poner el valor
-- de 5000 y para el impuesto, vamos a ingresar el 21.

DELIMITER $$
CREATE PROCEDURE sp_calcular_impuesto(INOUT pi_valor_producto DOUBLE, IN pi_impuesto INT)
BEGIN
	SET pi_valor_producto = (pi_valor_producto*(pi_impuesto/100)) + pi_valor_producto;
END$$
DELIMITER ;

SET @valor_producto = 5000;
SET @impuesto = 21;
CALL sp_calcular_impuesto(@valor_producto, @impuesto);
SELECT @valor_producto;