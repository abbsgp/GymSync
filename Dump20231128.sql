-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (x86_64)
--
-- Host: localhost    Database: gym
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `Member_Id` int unsigned NOT NULL,
  `Contact_Information` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Member_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (100000,'907-416-8358','Clay Schroeder','d41d8cd98f00b204e9800998ecf8427e'),(100001,'347-760-8504','Noemie Crona','d41d8cd98f00b204e9800998ecf8427e'),(100002,'597-051-6241','Keyshawn Schaefer','d41d8cd98f00b204e9800998ecf8427e'),(100003,'345-664-5857','Amo Rosenbaum','d41d8cd98f00b204e9800998ecf8427e'),(100004,'599-702-0833','Blaze Heidenreich','d41d8cd98f00b204e9800998ecf8427e');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_Id` int unsigned NOT NULL,
  `Branch_Location` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_Id`),
  UNIQUE KEY `Branch_Location` (`Branch_Location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (200000,'Bode Well','Raheem Maggio'),(200001,'Doyle Forks','Oran Kerluke'),(200002,'Hartmann Points','Alena Doyle'),(200003,'Altenwerth Vista','Margaret Becker'),(200004,'Daugherty Manor','Adaline Bartoletti');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gym`
--

DROP TABLE IF EXISTS `Gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gym` (
  `Location` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Contact_Information` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Facilities` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Scheduled_Classes` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`Location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gym`
--

LOCK TABLES `Gym` WRITE;
/*!40000 ALTER TABLE `Gym` DISABLE KEYS */;
INSERT INTO `Gym` VALUES ('22512 Schinner Mountains\nLake Eldorafurt, KY 92072','973.693.7944x88927','omnis','qui'),('3060 Isabella Park Suite 851\nLake Ricardo, NH 2594','(521)341-8096x2142','voluptate','et'),('8449 Jenkins Station Suite 863\nSouth Juwan, DC 803','074-909-7947','enim','hic'),('8532 Watsica Glens\nSouth Deannabury, KS 35838','(314)223-7597','consequatur','et'),('9197 Kirstin Junctions\nVitobury, IL 31451-6906','(904)757-2059','sed','consequatur');
/*!40000 ALTER TABLE `Gym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gym_Membership_Card`
--

DROP TABLE IF EXISTS `Gym_Membership_Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gym_Membership_Card` (
  `Id_Number` int unsigned NOT NULL,
  `Expiration_Date` date NOT NULL,
  `Location_Access` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Facility_Access` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`Id_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gym_Membership_Card`
--

LOCK TABLES `Gym_Membership_Card` WRITE;
/*!40000 ALTER TABLE `Gym_Membership_Card` DISABLE KEYS */;
INSERT INTO `Gym_Membership_Card` VALUES (4,'2008-08-03','1',''),(60,'2023-08-19','1',''),(70408,'2003-03-25','1','1'),(4554140,'1988-01-20','','1'),(943481206,'1974-02-14','1','');
/*!40000 ALTER TABLE `Gym_Membership_Card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `Manager_Id` int unsigned NOT NULL,
  `Branch_Location` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Manager_Id`),
  KEY `Branch_Location` (`Branch_Location`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Manager_Id`) REFERENCES `Employee` (`Employee_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`Branch_Location`) REFERENCES `Employee` (`Branch_Location`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (200004,'Daugherty Manor','Adaline Bartoletti','d41d8cd98f00b204e9800998ecf8427e');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `Trainer_Id` int unsigned NOT NULL,
  `Branch_Location` varchar(50) NOT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `Number_Of_Clients` int unsigned NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Trainer_Id`),
  KEY `Branch_Location` (`Branch_Location`),
  CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`Trainer_Id`) REFERENCES `Employee` (`Employee_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trainer_ibfk_2` FOREIGN KEY (`Branch_Location`) REFERENCES `Employee` (`Branch_Location`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (200000,'Bode Well','a',1,'Raheem Maggio','d41d8cd98f00b204e9800998ecf8427e'),(200001,'Doyle Forks','q',1,'Oran Kerluke','d41d8cd98f00b204e9800998ecf8427e'),(200002,'Hartmann Points','s',1,'Alena Doyle','d41d8cd98f00b204e9800998ecf8427e'),(200003,'Altenwerth Vista','z',1,'Margaret Becker','d41d8cd98f00b204e9800998ecf8427e');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction` (
  `Transaction_Id` int unsigned NOT NULL,
  `Balance` int NOT NULL,
  `Due_Date` date NOT NULL,
  `Card_Type` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`Transaction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES (0,1128807,'2022-08-18','4532522941083'),(25,55946494,'2008-02-04','4024007197744035'),(40,930079,'2012-01-04','5187760835367888'),(200,0,'2006-01-27','378699258075779'),(715498295,7,'2011-01-20','5200519387826602');
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28  0:17:45
