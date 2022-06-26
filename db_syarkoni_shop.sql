/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.19-MariaDB : Database - syarkoni_kendaraan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`syarkoni_kendaraan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `syarkoni_kendaraan`;

/*Table structure for table `jenis` */

DROP TABLE IF EXISTS `jenis`;

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `jenis` */

insert  into `jenis`(`id_jenis`,`nama_jenis`,`status`) values 
(1,'Bebek','aktif'),
(2,'Matik','aktif');

/*Table structure for table `kendaraan` */

DROP TABLE IF EXISTS `kendaraan`;

CREATE TABLE `kendaraan` (
  `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kendaraan` varchar(64) DEFAULT NULL,
  `aktif` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_kendaraan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kendaraan` */

insert  into `kendaraan`(`id_kendaraan`,`nama_kendaraan`,`aktif`) values 
(1,'Motor','1'),
(2,'Mobil','2');

/*Table structure for table `mesin` */

DROP TABLE IF EXISTS `mesin`;

CREATE TABLE `mesin` (
  `id_mesin` int(11) NOT NULL AUTO_INCREMENT,
  `nama_mesin` varchar(64) DEFAULT NULL,
  `kendaraan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mesin`),
  KEY `fk_kendaraan_id` (`kendaraan_id`),
  CONSTRAINT `fk_kendaraan_id` FOREIGN KEY (`kendaraan_id`) REFERENCES `kendaraan` (`id_kendaraan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mesin` */

insert  into `mesin`(`id_mesin`,`nama_mesin`,`kendaraan_id`) values 
(1,'Jepang',1),
(2,'China',2);

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nama_type` varchar(64) DEFAULT NULL,
  `mesin_id` int(11) DEFAULT NULL,
  `jenis_id` int(11) DEFAULT NULL,
  `kendaraan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_type`),
  KEY `fk_id_mesin` (`mesin_id`),
  KEY `fk_id_jenis` (`jenis_id`),
  KEY `fk_id_kendaraan` (`kendaraan_id`),
  CONSTRAINT `fk_id_jenis` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`id_jenis`),
  CONSTRAINT `fk_id_kendaraan` FOREIGN KEY (`kendaraan_id`) REFERENCES `kendaraan` (`id_kendaraan`),
  CONSTRAINT `fk_id_mesin` FOREIGN KEY (`mesin_id`) REFERENCES `mesin` (`id_mesin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `type` */

insert  into `type`(`id_type`,`nama_type`,`mesin_id`,`jenis_id`,`kendaraan_id`) values 
(1,'123s',1,1,2),
(2,'321h',1,1,2),
(3,'232i',2,2,2),
(4,'uer2',2,2,1),
(5,'231h',2,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
