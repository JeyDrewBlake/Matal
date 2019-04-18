-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: metal
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `izdelie`
--

DROP TABLE IF EXISTS `izdelie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = UTF8 ;
CREATE TABLE `izdelie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name_izdel` varchar(100) CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_bin COMMENT='Какое изделие было изготовлено из металла';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izdelie`
--

LOCK TABLES `izdelie` WRITE;
/*!40000 ALTER TABLE `izdelie` DISABLE KEYS */;
INSERT INTO `izdelie` VALUES (10,'458'),(11,'Ключ'),(12,'Гринт'),(13,'Гиря'),(15,'Скоростной переключатель'),(16,'Кирази');
/*!40000 ALTER TABLE `izdelie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `izgotovitel`
--

DROP TABLE IF EXISTS `izgotovitel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = UTF8 ;
CREATE TABLE `izgotovitel` (
  `№_prod` int(11) NOT NULL AUTO_INCREMENT,
  `Surname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Patronymic` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(50) NOT NULL,
  PRIMARY KEY (`№_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Изготовитель';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izgotovitel`
--

LOCK TABLES `izgotovitel` WRITE;
/*!40000 ALTER TABLE `izgotovitel` DISABLE KEYS */;
INSERT INTO `izgotovitel` VALUES (2,'Иванов','Иван','Иванович','89655230512'),(3,'Привненко','Колл','Вертовин','+79504851236'),(4,'Игнатов','Ироль','Карилович','589-958');
/*!40000 ALTER TABLE `izgotovitel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klas_met`
--

DROP TABLE IF EXISTS `klas_met`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `klas_met` (
  ` ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name_klas` varchar(100) CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI NOT NULL,
  PRIMARY KEY (` ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Классификация металла';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klas_met`
--

LOCK TABLES `klas_met` WRITE;
/*!40000 ALTER TABLE `klas_met` DISABLE KEYS */;
INSERT INTO `klas_met` VALUES (2,'45'),(3,'кдс/85'),(4,'456'),(5,'М3'),(8,'hbk'),(9,'Сплав'),(10,'Чугун'),(11,'Цветной'),(13,'Каргон'),(14,'Каргон48');
/*!40000 ALTER TABLE `klas_met` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakazchik`
--

DROP TABLE IF EXISTS `zakazchik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = UTF8 ;
CREATE TABLE `zakazchik` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Surname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Patronymic` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Phone` varchar(12) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Заказчик';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakazchik`
--

LOCK TABLES `zakazchik` WRITE;
/*!40000 ALTER TABLE `zakazchik` DISABLE KEYS */;
INSERT INTO `zakazchik` VALUES (1,'Ерольненко','Ежик','Кирувонич','Пушкина 48-950','+78526548569'),(2,'Фарутич','Орг','Лироевич','Климовская 15-85','89508456895');
/*!40000 ALTER TABLE `zakazchik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zkaz`
--

DROP TABLE IF EXISTS `zkaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = UTF8 ;
CREATE TABLE `zkaz` (
  `№_order` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Producer` int(11) NOT NULL,
  `Client` int(11) NOT NULL,
  `Name_izdel` int(11) NOT NULL,
  `Name_klas` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`№_order`),
  KEY `FK_zkaz_izgotovitel` (`Producer`),
  KEY `FK_zkaz_zakazchik` (`Client`),
  KEY `FK_zkaz_izdelie` (`Name_izdel`),
  KEY `FK_zkaz_klas_met` (`Name_klas`),
  CONSTRAINT `FK_zkaz_izdelie` FOREIGN KEY (`Name_izdel`) REFERENCES `izdelie` (`ID`),
  CONSTRAINT `FK_zkaz_izgotovitel` FOREIGN KEY (`Producer`) REFERENCES `izgotovitel` (`№_prod`),
  CONSTRAINT `FK_zkaz_klas_met` FOREIGN KEY (`Name_klas`) REFERENCES `klas_met` (` ID`),
  CONSTRAINT `FK_zkaz_zakazchik` FOREIGN KEY (`Client`) REFERENCES `zakazchik` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zkaz`
--

LOCK TABLES `zkaz` WRITE;
/*!40000 ALTER TABLE `zkaz` DISABLE KEYS */;
INSERT INTO `zkaz` VALUES (0,'2019-04-02',3,1,10,2,15,485),(1,'2019-04-02',3,1,10,2,15,485),(2,'2019-04-02',4,2,10,4,48,1500),(3,'2019-04-02',3,1,10,2,15,485),(4,'2019-04-02',3,1,10,2,15,485);
/*!40000 ALTER TABLE `zkaz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `заказчики`
--

DROP TABLE IF EXISTS `заказчики`;
/*!50001 DROP VIEW IF EXISTS `заказчики`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = UTF8;
/*!50001 CREATE VIEW `заказчики` AS SELECT 
 1 AS `Фамилия`,
 1 AS `Имя`,
 1 AS `Отчество`,
 1 AS `Адрес`,
 1 AS `Телефон`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `заказы`
--

DROP TABLE IF EXISTS `заказы`;
/*!50001 DROP VIEW IF EXISTS `заказы`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = UTF8;
/*!50001 CREATE VIEW `заказы` AS SELECT 
 1 AS `Номер заказа`,
 1 AS `Дата`,
 1 AS `Фамилия `,
 1 AS `Имя `,
 1 AS `Отчество `,
 1 AS `Телефон `,
 1 AS `Фамилия`,
 1 AS `Имя`,
 1 AS `Отчество`,
 1 AS `Адрес`,
 1 AS `Телефон`,
 1 AS `Изделие`,
 1 AS `Материал`,
 1 AS `Кол-во`,
 1 AS `Цена`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `изготовители`
--

DROP TABLE IF EXISTS `изготовители`;
/*!50001 DROP VIEW IF EXISTS `изготовители`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = UTF8;
/*!50001 CREATE VIEW `изготовители` AS SELECT 
 1 AS `Фамилия`,
 1 AS `Имя`,
 1 AS `Отчество`,
 1 AS `Телефон`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'metal'
--

--
-- Dumping routines for database 'metal'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_izdelie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;met
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `add_izdelie`(nil varchar(100))
BEGIN
	IF
		(SELECT EXISTS (SELECT `izdelie`.`ID` FROM `izdelie` WHERE `izdelie`.`Name_izdel` = nil) = 0)
    THEN
		INSERT INTO `izdelie` (`Name_izdel`) VALUE (nil);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_metal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `add_metal`(nis varchar(100))
BEGIN
	IF
		(SELECT EXISTS (SELECT `klas_met`.` ID` FROM `klas_met` WHERE `klas_met`.`Name_klas` = nis) = 0)
    THEN
		INSERT INTO `klas_met` (`Name_klas`) VALUE (nis);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_zakaz` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `add_zakaz`(isn varchar(15), ine varchar(10), ipa varchar(10), ipe varchar(50), zsn varchar(15), zne varchar(10), zpa varchar(10), zad varchar(255), zpe varchar(12), nil varchar(100), nks varchar(100), zda date, zat int(11), zpr int(11))
BEGIN
#izgotovitel chek--------------------------------------------------------------------------------------------------------------------------------------------------------------
	IF
		(SELECT EXISTS (SELECT `izgotovitel`.`№_prod` FROM `izgotovitel` WHERE `izgotovitel`.`Surname` = isn and `izgotovitel`.`Name` = ine and `izgotovitel`.`Patronymic` = ipa and `izgotovitel`.`Phone` = ipe) = 0)
    THEN
		INSERT INTO `izgotovitel` (`Surname`, `Name`, `Patronymic`, `Phone`) VALUES (isn, ine, ipa, ipe);
    END IF;
#zakazchik chek---------------------------------------------------------------------------------------------------------------------------------------------------
    IF 
		(SELECT EXISTS (SELECT `zakazchik`.`ID` FROM `zakazchik` WHERE `zakazchik`.`Surname` = zsn and `zakazchik`.`Name` = zne and `zakazchik`.`Patronymic` = zpa and `zakazchik`.`Address` = zad and `zakazchik`.`Phone` = zpe) = 0)
    THEN
		INSERT INTO `zakazchik` (`Surname`, `Name`, `Patronymic`, `Address`, `Phone`) VALUE (zsn, zne, zpa, zad, zpe);
    END IF;
#id--------------------------------------------------------------------------------------------------------------------------------------------------------------  
	SET @id_izdelie = (SELECT `izdelie`.`ID` FROM `izdelie` WHERE `izdelie`.`Name_izdel` = nil);
    SET @id_klas_met = (SELECT `klas_met`.` ID` FROM `klas_met` WHERE `klas_met`.`Name_klas` = nks);
	SET @id_izgotovitel = (SELECT `izgotovitel`.`№_prod` FROM `izgotovitel` WHERE `izgotovitel`.`Surname` = isn and `izgotovitel`.`Name` = ine and `izgotovitel`.`Patronymic` = ipa and `izgotovitel`.`Phone` = ipe);
    SET @id_zakazchik = (SELECT `zakazchik`.`ID` FROM `zakazchik` WHERE `zakazchik`.`Surname` = zsn and `zakazchik`.`Name` = zne and `zakazchik`.`Patronymic` = zpa and `zakazchik`.`Address` = zad and `zakazchik`.`Phone` = zpe);    
#zakaz insert---------------------------------------------------------------------------------------------------------------------------------------------------
		INSERT INTO `zkaz` (`Date`, `Producer`, `Client`, `Name_izdel`, `Name_klas`, `Amount`, `Price`) VALUE (zda, @id_izgotovitel, @id_zakazchik, @id_izdelie, @id_klas_met, zat, zpr);    		  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `заказчики`
--

/*!50001 DROP VIEW IF EXISTS `заказчики`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `заказчики` AS select `zakazchik`.`Surname` AS `Фамилия`,`zakazchik`.`Name` AS `Имя`,`zakazchik`.`Patronymic` AS `Отчество`,`zakazchik`.`Address` AS `Адрес`,`zakazchik`.`Phone` AS `Телефон` from `zakazchik` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `заказы`
--

/*!50001 DROP VIEW IF EXISTS `заказы`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `заказы` AS select `zkaz`.`№_order` AS `Номер заказа`,`zkaz`.`Date` AS `Дата`,`izgotovitel`.`Surname` AS `Фамилия `,`izgotovitel`.`Name` AS `Имя `,`izgotovitel`.`Patronymic` AS `Отчество `,`izgotovitel`.`Phone` AS `Телефон `,`zakazchik`.`Surname` AS `Фамилия`,`zakazchik`.`Name` AS `Имя`,`zakazchik`.`Patronymic` AS `Отчество`,`zakazchik`.`Address` AS `Адрес`,`zakazchik`.`Phone` AS `Телефон`,`zkaz`.`Name_izdel` AS `Изделие`,`zkaz`.`Name_klas` AS `Материал`,`zkaz`.`Amount` AS `Кол-во`,`zkaz`.`Price` AS `Цена` from ((`zkaz` join `zakazchik`) join `izgotovitel`) where ((`zakazchik`.`ID` = `zkaz`.`Client`) and (`izgotovitel`.`№_prod` = `zkaz`.`Producer`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `изготовители`
--

/*!50001 DROP VIEW IF EXISTS `изготовители`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `изготовители` AS select `izgotovitel`.`Surname` AS `Фамилия`,`izgotovitel`.`Name` AS `Имя`,`izgotovitel`.`Patronymic` AS `Отчество`,`izgotovitel`.`Phone` AS `Телефон` from `izgotovitel` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-02 21:10:47
