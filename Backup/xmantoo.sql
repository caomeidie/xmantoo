/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.17 : Database - xmantoo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xmantoo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xmantoo`;

/*Table structure for table `xman_admin` */

DROP TABLE IF EXISTS `xman_admin`;

CREATE TABLE `xman_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `xman_admin` */

insert  into `xman_admin`(`id`,`admin_name`,`password`,`add_time`) values (1,'admin','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
