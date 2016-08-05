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

insert  into `xman_admin`(`id`,`admin_name`,`password`,`add_time`) values (1,'admin','7c4a8d09ca3762af61e59520943dc26494f8941b',0);

/*Table structure for table `xman_cuisine` */

DROP TABLE IF EXISTS `xman_cuisine`;

CREATE TABLE `xman_cuisine` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL COMMENT '菜系名称',
  `cstyle` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '所属三大菜系：1中国菜，2法国菜，3土耳其菜',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `xman_cuisine` */

insert  into `xman_cuisine`(`id`,`cname`,`cstyle`,`add_time`) values (1,'粤菜',1,1468249152),(2,'川菜',1,1468249306),(3,'鲁菜',1,1468249427),(4,'淮扬菜',1,1468249506),(5,'浙菜',1,1468249514),(6,'闽菜',1,1468249520),(7,'湘菜',1,1468249525),(8,'徽菜',1,1468249531),(9,'东北菜',1,1468249537),(10,'赣菜',1,1468249551),(11,'冀菜',1,1468249557),(12,'豫菜',1,1468249565),(13,'鄂菜',1,1468249569),(14,'本帮菜',1,1468249574),(15,'客家菜',1,1468249578),(16,'京菜',1,1468249586),(17,'清真菜',1,1468249592);

/*Table structure for table `xman_foods` */

DROP TABLE IF EXISTS `xman_foods`;

CREATE TABLE `xman_foods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `foods_name` varchar(100) NOT NULL COMMENT '菜品名称',
  `cuisines_id` int(11) unsigned NOT NULL COMMENT '菜系id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1正常，0关闭',
  `cover` varchar(255) NOT NULL COMMENT '主图',
  `content` text NOT NULL COMMENT '菜品详情',
  `store_condition` varchar(255) DEFAULT NULL COMMENT '存储条件',
  `store_time` float DEFAULT NULL COMMENT '存储时间(时)',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `xman_foods` */

/*Table structure for table `xman_foods_ext` */

DROP TABLE IF EXISTS `xman_foods_ext`;

CREATE TABLE `xman_foods_ext` (
  `foods_id` int(11) unsigned NOT NULL COMMENT '菜品id',
  `tools` varchar(255) NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `accessory` varchar(255) DEFAULT NULL,
  `pretreatment` varchar(255) DEFAULT NULL,
  `steps` varchar(255) NOT NULL,
  PRIMARY KEY (`foods_id`),
  UNIQUE KEY `PRIVATE` (`foods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `xman_foods_ext` */

insert  into `xman_foods_ext`(`foods_id`,`tools`,`ingredient`,`accessory`,`pretreatment`,`steps`) values (1,'[\"\\u9505\",\"\\u94f2\",\"\\u5200\"]','[\"\\u897f\\u74dc\\u76ae\"]','[\"\\u918b\",\"\\u8fa3\\u6912\",\"\\u6cb9\"]','将西瓜皮洗净，削去硬皮，切成西瓜皮片。','[{\"time\":\"10\",\"step\":\"\\u5c06\\u6c34\\u70e7\\u5f00\\uff0c\\u653e\\u5165\\u897f\\u74dc\\u76ae\\u7247\\uff0c\\u5f85\\u6c34\\u518d\\u5f00\\u65f6\\u635e\\u51fa\\u897f\\u74dc\\u76ae\\u3002\"},{\"time\":\"10\",\"step\":\"\\u9505\\u4e2d\\u653e\\u690d\\u7269\\u6cb9\\u70e7\\u70ed\\uff0c\\u5148\\u7092\\u847');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
