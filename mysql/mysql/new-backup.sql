-- MySQL dump 10.13  Distrib 5.7.37, for Linux (x86_64)
--
-- Host: localhost    Database: ez-games
-- ------------------------------------------------------
-- Server version	5.7.37

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (65,'2014_10_12_000000_create_users_table',1),(66,'2014_10_12_100000_create_password_resets_table',1),(67,'2016_06_01_000001_create_oauth_auth_codes_table',1),(68,'2016_06_01_000002_create_oauth_access_tokens_table',1),(69,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(70,'2016_06_01_000004_create_oauth_clients_table',1),(71,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(72,'2019_08_19_000000_create_failed_jobs_table',1),(73,'2021_08_19_012226_user_table_new_fields',1),(74,'2021_08_21_144501_create_tournaments_table',1),(75,'2021_08_21_234755_create_games_table',1),(76,'2021_08_22_012127_create_teams_table',1),(77,'2021_08_22_012846_tournaments_table_new_fields',1),(78,'2022_03_17_165726_create_user_verification_tokens_table',1),(79,'2022_03_18_200940_create_user_team_table',1),(80,'2022_03_21_230430_create_user_pay_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('000442e56213fb2f8f88780a38b0c71d0b34fcf01d12224a672627643047de2982e884e21347cec5',103,1,'AccessToken','[]',0,'2022-03-25 19:33:24','2022-03-25 19:33:24','2022-04-24 19:33:24'),('057749e4562f5b6962d693fb7ea5fd425c0f37d18e9e60a156c8eed343d43661c585030e4e075b5a',148,1,'AccessToken','[]',0,'2022-03-27 13:22:44','2022-03-27 13:22:44','2022-04-26 13:22:44'),('0665726420e1c2997d2eb3da9b2e15ae3cc9bbafabec2315729bdbd068e89edfad55fd88ce79fb61',152,1,'AccessToken','[]',0,'2022-03-27 15:35:49','2022-03-27 15:35:49','2022-04-26 15:35:49'),('082b49ffd2f7f463cac15239d3c1ec54d624af9bf5e0dad3e928853d98d0327e62e644deef40e44e',146,1,'AccessToken','[]',0,'2022-03-27 13:16:45','2022-03-27 13:16:45','2022-04-26 13:16:45'),('09d024944192f49411b56e30ddf4018b9072f5aef75bdf394bb25feaea96e4824a961ed1a06d8c12',1,1,'AccessToken','[]',0,'2022-03-25 21:15:20','2022-03-25 21:15:20','2022-04-24 21:15:20'),('09d3ad88b4a5c616693b719258e6be748b6ac42f4521e0acf436a92aaf1d3d8dbb28889f3d4317dd',115,1,'AccessToken','[]',0,'2022-03-26 04:54:36','2022-03-26 04:54:36','2022-04-25 04:54:36'),('0b3fa9844b3f11479ddba477136e618db298952761c3404db63c02dd663fe00835e7a7a22bd44004',114,1,'AccessToken','[]',0,'2022-03-27 11:31:51','2022-03-27 11:31:51','2022-04-26 11:31:51'),('0bba011e0a966eaaf67629102126444bf2cdfedfb32ffeef6afe39333703f019ab74d6aaca15ecbc',154,1,'AccessToken','[]',0,'2022-03-27 16:03:24','2022-03-27 16:03:24','2022-04-26 16:03:24'),('0c0b9280bbab97f1eaffaf63d3e8adf11ef0470ba6e6d46a7065e6d4523941a72f8fd1df58c8b2fb',116,1,'AccessToken','[]',0,'2022-03-27 06:41:08','2022-03-27 06:41:08','2022-04-26 06:41:08'),('0c39b247e9224fccb2fcc7457cee6bee9ecd97ac270bb27d9d2b531938e1ff442433de1c202ebcd7',135,1,'AccessToken','[]',0,'2022-03-27 02:44:05','2022-03-27 02:44:05','2022-04-26 02:44:05'),('10589f3b37c6f92ffae5a2601b69bbe71a5a43ba0574053342f78354edfcc5dc0170cfc784c34417',104,1,'AccessToken','[]',0,'2022-03-25 21:03:57','2022-03-25 21:03:57','2022-04-24 21:03:57'),('13d83c8c4b150f24669779ffdcb8536e0a0273f0fdc19e90da1aa7e2c44187d7772face0e0a9de21',105,1,'AccessToken','[]',0,'2022-03-25 21:04:44','2022-03-25 21:04:44','2022-04-24 21:04:44'),('18003a9fcc43a2f571128902e0cd4babdea10f9f3d5bd12485c2520f4da505d7cd46774f168828f2',149,1,'AccessToken','[]',0,'2022-03-27 14:45:35','2022-03-27 14:45:35','2022-04-26 14:45:35'),('1ba671318a4f5ab2106f8a76af32ab9676eccc8938d3d37fdd9f5cc4862ad347699f65860bcbf876',106,1,'AccessToken','[]',0,'2022-03-25 21:14:22','2022-03-25 21:14:22','2022-04-24 21:14:22'),('28a398a853cec5f0f892f42723224dead21d2c0b3614d1734642e8eb63b758bd86a84b73c4e61c7b',119,1,'AccessToken','[]',0,'2022-03-26 09:07:29','2022-03-26 09:07:29','2022-04-25 09:07:29'),('2ae700731c89f2bed19c92fee6092fb80f624fa97c2479974400f01def9b70a472bf587e7d62ba66',145,1,'AccessToken','[]',0,'2022-03-27 13:04:14','2022-03-27 13:04:14','2022-04-26 13:04:14'),('2cc238f8510850891d883c796ee3dc176ec4a0e3d4d739034b7b4392284b0f8d958895b5bd893a44',113,1,'AccessToken','[]',0,'2022-03-25 22:15:53','2022-03-25 22:15:53','2022-04-24 22:15:53'),('337854e68a5aab510572ab692731b194ec953a44092758573e88eb443a648994c3a54259082060f2',142,1,'AccessToken','[]',0,'2022-03-27 10:13:57','2022-03-27 10:13:57','2022-04-26 10:13:57'),('3a0540b97f383d6ba57dad1e2bcd9e25294aab4ba3dfbb73e882f933a0c139b3cf4d52742ab0e8ed',124,1,'AccessToken','[]',0,'2022-03-26 17:07:38','2022-03-26 17:07:38','2022-04-25 17:07:38'),('3b95193a7b16b8ab9e3a394164d37ebec89ebda19a5952e7feb95039df794b40cdb8c05f2cb60441',126,1,'AccessToken','[]',0,'2022-03-26 22:20:48','2022-03-26 22:20:48','2022-04-25 22:20:48'),('3ed20005dc5f927a41ed1f9d133cf2dfd1e510378d05d2ca59a5010eddad612a86878752b5054eb5',150,1,'AccessToken','[]',0,'2022-03-27 15:03:34','2022-03-27 15:03:34','2022-04-26 15:03:34'),('45325eacb36642c029a2ce24af3931517aece3aa8e89fe3f5a3409f8abc7974fa897289119e42887',129,1,'AccessToken','[]',0,'2022-03-26 21:00:32','2022-03-26 21:00:32','2022-04-25 21:00:32'),('4a8d7dfde88329a0167a182d9d6d689a301d74331e0a70c0e6a79b566fcda098ab7757e5872dc03a',136,1,'AccessToken','[]',0,'2022-03-27 03:08:34','2022-03-27 03:08:34','2022-04-26 03:08:34'),('4e2db4e619c44c644948535506d2cf27552c1d8ff339aa77251547e40283186253fa2319170daf8b',121,1,'AccessToken','[]',0,'2022-03-26 14:31:42','2022-03-26 14:31:42','2022-04-25 14:31:42'),('4ef0e5d616e7e58b526484b8aaa88547b253a9251f1f02ab4eb7a26890643b21106b788d9fb8c31a',117,1,'AccessToken','[]',0,'2022-03-26 06:46:34','2022-03-26 06:46:34','2022-04-25 06:46:34'),('4ef6d114864d16ddc74cc5d7b5cf3c28984610e648886454f60211f0cbb2078ba55c17e9e176d8fc',105,1,'AccessToken','[]',0,'2022-03-25 21:38:31','2022-03-25 21:38:31','2022-04-24 21:38:31'),('52c3a8012fa86186c73f4a36a1857806730fc8d3bcf365d31dfe35c4c9d411989da8ce4c8c692d4a',108,1,'AccessToken','[]',0,'2022-03-25 23:42:54','2022-03-25 23:42:54','2022-04-24 23:42:54'),('535703460ce4ed4e9dd7b86225f9023c89cceaddac5a2f8c661fe72e45d35628b51b6b927799a73e',112,1,'AccessToken','[]',0,'2022-03-25 22:01:03','2022-03-25 22:01:03','2022-04-24 22:01:03'),('56f8d83babdd2d9f21067e89ed66f9c7bd08fd6a34eb79c873b0ca657d59455086b23197c2b1d8f8',125,1,'AccessToken','[]',0,'2022-03-26 19:20:30','2022-03-26 19:20:30','2022-04-25 19:20:30'),('685a68bcdccbf5680af516674e712b3277637e2e30f204466638a3802620de24be1db588a9691a30',151,1,'AccessToken','[]',0,'2022-03-27 15:29:57','2022-03-27 15:29:57','2022-04-26 15:29:57'),('6d47998b0dfbbec21fe7028279a536d662e4223af7539294dfb2dafc79513e7f60b65e2020ce0f25',118,1,'AccessToken','[]',0,'2022-03-26 07:04:18','2022-03-26 07:04:18','2022-04-25 07:04:18'),('6decc76eb6695c3e90970b24c219d9ae0c0a240539403a876d22a6a78b774c58c4732493bcfec9bd',123,1,'AccessToken','[]',0,'2022-03-26 17:04:08','2022-03-26 17:04:08','2022-04-25 17:04:08'),('790f21d357b1d1da1cfed7e2dbe12be1f3d5d34a418d06f06c787323c194e8e053c4a018bfb1c64d',108,1,'AccessToken','[]',0,'2022-03-25 21:21:22','2022-03-25 21:21:22','2022-04-24 21:21:22'),('7ad5d4c3506de4f9d076ce0aa5cf2a110d8de4f1fd1eb28ce13382fcd314a4d7bd0f13716a4aa403',123,1,'AccessToken','[]',0,'2022-03-26 19:56:40','2022-03-26 19:56:40','2022-04-25 19:56:40'),('7ed5d8a4157ed8f8b7ba3649f9bcb2af3eb2ef3a0d5bcb3cf119d29e1a2db0921bb22311117dbb0c',153,1,'AccessToken','[]',0,'2022-03-27 16:02:46','2022-03-27 16:02:46','2022-04-26 16:02:46'),('7f1158e3e586b3c22c590c1af3950b94a1ed2742f932b5ea525bd663e497a3480bb247525bd4febe',127,1,'AccessToken','[]',0,'2022-03-26 19:58:45','2022-03-26 19:58:45','2022-04-25 19:58:45'),('80b68866cba16d1d7ac36aa21d72ebd70550713afc675935e18c92b6c406b3845b9c15b9243cdb49',140,1,'AccessToken','[]',0,'2022-03-27 08:43:21','2022-03-27 08:43:21','2022-04-26 08:43:21'),('817ac07445ba29994ae2f531216cb47e57e9af47886464438eb056fdcd33cb37ca0ca1c9480aae81',122,1,'AccessToken','[]',0,'2022-03-26 14:37:02','2022-03-26 14:37:02','2022-04-25 14:37:02'),('82829ed86c78b7eda04271f574e86cb5ddea774b329c8a8834187206850a3ab09042a604742c9ef9',111,1,'AccessToken','[]',0,'2022-03-25 21:36:49','2022-03-25 21:36:49','2022-04-24 21:36:49'),('941e009ae37262f8465c13769954f01207c27e6104a8e5d3b8b6604ba9861388629bd60d780b6980',126,1,'AccessToken','[]',0,'2022-03-26 19:30:53','2022-03-26 19:30:53','2022-04-25 19:30:53'),('9d66bd3a1073dd1e8f1688acf837d5afcf01145e4b42e1276ed8257a87398abf0e0e58a799016b3a',137,1,'AccessToken','[]',0,'2022-03-27 03:17:44','2022-03-27 03:17:44','2022-04-26 03:17:44'),('a55eee05f6b72986941b64c1dea52ad93f101c747cc078eeec701b3707fd65a0ef389243197bb089',107,1,'AccessToken','[]',0,'2022-03-25 21:19:34','2022-03-25 21:19:34','2022-04-24 21:19:34'),('a5e3ff1c1d9e63602d3bd3079982dd47fbde9d429f20fca10e8afd5149fd9d14b15e0ca1d5cecb3c',121,1,'AccessToken','[]',0,'2022-03-26 14:34:49','2022-03-26 14:34:49','2022-04-25 14:34:49'),('a897c8c97896047b53ffda507f90a11ff36f3d7d19fa9db6acdd56292ae85d73aa7a3e6d7b68ec45',116,1,'AccessToken','[]',0,'2022-03-26 05:37:48','2022-03-26 05:37:48','2022-04-25 05:37:48'),('b426143cd2126aff65162e1bc568b0f1c800d0913be96850290ff7cdb97e2fb43ca2d3c1f6cecb57',143,1,'AccessToken','[]',0,'2022-03-27 12:45:35','2022-03-27 12:45:35','2022-04-26 12:45:35'),('b42da51d81a732e711b46861998dff1dd0470b9482b1a903287fa3e56dfd23d5233b20f92257ffd9',120,1,'AccessToken','[]',0,'2022-03-26 14:08:01','2022-03-26 14:08:01','2022-04-25 14:08:01'),('b612d397539e489d18b985d550373122cc7660c64c60673fcab72a24af8e122e59f3c3b172999d96',133,1,'AccessToken','[]',0,'2022-03-26 23:18:20','2022-03-26 23:18:20','2022-04-25 23:18:20'),('b668a0a14fb6e3a5c3cfd20bd747a27c1edffb26b57978294365bafeba8c954ea1c5700203071994',116,1,'AccessToken','[]',0,'2022-03-27 06:41:08','2022-03-27 06:41:08','2022-04-26 06:41:08'),('bdb97f0a3caa4c7cf80b0626b99d51b3918e7bfbdae12a754cbadb1e9a45f0143ff8a10e7932cd61',134,1,'AccessToken','[]',0,'2022-03-26 21:58:45','2022-03-26 21:58:45','2022-04-25 21:58:45'),('c5ec612141d3b096186cc6ec0e8bb49890fada49da90e247fa908923b65fdd7132ca8bb36ccbf4da',110,1,'AccessToken','[]',0,'2022-03-25 21:34:59','2022-03-25 21:34:59','2022-04-24 21:34:59'),('ccc75943725df5a7cfffc999c686226050df1bece531553bdaffcaec6c0bf3402410d5b18d61dbee',147,1,'AccessToken','[]',0,'2022-03-27 13:21:48','2022-03-27 13:21:48','2022-04-26 13:21:48'),('d03d2a68f83055132ee85bb0d5c0b99929fbc65b9b5e101114fa57739dc4555e2e71e873d08c8198',148,1,'AccessToken','[]',0,'2022-03-27 13:26:22','2022-03-27 13:26:22','2022-04-26 13:26:22'),('d24e97c0e25b159999a3fab55b386add050d35233b045ffded9ebae72ed8de89de5733a9aa888160',132,1,'AccessToken','[]',0,'2022-03-26 21:42:30','2022-03-26 21:42:30','2022-04-25 21:42:30'),('d73457382a386b64e5a6deee535c39237e6c175876f74d752bde82f90ab1247eafb905481f95f5e2',149,1,'AccessToken','[]',0,'2022-03-27 14:30:54','2022-03-27 14:30:54','2022-04-26 14:30:54'),('d974f593881a0acc2a110701238100806d450c55d68a6b0dc2f56362de036469a45469b2dba3f418',109,1,'AccessToken','[]',0,'2022-03-25 21:22:45','2022-03-25 21:22:45','2022-04-24 21:22:45'),('db637b94db6ed0e35b50d786542aa3e55dca3ee598d24f72e4f07eeda06b92ec86a86158d5f90ede',153,1,'AccessToken','[]',0,'2022-03-27 16:01:17','2022-03-27 16:01:17','2022-04-26 16:01:17'),('dc3956645c4179553375b7400a77b406054c6330a7814e4c371912fa4ad64d2ef005016d3cd0075b',141,1,'AccessToken','[]',0,'2022-03-27 10:10:09','2022-03-27 10:10:09','2022-04-26 10:10:09'),('dc8b80fe4dcce0440de0b8cf62c014645f962266896dff9ee1e2a671c5b00d4bef38da33a29bf4e3',114,1,'AccessToken','[]',0,'2022-03-25 23:41:31','2022-03-25 23:41:31','2022-04-24 23:41:31'),('e53b5b1843f194eec09d86330f21acd3e0c97cd9e7475e6cbb176414785337847d284525dba17e0c',111,1,'AccessToken','[]',0,'2022-03-26 08:54:32','2022-03-26 08:54:32','2022-04-25 08:54:32'),('e5b4101e840d8ebc5260bcea61b43c4d9219010147b832f34233501ab9af31b56189a4959dc3f7e4',134,1,'AccessToken','[]',0,'2022-03-26 23:20:21','2022-03-26 23:20:21','2022-04-25 23:20:21'),('e7bb017f1d01ff37acd3479fbff6732c58f4aa0a0b992f15252db88b8ea20b7c6c62a8c63b106e21',139,1,'AccessToken','[]',0,'2022-03-27 08:15:30','2022-03-27 08:15:30','2022-04-26 08:15:30'),('f28a9611b40cd6522c57ec5759267a393d26d541bfc2c63eb2cf6339b51445c7faf34e01e130db65',133,1,'AccessToken','[]',0,'2022-03-26 21:42:48','2022-03-26 21:42:48','2022-04-25 21:42:48'),('f3114d58a7632dc03bb0801724a9e93aedb0254db231a0a6532147ded61d6fc4cac3e905300b84d8',135,1,'AccessToken','[]',0,'2022-03-27 02:58:20','2022-03-27 02:58:20','2022-04-26 02:58:20'),('f4fa62ae089b71804194142496e1fcbfad8f7828c5feae7fae9b67162b2db71fd7806b7b124656ef',155,1,'AccessToken','[]',0,'2022-03-27 16:09:37','2022-03-27 16:09:37','2022-04-26 16:09:37'),('f96736b97a5807dfc970f56f125c58f512c87a7b9cb4c274710936f90176b731769bc2d5e950d699',144,1,'AccessToken','[]',0,'2022-03-27 12:45:50','2022-03-27 12:45:50','2022-04-26 12:45:50'),('fa15f7fff3a7e0ce8172bd57b4227c604cf8e9fd98745d4f276930edd65eff089a272bbfb1276901',128,1,'AccessToken','[]',0,'2022-03-26 20:53:32','2022-03-26 20:53:32','2022-04-25 20:53:32'),('fbf529dcbbdd9838d2d063c17c49b3556d54f06839363a2d2c5fed23f629310c9a7ebe879834c08d',130,1,'AccessToken','[]',0,'2022-03-26 21:03:50','2022-03-26 21:03:50','2022-04-25 21:03:50'),('fd636c2bd9fae0f82ebf14aae88561f3d2814f84498ab79e3bfea42f9fc9f0d8d85fc66a82626baa',131,1,'AccessToken','[]',0,'2022-03-26 21:25:52','2022-03-26 21:25:52','2022-04-25 21:25:52'),('fe5c17d2c40fadcf95aea93f313549ced279200445f85c280b32b8d64fc31e9635d7e8118b18eb72',111,1,'AccessToken','[]',0,'2022-03-25 21:42:46','2022-03-25 21:42:46','2022-04-24 21:42:46');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Ez-battles Personal Access Client','tOECAjHDZR11Njw05BTfiTaUltoxDdmPRvWG8T6R',NULL,'http://localhost',1,0,0,'2022-03-25 17:42:02','2022-03-25 17:42:02');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2022-03-25 17:42:02','2022-03-25 17:42:02');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tournament_id` bigint(20) unsigned NOT NULL,
  `captain_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_tournament_id_foreign` (`tournament_id`),
  KEY `teams_captain_id_foreign` (`captain_id`),
  CONSTRAINT `teams_captain_id_foreign` FOREIGN KEY (`captain_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `teams_tournament_id_foreign` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'FIRMI',1,104,'2022-03-25 21:05:36','2022-03-25 21:05:36'),(2,'team 254',1,107,'2022-03-25 21:32:03','2022-03-25 21:32:03'),(3,'LAS YEGUAS',1,116,'2022-03-26 05:39:20','2022-03-26 05:39:20'),(4,'LA COMARCA',1,121,'2022-03-26 14:34:17','2022-03-26 14:34:17'),(5,'Sweaty Geese',1,120,'2022-03-26 15:25:27','2022-03-26 15:25:27'),(6,'Cartoon cartel Johhndevil',1,123,'2022-03-26 17:04:28','2022-03-26 17:04:28'),(7,'CCCSW',1,124,'2022-03-26 17:31:10','2022-03-26 17:31:10'),(8,'Anti Judas',1,128,'2022-03-26 20:55:08','2022-03-26 20:55:08'),(9,'ENEM1',1,117,'2022-03-26 20:57:57','2022-03-26 20:57:57'),(10,'Supervillains',1,110,'2022-03-26 21:46:40','2022-03-26 21:46:40'),(11,'Cuba',1,132,'2022-03-26 21:48:02','2022-03-26 21:48:02'),(12,'Rippers boys',1,134,'2022-03-26 23:13:13','2022-03-26 23:13:13'),(13,'Da Boys',1,133,'2022-03-26 23:18:36','2022-03-26 23:18:36'),(14,'TheThreeBeans69',1,135,'2022-03-27 02:58:39','2022-03-27 02:58:39'),(15,'Team TKO',1,142,'2022-03-27 10:15:56','2022-03-27 10:15:56'),(16,'Get Gud',1,145,'2022-03-27 13:08:49','2022-03-27 13:08:49'),(17,'AJ Demons',1,146,'2022-03-27 15:34:21','2022-03-27 15:34:21'),(18,'Zolh x Bean x Firmi',1,155,'2022-03-27 16:15:09','2022-03-27 16:15:09'),(19,'JSquad',1,114,'2022-03-27 16:25:45','2022-03-27 16:25:45');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournaments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `entry` double(8,2) DEFAULT NULL,
  `reward` double(8,2) DEFAULT NULL,
  `type` enum('single','duos','trios','quads') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `winner_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tournaments_winner_id_foreign` (`winner_id`),
  CONSTRAINT `tournaments_winner_id_foreign` FOREIGN KEY (`winner_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournaments`
--

LOCK TABLES `tournaments` WRITE;
/*!40000 ALTER TABLE `tournaments` DISABLE KEYS */;
INSERT INTO `tournaments` VALUES (1,'BR DUOS Rebirth Duos','2022-03-27 12:00:00','2022-03-27 14:00:00',NULL,30.00,'single',NULL,NULL,NULL),(2,'Special custom trios','2022-03-27 12:00:00','2022-03-27 14:00:00',NULL,30.00,'single',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tournaments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pay`
--

DROP TABLE IF EXISTS `user_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_pay` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_pay_user_id_foreign` (`user_id`),
  CONSTRAINT `user_pay_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pay`
--

LOCK TABLES `user_pay` WRITE;
/*!40000 ALTER TABLE `user_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `team_id` bigint(20) unsigned NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_team_user_id_foreign` (`user_id`),
  KEY `user_team_team_id_foreign` (`team_id`),
  CONSTRAINT `user_team_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_team_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_team`
--

LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
INSERT INTO `user_team` VALUES (1,104,1,1,NULL,NULL),(2,107,2,1,NULL,NULL),(3,116,3,1,NULL,NULL),(4,121,4,1,NULL,NULL),(5,120,5,1,NULL,NULL),(6,123,6,1,NULL,NULL),(7,124,7,1,NULL,NULL),(8,128,8,1,NULL,NULL),(9,117,9,1,NULL,NULL),(10,126,10,0,NULL,NULL),(11,125,10,0,NULL,NULL),(12,110,10,1,NULL,NULL),(13,132,11,1,NULL,NULL),(14,133,12,0,NULL,NULL),(15,134,12,1,NULL,NULL),(16,134,13,0,NULL,NULL),(17,133,13,1,NULL,NULL),(18,135,14,1,NULL,NULL),(19,141,15,0,NULL,NULL),(20,142,15,1,NULL,NULL),(21,145,16,1,NULL,NULL),(22,146,17,1,NULL,NULL),(23,104,18,0,NULL,NULL),(24,140,18,0,NULL,NULL),(25,155,18,1,NULL,NULL),(26,114,19,1,NULL,NULL);
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_verification_tokens`
--

DROP TABLE IF EXISTS `user_verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_verification_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_verification_tokens`
--

LOCK TABLES `user_verification_tokens` WRITE;
/*!40000 ALTER TABLE `user_verification_tokens` DISABLE KEYS */;
INSERT INTO `user_verification_tokens` VALUES (1,103,'fe52ff9a6761d211f81fb39ec457894f49a399ebdcef2dd1b5d2896924a1',1,'2022-03-25 19:33:24','2022-03-25 19:33:24'),(2,104,'5a5cd1abc9b92cc5cc8fe0268e4a70b92158f541f9f9769e3d530ace7d4a',0,'2022-03-25 21:03:57','2022-03-25 21:04:10'),(3,105,'261bc29ccc4112556bb11ed8db19c8d29770b5e1e6d698851046c8d29860',1,'2022-03-25 21:04:44','2022-03-25 21:04:44'),(4,106,'0c0e1cf757d1f1d1c9156e36f5b7c9abea390cba2f5666ba4b4486fce5fd',1,'2022-03-25 21:14:22','2022-03-25 21:14:22'),(5,107,'cc708189fdcf2fd3bf35b68c19e5761c1f6313174f9194c3a54e519c0079',0,'2022-03-25 21:19:33','2022-03-25 21:20:31'),(6,108,'26cc3d63efc5a1b362872dbc41d81507932a189dd9557877579e3a630e6a',0,'2022-03-25 21:21:22','2022-03-25 21:23:06'),(7,109,'22f3c357290b7dc3ff4e095f525cb5f53cc5ef2c8c739225d6bbee2bed15',1,'2022-03-25 21:22:45','2022-03-25 21:22:45'),(8,110,'7ee685c35d6b20bde27e68d571aee09d9c3fd95ab2e4021852946739f793',0,'2022-03-25 21:34:59','2022-03-25 21:35:36'),(9,111,'753320b2ac779df1b5a2d21d8374ebab8fe1c6517901000f648de4a96cc6',0,'2022-03-25 21:36:49','2022-03-25 21:37:41'),(10,112,'62c23cb5d3a7e1c5d360f7576db19ae13e48525e3b0cfc2ef49c0705deb4',1,'2022-03-25 22:01:03','2022-03-25 22:01:03'),(11,113,'88b74f9e065a7af7e71f0449ea86822a78095d61a03c1d1b5d398369acd7',1,'2022-03-25 22:15:53','2022-03-25 22:15:53'),(12,114,'351a9f85de01167146fb3d1220412fb30b52c444fd29541642c47bd52c3b',1,'2022-03-25 23:41:31','2022-03-25 23:41:31'),(13,115,'7697a9da278ee0978f9809a6673520f5f91d0b7cef97b939c3da793eb580',1,'2022-03-26 04:54:36','2022-03-26 04:54:36'),(14,116,'f4ddfffbaba6de724e8373156313273b32b3a694d38535da3081ee7a76a4',0,'2022-03-26 05:37:48','2022-03-26 05:38:55'),(15,117,'090816a16b323b9785f03574601acec8c15ce11dc88d5f1e1204615f5cb1',1,'2022-03-26 06:46:34','2022-03-26 06:46:34'),(16,118,'7c083dc4e55d5aa60b2ba4dbfac5541dd384abfb2cada437629bf29869a9',1,'2022-03-26 07:04:17','2022-03-26 07:04:17'),(17,119,'b0de9c732c3a0a0fc58251fccd6866352d59c9bce69bf26531d35cabf382',1,'2022-03-26 09:07:29','2022-03-26 09:07:29'),(18,120,'d9f9d504cb3eafa7b37d7e91b969fbe689d0ffc0fe020c392d35fc8f8330',1,'2022-03-26 14:08:01','2022-03-26 14:08:01'),(19,121,'1c5fd00f6c81d2e21c991c8d7169aeec706ac8263b86fc53e0ea65071372',1,'2022-03-26 14:31:42','2022-03-26 14:31:42'),(20,122,'6a32c038c11ca20919c72260b71cb5d502891b4714298b429644bd145904',0,'2022-03-26 14:37:02','2022-03-26 14:37:21'),(21,123,'0b8193bba01f7dae76e4260abbfc5315db331df2ee103af9e25a7225b974',0,'2022-03-26 17:04:08','2022-03-26 17:08:44'),(22,124,'67bbd0faedf72355d9c656976882d9abcc15bb47b657c6ac696348deb591',0,'2022-03-26 17:07:38','2022-03-26 17:09:14'),(23,125,'bd4003f7d4e64075c50c8eb0fac92520e8785c526662ff7fef2b152e9847',0,'2022-03-26 19:20:30','2022-03-26 21:44:29'),(24,126,'cf556a3b64da28429d4f9e31f9925548a53f6a377190b28c08c0cb35bb91',0,'2022-03-26 19:30:53','2022-03-26 19:45:30'),(25,127,'bfc386c58b4793930ca418fd45e812780d65ca406fc1f7e4163e9ccfae2d',1,'2022-03-26 19:58:45','2022-03-26 19:58:45'),(26,128,'af6086096bf377232572a316bb52f6ec1b00e2b120bf1d252f8333d6c757',1,'2022-03-26 20:53:32','2022-03-26 20:53:32'),(27,129,'040d3b7a47f0339b7f44a90df7cdb8b317136ccdff03faf79b4179919494',0,'2022-03-26 21:00:32','2022-03-26 21:01:02'),(28,130,'902e511d5237a4f3b99e099180896f0aa10293c263b7ceecc170b2cf678b',1,'2022-03-26 21:03:50','2022-03-26 21:03:50'),(29,131,'a470cfe872b931b3a204e1a9399a2be9370012b905eadaeec19d2d1ce46a',1,'2022-03-26 21:25:52','2022-03-26 21:25:52'),(30,132,'8315cd8af7a5a7d72444222d32dade16c2c567ac023bdb338b71df2c44ca',1,'2022-03-26 21:42:30','2022-03-26 21:42:30'),(31,133,'cf0ab524e3b9ae51ee18afcebc35fb8e220d54ceb132ccfc33e2ccd0df10',0,'2022-03-26 21:42:48','2022-03-26 22:01:12'),(32,134,'82ace0117d95e9f2b13faa3e209e2f4e3ac000d74036ac9d396ad69897c3',1,'2022-03-26 21:58:45','2022-03-26 21:58:45'),(33,135,'b2549cc52d939c76549ae071c128cd361fa4f5b08f2f0bc9484f19867dea',0,'2022-03-27 02:44:05','2022-03-27 02:47:24'),(34,136,'65be4a9d4c381663894a72aa89d76b94f76ea4213a00e3a4e70298fa5fff',1,'2022-03-27 03:08:34','2022-03-27 03:08:34'),(35,137,'a817f510ee691af54034717e370f16e33ee019769b43396c91b4afeb5bae',1,'2022-03-27 03:17:44','2022-03-27 03:17:44'),(36,139,'43bcbe13f225b28fe9ba57b123fcc958f6fd4f33dcc0c347c69f7624170c',0,'2022-03-27 08:15:30','2022-03-27 08:16:24'),(37,140,'b29adfb97f44213c72c2db14a28c3eb42eff4ecff758f9b57f4b9526bf06',1,'2022-03-27 08:43:21','2022-03-27 08:43:21'),(38,141,'04c7ff7240370890d1cd9a820c85c8525e9842d39d3fc6048b1923f7bcf0',1,'2022-03-27 10:10:09','2022-03-27 10:10:09'),(39,142,'d1de807ee5b5990579ede8ce0ae77dcc80dd8719a45d10958b25b158c460',0,'2022-03-27 10:13:57','2022-03-27 10:15:21'),(40,143,'7a5c07578ed629722e9698642f4a5213ee5b5c2aa16e1a74f935d44ccf9a',1,'2022-03-27 12:45:35','2022-03-27 12:45:35'),(41,144,'d9c3042eec57db17eef9cf385fbbe6790dd636373fdc454afff303f5ebb1',0,'2022-03-27 12:45:50','2022-03-27 12:46:14'),(42,145,'e23abe3094c0010a729dc9fcdf8f8e7574b13e0a9bc25807acf1d22aed25',0,'2022-03-27 13:04:14','2022-03-27 13:06:07'),(43,146,'a91c4c7d055f7ec8e4b00bcab4cbef5a27bb47f3b40ca21cfa36ccb6259c',1,'2022-03-27 13:16:45','2022-03-27 13:16:45'),(44,147,'f27d9e787e1b891d5a127dd496bc068440707c7ec743db15b00629c5629e',0,'2022-03-27 13:21:48','2022-03-27 13:27:07'),(45,148,'8b579b826a084398bcaaad2ac2ceae1f68651e8a3f5f8e723ee08cde9765',1,'2022-03-27 13:22:44','2022-03-27 13:22:44'),(46,149,'add42d083305cf8367b65677afbf389d0d4477a3d836dc44fd4c51369ad2',1,'2022-03-27 14:30:54','2022-03-27 14:30:54'),(47,150,'64610c4ed5ff76d4123943d632ee300d6716e6c869ba7648eb467cc733c4',1,'2022-03-27 15:03:34','2022-03-27 15:03:34'),(48,151,'e16031865ee0cc2a6fb636a5a50e44af2d7a487a2b533e48fc7db85c70fa',1,'2022-03-27 15:29:57','2022-03-27 15:29:57'),(49,152,'3dade383a011de6d3fc2940a76ab57f6a705f1a2da8224188a329484048c',1,'2022-03-27 15:35:49','2022-03-27 15:35:49'),(50,153,'fb9001c14d008a37f1b3b405a37c2fbcb12b1d84dbc594070584846338e6',1,'2022-03-27 16:01:17','2022-03-27 16:01:17'),(51,154,'d4b40f615bfe03d87596debb10b7f5f092d931be366c618d1e4f05368a32',1,'2022-03-27 16:03:24','2022-03-27 16:03:24'),(52,155,'476ed365300be3ab1b40f80227b5f4b1fc0f5842c666136b369782978762',1,'2022-03-27 16:09:37','2022-03-27 16:09:37');
/*!40000 ALTER TABLE `user_verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_nickname_unique` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Iron#6056064','test@g.com','atvi',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(2,'damqge#9252117','test1@g.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(3,'dolores#31013','daniella08@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(4,'dolore#30128','ftowne@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(5,'adipisci#73847','kenneth.graham@kulas.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(6,'quisquam#81352','kelsi30@klein.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(7,'commodi#84861','turner.beau@schinner.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(8,'explicabo#30943','ltremblay@barrows.info','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(9,'reiciendis#35292','josephine39@wilderman.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(10,'et#38139','corene.thompson@wehner.info','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(11,'ipsum#19108','verona.spinka@farrell.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(12,'odio#20881','jaeden.kessler@hauck.net','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(13,'atque#65712','quentin01@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(14,'ducimus#75403','jedidiah66@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(15,'aut#39513','ehill@schowalter.biz','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(16,'est#85582','lina.berge@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(17,'est#86734','elvera.treutel@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(18,'eos#67840','grayson.greenholt@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(19,'voluptatum#14750','marielle06@fadel.org','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(20,'quae#71021','hansen.rowland@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(21,'sint#71619','lavonne70@grady.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(22,'non#28474','xwehner@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(23,'repellendus#32321','daniela.sauer@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(24,'rem#70692','maryjane26@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(25,'ea#89790','letitia.williamson@lakin.net','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(26,'nesciunt#28859','wunsch.geoffrey@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(27,'aut#13015','walton52@russel.biz','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(28,'iste#43963','hegmann.virgie@bahringer.org','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(29,'consequuntur#96949','madison.lockman@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(30,'et#63208','ratke.deon@weissnat.info','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(31,'necessitatibus#86215','lind.marty@mills.org','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(32,'quia#59096','koconner@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(33,'expedita#88271','iokuneva@weimann.info','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(34,'voluptatum#18654','jared.kris@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(35,'et#66592','chelsea81@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(36,'magni#80123','leuschke.coby@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(37,'nihil#94275','ffay@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(38,'nobis#28047','ritchie.chloe@larkin.org','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(39,'voluptatem#73661','lucius29@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(40,'voluptas#48414','eleonore.zulauf@gleichner.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(41,'magnam#76518','fausto45@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(42,'corrupti#47858','nbahringer@lindgren.info','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(43,'nulla#86223','tconroy@schroeder.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(44,'blanditiis#93393','regan.rodriguez@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(45,'ad#85724','cassin.felton@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(46,'ducimus#70032','marlene.collier@quitzon.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(47,'quas#52479','hoeger.clotilde@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(48,'laborum#66374','travis.vandervort@cummings.org','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(49,'voluptas#14185','ogutkowski@runolfsson.info','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(50,'soluta#39932','rosemary.leffler@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(51,'placeat#81869','titus.ernser@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(52,'error#45945','vincenzo.barrows@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(53,'atque#70594','gudrun.stamm@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(54,'consequatur#65377','ihintz@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(55,'aliquid#62207','enos30@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(56,'iste#56867','guillermo.bogan@rutherford.biz','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(57,'illum#39085','kfisher@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(58,'quam#99004','karina26@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(59,'doloremque#36153','christophe.beahan@luettgen.info','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(60,'sed#55231','tanner05@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(61,'amet#28933','ipurdy@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(62,'atque#58742','onikolaus@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(63,'aut#25514','lesly.jerde@leannon.biz','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(64,'voluptate#77108','joesph82@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(65,'sunt#74396','colby25@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(66,'quidem#14317','voberbrunner@jerde.org','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(67,'est#48350','casper.rasheed@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(68,'voluptatibus#35689','jaida14@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(69,'iure#20147','sienna43@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(70,'perspiciatis#81271','adriana93@parisian.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(71,'dolor#44133','chad.okuneva@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(72,'blanditiis#93104','ahmad51@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(73,'eos#83087','robyn50@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(74,'rem#26388','kaci.pagac@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(75,'quia#82898','ekeeling@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(76,'magnam#14052','vdare@little.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(77,'quis#13470','jonas.paucek@jenkins.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(78,'ut#81743','humberto.sipes@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(79,'quod#59527','ukihn@russel.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(80,'qui#73908','luna.haag@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(81,'sapiente#18630','trantow.nicholas@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(82,'et#23703','gyundt@nienow.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(83,'itaque#21896','mrohan@okuneva.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(84,'sit#27254','lonzo.hessel@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(85,'non#82820','rick22@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(86,'autem#16479','zhyatt@kovacek.biz','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(87,'vitae#19715','vladimir69@hotmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(88,'esse#30485','koepp.leilani@weber.net','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(89,'corporis#18152','martina.windler@dubuque.info','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(90,'ducimus#97307','gunner.walsh@gulgowski.org','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(91,'et#37618','matteo.hermann@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(92,'vero#81208','telly47@beer.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(93,'quasi#90603','yleffler@pouros.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(94,'facilis#26969','albertha34@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(95,'excepturi#33531','lina40@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(96,'sed#54158','bogisich.tevin@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(97,'earum#13212','estreich@schiller.net','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(98,'odio#57880','weimann.enrico@towne.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(99,'molestiae#37212','bins.cara@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(100,'consequatur#16098','daugherty.morton@bartell.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(101,'pariatur#83715','pierce29@yahoo.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(102,'laudantium#55864','cameron81@gmail.com','psn',NULL,'$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',NULL,NULL,NULL),(103,'DevRo#8921081','piercedevro20@hotmail.com',NULL,NULL,'$2y$10$Gl/gzBfeRmRDF0vSfYA86ObIEsHuQZPzGMEhGjbY7Dg5BoMSDUoNK',NULL,'2022-03-25 19:33:24','2022-03-25 19:33:24'),(104,'F1RM1#2924857','firmilianalexandrescu@yahoo.com',NULL,'2022-03-25 21:04:10','$2y$10$7dZ7NAuQ7kxByJDTjP89suVRXzzR7cteIqykrgdyuD04..avn3FQ2',NULL,'2022-03-25 21:03:57','2022-03-25 21:04:10'),(105,'sugardadfps#2201928','ssalas.wt@gmail.com',NULL,NULL,'$2y$10$eJ9skg.4qyL1EIFD4vpay.XYiAgwy42yCGTcr1F3s8a3mUm7wxH7y',NULL,'2022-03-25 21:04:44','2022-03-25 21:04:44'),(106,'Jeyro12','Jethrojackson12@gmail.com',NULL,NULL,'$2y$10$hK504NsG/kSPyJKeoo9hOeO51PDZQkRafJD.hD77/WBH8H5HR3gru',NULL,'2022-03-25 21:14:22','2022-03-25 21:14:22'),(107,'vish254#4990787','vishh254@gmail.com',NULL,'2022-03-25 21:20:32','$2y$10$KOdnoaKppKm6GCoShE01bum/lg8X3D5dHT0T5x1zOANGuOzyYWM8i',NULL,'2022-03-25 21:19:33','2022-03-25 21:20:32'),(108,'NASTY#9922746','anothernasty@gmail.com',NULL,'2022-03-25 21:23:06','$2y$10$QRtfsk8vNSR3Fhmy2GPcPuLbBrWCUG6WyYIKR8mAc46iETomBzozC',NULL,'2022-03-25 21:21:22','2022-03-25 21:23:06'),(109,'LeoSeven','butterflyeffect.b3@gmail.com',NULL,NULL,'$2y$10$0RhvGHFOLPUv1XyB/1IyL.2hD1UnDqsWjR8uUY16wKMxWBvZA2eSy',NULL,'2022-03-25 21:22:45','2022-03-25 21:22:45'),(110,'Random#8526486','derekdw12@gmail.com',NULL,'2022-03-25 21:35:36','$2y$10$jZPqmY1QkSQ08TN6jNfcfOZ0BSjIf4ITHoeSR.4WHGukyg4T65OmC',NULL,'2022-03-25 21:34:59','2022-03-25 21:35:36'),(111,'KinG_FaHAD_117','fahadvayani9@gmail.com',NULL,'2022-03-25 21:37:41','$2y$10$Rhj/3NwS9bqeJetShDm.2eM35nLrvWOE3sm2KGT0jX/Jk2qNeRn/2',NULL,'2022-03-25 21:36:49','2022-03-25 21:37:41'),(112,'AdnanKE#6033523','adnan3kassim@gmail.com',NULL,NULL,'$2y$10$XSlGMIcat0hFR2mAEUTrGOiwkLLEYRelLeF.eRiNA6qATJdVtPUG2',NULL,'2022-03-25 22:01:03','2022-03-25 22:01:03'),(113,'Fricasojr','Danielmessimerao@gmail.com',NULL,NULL,'$2y$10$ACZ0uZfXo8BSr9cZ7H41AOj3dpmIbsuKwCqk1iZ.9IRM29ubEXO.O',NULL,'2022-03-25 22:15:53','2022-03-25 22:15:53'),(114,'Monstar_63GT#3685604','justinsmidt90@gmail.com',NULL,NULL,'$2y$10$782P1ueXrW98uKeEsldWhOoS65oHj4.VYXN0s0d1XMPJab.kGSVMC',NULL,'2022-03-25 23:41:31','2022-03-25 23:41:31'),(115,'MR.100','chrisallenbrewer@icloud.com',NULL,NULL,'$2y$10$ZUkfNnB17UAMa5WaTlIRluhO8E7NJbn38GV3ThkuppiIqXuEuKPty',NULL,'2022-03-26 04:54:36','2022-03-26 04:54:36'),(116,'Ilaaan#11220','ilanalvarezsalas@gmail.com',NULL,'2022-03-26 05:38:55','$2y$10$R/K52.7DwO2GLNH3l2fhjeNlSTOG6vgsWQVRFPA2ghN4x/jUGQ.FW',NULL,'2022-03-26 05:37:48','2022-03-26 05:38:55'),(117,'Solar#8586807','deniroalexa1@gmail.com',NULL,NULL,'$2y$10$6QFzKJyCyREmo.lyWRzScuwXizdkO09r/OnBctbenMoAFADWPuEA6',NULL,'2022-03-26 06:46:34','2022-03-26 06:46:34'),(118,'elpadreblazeyy#3116607','eaaronespinoza53@gmail.com',NULL,NULL,'$2y$10$57SiQ5my5O72DICuUJZ1Z.OrN6pzKTdYerIILX1NRZVTh.UG8Caxi',NULL,'2022-03-26 07:04:17','2022-03-26 07:04:17'),(119,'2635','adam.somsedik@gmail.com',NULL,NULL,'$2y$10$g7if4QqX5oSVEelsyHtu0Om.lXSkDq7I4PkT0n6w5h2CWzw9BLMcS',NULL,'2022-03-26 09:07:29','2022-03-26 09:07:29'),(120,'Golobolo#7461718','simpsoncarter344@gmail.com',NULL,NULL,'$2y$10$FH.HHsYDCIYaj7c/V/X9kOlaRAknjPUiMigSjNFqR0uc88FsxBkFW',NULL,'2022-03-26 14:08:01','2022-03-26 14:08:01'),(121,'Sombrita #1297897','programa.nt@hotmail.com',NULL,NULL,'$2y$10$VBmU/ihQSvFMHTyZnHruru8qdXZEpzLgVrrYaWlJHFVa3KF13k0mG',NULL,'2022-03-26 14:31:42','2022-03-26 14:31:42'),(122,'MAHIR#1317645','M.mahir.a@hotmail.com',NULL,'2022-03-26 14:37:21','$2y$10$bzUZLtAwIzva.Br9Vm7GNecgtLzLVohMF1ANivA6zQLsddX5CQVFu',NULL,'2022-03-26 14:37:02','2022-03-26 14:37:21'),(123,'WhiteClaw#6881122','Jondevil30@gmail.com',NULL,'2022-03-26 17:08:44','$2y$10$B3BqT1BYxGcmxRxp3USbZuRhewsQb8A.wER4MLNs8S0Y8ohdPS8jC',NULL,'2022-03-26 17:04:08','2022-03-26 17:08:44'),(124,'Avel8315_1156154#4294967295','christopher8315@gmail.com',NULL,'2022-03-26 17:09:14','$2y$10$JNxagLQPjds9Dom4Ird.j.xqsnB24QG17GD9mqcgUqSGP.t/xNk6y',NULL,'2022-03-26 17:07:38','2022-03-26 17:09:14'),(125,'Full Mongo0#3204123','rtnkf17@gmail.com',NULL,'2022-03-26 21:44:29','$2y$10$vro4EU6jbP/Yx8LJ7UVTPOiQy3OLPae.4O6nyeXbVXW82TZMPaY/e',NULL,'2022-03-26 19:20:30','2022-03-26 21:44:29'),(126,'Big Dinner#7070594','mrcallahanrocks@hotmail.com',NULL,'2022-03-26 19:45:30','$2y$10$LQwIDjO5qXgC/gTjo8eTQuOOOg3WjB.ivLAqffn6MUqLLZ6F1bCnC',NULL,'2022-03-26 19:30:53','2022-03-26 19:45:30'),(127,'METAcPRIME','oldsoul777@yahoo.com',NULL,NULL,'$2y$10$aK1xdk9nGZfQMKXlWVM/T.jUDcT0T2jxc.6A4QJ.a0.NBNweVhbQm',NULL,'2022-03-26 19:58:45','2022-03-26 19:58:45'),(128,'ZeroTolerance#9425538','Luisalbertoacosta1711@gmail.com',NULL,NULL,'$2y$10$T2/0e4dvF4Fp52o3MNLfNO2u4on74oQIhxbPxF8SCQiNdK5K8xAV.',NULL,'2022-03-26 20:53:32','2022-03-26 20:53:32'),(129,'daniel-_-TryH#4878347','daniel72kot@yandex.ru',NULL,'2022-03-26 21:01:02','$2y$10$fQRwHcO3JTmLz4HassBKV.Df6m98VdsGDooTvO71aWukH5/dxXLCa',NULL,'2022-03-26 21:00:32','2022-03-26 21:01:02'),(130,'sosiska787#8907157','Dimochka_67ru@mail.ru',NULL,NULL,'$2y$10$VX3sZ19fs1MIKJC/F913I.LgUUEF6bHaASSpSuMEPjJJPhB4eCv6O',NULL,'2022-03-26 21:03:50','2022-03-26 21:03:50'),(131,'Lüh Opp','9loverlane9@gmail.com',NULL,NULL,'$2y$10$0QLgHceHPzlU03OFwZUfVOK4jprPuFtIOBcH/lRxXlCwBzFI6Nsxi',NULL,'2022-03-26 21:25:52','2022-03-26 21:25:52'),(132,'PressF#7260048','fernandezeric336@gmail.com',NULL,NULL,'$2y$10$MiRoHtVSdXYhz45QYat9ie5z4o1S84lloEDFUco9IC.CVveDMsC3O',NULL,'2022-03-26 21:42:30','2022-03-26 21:42:30'),(133,'R1pp3r#9185196','Faaiq.mahomed17@gmail.com',NULL,'2022-03-26 22:01:12','$2y$10$cB7LWW9mear7Bv8i4eQP1Obki2haXZ5032jy6guUHMELOgLiy7p76',NULL,'2022-03-26 21:42:48','2022-03-26 22:01:12'),(134,'iTzTorrider#7547074','Epicgamesripper@gmail.com',NULL,NULL,'$2y$10$NrfrYCKFIulA8HdqkX4Nl.UGcoeHfNIX5o/57EyNhSIjV5Usvg0Ni',NULL,'2022-03-26 21:58:45','2022-03-26 21:58:45'),(135,'ICzernic#8771224','830266daniel@gmail.com',NULL,'2022-03-27 02:47:24','$2y$10$VdyKj3kfz1g0DbYVuu5ilun/Pe9Y1pG0B0XbsbV3rnTJMTkdKF3EO',NULL,'2022-03-27 02:44:05','2022-03-27 02:47:24'),(136,'nightnightt#9283853','jorgequeza@icloud.com',NULL,NULL,'$2y$10$oBYhLPh4/NUQ.mPV2MVuyeMJCIaARBvvSnx35cPywVoVZdZI.XrCW',NULL,'2022-03-27 03:08:34','2022-03-27 03:08:34'),(137,'Slickzy么乙#9568479','Gomezvic003@icloud.com',NULL,NULL,'$2y$10$mc0x/lJa7FjRRizwTms3FuRZvKexdqLtCtnbLx0/FTmoiXlVie15e',NULL,'2022-03-27 03:17:44','2022-03-27 03:17:44'),(139,'Aungsan','soea63892@gmail.com',NULL,'2022-03-27 08:16:24','$2y$10$VhuOegHoeCspDhuhVK6AmeEkR0pR6/6PqozyCfYf/7DanGd/8X1GW',NULL,'2022-03-27 08:15:30','2022-03-27 08:16:24'),(140,'iitabean#9601680','chuckjesse@gmail.com',NULL,NULL,'$2y$10$ZhIgr6VU.IWqjcBfaNHRUuUXuKcxwYDXmg5Njut2la0W17Hek10SG',NULL,'2022-03-27 08:43:21','2022-03-27 08:43:21'),(141,'Casanova','Baigojahanzaib@gmail.com',NULL,NULL,'$2y$10$Duzbb4ry.8Q/z.Rso/7.pecAlljv8gr6RDpfwMIxLX32/wii9uylW',NULL,'2022-03-27 10:10:09','2022-03-27 10:10:09'),(142,'ItsmeCasanova','Baigobaigo081@gmail.com',NULL,'2022-03-27 10:15:21','$2y$10$4H3D0QgedLzrb4jmn4EDmur4z46zIEozC41NqD9QW5dUrLQrBqLKm',NULL,'2022-03-27 10:13:57','2022-03-27 10:15:21'),(143,'kinghaze00','matthemings97@gmail.com',NULL,NULL,'$2y$10$8PeAHVdNWI1yCcD9zpgy/ennnFiSO5IzuKkHVWhQN8EtB1FXLy5Nm',NULL,'2022-03-27 12:45:35','2022-03-27 12:45:35'),(144,'Mogee','m.k.gharaibeh@hotmail.com',NULL,'2022-03-27 12:46:14','$2y$10$Oz8/cSGblv117dx7yTDEyOfIEPIC17OM1tvJI4sIr15AP2DHx9IjO',NULL,'2022-03-27 12:45:50','2022-03-27 12:46:14'),(145,'ugotclapped#7435368','jaredigesund@gmail.com',NULL,'2022-03-27 13:06:07','$2y$10$8X7pAit2bplYW5oX4Kby6.5c1L./P3cJgX8wKc7ICPdndSA8MUzxe',NULL,'2022-03-27 13:04:14','2022-03-27 13:06:07'),(146,'Joelz#1301760','joelanbranco12@gmail.com',NULL,NULL,'$2y$10$/gX/iaEe7miE.CAQ1/TmFeudLvSLS2EIKieOeJ6TfSlx.d5GmVQ.m',NULL,'2022-03-27 13:16:45','2022-03-27 13:16:45'),(147,'Temp0din#3434421','michaux.nicholas@gmail.com',NULL,'2022-03-27 13:27:07','$2y$10$.WdcGyQrRNH3TX9Hv/MLLO4FzKCioQtNiXLm/Vo/ayqpZ24QxT9Hi',NULL,'2022-03-27 13:21:48','2022-03-27 13:27:07'),(148,'Gabe#1979470','gabe11gill@gmail.com',NULL,NULL,'$2y$10$JFSYHwCaq8.WOSuIU22nS.hUxSU98I47dgu.VaReEIenbSeFKrJfK',NULL,'2022-03-27 13:22:44','2022-03-27 13:22:44'),(149,'metadon','rashidmiah04@gmail.com',NULL,NULL,'$2y$10$E3CZ4RbPpWEo7.LQuEuu/ufGFALopN4kj6fe4fTL9tYDVQ/zdxrRC',NULL,'2022-03-27 14:30:54','2022-03-27 14:30:54'),(150,'2793443','Nuhhud58@gmail.com',NULL,NULL,'$2y$10$ufMLZFjdfdXu6oOJM2oMnuJEoCAotxris4MYarJzHPBkcG6J3XbD.',NULL,'2022-03-27 15:03:33','2022-03-27 15:03:33'),(151,'Zestyyy#9957974','mauritziodtorri@gmail.com',NULL,NULL,'$2y$10$p8cdIb6MlpMLIi8uz.CoqOSeOYFH/0TxcGaZAw5/x8v6n33tU65oa',NULL,'2022-03-27 15:29:57','2022-03-27 15:29:57'),(152,'PLANETS.#8686','talkoszegi@gmail.com',NULL,NULL,'$2y$10$TUsdc3idShdt3tCVl9z4gOzl1AsdNZvAaXb4/mTvr5Dm6Mbm2ZJU.',NULL,'2022-03-27 15:35:49','2022-03-27 15:35:49'),(153,'F1RM1#2924858','pigklokic@gmail.com',NULL,NULL,'$2y$10$zxawgTJrLBGl.GAsUNgd6uNSsftK16D40VupKMJRjLzlsn0yoGjpO',NULL,'2022-03-27 16:01:17','2022-03-27 16:01:17'),(154,'Hi#4250000','elianl786@gmail.com',NULL,NULL,'$2y$10$vZ3OEo0m8ccujBKaYa8Rm.24Om.g9eILyRUtiyRhJOV0l5g0dlVpe',NULL,'2022-03-27 16:03:24','2022-03-27 16:03:24'),(155,'Zolh#7586071','zoltan.holtzhausen@gmail.com',NULL,NULL,'$2y$10$z1lK.kx.E.YiTW7XwQ2KIu4FIF3i.YIpYD8X.LlJw1D0rYIWvaUcS',NULL,'2022-03-27 16:09:37','2022-03-27 16:09:37');
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

-- Dump completed on 2022-03-27 16:54:28
