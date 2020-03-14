-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `idaccount` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idaccount`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claims`
--

DROP TABLE IF EXISTS `claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claims` (
  `idclaim` int(11) NOT NULL AUTO_INCREMENT,
  `related_topic` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `replies` int(11) DEFAULT '0',
  PRIMARY KEY (`idclaim`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claims`
--

LOCK TABLES `claims` WRITE;
/*!40000 ALTER TABLE `claims` DISABLE KEYS */;
INSERT INTO `claims` VALUES (1,1,'Best airplane','2020-03-09 23:03:36',0),(2,2,'Not a very good langage','2020-03-09 23:03:36',0),(3,1,'test','2020-03-11 19:02:39',0),(4,1,'NAN','2020-03-11 19:02:42',0),(5,1,'lol','2020-03-11 19:03:18',0),(6,1,'and a1350','2020-03-12 01:16:08',0),(7,3,'TESTING','2020-03-12 01:16:08',0),(8,1,'LOL','2020-03-13 16:06:48',0),(9,10,'what','2020-03-13 16:06:58',0),(10,9,'best serie','2020-03-13 18:45:09',0),(11,9,'prison break','2020-03-13 19:05:53',0),(12,12,'test','2020-03-13 19:15:14',0),(13,12,'oui','2020-03-13 19:17:40',0),(14,11,'AH OUI HEIN','2020-03-13 19:17:49',0),(15,13,'Froome overrated','2020-03-13 19:18:41',0),(16,7,'TRUE','2020-03-14 01:23:15',0);
/*!40000 ALTER TABLE `claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `idtopic` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `subheading` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `claims` int(11) DEFAULT '0',
  PRIMARY KEY (`idtopic`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'The A330 Neo','DEFAULT',NULL,NULL),(2,'Ocaml','DEFAULT',NULL,NULL),(3,'Is the date working ?','DEFAULT','2020-03-09 23:01:12',0),(4,'Format','DEFAULT','2020-03-09 23:03:36',0),(5,'GTAV','Game','2020-03-09 23:16:49',0),(6,'Joseph\'s dick','Anatomy','2020-03-10 11:32:35',0),(7,'Nathan la pedale','homo','2020-03-10 13:01:05',1),(9,'Prison Break','TV Series','2020-03-11 00:12:00',0),(10,'ss','','2020-03-11 00:12:04',0),(11,'TEST','','2020-03-11 00:12:10',1),(12,'Lack of surgeons','Medecine','2020-03-12 01:13:39',2),(13,'Cyclisme','SPort','2020-03-13 19:18:24',1),(14,'Oui','Non','2020-03-14 01:55:50',0);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-14  2:24:54
