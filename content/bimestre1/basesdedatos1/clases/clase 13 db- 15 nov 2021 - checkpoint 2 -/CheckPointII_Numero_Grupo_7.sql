-- CheckPointII_Numero_Grupo_7

-- Camada 1021TDIIBD1C1LAED1021FT

/* Integrantes: 
-Réquiz, Indira
-Lanza, Simón
- Adán, Mateo
-Peraza, Natalia
/*


- - CheckPoint II
/* 1. Listar todos los clientes cuyo nombre comience con la letra "A". 
Se debe mostrar id como "Número de cliente", apellido y nombre.*/
SELECT id as "numero de cliente", nombre, apellido FROM cliente
WHERE nombre LIKE "A%";
-- 5 row(s)

-- 2. Mostrar el número de la sucursal con domicilio "Ramón Freire Serrano 7410"

SELECT Ciudad_id FROM sucursal
WHERE domicilio LIKE "Ramón Freire Serrano 7410";
-- 1row


-- 3. Se requiere saber cuál es el mayor importe prestado
SELECT max(importe) FROM prestamo;
-- 1 row

-- 4. Listar los pagos realizados con números 10, 14, 27, 45.
SELECT * FROM pago
WHERE id IN (10, 14, 27, 45);
-- 4 row

/*5. Calcular el total de los pagos realizados para el préstamo número cuarenta. El
reporte debe tener dos columnas denominadas "Número de préstamo" y el
"Total pagado".*/
SELECT  id as "Número de préstamo", importe as "Total pagado" FROM prestamo
WHERE id = 40;
-- 1 row

/*6. Listar los empleados que no pertenezcan a la sucursal dos y que la fecha de alta
del contrato sea mayor que 5/09/21 o igual a 25/06/21. Ordenar por alta de
contrato.*/
SELECT nombre, apellido
FROM empleado
WHERE sucursal_numero != 2
AND alta_contrato_laboral > 5/09/21
OR alta_contrato_laboral = 35/06/21
ORDER BY alta_contrato_laboral;
-- 47 rows

/*7. Listar los pagos realizados con importe entre $1030,25 a $1666,66 (ordenarlos
por el importe pagado de mayor a menor).*/

SELECT id , importe
FROM pago
WHERE importe BETWEEN 1030.25 AND 1666.66
ORDER BY importe DESC;
-- 14 rows

-- 8. Mostrar el quinto pago realizado con menor importe.
SELECT id, importe
FROM pago
ORDER BY importe 
LIMIT 1
OFFSET 4;
-- 1 row

/*9. Mostrar el préstamo con mayor importe. Este reporte debe contener el número
del préstamo, la fecha de otorgamiento y el importe.*/
SELECT id, importe
FROM prestamo
ORDER BY importe DESC
LIMIT 1;
-- 1 row

/* 10. Mostrar las diez cuentas bancarias con menor saldo. Este reporte debe contener
el número de cuenta, saldo y el código del tipo de cuenta.*/
SELECT numero, saldo, cuenta_tipo_id
FROM cuenta
ORDER BY saldo
LIMIT 10;
-- 10 rows


/* 11. Listar los préstamos otorgados entre 10/07/21 al 10/08/21 (ordenarlos por fecha
de otorgamiento)*/ 

SELECT id , fecha_otorgado
FROM prestamo
WHERE fecha_otorgado BETWEEN "2021-07-10" AND 
"2021-08-10"
ORDER BY fecha_otorgado;
-- 10 row

/* 12. Listar en forma ordenada las cuentas bancarias que tengan un descubierto
otorgado superior o igual a $8999,80.*/
SELECT numero FROM cuenta
WHERE descubierto_otorgado >= 8999.80;
-- 10 row(s) returned


/* 13. Listar todos los empleados cuyo apellido termine con los caracteres "do". Se
debe mostrar el legajo, apellido, nombre y email.*/
SELECT legajo, apellido, nombre, email FROM empleado
WHERE apellido LIKE "%do";
-- 4 row(s) returned

-- 14. Se desea conocer cuál es el promedio de los saldos de las cajas de ahorro
SELECT AVG(saldo) FROM cuenta 
 WHERE cuenta_tipo_id = 1;
 -- 1 row(s) returned
 
-- 15. Mostrar el tercer préstamo con mayor importe.
SELECT * FROM prestamo
ORDER BY importe
LIMIT 1
OFFSET 2;
-- 1 row(s) returned

/* 16. Calcular la cantidad de cuentas que tiene la sucursal número cinco. El reporte
debe tener dos columnas denominadas "Sucursal" y el "Cantidad de Cuentas"*/
Select sucursal_numero as "Sucursal",
count(numero) as "Cantidad de Cuentas" from cuenta
Where sucursal_numero =5 ;
-- 1ROW

/*17. Mostrar todas las ciudades que contengan una palabra de cinco caracteres, pero
el tercer carácter debe ser igual a "n".*/
Select nombre from ciudad
Where nombre like "__n__ %";
-- 2 row

 -- 18. Modificar el tipo de cuenta bancaria "Cuenta Corriente" a "Cuenta Especial"
update cuenta_tipo set tipo = "Cuenta Especial" 
where  id =1;
-- 1 rom
 
/* 19. En la fecha de hoy, agregar en la sucursal número nueve al empleado Quinteros
Arias Raúl Alejandro con domicilio en Av. 25 de mayo 7410 - Pilar - Buenos Aires,
mail: quiteros2021bs@gmail.com, teléfono móvil: '+5491154000745'.*/

insert into empleado (sucursal_numero, apellido, nombre, domicilio, ciudad_id, email, telefono_movil, alta_contrato_laboral ) values (9, 'Quinteros
Arias', 'Raúl Alejandro', 'Av. 25 de mayo 7410 - Pilar', 1, 'quiteros2021bs@gmail.com',  '+5491154000745', '2021-11-15');
-- 1 row

-- 20. Eliminar el registro del préstamo número cuarenta y cinco
delete from cliente_x_prestamo where prestamo_id = 45;
-- 1row

/* Se solicita
● Generar una consulta SQL por cada uno de los puntos de la consigna.
● Armar un solo documento (.sql) que contenga todos los puntos de la consigna y
las correspondientes consultas SQL. El mismo deberá:
○ Tener como nombre de archivo: CheckPointII_Numero_Grupo
○ En el inicio de la primera hoja del documento deberá incluir el código de
la camada, número de grupo y los nombres de todos los integrantes.
○ Debajo de cada consulta SQL, se debe escribir de forma comentada el
número de la cantidad de registros que devuelve.*/







