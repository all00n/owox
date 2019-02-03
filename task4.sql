-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: owox
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `client_phones`
--

DROP TABLE IF EXISTS `client_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_phones_1_idx` (`client_id`),
  CONSTRAINT `fk_client_phones_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_phones`
--

LOCK TABLES `client_phones` WRITE;
/*!40000 ALTER TABLE `client_phones` DISABLE KEYS */;
INSERT INTO `client_phones` VALUES (1,1,11111111),(2,1,2222222),(3,2,3333333),(4,3,4444444);
/*!40000 ALTER TABLE `client_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'петя','email_1@gmail.com'),(2,'дима','email_2@gmail.com'),(3,'вася','email_3@gmail.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `quantity` int(5) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_order_goods_1_idx` (`order_id`),
  KEY `fk_order_goods_2_idx` (`product_id`),
  CONSTRAINT `fk_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` VALUES (1,16,1,20.00,1,'2019-02-02 17:50:26'),(2,16,2,1100.00,1,'2019-02-02 17:50:26'),(3,17,2,1100.00,3,'2019-02-02 17:50:26'),(4,18,1,20.00,2,'2019-02-02 17:50:26'),(5,18,2,1100.00,1,'2019-02-02 17:50:26'),(6,18,3,320.00,4,'2019-02-02 17:50:26'),(7,19,1,20.00,6,'2019-02-02 17:50:26'),(8,19,2,1100.00,4,'2019-02-02 17:50:26'),(9,19,3,320.00,1,'2019-02-02 17:50:26'),(10,19,4,322.00,8,'2019-02-02 17:50:26'),(11,20,3,320.00,1,'2019-02-02 17:50:26'),(12,21,1,20.00,1,'2019-02-02 17:50:26'),(13,22,3,320.00,5,'2019-02-02 17:50:26'),(14,23,1,20.00,1,'2019-02-02 17:50:26'),(15,24,1,20.00,1,'2019-02-02 17:50:26'),(16,25,1,20.00,2,'2019-02-02 17:50:26'),(17,26,2,1100.00,1,'2019-02-02 17:50:26'),(18,26,4,322.00,1,'2019-02-02 17:50:26'),(19,27,1,20.00,6,'2019-02-02 17:50:26'),(20,28,3,320.00,1,'2019-02-02 17:50:26'),(21,29,2,1100.00,1,'2019-02-02 17:50:26'),(22,29,3,320.00,4,'2019-02-02 17:50:26'),(23,30,1,20.00,1,'2019-02-02 17:50:26');
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `order_price` decimal(10,2) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `client_phone_id` int(11) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_orders_1_idx` (`client_phone_id`),
  CONSTRAINT `fk_orders_1` FOREIGN KEY (`client_phone_id`) REFERENCES `client_phones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (16,1,3400.00,111111111,1,'2019-02-02 15:57:19'),(17,1,1231.00,111111111,1,'2019-02-02 15:57:19'),(18,1,4342.00,111111111,2,'2019-02-02 15:57:19'),(19,2,34234.00,111111111,3,'2019-02-02 15:57:19'),(20,3,3432.00,111111111,4,'2019-02-02 15:57:19'),(21,3,3432.00,111111111,4,'2019-02-02 15:57:19'),(22,1,342.00,111111111,2,'2019-02-02 15:57:19'),(23,3,765.00,111111111,4,'2019-02-02 15:57:19'),(24,1,574.00,111111111,2,'2019-02-02 15:57:19'),(25,2,7565.00,111111111,3,'2019-02-02 15:57:19'),(26,3,345.00,111111111,4,'2019-02-02 15:57:19'),(27,3,3644.00,111111111,4,'2019-02-02 15:57:19'),(28,2,5643.00,111111111,3,'2019-02-02 15:57:19'),(29,2,644.00,111111111,3,'2019-02-02 15:57:19'),(30,1,6345.00,111111111,1,'2019-02-02 15:57:19');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'name 1','desc 1',20.00),(2,'name 2','desc 2',1100.00),(3,'name 3','desc 3',320.00),(4,'name 4','desc 4',322.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-02 18:58:00
