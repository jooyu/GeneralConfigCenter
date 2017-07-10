/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.44_3317
Source Server Version : 50505
Source Host           : 192.168.2.44:3317
Source Database       : general_config_center

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-10 17:45:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_ranklist`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ranklist`;
CREATE TABLE `tb_ranklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) DEFAULT NULL,
  `expire_type` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `extend` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `leaderboardid` int(11) DEFAULT NULL,
  `limit_rows` int(11) DEFAULT NULL,
  `mysql_config` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `redis_config` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `score_partion` int(11) DEFAULT NULL,
  `sort_rule` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- ----------------------------
-- Records of tb_ranklist
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `is_hide` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `source_key` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `source_url` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf5ra2gn0xedeida2op8097sr5` (`parent_id`),
  CONSTRAINT `FKf5ra2gn0xedeida2op8097sr5` FOREIGN KEY (`parent_id`) REFERENCES `tb_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES ('1', '2017-01-10 13:56:51', '用户管理', null, '0', '2', '用户管理', '1', 'system:user:index', '/admin/user/index', '1', '2017-01-10 13:59:01', null);
INSERT INTO `tb_resource` VALUES ('2', '2017-01-10 13:56:51', '用户编辑', null, '0', '3', '用户编辑', '1', 'system:user:edit', '/admin/user/edit*', '2', '2017-01-10 16:26:42', '1');
INSERT INTO `tb_resource` VALUES ('3', '2017-01-11 16:48:48', '用户添加', null, '0', '3', '用户添加', '2', 'system:user:add', '/admin/user/add', '2', '2017-01-11 16:49:26', '1');
INSERT INTO `tb_resource` VALUES ('4', '2017-01-11 16:48:48', '用户删除', null, '0', '3', '用户删除', '3', 'system:user:deleteBatch', '/admin/user/deleteBatch', '2', '2017-01-18 14:11:41', '1');
INSERT INTO `tb_resource` VALUES ('5', '2017-01-11 16:48:48', '角色分配', null, '0', '3', '角色分配', '4', 'system:user:grant', '/admin/user/grant/**', '2', '2017-01-18 14:11:51', '1');
INSERT INTO `tb_resource` VALUES ('6', '2017-01-12 16:45:10', '角色管理', null, '0', '2', '角色管理', '2', 'system:role:index', '/admin/role/index', '1', '2017-01-12 16:46:52', null);
INSERT INTO `tb_resource` VALUES ('7', '2017-01-12 16:47:02', '角色编辑', null, '0', '3', '角色编辑', '1', 'system:role:edit', '/admin/role/edit*', '2', '2017-01-18 10:24:06', '1');
INSERT INTO `tb_resource` VALUES ('8', '2017-01-12 16:47:23', '角色添加', null, '0', '3', '角色添加', '2', 'system:role:add', '/admin/role/add', '2', '2017-01-12 16:49:16', '6');
INSERT INTO `tb_resource` VALUES ('9', '2017-01-12 16:47:23', '角色删除', null, '0', '3', '角色删除', '3', 'system:role:deleteBatch', '/admin/role/deleteBatch', '2', '2017-01-18 14:12:03', '6');
INSERT INTO `tb_resource` VALUES ('10', '2017-01-12 16:47:23', '资源分配', null, '0', '3', '资源分配', '4', 'system:role:grant', '/admin/role/grant/**', '2', '2017-01-18 14:12:11', '6');
INSERT INTO `tb_resource` VALUES ('11', '2017-01-17 11:21:12', '资源管理', null, '0', '2', '资源管理', '3', 'system:resource:index', '/admin/resource/index', '1', '2017-01-17 11:21:42', null);
INSERT INTO `tb_resource` VALUES ('12', '2017-01-17 11:21:52', '资源编辑', null, '0', '3', '资源编辑', '1', 'system:resource:edit', '/admin/resource/edit*', '2', '2017-01-17 11:22:36', '11');
INSERT INTO `tb_resource` VALUES ('13', '2017-01-17 11:21:54', '资源添加', null, '0', '3', '资源添加', '2', 'system:resource:add', '/admin/resource/add', '2', '2017-01-17 11:22:39', '11');
INSERT INTO `tb_resource` VALUES ('14', '2017-01-17 11:21:54', '资源删除', null, '0', '3', '资源删除', '3', 'system:resource:deleteBatch', '/admin/resource/deleteBatch', '2', '2017-01-18 14:12:31', '11');
INSERT INTO `tb_resource` VALUES ('15', '2017-07-10 17:43:40', '排行管理', null, '0', '2', '排行管理', '1', 'system:ranklist:index', '/admin/ranklist/index', '1', '2017-07-10 17:44:29', null);

-- ----------------------------
-- Table structure for `tb_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `role_key` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '2017-01-09 17:25:30', '超级管理员', 'administrator', 'administrator', '0', '2017-01-09 17:26:25');

-- ----------------------------
-- Table structure for `tb_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_resource`;
CREATE TABLE `tb_role_resource` (
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `FK868kc8iic48ilv5npa80ut6qo` (`resource_id`),
  CONSTRAINT `FK7ffc7h6obqxflhj1aq1mk20jk` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`),
  CONSTRAINT `FK868kc8iic48ilv5npa80ut6qo` FOREIGN KEY (`resource_id`) REFERENCES `tb_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- ----------------------------
-- Records of tb_role_resource
-- ----------------------------
INSERT INTO `tb_role_resource` VALUES ('1', '1');
INSERT INTO `tb_role_resource` VALUES ('1', '2');
INSERT INTO `tb_role_resource` VALUES ('1', '3');
INSERT INTO `tb_role_resource` VALUES ('1', '4');
INSERT INTO `tb_role_resource` VALUES ('1', '5');
INSERT INTO `tb_role_resource` VALUES ('1', '6');
INSERT INTO `tb_role_resource` VALUES ('1', '7');
INSERT INTO `tb_role_resource` VALUES ('1', '8');
INSERT INTO `tb_role_resource` VALUES ('1', '9');
INSERT INTO `tb_role_resource` VALUES ('1', '10');
INSERT INTO `tb_role_resource` VALUES ('1', '11');
INSERT INTO `tb_role_resource` VALUES ('1', '12');
INSERT INTO `tb_role_resource` VALUES ('1', '13');
INSERT INTO `tb_role_resource` VALUES ('1', '14');
INSERT INTO `tb_role_resource` VALUES ('1', '15');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_status` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `locked` int(11) DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '成都', '2017-01-09 17:26:39', '2017-01-09 17:26:41', '0', '超级管理员', 'whoismy8023@163.com', '0', 'admin', '3931MUEQD1939MQMLM4AISPVNE', '1', '15923930000', '2017-01-09 17:27:11', 'admin');

-- ----------------------------
-- Table structure for `tb_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKea2ootw6b6bb0xt3ptl28bymv` (`role_id`),
  CONSTRAINT `FK7vn3h53d0tqdimm8cp45gc0kl` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`),
  CONSTRAINT `FKea2ootw6b6bb0xt3ptl28bymv` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES ('1', '1');
