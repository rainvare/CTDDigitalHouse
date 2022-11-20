
#Clase Repaso Checkpoint 
# Si lo puedo desarrollar con SQL, voy con SQL; Sino, aplico cursores ("for each") / etc

use emarket ;
-- Necesitamos crear una función que dada la cantidad de unidades pedidas y el nombre de un producto, 
-- validemos que tengamos la cantidad de unidades en stock necesaria para cubrir el pedido.

DELIMITER $$
CREATE FUNCTION validar_stock (cantidades_pedidas SMALLINT, producto VARCHAR(40))
RETURNS TINYINT DETERMINISTIC
BEGIN
	RETURN (CASE WHEN 
			(SELECT UnidadesStock - cantidades_pedidas FROM productos WHERE ProductoNombre = producto) 
            >= 0 THEN 1 ELSE 0 END);
END $$

 SELECT validar_stock(10, 'Ikura') ; -- > 1 
 SELECT validar_stock(40, 'Ikura') ; -- > 0
 
 SELECT *
	, validar_stock(10, productoNombre) 
 FROM productos;
 
 select * from productos;

-- Necesitamos crear una tabla de auditoría para la tabla de facturas. 
-- Crear algunos triggers para cada vez que insertamos registros en la tabla, para cada vez que modificamos registros 
-- y también para cuando eliminamos. La tabla tiene que tener un id propio, el id de la factura, la acción que se realizó,  el responsable de la misma y la fecha y hora. La tabla se genera una sola vez y queda registrada en nuestra base de datos (no hace falta que esté en los triggers).

CREATE TABLE `auditoriafacturas` (
  `AuditoriaFacturasId` int NOT NULL AUTO_INCREMENT,
  `FacturaId` int DEFAULT NULL,
  `Accion` varchar(45) DEFAULT NULL,
  `Responsable` varchar(45) DEFAULT NULL,
  `FechaHora` datetime DEFAULT NULL,
  PRIMARY KEY (`AuditoriaFacturasId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELIMITER $$
CREATE TRIGGER insertar_facturas
AFTER INSERT ON facturas FOR EACH ROW
BEGIN
	INSERT INTO auditoriafacturas VALUES (DEFAULT, NEW.FacturaId, 'Insert', CURRENT_USER(), NOW());
END $$

DELIMITER $$
CREATE TRIGGER editar_facturas
BEFORE UPDATE ON facturas FOR EACH ROW
BEGIN
	INSERT INTO auditoriafacturas VALUES (DEFAULT, NEW.FacturaId, 'Update', CURRENT_USER(), NOW());
END $$

DELIMITER $$
CREATE TRIGGER eliminar_facturas
BEFORE DELETE ON facturas FOR EACH ROW
BEGIN
	INSERT INTO auditoriafacturas VALUES (DEFAULT, OLD.FacturaId, 'Delete', CURRENT_USER(), NOW());
END $$

-- INSERT INTO facturas (ClienteID) VALUES ('ALFKI');
-- UPDATE facturas SET EnvioVia = 2 WHERE FacturaID = 11079;
-- DELETE FROM facturas WHERE FacturaID = 11079;
-- SELECT * FROM auditoriafacturas;

-- Crear un stored procedure SP_Genera_Factura que, dado un nombre de un producto, la cantidad del mismo, el nombre del cliente (compañía), el nombre del empleado, apellido del mismo y el nombre de la compañía de correo, genere el detalle de la factura y el encabezado de la misma. Nuestras facturas, solo van a tener 1 detalle y 1 registro de factura.
-- Tener en cuenta:
-- No validar lógicamente si no encontramos un empleado o un producto, etc. por su nombre.
-- No se puede generar una factura que supere la cantidad de unidades en stock (usar la función del punto 1).
-- Para las facturas, para todas las fechas usar el día y hora actual. El envío vía es el id de nuestro correo, el valor del transporte es gratis y el nombre es FULL.  La dirección de la factura y de envío es la misma que la del cliente.
-- Para los detalles de facturas, no tenemos descuentos nunca y el precio unitario lo obtenemos del producto.
-- Cuando guardemos las facturas, vamos a estar utilizando indirectamente el trigger del punto 2.
-- Además, agregar las transacciones y handlers que sean necesarios. Cuando estemos bajo un error, la transacción tiene que realizar un ROLLBACK.

DROP PROCEDURE IF EXISTS SP_Genera_Factura;
DELIMITER $$
CREATE PROCEDURE SP_Genera_Factura(IN pproducto VARCHAR(40), IN pcantidad SMALLINT, IN pcliente VARCHAR(40), IN pnombre VARCHAR(10), IN papellido VARCHAR(20), pcorreo VARCHAR(40))
BEGIN
	DECLARE varproductoId, varempleadoId, varcorreoId, varfacturaId, errorNumber INT;
	DECLARE varclienteId CHAR(5);
    DECLARE vardireccion VARCHAR(60);
    DECLARE varciudad, varregion, varpais VARCHAR(15);
    DECLARE varpostal VARCHAR(10);
    DECLARE varprecioUnitario DOUBLE;
    DECLARE message VARCHAR(255);
    
    START TRANSACTION;
    BEGIN
		
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
        
            GET DIAGNOSTICS CONDITION 1
                errorNumber = MYSQL_ERRNO,
                message = MESSAGE_TEXT;
                
            ROLLBACK;
            
            SELECT errorNumber, message;
        END;
		
        SET varproductoId = (SELECT ProductoID FROM productos WHERE ProductoNombre = pproducto);
        SET varclienteId = (SELECT ClienteID FROM clientes WHERE Compania = pcliente);
        SET varempleadoId = (SELECT EmpleadoID FROM empleados WHERE Nombre = pnombre AND Apellido = papellido);
        SET varcorreoId = (SELECT CorreoID FROM correos WHERE Compania = pcorreo);
        SET varprecioUnitario = (SELECT PrecioUnitario FROM productos WHERE ProductoID = varproductoId);
        
        SELECT Direccion, Ciudad, Regiones, CodigoPostal, Pais INTO vardireccion, varciudad, varregion, varpostal, varpais FROM clientes
        WHERE ClienteID = varclienteId;
        
		IF ((SELECT validar_stock(pcantidad, pproducto)) = 1) THEN
        
			INSERT INTO facturas VALUES (DEFAULT, varclienteId, varempleadoId, NOW(), NOW(), NOW(), varcorreoId, 0, 'FULL', vardireccion, varciudad, varregion, varpostal, varpais);
            
            SET varfacturaId = LAST_INSERT_ID();
            INSERT INTO facturadetalle VALUES (varfacturaId, varproductoId, varprecioUnitario, pcantidad, 0);
            
        END IF;
        
        COMMIT;
        
    END;
END $$

-- CALL SP_Genera_Factura('Tofu', 40, 'Wolski  Zajazd', 'Andrew', 'Fuller', 'UPS');
-- CALL SP_Genera_Factura('Tofu', 30, 'Wolski  Zajazd', 'Andrew', 'Fuller', 'UPS');
-- SELECT * FROM facturas ORDER BY FacturaID DESC LIMIT 1;
-- SELECT * FROM facturadetalle ORDER BY FacturaID DESC LIMIT 1;
-- SELECT * FROM auditoriafacturas ORDER BY FacturaID DESC LIMIT 1;

-- Luego de un tiempo, nuestros clientes nos pidieron que el SP_Genera_Factura, debe ser más inteligente. Cuando intentamos generar una factura que supera el stock del producto indicado, insertar un registro en la tabla pedidoproveedor donde vamos a indicar el id del artículo que necesitamos, el id del proveedor, la fecha del pedido y la cantidad que necesitamos (la diferencia entre las unidades en stock y las que necesitamos para la factura). Una vez hecho esto, devolvemos un mensaje: ‘No hay stock por el momento, pero ya se hizo el pedido a nuestro proveedor para contar con las unidades faltantes’.
-- Crear una tabla llamada pedidoproveedor con los datos necesarios antes de realizar la modificación del SP_Genera_Factura. La tabla se genera una sola vez y queda registrada en nuestra base de datos (no hace falta que esté en el SP).

CREATE TABLE `emarket`.`pedidoproveedor` (
  `PedidoProveedorId` INT NOT NULL AUTO_INCREMENT,
  `ProductoID` INT NULL,
  `ProveedorID` INT NULL,
  `Fecha` DATETIME NULL,
  `Cantidad` SMALLINT NULL,
  PRIMARY KEY (`PedidoProveedorId`));

DROP PROCEDURE IF EXISTS SP_Genera_Factura;
DELIMITER $$
CREATE PROCEDURE SP_Genera_Factura(IN pproducto VARCHAR(40), IN pcantidad SMALLINT, IN pcliente VARCHAR(40), IN pnombre VARCHAR(10), IN papellido VARCHAR(20), pcorreo VARCHAR(40))
BEGIN
	DECLARE varproductoId, varempleadoId, varcorreoId, varfacturaId, errorNumber, vardiferencia, varproveedorId INT;
	DECLARE varclienteId CHAR(5);
    DECLARE vardireccion VARCHAR(60);
    DECLARE varciudad, varregion, varpais VARCHAR(15);
    DECLARE varpostal VARCHAR(10);
    DECLARE varprecioUnitario DOUBLE;
    DECLARE message VARCHAR(255);
    
    START TRANSACTION;
    BEGIN
		
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
        
            GET DIAGNOSTICS CONDITION 1
                errorNumber = MYSQL_ERRNO,
                message = MESSAGE_TEXT;
                
            ROLLBACK;
            
            SELECT errorNumber, message;
        END;
		
        SET varproductoId = (SELECT ProductoID FROM productos WHERE ProductoNombre = pproducto);
        SET varclienteId = (SELECT ClienteID FROM clientes WHERE Compania = pcliente);
        SET varempleadoId = (SELECT EmpleadoID FROM empleados WHERE Nombre = pnombre AND Apellido = papellido);
        SET varcorreoId = (SELECT CorreoID FROM correos WHERE Compania = pcorreo);
        SET varprecioUnitario = (SELECT PrecioUnitario FROM productos WHERE ProductoID = varproductoId);
        
        SELECT Direccion, Ciudad, Regiones, CodigoPostal, Pais INTO vardireccion, varciudad, varregion, varpostal, varpais FROM clientes
        WHERE ClienteID = varclienteId;
        
		IF ((SELECT validar_stock(pcantidad, pproducto)) = 1) THEN
        
			INSERT INTO facturas VALUES (DEFAULT, varclienteId, varempleadoId, NOW(), NOW(), NOW(), varcorreoId, 0, 'FULL', vardireccion, varciudad, varregion, varpostal, varpais);
            
            SET varfacturaId = LAST_INSERT_ID();
            INSERT INTO facturadetalle VALUES (varfacturaId, varproductoId, varprecioUnitario, pcantidad, 0);
		
        ELSE
        
			SELECT pcantidad - UnidadesStock, ProveedorID INTO vardiferencia, varproveedorId FROM productos WHERE ProductoID = varproductoId;
        
			INSERT INTO pedidoproveedor VALUES (DEFAULT, varproductoId, varproveedorId,  NOW(), vardiferencia);
            
            SELECT 'No hay stock por el momento, pero ya se hizo el pedido a nuestro proveedor para contar con las unidades faltantes' AS Resultado;
            
        END IF;
        
        COMMIT;
        
    END;
END $$

-- CALL SP_Genera_Factura('Tofu', 40, 'Wolski  Zajazd', 'Andrew', 'Fuller', 'UPS');

-- Ahora vamos a generar un nuevo SP llamado SP_Genera_Factura_Varios_productos donde recibimos la misma cantidad de parámetros que SP_Genera_Factura, pero en vez de recibir el nombre de 1 producto, vamos a recibir los ids de varios productos en un VARCHAR.
-- Tener en cuenta:
-- Usar un cursor para recorrer todos los registros de los productos. Tip para filtrar los productos por los ids en un VARCHAR: FIND_IN_SET.
-- Debemos registrar 1 solo registro de factura y 1 registro por cada producto que nos devuelve nuestra query.


DROP PROCEDURE IF EXISTS SP_Genera_Factura_Varios_productos;
DELIMITER $$
CREATE PROCEDURE SP_Genera_Factura_Varios_productos (IN pproductosids VARCHAR(50), IN pcantidad SMALLINT, IN pcliente VARCHAR(40), IN pnombre VARCHAR(10), IN papellido VARCHAR(20), pcorreo VARCHAR(40))
BEGIN
	DECLARE varproductoId, varempleadoId, varcorreoId, varfacturaId, errorNumber, vardiferencia, varproveedorId INT;
	DECLARE varclienteId CHAR(5);
    DECLARE vardireccion VARCHAR(60);
    DECLARE varciudad, varregion, varpais VARCHAR(15);
    DECLARE varpostal VARCHAR(10);
    DECLARE varprecioUnitario DOUBLE;
    DECLARE message VARCHAR(255);
    DECLARE varnombreproducto VARCHAR(40);
    DECLARE finished TINYINT DEFAULT 0;
    
    DECLARE cur CURSOR FOR SELECT ProductoID, ProductoNombre, PrecioUnitario 
							FROM Productos WHERE FIND_IN_SET(ProductoID, pproductosids);
							-- FROM TABLA TEMPORAL
                            -- FROM VISTA
    START TRANSACTION;
    BEGIN
    
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1; -- Este handler es para dar finalizado el cursor - No tiene registros
        
        DECLARE EXIT HANDLER FOR SQLEXCEPTION					-- Este handler es para hacer rollback de la transaccion y mostrar el error
        BEGIN
        
            GET DIAGNOSTICS CONDITION 1
                errorNumber = MYSQL_ERRNO,
                message = MESSAGE_TEXT;
                
            ROLLBACK;
            
            SELECT errorNumber, message; -- @step 
        END;
		-- @step = 1
        SET varclienteId = (SELECT ClienteID FROM clientes WHERE Compania = pcliente);
        SET varempleadoId = (SELECT EmpleadoID FROM empleados WHERE Nombre = pnombre AND Apellido = papellido);
        SET varcorreoId = (SELECT CorreoID FROM correos WHERE Compania = pcorreo);
        -- @step = 2
        SELECT Direccion, Ciudad, Regiones, CodigoPostal, Pais INTO vardireccion, varciudad, varregion, varpostal, varpais FROM clientes
        WHERE ClienteID = varclienteId;
        
        
        -- @step = 3
        OPEN cur;

		recorre: LOOP
        FETCH cur INTO varproductoId, varnombreproducto, varprecioUnitario;
        
        IF finished = 1 THEN
            LEAVE recorre;
        END IF;
        
		IF ((SELECT validar_stock(pcantidad, varnombreproducto)) = 1) THEN
        
			IF (varfacturaId IS NULL) THEN
            
				INSERT INTO facturas VALUES (DEFAULT, varclienteId, varempleadoId, NOW(), NOW(), NOW(), varcorreoId, 0, 'FULL', vardireccion, varciudad, varregion, varpostal, varpais);
            -- Call usp_facturas_Insert()
				SET varfacturaId = LAST_INSERT_ID();
                
            END IF;
            -- Call usp_facturadatelle_Insert()
            INSERT INTO facturadetalle VALUES (varfacturaId, varproductoId, varprecioUnitario, pcantidad, 0);
		
        ELSE
			
            ROLLBACK;
			
			SELECT pcantidad - UnidadesStock, ProveedorID INTO vardiferencia, varproveedorId FROM productos WHERE ProductoID = varproductoId;
			
            -- Call usp_pedidoproveedor_Insert()
			INSERT INTO pedidoproveedor VALUES (DEFAULT, varproductoId, varproveedorId,  NOW(), vardiferencia);
            
            SELECT 'No hay stock por el momento para algunos de los productos, pero ya se hizo el pedido a nuestro proveedor para contar con las unidades faltantes' AS Resultado;
            
        END IF;

		END LOOP;
		CLOSE cur;

		COMMIT; 
        
    END;
END $$



insert into facturas()
 SELECT ProductoID, ProductoNombre, PrecioUnitario 
							FROM Productos WHERE FIND_IN_SET(ProductoID, pproductosids)
                            AND validar_stock(20, productoNombre) = 1;

insert into facturadetalle()



START TRANSACTION;
INSERT INTO factura()
 SELECT ProductoID, ProductoNombre, PrecioUnitario 
							FROM Productos WHERE FIND_IN_SET(ProductoID, pproductosids)
                            AND validar_stock(20, productoNombre) = 0;
insert into factura_detalle()
 SELECT ProductoID, ProductoNombre, PrecioUnitario 
							FROM Productos WHERE FIND_IN_SET(ProductoID, pproductosids)
                            AND validar_stock(20, productoNombre) = 1;
update factura set precio  =10000 
where year(fechaCreacion) = 2022


-- 500 
-- Expected output: insertados en facturas + instertados en pedidosProveedor= 500 





-- CALL SP_Genera_Factura('1,2', 1, 'Wolski  Zajazd', 'Andrew', 'Fuller', 'UPS');
-- SELECT * FROM facturas ORDER BY FacturaID DESC LIMIT 2;
-- SELECT * FROM facturadetalle ORDER BY FacturaID DESC LIMIT 2;
-- SELECT * FROM auditoriafacturas ORDER BY FacturaID DESC LIMIT 2;