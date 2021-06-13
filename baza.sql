-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: io
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `io`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `io` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `io`;

--
-- Table structure for table `badanie`
--

DROP TABLE IF EXISTS `badanie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badanie` (
  `Badanie_ID` int NOT NULL,
  `Pacjent_ID` int DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `CzasTrwania` float DEFAULT NULL,
  `Koszt` float DEFAULT NULL,
  `Diagnoza` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Badanie_ID`),
  KEY `Pacjent_ID` (`Pacjent_ID`),
  CONSTRAINT `badanie_ibfk_1` FOREIGN KEY (`Pacjent_ID`) REFERENCES `pacjent` (`Pacjent_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badanie`
--

LOCK TABLES `badanie` WRITE;
/*!40000 ALTER TABLE `badanie` DISABLE KEYS */;
/*!40000 ALTER TABLE `badanie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badanie_proteza`
--

DROP TABLE IF EXISTS `badanie_proteza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badanie_proteza` (
  `Badanie_ID` int DEFAULT NULL,
  `Proteza_ID` int DEFAULT NULL,
  KEY `Badanie_ID` (`Badanie_ID`),
  KEY `Proteza_ID` (`Proteza_ID`),
  CONSTRAINT `badanie_proteza_ibfk_1` FOREIGN KEY (`Badanie_ID`) REFERENCES `badanie` (`Badanie_ID`),
  CONSTRAINT `badanie_proteza_ibfk_2` FOREIGN KEY (`Proteza_ID`) REFERENCES `proteza` (`Proteza_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badanie_proteza`
--

LOCK TABLES `badanie_proteza` WRITE;
/*!40000 ALTER TABLE `badanie_proteza` DISABLE KEYS */;
/*!40000 ALTER TABLE `badanie_proteza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `Material_ID` int NOT NULL,
  `Nazwa` varchar(100) DEFAULT NULL,
  `Ilosc` float DEFAULT NULL,
  PRIMARY KEY (`Material_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naprawa`
--

DROP TABLE IF EXISTS `naprawa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `naprawa` (
  `Zabieg_ID` int NOT NULL,
  `Pacjent_ID` int DEFAULT NULL,
  `TypNaprawy_ID` int DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `CzasTrwania` float DEFAULT NULL,
  `Koszt` float DEFAULT NULL,
  PRIMARY KEY (`Zabieg_ID`),
  KEY `Pacjent_ID` (`Pacjent_ID`),
  CONSTRAINT `naprawa_ibfk_1` FOREIGN KEY (`Pacjent_ID`) REFERENCES `pacjent` (`Pacjent_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naprawa`
--

LOCK TABLES `naprawa` WRITE;
/*!40000 ALTER TABLE `naprawa` DISABLE KEYS */;
INSERT INTO `naprawa` VALUES (1,2,1,'2055-01-01',1,120),(4,1,1,'2022-10-08',2,250),(5,1,2,'2030-04-05',15,1800),(6,2,1,'2022-12-21',66,7920),(7,1,2,'2044-07-07',77,9240),(8,2,1,'2012-02-02',10,1200);
/*!40000 ALTER TABLE `naprawa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacjent`
--

DROP TABLE IF EXISTS `pacjent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacjent` (
  `Pacjent_ID` int NOT NULL,
  `Nazwisko` varchar(100) DEFAULT NULL,
  `Imie` varchar(100) DEFAULT NULL,
  `Miasto` varchar(100) DEFAULT NULL,
  `KodPocztowy` varchar(100) DEFAULT NULL,
  `Adres` varchar(100) DEFAULT NULL,
  `Numer_telefonu` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Pacjent_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacjent`
--

LOCK TABLES `pacjent` WRITE;
/*!40000 ALTER TABLE `pacjent` DISABLE KEYS */;
INSERT INTO `pacjent` VALUES (1,'Kowalski','Jan','Szczecin','23-233','Słoczenecz 15',233232323,'JD@gmail.com'),(2,'Nowak','Pawel','Szczecin','13-233','Słoczenecz 15',733532323,'AAA@gmail.com');
/*!40000 ALTER TABLE `pacjent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proteza`
--

DROP TABLE IF EXISTS `proteza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proteza` (
  `Proteza_ID` int NOT NULL,
  `Nazwa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Proteza_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proteza`
--

LOCK TABLES `proteza` WRITE;
/*!40000 ALTER TABLE `proteza` DISABLE KEYS */;
/*!40000 ALTER TABLE `proteza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proteza_materialy`
--

DROP TABLE IF EXISTS `proteza_materialy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proteza_materialy` (
  `Proteza_ID` int DEFAULT NULL,
  `Material_ID` int DEFAULT NULL,
  KEY `Proteza_ID` (`Proteza_ID`),
  KEY `Material_ID` (`Material_ID`),
  CONSTRAINT `proteza_materialy_ibfk_1` FOREIGN KEY (`Proteza_ID`) REFERENCES `proteza` (`Proteza_ID`),
  CONSTRAINT `proteza_materialy_ibfk_2` FOREIGN KEY (`Material_ID`) REFERENCES `material` (`Material_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proteza_materialy`
--

LOCK TABLES `proteza_materialy` WRITE;
/*!40000 ALTER TABLE `proteza_materialy` DISABLE KEYS */;
/*!40000 ALTER TABLE `proteza_materialy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typnaprawy`
--

DROP TABLE IF EXISTS `typnaprawy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typnaprawy` (
  `TypNaprawy_ID` int NOT NULL,
  `Nazwa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TypNaprawy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typnaprawy`
--

LOCK TABLES `typnaprawy` WRITE;
/*!40000 ALTER TABLE `typnaprawy` DISABLE KEYS */;
INSERT INTO `typnaprawy` VALUES (1,'Rekonstrukcja'),(2,'XDDDDDDDDDDDDD');
/*!40000 ALTER TABLE `typnaprawy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkowniksystemu`
--

DROP TABLE IF EXISTS `uzytkowniksystemu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uzytkowniksystemu` (
  `ID_uzytkownika` int NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(100) DEFAULT NULL,
  `Haslo` varchar(100) DEFAULT NULL,
  `Rola` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_uzytkownika`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkowniksystemu`
--

LOCK TABLES `uzytkowniksystemu` WRITE;
/*!40000 ALTER TABLE `uzytkowniksystemu` DISABLE KEYS */;
INSERT INTO `uzytkowniksystemu` VALUES (1,'Szef','szef123','Szef'),(2,'Kikimora','kikiriki','Pracownik'),(3,'Bambo','bambo123','Ksiegowy');
/*!40000 ALTER TABLE `uzytkowniksystemu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wizyta`
--

DROP TABLE IF EXISTS `wizyta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wizyta` (
  `Wizyta_ID` int NOT NULL,
  `Pacjent_ID` int DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `CzasTrwania` float DEFAULT NULL,
  PRIMARY KEY (`Wizyta_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wizyta`
--

LOCK TABLES `wizyta` WRITE;
/*!40000 ALTER TABLE `wizyta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wizyta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-14  0:55:43
