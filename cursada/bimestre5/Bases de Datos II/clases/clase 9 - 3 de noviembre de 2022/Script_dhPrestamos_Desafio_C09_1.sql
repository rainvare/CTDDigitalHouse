create database dhprestamos;
use dhprestamos;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

