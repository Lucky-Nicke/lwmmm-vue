/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 90200
 Source Host           : localhost:3306
 Source Schema         : lwmmm_db

 Target Server Type    : MySQL
 Target Server Version : 90200
 File Encoding         : 65001

 Date: 08/04/2026 15:26:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '栏目名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES (1, '电视剧', '2022-11-16 11:16:47', '2023-01-16 11:17:27', 0);
INSERT INTO `sys_category` VALUES (2, '电影', '2022-12-14 11:16:57', '2023-01-16 11:17:30', 1);
INSERT INTO `sys_category` VALUES (3, '综艺', '2023-01-04 11:17:03', '2023-01-16 11:17:33', 0);
INSERT INTO `sys_category` VALUES (4, '动漫', '2022-11-16 11:17:08', '2023-01-16 11:17:35', 0);
INSERT INTO `sys_category` VALUES (5, '网剧', '2022-10-19 11:17:15', '2023-01-16 11:17:40', 0);
INSERT INTO `sys_category` VALUES (6, '纪录片', '2022-10-05 11:17:20', '2023-01-16 11:18:23', 0);
INSERT INTO `sys_category` VALUES (7, '肥皂剧', '2023-01-16 11:14:45', '2026-03-14 15:26:20', 0);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(8000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 499 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (113, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-02 16:29:46', NULL, 0);
INSERT INTO `sys_login_log` VALUES (114, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-03 22:21:04', NULL, 0);
INSERT INTO `sys_login_log` VALUES (115, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-03 22:21:12', NULL, 0);
INSERT INTO `sys_login_log` VALUES (116, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-03 22:21:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (117, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-03 22:23:56', NULL, 0);
INSERT INTO `sys_login_log` VALUES (118, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-03 22:27:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (119, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-03 22:30:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (120, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 09:45:59', NULL, 0);
INSERT INTO `sys_login_log` VALUES (121, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 09:46:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (122, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 09:47:36', NULL, 0);
INSERT INTO `sys_login_log` VALUES (123, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 11:31:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (124, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 11:31:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (125, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 11:31:48', NULL, 0);
INSERT INTO `sys_login_log` VALUES (126, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 11:32:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (127, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 11:38:56', NULL, 0);
INSERT INTO `sys_login_log` VALUES (128, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 11:44:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (129, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 18:50:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (130, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 18:50:58', NULL, 0);
INSERT INTO `sys_login_log` VALUES (131, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 23:00:32', NULL, 0);
INSERT INTO `sys_login_log` VALUES (132, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-04 23:01:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (133, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-05 00:28:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (134, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-05 00:30:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (135, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-05 00:30:29', NULL, 0);
INSERT INTO `sys_login_log` VALUES (136, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-05 00:30:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (137, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-05 09:36:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (138, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-05 22:01:41', NULL, 0);
INSERT INTO `sys_login_log` VALUES (139, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-06 16:14:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (140, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-07 09:44:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (141, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-08 08:51:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (142, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-08 23:20:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (143, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-09 09:26:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (144, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-09 09:27:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (145, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-09 09:29:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (146, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 11:29:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (147, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 17:17:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (148, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 22:13:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (149, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 22:17:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (150, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 22:17:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (151, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 22:53:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (152, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 22:53:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (153, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 23:14:48', NULL, 0);
INSERT INTO `sys_login_log` VALUES (154, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 23:23:36', NULL, 0);
INSERT INTO `sys_login_log` VALUES (155, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 23:25:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (156, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-10 23:49:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (157, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 00:20:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (158, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 00:36:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (159, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 09:05:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (160, '123', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:35:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (161, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 09:36:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (162, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:39:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (163, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:39:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (164, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:39:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (165, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:39:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (166, '123', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:39:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (167, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:40:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (168, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:40:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (169, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:40:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (170, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:42:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (171, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:54:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (172, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:54:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (173, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:54:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (174, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:54:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (175, '111', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-11 09:54:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (176, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 09:55:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (177, '123', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 11:20:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (178, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 11:26:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (179, '123', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 11:26:15', NULL, 0);
INSERT INTO `sys_login_log` VALUES (180, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 16:23:59', NULL, 0);
INSERT INTO `sys_login_log` VALUES (181, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 16:26:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (182, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 16:36:47', NULL, 0);
INSERT INTO `sys_login_log` VALUES (183, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 16:37:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (184, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 16:47:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (185, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 23:32:41', NULL, 0);
INSERT INTO `sys_login_log` VALUES (186, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 23:48:38', NULL, 0);
INSERT INTO `sys_login_log` VALUES (187, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 23:49:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (188, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 23:49:34', NULL, 0);
INSERT INTO `sys_login_log` VALUES (189, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 23:52:28', NULL, 0);
INSERT INTO `sys_login_log` VALUES (190, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-11 23:54:38', NULL, 0);
INSERT INTO `sys_login_log` VALUES (191, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 00:02:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (192, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 00:16:25', NULL, 0);
INSERT INTO `sys_login_log` VALUES (193, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 14:36:28', NULL, 0);
INSERT INTO `sys_login_log` VALUES (194, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:53:15', NULL, 0);
INSERT INTO `sys_login_log` VALUES (195, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:54:34', NULL, 0);
INSERT INTO `sys_login_log` VALUES (196, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:55:22', NULL, 0);
INSERT INTO `sys_login_log` VALUES (197, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:56:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (198, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:57:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (199, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:57:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (200, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:57:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (201, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:58:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (202, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:58:28', NULL, 0);
INSERT INTO `sys_login_log` VALUES (203, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:59:04', NULL, 0);
INSERT INTO `sys_login_log` VALUES (204, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 15:59:34', NULL, 0);
INSERT INTO `sys_login_log` VALUES (205, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 16:03:51', NULL, 0);
INSERT INTO `sys_login_log` VALUES (206, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-12 16:05:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (207, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-13 09:18:15', NULL, 0);
INSERT INTO `sys_login_log` VALUES (208, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-13 09:18:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (209, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 09:47:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (210, 'admin', '127.0.0.1', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1\r\n### The error may exist in com/lanxige/mapper/system/SysUserMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,username,password,name,description AS desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM sys_user   WHERE  is_deleted=0  AND (username = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1', NULL, '2026-03-14 10:12:24', NULL, 0);
INSERT INTO `sys_login_log` VALUES (211, 'admin', '127.0.0.1', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1\r\n### The error may exist in com/lanxige/mapper/system/SysUserMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,username,password,name,desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM sys_user   WHERE  is_deleted=0  AND (username = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1', NULL, '2026-03-14 10:13:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (212, 'admin', '127.0.0.1', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1\r\n### The error may exist in com/lanxige/mapper/system/SysUserMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,username,password,name,`description` AS desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM sys_user   WHERE  is_deleted=0  AND (username = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1', NULL, '2026-03-14 10:15:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (213, 'admin', '127.0.0.1', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1\r\n### The error may exist in com/lanxige/mapper/system/SysUserMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,username,password,name,`description` AS desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM sys_user   WHERE  is_deleted=0  AND (username = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,phone,head_url,description,status,create_time,update_time,is_deleted  FROM \' at line 1', NULL, '2026-03-14 10:16:36', NULL, 0);
INSERT INTO `sys_login_log` VALUES (214, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:31:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (215, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:34:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (216, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:35:17', NULL, 0);
INSERT INTO `sys_login_log` VALUES (217, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:35:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (218, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:36:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (219, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:36:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (220, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:37:26', NULL, 0);
INSERT INTO `sys_login_log` VALUES (221, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:38:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (222, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:38:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (223, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:39:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (224, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:40:24', NULL, 0);
INSERT INTO `sys_login_log` VALUES (225, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:41:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (226, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:42:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (227, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:43:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (228, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:46:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (229, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:46:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (230, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:50:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (231, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 10:51:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (232, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 14:33:48', NULL, 0);
INSERT INTO `sys_login_log` VALUES (233, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 14:34:04', NULL, 0);
INSERT INTO `sys_login_log` VALUES (234, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 14:34:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (235, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 14:39:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (236, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-03-14 14:58:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (237, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-03-14 14:58:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (238, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 14:58:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (239, 'test', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 16:18:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (240, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 16:18:59', NULL, 0);
INSERT INTO `sys_login_log` VALUES (241, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 21:06:01', NULL, 0);
INSERT INTO `sys_login_log` VALUES (242, 'test_admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 21:09:58', NULL, 0);
INSERT INTO `sys_login_log` VALUES (243, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 22:06:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (244, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 22:09:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (245, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-14 22:19:28', NULL, 0);
INSERT INTO `sys_login_log` VALUES (246, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 09:29:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (247, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 09:33:38', NULL, 0);
INSERT INTO `sys_login_log` VALUES (248, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 09:51:07', NULL, 0);
INSERT INTO `sys_login_log` VALUES (249, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 10:20:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (250, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 10:26:26', NULL, 0);
INSERT INTO `sys_login_log` VALUES (251, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 10:28:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (252, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 10:29:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (253, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 10:35:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (254, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 17:15:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (255, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 17:18:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (256, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-16 17:18:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (257, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 16:41:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (258, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 16:48:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (259, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:15:38', NULL, 0);
INSERT INTO `sys_login_log` VALUES (260, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:21:24', NULL, 0);
INSERT INTO `sys_login_log` VALUES (261, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:21:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (262, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:21:56', NULL, 0);
INSERT INTO `sys_login_log` VALUES (263, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:22:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (264, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:22:36', NULL, 0);
INSERT INTO `sys_login_log` VALUES (265, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:24:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (266, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:25:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (267, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:26:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (268, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:28:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (269, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:29:01', NULL, 0);
INSERT INTO `sys_login_log` VALUES (270, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:29:25', NULL, 0);
INSERT INTO `sys_login_log` VALUES (271, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:29:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (272, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:30:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (273, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:31:07', NULL, 0);
INSERT INTO `sys_login_log` VALUES (274, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 18:32:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (275, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 22:11:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (276, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 22:13:04', NULL, 0);
INSERT INTO `sys_login_log` VALUES (277, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 22:13:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (278, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 22:13:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (279, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 22:17:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (280, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 22:17:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (281, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 22:18:17', NULL, 0);
INSERT INTO `sys_login_log` VALUES (282, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-18 22:19:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (283, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 08:59:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (284, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 09:00:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (285, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 09:04:58', NULL, 0);
INSERT INTO `sys_login_log` VALUES (286, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 09:05:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (287, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 09:50:15', NULL, 0);
INSERT INTO `sys_login_log` VALUES (288, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 09:51:12', NULL, 0);
INSERT INTO `sys_login_log` VALUES (289, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 09:52:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (290, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 09:52:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (291, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 10:29:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (292, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 11:54:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (293, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 12:34:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (294, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 12:41:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (295, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-19 13:06:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (296, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 11:45:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (297, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 14:14:41', NULL, 0);
INSERT INTO `sys_login_log` VALUES (298, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 14:28:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (299, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 14:51:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (300, 'lucky_nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-03-20 14:52:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (301, 'lucky_nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-03-20 14:52:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (302, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 14:52:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (303, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 14:53:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (304, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 14:53:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (305, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 15:51:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (306, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 16:32:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (307, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 17:14:01', NULL, 0);
INSERT INTO `sys_login_log` VALUES (308, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:09:29', NULL, 0);
INSERT INTO `sys_login_log` VALUES (309, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:22:05', NULL, 0);
INSERT INTO `sys_login_log` VALUES (310, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:23:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (311, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:24:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (312, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:24:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (313, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:27:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (314, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:38:47', NULL, 0);
INSERT INTO `sys_login_log` VALUES (315, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:39:01', NULL, 0);
INSERT INTO `sys_login_log` VALUES (316, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:39:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (317, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:39:47', NULL, 0);
INSERT INTO `sys_login_log` VALUES (318, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:41:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (319, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:41:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (320, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-20 21:41:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (321, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:51:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (322, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:52:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (323, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:52:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (324, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:53:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (325, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:53:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (326, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:54:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (327, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:54:17', NULL, 0);
INSERT INTO `sys_login_log` VALUES (328, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:54:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (329, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:54:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (330, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:54:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (331, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:54:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (332, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:54:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (333, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:55:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (334, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:55:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (335, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:55:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (336, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 20:56:01', NULL, 0);
INSERT INTO `sys_login_log` VALUES (337, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 21:01:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (338, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-21 21:01:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (339, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 16:22:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (340, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 16:41:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (341, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 16:51:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (342, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-03-23 16:55:15', NULL, 0);
INSERT INTO `sys_login_log` VALUES (343, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 16:59:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (344, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 17:01:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (345, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 17:03:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (346, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 17:03:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (347, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 17:03:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (348, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 17:07:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (349, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 17:51:26', NULL, 0);
INSERT INTO `sys_login_log` VALUES (350, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 17:51:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (351, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 17:51:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (352, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 18:25:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (353, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-23 18:26:12', NULL, 0);
INSERT INTO `sys_login_log` VALUES (354, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:08:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (355, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:12:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (356, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:15:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (357, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:15:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (358, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:19:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (359, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:20:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (360, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:21:38', NULL, 0);
INSERT INTO `sys_login_log` VALUES (361, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:21:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (362, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 16:59:07', NULL, 0);
INSERT INTO `sys_login_log` VALUES (363, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:03:38', NULL, 0);
INSERT INTO `sys_login_log` VALUES (364, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:07:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (365, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:09:47', NULL, 0);
INSERT INTO `sys_login_log` VALUES (366, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:10:08', NULL, 0);
INSERT INTO `sys_login_log` VALUES (367, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:13:28', NULL, 0);
INSERT INTO `sys_login_log` VALUES (368, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:15:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (369, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:17:32', NULL, 0);
INSERT INTO `sys_login_log` VALUES (370, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:17:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (371, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:21:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (372, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:21:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (373, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:21:22', NULL, 0);
INSERT INTO `sys_login_log` VALUES (374, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:21:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (375, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:21:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (376, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:21:29', NULL, 0);
INSERT INTO `sys_login_log` VALUES (377, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:22:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (378, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:24:34', NULL, 0);
INSERT INTO `sys_login_log` VALUES (379, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:24:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (380, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:25:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (381, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:25:22', NULL, 0);
INSERT INTO `sys_login_log` VALUES (382, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:32:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (383, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:33:46', NULL, 0);
INSERT INTO `sys_login_log` VALUES (384, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:33:53', NULL, 0);
INSERT INTO `sys_login_log` VALUES (385, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-03-24 17:45:34', NULL, 0);
INSERT INTO `sys_login_log` VALUES (386, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-01 17:31:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (387, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-02 01:06:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (388, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-02 08:55:18', NULL, 0);
INSERT INTO `sys_login_log` VALUES (389, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:38:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (390, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:39:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (391, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:39:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (392, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:39:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (393, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:39:56', NULL, 0);
INSERT INTO `sys_login_log` VALUES (394, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:40:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (395, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:45:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (396, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:47:54', NULL, 0);
INSERT INTO `sys_login_log` VALUES (397, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:29', NULL, 0);
INSERT INTO `sys_login_log` VALUES (398, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (399, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (400, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (401, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:32', NULL, 0);
INSERT INTO `sys_login_log` VALUES (402, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:34', NULL, 0);
INSERT INTO `sys_login_log` VALUES (403, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (404, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:38', NULL, 0);
INSERT INTO `sys_login_log` VALUES (405, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 10:48:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (406, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:49:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (407, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:49:19', NULL, 0);
INSERT INTO `sys_login_log` VALUES (408, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:49:22', NULL, 0);
INSERT INTO `sys_login_log` VALUES (409, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:49:48', NULL, 0);
INSERT INTO `sys_login_log` VALUES (410, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:51:06', NULL, 0);
INSERT INTO `sys_login_log` VALUES (411, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:56:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (412, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:56:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (413, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 10:58:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (414, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 10:59:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (415, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 10:59:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (416, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 10:59:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (417, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (418, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:12', NULL, 0);
INSERT INTO `sys_login_log` VALUES (419, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (420, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (421, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:14', NULL, 0);
INSERT INTO `sys_login_log` VALUES (422, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:16', NULL, 0);
INSERT INTO `sys_login_log` VALUES (423, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (424, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:22', NULL, 0);
INSERT INTO `sys_login_log` VALUES (425, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (426, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (427, 'Lucky_Nicke', '127.0.0.1', 1, '用户已禁用', NULL, '2026-04-08 11:04:26', NULL, 0);
INSERT INTO `sys_login_log` VALUES (428, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:04:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (429, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:04:40', NULL, 0);
INSERT INTO `sys_login_log` VALUES (430, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:04:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (431, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:04:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (432, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:08:56', NULL, 0);
INSERT INTO `sys_login_log` VALUES (433, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:09:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (434, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:09:59', NULL, 0);
INSERT INTO `sys_login_log` VALUES (435, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:22:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (436, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:22:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (437, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:22:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (438, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:39:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (439, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:43:15', NULL, 0);
INSERT INTO `sys_login_log` VALUES (440, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:44:47', NULL, 0);
INSERT INTO `sys_login_log` VALUES (441, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:46:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES (442, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:49:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (443, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:50:37', NULL, 0);
INSERT INTO `sys_login_log` VALUES (444, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:52:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (445, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:52:52', NULL, 0);
INSERT INTO `sys_login_log` VALUES (446, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 11:53:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (447, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:08:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (448, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:11:17', NULL, 0);
INSERT INTO `sys_login_log` VALUES (449, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:13:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (450, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:13:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (451, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:13:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (452, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:13:49', NULL, 0);
INSERT INTO `sys_login_log` VALUES (453, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:17:15', NULL, 0);
INSERT INTO `sys_login_log` VALUES (454, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:17:24', NULL, 0);
INSERT INTO `sys_login_log` VALUES (455, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:17:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (456, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:18:11', NULL, 0);
INSERT INTO `sys_login_log` VALUES (457, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:18:17', NULL, 0);
INSERT INTO `sys_login_log` VALUES (458, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:18:23', NULL, 0);
INSERT INTO `sys_login_log` VALUES (459, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:22:20', NULL, 0);
INSERT INTO `sys_login_log` VALUES (460, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:22:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (461, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:23:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (462, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:23:05', NULL, 0);
INSERT INTO `sys_login_log` VALUES (463, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:23:10', NULL, 0);
INSERT INTO `sys_login_log` VALUES (464, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:25:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (465, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:32:36', NULL, 0);
INSERT INTO `sys_login_log` VALUES (466, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:37:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (467, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:37:59', NULL, 0);
INSERT INTO `sys_login_log` VALUES (468, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:38:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (469, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:38:01', NULL, 0);
INSERT INTO `sys_login_log` VALUES (470, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:38:01', NULL, 0);
INSERT INTO `sys_login_log` VALUES (471, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:38:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (472, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:38:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (473, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:38:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (474, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:38:04', NULL, 0);
INSERT INTO `sys_login_log` VALUES (475, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:40:57', NULL, 0);
INSERT INTO `sys_login_log` VALUES (476, 'admin', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:40:58', NULL, 0);
INSERT INTO `sys_login_log` VALUES (477, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:41:02', NULL, 0);
INSERT INTO `sys_login_log` VALUES (478, 'admin1', '127.0.0.1', 1, 'Bad credentials', NULL, '2026-04-08 14:41:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (479, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:44:31', NULL, 0);
INSERT INTO `sys_login_log` VALUES (480, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:44:35', NULL, 0);
INSERT INTO `sys_login_log` VALUES (481, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:49:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (482, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:50:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (483, 'test_admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:51:43', NULL, 0);
INSERT INTO `sys_login_log` VALUES (484, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:52:36', NULL, 0);
INSERT INTO `sys_login_log` VALUES (485, 'test_admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:53:32', NULL, 0);
INSERT INTO `sys_login_log` VALUES (486, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:53:44', NULL, 0);
INSERT INTO `sys_login_log` VALUES (487, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:53:45', NULL, 0);
INSERT INTO `sys_login_log` VALUES (488, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:53:47', NULL, 0);
INSERT INTO `sys_login_log` VALUES (489, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:53:50', NULL, 0);
INSERT INTO `sys_login_log` VALUES (490, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:53:55', NULL, 0);
INSERT INTO `sys_login_log` VALUES (491, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:54:03', NULL, 0);
INSERT INTO `sys_login_log` VALUES (492, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:54:09', NULL, 0);
INSERT INTO `sys_login_log` VALUES (493, 'test_admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:54:13', NULL, 0);
INSERT INTO `sys_login_log` VALUES (494, 'admin', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:58:33', NULL, 0);
INSERT INTO `sys_login_log` VALUES (495, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 14:59:00', NULL, 0);
INSERT INTO `sys_login_log` VALUES (496, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 15:00:21', NULL, 0);
INSERT INTO `sys_login_log` VALUES (497, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 15:04:39', NULL, 0);
INSERT INTO `sys_login_log` VALUES (498, 'Lucky_Nicke', '127.0.0.1', 0, '登录成功', NULL, '2026-04-08 15:13:04', NULL, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_value` int(0) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 0, '系统管理', 0, 'system', 'Layout', NULL, 'el-icon-s-tools', 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:23:24', 0);
INSERT INTO `sys_menu` VALUES (3, 2, '用户管理', 1, 'sysUser', 'system/sysUser/list', '', 'el-icon-s-custom', 1, 1, '2021-05-31 18:05:37', '2026-03-10 22:17:08', 0);
INSERT INTO `sys_menu` VALUES (4, 2, '角色管理', 1, 'sysRole', 'system/sysRole/list', '', 'el-icon-s-help', 2, 1, '2021-05-31 18:05:37', '2026-03-02 16:44:05', 0);
INSERT INTO `sys_menu` VALUES (5, 2, '菜单管理', 1, 'sysMenu', 'system/sysMenu/list', '', 'el-icon-s-unfold', 3, 1, '2021-05-31 18:05:37', '2022-06-09 09:37:21', 0);
INSERT INTO `sys_menu` VALUES (6, 3, '查看', 2, NULL, NULL, 'bnt.sysUser.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (7, 3, '添加', 2, NULL, NULL, 'bnt.sysUser.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (8, 3, '修改', 2, NULL, NULL, 'bnt.sysUser.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (9, 3, '删除', 2, NULL, NULL, 'bnt.sysUser.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (10, 4, '查看', 2, NULL, NULL, 'bnt.sysRole.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (11, 4, '添加', 2, NULL, NULL, 'bnt.sysRole.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (12, 4, '修改', 2, NULL, NULL, 'bnt.sysRole.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (13, 4, '删除', 2, NULL, NULL, 'bnt.sysRole.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (14, 5, '查看', 2, NULL, NULL, 'bnt.sysMenu.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (15, 5, '添加', 2, NULL, NULL, 'bnt.sysMenu.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (16, 5, '修改', 2, NULL, NULL, 'bnt.sysMenu.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (17, 5, '删除', 2, NULL, NULL, 'bnt.sysMenu.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (18, 3, '分配角色', 2, NULL, NULL, 'bnt.sysUser.assignRole', NULL, 1, 1, '2022-05-23 17:14:32', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (19, 4, '分配权限', 2, 'assignAuth', 'system/sysRole/assignAuth', 'bnt.sysRole.assignAuth', NULL, 1, 1, '2022-05-23 17:18:14', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (30, 46, '操作日志', 1, 'sysOperLog', 'system/sysOperLog/list', '', 'el-icon-document-remove', 7, 1, '2022-05-26 16:09:59', '2022-06-09 09:39:23', 0);
INSERT INTO `sys_menu` VALUES (31, 30, '查看', 2, NULL, NULL, 'bnt.sysOperLog.list', NULL, 1, 1, '2022-05-26 16:10:17', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (32, 46, '登录日志', 1, 'sysLoginLog', 'system/sysLoginLog/list', '', 'el-icon-s-goods', 8, 1, '2022-05-26 16:36:13', '2022-06-09 09:39:24', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '查看', 2, NULL, NULL, 'bnt.sysLoginLog.list', NULL, 1, 1, '2022-05-26 16:36:31', '2022-06-09 09:36:36', 0);
INSERT INTO `sys_menu` VALUES (36, 2, '影视管理', 1, 'sysMovie', 'system/sysMovie/list', '', 'el-icon-tickets', 6, 1, '2023-01-14 17:30:43', '2026-03-02 16:44:25', 1);
INSERT INTO `sys_menu` VALUES (37, 36, '视频播放', 2, 'assignVideo', 'system/sysMovie/assignVideo', 'bnt.sysMovie.assignVideo', '', 1, 1, '2023-01-15 20:44:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (38, 2, '分类管理', 1, 'sysCategory', 'system/sysCategory/list', '', 'el-icon-s-tools', 1, 1, '2023-01-16 10:30:31', '2026-02-22 11:58:45', 0);
INSERT INTO `sys_menu` VALUES (41, 38, '查看', 2, '', '', 'bnt.sysCategory.list', '', 1, 1, '2026-02-22 11:12:43', NULL, 0);
INSERT INTO `sys_menu` VALUES (42, 38, '添加', 2, '', '', 'bnt.sysCategory.add', '', 1, 1, '2026-02-22 11:13:14', '2026-02-22 11:13:20', 0);
INSERT INTO `sys_menu` VALUES (43, 38, '修改', 2, '', '', 'bnt.sysCategory.update', '', 1, 1, '2026-02-22 11:20:18', '2026-02-22 11:24:51', 0);
INSERT INTO `sys_menu` VALUES (44, 38, '删除', 2, '', '', 'bnt.sysCategory.remove', '', 1, 1, '2026-02-22 11:20:18', '2026-02-22 11:24:46', 0);
INSERT INTO `sys_menu` VALUES (46, 0, '数据管理', 0, 'log', 'Layout', '', 'el-icon-info', 1, 1, '2026-03-02 16:46:13', NULL, 0);
INSERT INTO `sys_menu` VALUES (47, 30, '删除', 2, '', '', 'bnt.sysOperLog.delete', '', 1, 1, '2026-03-04 23:04:15', NULL, 0);
INSERT INTO `sys_menu` VALUES (48, 32, '删除', 2, '', '', 'bnt.sysLoginLog.delete', '', 1, 1, '2026-03-04 23:05:15', NULL, 0);
INSERT INTO `sys_menu` VALUES (49, 46, '视频数据', 1, 'sysMovie', 'system/sysMovie/VideoList', '', 'el-icon-tickets', 1, 1, '2026-03-04 23:06:02', '2026-03-04 23:40:03', 0);
INSERT INTO `sys_menu` VALUES (50, 49, '视频播放', 2, 'assignVideo', 'system/sysMovie/assignVideo', 'bnt.sysMovie.assignVideo', '', 1, 1, '2026-03-05 00:39:11', '2026-03-05 00:39:48', 1);
INSERT INTO `sys_menu` VALUES (51, 46, '审核视频', 1, 'adminAppro', 'system/sysMovie/AdminApproVideo', '', 'el-icon-s-check', 1, 1, '2026-03-19 09:50:53', '2026-03-19 10:30:59', 0);

-- ----------------------------
-- Table structure for sys_movie
-- ----------------------------
DROP TABLE IF EXISTS `sys_movie`;
CREATE TABLE `sys_movie`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电影名称',
  `cid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `description` varchar(8000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容描述',
  `keyword` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关键字，用来搜索',
  `director` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '作者姓名',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `is_approval` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '是否审核标识（0未审核 1已审核  2取消审核）',
  `play_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '播放id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie
-- ----------------------------
INSERT INTO `sys_movie` VALUES (113, '欢乐喜剧人', '综艺', 'test', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-20/1773996833860.jpg', '1', 'd0c7b85d243a71f19f877511978f0102', '2026-03-20 16:54:20', NULL, 1);
INSERT INTO `sys_movie` VALUES (114, '欢乐喜剧人', '综艺', 'test', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-20/1773996929725.jpg', '1', 'e01b4d8d243a71f1918f0360d1d70102', '2026-03-20 16:55:46', NULL, 0);
INSERT INTO `sys_movie` VALUES (115, '奔跑吧！兄弟！', '综艺', '奔跑吧！！', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-20/1773997527241.jpg', '1', 'a0eac7f0243b71f19f877511978f0102', '2026-03-20 17:13:30', '2026-03-20 17:27:56', 0);
INSERT INTO `sys_movie` VALUES (116, '奔跑吧！兄弟！', '电视剧', '奔跑吧！兄弟！', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-20/1773998020234.jpg', '0', '30acfe16243d71f1be917511979f0102', '2026-03-20 17:13:55', '2026-03-20 17:27:53', 0);
INSERT INTO `sys_movie` VALUES (117, '奔跑吧！兄弟！', '网剧', '奔跑吧！兄弟！', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-20/1773998374280.jpg', '2', '40489de9243d71f1bfd00361c0c60102', '2026-03-20 17:19:42', NULL, 0);
INSERT INTO `sys_movie` VALUES (118, '123', '电视剧', '', NULL, 'nicke1', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-04-08/1775632427529.jpg', '0', 'e07df782331a71f1a98d0361c0c60102', '2026-04-08 15:14:32', NULL, 0);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `request_method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '请求方法名称',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 356 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (78, '角色管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysRole/updateRole', '127.0.0.1', '2026-03-02 16:05:06', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (79, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/20', '127.0.0.1', '2026-03-02 16:26:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (80, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-02 16:28:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (81, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/22', '127.0.0.1', '2026-03-02 16:29:00', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (82, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-02 16:29:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (83, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/23', '127.0.0.1', '2026-03-02 16:29:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (84, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-02 16:31:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (85, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-02 16:31:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (86, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-02 16:33:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (87, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-02 16:33:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (88, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-02 16:34:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (89, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/24', '127.0.0.1', '2026-03-02 16:34:32', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (90, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-02 16:39:16', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (91, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/25', '127.0.0.1', '2026-03-02 16:39:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (92, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-02 16:39:48', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (93, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/26', '127.0.0.1', '2026-03-02 16:39:50', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (94, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-02 16:44:05', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (95, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-02 16:44:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (96, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-02 16:44:25', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (97, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-02 16:44:56', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (98, '系统菜单-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMenu/addMenu', '127.0.0.1', '2026-03-02 16:45:34', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (99, '系统菜单-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMenu/removeMenu/40', '127.0.0.1', '2026-03-02 16:45:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (100, '系统菜单-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMenu/removeMenu/45', '127.0.0.1', '2026-03-02 16:45:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (101, '系统菜单-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMenu/removeMenu/39', '127.0.0.1', '2026-03-02 16:45:46', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (102, '系统菜单-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMenu/addMenu', '127.0.0.1', '2026-03-02 16:46:13', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (103, '系统菜单-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMenu/removeMenu/34', '127.0.0.1', '2026-03-02 16:48:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (104, '用户管理-批量删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysUser/batchDeleteUser', '127.0.0.1', '2026-03-02 17:03:49', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (105, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-02 17:04:00', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (106, '影视分类-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysCategory/updateCategory', '127.0.0.1', '2026-03-02 17:04:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (107, '角色管理-批量删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysRole/deleteBatch', '127.0.0.1', '2026-03-02 17:04:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (108, '角色管理-批量删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysRole/deleteBatch', '127.0.0.1', '2026-03-02 17:04:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (109, '角色管理-批量删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysRole/deleteBatch', '127.0.0.1', '2026-03-02 17:04:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (110, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-03-02 17:04:55', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (111, '角色管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysRole/updateRole', '127.0.0.1', '2026-03-02 17:05:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (112, '角色管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysRole/addRole', '127.0.0.1', '2026-03-02 17:05:19', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (113, '角色管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysRole/updateRole', '127.0.0.1', '2026-03-02 17:05:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (114, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-03-02 17:06:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (115, '角色管理-分配角色', 'UPDATE', 'Post', 'admin', '/admin/system/sysRole/doAssign', '127.0.0.1', '2026-03-02 17:06:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (116, '角色管理-分配角色', 'UPDATE', 'Post', 'admin', '/admin/system/sysRole/doAssign', '127.0.0.1', '2026-03-02 17:06:31', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (117, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-02 17:06:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (118, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/24', '127.0.0.1', '2026-03-02 17:07:13', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (119, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/20', '127.0.0.1', '2026-03-02 17:07:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (120, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/19', '127.0.0.1', '2026-03-02 17:07:16', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (121, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/18', '127.0.0.1', '2026-03-02 17:07:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (122, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/17', '127.0.0.1', '2026-03-02 17:07:19', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (123, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/16', '127.0.0.1', '2026-03-02 17:07:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (124, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/9', '127.0.0.1', '2026-03-02 17:07:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (125, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/8', '127.0.0.1', '2026-03-02 17:07:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (126, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/7', '127.0.0.1', '2026-03-02 17:07:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (127, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/6', '127.0.0.1', '2026-03-02 17:07:25', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (128, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/5', '127.0.0.1', '2026-03-02 17:07:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (129, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/4', '127.0.0.1', '2026-03-02 17:07:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (130, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/3', '127.0.0.1', '2026-03-02 17:07:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (131, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/2', '127.0.0.1', '2026-03-02 17:07:30', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (132, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/1', '127.0.0.1', '2026-03-02 17:07:32', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (133, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-02 17:08:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (134, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-02 17:08:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (135, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-02 17:08:30', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (136, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 17:09:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (137, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 17:49:46', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (138, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:02:16', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (139, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:02:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (140, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:05:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (141, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:05:16', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (142, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:05:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (143, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:05:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (144, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:06:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (145, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:06:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (146, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:06:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (147, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:06:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (148, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:06:48', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (149, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:08:39', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (150, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 18:14:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (151, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 18:19:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (152, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 18:20:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (153, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 18:21:12', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (154, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 18:24:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (155, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 18:24:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (156, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 18:24:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (157, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-02 18:24:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (158, '影视管理-播放视频', 'QUERY', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-02 18:24:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (159, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-04 11:49:25', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (160, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-04 11:49:33', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (161, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-04 11:51:39', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (162, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-04 11:54:34', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (163, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-04 11:54:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (164, '系统菜单-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMenu/addMenu', '127.0.0.1', '2026-03-04 23:04:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (165, '系统菜单-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMenu/addMenu', '127.0.0.1', '2026-03-04 23:05:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (166, '系统菜单-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMenu/addMenu', '127.0.0.1', '2026-03-04 23:06:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (167, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-04 23:06:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (168, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-04 23:07:00', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (169, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-04 23:07:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (170, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-04 23:07:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (171, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-04 23:12:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (172, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-04 23:12:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (173, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-04 23:40:03', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (174, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-04 23:52:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (175, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-04 23:52:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (176, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-04 23:52:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (177, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/29', '127.0.0.1', '2026-03-04 23:52:59', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (178, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/28', '127.0.0.1', '2026-03-04 23:53:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (179, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/28', '127.0.0.1', '2026-03-04 23:53:33', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (180, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/29', '127.0.0.1', '2026-03-04 23:53:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (181, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-04 23:59:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (182, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/29', '127.0.0.1', '2026-03-04 23:59:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (183, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/29', '127.0.0.1', '2026-03-05 00:27:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (184, '系统菜单-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMenu/addMenu', '127.0.0.1', '2026-03-05 00:39:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (185, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-05 00:39:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (186, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-05 00:39:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (187, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-05 00:39:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (188, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-05 00:39:48', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (189, '系统菜单-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMenu/removeMenu/37', '127.0.0.1', '2026-03-05 00:39:56', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (190, '系统菜单-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMenu/removeMenu/36', '127.0.0.1', '2026-03-05 00:39:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (191, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-05 00:50:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (192, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-05 00:50:46', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (193, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/29', '127.0.0.1', '2026-03-05 09:37:06', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (194, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/29', '127.0.0.1', '2026-03-05 10:58:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (195, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/29', '127.0.0.1', '2026-03-05 10:58:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (196, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/29', '127.0.0.1', '2026-03-05 22:07:03', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (197, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/29', '127.0.0.1', '2026-03-05 22:07:59', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (198, '系统菜单-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMenu/removeMenu/50', '127.0.0.1', '2026-03-05 22:24:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (199, '用户管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysUser/addUser', '127.0.0.1', '2026-03-10 11:30:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (200, '用户管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysUser/deleteUser/50', '127.0.0.1', '2026-03-10 11:30:47', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (201, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/28', '127.0.0.1', '2026-03-10 18:39:49', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (202, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-10 22:16:45', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (203, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-10 22:17:08', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (204, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-10 23:41:06', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (205, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-10 23:41:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (206, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-10 23:41:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (207, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-03-11 10:21:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (208, '用户管理-注册', 'INSERT', 'Post', 'admin', '/admin/system/sysUser/registerUser', '127.0.0.1', '2026-03-11 11:18:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (209, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-03-12 14:48:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (210, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:06:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (211, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:07:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (212, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:08:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (213, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:08:40', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (214, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:31:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (215, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:34:50', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (216, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:35:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (217, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:53:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (218, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:53:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (219, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:53:39', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (220, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:56:08', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (221, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:58:05', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (222, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 10:59:50', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (223, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 11:00:30', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (224, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 11:00:36', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (225, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 11:00:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (226, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 11:01:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (227, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 11:02:03', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (228, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 14:40:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (229, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-14 14:40:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (230, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/52/0', '127.0.0.1', '2026-03-14 14:58:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (231, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/52/1', '127.0.0.1', '2026-03-14 14:58:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (232, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/9/0', '127.0.0.1', '2026-03-14 14:58:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (233, '影视分类-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysCategory/updateCategory', '127.0.0.1', '2026-03-14 15:26:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (234, '影视分类-单个删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysCategory/removeCategory/2', '127.0.0.1', '2026-03-14 15:26:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (235, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-14 15:27:31', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (236, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-14 15:28:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (237, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/1', '127.0.0.1', '2026-03-14 15:28:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (238, '用户管理-注册', 'INSERT', 'Post', 'anonymousUser', '/admin/system/sysUser/registerUser', '127.0.0.1', '2026-03-14 16:17:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (239, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-14 16:44:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (240, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-14 16:45:08', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (241, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-14 16:45:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (242, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-14 16:45:55', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (243, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-14 16:45:56', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (244, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-14 21:06:34', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (245, '用户管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysUser/addUser', '127.0.0.1', '2026-03-14 21:06:35', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (246, '用户管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysUser/deleteUser/82', '127.0.0.1', '2026-03-14 21:07:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (247, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-14 21:08:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (248, '用户管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysUser/addUser', '127.0.0.1', '2026-03-14 21:08:05', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (249, '角色管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysRole/addRole', '127.0.0.1', '2026-03-14 21:09:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (250, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-03-14 21:09:42', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (251, '角色管理-分配角色', 'UPDATE', 'Post', 'admin', '/admin/system/sysRole/doAssign', '127.0.0.1', '2026-03-14 21:09:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (252, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/81/0', '127.0.0.1', '2026-03-14 22:11:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (253, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (254, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (255, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-18 18:47:48', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (256, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-18 18:48:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (257, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-18 18:52:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (258, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-18 18:52:33', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (259, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 09:21:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (260, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 09:21:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (261, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 09:27:16', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (262, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 09:27:25', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (263, '系统菜单-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMenu/addMenu', '127.0.0.1', '2026-03-19 09:50:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (264, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 10:23:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (265, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 10:24:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (266, '系统菜单-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMenu/updateMenu', '127.0.0.1', '2026-03-19 10:30:59', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (267, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 10:34:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (268, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 10:34:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (269, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 10:45:21', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (270, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 10:45:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (271, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 10:51:36', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (272, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 10:51:39', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (273, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 10:52:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (274, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 10:52:17', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (275, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 11:15:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (276, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 11:15:12', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (277, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 11:15:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (278, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 11:15:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (279, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 11:15:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (280, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 11:16:00', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (281, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 11:16:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (282, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 11:16:56', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (283, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 12:41:23', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (284, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 12:41:26', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (285, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 12:44:13', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (286, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 12:44:19', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (287, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 12:44:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (288, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 12:56:33', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (289, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 12:56:36', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (290, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 13:16:51', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (291, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 13:16:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (292, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-19 13:17:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (293, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-19 13:17:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (294, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 14:21:22', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (295, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-20 14:21:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (296, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-20 14:21:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (297, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 14:26:33', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (298, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-20 14:26:35', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (299, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 14:28:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (300, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/81/1', '127.0.0.1', '2026-03-20 14:52:59', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (301, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/81/0', '127.0.0.1', '2026-03-20 14:53:01', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (302, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/9/1', '127.0.0.1', '2026-03-20 14:53:04', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (303, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-20 15:25:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (304, '影视管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysMovie/updateMovie', '127.0.0.1', '2026-03-20 15:25:29', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (305, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/112', '127.0.0.1', '2026-03-20 15:26:13', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (306, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-20 15:53:47', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (307, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 16:25:48', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (308, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-20 16:25:49', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (309, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 16:25:53', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (310, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-20 16:25:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (311, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 16:25:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (312, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-20 16:25:57', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (313, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 16:26:24', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (314, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-20 16:26:25', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (315, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 16:27:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (316, '用户管理-修改', 'UPDATE', 'Post', 'admin', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-03-20 16:27:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (317, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-20 16:33:37', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (318, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-20 16:33:39', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (319, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-20 16:33:59', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (320, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-20 16:53:55', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (321, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-20 16:54:15', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (322, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-20 16:54:20', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (323, '影视管理-删除', 'DELETE', 'Delete', 'admin', '/admin/system/sysMovie/removeMovie/113', '127.0.0.1', '2026-03-20 16:55:19', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (324, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '0:0:0:0:0:0:0:1', '2026-03-20 16:55:30', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (325, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '0:0:0:0:0:0:0:1', '2026-03-20 16:55:34', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (326, '影视管理-添加', 'INSERT', 'Post', 'admin', '/admin/system/sysMovie/addMovie', '127.0.0.1', '2026-03-20 16:55:46', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (327, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/114', '127.0.0.1', '2026-03-20 16:56:07', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (328, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 17:05:28', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (329, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-20 17:05:31', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (330, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 17:13:41', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (331, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-20 17:13:44', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (332, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 17:19:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (333, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 17:19:30', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (334, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-03-20 17:19:34', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (335, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-03-20 17:19:38', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (336, '影视管理-播放视频', 'OTHER', 'Post', 'admin', '/admin/system/sysMovie/getPlayAuth/115', '127.0.0.1', '2026-03-23 17:08:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (337, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-04-01 17:31:47', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (338, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-04-02 01:06:58', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (339, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-04-02 08:55:34', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (340, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/9/0', '127.0.0.1', '2026-04-08 10:58:54', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (341, '用户管理-更改用户状态', 'UPDATE', 'Get', 'admin', '/admin/system/sysUser/updateStatus/9/1', '127.0.0.1', '2026-04-08 11:04:36', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (342, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (343, '系统菜单-给角色分配权限', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysMenu/doAssign', '127.0.0.1', '2026-04-08 15:00:10', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (344, '用户管理-修改', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-04-08 15:00:27', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (345, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-04-08 15:00:52', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (346, '用户管理-修改', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-04-08 15:00:52', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (347, '用户管理-修改', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-04-08 15:03:42', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (348, '用户管理-修改', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-04-08 15:04:43', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (349, '用户管理-修改', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-04-08 15:04:45', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (350, '用户管理-修改', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-04-08 15:13:09', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (351, '用户管理-修改', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-04-08 15:13:14', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (352, '用户管理-修改', 'UPDATE', 'Post', 'Lucky_Nicke', '/admin/system/sysUser/updateUser', '127.0.0.1', '2026-04-08 15:13:18', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (353, '上传-上传图片', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadImage', '127.0.0.1', '2026-04-08 15:13:50', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (354, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-04-08 15:13:52', NULL, 0);
INSERT INTO `sys_oper_log` VALUES (355, '上传-上传视频', 'OTHER', 'Post', 'anonymousUser', '/admin/system/upload/uploadVideo', '127.0.0.1', '2026-04-08 15:14:00', NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'SYSTEM', 'admin', '2021-05-31 18:09:18', '2026-03-02 17:05:04', 0);
INSERT INTO `sys_role` VALUES (29, '用户', 'USER', NULL, '2026-03-02 17:05:19', '2026-03-02 17:05:27', 0);
INSERT INTO `sys_role` VALUES (30, '数据管理员', 'test_admin', NULL, '2026-03-14 21:09:04', NULL, 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NOT NULL DEFAULT 0,
  `menu_id` bigint(0) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 478 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (33, 21, 2, '2023-01-06 17:47:58', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (34, 21, 3, '2023-01-06 17:47:58', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (35, 21, 6, '2023-01-06 17:47:58', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (36, 21, 7, '2023-01-06 17:47:58', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (37, 21, 8, '2023-01-06 17:47:58', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (38, 21, 9, '2023-01-06 17:47:58', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (39, 21, 18, '2023-01-06 17:47:58', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (334, 1, 2, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (335, 1, 3, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (336, 1, 6, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (337, 1, 7, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (338, 1, 8, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (339, 1, 9, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (340, 1, 18, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (341, 1, 4, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (342, 1, 10, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (343, 1, 11, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (344, 1, 12, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (345, 1, 13, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (346, 1, 19, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (347, 1, 5, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (348, 1, 14, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (349, 1, 15, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (350, 1, 16, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (351, 1, 17, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (352, 1, 36, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (353, 1, 37, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (354, 1, 38, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (355, 1, 41, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (356, 1, 42, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (357, 1, 43, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (358, 1, 44, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (359, 1, 46, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (360, 1, 30, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (361, 1, 31, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (362, 1, 32, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (363, 1, 33, '2026-03-02 17:04:55', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (364, 29, 2, '2026-03-02 17:06:18', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (365, 29, 3, '2026-03-02 17:06:18', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (366, 29, 6, '2026-03-02 17:06:18', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (367, 29, 36, '2026-03-02 17:06:18', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (368, 29, 37, '2026-03-02 17:06:18', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (369, 29, 38, '2026-03-02 17:06:18', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (370, 29, 41, '2026-03-02 17:06:18', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (371, 1, 2, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (372, 1, 3, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (373, 1, 6, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (374, 1, 7, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (375, 1, 8, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (376, 1, 9, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (377, 1, 18, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (378, 1, 4, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (379, 1, 10, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (380, 1, 11, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (381, 1, 12, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (382, 1, 13, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (383, 1, 19, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (384, 1, 5, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (385, 1, 14, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (386, 1, 15, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (387, 1, 16, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (388, 1, 17, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (389, 1, 38, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (390, 1, 41, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (391, 1, 42, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (392, 1, 43, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (393, 1, 44, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (394, 1, 46, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (395, 1, 30, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (396, 1, 31, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (397, 1, 47, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (398, 1, 32, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (399, 1, 33, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (400, 1, 48, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (401, 1, 49, '2026-03-12 14:48:58', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (402, 30, 2, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (403, 30, 3, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (404, 30, 6, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (405, 30, 38, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (406, 30, 41, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (407, 30, 42, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (408, 30, 43, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (409, 30, 44, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (410, 30, 46, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (411, 30, 30, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (412, 30, 31, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (413, 30, 32, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (414, 30, 33, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (415, 30, 49, '2026-03-14 21:09:42', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (416, 30, 2, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (417, 30, 3, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (418, 30, 6, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (419, 30, 38, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (420, 30, 41, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (421, 30, 42, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (422, 30, 43, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (423, 30, 44, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (424, 30, 46, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (425, 30, 30, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (426, 30, 31, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (427, 30, 32, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (428, 30, 33, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (429, 30, 49, '2026-03-14 22:12:11', NULL, 1);
INSERT INTO `sys_role_menu` VALUES (430, 1, 2, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (431, 1, 3, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (432, 1, 6, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (433, 1, 7, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (434, 1, 8, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (435, 1, 9, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (436, 1, 18, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (437, 1, 4, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (438, 1, 10, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (439, 1, 11, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (440, 1, 12, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (441, 1, 13, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (442, 1, 19, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (443, 1, 5, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (444, 1, 14, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (445, 1, 15, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (446, 1, 16, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (447, 1, 17, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (448, 1, 38, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (449, 1, 41, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (450, 1, 42, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (451, 1, 43, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (452, 1, 44, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (453, 1, 46, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (454, 1, 30, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (455, 1, 31, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (456, 1, 47, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (457, 1, 32, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (458, 1, 33, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (459, 1, 48, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (460, 1, 49, '2026-03-14 22:12:20', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (461, 30, 2, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (462, 30, 3, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (463, 30, 6, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (464, 30, 38, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (465, 30, 41, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (466, 30, 42, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (467, 30, 43, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (468, 30, 44, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (469, 30, 46, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (470, 30, 30, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (471, 30, 31, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (472, 30, 32, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (473, 30, 33, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (474, 30, 49, '2026-04-08 15:00:02', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (475, 29, 2, '2026-04-08 15:00:10', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (476, 29, 3, '2026-04-08 15:00:10', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (477, 29, 8, '2026-04-08 15:00:10', NULL, 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '状态（1：正常 0：停用）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '96e79218965eb72c92a549dd5a330112', '管理员', '15099909888', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-02-04/1770190067720.jpg', '', 1, '2021-05-31 18:08:43', '2026-04-08 14:55:51', 0);
INSERT INTO `sys_user` VALUES (9, 'Lucky_Nicke', '96e79218965eb72c92a549dd5a330112', 'nicke', '13686811923', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-02-04/1770190031206.jpg', '123123', 1, '2026-02-27 16:05:50', '2026-04-08 15:13:18', 0);
INSERT INTO `sys_user` VALUES (53, 'sky71', '96e79218965eb72c92a549dd5a330112', '赵志远', '13862491735', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '喜欢摄影和旅行', 1, '2026-03-14 09:21:15', NULL, 0);
INSERT INTO `sys_user` VALUES (54, 'nova33', '96e79218965eb72c92a549dd5a330112', '王子晨', '13974261508', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '偶尔写写代码', 1, '2026-03-14 15:34:22', NULL, 0);
INSERT INTO `sys_user` VALUES (55, 'luna82', '96e79218965eb72c92a549dd5a330112', '陈嘉怡', '13791534620', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '喜欢猫和咖啡', 1, '2026-03-14 20:11:07', NULL, 0);
INSERT INTO `sys_user` VALUES (56, 'echo59', '96e79218965eb72c92a549dd5a330112', '李浩然', '13628461795', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '技术探索者', 1, '2026-03-14 11:05:41', NULL, 0);
INSERT INTO `sys_user` VALUES (57, 'pixel47', '96e79218965eb72c92a549dd5a330112', '孙宇航', '13876412930', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '游戏爱好者', 1, '2026-03-13 08:44:32', NULL, 0);
INSERT INTO `sys_user` VALUES (58, 'orbit92', '96e79218965eb72c92a549dd5a330112', '周诗涵', '13752364198', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '电影迷', 1, '2026-03-13 16:17:56', NULL, 0);
INSERT INTO `sys_user` VALUES (59, 'zen24', '96e79218965eb72c92a549dd5a330112', '吴俊凯', '13986427105', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '喜欢安静生活', 1, '2026-03-14 09:21:15', NULL, 0);
INSERT INTO `sys_user` VALUES (60, 'drift66', '96e79218965eb72c92a549dd5a330112', '刘梦婷', '13691582364', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '设计师', 1, '2026-03-14 15:34:22', NULL, 0);
INSERT INTO `sys_user` VALUES (61, 'alpha73', '96e79218965eb72c92a549dd5a330112', '杨子轩', '13851472639', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '热爱运动', 1, '2026-03-12 07:52:16', NULL, 0);
INSERT INTO `sys_user` VALUES (62, 'vector88', '96e79218965eb72c92a549dd5a330112', '郑可欣', '13912564738', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '音乐控', 1, '2026-03-12 12:31:45', NULL, 0);
INSERT INTO `sys_user` VALUES (63, 'gamma19', '96e79218965eb72c92a549dd5a330112', '何思远', '13794612580', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '写作爱好者', 1, '2026-03-12 19:14:50', NULL, 0);
INSERT INTO `sys_user` VALUES (64, 'terra55', '96e79218965eb72c92a549dd5a330112', '郭佳怡', '13645287163', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '喜欢做饭', 1, '2026-03-12 15:22:09', NULL, 0);
INSERT INTO `sys_user` VALUES (65, 'flare91', '96e79218965eb72c92a549dd5a330112', '宋志豪', '13873591426', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '科技爱好者', 1, '2026-03-14 15:34:22', NULL, 0);
INSERT INTO `sys_user` VALUES (66, 'orbit36', '96e79218965eb72c92a549dd5a330112', '冯雨桐', '13762485197', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '旅行记录者', 1, '2026-03-12 07:52:16', NULL, 0);
INSERT INTO `sys_user` VALUES (67, 'zenith27', '96e79218965eb72c92a549dd5a330112', '邓浩宇', '13941726358', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '篮球迷', 1, '2026-03-11 13:35:47', NULL, 0);
INSERT INTO `sys_user` VALUES (68, 'nova60', '96e79218965eb72c92a549dd5a330112', '梁诗雨', '13692451736', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '喜欢阅读', 1, '2026-03-11 21:16:28', NULL, 0);
INSERT INTO `sys_user` VALUES (69, 'pixel12', '96e79218965eb72c92a549dd5a330112', '韩子墨', '13817354629', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '程序员', 1, '2026-03-10 09:18:33', NULL, 0);
INSERT INTO `sys_user` VALUES (70, 'orbit44', '96e79218965eb72c92a549dd5a330112', '谢雨辰', '13791526483', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '动漫爱好者', 1, '2026-03-10 14:41:26', NULL, 0);
INSERT INTO `sys_user` VALUES (71, 'drift78', '96e79218965eb72c92a549dd5a330112', '许嘉豪', '13956427391', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '咖啡控', 1, '2026-03-11 13:35:47', NULL, 0);
INSERT INTO `sys_user` VALUES (72, 'zen50', '96e79218965eb72c92a549dd5a330112', '潘思琪', '13628475163', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '热爱设计', 1, '2026-03-08 11:20:57', NULL, 0);
INSERT INTO `sys_user` VALUES (73, 'echo90', '96e79218965eb72c92a549dd5a330112', '蒋浩然', '13864271593', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '摄影发烧友', 1, '2026-03-09 22:03:39', NULL, 0);
INSERT INTO `sys_user` VALUES (74, 'alpha34', '96e79218965eb72c92a549dd5a330112', '高梦洁', '13752391460', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '旅行达人', 1, '2026-03-09 17:55:02', NULL, 0);
INSERT INTO `sys_user` VALUES (75, 'vector71', '96e79218965eb72c92a549dd5a330112', '吕志鹏', '13981426357', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '喜欢编程', 1, '2026-03-09 12:16:44', NULL, 0);
INSERT INTO `sys_user` VALUES (76, 'terra65', '96e79218965eb72c92a549dd5a330112', '唐欣怡', '13671592438', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '音乐爱好者', 1, '2026-03-09 22:03:39', NULL, 0);
INSERT INTO `sys_user` VALUES (77, 'luna39', '96e79218965eb72c92a549dd5a330112', '曾子豪', '13852174630', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '户外运动', 1, '2026-03-08 07:49:25', NULL, 0);
INSERT INTO `sys_user` VALUES (78, 'nova84', '96e79218965eb72c92a549dd5a330112', '魏雨桐', '13786421539', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '看书写日记', 1, '2026-03-08 11:20:57', NULL, 0);
INSERT INTO `sys_user` VALUES (79, 'gamma52', '96e79218965eb72c92a549dd5a330112', '袁嘉豪', '13927546318', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '技术宅', 1, '2026-03-09 22:03:39', NULL, 0);
INSERT INTO `sys_user` VALUES (80, 'drift13', '96e79218965eb72c92a549dd5a330112', '董思雨', '13692475861', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '喜欢画画', 1, '2026-03-08 07:49:25', NULL, 0);
INSERT INTO `sys_user` VALUES (81, 'test', '96e79218965eb72c92a549dd5a330112', '用户31a6aa', '13822222222', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', NULL, 0, '2026-03-14 16:17:57', '2026-03-20 14:53:01', 0);
INSERT INTO `sys_user` VALUES (82, 'test_admin', '96e79218965eb72c92a549dd5a330112', 'test_admin', '13211111111', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', '123', 1, '2026-03-14 21:06:35', NULL, 1);
INSERT INTO `sys_user` VALUES (83, 'test_admin', '96e79218965eb72c92a549dd5a330112', 'test_admin', '13211111111', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773493683045.jpg', '123', 1, '2026-03-14 21:08:05', NULL, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '角色id',
  `user_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_admin_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (36, 22, 6, '2023-01-18 21:43:09', NULL, 0);
INSERT INTO `sys_user_role` VALUES (38, 2, 5, '2023-01-18 21:51:38', NULL, 0);
INSERT INTO `sys_user_role` VALUES (40, 22, 7, '2023-02-02 17:39:46', NULL, 0);
INSERT INTO `sys_user_role` VALUES (41, 2, 7, '2023-02-02 17:39:46', NULL, 0);
INSERT INTO `sys_user_role` VALUES (42, 21, 7, '2023-02-02 17:39:46', NULL, 0);
INSERT INTO `sys_user_role` VALUES (43, 2, 4, '2023-06-17 22:41:32', NULL, 0);
INSERT INTO `sys_user_role` VALUES (44, 8, 4, '2023-06-17 22:41:32', NULL, 0);
INSERT INTO `sys_user_role` VALUES (45, 9, 4, '2023-06-17 22:41:32', NULL, 0);
INSERT INTO `sys_user_role` VALUES (46, 10, 4, '2023-06-17 22:41:32', NULL, 0);
INSERT INTO `sys_user_role` VALUES (47, 11, 4, '2023-06-17 22:41:32', NULL, 0);
INSERT INTO `sys_user_role` VALUES (48, 18, 4, '2023-06-17 22:41:32', NULL, 0);
INSERT INTO `sys_user_role` VALUES (49, 1, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (50, 2, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (51, 8, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (52, 9, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (53, 10, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (54, 11, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (55, 12, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (56, 13, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (57, 14, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (58, 15, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (59, 16, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (60, 17, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (61, 18, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (62, 19, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (63, 20, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (64, 21, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (65, 22, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (66, 23, 8, '2026-01-30 15:57:19', NULL, 0);
INSERT INTO `sys_user_role` VALUES (105, 2, 1, '2026-03-02 17:06:28', NULL, 0);
INSERT INTO `sys_user_role` VALUES (106, 1, 1, '2026-03-02 17:06:28', NULL, 0);
INSERT INTO `sys_user_role` VALUES (107, 2, 9, '2026-03-02 17:06:31', NULL, 0);
INSERT INTO `sys_user_role` VALUES (108, 29, 9, '2026-03-02 17:06:31', NULL, 0);
INSERT INTO `sys_user_role` VALUES (109, 29, 52, '2026-03-11 11:18:38', NULL, 0);
INSERT INTO `sys_user_role` VALUES (110, 29, 81, '2026-03-14 16:17:57', NULL, 0);
INSERT INTO `sys_user_role` VALUES (111, 30, 83, '2026-03-14 21:09:51', NULL, 0);

-- ----------------------------
-- Table structure for video_appro
-- ----------------------------
DROP TABLE IF EXISTS `video_appro`;
CREATE TABLE `video_appro`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '审核序号',
  `video_id` int(0) NOT NULL COMMENT '影视id',
  `appro_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核状态（DOING/FAIL/SUCC）',
  `appro_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核id',
  `appro_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `appro_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `upload_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_appro
-- ----------------------------
INSERT INTO `video_appro` VALUES (18, 115, 'PASS', NULL, '2026-03-20 17:27:56', NULL, '2026-03-20 17:13:29', '2026-03-20 17:13:29', '1');
INSERT INTO `video_appro` VALUES (19, 116, 'REJECT', NULL, NULL, '栏目不正确！！', '2026-03-20 17:13:55', '2026-03-20 17:13:55', '1');
INSERT INTO `video_appro` VALUES (20, 117, 'CANCEL', NULL, NULL, NULL, '2026-03-20 17:19:41', '2026-03-20 17:19:41', '1');
INSERT INTO `video_appro` VALUES (21, 118, 'DOING', NULL, NULL, NULL, '2026-04-08 15:14:31', '2026-04-08 15:14:31', '9');

-- ----------------------------
-- Table structure for video_comment
-- ----------------------------
DROP TABLE IF EXISTS `video_comment`;
CREATE TABLE `video_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `video_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频ID',
  `user_id` bigint(0) NOT NULL COMMENT '评论用户ID',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父评论ID',
  `root_id` bigint(0) NULL DEFAULT NULL COMMENT '根评论ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `like_count` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `reply_count` int(0) NOT NULL DEFAULT 0 COMMENT '回复数',
  `status` tinyint(0) NOT NULL DEFAULT 1 COMMENT '状态(1正常 0屏蔽 2删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '删除标识（0未删除 1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 653 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_comment
-- ----------------------------
INSERT INTO `video_comment` VALUES (647, '115', 1, NULL, 647, '321', 0, 0, 1, '2026-03-21 20:53:26', '2026-03-23 17:57:26', 1);
INSERT INTO `video_comment` VALUES (648, '115', 1, NULL, 648, 'test', 0, 0, 1, '2026-03-21 20:58:34', '2026-03-23 17:48:35', 1);
INSERT INTO `video_comment` VALUES (649, '115', 1, 648, 648, 'test', 0, 0, 1, '2026-03-21 20:58:39', '2026-03-23 17:12:10', 1);
INSERT INTO `video_comment` VALUES (650, '115', 1, NULL, 650, '感觉视频不错欸', 0, 0, 1, '2026-03-23 18:25:38', '2026-04-08 15:15:47', 0);
INSERT INTO `video_comment` VALUES (651, '115', 9, 650, 650, '确实我也觉得不错！！', 0, 1, 1, '2026-03-23 18:26:06', '2026-04-08 15:15:47', 1);
INSERT INTO `video_comment` VALUES (652, '115', 1, 651, 650, '是吧，我没骗你吧！', 0, 0, 1, '2026-03-23 18:26:24', '2026-03-23 18:26:24', 0);

-- ----------------------------
-- Table structure for video_danmaku
-- ----------------------------
DROP TABLE IF EXISTS `video_danmaku`;
CREATE TABLE `video_danmaku`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '弹幕ID',
  `video_id` bigint(0) NOT NULL COMMENT '视频ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '弹幕内容',
  `play_time` double(11, 4) NOT NULL COMMENT '弹幕出现时间(秒)',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#000000' COMMENT '弹幕颜色',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '删除标识（0未删除 1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频弹幕表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_danmaku
-- ----------------------------
INSERT INTO `video_danmaku` VALUES (88, 115, 1, '12312', 1.3047, '#000000', '2026-03-21 20:53:23', NULL, 0);
INSERT INTO `video_danmaku` VALUES (89, 115, 1, 'ad', 0.0000, '#000000', '2026-03-21 20:55:27', NULL, 0);
INSERT INTO `video_danmaku` VALUES (90, 115, 1, 'test', 3.6566, '#000000', '2026-03-21 20:57:49', NULL, 0);

-- ----------------------------
-- Table structure for video_like_log
-- ----------------------------
DROP TABLE IF EXISTS `video_like_log`;
CREATE TABLE `video_like_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `video_id` bigint(0) NULL DEFAULT NULL COMMENT '视频ID',
  `comment_id` bigint(0) NULL DEFAULT NULL COMMENT '评论ID',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（comment/video）',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '点赞状态 1点赞 0取消',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除 0未删 1已删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频点赞日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_like_log
-- ----------------------------
INSERT INTO `video_like_log` VALUES (59, 1, 114, NULL, 'video', 1, '2026-03-20 17:00:09', '2026-03-20 17:00:09', 0);
INSERT INTO `video_like_log` VALUES (60, 1, 115, NULL, 'video', 0, '2026-03-21 20:53:24', '2026-03-21 20:53:24', 0);

-- ----------------------------
-- Table structure for video_stat
-- ----------------------------
DROP TABLE IF EXISTS `video_stat`;
CREATE TABLE `video_stat`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `video_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频ID',
  `visit_pv` bigint(0) NOT NULL DEFAULT 0 COMMENT '访问量(PV)',
  `like_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `play_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '删除标识（0未删除 1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频统计汇总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_stat
-- ----------------------------
INSERT INTO `video_stat` VALUES (65, '113', 0, 0, 0, '2026-03-20 16:54:20', '2026-03-20 16:55:18', 1);
INSERT INTO `video_stat` VALUES (66, '114', 15, 1, 1, '2026-03-20 16:55:46', '2026-03-23 17:22:56', 0);
INSERT INTO `video_stat` VALUES (67, '115', 52, 0, 2, '2026-03-20 17:13:30', '2026-04-08 15:15:47', 0);
INSERT INTO `video_stat` VALUES (68, '116', 0, 0, 0, '2026-03-20 17:13:55', '2026-03-20 17:27:53', 1);
INSERT INTO `video_stat` VALUES (69, '117', 0, 0, 0, '2026-03-20 17:19:42', '2026-03-20 17:27:30', 1);
INSERT INTO `video_stat` VALUES (70, '118', 0, 0, 0, '2026-04-08 15:14:32', NULL, 0);

-- ----------------------------
-- Table structure for video_watch_log
-- ----------------------------
DROP TABLE IF EXISTS `video_watch_log`;
CREATE TABLE `video_watch_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `video_id` bigint(0) NOT NULL COMMENT '视频ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除 0未删 1已删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户观看记录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_watch_log
-- ----------------------------
INSERT INTO `video_watch_log` VALUES (16, 1, 114, '2026-03-20 17:00:36', '2026-03-20 17:00:36', 0);
INSERT INTO `video_watch_log` VALUES (17, 1, 114, '2026-03-20 21:09:42', '2026-03-20 21:09:42', 0);
INSERT INTO `video_watch_log` VALUES (18, 1, 114, '2026-03-20 21:10:34', '2026-03-20 21:10:34', 0);
INSERT INTO `video_watch_log` VALUES (19, 1, 115, '2026-03-21 20:53:26', '2026-03-21 20:53:26', 0);
INSERT INTO `video_watch_log` VALUES (20, 1, 115, '2026-03-21 20:57:50', '2026-03-21 20:57:50', 0);

SET FOREIGN_KEY_CHECKS = 1;
