-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: dhprestamos
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaident` varchar(10) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `Scoring_idScoring` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idclientes`,`Scoring_idScoring`),
  KEY `fk_clientes_Scoring_idx` (`Scoring_idScoring`),
  CONSTRAINT `fk_clientes_Scoring` FOREIGN KEY (`Scoring_idScoring`) REFERENCES `scoring` (`idScoring`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'101','Gomez','Alberto','1976-01-01',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuotas` (
  `idcuotas` int(11) NOT NULL,
  `idprestamo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idcuotas`,`idprestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
INSERT INTO `cuotas` VALUES (1,1,'2020-01-01',2000.00),(2,1,'2020-01-31',2000.00),(3,1,'2020-03-02',2000.00),(4,1,'2020-03-31',2000.00),(5,1,'2020-04-30',2000.00);
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `idPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Importe` decimal(10,2) DEFAULT NULL,
  `cantcuotas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPrestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,1,'2020-01-01',10000.00,5);
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoring`
--

DROP TABLE IF EXISTS `scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scoring` (
  `idScoring` int(11) NOT NULL,
  `Riesgo` varchar(45) DEFAULT NULL,
  `MaxImporte` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idScoring`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoring`
--

LOCK TABLES `scoring` WRITE;
/*!40000 ALTER TABLE `scoring` DISABLE KEYS */;
INSERT INTO `scoring` VALUES (1,'inicial',10000.00),(2,'alto',30000.00),(3,'medio',100000.00),(4,'bajo',500000.00);
/*!40000 ALTER TABLE `scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dhprestamos'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_diahabil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_diahabil`(fecha date) RETURNS date
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_validaedad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_validaedad`(fechanac  datetime, fechainicio datetime, cantcuo integer) RETURNS int(11)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cliente_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente_insert`(`pcedulaident` VARCHAR(10),`papellido` VARCHAR(45),`pnombres` VARCHAR(100),`pfecha_nac` DATE)
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



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Genera_cuota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Genera_cuota`(IN pImporte decimal(10,2) , pFechaInicio date, pCuotas int)
BEGIN
	declare valorCuota decimal(10,2) default 1;
    declare vCuota int ;
    declare fechaCuota date;
    set vCuota = 1;
    
    
    /* Valor de la cuota */
    set valorCuota = (pImporte / pCuotas) ;
	
    /*Creacion de tabla temporal para las cuotas */
    Drop table tmpCuotas;
    CREATE TEMPORARY TABLE tmpCuotas
		(nrocuota int, fecha date, importe decimal(10,2));
    
    set fechaCuota = pFechaInicio;
    WHILE vCuota <= pCuotas DO
		/*Select vCuota,valorCuota, fechaCuota;*/
        insert into tmpCuotas (nrocuota,fecha,importe) values  
        (vCuota,fn_diahabil(fechaCuota),valorCuota);
       set fechaCuota = Date_add(fechaCuota,Interval 30 day);
		Set vCuota = vCuota +1 ;
    END WHILE;
	Select 
		nrocuota as 'Nro de Cuota ',
        DATE_FORMAT(fecha,'%d %M %Y') as 'Fecha de Cuota',
        importe as 'Valor Cuota'
    from tmpCuotas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Prestamo`(IN pIdcliente int, pImporte decimal(10,2) , pFechaInicio date, pCuotas int, pTipo int)
sp: BEGIN
	declare valorCuota decimal(10,2) default 1;
    declare vCuota int ;
    declare fechaCuota date;
    
            
    set vCuota = 1;

	/* Valor de la cuota */
	set valorCuota = (pImporte / pCuotas) ;
	
	/*Creacion de tabla temporal para las cuotas */
	Drop table tmpCuotas;
	CREATE TEMPORARY TABLE tmpCuotas
		(nrocuota int, fecha date, importe decimal(10,2));
	
	set fechaCuota = pFechaInicio;
	WHILE vCuota <= pCuotas DO
		/*Select vCuota,valorCuota, fechaCuota;*/
		insert into tmpCuotas (nrocuota,fecha,importe) values  
		(vCuota,fn_diahabil(fechaCuota),valorCuota);
	   set fechaCuota = Date_add(fechaCuota,Interval 30 day);
		Set vCuota = vCuota +1 ;
	END WHILE;
    
    if ptipo = 1 then
		begin 
			Select 
				'Simulacion' as tipo,
				nrocuota as 'Nro de Cuota ',
				DATE_FORMAT(fecha,'%d %M %Y') as 'Fecha de Cuota',
				importe as 'Valor Cuota'
			from tmpCuotas;
		end;
	else
		begin
			/* Generar Cuotas */
			/* Valido Edad */
            Select @cli_fechaNac := clientes.fecha_Nac,
				   @cli_MaxImporte := scoring.MaxImporte
			from clientes 
            inner join Scoring on Scoring.idScoring = clientes.Scoring_IdScoring
            Where clientes.IdClientes=pIdcliente;
				
			/* Valido importe maximo permitido */ 
			if pImporte > @cli_MaxImporte THEN 
				Select 'Excede el importe maximo ' as err;
                LEAVE sp;
            END IF ;
            if (fn_validaedad(@cli_fechaNac,pFechaInicio,pCuotas) =0) THEN 
				Select 'Excede la edad permitida' as err;
                LEAVE sp;
            END IF ; 
            /* inserto el prestamo */
            INSERT INTO Prestamo
            (idcliente,fecha,importe,cantcuotas)
            values
            (pIdcliente,pFechaInicio,pimporte,pcuotas) ;
            set @idPrestamo = LAST_INSERT_ID();
            
            insert into cuotas
            (idcuotas,idprestamo,fecha,importe)
            Select nrocuota ,@idPrestamo,fecha,importe
			from tmpCuotas;
            
            
        end;
	END IF ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 23:25:43
