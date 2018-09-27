/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : testdemo

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-09-27 15:20:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('client', null, '{noop}secret', 'all', 'password,authorization_code,refresh_token,implicit,client_credentials', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for r_user_role
-- ----------------------------
DROP TABLE IF EXISTS `r_user_role`;
CREATE TABLE `r_user_role` (
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `role_id` int(10) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色关系表';

-- ----------------------------
-- Records of r_user_role
-- ----------------------------
INSERT INTO `r_user_role` VALUES ('2', '2');
INSERT INTO `r_user_role` VALUES ('3', '3');
INSERT INTO `r_user_role` VALUES ('1', '1');
INSERT INTO `r_user_role` VALUES ('1', '2');
INSERT INTO `r_user_role` VALUES ('1', '3');
INSERT INTO `r_user_role` VALUES ('4', '2');
INSERT INTO `r_user_role` VALUES ('4', '3');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `url` varchar(200) DEFAULT NULL COMMENT 'url',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类id',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `remark` text COMMENT '描述',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', null, '0', '1', null, 'ios-flower');
INSERT INTO `sys_menu` VALUES ('2', '菜单2', null, '0', '2', null, 'ios-flower-outline');
INSERT INTO `sys_menu` VALUES ('3', '菜单3', null, '0', '3', null, 'ios-rose');
INSERT INTO `sys_menu` VALUES ('4', '用户管理', '/base/user', '1', '1', null, 'ios-person');
INSERT INTO `sys_menu` VALUES ('5', '菜单管理', '/base/menu', '1', '2', null, 'android-list');
INSERT INTO `sys_menu` VALUES ('6', '角色管理', '/base/role', '1', '3', null, 'ios-people');
INSERT INTO `sys_menu` VALUES ('7', '子菜单22', '/base/test4', '2', '2', null, 'ios-reverse-camera-outline');
INSERT INTO `sys_menu` VALUES ('8', '子菜单31', '/base/test5', '3', '1', null, 'ios-eye');
INSERT INTO `sys_menu` VALUES ('9', '子菜单32', '/base/test6', '3', '2', null, 'ios-eye-outline');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role` varchar(50) NOT NULL COMMENT '角色',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `modules` text COMMENT '权限',
  `describe` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ROLE_ADMIN', '管理员', '4;5;6;', '管理员');
INSERT INTO `sys_role` VALUES ('2', 'ROLE_TEST1', 'test1', '7;', '测试1');
INSERT INTO `sys_role` VALUES ('3', 'ROLE_TEST2', 'test2', '9;8;', '测试2');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(225) DEFAULT NULL COMMENT '密码',
  `email` varchar(225) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '管理员', 'admin', '{bcrypt}$2a$10$D8E4cuanLviCCe/ASqBC7OZ84JYOH8IT4/y4JLAV/Pm/AdhzPcy2.', '123456@qq.com');
INSERT INTO `sys_user` VALUES ('2', '小明', 'test1', '{bcrypt}$2a$10$nr9nTKK2cm1fiGsC.UpGuudc.MtFgthcmRd652ubmrd0TMztB9tym', '123456@qq.com');
INSERT INTO `sys_user` VALUES ('3', '小刚', 'test2', '{bcrypt}$2a$10$anVOsbvMCJKgmC9pKmoqV.CMqQFktXEzb9KwQ2ILG7FBwlwHBOQwO', '123@qq.com');
INSERT INTO `sys_user` VALUES ('4', '小红', 'test3', '{bcrypt}$2a$10$m1lHapKhrZ4tH05Jtu.aG.KsZalgTqOVS0MZdOtpfJDPyr9Y71qWG', '123321@qq.com');
