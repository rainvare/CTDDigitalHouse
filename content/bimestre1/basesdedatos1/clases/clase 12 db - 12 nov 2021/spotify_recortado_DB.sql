CREATE DATABASE  IF NOT EXISTS `spotify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spotify`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: spotify
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `idAlbum` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `iddiscografica` int DEFAULT NULL,
  `idArtista` int DEFAULT NULL,
  `imagenportada` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAlbum`),
  KEY `IdDiscografica_idx` (`iddiscografica`),
  KEY `idArtista_idx` (`idArtista`),
  CONSTRAINT `idArtista` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`),
  CONSTRAINT `IdDiscografica` FOREIGN KEY (`iddiscografica`) REFERENCES `discografica` (`idDiscografica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Is There Anybody Out There',4,1,'imagenalbum.jpg'),(2,'Radio Sampler ‎2xCD',4,1,NULL),(3,'Delicate Sound Of Thunder',4,1,'imagenalbum.jpg'),(4,'Abbey Road',5,4,NULL),(6,'Use Your Illusion II',6,5,NULL),(7,'Appetite for Destruction',6,5,'imagenalbum.jpg'),(8,'True Blue',7,7,NULL),(9,'Like A Virgin ',7,7,'imagenalbum.jpg'),(10,'Fito Paez',4,8,NULL),(11,'Antología',3,8,'imagenalbum.jpg'),(12,'Diego Torres',4,9,NULL),(13,'Loba',1,10,'imagenalbum.jpg'),(14,'Pies Descalzos',3,10,NULL),(15,'Papi Juancho',1,11,'imagenalbum.jpg'),(16,'Vives',1,12,NULL),(17,'OCEAN',3,13,'imagenalbum.jpg'),(18,'Cello Concertos',28,14,NULL),(19,'\"Plays Weir, Finnissy, Newman And Skempton\"',44,15,'imagenalbum.jpg'),(20,'My father Knew Charles Ives and Harmonielehre',42,16,NULL),(21,'Pied Piper Fantasy',48,17,'imagenalbum.jpg'),(22,'Le Secret De La Vie',54,18,NULL),(23,'Solo Works',35,19,'imagenalbum.jpg'),(24,'Charlie Parker Sextet',33,20,NULL),(25,'Relaxin With The Miles Davis Quintet',47,21,'imagenalbum.jpg'),(26,'Dizzy Gillespie And His All-Stars',41,22,NULL),(27,'King Of The Tenor Sax',29,23,'imagenalbum.jpg'),(28,'Distinctive Song Styling',31,24,NULL),(29,'Yes Indeed!',25,25,'imagenalbum.jpg'),(30,'Chet Baker In New York',50,26,NULL),(31,'Son Con Guaguancó',55,27,'imagenalbum.jpg'),(32,'Maestra Vida',37,28,NULL),(33,'El Malo',37,29,'imagenalbum.jpg'),(34,'La Voz',38,30,NULL),(35,'Tito Rodriguez At The Palladium',58,31,'imagenalbum.jpg'),(36,'Amor Y Alegria',27,32,NULL),(37,'Adios Nonino',56,33,'imagenalbum.jpg'),(38,'Así Cantaba Carlitos',46,34,NULL),(39,'Cuando El Río Suena',43,35,'imagenalbum.jpg'),(40,'Alma De Bohemio',40,36,NULL),(41,'Aura',53,37,'imagenalbum.jpg'),(42,'Monton De Vida',34,38,NULL),(43,'Let Me Ride',38,39,'imagenalbum.jpg'),(44,'Kamikaze',24,40,NULL),(45,'Doggystyle',30,41,'imagenalbum.jpg'),(46,'The Black Album',51,42,NULL),(47,'Check Your Head',26,43,'imagenalbum.jpg'),(48,'Late Registration',52,44,NULL),(49,'Back To Mine',45,45,'imagenalbum.jpg'),(50,'Play It Loud!',39,46,NULL),(51,'Biosfera',32,47,'imagenalbum.jpg'),(52,'The Remixes',49,48,NULL),(53,'Ignition Key',57,49,'imagenalbum.jpg'),(54,'Dance Baby',34,50,NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `idArtista` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArtista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Pink Floyd','Pink Floyd.jpg'),(2,'AC/DC',NULL),(3,'The Rolling Stones','The Rolling Stones.jpg'),(4,'The Beatles',NULL),(5,'Guns\'n Roses','Guns\'n Roses.jpg'),(6,'Linkin Park',NULL),(7,'Madonna','Madonna.jpg'),(8,'Fito Paez',NULL),(9,'Diego Torres','Diego Torres.jpg'),(10,'Shakira',NULL),(11,'Maluma','Maluma.jpg'),(12,'Carlos Vives',NULL),(13,'Karol G','Karol G.jpg'),(14,'Yo-Yo Ma',NULL),(15,'Michael Finnissy','Michael Finnissy.jpg'),(16,'John Adams',NULL),(17,'John Corigliano','John Corigliano.jpg'),(18,'Terry Riley',NULL),(19,'Brian John Peter Ferneyhough','Brian John Peter Ferneyhough.jpg'),(20,'Charlie Parker',NULL),(21,'MIles Davis','MIles Davis.jpg'),(22,'Dizzy Gillespie',NULL),(23,'Coleman Hawkins','Coleman Hawkins.jpg'),(24,'Billie Holiday',NULL),(25,'Ray Charles','Ray Charles.jpg'),(26,'Chet Baker',NULL),(27,'Celia Cruz','Celia Cruz.jpg'),(28,'Ruben Blades',NULL),(29,'Willie Colon','Willie Colon.jpg'),(30,'Hector Lavoe',NULL),(31,'Tito Rodriguez','Tito Rodriguez.jpg'),(32,'Luis Enrique',NULL),(33,'Astor Piazzolla','Astor Piazzolla.jpg'),(34,'Carlos Gardel',NULL),(35,'Adriana Varela','Adriana Varela.jpg'),(36,'Alberto Podestá',NULL),(37,'Bajofondo Tango Club','Bajofondo Tango Club.jpg'),(38,'Susana Rinaldi',NULL),(39,'Dr. Dre','Dr. Dre.jpg'),(40,'Eminem',NULL),(41,'Snoop Dogg','Snoop Dogg.jpg'),(42,'Jay-Z',NULL),(43,'Beastie Boys','Beastie Boys.jpg'),(44,'Kanye West',NULL),(45,'Carl Cox','Carl Cox.jpg'),(46,'Marco Carola',NULL),(47,'Oscar Mulero','Oscar Mulero.jpg'),(48,'Nina Kraviz',NULL),(49,'Adam Beyer','Adam Beyer.jpg'),(50,'Solomun',NULL);
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `idCancion` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `duracion` double DEFAULT NULL,
  `cantreproduccion` int DEFAULT NULL,
  `cantlikes` int DEFAULT NULL,
  `IdAlbum` int DEFAULT NULL,
  PRIMARY KEY (`idCancion`),
  KEY `IdAlbum_idx` (`IdAlbum`),
  CONSTRAINT `IdAlbum` FOREIGN KEY (`IdAlbum`) REFERENCES `album` (`idAlbum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
INSERT INTO `cancion` VALUES (1,'In The Flesh',3.25,1000050,7500,1),(2,'The Thin Ice',2.49,850050,7600,1),(3,'Gone For Bad',3.58,1200400,6500,2),(4,'Fink Is The King',3.15,218500,8600,2),(5,'Shine On You Crazy Diamond',11.53,210000,4500,3),(6,'Yet Another Movie',4.1,4500668,1500,3),(7,'Oh! Darling',3.26,1598634,256986,4),(8,'Come Together',4.2,3568946,103569,4),(9,'Something',3.03,628634,5698,4),(10,'The End',2.05,68946,3569,4),(11,'Papa Don\'t Preach',4.29,NULL,NULL,8),(12,'Open Your Heart',4.13,2500245,1785444,8),(13,'Material Girl',4.04,457788,68555,8),(14,'Open Your Heart',3.57,7500277,985444,8),(15,'Cancion Sobre Cancion',3.49,988100,578101,10),(16,'11 Y 6',2.55,1122554,245778,10),(17,'Y Dale Alegría A Mi Corazón',5.15,1985663,658874,11),(18,'El Amor Después Del Amor',5.1,2100358,35456,11),(19,'Estamos Juntos',4.39,389555,12488,12),(20,'No Tengas Miedo',4.25,258456,5247,12),(21,'Lo Hecho Esta Hecho',3.13,986444,657112,13),(22,'Loba',3.09,3150441,1244523,13),(23,'Años Luz',3.41,1335054,485777,13),(24,'Estoy Aqui',3.52,845300,247712,14),(25,'Hawai',3.19,1325450,857400,15),(26,'La Cura',2.56,750425,74856,15),(27,'Salida de escape',3.04,166582,37142,15),(28,'Ansiedad',3.4,500266,25004,15),(29,'Baby',4.01,70052,12488,17),(30,'Dices que te vas',3.11,1122554,35456,17),(31,'Hoy tengo tiempo',3.12,10458,24115,16),(32,'La tierra prometida',3.17,10047,3578,16),(33,'Mañana',2.49,8507,1574,16),(34,'In A Minor For Cello And Orchestra, Op',18.53,15934,0,18),(35,'Prelude: Lento Allegro Maestoso',12.38,96306,4157,18),(36,'Intermezzo',6.14,95338,41,18),(37,'Reels',7.58,53402,340,19),(38,'An Mein Klavier',8.1,523452,984,19),(39,'Le Repos Sur Le Lit',7.03,589744,891,19),(40,'My father Knew Charles Ives and Harmonielehre',9.41,292364,9236,20),(41,'Harmonielehre I',17.26,0,0,20),(42,'Harmonielehre II .The Anfortas Wound',12.46,2585604,984,20),(43,'Sunrise And The Piper s Song',9.36,666667,6,21),(44,'The Rats',1.38,5510,54,21),(45,'The Children is March',9.29,4295153,157,21),(46,'G. Song',3.04,535211,5352,22),(47,'MIce',2.11,564916,9,22),(48,'In The Summer',6.34,4701,984,22),(49,'Time And Motion Study I',8.42,673426,642,23),(50,'Bone Alphabet',2.56,578738,54,23),(51,'Time And Motion Study II',22.32,714249,98,23),(52,'My Old Flame',3.18,811641,1164,24),(53,'Air Conditioning',3.06,592559,5,24),(54,'Crazeology',3.01,89423798,158,24),(55,'If I Were A Bell',8.17,949856,4985,25),(56,'You are My Everything',5.2,606381,54,25),(57,'It Could Happen To You',6.31,133346,0,25),(58,'A Hand Fulla Gimme',3.02,108807,880,26),(59,'Groovin High',2.41,161,95,26),(60,'Blue N Boogie',2.58,842894,39,26),(61,'I Surrender Dear',4.41,122628,4157,27),(62,'Smack',2.46,123,41,27),(63,'My Ideal',3.11,4552442,247,27),(64,'Lover Man Oh Where Can You Be?',3.21,136450,984,28),(65,'That Ole Devil Called Love',2.51,1325,891,28),(66,'No More',2.44,6261991,593,28),(67,'What Would I Do Without You',2.37,150271,545,29),(68,'It is All Right',2.15,666667,984,29),(69,'I Want To Know',2.28,971539,340,29),(70,'Fair Weather',7,164093,54,30),(71,'Polka Dots And Moonbeams',8,675467,157,30),(72,'Hotel 49',9.54,9681087,9236,30),(73,'Bemba Colora',8.54,177914,9,31),(74,'Son Con Guaguanco',2.51,931067,984,31),(75,'Es La Humanidad',2.25,7139063,6,31),(76,'Manuela Despues. (La Doña)',7.16,191736,54,32),(77,'Carmelo Despues... (El Viejo DaSilva)',8.04,7031367,98,32),(78,'El Velorio',5.06,100184,5352,32),(79,'Jazzy',4.19,205557,5,33),(80,'Willie Baby',2.42,7169667,158,33),(81,'Borinquen',3.17,4809732,642,33),(82,'El Todopoderoso',4.21,219379,54,34),(83,'Emborrachame De Amor',3.12,730767,0,34),(84,'Paraiso De Dulzura',4.48,266281,1164,34),(85,'Satin And Lace',4.25,233200,95,35),(86,'Mama Guela',2.36,15518541,39,35),(87,'Te Comiste Un Pan',2.37,210,4985,35),(88,'Desesperado',3.5,247022,41,36),(89,'Tu No Le Amas Le Temes',4.27,1582509,247,36),(90,'Comprendelo',5.2,145,880,36),(91,'Adiós Nonino',8.06,260843,891,37),(92,'Otoño Porteño',5.1,161387638,593,37),(93,'Michelangelo 70',3.2,27647926,4157,37),(94,'Chorra',2.16,274665,984,38),(95,'Dicen Que Dicen',2.21,1644186,340,38),(96,'Ebrio',2.26,54575,984,38),(97,'Aquello',4.33,288486,157,39),(98,'Don Carlos',3.59,167593735,9236,39),(99,'Milongón Del Guruyú',4.46,245,0,39),(100,'Alma De Bohemio',3.38,302308,984,40),(101,'Al Compas Del Corazon',2.2,3523283,6,40),(102,'Temblando',2.36,7657,54,40),(103,'solari yacumenza',6.5,316129,98,41),(104,'flor de piel',4.38,1738831,5352,41),(105,'Clueca la Cueca',6.17,1215,9,41),(106,'Soy Un Circo',4.52,329951,158,42),(107,'La Chanson Des Vieux Amants',5.15,1738,642,42),(108,'Gabbiani ',3.5,2315,54,42),(109,'Let Me Ride',11.01,343772,0,43),(110,'One Eight Seven',4.18,1801928,1164,43),(111,'Let Me Ride (Radio Mix)',4.22,294815,5,43),(112,'The Ringer',5.37,357594,39,44),(113,'Greatest',3.46,11261476,4985,44),(114,'Lucky You',4.04,297944,54,44),(115,'E Side',5.35,714156,247,45),(116,'Bathtub',4.15,216025,880,45),(117,'G Funk Intro',2.25,30112,95,45),(118,'Encore',4.1,385271,593,46),(119,'Change Clothes',4.1,7557119,4157,46),(120,'Dirt Off Your Shoulder',4.18,3041,41,46),(121,'Jimmy James',3.11,990586,340,47),(122,'Funky Boss',2.28,291527,984,47),(123,'Pass The Mic',4.04,307209,891,47),(124,'Wake Up Mr. West',0.41,412880,9236,48),(125,'Heard Em Say',3.24,472110856,545,48),(126,'Touch The Sky',3.56,452957,984,48),(127,'Give Me Your Love',8.48,267016,6,49),(128,'Pacific 212',3.35,30755,54,49),(129,'Why Can not We Live Together',4.47,2162505,157,49),(130,'The Jingle',4.38,440523,5352,50),(131,'Magic Tribe',3.36,42540796,9,50),(132,'Kimbo',4.54,938720,984,50),(133,'Cova Rosa',5.31,543440,642,51),(134,'Oscos',5.4,310024,54,51),(135,'Doiras',5.22,319672,98,51),(136,'Aus ',9.25,481667,1164,52),(137,'Working',7.05,65968,5,52),(138,'Pain In The Ass',9.02,3227,158,52),(139,'Ignition Key',8.05,4819876,4985,53),(140,'The Convertion',2.29,1421912,54,53),(141,'Triangle',6.02,3200699,524545,53),(142,'Country Song',6.43,49580,880,54),(143,'Boys In The Hood',5.32,477856,95,54),(144,'Cloud Dancer',4.1,710247,39,54);
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discografica`
--

DROP TABLE IF EXISTS `discografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discografica` (
  `idDiscografica` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `idPais` int DEFAULT NULL,
  PRIMARY KEY (`idDiscografica`),
  KEY `Pais_idx` (`idPais`),
  CONSTRAINT `Pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discografica`
--

LOCK TABLES `discografica` WRITE;
/*!40000 ALTER TABLE `discografica` DISABLE KEYS */;
INSERT INTO `discografica` VALUES (1,'Sony Music Entertainment',4),(2,'Universal Music Group',4),(3,'Warner Music Group',4),(4,'EMI',7),(5,'Apple Records',7),(6,'Geffen Records',4),(7,'Sire Warner Bros',4),(8,'UMG Recordings',6),(9,'Elektra Records LLC',7),(10,'Atlantic Recording Corporation',8),(11,'Geffen Records',4),(12,'Atlantic Recording Corporation',4),(13,'Rimas Entertainment LLC',9),(14,'RCA Records',6),(15,'Universal International Music BV',7),(16,'Columbia Records',9),(17,'BigHit Entertainment',5),(18,'Interscope Records',6),(19,'Ministry of Sound Recordings Limited',9),(20,'WK Records',4),(21,'White World Music',6),(22,'Epic Records.',8),(23,'Internet Money Records',9),(24,'Aftermath Entertainment',4),(25,'Atlantic',4),(26,'Capitol Records',5),(27,'CBS',6),(28,'CBS Masterworks',11),(29,'Commodore',4),(30,'Death Row Records',9),(31,'Decca',4),(32,'Detroit Underground',4),(33,'Dial Records',4),(34,'Diynamic Music',11),(35,'Etcetera Records B.V.',16),(36,'Fania Records',4),(37,'Fania Records',4),(38,'Inca Records',2),(39,'M nus',5),(40,'Music Hall',1),(41,'Musicraft',4),(42,'Naxos Records',4),(43,'ND Nueva Direccion En La Cultura',1),(44,'NMC',7),(45,'Octave',7),(46,'Odeon',1),(47,'Prestige',4),(48,'RCA Victor Red Seal',11),(49,'REKIDS',11),(50,'Riverside Records',4),(51,'Roc-A-Fella Records',5),(52,'Roc-A-Fella Records, Universal Music',9),(53,'Sony Music',13),(54,'Stip Record',14),(55,'Tico Records',4),(56,'Trova',3),(57,'Truesoul',15),(58,'UA Latino',6);
/*!40000 ALTER TABLE `discografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoplaylist`
--

DROP TABLE IF EXISTS `estadoplaylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadoplaylist` (
  `idEstadoPlaylist` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstadoPlaylist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoplaylist`
--

LOCK TABLES `estadoplaylist` WRITE;
/*!40000 ALTER TABLE `estadoplaylist` DISABLE KEYS */;
INSERT INTO `estadoplaylist` VALUES (1,'activa'),(2,'eliminada');
/*!40000 ALTER TABLE `estadoplaylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idGenero` int NOT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Música Clasica'),(2,'Jazz'),(3,'Soul'),(4,'Blues'),(5,'Flamenco'),(6,'Salsa'),(7,'Reggaeton'),(8,'Tango'),(9,'Pop'),(10,'Blues'),(11,'Rock'),(12,'Trap'),(13,'Country'),(14,'Disco'),(15,'Hip Hop'),(17,'Reggae'),(19,'Punk'),(20,'Techno');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generoxcancion`
--

DROP TABLE IF EXISTS `generoxcancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generoxcancion` (
  `idGeneroxCancion` int NOT NULL,
  `IdCancion` int DEFAULT NULL,
  `IdGenero` int DEFAULT NULL,
  PRIMARY KEY (`idGeneroxCancion`),
  KEY `Cancion_idx` (`IdCancion`),
  KEY `Genero_idx` (`IdGenero`),
  CONSTRAINT `Cancion` FOREIGN KEY (`IdCancion`) REFERENCES `cancion` (`idCancion`),
  CONSTRAINT `Genero` FOREIGN KEY (`IdGenero`) REFERENCES `genero` (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generoxcancion`
--

LOCK TABLES `generoxcancion` WRITE;
/*!40000 ALTER TABLE `generoxcancion` DISABLE KEYS */;
INSERT INTO `generoxcancion` VALUES (1,1,11),(2,2,11),(3,3,11),(4,3,3),(5,4,11),(6,5,11),(7,6,9),(8,6,11),(9,7,9),(10,7,11),(11,8,9),(12,8,11),(13,9,9),(14,9,11),(15,10,11),(16,11,9),(17,12,9),(18,13,9),(19,14,9),(20,15,9),(21,16,11),(22,17,11),(23,18,9),(24,19,9),(25,20,9),(26,21,9),(27,22,9),(28,23,9),(29,24,9),(30,25,9),(31,34,1),(32,37,1),(33,40,1),(34,43,1),(35,46,1),(36,49,1),(37,52,2),(38,55,2),(39,58,2),(40,61,2),(41,64,2),(42,67,2),(43,70,2),(44,73,6),(45,76,6),(46,79,6),(47,79,9),(48,82,6),(49,85,6),(50,85,9),(51,88,6),(52,91,8),(53,94,8),(54,97,8),(55,100,8),(56,103,8),(57,106,8),(58,109,15),(59,112,15),(60,115,15),(61,118,15),(62,121,15),(63,124,15),(64,127,20),(65,130,20),(66,133,20),(67,130,9),(68,133,9),(69,136,20),(70,139,20),(71,142,20),(72,35,1),(73,38,1),(74,41,1),(75,44,1),(76,47,1),(77,50,1),(78,53,2),(79,56,2),(80,59,2),(81,62,2),(82,65,2),(83,68,2),(84,71,2),(85,74,6),(86,77,6),(87,80,6),(88,83,6),(89,86,6),(90,89,6),(91,92,8),(92,95,8),(93,98,8),(94,101,8),(95,104,8),(96,107,8),(97,110,15),(98,113,15),(99,116,15),(100,119,15),(101,122,15),(102,125,15),(103,128,20),(104,131,20),(105,134,20),(106,137,20),(107,140,20),(108,143,20),(109,36,1),(110,39,1),(111,42,1),(112,45,1),(113,48,1),(114,51,1),(115,54,2),(116,57,2),(117,60,2),(118,63,2),(119,66,2),(120,69,2),(121,72,2),(122,75,6),(123,78,6),(124,81,6),(125,84,6),(126,87,6),(127,90,6),(128,93,8),(129,96,8),(130,99,8),(131,102,8),(132,105,8),(133,108,8),(134,111,15),(135,114,15),(136,117,15),(137,120,15),(138,123,15),(139,126,15),(140,129,20),(141,132,20),(142,135,20),(143,138,20),(144,141,20),(145,144,20);
/*!40000 ALTER TABLE `generoxcancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idPais` int NOT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Argentina'),(2,'Colombia'),(3,'Uruguay'),(4,'Estados Unidos'),(5,'Canadá'),(6,'España'),(7,'Inglaterra'),(8,'Chile'),(9,'Brasil'),(11,'Alemania'),(12,'España'),(13,'Mexico'),(14,'Francia'),(15,'Suecia'),(16,'Holanda');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `idPlaylist` int NOT NULL,
  `idusuario` int DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `cantcanciones` int DEFAULT NULL,
  `idestado` int DEFAULT NULL,
  `Fechacreacion` datetime DEFAULT NULL,
  `Fechaeliminada` datetime DEFAULT NULL,
  PRIMARY KEY (`idPlaylist`),
  KEY `EstadoPlaylist_idx` (`idestado`),
  KEY `Usuario_idx` (`idusuario`),
  CONSTRAINT `EstadoPlaylist` FOREIGN KEY (`idestado`) REFERENCES `estadoplaylist` (`idEstadoPlaylist`),
  CONSTRAINT `playlist_Usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,1,'Para correr',15,1,'2020-02-27 00:00:00',NULL),(2,2,'Para Estudiar',10,1,'2019-05-07 00:00:00',NULL),(3,4,'Para Gym',15,2,'2020-03-07 00:00:00','2020-04-10 00:00:00'),(4,5,'Las mejores canciones',10,1,'2017-06-06 00:00:00',NULL),(5,2,'Mis canciones favoritos',10,1,'2016-09-29 00:00:00',NULL),(6,12,'Top 20',20,2,'2016-06-06 00:00:00','2016-04-12 00:00:00'),(7,11,'Mi top 10',10,1,'2017-06-16 00:00:00',NULL),(8,17,'Lo mejor del Rock',10,1,'2018-07-11 00:00:00',NULL),(9,15,'Musica Latina',5,2,'2016-12-11 00:00:00','2016-02-19 00:00:00'),(10,15,'Pop',6,1,'2016-06-23 00:00:00',NULL);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlistxcancion`
--

DROP TABLE IF EXISTS `playlistxcancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlistxcancion` (
  `idPlaylistxCancion` int NOT NULL,
  `Idcancion` int DEFAULT NULL,
  `IdPlaylist` int DEFAULT NULL,
  PRIMARY KEY (`idPlaylistxCancion`),
  KEY `IdCancion_idx` (`Idcancion`),
  KEY `IdPlaylist_idx` (`IdPlaylist`),
  CONSTRAINT `IdCancion` FOREIGN KEY (`Idcancion`) REFERENCES `cancion` (`idCancion`),
  CONSTRAINT `IdPlaylist` FOREIGN KEY (`IdPlaylist`) REFERENCES `playlist` (`idPlaylist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlistxcancion`
--

LOCK TABLES `playlistxcancion` WRITE;
/*!40000 ALTER TABLE `playlistxcancion` DISABLE KEYS */;
INSERT INTO `playlistxcancion` VALUES (1,1,1),(2,138,1),(3,22,1),(4,75,1),(5,39,2),(6,42,2),(7,43,2),(8,46,3),(9,62,3),(10,22,3),(11,73,3),(12,1,3),(13,1,4),(14,2,4),(15,3,4),(16,5,4),(17,18,5),(18,26,5),(19,30,5),(20,5,6),(21,14,6),(22,108,6),(23,54,6),(24,62,6),(25,6,6),(26,8,6),(27,33,6),(28,41,6),(29,30,6),(30,2,6),(31,100,6),(32,80,6),(33,16,6),(34,17,6),(35,89,6),(36,44,6),(37,36,6),(38,19,6),(39,57,6),(40,55,7),(41,101,7),(42,85,7),(43,14,7),(44,37,7),(45,59,7),(46,49,7),(47,32,7),(48,19,7),(49,51,7),(50,5,8),(51,1,8),(52,4,8),(53,10,8),(54,16,8),(55,17,8),(56,19,9),(57,15,9),(58,20,9),(59,24,9),(60,23,9),(61,14,10),(62,20,10),(63,85,10),(64,133,10),(65,21,10),(66,11,10);
/*!40000 ALTER TABLE `playlistxcancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipousuario` (
  `idTipoUsuario` int NOT NULL,
  `TipoUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Premium'),(2,'standard'),(3,'free');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL,
  `nombreusuario` varchar(45) DEFAULT NULL,
  `nyap` varchar(45) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `CP` varchar(8) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Pais_idPais` int DEFAULT NULL,
  `IdTipoUsuario` int DEFAULT NULL,
  `FechaPassword` date DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_Pais1_idx` (`Pais_idPais`),
  KEY `fk_IdTipoUsuario_idx` (`IdTipoUsuario`),
  CONSTRAINT `fk_IdTipoUsuario` FOREIGN KEY (`IdTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`),
  CONSTRAINT `fk_Usuario_Pais1` FOREIGN KEY (`Pais_idPais`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'MORTIZ','MARIA ORTIZ','1975-09-27','F','1001','ORTIZ!16',1,1,NULL),(2,'IBALLESTEROS','ISABEL BALLESTEROS','1987-10-17','F','1001','BALLESTEROS$93',1,1,NULL),(3,'CRAMIREZ','CARMEN RAMIREZ','1994-08-26','F','1001','RAMIREZ&88',1,1,NULL),(4,'MGONZALEZ','MARIA PAULA GONZALEZ','1981-03-27','F','118942','GONZALEZ!15',2,1,NULL),(5,'EHERNANDEZ','EMILY HERNANDEZ','2001-02-10','F','118942','HERNANDEZ$4',2,1,NULL),(6,'LGOMEZ','LUISA GOMEZ','1971-12-12','F','118942','GOMEZ&35',2,2,NULL),(7,'MSOSA','MARIA CARMEN SOSA','1981-07-16','F','3','SOSA.61',6,2,NULL),(8,'MSMITH','MARY SMITH','2000-05-04','F','B24','SMITH#93',7,2,NULL),(9,'PSOTO','PATRICIA SOTO','1974-07-12','F','832 0000','SOTO!93',8,3,NULL),(10,'AGARCIA','ANTONIO GARCIA','1995-08-30','M','1001','GARCIA!21',1,1,NULL),(11,'JMARTINEZ','JOSE MARTINEZ','1987-11-22','M','1001','MARTINEZ$16',1,2,NULL),(12,'FLOPEZ','FRANCISCO LOPEZ','1988-02-16','M','1001','LOPEZ&27',1,3,NULL),(13,'JSANCHEZ','JUAN SANCHEZ','2003-03-23','M','1001','SANCHEZ.60',1,3,NULL),(14,'MRODRIGUEZ','MIGUEL ANGEL RODRIGUEZ','2003-10-16','M','118942','RODRIGUEZ#38',2,2,NULL),(15,'JDIAZ','JUAN ESTEBAN DIAZ','1973-05-23','M','118942','DIAZ!93',2,1,NULL),(16,'JLOPEZ','JUAN SEBASTIAN LOPEZ','1974-03-15','M','118942','LOPEZ$56',2,2,NULL),(17,'SMARTINEZ','SANTIAGO MARTINEZ','1977-07-18','M','118942','MARTINEZ&33',2,2,NULL),(18,'DRUBIO','DAVID RUBIO','2001-01-17','M','60000','RUBIO.53',3,2,NULL),(19,'JWATSON','JHON WATSON','2003-10-22','M','10029','WATSON#81',4,3,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-12 16:48:51
