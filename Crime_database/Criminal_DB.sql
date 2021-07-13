CREATE DATABASE  IF NOT EXISTS `Final_Work` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Final_Work`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Final_Work
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `Cases`
--

DROP TABLE IF EXISTS `Cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cases` (
  `Case_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Officer` varchar(45) NOT NULL,
  `Opening_Date` datetime NOT NULL,
  `Closing_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Case_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cases`
--

LOCK TABLES `Cases` WRITE;
/*!40000 ALTER TABLE `Cases` DISABLE KEYS */;
INSERT INTO `Cases` VALUES (1,'Brakage de Quartier','Denise','2016-02-02 00:00:00','2020-02-05 00:00:00'),(2,'Meutre pour Halloween','Paul','2013-04-08 00:00:00','2021-01-16 00:00:00'),(3,'Viol durant le COVID','Carroll','2013-04-08 00:00:00','2021-01-16 00:00:00'),(4,'Feminicide','Carroll','2018-03-02 00:00:00',NULL),(5,'A crazy father','Denise','2019-04-09 00:00:00','2021-01-15 00:00:00'),(6,'Nuit noir sur Boston','Denise','2021-01-01 00:00:00',NULL),(7,'Pas d alcool','Paul','2020-04-09 00:00:00','2020-05-10 00:00:00'),(8,'COVID party','Denise','2020-12-12 00:00:00','2021-12-12 00:00:00'),(9,'Drugs are bad','Paul','2013-04-08 00:00:00','2020-02-05 00:00:00'),(10,'Night Rapper','Denise','2014-04-09 00:00:00',NULL);
/*!40000 ALTER TABLE `Cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crime`
--

DROP TABLE IF EXISTS `crime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crime` (
  `Crime_ID` int NOT NULL,
  `Crime_type` enum('Murder','Rape','Theft','Assault','Unauthorized event','Influence','Drug deal') NOT NULL,
  `Date_Crime` datetime NOT NULL,
  `Case_ID` int NOT NULL,
  PRIMARY KEY (`Crime_ID`),
  KEY `fk_Crime._Cases.1_idx` (`Case_ID`),
  CONSTRAINT `fk_Crime._Cases.1` FOREIGN KEY (`Case_ID`) REFERENCES `Cases` (`Case_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime`
--

LOCK TABLES `crime` WRITE;
/*!40000 ALTER TABLE `crime` DISABLE KEYS */;
INSERT INTO `crime` VALUES (1,'Murder','2016-01-31 00:00:00',1),(2,'Theft','2016-01-31 00:00:00',1),(3,'Theft','2016-01-31 00:00:00',1),(4,'Rape','2013-04-08 00:00:00',2),(5,'Murder','2013-04-08 00:00:00',2),(6,'Assault','2013-04-08 00:00:00',3),(7,'Assault','2013-04-08 00:00:00',3),(8,'Assault','2013-04-08 00:00:00',3),(9,'Assault','2013-04-08 00:00:00',3),(10,'Murder','2018-03-02 00:00:00',4),(11,'Murder','2019-03-09 00:00:00',5),(12,'Murder','2019-03-09 00:00:00',5),(13,'Murder','2019-03-09 00:00:00',5),(14,'Murder','2021-01-01 00:00:00',6),(15,'Theft','2021-01-01 00:00:00',6),(16,'Rape','2021-01-01 00:00:00',6),(17,'Influence','2020-09-04 00:00:00',7),(18,'Unauthorized event','2020-12-12 00:00:00',8),(19,'Drug deal','2013-04-08 00:00:00',9),(20,'Rape','2014-04-09 00:00:00',10),(21,'Rape','2014-04-13 00:00:00',10),(22,'Rape','2014-04-18 00:00:00',10),(23,'Rape','2014-04-22 00:00:00',10),(24,'Rape','2014-04-25 00:00:00',10);
/*!40000 ALTER TABLE `crime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evidence`
--

DROP TABLE IF EXISTS `Evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evidence` (
  `Evidence_ID` int NOT NULL,
  `type` enum('Weapon','Biological Evidence','Prints','Drug') NOT NULL,
  `Collected_Date` datetime NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Case_ID` int NOT NULL,
  PRIMARY KEY (`Evidence_ID`),
  KEY `fk_Evidence._Cases.1_idx` (`Case_ID`),
  CONSTRAINT `fk_Evidence._Cases.1` FOREIGN KEY (`Case_ID`) REFERENCES `Cases` (`Case_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evidence`
--

LOCK TABLES `Evidence` WRITE;
/*!40000 ALTER TABLE `Evidence` DISABLE KEYS */;
INSERT INTO `Evidence` VALUES (1,'Weapon','2020-02-02 00:00:00','Gun',1),(2,'Weapon','2019-03-04 00:00:00','Knife',2),(3,'Biological Evidence','2020-04-03 00:00:00','Sperm',3),(4,'Weapon','2018-03-03 00:00:00','Gun',4),(5,'Biological Evidence','2018-03-03 00:00:00','Sperm',4),(6,'Weapon','2019-04-09 00:00:00','Gun',5),(7,'Biological Evidence','2021-01-02 00:00:00','Sperm',6),(8,'Drug','2013-09-04 00:00:00','Canabis',9),(9,'Drug','2013-09-04 00:00:00','Cocaine',9),(10,'Biological Evidence','2014-06-09 00:00:00','Sperm',10);
/*!40000 ALTER TABLE `Evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Judgement`
--

DROP TABLE IF EXISTS `Judgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Judgement` (
  `Judgement_ID` int NOT NULL,
  `Court_Type` enum('First Instance','Seconde Instance') NOT NULL,
  `Judge` varchar(45) NOT NULL,
  `Decision` enum('Guilty','Not Guilty') NOT NULL,
  `Date_Judgement` datetime NOT NULL,
  `Crime_ID` int NOT NULL,
  PRIMARY KEY (`Judgement_ID`),
  KEY `fk_Judgement._Crime.1_idx` (`Crime_ID`),
  CONSTRAINT `fk_Judgement._Crime.1` FOREIGN KEY (`Crime_ID`) REFERENCES `Crime` (`Crime_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Judgement`
--

LOCK TABLES `Judgement` WRITE;
/*!40000 ALTER TABLE `Judgement` DISABLE KEYS */;
INSERT INTO `Judgement` VALUES (1,'First Instance','Pascal','Guilty','2020-02-04 00:00:00',1),(2,'Seconde Instance','Nani','Not Guilty','2020-02-05 00:00:00',1),(3,'First Instance','Pascal','Guilty','2020-02-04 00:00:00',2),(4,'Seconde Instance','Nani','Not Guilty','2020-02-05 00:00:00',2),(5,'First Instance','Pascal','Not Guilty','2020-02-04 00:00:00',3),(6,'First Instance','Pascal','Guilty','2020-02-04 00:00:00',4),(7,'First Instance','Jeanne','Guilty','2020-03-04 00:00:00',5),(8,'First Instance','Jeanne','Guilty','2020-03-04 00:00:00',6),(9,'First Instance','Bob','Guilty','2020-07-09 00:00:00',7),(10,'First Instance','Bob','Not Guilty','2021-01-18 00:00:00',8),(11,'First Instance','Bob','Not Guilty','2020-02-05 00:00:00',9),(12,'First Instance','Jeanne','Guilty','2021-01-20 00:00:00',11),(13,'First Instance','Jeanne','Guilty','2021-01-20 00:00:00',12),(14,'First Instance','Jeanne','Guilty','2021-01-20 00:00:00',13),(15,'First Instance','Jeanne','Guilty','2020-10-09 00:00:00',17),(16,'First Instance','Jeanne','Guilty','2021-02-03 00:00:00',18),(17,'First Instance','Jeanne','Guilty','2020-03-05 00:00:00',19),(18,'Seconde Instance','Nani','Guilty','2021-01-25 00:00:00',17);
/*!40000 ALTER TABLE `Judgement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Penalty`
--

DROP TABLE IF EXISTS `Penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Penalty` (
  `Penalty_ID` int NOT NULL,
  `Penalty_Type` enum('Jail','Fine') NOT NULL,
  `Description` varchar(255) NOT NULL,
  `End_Penalty` datetime DEFAULT NULL,
  `Prison_ID` int DEFAULT NULL,
  `Judgement_ID` int DEFAULT NULL,
  PRIMARY KEY (`Penalty_ID`),
  KEY `fk_Penalty_Prison.1_idx` (`Prison_ID`),
  KEY `fk_Penalty_Judgement.1_idx` (`Judgement_ID`),
  CONSTRAINT `fk_Penalty_Judgement.1` FOREIGN KEY (`Judgement_ID`) REFERENCES `Judgement` (`Judgement_ID`),
  CONSTRAINT `fk_Penalty_Prison.1` FOREIGN KEY (`Prison_ID`) REFERENCES `Prison` (`Prison_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Penalty`
--

LOCK TABLES `Penalty` WRITE;
/*!40000 ALTER TABLE `Penalty` DISABLE KEYS */;
INSERT INTO `Penalty` VALUES (1,'Jail','10 Years','2030-02-04 00:00:00',1,1),(2,'Jail','10 Years','2030-02-04 00:00:00',1,3),(3,'Jail','20 Years','2030-02-04 00:00:00',5,6),(4,'Jail','20 Years','2030-02-04 00:00:00',5,7),(5,'Jail','20 Years','2030-02-04 00:00:00',5,8),(6,'Jail','20 Years','2030-02-04 00:00:00',5,9),(7,'Jail','99 years','2120-01-20 00:00:00',10,12),(8,'Jail','99 years','2120-01-20 00:00:00',10,13),(9,'Jail','99 years','2120-01-20 00:00:00',10,14),(10,'Jail','6 months','2021-10-03 00:00:00',2,15),(11,'Fine','10000 Dollars',NULL,NULL,16),(12,'Jail','20 Years','2040-03-05 00:00:00',2,17),(13,'Fine','10000 Dollars',NULL,NULL,18);
/*!40000 ALTER TABLE `Penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `Person_ID` int NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Nationality` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Adress` varchar(100) NOT NULL,
  `Birth` datetime NOT NULL,
  PRIMARY KEY (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'Lol','Cerdan','FR','F','777 Brockton Avenue, Abington MA 2351','1996-04-23 00:00:00'),(2,'Ines','Nadrec','AN','F','30 Memorial Drive, Avon MA 2322','1986-05-14 00:00:00'),(3,'Seni','Ernac','ES','M','250 Hartford Avenue, Bellingham MA 2019','1998-03-02 00:00:00'),(4,'Nise','Dacner','GE','M','700 Oak Street, Brockton MA 2301','1996-04-03 00:00:00'),(5,'June','Racned','UK','F','66-4 Parkhurst Rd, Chelmsford MA 1824','1956-03-14 00:00:00'),(6,'May','Ancerd','USA','M','591 Memorial Dr, Chicopee MA 1020','1998-02-12 00:00:00'),(7,'Maxou','Maxi','SW','M','55 Brooksby Village Way, Danvers MA 1923','1996-02-28 00:00:00'),(8,'Jeanne','Dutrieux','PO','F','137 Teaticket Hwy, East Falmouth MA 2536','1946-05-14 00:00:00'),(9,'Paul','David','BE','M','42 Fairhaven Commons Way, Fairhaven MA 2719','1978-03-11 00:00:00'),(10,'Juan','Dustin','IT','M','374 William S Canning Blvd, Fall River MA 2721','1989-02-03 00:00:00'),(11,'Denise','Reynard','USA','F','121 Worcester Rd, Framingham MA 1701','1974-03-04 00:00:00'),(12,'Pascal','Pearson','FR','M','677 Timpany Blvd, Gardner MA 1440','1988-12-03 00:00:00'),(13,'Christian ','Durein ','MA','M','337 Russell St, Hadley MA 1035','1945-02-27 00:00:00'),(14,'Evelyne','Fournier','FR','F','295 Plymouth Street, Halifax MA 2338','1970-02-05 00:00:00'),(15,'Bob','Marchert','USA','M','1775 Washington St, Hanover MA 2339','1983-03-04 00:00:00'),(16,'Caroll','Studt','JN','F','280 Washington Street, Hudson MA 1749','1969-03-21 00:00:00'),(17,'Cristian','Brown','CH','M','20 Soojian Dr, Leicester MA 1524','1989-04-23 00:00:00'),(18,'Laurin','Pant','AN','F','11 Jungle Road, Leominster MA 1453','1999-03-02 00:00:00'),(19,'Yse','Aiello','ES','F','301 Massachusetts Ave, Lunenburg MA 1462','1997-04-03 00:00:00'),(20,'Jenny','Jahangir','GE','F','780 Lynnway, Lynn MA 1905','1955-03-14 00:00:00'),(21,'Lars','Morfin','UK','M','70 Pleasant Valley Street, Methuen MA 1844','1999-02-12 00:00:00'),(22,'Chris','Nemec','USA','M','830 Curran Memorial Hwy, North Adams MA 1247','1990-02-28 00:00:00'),(23,'Rocio','Nazarian','SW','F','1470 S Washington St, North Attleboro MA 2760','1935-05-14 00:00:00'),(24,'Laura','Morfin','PO','F','506 State Road, North Dartmouth MA 2747','1989-03-11 00:00:00'),(25,'Mudabbir','Morfin','BE','M','742 Main Street, North Oxford MA 1537','1961-02-03 00:00:00'),(26,'Toni','Zhang','IT','M','72 Main St, North Reading MA 1864','1978-03-04 00:00:00'),(27,'Fredrik','Nemec','USA','M','200 Otis Street, Northborough MA 1532','1963-12-03 00:00:00'),(28,'Hannah','Pant','FR','F','180 North King Street, Northhampton MA 1060','1978-03-11 00:00:00'),(29,'Khaja','Wang','MA','M','555 East Main St, Orange MA 1364','1989-02-03 00:00:00'),(30,'Julia','Kromer','FR','F','555 Hubbard Ave-Suite 12, Pittsfield MA 1201','1974-03-04 00:00:00'),(31,'Valentina','Chabanel','USA','F','300 Colony Place, Plymouth MA 2360','1988-12-03 00:00:00'),(32,'Sebastian','Chabanel','USA','M','301 Falls Blvd, Quincy MA 2169','1945-02-27 00:00:00'),(33,'Frida','Chabanel','USA','F','36 Paramount Drive, Raynham MA 2767','1970-02-05 00:00:00'),(34,'Costanza','Chabanel','USA','F','450 Highland Ave, Salem MA 1970','1983-03-04 00:00:00'),(35,'Costantin','Lopez','ES','M','1180 Fall River Avenue, Seekonk MA 2771','1969-03-21 00:00:00'),(36,'Kyra','Resag','GE','F','1105 Boston Road, Springfield MA 1119','1989-04-23 00:00:00'),(37,'Raafi','Khawaja','SW','M','100 Charlton Road, Sturbridge MA 1566','1999-03-02 00:00:00'),(38,'Sair','Duro','PO','M','262 Swansea Mall Dr, Swansea MA 2777','1997-04-03 00:00:00'),(39,'Paolo','Mellbye','BE','M','36 Paramount Drive, Raynham MA 2767','1955-03-14 00:00:00'),(40,'Costantin','Fournier','USA','M','550 Providence Hwy, Walpole MA 2081','1997-04-03 00:00:00'),(41,'Kyra','Marchert','ES','F','352 Palmer Road, Ware MA 1082','1955-03-14 00:00:00'),(42,'Raafi','Studt','GE','M','3005 Cranberry Hwy Rt 6 28, Wareham MA 2538','1999-02-12 00:00:00'),(43,'Sair','Brown','SW','M','250 Rt 59, Airmont NY 10901','1990-02-28 00:00:00'),(44,'Paolo','Pant','PO','M','141 Washington Ave Extension, Albany NY 12205','1990-03-01 00:00:00');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prison`
--

DROP TABLE IF EXISTS `Prison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prison` (
  `Prison_ID` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Max_Capacity` int NOT NULL,
  PRIMARY KEY (`Prison_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prison`
--

LOCK TABLES `Prison` WRITE;
/*!40000 ALTER TABLE `Prison` DISABLE KEYS */;
INSERT INTO `Prison` VALUES (1,'US Penitentiary Marion','Illinois',1000),(2,'Rikers island','New York',14000),(3,'Louisiana State Penitentiary','Louisiana',5000),(4,'Leavenworth Federal Penitentiary','Kansas',2000),(5,'Folson State Prison','California',1813),(6,'Attica Correctional Facility','New York',2150),(7,'US Penitentiary Atlanta','Georgia',2000),(8,'Sing Sing','New York',1700),(9,'San Quentin State Prison','California',3302),(10,'ADX Florence Facility','Colorado',490);
/*!40000 ALTER TABLE `Prison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Victim_Criminal`
--

DROP TABLE IF EXISTS `Victim_Criminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Victim_Criminal` (
  `Implicated_ID` int NOT NULL,
  `Implication_Type` enum('Victim','Criminal','Unknown') NOT NULL,
  `Questionning` text,
  `Status` enum('Dead','Alive','Missing','Unknown') NOT NULL,
  `Crime_ID` int NOT NULL,
  `Person_ID` int DEFAULT NULL,
  PRIMARY KEY (`Implicated_ID`),
  KEY `fk_Implicated_Crime.1_idx` (`Crime_ID`),
  KEY `fk_Implicated_Person.1_idx` (`Person_ID`),
  CONSTRAINT `fk_Implicated_Crime.1` FOREIGN KEY (`Crime_ID`) REFERENCES `Crime` (`Crime_ID`),
  CONSTRAINT `fk_Implicated_Person.1` FOREIGN KEY (`Person_ID`) REFERENCES `Person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Victim_Criminal`
--

LOCK TABLES `Victim_Criminal` WRITE;
/*!40000 ALTER TABLE `Victim_Criminal` DISABLE KEYS */;
INSERT INTO `Victim_Criminal` VALUES (1,'Criminal','','Alive',1,9),(2,'Criminal','','Alive',2,9),(3,'Criminal','','Alive',3,1),(4,'Victim','','Dead',1,2),(5,'Victim','','Dead',2,2),(6,'Victim','','Dead',3,2),(7,'Criminal','','Alive',4,6),(8,'Criminal','','Alive',5,6),(9,'Victim','','Dead',4,3),(10,'Victim','','Dead',5,3),(11,'Criminal','','Alive',6,10),(12,'Criminal','','Alive',7,10),(13,'Criminal','','Alive',8,13),(14,'Criminal','','Alive',9,13),(15,'Victim','','Alive',6,14),(16,'Victim','','Alive',7,14),(17,'Victim','','Alive',8,17),(18,'Victim','','Alive',9,17),(19,'Victim','','Dead',10,37),(20,'Criminal','','Dead',11,31),(21,'Criminal','','Dead',12,31),(22,'Criminal','','Dead',13,31),(23,'Victim','','Dead',11,32),(24,'Victim','','Dead',12,33),(25,'Victim','','Dead',13,34),(26,'Criminal','','Alive',14,18),(27,'Criminal','','Alive',15,18),(28,'Criminal','','Alive',16,18),(29,'Victim','','Dead',14,19),(30,'Victim','','Dead',15,19),(31,'Victim','','Dead',16,19),(32,'Criminal','','Alive',17,20),(33,'Criminal','','Alive',18,21),(34,'Criminal','','Alive',18,22),(35,'Criminal','','Alive',18,23),(36,'Criminal','','Alive',18,24),(37,'Criminal','','Alive',18,25),(38,'Criminal','','Alive',18,26),(39,'Criminal','','Alive',19,27),(40,'Victim','','Alive',20,28),(41,'Victim','','Alive',21,29),(42,'Victim','','Alive',22,30),(43,'Victim','','Alive',23,35),(44,'Victim','','Alive',24,36),(45,'Criminal','','Unknown',20,NULL),(46,'Criminal','','Unknown',21,NULL),(47,'Criminal','','Unknown',22,NULL),(48,'Criminal','','Unknown',23,NULL),(49,'Criminal','','Unknown',24,NULL),(50,'Criminal','','Unknown',10,NULL);
/*!40000 ALTER TABLE `Victim_Criminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Witness`
--

DROP TABLE IF EXISTS `Witness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Witness` (
  `Witness_ID` int NOT NULL,
  `Questionning` text NOT NULL,
  `Person_ID` int NOT NULL,
  `Case_ID` int NOT NULL,
  PRIMARY KEY (`Witness_ID`),
  KEY `fk_Witness_Person.1_idx` (`Person_ID`),
  KEY `fk_Witness_Cases.1_idx` (`Case_ID`),
  CONSTRAINT `fk_Witness_Cases.1` FOREIGN KEY (`Case_ID`) REFERENCES `Cases` (`Case_ID`),
  CONSTRAINT `fk_Witness_Person.1` FOREIGN KEY (`Person_ID`) REFERENCES `Person` (`Person_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Witness`
--

LOCK TABLES `Witness` WRITE;
/*!40000 ALTER TABLE `Witness` DISABLE KEYS */;
INSERT INTO `Witness` VALUES (1,'slt',7,1),(2,'tg',4,2),(3,'slt ftg',11,3),(4,'ouesh je me suis perdu',7,3),(5,'bla',38,4),(6,'bruit',39,8),(7,'buot',40,8),(8,'buits',41,8),(9,'bri',42,6),(10,'blon',43,9);
/*!40000 ALTER TABLE `Witness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Final_Work'
--
/*!50003 DROP PROCEDURE IF EXISTS `Criminal_rec_out_prc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Criminal_rec_out_prc`(                      in in_Person_ID int, 
																		out out_first_name  varchar(45),
																		out out_last_name varchar(45), 
																		out out_Birth datetime,
                                                                        out out_Count_Crime_ID int)
begin



select P.first_name 'First Name',
       P.last_name 'Last Name', 
       p.Birth,
       count(CR.Crime_ID)
       into out_first_name , out_last_name ,out_Birth , out_Count_Crime_ID
      
       

from person P
left join Victim_Criminal VC on VC.Person_ID = P.Person_ID
left join crime CR on Cr.Crime_ID = VC.Crime_ID
where P.Person_ID = in_Person_ID
group by P.Person_ID;






END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `criminal_rec_prc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `criminal_rec_prc`(in in_first_name VARCHAR(45),in in_last_name VARCHAR(45))
begin



select P.Person_ID , P.first_name 'First Name',
       P.last_name 'Last Name', 
       p.Birth , CR.Crime_ID , CR.Crime_type,
       JU.Court_Type, JU.Decision , PEN.Penalty_Type 

from person P 
left join victim_criminal VC on P.person_id=VC.person_id 
left join Crime CR on CR.Crime_ID=VC.Crime_ID
left join Judgement JU on JU.Crime_ID = CR.Crime_ID
left join Penalty PEN on PEN.Judgement_ID = JU.Judgement_ID
where first_name = in_first_name
and last_name = in_last_name
and VC.Implication_Type="Criminal";


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Lvl_of_Offence_PRC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Lvl_of_Offence_PRC`(in in_Crime_ID int, 
																				out out_Crime_ID int,
                                                                                out level_of_offence  varchar(155),
                                                                                out out_Crime_type varchar(105))
BEGIN


DECLARE v_type varchar(10);
  
  select Crime_ID,Crime_type ,Crime_type
  into out_Crime_ID,v_type , out_Crime_type
  from crime 
  where Crime_ID=in_Crime_ID;
  


  If v_type = "Murder" or v_type = "Rape"
	then set level_of_offence = "Felonies";
        
    
  elseif v_type = "Theft" or v_type = "Drug deal" or v_type = "Assault"
    then set level_of_offence = "Misdemeanor";
        
	else
		set level_of_offence = "Infraction";
        
       
  End if;
  


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

-- Dump completed on 2021-07-13 13:47:22
