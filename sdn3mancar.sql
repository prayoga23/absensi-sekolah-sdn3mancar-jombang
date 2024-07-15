-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (x86_64)
--
-- Host: localhost    Database: db_absensi
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
-- Table structure for table `auth_activation_attempts`
--

DROP TABLE IF EXISTS `auth_activation_attempts`;

CREATE TABLE `auth_activation_attempts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_activation_attempts`
--

LOCK TABLES `auth_activation_attempts` WRITE;
/*!40000 ALTER TABLE `auth_activation_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_activation_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_groups`
--

DROP TABLE IF EXISTS `auth_groups`;

CREATE TABLE `auth_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_groups`
--

LOCK TABLES `auth_groups` WRITE;
/*!40000 ALTER TABLE `auth_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_groups_permissions`
--

DROP TABLE IF EXISTS `auth_groups_permissions`;
CREATE TABLE `auth_groups_permissions` (
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `permission_id` int unsigned NOT NULL DEFAULT '0',
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`),
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_groups_permissions`
--

LOCK TABLES `auth_groups_permissions` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `auth_groups_users`
--

DROP TABLE IF EXISTS `auth_groups_users`;

CREATE TABLE `auth_groups_users` (
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL DEFAULT '0',
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`),
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_groups_users`
--

LOCK TABLES `auth_groups_users` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `auth_logins`
--

DROP TABLE IF EXISTS `auth_logins`;

CREATE TABLE `auth_logins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_logins`
--

LOCK TABLES `auth_logins` WRITE;
/*!40000 ALTER TABLE `auth_logins` DISABLE KEYS */;
INSERT INTO `auth_logins` VALUES (1,'::1','erlywahyuningtyas@gmail.com',1,'2024-06-08 03:37:51',1),(2,'::1','erlywahyuningtyas@gmail.com',1,'2024-06-09 09:24:54',1),(3,'::1','erlywahyuningtyas@gmail.com',1,'2024-06-09 09:28:14',1);
/*!40000 ALTER TABLE `auth_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permissions`
--

DROP TABLE IF EXISTS `auth_permissions`;

CREATE TABLE `auth_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_permissions`
--

LOCK TABLES `auth_permissions` WRITE;
/*!40000 ALTER TABLE `auth_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_reset_attempts`
--

DROP TABLE IF EXISTS `auth_reset_attempts`;

CREATE TABLE `auth_reset_attempts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_reset_attempts`
--

LOCK TABLES `auth_reset_attempts` WRITE;
/*!40000 ALTER TABLE `auth_reset_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_reset_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_tokens`
--

DROP TABLE IF EXISTS `auth_tokens`;

CREATE TABLE `auth_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int unsigned NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`),
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_users_permissions`
--

DROP TABLE IF EXISTS `auth_users_permissions`;

CREATE TABLE `auth_users_permissions` (
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `permission_id` int unsigned NOT NULL DEFAULT '0',
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`),
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `auth_users_permissions`
--

LOCK TABLES `auth_users_permissions` WRITE;
/*!40000 ALTER TABLE `auth_users_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_users_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `batch` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2017-11-20-223112','Myth\\Auth\\Database\\Migrations\\CreateAuthTables','default','Myth\\Auth',1717792588,1),(2,'2023-08-18-000001','App\\Database\\Migrations\\CreateJurusanTable','default','App',1717792588,1),(3,'2023-08-18-000002','App\\Database\\Migrations\\CreateKelasTable','default','App',1717792588,1),(4,'2023-08-18-000003','App\\Database\\Migrations\\CreateDB','default','App',1717792589,1),(5,'2023-08-18-000004','App\\Database\\Migrations\\AddSuperadmin','default','App',1717792589,1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_guru`
--

DROP TABLE IF EXISTS `tb_guru`;

CREATE TABLE `tb_guru` (
  `id_guru` int NOT NULL AUTO_INCREMENT,
  `nuptk` varchar(24) NOT NULL,
  `nama_guru` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(32) NOT NULL,
  `unique_code` varchar(64) NOT NULL,
  PRIMARY KEY (`id_guru`),
  UNIQUE KEY `unique_code` (`unique_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `tb_guru`
--

LOCK TABLES `tb_guru` WRITE;
/*!40000 ALTER TABLE `tb_guru` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_guru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_jurusan`
--

DROP TABLE IF EXISTS `tb_jurusan`;

CREATE TABLE `tb_jurusan` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `jurusan` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jurusan` (`jurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `tb_jurusan`
--

LOCK TABLES `tb_jurusan` WRITE;
/*!40000 ALTER TABLE `tb_jurusan` DISABLE KEYS */;
INSERT INTO `tb_jurusan` VALUES (1,'A','2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(2,'B','2024-06-07 20:36:29','2024-06-07 20:36:29',NULL);
/*!40000 ALTER TABLE `tb_jurusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kehadiran`
--

DROP TABLE IF EXISTS `tb_kehadiran`;

CREATE TABLE `tb_kehadiran` (
  `id_kehadiran` int NOT NULL AUTO_INCREMENT,
  `kehadiran` enum('Hadir','Sakit','Izin','Tanpa keterangan') NOT NULL,
  PRIMARY KEY (`id_kehadiran`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `tb_kehadiran`
--

LOCK TABLES `tb_kehadiran` WRITE;
/*!40000 ALTER TABLE `tb_kehadiran` DISABLE KEYS */;
INSERT INTO `tb_kehadiran` VALUES (1,'Hadir'),(2,'Sakit'),(3,'Izin'),(4,'Tanpa keterangan');
/*!40000 ALTER TABLE `tb_kehadiran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_kelas`
--

DROP TABLE IF EXISTS `tb_kelas`;

CREATE TABLE `tb_kelas` (
  `id_kelas` int unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(32) NOT NULL,
  `id_jurusan` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kelas`),
  KEY `tb_kelas_id_jurusan_foreign` (`id_jurusan`),
  CONSTRAINT `tb_kelas_id_jurusan_foreign` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `tb_kelas`
--

LOCK TABLES `tb_kelas` WRITE;
/*!40000 ALTER TABLE `tb_kelas` DISABLE KEYS */;
INSERT INTO `tb_kelas` VALUES (1,'1',1,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(2,'1',2,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(3,'2',1,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(4,'2',2,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(5,'3',1,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(6,'3',2,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(7,'4',1,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(8,'4',2,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(9,'5',1,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(10,'5',2,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(11,'6',1,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL),(12,'6',2,'2024-06-07 20:36:29','2024-06-07 20:36:29',NULL);
/*!40000 ALTER TABLE `tb_kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_presensi_guru`
--

DROP TABLE IF EXISTS `tb_presensi_guru`;

CREATE TABLE `tb_presensi_guru` (
  `id_presensi` int NOT NULL AUTO_INCREMENT,
  `id_guru` int DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `id_kehadiran` int NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_presensi`),
  KEY `id_kehadiran` (`id_kehadiran`),
  KEY `id_guru` (`id_guru`),
  CONSTRAINT `tb_presensi_guru_ibfk_2` FOREIGN KEY (`id_kehadiran`) REFERENCES `tb_kehadiran` (`id_kehadiran`),
  CONSTRAINT `tb_presensi_guru_ibfk_3` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `tb_presensi_guru`
--

LOCK TABLES `tb_presensi_guru` WRITE;
/*!40000 ALTER TABLE `tb_presensi_guru` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_presensi_guru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_presensi_siswa`
--

DROP TABLE IF EXISTS `tb_presensi_siswa`;

CREATE TABLE `tb_presensi_siswa` (
  `id_presensi` int NOT NULL AUTO_INCREMENT,
  `id_siswa` int NOT NULL,
  `id_kelas` int unsigned DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `id_kehadiran` int NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_presensi`),
  KEY `id_siswa` (`id_siswa`),
  KEY `id_kehadiran` (`id_kehadiran`),
  KEY `id_kelas` (`id_kelas`),
  CONSTRAINT `tb_presensi_siswa_ibfk_2` FOREIGN KEY (`id_kehadiran`) REFERENCES `tb_kehadiran` (`id_kehadiran`),
  CONSTRAINT `tb_presensi_siswa_ibfk_3` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE,
  CONSTRAINT `tb_presensi_siswa_ibfk_4` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `tb_presensi_siswa`
--

LOCK TABLES `tb_presensi_siswa` WRITE;
/*!40000 ALTER TABLE `tb_presensi_siswa` DISABLE KEYS */;
INSERT INTO `tb_presensi_siswa` VALUES (1,1,1,'2024-06-08','03:42:03',NULL,1,'');
/*!40000 ALTER TABLE `tb_presensi_siswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_siswa`
--

DROP TABLE IF EXISTS `tb_siswa`;

CREATE TABLE `tb_siswa` (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `nis` varchar(16) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `id_kelas` int unsigned NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_hp` varchar(32) NOT NULL,
  `unique_code` varchar(64) NOT NULL,
  PRIMARY KEY (`id_siswa`),
  UNIQUE KEY `unique_code` (`unique_code`),
  KEY `id_kelas` (`id_kelas`),
  CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `tb_siswa`
--

LOCK TABLES `tb_siswa` WRITE;
/*!40000 ALTER TABLE `tb_siswa` DISABLE KEYS */;
INSERT INTO `tb_siswa` VALUES (1,'19865916817356','Erly Wahyuningtyas',1,'Perempuan','0897834618371','033e27061155ac5bc9cebbeb33a3ea7fdb2e49fe89211c8f31110936061feeef');
/*!40000 ALTER TABLE `tb_siswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `is_superadmin` tinyint(1) NOT NULL DEFAULT '0',
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'erlywahyuningtyas@gmail.com','erly',1,'$2y$10$QH6XqjnS8q9vykQ/B5O60O9DXHplfVC8NMROcFCAFnjFREl5UDqoq',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-09  9:36:59
