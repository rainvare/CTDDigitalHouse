-- ========================== PROYECTO - EL DESCUBIERTO ========================== --
-- =========================== RESOLUCION CHECKPOINT II ========================== --
-- Base de datos: el_descubierto.sql
-- Comando para habilitar la eliminación y actualización de registros: SET SQL_SAFE_UPDATES=0;


-- 1. Listar todos los clientes cuyo nombre comience con la letra "A". Se debe mostrar id como "Número de cliente", apellido y nombre.
SELECT id AS 'Número de cliente',  apellido, nombre  FROM cliente 
WHERE nombre LIKE 'A%';

-- 2. Mostrar el número de la sucursal con domicilio "Ramón Freire Serrano 7410".
SELECT numero AS 'Numero de sucursal' FROM sucursal 
WHERE domicilio = 'Ramón Freire Serrano 7410';

-- 3. Se requiere saber cuál es el mayor importe prestado
SELECT MAX(importe) AS 'Mayor importe prestado' FROM prestamo;

-- 4. Listar los pagos realizados con números 10, 14, 27, 45.
SELECT * FROM pago 
WHERE id IN (10, 14, 27, 45);

-- 5. Calcular el total de los pagos realizados para el préstamo número cuarenta. El reporte debe tener dos columnas denominadas "Número de préstamo" y el "Total pagado".
SELECT prestamo_id AS 'Número de prestamo', SUM(importe) AS 'Total pagado' FROM pago 
WHERE prestamo_id = 40;

-- 6. Listar los empleados que no pertenezcan a la sucursal dos y que la fecha de alta del contrato sea mayor que 5/09/21 o igual a 25/06/21. Ordenar por alta de contrato.
SELECT * FROM empleado 
WHERE sucursal_numero <> 2 AND (alta_contrato_laboral > '2021-09-5' OR alta_contrato_laboral = '2021-06-25')
ORDER BY alta_contrato_laboral;

-- 7. Listar los pagos realizados con importe entre $1030,25 a $1666,66 (ordenarlos por el importe pagado de mayor a menor).
SELECT * FROM pago 
WHERE importe BETWEEN 1030.25 AND 1666.66 
ORDER BY importe DESC;

-- 8. Mostrar el quinto pago realizado con menor importe.
SELECT * FROM pago 
ORDER BY importe 
LIMIT 1 OFFSET 4;

-- 9. Mostrar el préstamo con mayor importe. Este reporte debe contener el número del préstamo, la fecha de otorgamiento y el importe.
SELECT id AS 'Número', fecha_otorgado AS Fecha, importe FROM prestamo 
ORDER BY importe DESC 
LIMIT 1;

-- 10. Mostrar las diez cuentas bancarias con menor saldo. Este reporte debe contener el número de cuenta, saldo y el código del tipo de cuenta.
SELECT numero, saldo, cuenta_tipo_id FROM cuenta 
ORDER BY saldo 
LIMIT 10;

-- 11. Listar los préstamos otorgados entre 10/07/21 al 10/08/21 (ordenarlos por fecha de otorgamiento)
SELECT * FROM prestamo 
WHERE fecha_otorgado BETWEEN '2021-07-10' AND '2021-08-10' 
ORDER BY fecha_otorgado;

-- 12. Listar en forma ordenada las cuentas bancarias que tengan un descubierto otorgado superior o igual a $8999,80. 
SELECT * FROM cuenta 
WHERE descubierto_otorgado >= 8999.80 
ORDER BY descubierto_otorgado;

-- 13. Listar todos los empleados cuyo apellido termine con los caracteres "do". Se debe mostrar el legajo, apellido, nombre y email.
SELECT legajo, apellido, nombre, email FROM empleado 
WHERE apellido LIKE '%do';

-- 14. Se desea conocer cuál es el promedio de los saldos de las cajas de ahorro
SELECT AVG(saldo) AS saldo_promedio FROM cuenta 
WHERE cuenta_tipo_id = 1;

-- 15. Mostrar el tercer préstamo con mayor importe.
SELECT * FROM prestamo 
ORDER BY importe DESC 
LIMIT 1 OFFSET 2;

-- 16. Calcular la cantidad de cuentas que tiene la sucursal número cinco. El reporte debe tener dos columnas denominadas "Sucursal" y el "Cantidad de Cuentas".
SELECT sucursal_numero AS Sucursal, COUNT(*) AS 'Cantidad de Cuentas' FROM cuenta 
WHERE sucursal_numero = 5;

-- 17. Mostrar todas las ciudades que contengan una palabra de cinco caracteres, pero el tercer carácter debe ser igual a "n".
SELECT * FROM ciudad 
WHERE nombre LIKE '% __n__ %';

-- 18.  Modificar el tipo de cuenta bancaria "Cuenta Corriente" a "Cuenta Especial"
UPDATE cuenta_tipo SET tipo = 'Cuenta Especial' 
WHERE tipo = 'Cuenta Corriente';

-- 19. En la fecha de hoy, agregar en la sucursal número nueve al empleado Quinteros Arias Raúl Alejandro con domicilio en Av. 25 de mayo 7410 - Pilar - Buenos Aires, email: quiteros2021bs@gmail.com, teléfono móvil: '+5491154000745'.
INSERT INTO empleado (sucursal_numero, apellido, nombre, domicilio, ciudad_id, email, telefono_movil, alta_contrato_laboral) VALUES 
(9, 'Quinteros Arias', 'Raúl Alejandro', 'Av. 25 de mayo 7410', 14, 'quiteros2021bs@gmail.com', '+5491154000745', '2021-09-07');

-- 20. Eliminar el registro del préstamo número cuarenta y cinco
DELETE FROM pago WHERE prestamo_id = 45;
DELETE FROM cliente_x_prestamo WHERE prestamo_id = 45;
DELETE FROM prestamo WHERE id = 45;