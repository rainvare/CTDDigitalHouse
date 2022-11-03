CREATE DATABASE dhprestamos;
USE dhprestamos;
CREATE TABLE `scoring` (
  `idScoring` int(11) NOT NULL,
  `Riesgo` varchar(45) DEFAULT NULL,
  `MaxImporte` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idScoring`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `scoring` WRITE;
/*!40000 ALTER TABLE `scoring` DISABLE KEYS */;
INSERT INTO `scoring` VALUES (1,'inicial',10000.00),(2,'alto',30000.00),(3,'medio',100000.00),(4,'bajo',500000.00);
/*!40000 ALTER TABLE `scoring` ENABLE KEYS */;
UNLOCK TABLES;


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



