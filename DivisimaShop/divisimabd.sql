
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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `idbrand` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idbrand`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'armani'),(2,'Versace'),(3,'Carlo Bruni'),(4,'Jack Honey');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'men',1,0),(2,'ladies',1,0),(3,'clothing',1,1),(4,'shoes',1,1),(5,'accessories',1,1),(6,'Clothing',1,2),(7,'Shoes',1,2),(8,'Accessories',1,2),(9,'T-shirts',1,3),(10,'Shirts',1,3),(11,'Pants',1,3),(12,'Trainers',1,4),(13,'Sandals',1,4),(14,'Hiking shoes',1,4),(15,'Casual',1,4),(16,'Accesories',1,3),(17,'Kids',1,0),(18,'T-shirts',1,6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colour`
--

DROP TABLE IF EXISTS `colour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colour` (
  `idcolour` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcolour`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colour`
--

LOCK TABLES `colour` WRITE;
/*!40000 ALTER TABLE `colour` DISABLE KEYS */;
INSERT INTO `colour` VALUES (1,'white'),(2,'blue'),(3,'green'),(4,'yellow'),(5,'red');
/*!40000 ALTER TABLE `colour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner` (
  `idpartner` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idpartner`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES (1,'partner A'),(2,'partner B'),(3,'partner C');
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idproduct` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `urlimage` varchar(100) DEFAULT NULL,
  `feature` tinyint(4) NOT NULL,
  `idcategory` int(11) NOT NULL,
  `idpartner` int(11) NOT NULL,
  `idbrand` int(11) NOT NULL,
  `idcolour` int(11) NOT NULL,
  PRIMARY KEY (`idproduct`),
  KEY `fk_product_partner` (`idpartner`),
  KEY `fk_product_brand` (`idbrand`),
  KEY `fk_product_colour` (`idcolour`),
  KEY `fk_product_category` (`idcategory`),
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`idbrand`) REFERENCES `brand` (`idbrand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_colour` FOREIGN KEY (`idcolour`) REFERENCES `colour` (`idcolour`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_partner` FOREIGN KEY (`idpartner`) REFERENCES `partner` (`idpartner`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Fur coat with very but very very long name',143.00,25,'White lace top, woven, has a round neck, short sleeves, has knitted lining attached','product1.jpg',1,18,1,1,1),(2,'White Blouse Versace',143.00,30,'White lace top, woven, has a round neck, short sleeves, has knitted lining attached','product2.jpg',1,18,1,1,1),(3,'Black Blouse Versace',143.00,25,'White lace top, woven, has a round neck, short sleeves, has knitted lining attached','product3.jpg',1,18,1,1,1),(4,'Black Blouse Versace',143.00,30,'White lace top, woven, has a round neck, short sleeves, has knitted lining attached','product3.jpg',1,18,1,1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `idaccount` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idaccount`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Fredy','fredy.barrientos@unsch.edu.pe','123',NULL,1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_profile`
--

DROP TABLE IF EXISTS `account_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_profile` (
  `idaccountprofile` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT NULL,
  `idaccount` int(11) NOT NULL,
  `idprofile` int(11) NOT NULL,
  PRIMARY KEY (`idaccountprofile`),
  KEY `fk_accountprofile_account_idx` (`idaccount`),
  KEY `fk_accountprofile_profile_idx` (`idprofile`),
  CONSTRAINT `fk_accountprofile_account` FOREIGN KEY (`idaccount`) REFERENCES `account` (`idaccount`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_accountprofile_profile` FOREIGN KEY (`idprofile`) REFERENCES `profile` (`idprofile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_profile`
--

LOCK TABLES `account_profile` WRITE;
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `idbrand` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idbrand`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'armani'),(2,'Versace'),(3,'Carlo Bruni'),(4,'Jack Honey');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'men',1,0),(2,'ladies',1,0),(3,'clothing',1,1),(4,'shoes',1,1),(5,'accessories',1,1),(6,'Clothing',1,2),(7,'Shoes',1,2),(8,'Accessories',1,2),(9,'T-shirts',1,3),(10,'Shirts',1,3),(11,'Pants',1,3),(12,'Trainers',1,4),(13,'Sandals',1,4),(14,'Hiking shoes',1,4),(15,'Casual',1,4),(16,'Accesories',1,3),(17,'Kids',1,0),(18,'T-shirts',1,6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colour`
--

DROP TABLE IF EXISTS `colour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colour` (
  `idcolour` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcolour`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colour`
--

LOCK TABLES `colour` WRITE;
/*!40000 ALTER TABLE `colour` DISABLE KEYS */;
INSERT INTO `colour` VALUES (1,'white'),(2,'blue'),(3,'green'),(4,'yellow'),(5,'red');
/*!40000 ALTER TABLE `colour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `idmodule` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idmodule`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option` (
  `idoption` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `idsubmodule` int(11) NOT NULL,
  PRIMARY KEY (`idoption`),
  KEY `fk_option_submodule_idx` (`idsubmodule`),
  CONSTRAINT `fk_option_submodule` FOREIGN KEY (`idsubmodule`) REFERENCES `submodule` (`idsubmodule`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idorders` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `datecreation` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `idaccount` int(11) NOT NULL,
  PRIMARY KEY (`idorders`),
  KEY `fk_orders_account` (`idaccount`),
  CONSTRAINT `fk_orders_account` FOREIGN KEY (`idaccount`) REFERENCES `account` (`idaccount`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersdetail`
--

DROP TABLE IF EXISTS `ordersdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordersdetail` (
  `idordersdetail` int(11) NOT NULL AUTO_INCREMENT,
  `idproduct` int(11) NOT NULL,
  `idorders` int(11) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`idordersdetail`),
  KEY `fk_ordersdetail_product` (`idproduct`),
  KEY `fk_ordersdetail_orders` (`idorders`),
  CONSTRAINT `fk_ordersdetail_orders` FOREIGN KEY (`idorders`) REFERENCES `orders` (`idorders`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordersdetail_product` FOREIGN KEY (`idproduct`) REFERENCES `product` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdetail`
--

LOCK TABLES `ordersdetail` WRITE;
/*!40000 ALTER TABLE `ordersdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordersdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner` (
  `idpartner` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idpartner`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES (1,'partner A'),(2,'partner B'),(3,'partner C');
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idproduct` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `urlimage` varchar(100) DEFAULT NULL,
  `feature` tinyint(4) NOT NULL,
  `idcategory` int(11) NOT NULL,
  `idpartner` int(11) NOT NULL,
  `idbrand` int(11) NOT NULL,
  `idcolour` int(11) NOT NULL,
  PRIMARY KEY (`idproduct`),
  KEY `fk_product_partner` (`idpartner`),
  KEY `fk_product_brand` (`idbrand`),
  KEY `fk_product_colour` (`idcolour`),
  KEY `fk_product_category` (`idcategory`),
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`idbrand`) REFERENCES `brand` (`idbrand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_colour` FOREIGN KEY (`idcolour`) REFERENCES `colour` (`idcolour`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_partner` FOREIGN KEY (`idpartner`) REFERENCES `partner` (`idpartner`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Fur coat with very but very very long name',143.00,25,'White lace top, woven, has a round neck, short sleeves, has knitted lining attached','product1.jpg',1,18,1,1,1),(2,'White Blouse Versace',143.00,30,'White lace top, woven, has a round neck, short sleeves, has knitted lining attached','product2.jpg',1,18,1,1,1),(3,'Black Blouse Versace',143.00,25,'White lace top, woven, has a round neck, short sleeves, has knitted lining attached','product3.jpg',1,18,1,1,1),(4,'Black Blouse Versace',143.00,30,'White lace top, woven, has a round neck, short sleeves, has knitted lining attached','product3.jpg',1,18,1,1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `idprofile` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprofile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_option`
--

DROP TABLE IF EXISTS `profile_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_option` (
  `idprofileoption` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT NULL,
  `idprofile` int(11) NOT NULL,
  `idoption` int(11) NOT NULL,
  PRIMARY KEY (`idprofileoption`),
  KEY `fk_profileoption_profile_idx` (`idprofile`),
  KEY `fk_profileoption_option_idx` (`idoption`),
  CONSTRAINT `fk_profileoption_option` FOREIGN KEY (`idoption`) REFERENCES `option` (`idoption`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profileoption_profile` FOREIGN KEY (`idprofile`) REFERENCES `profile` (`idprofile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_option`
--

LOCK TABLES `profile_option` WRITE;
/*!40000 ALTER TABLE `profile_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submodule`
--

DROP TABLE IF EXISTS `submodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submodule` (
  `idsubmodule` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `idmodule` int(11) NOT NULL,
  PRIMARY KEY (`idsubmodule`),
  KEY `fk_submodule_module_idx` (`idmodule`),
  CONSTRAINT `fk_submodule_module` FOREIGN KEY (`idmodule`) REFERENCES `module` (`idmodule`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submodule`
--

LOCK TABLES `submodule` WRITE;
/*!40000 ALTER TABLE `submodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `submodule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



