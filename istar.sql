/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : localhost
 Source Database       : istar

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : utf-8

 Date: 01/11/2016 13:59:50 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cmsession`
-- ----------------------------
DROP TABLE IF EXISTS `cmsession`;
CREATE TABLE `cmsession` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `session_title` text NOT NULL,
  `duration` int(10) DEFAULT NULL,
  `module_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `module_id` (`module_id`),
  KEY `FKcmsession529099` (`module_id`),
  CONSTRAINT `FKcmsession529099` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `image`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `image`
-- ----------------------------
BEGIN;
INSERT INTO `image` VALUES ('1', 'Picture1.png', 'This is a sample descirption.', 'upload?getfile=Picture1.png', null, null), ('2', 'Image5.jpg', 'This is a sample descirption.', 'upload?getfile=Image5.jpg', null, null), ('3', 'Screen Shot 2015-12-22 at 1.28.55 PM.png', 'This is a sample descirption.', 'upload?getfile=Screen Shot 2015-12-22 at 1.28.55 PM.png', null, null), ('4', 'Screen Shot 2015-12-22 at 2.01.33 PM.png', 'This is a sample descirption.', 'upload?getfile=Screen Shot 2015-12-22 at 2.01.33 PM.png', null, null), ('5', 'TITLE.vm.png', 'This is a sample descirption.', 'upload?getfile=TITLE.vm.png', null, null), ('6', 'Unknown.jpg', 'This is a sample descirption.', 'upload?getfile=Unknown.jpg', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `lesson`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lesson_cmsession`
-- ----------------------------
DROP TABLE IF EXISTS `lesson_cmsession`;
CREATE TABLE `lesson_cmsession` (
  `lessonid` int(11) NOT NULL,
  `cmsessionid` int(10) NOT NULL,
  PRIMARY KEY (`lessonid`,`cmsessionid`),
  KEY `FKlesson_cms408267` (`lessonid`),
  KEY `FKlesson_cms319834` (`cmsessionid`),
  CONSTRAINT `FKlesson_cms319834` FOREIGN KEY (`cmsessionid`) REFERENCES `cmsession` (`id`),
  CONSTRAINT `FKlesson_cms408267` FOREIGN KEY (`lessonid`) REFERENCES `lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `skill`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `skill_image`
-- ----------------------------
DROP TABLE IF EXISTS `skill_image`;
CREATE TABLE `skill_image` (
  `skillid` int(11) NOT NULL,
  `imageid` int(10) NOT NULL,
  PRIMARY KEY (`skillid`,`imageid`),
  KEY `FKskill_imag767905` (`skillid`),
  KEY `FKskill_imag196417` (`imageid`),
  CONSTRAINT `FKskill_imag196417` FOREIGN KEY (`imageid`) REFERENCES `image` (`id`),
  CONSTRAINT `FKskill_imag767905` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `skill_lesson`
-- ----------------------------
DROP TABLE IF EXISTS `skill_lesson`;
CREATE TABLE `skill_lesson` (
  `skillid` int(11) NOT NULL,
  `lessonid` int(11) NOT NULL,
  PRIMARY KEY (`skillid`,`lessonid`),
  KEY `FKskill_less786659` (`skillid`),
  KEY `FKskill_less749638` (`lessonid`),
  CONSTRAINT `FKskill_less749638` FOREIGN KEY (`lessonid`) REFERENCES `lesson` (`id`),
  CONSTRAINT `FKskill_less786659` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `skill_skillgroup`
-- ----------------------------
DROP TABLE IF EXISTS `skill_skillgroup`;
CREATE TABLE `skill_skillgroup` (
  `skillid` int(11) NOT NULL,
  `skillgroupid` int(10) NOT NULL,
  PRIMARY KEY (`skillid`,`skillgroupid`),
  KEY `FKskill_skil336244` (`skillid`),
  KEY `FKskill_skil190973` (`skillgroupid`),
  CONSTRAINT `FKskill_skil190973` FOREIGN KEY (`skillgroupid`) REFERENCES `skillgroup` (`id`),
  CONSTRAINT `FKskill_skil336244` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `skill_video`
-- ----------------------------
DROP TABLE IF EXISTS `skill_video`;
CREATE TABLE `skill_video` (
  `skillid` int(11) NOT NULL,
  `videoid` int(11) NOT NULL,
  PRIMARY KEY (`skillid`,`videoid`),
  KEY `FKskill_vide657357` (`skillid`),
  KEY `FKskill_vide176186` (`videoid`),
  CONSTRAINT `FKskill_vide176186` FOREIGN KEY (`videoid`) REFERENCES `video` (`id`),
  CONSTRAINT `FKskill_vide657357` FOREIGN KEY (`skillid`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `skillgroup`
-- ----------------------------
DROP TABLE IF EXISTS `skillgroup`;
CREATE TABLE `skillgroup` (
  `name` int(11) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `super_skills`
-- ----------------------------
DROP TABLE IF EXISTS `super_skills`;
CREATE TABLE `super_skills` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `super_skills`
-- ----------------------------
BEGIN;
INSERT INTO `super_skills` VALUES ('12', 'Biology'), ('3', 'Chemistry'), ('13', 'india'), ('2', 'Maths'), ('1', 'Risk');
COMMIT;

-- ----------------------------
--  Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `title` varchar(255) DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
