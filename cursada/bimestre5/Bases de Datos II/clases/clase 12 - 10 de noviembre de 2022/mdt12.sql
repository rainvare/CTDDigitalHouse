-- Necesitamos crear una tabla de auditoría para la tabla creditCard. Queremos
-- saber quién y cuándo se realizaron insert, update, o delete.
-- Realizar la solución utilizando triggers.

CREATE TABLE `auditoriacreditcard` (
  `AuditoriaCreditCardId` int NOT NULL AUTO_INCREMENT,
  `CreditCardId` int DEFAULT NULL,
  `Accion` varchar(45) DEFAULT NULL,
  `Responsable` varchar(45) DEFAULT NULL,
  `FechaHora` datetime DEFAULT NULL,
  PRIMARY KEY (`AuditoriaCreditCardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DELIMITER $$
CREATE TRIGGER insertar_creditcard
AFTER INSERT ON creditcard FOR EACH ROW
BEGIN
	INSERT INTO auditoriacreditcard VALUES (DEFAULT, NEW.CreditCardId, 'Insert', CURRENT_USER(), NOW());
END $$

DELIMITER $$
CREATE TRIGGER editar_creditcard
BEFORE UPDATE ON creditcard FOR EACH ROW
BEGIN
	INSERT INTO auditoriacreditcard VALUES (DEFAULT, NEW.CreditCardId, 'Update', CURRENT_USER(), NOW());
END $$

DELIMITER $$
CREATE TRIGGER eliminar_creditcard
BEFORE DELETE ON creditcard FOR EACH ROW
BEGIN
	INSERT INTO auditoriacreditcard VALUES (DEFAULT, OLD.CreditCardId, 'Delete', CURRENT_USER(), NOW());
END $$


-- Necesitamos crear un procedimiento que inserte un registro en la tabla
-- creditCard y que devuelva un mensaje cuando hay un SQLEXCEPTION error.
-- Además, agregar las transacciones que sean necesarias. Cuando estemos
-- bajo un error, la transacción tiene que realizar un ROLLBACK.
-- Adjuntar tres ejecuciones del procedimiento donde se muestre que se devolvió
-- un error.

DROP PROCEDURE IF EXISTS SP_Genera_Error;
DELIMITER $$
CREATE PROCEDURE SP_Genera_Error(IN idQueGeneraError INT)
BEGIN
	DECLARE errorNumber INT;
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

		INSERT INTO creditcard VALUES (/*DEFAULT*/idQueGeneraError, 'Prueba', 'Vista', '123456789', 6,6, NOW());

        COMMIT;
        
    END;
END $$

CALL SP_Genera_Error(1);
CALL SP_Genera_Error(2);
CALL SP_Genera_Error(3);

-- Crear una subconsulta que devuelva todas las tarjetas de tipo Vista, que la
-- cantidad de números "3" de la tarjeta sea mayor a 2, y que esa tarjeta tenga
-- compras de un mismo producto en meses distintos.

SELECT DISTINCT creditcard.* FROM creditcard
INNER JOIN salesorderheader ON creditcard.CreditCardID = salesorderheader.CreditCardID
INNER JOIN salesorderdetail ON salesorderheader.SalesOrderID = salesorderdetail.SalesOrderID
WHERE LOCATE('3', RIGHT(CardNumber, CHAR_LENGTH(CardNumber) - LOCATE('3', CardNumber))) > 0 AND CardType = 'Vista' AND
	  creditcard.CreditCardID IN (SELECT SubCreditCard.CreditCardID FROM creditcard AS SubCreditCard
								  INNER JOIN salesorderheader AS SubSalesOrderHeader ON SubCreditCard.CreditCardID = SubSalesOrderHeader.CreditCardID
								  INNER JOIN salesorderdetail AS SubSalesOrderDetail ON SubSalesOrderHeader.SalesOrderID = SubSalesOrderDetail.SalesOrderID
								  WHERE SubCreditCard.CreditCardID = creditcard.CreditCardID AND SubSalesOrderDetail.ProductID = salesorderdetail.ProductID AND MONTH(salesorderheader.OrderDate) != MONTH(SubSalesOrderHeader.OrderDate)
								  );