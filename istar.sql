/*
SQLyog Trial v12.18 (64 bit)
MySQL - 5.7.10-log : Database - istar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`istar` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `istar`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pincode` int(10) DEFAULT NULL,
  `addressLine1` text,
  `addressLine2` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`id`,`pincode`,`addressLine1`,`addressLine2`,`city`,`state`,`country`) values 
(1,435,'jhgfjhqnhgf','ngfhgf','gfedhg','nhgf','gfnhg');

/*Table structure for table `assessment_options` */

DROP TABLE IF EXISTS `assessment_options`;

CREATE TABLE `assessment_options` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `text` text,
  `marking_scheme` varchar(255) DEFAULT NULL,
  `question_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKassessment628385` (`question_id`),
  CONSTRAINT `FKassessment628385` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `assessment_options` */

/*Table structure for table `assessment_set` */

DROP TABLE IF EXISTS `assessment_set`;

CREATE TABLE `assessment_set` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `assessment_set` */

/*Table structure for table `cmsession` */

DROP TABLE IF EXISTS `cmsession`;

CREATE TABLE `cmsession` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `session_title` text NOT NULL,
  `duration` int(10) DEFAULT NULL,
  `module_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `module_id` (`module_id`),
  KEY `FKcmsession529099` (`module_id`),
  CONSTRAINT `FKcmsession529099` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cmsession` */

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `url` text,
  `thumbnail_url` text,
  `delete_url` text,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `image` */

/*Table structure for table `lesson` */

DROP TABLE IF EXISTS `lesson`;

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_text` text,
  `tags` text,
  `duration` int(10) DEFAULT NULL COMMENT 'The duration in minuts.',
  `title` varchar(255) DEFAULT NULL,
  `lesson_description` text,
  `lesson_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lesson` */

/*Table structure for table `lesson_cmsession` */

DROP TABLE IF EXISTS `lesson_cmsession`;

CREATE TABLE `lesson_cmsession` (
  `lessonid` int(11) NOT NULL,
  `cmsessionid` int(10) NOT NULL,
  PRIMARY KEY (`lessonid`,`cmsessionid`),
  KEY `FKlesson_cms408267` (`lessonid`),
  KEY `FKlesson_cms319834` (`cmsessionid`),
  CONSTRAINT `FKlesson_cms319834` FOREIGN KEY (`cmsessionid`) REFERENCES `cmsession` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKlesson_cms408267` FOREIGN KEY (`lessonid`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lesson_cmsession` */

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `module` */

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKorganizati290276` (`address_id`),
  CONSTRAINT `FKorganizati290276` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `organization` */

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` text,
  `assessment_set_id` int(10) NOT NULL,
  `question_type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKquestion637692` (`assessment_set_id`),
  CONSTRAINT `FKquestion637692` FOREIGN KEY (`assessment_set_id`) REFERENCES `assessment_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `question` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `role_users` */

DROP TABLE IF EXISTS `role_users`;

CREATE TABLE `role_users` (
  `roleid` int(10) NOT NULL,
  `usersid` int(10) NOT NULL,
  PRIMARY KEY (`roleid`,`usersid`),
  KEY `FKrole_users271275` (`roleid`),
  KEY `FKrole_users646213` (`usersid`),
  CONSTRAINT `FKrole_users271275` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `FKrole_users646213` FOREIGN KEY (`usersid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_users` */

/*Table structure for table `skill` */

DROP TABLE IF EXISTS `skill`;

CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) NOT NULL,
  `skill_council_name` varchar(255) DEFAULT NULL,
  `super_skill_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_name` (`skill_name`),
  KEY `FKskill130192` (`super_skill_id`),
  CONSTRAINT `FKskill130192` FOREIGN KEY (`super_skill_id`) REFERENCES `super_skills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill` */

/*Table structure for table `skill_assesmet_set` */

DROP TABLE IF EXISTS `skill_assesmet_set`;

CREATE TABLE `skill_assesmet_set` (
  `skillid` int(11) NOT NULL,
  `assesmet_setid` int(10) NOT NULL,
  PRIMARY KEY (`skillid`,`assesmet_setid`),
  KEY `FKskill_asse397179` (`skillid`),
  KEY `FKskill_asse432871` (`assesmet_setid`),
  CONSTRAINT `FKskill_asse397179` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`),
  CONSTRAINT `FKskill_asse432871` FOREIGN KEY (`assesmet_setid`) REFERENCES `assessment_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill_assesmet_set` */

/*Table structure for table `skill_image` */

DROP TABLE IF EXISTS `skill_image`;

CREATE TABLE `skill_image` (
  `skillid` int(11) NOT NULL,
  `imageid` int(10) NOT NULL,
  PRIMARY KEY (`skillid`,`imageid`),
  KEY `FKskill_imag767905` (`skillid`),
  KEY `FKskill_imag196417` (`imageid`),
  CONSTRAINT `FKskill_imag196417` FOREIGN KEY (`imageid`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKskill_imag767905` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill_image` */

/*Table structure for table `skill_lesson` */

DROP TABLE IF EXISTS `skill_lesson`;

CREATE TABLE `skill_lesson` (
  `skillid` int(11) NOT NULL,
  `lessonid` int(11) NOT NULL,
  PRIMARY KEY (`skillid`,`lessonid`),
  KEY `FKskill_less786659` (`skillid`),
  KEY `FKskill_less749638` (`lessonid`),
  CONSTRAINT `FKskill_less749638` FOREIGN KEY (`lessonid`) REFERENCES `lesson` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKskill_less786659` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill_lesson` */

/*Table structure for table `skill_skillgroup` */

DROP TABLE IF EXISTS `skill_skillgroup`;

CREATE TABLE `skill_skillgroup` (
  `skillid` int(11) NOT NULL,
  `skillgroupid` int(10) NOT NULL,
  PRIMARY KEY (`skillid`,`skillgroupid`),
  KEY `FKskill_skil336244` (`skillid`),
  KEY `FKskill_skil190973` (`skillgroupid`),
  CONSTRAINT `FKskill_skil190973` FOREIGN KEY (`skillgroupid`) REFERENCES `skillgroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKskill_skil336244` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill_skillgroup` */

/*Table structure for table `skill_video` */

DROP TABLE IF EXISTS `skill_video`;

CREATE TABLE `skill_video` (
  `skillid` int(11) NOT NULL,
  `videoid` int(11) NOT NULL,
  PRIMARY KEY (`skillid`,`videoid`),
  KEY `FKskill_vide657357` (`skillid`),
  KEY `FKskill_vide176186` (`videoid`),
  CONSTRAINT `FKskill_vide176186` FOREIGN KEY (`videoid`) REFERENCES `video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKskill_vide657357` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill_video` */

/*Table structure for table `skillgroup` */

DROP TABLE IF EXISTS `skillgroup`;

CREATE TABLE `skillgroup` (
  `name` int(11) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skillgroup` */

/*Table structure for table `super_skills` */

DROP TABLE IF EXISTS `super_skills`;

CREATE TABLE `super_skills` (
  `title` varchar(255) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `super_skills` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKusers945549` (`address_id`),
  CONSTRAINT `FKusers945549` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`gender`,`age`,`password`,`address_id`) values 
(1,'nhgd','nhgfmhgf','hgdng',54354,'bvcb vc',1);

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `title` varchar(255) DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `video` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
