-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tripvalley
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `accommodations`
--

DROP TABLE IF EXISTS `accommodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodations` (
  `accommodation_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodations`
--

LOCK TABLES `accommodations` WRITE;
/*!40000 ALTER TABLE `accommodations` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accomodation_images`
--

DROP TABLE IF EXISTS `accomodation_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accomodation_images` (
  `accomodation_image_id` int NOT NULL AUTO_INCREMENT,
  `accomodation_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`accomodation_image_id`),
  KEY `fk_fotos_pacote_copy1_hospedagem1_idx` (`accomodation_id`),
  CONSTRAINT `fk_fotos_pacote_copy1_hospedagem1` FOREIGN KEY (`accomodation_id`) REFERENCES `accommodations` (`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accomodation_images`
--

LOCK TABLES `accomodation_images` WRITE;
/*!40000 ALTER TABLE `accomodation_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `accomodation_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_endereco_cliente1_idx` (`customer_id`),
  CONSTRAINT `fk_endereco_cliente1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `is_agent` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `fk_admin_user1_idx` (`user_id`),
  CONSTRAINT `fk_admin_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `contact` varchar(255) NOT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `fk_telefones_cliente1_idx` (`customer_id`),
  CONSTRAINT `fk_telefones_cliente1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(45) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customer_user1_idx` (`user_id`),
  CONSTRAINT `fk_customer_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulties`
--

DROP TABLE IF EXISTS `difficulties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `difficulties` (
  `difficulty_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(32) NOT NULL,
  `date_added` date DEFAULT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`difficulty_id`),
  KEY `fk_difficulty_package1_idx` (`package_id`),
  CONSTRAINT `fk_difficulty_package1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulties`
--

LOCK TABLES `difficulties` WRITE;
/*!40000 ALTER TABLE `difficulties` DISABLE KEYS */;
/*!40000 ALTER TABLE `difficulties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosting_meals`
--

DROP TABLE IF EXISTS `hosting_meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosting_meals` (
  `hosting_meal_id` int NOT NULL AUTO_INCREMENT,
  `accomodation_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `value` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`hosting_meal_id`),
  KEY `fk_refeicoes_hosp_hospedagem1_idx` (`accomodation_id`),
  CONSTRAINT `fk_refeicoes_hosp_hospedagem1` FOREIGN KEY (`accomodation_id`) REFERENCES `accommodations` (`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosting_meals`
--

LOCK TABLES `hosting_meals` WRITE;
/*!40000 ALTER TABLE `hosting_meals` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosting_meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itineraries`
--

DROP TABLE IF EXISTS `itineraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itineraries` (
  `itinerary_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL,
  `accommodation_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`itinerary_id`),
  KEY `fk_itinerario_hospedagem_idx` (`accommodation_id`),
  KEY `fk_itinerario_pacote1_idx` (`package_id`),
  CONSTRAINT `fk_itinerario_hospedagem` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodations` (`accommodation_id`),
  CONSTRAINT `fk_itinerario_pacote1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itineraries`
--

LOCK TABLES `itineraries` WRITE;
/*!40000 ALTER TABLE `itineraries` DISABLE KEYS */;
/*!40000 ALTER TABLE `itineraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_meals`
--

DROP TABLE IF EXISTS `order_meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_meals` (
  `order_meal_id` int NOT NULL AUTO_INCREMENT,
  `refeicoes_hosp_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`order_meal_id`,`refeicoes_hosp_id`),
  KEY `fk_refeicoes_pedido_refeicoes_hosp1_idx` (`refeicoes_hosp_id`),
  KEY `fk_refeicoes_pedido_pedido1_idx` (`order_id`),
  CONSTRAINT `fk_refeicoes_pedido_pedido1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_refeicoes_pedido_refeicoes_hosp1` FOREIGN KEY (`refeicoes_hosp_id`) REFERENCES `hosting_meals` (`hosting_meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_meals`
--

LOCK TABLES `order_meals` WRITE;
/*!40000 ALTER TABLE `order_meals` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_peoples`
--

DROP TABLE IF EXISTS `order_peoples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_peoples` (
  `order_people_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birth_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_people_id`),
  KEY `fk_pessoas_pedido_pedido1_idx` (`order_id`),
  CONSTRAINT `fk_pessoas_pedido_pedido1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_peoples`
--

LOCK TABLES `order_peoples` WRITE;
/*!40000 ALTER TABLE `order_peoples` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_peoples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_rooms`
--

DROP TABLE IF EXISTS `order_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_rooms` (
  `quartos_pedido_id` int NOT NULL AUTO_INCREMENT,
  `room_type_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`quartos_pedido_id`),
  KEY `fk_quartos_pedido_tipos_quartos1_idx` (`room_type_id`),
  KEY `fk_quartos_pedido_pedido1_idx` (`order_id`),
  CONSTRAINT `fk_quartos_pedido_pedido1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_quartos_pedido_tipos_quartos1` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_rooms`
--

LOCK TABLES `order_rooms` WRITE;
/*!40000 ALTER TABLE `order_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `package_id` int NOT NULL,
  `amount_people` int DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `transfer_id` int NOT NULL,
  `total` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_pedido_pacote1_idx` (`package_id`),
  KEY `fk_pedido_cliente1_idx` (`customer_id`),
  KEY `fk_pedido_transfer1_idx` (`transfer_id`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_pedido_pacote1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`),
  CONSTRAINT `fk_pedido_transfer1` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`transfer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_images`
--

DROP TABLE IF EXISTS `package_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_images` (
  `pack_img_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`pack_img_id`),
  KEY `fk_fotos_pacote_pacote1_idx` (`package_id`),
  CONSTRAINT `fk_fotos_pacote_pacote1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_images`
--

LOCK TABLES `package_images` WRITE;
/*!40000 ALTER TABLE `package_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `itinerary_description` varchar(255) DEFAULT NULL,
  `value` double(10,2) DEFAULT NULL,
  `is_trail` int NOT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_types` (
  `room_type_id` int NOT NULL AUTO_INCREMENT,
  `accomodation_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` double(10,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`room_type_id`),
  KEY `fk_tipos_quartos_hospedagem1_idx` (`accomodation_id`),
  CONSTRAINT `fk_tipos_quartos_hospedagem1` FOREIGN KEY (`accomodation_id`) REFERENCES `accommodations` (`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_types`
--

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timestamps`
--

DROP TABLE IF EXISTS `timestamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timestamps` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timestamps`
--

LOCK TABLES `timestamps` WRITE;
/*!40000 ALTER TABLE `timestamps` DISABLE KEYS */;
/*!40000 ALTER TABLE `timestamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` double(10,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transfer_id`),
  KEY `fk_transfer_pacote1_idx` (`package_id`),
  CONSTRAINT `fk_transfer_pacote1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2023-05-07 13:56:43
