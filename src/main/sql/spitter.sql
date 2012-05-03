-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.62-0ubuntu0.11.10.1


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema SPITTER
--

CREATE DATABASE IF NOT EXISTS SPITTER;
USE SPITTER;

--
-- Definition of table `SPITTER`.`FOLLOWING_RELATION`
--

DROP TABLE IF EXISTS `SPITTER`.`FOLLOWING_RELATION`;
CREATE TABLE  `SPITTER`.`FOLLOWING_RELATION` (
  `FOLLOWER_ID` bigint(20) unsigned NOT NULL,
  `FOLLOWED_ID` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `FOLLOWER_ID` (`FOLLOWER_ID`,`FOLLOWED_ID`),
  KEY `followed_id_fk` (`FOLLOWED_ID`),
  CONSTRAINT `followed_id_fk` FOREIGN KEY (`FOLLOWED_ID`) REFERENCES `USER` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follower_id_fk` FOREIGN KEY (`FOLLOWER_ID`) REFERENCES `USER` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SPITTER`.`FOLLOWING_RELATION`
--

/*!40000 ALTER TABLE `FOLLOWING_RELATION` DISABLE KEYS */;
LOCK TABLES `FOLLOWING_RELATION` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `FOLLOWING_RELATION` ENABLE KEYS */;


--
-- Definition of table `SPITTER`.`TWEET`
--

DROP TABLE IF EXISTS `SPITTER`.`TWEET`;
CREATE TABLE  `SPITTER`.`TWEET` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) unsigned NOT NULL,
  `TWEET_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TEXT` varchar(140) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_user` (`USER_ID`),
  CONSTRAINT `fk_user` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SPITTER`.`TWEET`
--

/*!40000 ALTER TABLE `TWEET` DISABLE KEYS */;
LOCK TABLES `TWEET` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `TWEET` ENABLE KEYS */;


--
-- Definition of table `SPITTER`.`USER`
--

DROP TABLE IF EXISTS `SPITTER`.`USER`;
CREATE TABLE  `SPITTER`.`USER` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NICKNAME` varchar(100) NOT NULL,
  `FIRSTNAME` varchar(100) DEFAULT NULL,
  `LASTNAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `UPDATE_BY_EMAIL` tinyint(1) NOT NULL,
  `USER_PIC` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_nickname` (`NICKNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SPITTER`.`USER`
--

/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
LOCK TABLES `USER` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;


--
-- Definition of table `SPITTER`.`USER_ROLES`
--

DROP TABLE IF EXISTS `SPITTER`.`USER_ROLES`;
CREATE TABLE  `SPITTER`.`USER_ROLES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `authority` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_constraint` (`user_id`),
  CONSTRAINT `fk_user_constraint` FOREIGN KEY (`user_id`) REFERENCES `USER` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SPITTER`.`USER_ROLES`
--

/*!40000 ALTER TABLE `USER_ROLES` DISABLE KEYS */;
LOCK TABLES `USER_ROLES` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `USER_ROLES` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;