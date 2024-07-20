-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: qr_chats
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` int NOT NULL,
  `admin_uid` text,
  `type` int DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (0,NULL,0,'2024-04-29 17:10:01',NULL),(1,NULL,0,'2024-05-29 19:44:09',NULL),(2,NULL,0,'2024-05-29 19:44:09',NULL),(3,NULL,0,'2024-05-29 19:51:49',NULL),(4,NULL,0,'2024-05-29 19:52:20',NULL),(5,NULL,0,'2024-05-29 19:53:37',NULL),(6,NULL,0,'2024-05-29 20:22:33',NULL),(7,NULL,0,'2024-05-29 20:22:54',NULL),(8,NULL,0,'2024-05-29 20:51:28',NULL),(9,NULL,0,'2024-05-29 20:56:47',NULL),(10,NULL,0,'2024-05-29 20:58:39',NULL),(11,NULL,0,'2024-05-29 20:59:07',NULL),(12,NULL,0,'2024-05-29 20:59:29',NULL),(13,NULL,0,'2024-05-29 20:59:34',NULL),(14,NULL,0,'2024-05-29 20:59:52',NULL),(15,NULL,0,'2024-05-29 21:00:16',NULL),(16,NULL,0,'2024-05-29 21:00:32',NULL),(17,NULL,0,'2024-05-29 21:00:53',NULL),(18,NULL,0,'2024-05-29 21:01:12',NULL),(19,NULL,0,'2024-05-29 21:01:18',NULL),(20,NULL,0,'2024-05-29 21:01:18',NULL),(21,NULL,0,'2024-05-29 21:01:24',NULL),(22,NULL,0,'2024-05-29 21:03:13',NULL),(23,NULL,0,'2024-05-29 21:12:50',NULL),(24,NULL,0,'2024-05-29 21:13:26',NULL),(25,NULL,0,'2024-05-29 21:13:59',NULL),(26,NULL,0,'2024-05-29 21:14:18',NULL),(27,NULL,0,'2024-05-29 21:15:45',NULL),(28,NULL,0,'2024-05-29 21:16:01',NULL),(29,NULL,0,'2024-05-29 21:16:47',NULL),(30,NULL,0,'2024-05-29 21:57:54',NULL),(31,NULL,0,'2024-05-30 15:42:48',NULL),(32,NULL,0,'2024-05-30 15:44:35',NULL),(33,NULL,0,'2024-06-12 19:36:27',NULL),(34,NULL,0,'2024-07-08 23:41:12',NULL),(35,'null',1,'2024-07-09 00:06:41','мои кенты'),(36,'66350049881daa6b3018ded3',1,'2024-07-09 00:07:42','мои кенты'),(37,'66350049881daa6b3018ded3',1,'2024-07-09 00:08:03','мои кенты'),(38,'66350049881daa6b3018ded3',1,'2024-07-09 00:17:52','кенты'),(39,'66350049881daa6b3018ded3',1,'2024-07-09 00:18:53','кенты'),(40,'66350049881daa6b3018ded3',1,'2024-07-09 00:21:29','кенты'),(41,'66350049881daa6b3018ded3',1,'2024-07-09 00:21:53','кенты'),(42,'66350049881daa6b3018ded3',1,'2024-07-09 00:33:04','кенты'),(43,'66350049881daa6b3018ded3',1,'2024-07-09 00:33:04','кенты'),(44,'663a8d2875ec295bc9a6463e',1,'2024-07-09 00:58:27','пиво.  74'),(45,'66350049881daa6b3018ded3',1,'2024-07-09 01:34:51','kk'),(46,'66350049881daa6b3018ded3',1,'2024-07-09 01:41:50','gfd'),(47,'663a8d2875ec295bc9a6463e',1,'2024-07-09 07:22:47','группа тест'),(48,'66350049881daa6b3018ded3',1,'2024-07-16 09:44:54','пав'),(49,'66350049881daa6b3018ded3',1,'2024-07-16 09:45:00','пав'),(50,'66350049881daa6b3018ded3',1,'2024-07-16 09:48:01','fds'),(51,'66350049881daa6b3018ded3',1,'2024-07-16 09:49:40','hgf'),(52,'66350049881daa6b3018ded3',1,'2024-07-16 09:51:20','gfdsa'),(53,'66350049881daa6b3018ded3',1,'2024-07-16 09:52:09','fds'),(54,'66350049881daa6b3018ded3',1,'2024-07-16 09:53:09','fdew'),(55,'66350049881daa6b3018ded3',1,'2024-07-16 09:54:19','dsaz'),(56,'66350049881daa6b3018ded3',1,'2024-07-16 09:57:31','fds'),(57,'66350049881daa6b3018ded3',1,'2024-07-16 09:58:23','fds'),(58,'66350049881daa6b3018ded3',1,'2024-07-16 09:58:55','fds'),(59,'6644ab73d43ce8386de63a70',1,'2024-07-19 00:32:36','hgfd'),(60,'6644ab73d43ce8386de63a70',2,'2024-07-19 01:17:59','gfdsgf'),(61,'6644ab73d43ce8386de63a70',1,'2024-07-19 01:20:09','fd'),(62,'6695aca6e880c38a1f0a12df',1,'2024-07-19 11:38:16','сааа'),(63,NULL,0,'2024-07-19 11:38:24',NULL);
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-20 17:25:46