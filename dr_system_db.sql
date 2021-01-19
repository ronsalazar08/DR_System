-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: dr_system_db
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'accounting'),(3,'battery cable'),(2,'foiling'),(1,'komax');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,25),(3,1,26),(4,1,27),(5,1,28),(6,1,29),(7,1,30),(8,1,31),(1,1,32);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add dr_form',7,'add_dr_form'),(26,'Can change dr_form',7,'change_dr_form'),(27,'Can delete dr_form',7,'delete_dr_form'),(28,'Can view dr_form',7,'view_dr_form'),(29,'Can add dr_item',8,'add_dr_item'),(30,'Can change dr_item',8,'change_dr_item'),(31,'Can delete dr_item',8,'delete_dr_item'),(32,'Can view dr_item',8,'view_dr_item'),(33,'Can add dr_item',9,'add_dr_item'),(34,'Can change dr_item',9,'change_dr_item'),(35,'Can delete dr_item',9,'delete_dr_item'),(36,'Can view dr_item',9,'view_dr_item'),(37,'Can add dr_form',10,'add_dr_form'),(38,'Can change dr_form',10,'change_dr_form'),(39,'Can delete dr_form',10,'delete_dr_form'),(40,'Can view dr_form',10,'view_dr_form');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$bgJKdfrPEaPS$PC98HSYeS4xiOUKZYCfLUJZPiNSjzrul7ceFEQt2AI8=','2021-01-19 09:08:45.956534',1,'admin','Administrator','','',1,1,'2021-01-06 05:45:26.000000'),(3,'pbkdf2_sha256$216000$qtjhQRsVn0TQ$C7V/XZfuMs5GpbYYrToza6zaZl4ztfy4gNNNt2vYrf0=','2021-01-19 09:08:02.206100',0,'komaxa','Komax A','','',0,1,'2021-01-15 05:05:44.000000'),(4,'pbkdf2_sha256$216000$2P1y3FLP9jwr$ctmL5jbvljI9bGpr3xBp9/wFqWcbl5z0vvnRr7tiX5Y=','2021-01-19 06:56:33.427640',0,'komaxb','Komax B','','',0,1,'2021-01-15 05:06:10.000000'),(5,'pbkdf2_sha256$216000$22sst8YjSS8G$ZCuoak4nraIWWCwve/B1Xq4c+dIQXGLG3u5o6GoiZzs=','2021-01-18 06:42:12.000000',0,'acct','Accounting','','',0,1,'2021-01-18 06:03:29.000000'),(6,'pbkdf2_sha256$216000$Hz6rlmV8vMBC$57v33ikSOsrcU86w4hnQp8PCI3TJhvQTevcmYuJpalg=','2021-01-19 06:49:36.854609',0,'foilinga','Foiling A','','',0,1,'2021-01-19 06:04:39.000000'),(7,'pbkdf2_sha256$216000$VOPYYXq7B9FI$VR+Vfh+8JapdMYx97ARaEkst9fClMfttDzgQnFHRUt4=',NULL,0,'foilingb','Foiling B','','',0,1,'2021-01-19 06:04:56.000000'),(8,'pbkdf2_sha256$216000$KRxy2ZKrxE8G$dv6gSuU+4lZI1dPtHFz2ZWIU2XKSdnmtpB0yxoyYaz8=',NULL,0,'bcablea','B-Cable A','','',0,1,'2021-01-19 06:05:29.000000'),(9,'pbkdf2_sha256$216000$OkvPml3cxzbs$xyPwSYo8uBXIa9G+ahr5crN5M+npF3FkkLWjWRzMqx8=',NULL,0,'bcableb','B-Cable B','','',0,1,'2021-01-19 06:05:54.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (4,1,1),(5,1,2),(6,1,3),(7,1,4),(2,3,1),(3,4,1),(8,5,4),(11,6,2),(10,7,2),(9,8,3),(12,9,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-01-06 05:48:56.535505','1','123456',1,'[{\"added\": {}}]',7,1),(2,'2021-01-06 05:49:32.343976','1','111111',1,'[{\"added\": {}}]',8,1),(3,'2021-01-06 05:52:19.002305','2','654321',1,'[{\"added\": {}}]',7,1),(4,'2021-01-06 05:52:38.099315','1','111111',2,'[{\"changed\": {\"fields\": [\"Control noFK\"]}}]',8,1),(5,'2021-01-07 02:37:55.376191','1','komax',1,'[{\"added\": {}}]',3,1),(6,'2021-01-07 02:37:59.646331','2','foiling',1,'[{\"added\": {}}]',3,1),(7,'2021-01-07 02:38:06.785120','3','battery_cable',1,'[{\"added\": {}}]',3,1),(8,'2021-01-07 02:38:11.804648','4','accounting',1,'[{\"added\": {}}]',3,1),(9,'2021-01-07 02:40:14.474044','2','shifta',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(10,'2021-01-07 02:50:06.369128','2','shifta',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(11,'2021-01-07 03:28:32.163695','1','komax',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(12,'2021-01-07 03:34:47.573972','2','shifta',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(13,'2021-01-07 07:55:27.163721','2','654321',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(14,'2021-01-07 08:03:16.580569','2','654321',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(15,'2021-01-07 08:03:30.127940','1','123456',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(16,'2021-01-07 08:06:41.114962','2','654321',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(17,'2021-01-11 03:28:25.269184','70','999999',3,'',7,1),(18,'2021-01-11 03:35:05.142469','71','1111111',3,'',7,1),(19,'2021-01-11 03:43:22.124397','1','123456',3,'',7,1),(20,'2021-01-11 03:43:44.670836','64','124687',3,'',7,1),(21,'2021-01-11 03:44:58.721290','66','171717',3,'',7,1),(22,'2021-01-14 05:01:51.985987','2','p12345',1,'[{\"added\": {}}]',8,1),(23,'2021-01-14 05:10:07.318052','3','p23456',1,'[{\"added\": {}}]',8,1),(24,'2021-01-14 05:11:22.383642','4','p3456',1,'[{\"added\": {}}]',8,1),(25,'2021-01-14 05:12:46.482564','5','p4',1,'[{\"added\": {}}]',8,1),(26,'2021-01-14 05:13:01.583891','6','p5',1,'[{\"added\": {}}]',8,1),(27,'2021-01-14 05:13:26.002115','7','p6',1,'[{\"added\": {}}]',8,1),(28,'2021-01-14 05:13:50.029067','8','p7',1,'[{\"added\": {}}]',8,1),(29,'2021-01-14 05:14:04.475259','9','p8',1,'[{\"added\": {}}]',8,1),(30,'2021-01-14 05:14:17.648776','10','p9',1,'[{\"added\": {}}]',8,1),(31,'2021-01-14 05:14:31.886628','11','p10',1,'[{\"added\": {}}]',8,1),(32,'2021-01-14 05:21:28.274088','2','84675829',2,'[{\"changed\": {\"fields\": [\"Product no\", \"Wos no\"]}}]',8,1),(33,'2021-01-14 05:21:56.593614','3','84675829',2,'[{\"changed\": {\"fields\": [\"Product no\", \"Wos no\"]}}]',8,1),(34,'2021-01-14 05:22:21.612464','2','846758290',2,'[{\"changed\": {\"fields\": [\"Product no\"]}}]',8,1),(35,'2021-01-14 09:36:39.571729','11','p10',3,'',8,1),(36,'2021-01-14 09:55:38.867892','14','2',3,'',8,1),(37,'2021-01-14 09:55:38.880327','13','1',3,'',8,1),(38,'2021-01-14 09:55:38.886228','12','111',3,'',8,1),(39,'2021-01-14 09:57:57.960870','15','1',3,'',8,1),(40,'2021-01-15 03:14:48.242689','16','10',3,'',8,1),(41,'2021-01-15 03:14:48.259177','10','p9',3,'',8,1),(42,'2021-01-15 03:14:48.267107','9','p8',3,'',8,1),(43,'2021-01-15 05:03:23.266007','2','komaxa',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\"]}}]',4,1),(44,'2021-01-15 05:05:11.437866','2','komaxa',3,'',4,1),(45,'2021-01-15 05:06:31.600109','3','komaxa',2,'[{\"changed\": {\"fields\": [\"Username\", \"Groups\"]}}]',4,1),(46,'2021-01-15 05:06:48.105004','4','komaxb',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\", \"Groups\"]}}]',4,1),(47,'2021-01-15 05:06:53.990521','3','komaxa',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(48,'2021-01-15 05:08:20.663980','3','komaxa',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(49,'2021-01-15 05:08:31.652978','4','komaxb',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(50,'2021-01-15 05:08:42.061801','1','admin',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(51,'2021-01-18 02:27:32.290517','3','komaxa',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(52,'2021-01-18 02:32:03.179866','3','komaxa',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(53,'2021-01-18 05:27:10.673664','1','admin',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(54,'2021-01-18 06:04:12.442079','5','acct',2,'[{\"changed\": {\"fields\": [\"Username\", \"Groups\"]}}]',4,1),(55,'2021-01-18 06:04:20.537770','5','acct',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(56,'2021-01-18 06:06:57.799657','5','acct',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(57,'2021-01-18 09:00:00.421796','109','101011',2,'[{\"changed\": {\"fields\": [\"Customer\"]}}]',7,1),(58,'2021-01-18 10:14:35.317946','112','121212',3,'',7,1),(59,'2021-01-18 10:14:35.333252','110','131313',3,'',7,1),(60,'2021-01-18 10:14:35.338599','109','101011',3,'',7,1),(61,'2021-01-18 10:14:35.346038','108','777777',3,'',7,1),(62,'2021-01-18 10:14:35.355153','106','666666',3,'',7,1),(63,'2021-01-18 10:14:35.360672','101','123456',3,'',7,1),(64,'2021-01-18 10:14:35.366422','93','333333',3,'',7,1),(65,'2021-01-18 10:14:35.371967','92','222222',3,'',7,1),(66,'2021-01-18 10:22:20.976331','3135','157052',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(67,'2021-01-19 05:29:45.928161','3','battery cable',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(68,'2021-01-19 06:06:38.195191','8','bcablea',2,'[{\"changed\": {\"fields\": [\"First name\", \"Groups\"]}}]',4,1),(69,'2021-01-19 06:06:49.319731','9','bcableb',2,'[{\"changed\": {\"fields\": [\"First name\", \"Staff status\", \"Superuser status\"]}}]',4,1),(70,'2021-01-19 06:06:56.275535','8','bcablea',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(71,'2021-01-19 06:07:06.613334','6','foilinga',2,'[{\"changed\": {\"fields\": [\"First name\", \"Staff status\", \"Superuser status\"]}}]',4,1),(72,'2021-01-19 06:07:21.663754','7','foilingb',2,'[{\"changed\": {\"fields\": [\"First name\", \"Staff status\", \"Superuser status\", \"Groups\"]}}]',4,1),(73,'2021-01-19 06:07:28.493339','6','foilinga',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(74,'2021-01-19 06:07:33.549250','9','bcableb',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(75,'2021-01-19 06:07:38.649708','8','bcablea',2,'[]',4,1),(76,'2021-01-19 06:07:42.818617','9','bcableb',2,'[]',4,1),(77,'2021-01-19 06:07:48.063236','5','acct',2,'[]',4,1),(78,'2021-01-19 06:53:28.509427','1','1',3,'',10,1),(79,'2021-01-19 06:57:15.556699','16168','999999',3,'',7,1),(80,'2021-01-19 06:58:31.337266','16167','777777',3,'',7,1),(81,'2021-01-19 07:11:42.986793','2','123456',3,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'foiling','dr_form'),(9,'foiling','dr_item'),(7,'komax','dr_form'),(8,'komax','dr_item'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-01-06 05:43:48.990085'),(2,'auth','0001_initial','2021-01-06 05:43:49.633387'),(3,'admin','0001_initial','2021-01-06 05:43:51.098846'),(4,'admin','0002_logentry_remove_auto_add','2021-01-06 05:43:51.342953'),(5,'admin','0003_logentry_add_action_flag_choices','2021-01-06 05:43:51.416574'),(6,'contenttypes','0002_remove_content_type_name','2021-01-06 05:43:51.626059'),(7,'auth','0002_alter_permission_name_max_length','2021-01-06 05:43:51.752750'),(8,'auth','0003_alter_user_email_max_length','2021-01-06 05:43:51.790181'),(9,'auth','0004_alter_user_username_opts','2021-01-06 05:43:51.821555'),(10,'auth','0005_alter_user_last_login_null','2021-01-06 05:43:51.926938'),(11,'auth','0006_require_contenttypes_0002','2021-01-06 05:43:51.939044'),(12,'auth','0007_alter_validators_add_error_messages','2021-01-06 05:43:51.975638'),(13,'auth','0008_alter_user_username_max_length','2021-01-06 05:43:52.112177'),(14,'auth','0009_alter_user_last_name_max_length','2021-01-06 05:43:52.247927'),(15,'auth','0010_alter_group_name_max_length','2021-01-06 05:43:52.291579'),(16,'auth','0011_update_proxy_permissions','2021-01-06 05:43:52.326772'),(17,'auth','0012_alter_user_first_name_max_length','2021-01-06 05:43:52.494965'),(18,'komax','0001_initial','2021-01-06 05:43:52.625609'),(19,'sessions','0001_initial','2021-01-06 05:43:52.820737'),(20,'komax','0002_auto_20210106_1348','2021-01-06 05:48:34.166992'),(21,'komax','0003_auto_20210107_1601','2021-01-07 08:01:27.960026'),(22,'foiling','0001_initial','2021-01-19 06:16:09.139287');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0uphofkbt7v9kit6i0cf0rvtvb1d7js5','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1kzzLk:DXm2VKgkzWBXowqGtejuooXeDNPNnCJsDcTI32dFftE','2021-01-28 09:55:28.159422'),('1vev44wl5o6zvvatz6s71fzc9saqe145','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxv37:NSAMdnbCyieIwd521sndN2i5rfM0wiPCZGMQ_0U5f3c','2021-01-22 16:55:41.852068'),('2z2ggjlvpa9o6x28ikaxwc3b9erv9fn4','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kynTq:iwbITzz1sjLLKNpRwNfdcMlGUYHp3fZWUVdk95tMp0c','2021-01-25 03:02:54.936477'),('3dtxxykmj9u8csu5jgqrqbfawv1axrl6','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1kx1dY:BAooyr3qAkdGtgn8WXmyPAbAiPHqP_l-4Y164XDmdmU','2021-01-20 05:45:36.078660'),('4gi5unm7qmjocc1omudzghsdfd0ipvub','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxQcg:VNVPfOihfJlbuIMnwbKd_VPobwLtfhZwnYD6c5LRs8g','2021-01-21 08:26:22.391020'),('4i1565pc1hccmqncksxo8n8blc47m95a','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kzz8G:lcBDaDm4b7RFbei9XtE7r-3n9D70mNc_3qgvFWxAjAw','2021-01-28 09:41:32.905098'),('59pnfv4xiiv9992v12vchoze5qgv9ww0','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxwCk:GPLop4yNICk97biHrRDb1Y7xbCDXZ3AOqrvwWU5LOew','2021-01-22 18:09:42.877250'),('9m94nup9mad2huz16uc9oc2lcy2utd9f','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1kyqmR:4DDX8yBnc2-6Vco6Y97Z_06oypsL5u6QfWP8PK7TbhQ','2021-01-25 06:34:19.126033'),('9ohs5n1gmky4agdjc7tsyclub2d7nxao','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kynRM:jHpIHbVoGkpYUu4G31unxBJJEkwejrSRgfbvQXfD2lU','2021-01-25 03:00:20.686955'),('a72cbtw7sm4j497ghlhyk6sjrjwyv7wa','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxlQh:VSRjOmYoVFcPeaW384GdaXbFxiop_rJNW5Orfyv1KIQ','2021-01-22 06:39:23.537321'),('apndv54zyrbmfpmng6tqmory7mhli6eu','.eJxVjMsOwiAQRf-FtSE8ioBL9_2GZoYZpGogKe3K-O_apAvd3nPOfYkJtrVMW-dlmklchBWn3w0hPbjugO5Qb02mVtdlRrkr8qBdjo34eT3cv4MCvXxrSIyKDCIFj0m5gDFZcDZarXJUDkkPAJwp6BQdgWel9TnrDIMyPhvx_gARLjim:1l0JtR:fzTMvXd2O-VGnu8uCV-aEeidMPOFAVGxcOd2b__52_M','2021-01-29 07:51:37.967092'),('bx8xr0tiwnlizlv0se3s562jyawa1yvu','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kzsqe:6lDy_CzapVvWS4sxphk9U9sV_tuNeqh6cSWp3Gxc1KU','2021-01-28 02:58:56.054294'),('g6oz0ocbbj481h7g4ysddqqx2wlcg4er','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1kzusT:P4FxTJTfMMYEbRW3eTgKjR3SSyRIxINWIEhOQkDQ850','2021-01-28 05:08:57.888862'),('h2if1797vc5oob67fts09q5z5arf330x','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxipy:ip_BYPeMPm1Od8sE7PzZMW4nycLizJVLkLwDVTv_6W8','2021-01-22 03:53:18.668140'),('i7cuy040frkkbsssyrrvct4m0wpg7a2l','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1l1Jnm:adfDVr0PEpJmfFHav2t-9fy2hbHbr_HbKgZTNqM9Ft8','2021-02-01 01:57:54.033041'),('igmwg3ql4wz8q7e9zkrt18c1o3xr1qz3','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1l1n0H:kygTgcR3eBYjzh7EyR0XrFQHeaRfGYi4X5z8aKybrfY','2021-02-02 09:08:45.969181'),('jk3ut9asfs4384j7ffaxu3ntdj6oq60k','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1kynsD:LSCBC-cJQTaZkv7KfEL69bZHggzuZt5pC4WrbgpCBPk','2021-01-25 03:28:05.029222'),('ktqncivg8b9qsgd3oqq1gjsbxzcoe0sn','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1kywrj:wBphuogJSCu_rzpfHlRsybkmFcfV1QUpmOo__hCj0XY','2021-01-25 13:04:11.752621'),('lbgzwl6i5b1efp7gr4ko8psisgwdefit','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxOgN:p_1I526Z_G0LRBN6Ay-sbv_tmfOvl3VhKT1tZ6TaX1U','2021-01-21 06:22:03.836668'),('pil34igp4dbwfoijeor46sl4xrtlbxn5','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kyw5Z:9vuTsj4gHfVmlpcASA-QedtrN4UznMOHVLMDkYMqzfs','2021-01-25 12:14:25.456106'),('qaw4wqjdro2zigeqefd2w5x4rvzdf301','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1l0FKM:tGGQ5HLnTbCdiflgYoIdclL0GLMowL-vaIksvhB02xY','2021-01-29 02:59:06.165188'),('relf2ti8fb1rql735nbs5nde8k86wgsj','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxQbx:SevKURHHsqYuUXlIw_nzP5IJ_1hCmBJKpCOO-adNBQc','2021-01-21 08:25:37.899894'),('tm76baaep6v1rc9cdj30847x03p97ne8','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxus7:6R9k5SkCMZzk8xnQ6wWARvnpMhhNh1cL37UJzMXqfh4','2021-01-22 16:44:19.490379'),('ttm4j10rltft89er3ifs7ip7e1my09dj','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1l1kyN:jsGLeoxvpGBwdrMt-hKzczKCu9klX9x2G0Pg6UbGvRQ','2021-02-02 06:58:39.859393'),('veuok3lsjelbikxseuhk63n2x7p1ob9p','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1l1ksu:k1S0e41m6PfA-GiMz4Y_ZDIwdlNlZQDdLFjTMqMgXKk','2021-02-02 06:53:00.068251'),('vf8dulbdnfmxhzvy4x9fvoyyastxd9i6','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxsrj:-ebG5VpSmux7PpkNXNKKZDVgfIr2RX16cPV-sYl98lE','2021-01-22 14:35:47.368031'),('x0pp9n3fsi40yberds8651kyyi9ydgq4','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxsIl:wdkR3LtubvWRRO93RZfPCF6YcP0X0yiazRZHgKgY2ag','2021-01-22 13:59:39.200676'),('xkprtan03f7hw3tk3duhhop4x8ku9gjx','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxsmr:6Oqc6qFnYB1C8dA-0cQtc1L62iyFVfX-VFAbR_Wz6mw','2021-01-22 14:30:45.538149'),('xkr7ebfj0qsw75yamluuj5m51kg8z7qp','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kxTzD:RxNoUTF7dbdxrKBIxSVXYZS5EVO0YmXtgCLnDGDd8kk','2021-01-21 12:01:51.867498'),('znuflovzm2e9hflcbunq5gnh1eskl6o6','.eJxVjDsOwjAQBe_iGllsHP8o6XMGy7tr4wCypTipEHeHSCmgfTPzXiLEbS1h62kJM4uLAHH63TDSI9Ud8D3WW5PU6rrMKHdFHrTLqXF6Xg_376DEXr51MpYVGiZ2NicPgJHVmEkNhN5ZMj47rZXSfhgJGDUwn33yJmaAjFa8PwFNOHg:1l0HLD:FxdnASmy2NEh23GkFkwBQULdwH08haFrZuVWgyqqdao','2021-01-29 05:08:07.042279'),('zt8ors6r9om7adaojx1wvxykhvl05r1b','.eJxVjEEOwiAQRe_C2pDOQKXj0n3PQAYGpGpoUtqV8e7apAvd_vfefynP21r81tLiJ1EXher0uwWOj1R3IHeut1nHua7LFPSu6IM2Pc6SntfD_Tso3Mq3NgTJ5Ug9WCB2iMZkFyUHQA4YKXcAEmSgPiFkIGNsR3SOFGxyBgf1_gDWXjdM:1kzuog:xBUF-ZgwPHPcqhJZGhBEfYUt8BsZ37FL4vlMXA-FSlI','2021-01-28 05:05:02.398206');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foiling_dr_form`
--

DROP TABLE IF EXISTS `foiling_dr_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foiling_dr_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` date NOT NULL,
  `control_no` int(11) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `line` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `control_no` (`control_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foiling_dr_form`
--

LOCK TABLES `foiling_dr_form` WRITE;
/*!40000 ALTER TABLE `foiling_dr_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `foiling_dr_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foiling_dr_item`
--

DROP TABLE IF EXISTS `foiling_dr_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foiling_dr_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL,
  `wos_no` varchar(50) NOT NULL,
  `first_quantity` int(11) NOT NULL,
  `second_quantity` int(11) NOT NULL,
  `third_quantity` int(11) NOT NULL,
  `fourth_quantity` int(11) NOT NULL,
  `fifth_quantity` int(11) NOT NULL,
  `control_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foiling_dr_item_control_no_968c6998_fk_foiling_d` (`control_no`),
  CONSTRAINT `foiling_dr_item_control_no_968c6998_fk_foiling_d` FOREIGN KEY (`control_no`) REFERENCES `foiling_dr_form` (`control_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foiling_dr_item`
--

LOCK TABLES `foiling_dr_item` WRITE;
/*!40000 ALTER TABLE `foiling_dr_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `foiling_dr_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komax_dr_form`
--

DROP TABLE IF EXISTS `komax_dr_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komax_dr_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` date NOT NULL,
  `control_no` int(11) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `line` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `control_no` (`control_no`)
) ENGINE=InnoDB AUTO_INCREMENT=16183 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komax_dr_form`
--

LOCK TABLES `komax_dr_form` WRITE;
/*!40000 ALTER TABLE `komax_dr_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `komax_dr_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komax_dr_item`
--

DROP TABLE IF EXISTS `komax_dr_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komax_dr_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL,
  `wos_no` varchar(50) NOT NULL,
  `first_quantity` int(11) NOT NULL,
  `second_quantity` int(11) NOT NULL,
  `third_quantity` int(11) NOT NULL,
  `fourth_quantity` int(11) NOT NULL,
  `fifth_quantity` int(11) NOT NULL,
  `control_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `komax_dr_item_control_no_94a9d2bf_fk_komax_dr_form_control_no` (`control_no`),
  CONSTRAINT `komax_dr_item_control_no_94a9d2bf_fk_komax_dr_form_control_no` FOREIGN KEY (`control_no`) REFERENCES `komax_dr_form` (`control_no`)
) ENGINE=InnoDB AUTO_INCREMENT=108277 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komax_dr_item`
--

LOCK TABLES `komax_dr_item` WRITE;
/*!40000 ALTER TABLE `komax_dr_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `komax_dr_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-19 17:14:53
