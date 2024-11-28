
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

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`admin_id`, `email`, `password`) VALUES (1,'admin@iiitb.ac.in','$2b$12$FbsMQMZrQAdhfJ4ibL5TiuUBJ2TZkGjhsDtcIpecpFEgRfHvlJZiO');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `course_schedule` WRITE;
/*!40000 ALTER TABLE `course_schedule` DISABLE KEYS */;
INSERT INTO `course_schedule` (`course_schedule_id`, `course_time`, `course_day`, `room`, `building`, `course_id`) VALUES (1,'09:30:00','Monday','R103','Ramanujan',1),(2,'11:15:00','Monday','R103','Ramanujan',1),(3,'16:00:00','Monday','R105','Ramanujan',1),(4,'09:30:00','Tuesday','R203','Ramanujan',2),(5,'11:15:00','Tuesday','R203','Ramanujan',2),(6,'09:30:00','Wednesday','R103','Ramanujan',3),(7,'11:15:00','Wednesday','R103','Ramanujan',3),(8,'14:00:00','Wednesday','R103','Ramanujan',4),(9,'09:30:00','Thursday','R103','Ramanujan',4),(10,'11:15:00','Thursday','R103','Ramanujan',4),(11,'14:00:00','Thursday','R103','Ramanujan',5),(12,'09:30:00','Friday','R103','Ramanujan',5),(13,'09:30:00','Saturday','R103','Ramanujan',5),(14,'09:30:00','Monday','R203','Ramanujan',5);
/*!40000 ALTER TABLE `course_schedule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`course_id`, `course_code`, `course_name`, `course_description`, `course_year`, `course_credits`, `course_term`, `course_capacity`, `employee_id`) VALUES (1,'CS-511','Algorithms','Algo Genious',2024,4,1,150,71),(2,'CS-512','Concrete Mathematics','Concrete Marvelous',2024,4,1,150,NULL),(3,'CS-513','Software Systems','Software System Fantastic',2024,4,1,150,NULL),(4,'AI-511','Machine Learning','Machine learning Mind Blowing',2024,4,1,150,NULL),(5,'AI-512','Mathematics for Machine Learning','MML Extraordinary',2024,4,1,150,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`dept_id`, `dept_name`, `capacity`) VALUES (1,'Admission',50),(2,'Faculty',100),(3,'Placement',10);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`employee_id`, `email`, `password`, `first_name`, `last_name`, `title`, `photo_path`, `dept_id`) VALUES (71,'hlgsagar.1@gmail.com','$2a$10$YtxEeEihgQ2e9Y7Snvuh7utX9sckuXz2gXLNO6ign0.lCUGR5WoMW','GANGASAGAR','HL','sdass','71.txt',2);
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

