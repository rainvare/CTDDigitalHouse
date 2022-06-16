CREATE DATABASE  IF NOT EXISTS `el_descubierto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `el_descubierto`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: dbmysqlariel.cskgslsmqktz.us-east-2.rds.amazonaws.com    Database: el_descubierto
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigo_postal` char(10) NOT NULL,
  `pais_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudad_pais1_idx` (`pais_id`),
  CONSTRAINT `fk_ciudad_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Santiago - Santiago	',' 8320000	',4),(2,'Villa Krause - San Juan','5425',1),(3,'Monroe - Buenos Aires','2743',1),(4,'Las Heras - Mendoza','5539',1),(5,'Valle de San Juan - Tolima','733020',5),(6,'Las Condes - Santiago','7550000',4),(7,'Rivadavia - San Juan','5400',1),(8,'Santander - Concepción','681511',5),(9,'Abasto - Buenos Aires','1903',1),(10,'San Miguel - Tucumán','4105',1),(11,'São Pedro da Aldeia - Rio de Janeiro','28940',3),(12,'La Rioja - La Rioja','5300',1),(13,'Santa Lucía - Canelones','16306',19),(14,'Pilar - Buenos Aires','1629',1),(15,'Chepes - La Rioja','5470',1),(16,'Lujan de Cuyo - Mendoza','5507',1),(17,'Viña del Mar - Valparaíso','2520000',4),(18,'Villa Don Bosco - Santa Fé','3000',1),(19,'9 de Julio - San Juan','5417',1),(20,'Córdoba - Córdoba','5000',1),(21,'San Justo - Buenos Aires','1754',1),(22,'San Luis - San Luis','5700',1),(23,'Isidro Casanova - Buenos Aires','1765',1),(24,'San Luis - Tolima','733001',5),(25,'Punta Carretas - Montevideo','11300',19),(26,'Salamina - Caldas','172001',5),(27,'Toledo - Antioquia','052050',5),(28,'Alsina - Buenos Aires','2938',1),(29,'San Bernardo del Viento - Córdoba','231501',5),(30,'Montevideo - Montevideo','11000',19),(31,'Capilla del Monte - Córdoba','5118',1),(32,'San Rafael - Mendoza','5600',1),(33,'Cabo Frio - Rio de Janeiro','28905',3),(34,'Medellín - Antioquia','050022',5),(35,'Ciudad de la Costa - Canelones','15005',19),(36,'San Jorge - Buenos Aires','7404',1),(37,'Concón - Valparaíso','2510000',4),(38,'Chacabuco - Catamarca','4700',1),(39,'Rawson - Chubut','9103',1),(40,'Puerto Madryn - Chubut','9120',1),(41,'Cosquin - Córdoba','5166',1),(42,'Salta - Salta','4400',1),(43,'Tigre - Buenos Aires','1648',1),(44,'Bogotá - Bogotá','118942',5),(45,'Rosario - Santa Fé','2000',1),(46,'Puerto la Plata - Buenos Aires','1925',1),(47,'Independencia - Santiago','8380000',4),(48,'San Fernando - Buenos Aires','1646',1),(49,'Villa Mercedes - San Luis','5730',1),(50,'Arauquita -  Arauca','816010',5);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `domicilio` varchar(70) NOT NULL,
  `ciudad_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono_movil` char(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_ciudad1_idx` (`ciudad_id`),
  CONSTRAINT `fk_cliente_ciudad1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Medina','Juan Luis','Av España 1477 sur',2,'medina@gamil.com','+5492645887741'),(2,'Manrique','Maria Laura','San Martin 325 oeste',2,'manrique@gmail.com','+5492645814545'),(3,'Acuña Ruiz','David','Juan Antonio Lavalleja piso 4 dpto. 13',12,'david@hotmail.com','+5499416441020'),(4,'Alaníz','Mario Rubén','Juan Antonio Lavalleja piso 2 dpto. 11',35,'mario.ruben@gmail.com','+59824157067'),(5,'Torres','Camilo','25 De Mayo 533',2,'camilo@hotmail.com','+5492645881234'),(6,'Martinez Páez','Patricia Liliana','25 de Mayo 522',21,'patricia.liliana@gmail.com','+5491153013300'),(7,'Tello','María Virginia','Villa Lourdes Mza. H Casa 10',27,'maria.virginia@hotmail.com','+562239109080'),(8,'Mercado','Joel','Benjamin Harrison 984',17,'joel@hotmail.com','+5491155110014'),(9,'Acuña','Marian','Calle John F. Kennedy 100',10,'marian@gmail.com','+5493815201055'),(10,'Castro','Nicole','Calle 5 y Santa Rosa 457',38,'nicole@hotmail.com','+5492646334001'),(11,'Mercado Alaníz','Paulina Estela','Córdoba 1254 sur',16,'paulina.estela@hotmail.com','+5492616120045'),(12,'Farina','Daniel Fernando','Av. Daniela Santos 1550',38,'daniel.fernando@hotmail.com','+5492664551002'),(13,'Ferreyra','Carlos Martín','George Washington 245',21,'carlos.martin@hotmail.com','+5491153456987'),(14,'Cabrera','Ignacio Andrés','Calle 13 Dpto. 22',24,'ignacio.andres@hotmail.com','+573105604100'),(15,'Gómez Arguello','Armando Joel','Esteban Echeverria 1100',45,'armando.joel@hotmail.com','+5493416106060'),(16,'Salcedo','Sonia Estefanía','John F. Kennedy 240',47,'sonia.estefania@live.com','+569984904451'),(17,'Manentti','Abraham David','Libertad 3250',2,'abraham.david@hotmail.com','+5492645887744'),(18,'Gómez','Juan David','Ángela Camacho 544',5,'juan.david@live.com','+573106415577'),(19,'Suárez López','Maria Luciana','Av. Rosa Parks 2330',3,'maria.luciana@gmail.com','+5491155161247'),(20,'Gonzalez Pérez','Martina','Saturnino Sarasa 756',7,'martina@hotmail.com','+5492646220012'),(21,'Beltran','Ariadna Lucia','Álvaro Uribe 544',38,'ariadna.lucia@hotmail.com','+5492665457710'),(22,'Garcia','Catalina Denise','Villa Angelica mnblc. G piso 5 dpto. 3',29,'catalina.denise@hotmail.com','+5499416123123'),(23,'López Beltran','Daniela','Av. Sarmiento 952 oeste',14,'daniela@gmail.com','+5491152004577'),(24,'Vargas Ariza','Ana Belen','Simón Bolívar 1255',35,'ana.belen@gmail.com','+59824224578'),(25,'Figueroa Martínez','Maria Alejandra','Manuel Eyzaguirre 1200',20,'maria.alejandra@gmail.com','+5491151234471'),(26,'Puerta Castro','Lorena Sofía','P. A. Sarmiento 122',23,'lorena.sofia@hotmail.com','+5491159088900'),(27,'Pérez Gómez','Pablo Ariel','9 de Julio 300 este',6,'pablo.ariel@hotmail.com','+56921000145'),(28,'Gutierrez Díaz','Victoria Belen','Las palmeras 200 casa 10',25,'victoria.belen@live.com','+573105001255'),(29,'Aguirre','David Antonio','Villa Don Tomás Mza. A Casa 6',17,'david.antonio@gmail.com','+5491155062278'),(30,'Gonzalez','Virginia','Av. Emmeline Pankhurst 3410',12,'virginia@yahoo.com','+5499415662580'),(31,'Palermo','Serena Martina','Manuel Blanco Encalada 1455',10,'serena.martina@hotmail.com','+5493815662312'),(32,'Peña','Carla Trinidad','Barrio Los Andes mnblc. A piso 2 dpto. B',29,'carla.trinidad@yahoo.com','+5499416445500'),(33,'Mercado','Mariana Edith','Barrio Neuquen mnblc. B piso 3 dpto. 5',41,'mariana.edith@hotmail.com','+5493515998070'),(34,'Salcedo','Zoe','John Adam 5573 este',20,'zoe@hotmail.com','+5491151233215'),(35,'Cantoni Castro','Patricia Abigaíl','Benjamin Harrison 9822',29,'patricia.abi@gmail.com','+5531521037054'),(36,'Olave Torres','Santiago Alberto','Carlos Ibáñez piso 3 dpto. 13',16,'santiago.alberto@gmail.com','+5492616445500'),(37,'Figueroa Martín','Simon Juan','Luis Alberto Lacalle 300 piso 6 dpto. 13',1,'simon.juan@gmail.com','+56221233681'),(38,'Vargas Gonzalez','Ricardo Emanuel','Ramón Freire Serrano 4500',38,'ricardo.emanuel@gmail.com','+5499416566806'),(39,'Vasquez Saiz','Juan David','Villa Don Tomás Mza. C Casa 26',39,'juan.david@live.com','+5492805448024'),(40,'Espinel','Damián Alejandro','Ada Lovelace piso 2 dpto. 10',14,'dami.alejandro@gmail.com','+5491155004711'),(41,'Ontiveros','Omar','Simón Bolívar 4582',28,'omar@hotmail.com','+5491159875587'),(42,'Díaz Ferreyra','Lucia','Av. libertador 3578 este',47,'lucia@hotmail.com','+569984850530'),(43,'Cabrera','Tamara','Av. almirante brown 1255',41,'tamara@hotmail.com','+5493515991155'),(44,'Torres Peña','Mario Manuel','Las palmas 4511 sur',20,'mar2021x@gmail.com','+5491151231414'),(45,'Gonzalez Gonzalez ','Ariel','Buenos Aires 300',12,'arielgonz@yahoo.com','+5499415655122');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_x_cuenta`
--

DROP TABLE IF EXISTS `cliente_x_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_x_cuenta` (
  `cliente_id` int NOT NULL,
  `cuenta_numero` int NOT NULL,
  PRIMARY KEY (`cliente_id`,`cuenta_numero`),
  KEY `fk_cliente_has_cuenta_cuenta1_idx` (`cuenta_numero`),
  KEY `fk_cliente_has_cuenta_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_cliente_has_cuenta_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_cliente_has_cuenta_cuenta1` FOREIGN KEY (`cuenta_numero`) REFERENCES `cuenta` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_x_cuenta`
--

LOCK TABLES `cliente_x_cuenta` WRITE;
/*!40000 ALTER TABLE `cliente_x_cuenta` DISABLE KEYS */;
INSERT INTO `cliente_x_cuenta` VALUES (1,10501),(2,10502),(16,10503),(5,10504),(15,10505),(4,10506),(6,10507),(13,10507),(30,10508),(3,10509),(11,10510),(18,10511),(18,10512),(20,10513),(23,10514),(40,10514),(30,10515),(19,10516),(41,10517),(29,10518),(5,10519),(17,10519),(14,10520),(18,10521),(25,10522),(23,10523),(38,10524),(15,10525),(14,10526),(42,10527),(36,10528),(20,10529),(9,10530),(34,10531),(10,10532),(24,10533),(30,10534),(5,10535),(40,10536),(27,10537),(37,10538),(35,10539),(3,10540),(27,10541),(30,10542),(41,10543),(22,10544),(31,10545),(15,10546),(24,10547),(40,10548),(12,10549),(8,10550),(32,10551),(36,10552),(20,10553),(20,10554),(37,10555),(21,10556),(15,10557),(16,10558),(20,10559),(20,10560),(4,10561);
/*!40000 ALTER TABLE `cliente_x_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_x_prestamo`
--

DROP TABLE IF EXISTS `cliente_x_prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_x_prestamo` (
  `cliente_id` int NOT NULL,
  `prestamo_id` int NOT NULL,
  PRIMARY KEY (`cliente_id`,`prestamo_id`),
  KEY `fk_cliente_has_prestamo_prestamo1_idx` (`prestamo_id`),
  KEY `fk_cliente_has_prestamo_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_cliente_has_prestamo_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_cliente_has_prestamo_prestamo1` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_x_prestamo`
--

LOCK TABLES `cliente_x_prestamo` WRITE;
/*!40000 ALTER TABLE `cliente_x_prestamo` DISABLE KEYS */;
INSERT INTO `cliente_x_prestamo` VALUES (17,1),(23,2),(18,3),(3,4),(20,5),(40,6),(4,7),(14,8),(30,9),(19,10),(23,11),(42,12),(3,13),(24,14),(15,15),(6,16),(22,17),(15,18),(20,19),(19,20),(27,21),(6,22),(19,23),(11,24),(1,25),(5,25),(41,26),(30,27),(4,28),(35,29),(19,30),(6,31),(18,32),(22,33),(32,33),(18,34),(15,35),(4,36),(27,37),(21,38),(18,39),(37,40),(20,41),(15,42),(30,43),(18,44),(36,45),(18,46),(18,47);
/*!40000 ALTER TABLE `cliente_x_prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `sucursal_numero` int NOT NULL,
  `cuenta_tipo_id` int NOT NULL,
  `saldo` float(15,2) NOT NULL DEFAULT '0.00',
  `tipo_interes_id` int DEFAULT NULL,
  `descubierto_otorgado` float(15,2) NOT NULL DEFAULT '0.00',
  `activa` tinyint NOT NULL DEFAULT '0',
  `ejecutivo_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_cuenta_cuenta_tipo1_idx` (`cuenta_tipo_id`),
  KEY `fk_cuenta_tipo_interes1_idx` (`tipo_interes_id`),
  KEY `fk_cuenta_sucursal1_idx` (`sucursal_numero`),
  KEY `fk_cuenta_empleado1_idx` (`ejecutivo_cuenta`),
  CONSTRAINT `fk_cuenta_cuenta_tipo1` FOREIGN KEY (`cuenta_tipo_id`) REFERENCES `cuenta_tipo` (`id`),
  CONSTRAINT `fk_cuenta_empleado1` FOREIGN KEY (`ejecutivo_cuenta`) REFERENCES `empleado` (`legajo`),
  CONSTRAINT `fk_cuenta_sucursal1` FOREIGN KEY (`sucursal_numero`) REFERENCES `sucursal` (`numero`),
  CONSTRAINT `fk_cuenta_tipo_interes1` FOREIGN KEY (`tipo_interes_id`) REFERENCES `tipo_interes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (10501,1,1,0.00,1,0.00,1,2),(10502,1,2,2000.00,NULL,0.00,1,2),(10503,21,1,2349.89,3,11727.30,1,NULL),(10504,1,2,22519.43,NULL,0.00,1,21),(10505,20,1,15660.46,2,0.00,1,NULL),(10506,18,2,16510.26,NULL,16113.68,1,35),(10507,14,2,17194.98,NULL,0.00,1,15),(10508,8,2,-200957.00,NULL,3944.49,1,32),(10509,7,1,0.00,1,0.00,1,NULL),(10510,11,1,6067.42,1,0.00,1,NULL),(10511,3,2,15333.23,NULL,7792.54,1,31),(10512,3,2,-4179.66,NULL,9064.80,1,44),(10513,5,1,6247.51,2,0.00,1,NULL),(10514,9,1,19657.69,2,0.00,1,NULL),(10515,7,2,22526.20,NULL,0.00,1,48),(10516,2,2,17391.46,NULL,9951.46,1,8),(10517,16,1,3876.15,1,0.00,1,NULL),(10518,12,2,16087.14,NULL,9773.80,1,41),(10519,1,2,0.00,NULL,0.00,1,21),(10520,15,1,0.00,2,0.00,0,NULL),(10521,3,1,9425.46,3,0.00,1,NULL),(10522,13,2,-47369.00,NULL,6651.59,1,23),(10523,9,1,18618.59,2,0.00,1,NULL),(10524,19,1,4674.20,2,0.00,1,NULL),(10525,20,1,24693.10,1,0.00,1,NULL),(10526,15,2,21561.69,NULL,8352.70,1,34),(10527,21,1,14689.33,2,0.00,1,NULL),(10528,11,1,18008.31,3,0.00,1,NULL),(10529,5,2,-1247.99,NULL,10537.68,1,11),(10530,6,2,-90111.00,NULL,7435.55,1,10),(10531,13,1,4818.94,3,0.00,1,NULL),(10532,19,2,14741.72,NULL,0.00,1,24),(10533,18,1,4218.11,1,0.00,1,NULL),(10534,8,2,2383.21,NULL,0.00,1,33),(10535,1,2,12039.50,NULL,0.00,1,2),(10536,9,2,11879.27,NULL,15895.52,1,17),(10537,4,2,-3684.80,NULL,6108.67,1,9),(10538,22,1,5095.70,2,0.00,1,NULL),(10539,17,2,2864.38,NULL,5191.32,1,6),(10540,8,2,9495.12,NULL,0.00,1,33),(10541,4,1,0.00,2,0.00,0,NULL),(10542,8,2,0.00,NULL,0.00,1,33),(10543,16,1,19850.65,1,0.00,1,NULL),(10544,17,2,6823.35,NULL,11432.50,1,6),(10545,6,1,17725.77,2,0.00,1,NULL),(10546,20,1,2084.21,2,0.00,1,NULL),(10547,18,2,4465.17,NULL,0.00,1,35),(10548,9,1,23198.18,3,0.00,1,NULL),(10549,19,2,3321.38,NULL,0.00,1,24),(10550,12,1,10367.68,2,0.00,1,NULL),(10551,17,2,13956.85,NULL,2306.68,1,7),(10552,11,1,4113.83,1,0.00,1,NULL),(10553,5,2,23828.85,NULL,11025.61,1,29),(10554,5,1,0.00,1,0.00,0,NULL),(10555,22,2,15358.15,NULL,13946.90,1,13),(10556,19,1,4743.66,3,0.00,1,NULL),(10557,20,1,2037.40,2,1160.49,1,NULL),(10558,21,2,12900.55,NULL,0.00,1,18),(10559,5,2,-3040.44,NULL,500.25,1,11),(10560,5,1,1000.00,NULL,0.00,1,11),(10561,18,1,5000.00,NULL,5411.00,1,12);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_tipo`
--

DROP TABLE IF EXISTS `cuenta_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_tipo`
--

LOCK TABLES `cuenta_tipo` WRITE;
/*!40000 ALTER TABLE `cuenta_tipo` DISABLE KEYS */;
INSERT INTO `cuenta_tipo` VALUES (1,'CAJA DE AHORRO'),(2,'CUENTA CORRIENTE');
/*!40000 ALTER TABLE `cuenta_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `legajo` int NOT NULL AUTO_INCREMENT,
  `sucursal_numero` int NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `domicilio` varchar(70) NOT NULL,
  `ciudad_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono_movil` char(15) NOT NULL,
  `alta_contrato_laboral` date NOT NULL,
  PRIMARY KEY (`legajo`),
  KEY `fk_empleado_sucursal1_idx` (`sucursal_numero`),
  KEY `fk_empleado_ciudad1_idx` (`ciudad_id`),
  CONSTRAINT `fk_empleado_ciudad1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `fk_empleado_sucursal1` FOREIGN KEY (`sucursal_numero`) REFERENCES `sucursal` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,10,'Rubén Arias','Ana Gabriela','Av. A. Fernandez',1,'anafer@gamil.com','+5491152020333','2020-11-30'),(2,1,'Miranda','Maria Agustina','P. A. Sarmiento 542',2,'maria.agustina@eldescubierto.com','+5491159001005','2021-06-02'),(3,12,'López','Mabel','Benjamin Harrison 710',17,'mabel440@eldescubierto.com','+573122611571','2021-05-11'),(4,5,'Macias','Nelson Adrián','James K. Polk 77',7,'nelson.adri@eldescubierto.com','+5493515701005','2019-01-25'),(5,4,'Manrique','Marcela Elisa','Rosalind Franklin 1233',6,'marcela.elisa@eldescubierto.com','+573105604570','2019-08-20'),(6,17,'Farina','Lizeth Daniela','Carlos Ibáñez piso 2 dpto. A',29,'lizeth.daniela@eldescubierto.com','+5491158108107','2017-12-28'),(7,17,'Chauchet Zamora','Diego Armando','Av. Rosa Parks 239',29,'diego.armando@eldescubierto.com','+5491158108107','2017-10-16'),(8,2,'Garcia','Nadia','Av. libertador 4250 este',3,'nadia2000@eldescubierto.com','+5493426457811','2017-06-06'),(9,4,'De Los Santos','Mario','Las palmeras 2388',6,'mario2045@eldescubierto.com','+5493416100500','2018-06-10'),(10,6,'Gutierrez','Valentina','Av. libertador 4750 este',10,'valentina1233@eldescubierto.com','+5493515770010','2018-05-29'),(11,5,'Tello Aguilera','Camilo Daniel','Saturnino Sarasa 122',7,'camilo.daniel@eldescubierto.com','+5491153015204','2020-08-03'),(12,18,'González Romero','Verónica Edith','Saturnino Sarasa 710',35,'veronica.edith@eldescubierto.com','+5493835100521','2017-01-11'),(13,22,'Martín','Guillermina Lucia','Simón Bolívar 155',1,'guillermina.lucia@eldescubierto.com','+5491155332223','2020-04-19'),(14,3,'Manrique Tello','Gabriel Eduardo','Luis Alberto Lacalle 300 piso 2 dpto. 10',5,'gabriel.eduardo@eldescubierto.com','+5493515685588','2020-11-27'),(15,14,'Morales','Miguel','John F. Kennedy 451',21,'miguel785@eldescubierto.com','+5491154050112','2017-05-19'),(16,1,'Aguirre','Maria Guadalupe','Manuel Eyzaguirre 1260',2,'maria.guadalupe@eldescubierto.com','+5492646747787','2021-09-24'),(17,9,'Martín Mercado','Dante Jose','Av. Sarmiento 702 oeste',14,'dante.jose@eldescubierto.com','+573105582411','2019-09-17'),(18,21,'Miranda','Zoe Valentina','José Mujica 540',47,'zoe.valentina@eldescubierto.com','+562239093455','2017-08-10'),(19,4,'Peña','Verónica','Las palmeras 200 casa 15',6,'veronica2010@eldescubierto.com','+5493416100500','2019-05-18'),(20,16,'Sosa Muñoz ','Cristian Nicolás','JOSÉ MARÍA CAMPO SERRANO 211',28,'cristian.nicolas@eldescubierto.com','+573105582234','2020-03-07'),(21,1,'Medina','Sofia Magdalena','Villa Lourdes Mza. D Casa 22',2,'sofia.magdalena@eldescubierto.com','+5492646747787','2018-02-14'),(22,2,'Torres León','Laura Martina','Barrio Neuquen mnblc. A piso 4 dpto. 2',3,'laura.martina@eldescubierto.com','+5493515904588','2020-08-03'),(23,13,'Barragan Aya','Antonella Vanesa','Av. Adriana Ocampo 455',20,'antonella.vanesa@eldescubierto.com','+5491155331001','2017-08-03'),(24,19,'Gómez Cuellar','Luis Angel','Córdoba 122 sur',38,'luis.angel@eldescubierto.com','+56921233122','2015-10-16'),(25,22,'Ontiveros Telle','John David','Calle Manuel Oribe 1100',1,'john.david@eldescubierto.com','+5491155332223','2021-09-02'),(26,6,'Acuña','Lucia Verónica','Av. Sarmiento 93 sur',10,'lucia.vero@eldescubierto.com','+5492616442221','2018-06-02'),(27,9,'Mercado','Angeles','Córdoba 1211 sur',14,'angeles@eldescubierto.com','+573105582411','2015-03-19'),(28,13,'González','Mariela Luciana','Esteban Echeverria 1145',20,'mariela.luciana@eldescubierto.com','+5491155331001','2016-04-05'),(29,5,'De Los Santos','Ernesto Segundo','Villa Nueva 300',7,'ernesto.segundo@eldescubierto.com','+5491153015204','2018-10-23'),(30,10,'Carranza','Leonardo Ariel','Av. G. Santos 1520',15,'leonardo.ariel@eldescubierto.com','+5492645123322','2020-03-04'),(31,3,'Cabrera Peña','Marcelo','Barrio Los Andes mnblc. B piso 2 dpto. C',5,'marcelo50@eldescubierto.com','+5492645665002','2019-05-09'),(32,8,'Pérez Tello','Virginia','Av. Rosalind Franklin 600',12,'virginia41@eldescubierto.com','+56224733622','2016-10-15'),(33,8,'Beltran Figueroa','Maria celeste','San Luis 1300 este',12,'maria.celeste@eldescubierto.com','+5492645661478','2020-08-01'),(34,15,'Naranjo','Adriana','John Adam 544 este',24,'adriana1103@eldescubierto.com','+5493426112020','2016-02-17'),(35,18,'Ramirez Muñoz ','Lucía Romina','Las palmeras 200 casa 154',35,'lucia.romina@eldescubierto.com','+5493835100521','2018-09-24'),(36,14,'Russo','Luís Alberto','George Washington 1277',21,'luis.alberto@eldescubierto.com','+5491154050112','2018-06-25'),(37,11,'Castillo','Guillermo','George Washington 211',16,'guillermo@eldescubierto.com','+5493816123004','2015-09-29'),(38,20,'Garcia Enrique','María Carina','Villa Angelica mnblc. B piso 2 dpto. 4',45,'maria.carina@eldescubierto.com','+5493816748870','2019-09-28'),(39,10,'Valencia Rojas','Brenda Carolina','Esteban Echeverria 3547',15,'brenda.carolina@eldescubierto.com','+5492645123322','2016-04-21'),(40,15,'Miranda Tello','Luís Enrique','Callejón Libertad 1410',24,'luis.enrique@eldescubierto.com','+5493426112020','2017-11-27'),(41,12,'Camacho Olave','Yesica melina','Calle Tucumán 547',17,'yesica.melina@eldescubierto.com','+573122611571','2019-11-29'),(42,19,'Romero Alonso','Mariela Lorena','Álvaro Uribe 5100',38,'mariela.lorena@eldescubierto.com','+56921233122','2018-11-14'),(43,21,'Colonia Díaz','Carla Andrea','Av. Sarmiento 92 oeste',47,'carla.andrea@eldescubierto.com','+562239093455','2015-05-04'),(44,3,'Roma','Miguel Angel','9 de Julio 3300',5,'miguel.angel@eldescubierto.com','+5493515685588','2015-07-21'),(45,7,'Bruno Maroni','Andres','V. Barco Vargas 999',12,'andres@eldescubierto.com','+5499416441010','2021-06-25'),(46,11,'Torres','Juan Carlos','Villa Angelica mnblc. F piso 2 dpto. 3',16,'juan.carlos@eldescubierto.com','+5493816123004','2016-06-08'),(47,20,'Mercado','Pedro','Libertad 3200',45,'pedro6411@eldescubierto.com','+5493816748870','2017-08-19'),(48,7,'Alaníz','Pablo Ariel','Ángela Camacho 566',12,'pablo.ariel@eldescubierto.com','+562239092001','2020-05-14'),(49,16,'Redondo','Angel','Ángela Camacho 122',28,'angel445@eldescubierto.com','+573105582234','2015-12-29'),(50,2,'Aguilera Rivarola','Lucio Enrique','Av. Sarmiento 4122',3,'lucio.enrique@eldescubierto.com','+5493426457811','2021-06-25');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_acceso`
--

DROP TABLE IF EXISTS `historial_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_acceso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `cuenta_numero` int NOT NULL,
  `acceso` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_has_cuenta_cuenta2_idx` (`cuenta_numero`),
  KEY `fk_cliente_has_cuenta_cliente2_idx` (`cliente_id`),
  CONSTRAINT `fk_cliente_has_cuenta_cliente2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_cliente_has_cuenta_cuenta2` FOREIGN KEY (`cuenta_numero`) REFERENCES `cuenta` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_acceso`
--

LOCK TABLES `historial_acceso` WRITE;
/*!40000 ALTER TABLE `historial_acceso` DISABLE KEYS */;
INSERT INTO `historial_acceso` VALUES (1,23,10514,'2021-07-01 02:17:00'),(2,24,10547,'2021-07-01 04:43:00'),(3,3,10509,'2021-07-01 09:56:00'),(4,40,10536,'2021-07-02 10:36:00'),(5,20,10554,'2021-07-04 02:00:00'),(6,25,10522,'2021-07-04 06:52:00'),(7,5,10519,'2021-07-05 03:08:00'),(8,16,10503,'2021-07-06 01:40:00'),(9,5,10535,'2021-07-06 06:07:00'),(10,20,10529,'2021-07-06 07:52:00'),(11,37,10538,'2021-07-07 03:46:00'),(12,2,10502,'2021-07-07 08:40:00'),(13,31,10545,'2021-07-08 00:42:00'),(14,10,10532,'2021-07-08 03:32:00'),(15,18,10512,'2021-07-08 08:43:00'),(16,23,10523,'2021-07-09 01:21:00'),(17,20,10513,'2021-07-09 02:49:00'),(18,15,10546,'2021-07-09 04:20:00'),(19,3,10540,'2021-07-09 06:44:00'),(20,17,10519,'2021-07-09 08:30:00'),(21,19,10516,'2021-07-09 12:03:00'),(22,14,10520,'2021-07-10 02:34:00'),(23,35,10539,'2021-07-10 12:49:00'),(24,18,10511,'2021-07-10 12:58:00'),(25,25,10522,'2021-07-11 10:14:00'),(26,20,10553,'2021-07-11 11:13:00'),(27,6,10507,'2021-07-12 12:57:00'),(28,5,10519,'2021-07-13 00:45:00'),(29,38,10524,'2021-07-13 01:06:00'),(30,23,10523,'2021-07-13 01:27:00'),(31,36,10552,'2021-07-13 05:07:00'),(32,23,10514,'2021-07-13 06:35:00'),(33,15,10525,'2021-07-14 11:13:00'),(34,27,10537,'2021-07-14 11:58:00'),(35,29,10518,'2021-07-15 05:53:00'),(36,16,10558,'2021-07-16 05:45:00'),(37,14,10526,'2021-07-17 12:58:00'),(38,24,10533,'2021-07-18 02:37:00'),(39,3,10509,'2021-07-19 03:09:00'),(40,24,10533,'2021-07-20 00:52:00'),(41,9,10530,'2021-07-20 02:26:00'),(42,42,10527,'2021-07-21 00:35:00'),(43,41,10517,'2021-07-21 05:06:00'),(44,32,10551,'2021-07-21 07:14:00'),(45,5,10504,'2021-07-21 12:17:00'),(46,27,10537,'2021-07-21 12:29:00'),(47,5,10504,'2021-07-22 05:16:00'),(48,4,10561,'2021-07-22 05:44:00'),(49,8,10550,'2021-07-22 08:21:00'),(50,40,10514,'2021-07-23 01:42:00'),(51,37,10555,'2021-07-23 03:17:00'),(52,12,10549,'2021-07-24 06:20:00'),(53,16,10503,'2021-07-24 07:35:00'),(54,24,10547,'2021-07-24 07:51:00'),(55,41,10543,'2021-07-26 00:59:00'),(56,4,10506,'2021-07-26 01:50:00'),(57,29,10518,'2021-07-26 02:07:00'),(58,6,10507,'2021-07-26 12:49:00'),(59,40,10548,'2021-07-26 12:54:00'),(60,11,10510,'2021-07-27 01:08:00'),(61,1,10501,'2021-07-27 02:15:00'),(62,18,10521,'2021-07-27 08:59:00'),(63,34,10531,'2021-07-27 12:58:00'),(64,27,10541,'2021-07-28 05:10:00'),(65,29,10518,'2021-07-29 06:06:00'),(66,15,10505,'2021-07-29 06:56:00'),(67,36,10528,'2021-07-29 09:44:00'),(68,22,10544,'2021-07-30 04:32:00'),(69,21,10556,'2021-07-30 07:09:00'),(70,13,10507,'2021-07-30 12:50:00'),(71,3,10540,'2021-08-01 10:23:00'),(72,30,10508,'2021-08-01 11:46:00'),(73,1,10501,'2021-08-02 04:24:00'),(74,20,10560,'2021-08-02 06:17:00'),(75,32,10551,'2021-08-02 07:12:00'),(76,27,10537,'2021-08-02 07:53:00'),(77,37,10555,'2021-08-02 10:46:00'),(78,13,10507,'2021-08-02 12:02:00'),(79,9,10530,'2021-08-02 12:53:00'),(80,40,10514,'2021-08-03 03:18:00'),(81,15,10557,'2021-08-03 09:30:00'),(82,36,10552,'2021-08-04 00:43:00'),(83,23,10523,'2021-08-04 06:34:00'),(84,24,10533,'2021-08-04 07:14:00'),(85,19,10516,'2021-08-04 09:58:00'),(86,21,10556,'2021-08-04 11:13:00'),(87,18,10512,'2021-08-06 02:45:00'),(88,34,10531,'2021-08-06 07:00:00'),(89,24,10547,'2021-08-06 12:29:00'),(90,3,10509,'2021-08-06 12:30:00'),(91,25,10522,'2021-08-07 03:47:00'),(92,15,10505,'2021-08-07 09:21:00'),(93,36,10528,'2021-08-07 11:51:00'),(94,15,10525,'2021-08-08 04:23:00'),(95,37,10538,'2021-08-09 01:25:00'),(96,27,10541,'2021-08-09 02:25:00'),(97,23,10523,'2021-08-09 12:44:00'),(98,5,10535,'2021-08-10 00:58:00'),(99,40,10548,'2021-08-10 01:12:00'),(100,2,10502,'2021-08-10 03:11:00'),(101,12,10549,'2021-08-10 03:39:00'),(102,20,10513,'2021-08-11 01:00:00'),(103,24,10533,'2021-08-11 06:26:00'),(104,4,10506,'2021-08-11 06:55:00'),(105,27,10541,'2021-08-12 03:15:00'),(106,16,10503,'2021-08-12 08:50:00'),(107,20,10559,'2021-08-12 10:34:00'),(108,29,10518,'2021-08-13 01:05:00'),(109,18,10521,'2021-08-13 11:35:00'),(110,18,10511,'2021-08-14 03:12:00'),(111,14,10520,'2021-08-14 04:34:00'),(112,14,10526,'2021-08-15 05:31:00'),(113,5,10504,'2021-08-15 08:54:00'),(114,5,10535,'2021-08-16 03:22:00'),(115,4,10561,'2021-08-16 10:48:00'),(116,38,10524,'2021-08-17 04:47:00'),(117,11,10510,'2021-08-18 04:04:00'),(118,23,10514,'2021-08-19 07:15:00'),(119,6,10507,'2021-08-19 08:32:00'),(120,40,10536,'2021-08-19 12:17:00'),(121,10,10532,'2021-08-20 07:31:00'),(122,3,10540,'2021-08-20 09:20:00'),(123,15,10546,'2021-08-20 10:44:00'),(124,24,10547,'2021-08-20 12:03:00'),(125,5,10504,'2021-08-21 11:08:00'),(126,35,10539,'2021-08-21 11:17:00'),(127,42,10527,'2021-08-21 11:28:00'),(128,16,10558,'2021-08-22 11:39:00'),(129,20,10529,'2021-08-23 04:57:00'),(130,41,10543,'2021-08-23 12:47:00'),(131,8,10550,'2021-08-23 13:00:00'),(132,30,10534,'2021-08-24 02:03:00'),(133,17,10519,'2021-08-24 06:47:00'),(134,41,10517,'2021-08-24 10:29:00'),(135,25,10522,'2021-08-26 02:01:00'),(136,30,10515,'2021-08-26 07:18:00'),(137,31,10545,'2021-08-26 11:07:00'),(138,23,10514,'2021-08-26 11:51:00'),(139,5,10519,'2021-08-26 12:55:00'),(140,22,10544,'2021-08-30 11:02:00'),(141,20,10553,'2021-09-01 07:50:00'),(142,9,10530,'2021-09-01 08:58:00'),(143,37,10555,'2021-09-01 09:16:00'),(144,20,10553,'2021-09-01 12:33:00'),(145,13,10507,'2021-09-02 06:59:00'),(146,4,10506,'2021-09-02 08:50:00'),(147,30,10542,'2021-09-02 09:09:00'),(148,36,10552,'2021-09-02 09:16:00'),(149,23,10523,'2021-09-02 10:42:00'),(150,38,10524,'2021-09-03 05:19:00'),(151,32,10551,'2021-09-03 06:03:00'),(152,36,10528,'2021-09-04 04:54:00'),(153,11,10510,'2021-09-04 07:00:00'),(154,23,10514,'2021-09-04 10:22:00'),(155,4,10561,'2021-09-04 10:31:00'),(156,5,10504,'2021-09-05 01:30:00'),(157,15,10557,'2021-09-05 10:50:00'),(158,37,10538,'2021-09-06 04:11:00'),(159,20,10560,'2021-09-06 05:49:00'),(160,30,10508,'2021-09-06 05:51:00'),(161,14,10520,'2021-09-07 06:03:00'),(162,27,10541,'2021-09-07 06:26:00'),(163,40,10514,'2021-09-07 07:50:00'),(164,6,10507,'2021-09-08 08:52:00'),(165,18,10511,'2021-09-08 08:55:00'),(166,24,10547,'2021-09-08 11:04:00'),(167,25,10522,'2021-09-09 06:54:00'),(168,15,10546,'2021-09-09 11:47:00'),(169,20,10559,'2021-09-10 05:39:00'),(170,15,10505,'2021-09-10 08:11:00'),(171,1,10501,'2021-09-11 07:21:00'),(172,20,10529,'2021-09-11 11:13:00'),(173,2,10502,'2021-09-11 12:26:00'),(174,31,10545,'2021-09-12 09:06:00'),(175,17,10519,'2021-09-13 07:44:00'),(176,42,10527,'2021-09-14 03:39:00'),(177,3,10540,'2021-09-14 04:33:00'),(178,2,10502,'2021-09-14 10:35:00'),(179,16,10558,'2021-09-14 11:40:00'),(180,22,10544,'2021-09-15 04:16:00'),(181,3,10509,'2021-09-15 05:01:00'),(182,34,10531,'2021-09-15 09:33:00'),(183,40,10548,'2021-09-16 01:59:00'),(184,35,10539,'2021-09-16 02:11:00'),(185,18,10521,'2021-09-16 11:18:00'),(186,41,10517,'2021-09-17 05:57:00'),(187,8,10550,'2021-09-18 01:50:00'),(188,5,10535,'2021-09-20 03:47:00'),(189,10,10532,'2021-09-20 06:11:00'),(190,5,10535,'2021-09-20 07:06:00'),(191,15,10525,'2021-09-20 12:57:00'),(192,6,10507,'2021-09-21 02:14:00'),(193,8,10550,'2021-09-21 02:29:00'),(194,20,10513,'2021-09-22 07:09:00'),(195,20,10559,'2021-09-23 00:52:00'),(196,41,10543,'2021-09-23 05:24:00'),(197,18,10512,'2021-09-23 08:51:00'),(198,5,10519,'2021-09-24 01:45:00'),(199,30,10515,'2021-09-24 04:05:00'),(200,20,10554,'2021-09-25 06:17:00'),(201,8,10550,'2021-09-25 08:49:00'),(202,20,10554,'2021-09-25 11:52:00'),(203,5,10519,'2021-09-26 09:23:00'),(204,3,10509,'2021-09-26 11:41:00'),(205,12,10549,'2021-09-27 04:55:00'),(206,27,10537,'2021-09-28 06:09:00'),(207,30,10534,'2021-09-28 12:19:00'),(208,24,10533,'2021-09-29 02:44:00'),(209,1,10501,'2021-09-30 01:30:00'),(210,21,10556,'2021-09-30 02:44:00'),(211,4,10506,'2021-09-30 03:44:00'),(212,30,10542,'2021-09-30 05:58:00'),(213,40,10536,'2021-09-30 10:53:00'),(214,15,10557,'2021-10-01 04:08:00'),(215,22,10544,'2021-10-05 10:02:00'),(216,20,10554,'2021-10-05 10:21:00'),(217,4,10561,'2021-10-07 07:51:00'),(218,10,10532,'2021-10-09 06:20:00'),(219,3,10540,'2021-10-13 12:42:00'),(220,30,10542,'2021-10-15 09:07:00'),(221,20,10559,'2021-10-17 00:53:00'),(222,14,10526,'2021-10-18 10:58:00'),(223,21,10556,'2021-10-19 01:13:00'),(224,20,10560,'2021-10-21 11:51:00'),(225,30,10534,'2021-10-24 01:55:00'),(226,20,10560,'2021-10-24 08:28:00'),(227,22,10544,'2021-10-24 11:15:00'),(228,30,10515,'2021-10-24 13:08:00'),(229,30,10508,'2021-10-26 05:40:00'),(230,4,10561,'2021-10-28 04:32:00'),(231,4,10506,'2021-10-29 00:43:00'),(232,20,10553,'2021-10-29 06:54:00'),(233,20,10560,'2021-10-30 06:26:00'),(234,21,10556,'2021-10-30 07:04:00'),(235,9,10530,'2021-10-30 10:56:00'),(236,19,10516,'2029-10-30 05:59:00');
/*!40000 ALTER TABLE `historial_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prestamo_id` int NOT NULL,
  `cuota_nro` char(2) NOT NULL,
  `fecha` datetime NOT NULL,
  `importe` float(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pago_prestamo1_idx` (`prestamo_id`),
  CONSTRAINT `fk_pago_prestamo1` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,'1','2021-08-06 11:07:00',1666.67),(2,38,'1','2021-04-18 09:31:00',3693.43),(3,44,'1','2021-10-26 07:52:00',2981.04),(4,7,'1','2021-05-16 09:48:00',670.95),(5,15,'1','2021-08-24 08:35:00',2171.76),(6,35,'1','2021-10-27 12:01:00',252.47),(7,8,'1','2021-07-13 08:01:00',321.70),(8,3,'1','2021-08-01 10:37:00',783.84),(9,28,'1','2021-06-01 10:41:00',2284.85),(10,25,'1','2021-06-24 09:26:00',1103.70),(11,32,'1','2021-06-15 07:53:00',27306.94),(12,17,'1','2021-06-02 11:51:00',1668.32),(13,4,'1','2021-07-28 10:29:00',822.71),(14,36,'1','2021-09-08 09:15:00',1030.24),(15,22,'1','2021-08-06 10:14:00',2040.06),(16,16,'1','2021-09-03 10:52:00',132.51),(17,41,'1','2021-07-01 09:19:00',5598.10),(18,33,'1','2021-10-29 08:56:00',709.46),(19,45,'1','2021-10-30 10:15:00',1051.78),(20,31,'1','2021-05-19 09:01:00',3108.64),(21,40,'1','2021-07-17 10:51:00',585.90),(22,26,'1','2021-09-27 11:16:00',1643.09),(23,19,'1','2021-06-15 12:46:00',3140.23),(24,11,'1','2021-07-22 09:48:00',2122.80),(25,34,'1','2021-07-27 10:22:00',3240.05),(26,39,'1','2021-10-02 08:30:00',2570.03),(27,9,'1','2021-06-16 10:57:00',887.09),(28,12,'1','2021-09-01 11:49:00',5696.12),(29,14,'1','2021-08-12 09:32:00',114.39),(30,29,'1','2021-08-29 10:05:00',2039.36),(31,30,'1','2021-09-07 07:39:00',5198.90),(32,23,'1','2021-06-10 11:04:00',4034.49),(33,27,'1','2021-05-27 09:09:00',2931.69),(34,10,'1','2021-08-05 08:59:00',701.37),(35,37,'1','2021-09-15 08:18:00',1021.67),(36,21,'1','2021-09-15 12:21:00',398.37),(37,18,'1','2021-04-21 07:45:00',1344.82),(38,6,'1','2021-11-03 08:50:00',598.75),(39,2,'1','2021-09-23 12:28:00',1166.24),(40,42,'1','2021-09-22 09:36:00',4755.02),(41,20,'1','2021-07-22 11:31:00',1053.80),(42,24,'1','2021-09-09 07:47:00',4020.77),(43,43,'1','2021-10-11 12:02:00',5370.74),(44,5,'1','2021-06-10 07:51:00',8245.98),(45,13,'1','2021-09-01 10:17:00',3102.46),(46,1,'2','2021-09-07 12:05:00',1666.67),(47,4,'2','2021-08-29 08:26:00',822.71),(48,36,'2','2021-10-09 07:16:00',1030.24),(49,35,'2','2021-11-27 12:40:00',252.47),(50,3,'2','2021-09-09 09:13:00',783.84),(51,6,'2','2021-12-13 07:45:00',598.75),(52,43,'2','2021-11-14 08:20:00',5370.74),(53,34,'2','2021-08-26 07:30:00',3240.05),(54,31,'2','2021-06-19 10:46:00',3108.64),(55,18,'2','2021-05-26 07:59:00',1344.82),(56,42,'2','2021-10-31 10:44:00',4755.02),(57,37,'2','2021-10-18 07:33:00',1021.67),(58,19,'2','2021-07-20 11:25:00',3140.23),(59,39,'2','2021-11-09 08:59:00',2570.03),(60,16,'2','2021-10-10 07:22:00',132.51),(61,38,'2','2021-05-18 07:11:00',3693.43),(62,15,'2','2021-09-30 10:57:00',2171.76),(63,2,'2','2021-10-25 10:51:00',1166.24),(64,44,'2','2021-12-05 12:27:00',2981.04),(65,45,'2','2021-11-29 08:34:00',1051.78),(66,26,'2','2021-11-05 09:13:00',1643.09),(67,27,'2','2021-07-03 08:15:00',2931.69),(68,28,'2','2021-07-03 07:59:00',2284.85),(69,29,'2','2021-09-30 10:42:00',2039.36),(70,10,'2','2021-09-10 11:10:00',701.37),(71,41,'2','2021-08-08 09:24:00',5598.10),(72,22,'2','2021-09-08 07:12:00',2040.06),(73,17,'2','2021-07-06 09:54:00',1668.32),(74,8,'2','2021-08-19 08:46:00',321.70),(75,25,'2','2021-08-03 10:04:00',1103.70),(76,40,'2','2021-08-22 11:32:00',585.90),(77,30,'2','2021-10-09 09:05:00',5198.90),(78,20,'2','2021-08-21 11:21:00',1053.80),(79,23,'2','2021-07-18 10:32:00',4034.49),(80,7,'2','2021-06-15 12:36:00',670.95),(81,14,'2','2021-09-16 12:43:00',114.39),(82,9,'2','2021-07-17 08:10:00',887.09),(83,5,'2','2021-07-10 08:32:00',8245.98),(84,1,'3','2021-10-07 12:42:00',1666.67),(85,38,'3','2021-06-25 12:30:00',3693.43),(86,18,'3','2021-07-04 12:28:00',1344.82),(87,23,'3','2021-08-19 07:30:00',4034.49),(88,41,'3','2021-09-17 09:48:00',5598.10),(89,10,'3','2021-10-12 12:16:00',701.37),(90,31,'3','2021-07-26 09:10:00',3108.64),(91,15,'3','2021-11-02 12:19:00',2171.76),(92,17,'3','2021-08-07 11:24:00',1668.32),(93,37,'3','2021-11-21 11:38:00',1021.67),(94,5,'3','2021-08-14 09:33:00',8245.98),(95,2,'3','2021-11-26 11:28:00',1166.24),(96,3,'3','2021-10-11 09:16:00',783.84),(97,42,'3','2021-12-10 11:04:00',4755.02),(98,30,'3','2021-11-10 12:11:00',5198.90),(99,9,'3','2021-08-22 12:11:00',887.09),(100,40,'3','2021-09-22 10:37:00',585.90),(101,27,'3','2021-08-03 12:09:00',2931.69),(102,19,'3','2021-08-28 11:15:00',3140.23),(103,8,'3','2021-09-28 08:30:00',321.70),(104,34,'3','2021-10-01 07:16:00',3240.05),(105,4,'3','2021-10-04 12:04:00',822.71);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Argentina'),(2,'Bolivia'),(3,'Brasil'),(4,'Chile'),(5,'Colombia'),(6,'Costa Rica'),(7,'Cuba'),(8,'Ecuador'),(9,'El Salvador'),(10,'Guatemala'),(11,'Haití'),(12,'Honduras'),(13,'México'),(14,'Nicaragua'),(15,'Panamá'),(16,'Paraguay'),(17,'Perú'),(18,'República Dominicana'),(19,'Uruguay'),(20,'Venezuela');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sucursal_numero` int NOT NULL,
  `fecha_otorgado` date NOT NULL,
  `importe` float(15,2) NOT NULL DEFAULT '0.00',
  `cantidad_cuota` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prestamo_sucursal1_idx` (`sucursal_numero`),
  CONSTRAINT `fk_prestamo_sucursal1` FOREIGN KEY (`sucursal_numero`) REFERENCES `sucursal` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,1,'2021-07-05',5000.00,'03'),(2,9,'2021-08-24',27989.77,'24'),(3,4,'2021-06-23',28218.23,'36'),(4,7,'2021-06-21',49362.69,'60'),(5,5,'2021-05-03',24737.93,'03'),(6,9,'2021-09-29',5388.74,'09'),(7,18,'2021-04-08',8051.38,'12'),(8,15,'2021-06-12',3860.42,'12'),(9,7,'2021-05-12',31935.26,'36'),(10,2,'2021-07-02',16832.93,'24'),(11,9,'2021-06-17',19105.16,'09'),(12,21,'2021-07-23',5696.12,'01'),(13,7,'2021-07-30',3102.46,'03'),(14,18,'2021-07-06',6863.30,'60'),(15,14,'2021-07-18',19545.82,'09'),(16,14,'2021-08-02',1192.55,'09'),(17,17,'2021-04-30',20019.78,'12'),(18,20,'2021-03-19',12103.37,'09'),(19,5,'2021-05-16',37682.80,'12'),(20,21,'2021-06-21',37936.70,'36'),(21,4,'2021-08-06',14341.30,'36'),(22,14,'2021-06-30',24480.73,'12'),(23,2,'2021-05-01',12103.47,'03'),(24,11,'2021-08-09',24124.64,'06'),(25,1,'2021-05-20',6622.20,'06'),(26,16,'2021-08-24',19717.13,'12'),(27,7,'2021-04-24',35180.24,'12'),(28,18,'2021-04-23',6854.55,'03'),(29,17,'2021-07-21',48944.52,'24'),(30,10,'2021-08-04',31193.38,'06'),(31,14,'2021-04-14',18651.84,'06'),(32,4,'2021-05-12',27306.94,'01'),(33,17,'2021-09-26',25540.58,'36'),(34,3,'2021-06-19',38880.55,'12'),(35,20,'2021-09-25',2272.27,'09'),(36,18,'2021-08-09',9272.17,'09'),(37,4,'2021-08-10',24520.16,'24'),(38,16,'2021-03-14',11080.28,'03'),(39,3,'2021-08-23',30840.39,'12'),(40,22,'2021-06-07',35154.12,'60'),(41,5,'2021-06-01',16794.30,'03'),(42,14,'2021-08-21',28530.10,'06'),(43,7,'2021-09-11',48336.64,'09'),(44,3,'2021-09-18',35772.46,'12'),(45,11,'2021-09-25',12621.41,'12'),(46,4,'2021-09-26',15000.00,'3'),(47,4,'2021-09-28',12000.00,'6');
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `Ciudad_id` int NOT NULL,
  `domicilio` varchar(70) NOT NULL,
  `telefono_fijo` char(15) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_Sucursales_Ciudad1_idx` (`Ciudad_id`),
  CONSTRAINT `fk_Sucursales_Ciudad1` FOREIGN KEY (`Ciudad_id`) REFERENCES `ciudad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,2,'25 De Mayo 358','+5492645883344'),(2,3,'Av. Rosa Parks 1245','+5491155160011'),(3,5,'Ángela Camacho 587','+573106410045'),(4,6,'9 de Julio 310 este','+56921001040'),(5,7,'Saturnino Sarasa 573','+5492646221200'),(6,10,'Calle John F. Kennedy 180','+5493815205047'),(7,12,'Juan Antonio Lavalleja 3445','+5499416442010'),(8,12,'Av. Emmeline Pankhurst 6744','+5499415664040'),(9,14,'George Washington 5400','+5491154051010'),(10,15,'Ramón Freire Serrano 7410','+5499416561578'),(11,16,'Córdoba 5754 sur','+5492616121545'),(12,17,'Ángela Camacho 274','+562239095065'),(13,20,'Luis Alberto Lacalle 4577','+5493515684747'),(14,21,'25 de Mayo 5220','+5491153017700'),(15,24,'Av A. Fernandez 1500','+573105607866'),(16,28,'Simón Bolívar 482','+5491159871325'),(17,29,'James K. Polk 717','+5493515701257'),(18,35,'Juan Antonio Lavalleja 740','+59824150000'),(19,38,'Las palmeras 1443','+5493835100012'),(20,45,'Las palmeras 400','+5493416100504'),(21,47,'John F. Kennedy 689','+569984908874'),(22,1,'Manuel Eyzaguirre 1230','+5491151115570');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_interes`
--

DROP TABLE IF EXISTS `tipo_interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_interes` (
  `id` int NOT NULL,
  `tipo` char(16) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_interes`
--

LOCK TABLES `tipo_interes` WRITE;
/*!40000 ALTER TABLE `tipo_interes` DISABLE KEYS */;
INSERT INTO `tipo_interes` VALUES (1,'Interés Fijo'),(2,'Interés Variable'),(3,'Otros Intereses');
/*!40000 ALTER TABLE `tipo_interes` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-09 20:19:07
