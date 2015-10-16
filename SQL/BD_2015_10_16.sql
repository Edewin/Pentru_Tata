-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: membri
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `acte_cult`
--

DROP TABLE IF EXISTS `acte_cult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acte_cult` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Fisa` int(11) NOT NULL,
  `Act_cult` varchar(45) DEFAULT NULL,
  `X` bit(1) DEFAULT NULL,
  `Data_efectuarii` date DEFAULT NULL,
  `Biserica` varchar(45) DEFAULT NULL,
  `Pastor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Fise_idx` (`ID_Fisa`),
  CONSTRAINT `ID_Fisa_acte_clt` FOREIGN KEY (`ID_Fisa`) REFERENCES `fise` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acte_cult`
--

LOCK TABLES `acte_cult` WRITE;
/*!40000 ALTER TABLE `acte_cult` DISABLE KEYS */;
INSERT INTO `acte_cult` VALUES (1,1,'Binecuvatare','','1990-12-19','Betleem Dorohoi','Ionel Pintilie'),(2,1,'Botezul in apa','','2007-12-19','Betleem Dorohoi','Marcel Gradinaru'),(3,1,'Casatoria','','2014-06-28','Mlenauti','Aurel Soltuzu'),(4,1,'Ordinare','\0',NULL,NULL,NULL),(5,1,'Inmormantare','\0',NULL,NULL,NULL);
/*!40000 ALTER TABLE `acte_cult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copii`
--

DROP TABLE IF EXISTS `copii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `copii` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Date_familie` int(11) NOT NULL,
  `Nume` varchar(45) DEFAULT NULL,
  `Prenume` varchar(45) DEFAULT NULL,
  `Data_nastere` date DEFAULT NULL,
  `Data_binecuvantare` date DEFAULT NULL,
  `Data_botez_apa` date DEFAULT NULL,
  `Stare_Civila` varchar(45) DEFAULT NULL,
  `Nr_Fisa_personala` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_date_fam_idx` (`ID_Date_familie`),
  CONSTRAINT `ID_date_fam` FOREIGN KEY (`ID_Date_familie`) REFERENCES `date_familie` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copii`
--

LOCK TABLES `copii` WRITE;
/*!40000 ALTER TABLE `copii` DISABLE KEYS */;
/*!40000 ALTER TABLE `copii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_familie`
--

DROP TABLE IF EXISTS `date_familie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_familie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Fisa` int(11) NOT NULL,
  `Sot_sotie` varchar(65) DEFAULT NULL,
  `Data_nasterii` date DEFAULT NULL,
  `Localitate` varchar(45) DEFAULT NULL,
  `Religia` varchar(55) DEFAULT NULL,
  `Nr_fisa_personala` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Fisa_idx` (`ID_Fisa`),
  CONSTRAINT `ID_Fisa_date_fam` FOREIGN KEY (`ID_Fisa`) REFERENCES `fise` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_familie`
--

LOCK TABLES `date_familie` WRITE;
/*!40000 ALTER TABLE `date_familie` DISABLE KEYS */;
/*!40000 ALTER TABLE `date_familie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fise`
--

DROP TABLE IF EXISTS `fise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fise` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `numar` int(11) DEFAULT NULL,
  `data_inscrierii` date DEFAULT NULL,
  `nume` varchar(25) NOT NULL,
  `prenume` varchar(45) NOT NULL,
  `domiciliul` varchar(60) DEFAULT NULL,
  `studii` varchar(25) DEFAULT NULL,
  `calitatea` varchar(30) DEFAULT NULL,
  `mod_primire` varchar(30) DEFAULT NULL,
  `data_primire` date DEFAULT NULL,
  `detalii_primire` varchar(55) DEFAULT NULL,
  `mod_iesire` varchar(30) DEFAULT NULL,
  `data_iesire` date DEFAULT NULL,
  `detalii_iesire` varchar(55) DEFAULT NULL,
  `data_nasterii` date DEFAULT NULL,
  `locul_nasterii` varchar(45) DEFAULT NULL,
  `cnp` char(13) DEFAULT NULL,
  `nume_tata` varchar(65) DEFAULT NULL,
  `nume_mama` varchar(65) DEFAULT NULL,
  `nationatalitate` varchar(45) DEFAULT NULL,
  `stare_la_inscriere` varchar(45) DEFAULT NULL,
  `explicatii_stare_la_inscriere` varchar(85) DEFAULT NULL,
  `stare_dupa_inscriere` varchar(45) DEFAULT NULL,
  `explicatii_stare_dupa_inscriere` varchar(85) DEFAULT NULL,
  `nr_telefon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fise`
--

LOCK TABLES `fise` WRITE;
/*!40000 ALTER TABLE `fise` DISABLE KEYS */;
INSERT INTO `fise` VALUES (1,123,NULL,'Soltuzu','Eduard','Dorohoi','inginer','membru',NULL,'1990-12-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,'Soltuzu','Andreea','Iasi',NULL,'pastorita',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,'Popescu','Ion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,'2014-12-01','Marin','Preda','Pocreaca',NULL,NULL,NULL,'2000-04-21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,32,NULL,'Anton','Lupan','Lidl','repetent','marketing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,43,'2014-09-14','Testuletz','Ion','Luna','fizica','visator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `fise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','1159189700'),(2,'aurel','test');
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

-- Dump completed on 2015-10-16  7:41:24
