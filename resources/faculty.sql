-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: facultyRegistration
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.23.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `UK_c0r9atamxvbhjjvy5j8da1kam` (`email`),
  UNIQUE KEY `UK_n08uhnpx5pkg855cmiib4vcd5` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin@iiitb.ac.in','$2b$12$FbsMQMZrQAdhfJ4ibL5TiuUBJ2TZkGjhsDtcIpecpFEgRfHvlJZiO');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_schedule`
--

DROP TABLE IF EXISTS `course_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule` (
  `course_schedule_id` int NOT NULL AUTO_INCREMENT,
  `course_time` varchar(255) NOT NULL,
  `course_day` varchar(255) NOT NULL,
  `room` varchar(255) NOT NULL,
  `building` varchar(255) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`course_schedule_id`),
  KEY `fk_courseschedule_courses` (`course_id`),
  CONSTRAINT `fk_courseschedule_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_schedule`
--

LOCK TABLES `course_schedule` WRITE;
/*!40000 ALTER TABLE `course_schedule` DISABLE KEYS */;
INSERT INTO `course_schedule` VALUES (1,'09:30:00','Monday','R103','Ramanujan',1),(2,'11:15:00','Monday','R103','Ramanujan',1),(3,'16:00:00','Monday','R105','Ramanujan',1),(4,'09:30:00','Tuesday','R203','Ramanujan',2),(5,'11:15:00','Tuesday','R203','Ramanujan',2),(6,'09:30:00','Wednesday','R103','Ramanujan',3),(7,'11:15:00','Wednesday','R103','Ramanujan',3),(8,'14:00:00','Wednesday','R103','Ramanujan',4),(9,'09:30:00','Thursday','R103','Ramanujan',4),(10,'11:15:00','Thursday','R103','Ramanujan',4),(11,'14:00:00','Thursday','R103','Ramanujan',5),(12,'09:30:00','Friday','R103','Ramanujan',5),(13,'09:30:00','Saturday','R103','Ramanujan',5),(14,'09:30:00','Monday','R203','Ramanujan',5);
/*!40000 ALTER TABLE `course_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_description` varchar(255) DEFAULT NULL,
  `course_year` int NOT NULL,
  `course_credits` int NOT NULL,
  `course_term` int NOT NULL,
  `course_capacity` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`),
  KEY `fk_courses_employee` (`employee_id`),
  CONSTRAINT `fk_courses_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'CS-511','Algorithms','Algo Genious',2024,4,1,150,NULL),(2,'CS-512','Concrete Mathematics','Concrete Marvelous',2024,4,1,150,NULL),(3,'CS-513','Software Systems','Software System Fantastic',2024,4,1,150,NULL),(4,'AI-511','Machine Learning','Machine learning Mind Blowing',2024,4,1,150,NULL),(5,'AI-512','Mathematics for Machine Learning','MML Extraordinary',2024,4,1,150,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Admission',50),(2,'Faculty',100),(3,'Placement',10);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `photo_path` varchar(255) NOT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_employees_department` (`dept_id`),
  CONSTRAINT `fk_employees_department` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (61,'hlgsagar.1@gmail.com','$2a$10$EST3uFtWO2qhMxGKchnB/.A1qukqcEV2EjmmpUH4za7sSsGxcV2Qu','GANGASAGAR','HL','hjgsad','61.txt',2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 15:15:30
