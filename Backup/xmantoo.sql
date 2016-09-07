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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `xman_foods` */

insert  into `xman_foods`(`id`,`title`,`foods_name`,`cuisines_id`,`status`,`cover`,`content`,`store_condition`,`store_time`,`add_time`) values (3,'西红柿炒蛋','西红柿炒蛋',3,1,'20160907/57cfd3ba7ed2b.jpg','&lt;p&gt;这是西红柿炒蛋&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Upload/images/editor/20160907/1473237701121233.jpg&quot; title=&quot;1473237701121233.jpg&quot; alt=&quot;u=579466073,4029302782&amp;amp;fm=21&amp;amp;gp=0.jpg&quot;/&gt;&lt;/p&gt;','放冰箱冷藏',24,1473237946);

/*Table structure for table `xman_foods_ext` */

DROP TABLE IF EXISTS `xman_foods_ext`;

CREATE TABLE `xman_foods_ext` (
  `foods_id` int(11) unsigned NOT NULL COMMENT '菜品id',
  `tools` varchar(255) NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `accessory` varchar(255) DEFAULT NULL,
  `pretreatment` varchar(255) DEFAULT NULL,
  `steps` text NOT NULL,
  PRIMARY KEY (`foods_id`),
  UNIQUE KEY `PRIVATE` (`foods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `xman_foods_ext` */

insert  into `xman_foods_ext`(`foods_id`,`tools`,`ingredient`,`accessory`,`pretreatment`,`steps`) values (3,'[\"\\u9505\\uff0c\\u94f2\\u5b50\\uff0c\\u6253\\u86cb\\u5668\\uff0c\\u7897\"]','[\"\\u897f\\u7ea2\\u67ff\\uff0c\\u9e21\\u86cb\"]','[\"\\u6cb9\\uff0c\\u7cd6\\uff0c\\u76d0\"]','1.西红柿切块\r\n2.鸡蛋打成蛋液','[{\"time\":\"3\",\"step\":\"\\u70ed\\u9505\\uff0c\\u5012\\u6cb9\\uff0c\\u70e7\\u81f35\\u6210\\u70ed\",\"step_cover\":\"20160907\\/57cfd3ba8e72f.jpg\"},{\"time\":\"5\",\"step\":\"\\u5012\\u5165\\u86cb\\u6db2\\uff0c\\u714e\\u86cb\\uff0c\\u5e76\\u628a\\u86cb\\u94f2\\u788e\",\"step_cover\":\"20160907\\/57c');

/* Procedure structure for procedure `p_get_foods_details` */

/*!50003 DROP PROCEDURE IF EXISTS  `p_get_foods_details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `p_get_foods_details`(IN cond INT)
BEGIN
	IF cond > 0 THEN
	    SELECT f.*, fe.tools, fe.ingredient, fe.accessory, fe.pretreatment, fe.steps FROM xman_foods f LEFT JOIN xman_foods_ext fe ON f.id = fe.foods_id WHERE f.id = cond;
	ELSE
	    SELECT f.*, fe.tools, fe.ingredient, fe.accessory, fe.pretreatment, fe.steps FROM xman_foods f LEFT JOIN xman_foods_ext fe ON f.id = fe.foods_id;
	END IF;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
