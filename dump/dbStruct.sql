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
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `Member_Id` int unsigned NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Contact_Information` varchar(50) NOT NULL,
  `Health` varchar(50) DEFAULT NULL,
  `Meal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Member_Id`),
  UNIQUE KEY `Health` (`Health`),
  UNIQUE KEY `Meal` (`Meal`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`Health`) REFERENCES `Trainer` (`Health`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `client_ibfk_2` FOREIGN KEY (`Meal`) REFERENCES `Trainer` (`Meal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_Id` int unsigned NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Branch_Location` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_Id`),
  UNIQUE KEY `Branch_Location` (`Branch_Location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Gym`
--

DROP TABLE IF EXISTS `Gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gym` (
  `Location` varchar(50) NOT NULL,
  `Contact_Information` varchar(50) NOT NULL,
  `Facilities` varchar(50) NOT NULL,
  `Scheduled_Classes` varchar(50) NOT NULL,
  PRIMARY KEY (`Location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Gym_Membership_Card`
--

DROP TABLE IF EXISTS `Gym_Membership_Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gym_Membership_Card` (
  `Id_Number` int unsigned NOT NULL,
  `Expiration_Date` date NOT NULL,
  `Location_Access` varchar(50) NOT NULL,
  `Facility_Access` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manager` (
  `Manager_Id` int unsigned NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Branch_Location` varchar(50) NOT NULL,
  KEY `Manager_Id` (`Manager_Id`),
  KEY `Branch_Location` (`Branch_Location`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Manager_Id`) REFERENCES `Employee` (`Employee_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`Branch_Location`) REFERENCES `Employee` (`Branch_Location`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Trainer`
--

DROP TABLE IF EXISTS `Trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trainer` (
  `Trainer_Id` int unsigned NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Branch_Location` varchar(50) NOT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `Number_Of_Clients` int unsigned NOT NULL,
  `Health` varchar(50) DEFAULT NULL,
  `Meal` varchar(50) DEFAULT NULL,
  UNIQUE KEY `Health` (`Health`),
  UNIQUE KEY `Meal` (`Meal`),
  KEY `Trainer_Id` (`Trainer_Id`),
  KEY `Branch_Location` (`Branch_Location`),
  CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`Trainer_Id`) REFERENCES `Employee` (`Employee_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trainer_ibfk_2` FOREIGN KEY (`Branch_Location`) REFERENCES `Employee` (`Branch_Location`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Card_Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Transaction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 21:36:30
