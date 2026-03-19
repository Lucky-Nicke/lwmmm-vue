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

 Date: 19/03/2026 13:00:54
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
) ENGINE = InnoDB AUTO_INCREMENT = 275 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

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
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容描述',
  `keyword` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关键字，用来搜索',
  `director` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '作者姓名',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `is_approval` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '是否审核标识（0未审核 1已审核  2取消审核）',
  `play_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '播放id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(0) NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie
-- ----------------------------
INSERT INTO `sys_movie` VALUES (47, '城市边缘', '电视剧', '都市青年奋斗故事', '都市', 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-08 09:12:11', '2026-03-08 09:12:11', 0);
INSERT INTO `sys_movie` VALUES (48, '星际航线', '电影', '人类探索宇宙深处', '科幻,宇宙', 'Lucky_Nicke', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-08 13:41:33', '2026-03-08 13:41:33', 0);
INSERT INTO `sys_movie` VALUES (49, '快乐大本营2', '综艺', '明星互动游戏综艺', '娱乐,综艺', 'sky71', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 10:11:43', '2026-03-08 18:22:44', 0);
INSERT INTO `sys_movie` VALUES (50, '幻想大陆', '动漫', '少年冒险奇幻旅程', '动漫,冒险', 'nova33', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 10:11:43', '2026-03-08 21:03:17', 0);
INSERT INTO `sys_movie` VALUES (51, '青春时刻', '网剧', '校园青春成长故事', '青春,校园', 'luna82', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 10:11:43', '2026-03-08 16:55:02', 0);
INSERT INTO `sys_movie` VALUES (52, '深海日记', '纪录片', '海洋世界真实记录', '自然,纪录', 'echo59', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-08 11:36:28', '2026-03-08 11:36:28', 0);
INSERT INTO `sys_movie` VALUES (53, '邻里故事', '肥皂剧', '家庭邻里情感纠葛', '家庭,情感', 'pixel47', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-08 14:20:54', '2026-03-08 14:20:54', 0);
INSERT INTO `sys_movie` VALUES (54, '风云都市', '电视剧', '权力与欲望交织', '都市,剧情', 'orbit92', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 10:11:43', '2026-03-09 10:11:43', 0);
INSERT INTO `sys_movie` VALUES (55, '未来战争', '电影', '机器人统治世界', '科幻,战争', 'zen24', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-11 08:44:12', '2026-03-09 18:31:26', 0);
INSERT INTO `sys_movie` VALUES (56, '明星挑战', '综艺', '明星竞技真人秀', '娱乐,真人秀', 'drift66', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-11 08:44:12', '2026-03-09 20:19:12', 0);
INSERT INTO `sys_movie` VALUES (57, '魔法学院', '动漫', '魔法世界成长故事', '魔法,动漫', 'alpha73', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-11 08:44:12', '2026-03-09 15:22:44', 0);
INSERT INTO `sys_movie` VALUES (58, '恋爱旅途', '网剧', '旅行中的爱情故事', '爱情,旅行', 'vector88', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 12:04:55', '2026-03-09 12:04:55', 0);
INSERT INTO `sys_movie` VALUES (59, '极地探险', '纪录片', '南极探险真实记录', '探险,纪录', 'gamma19', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-08 11:36:28', '2026-03-09 08:48:19', 0);
INSERT INTO `sys_movie` VALUES (60, '家庭秘密', '肥皂剧', '家庭背后的秘密', '家庭,生活', 'terra55', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-08 11:36:28', '2026-03-09 21:37:02', 0);
INSERT INTO `sys_movie` VALUES (61, '暗夜追踪', '电视剧', '警方侦破悬疑案件', '刑侦,悬疑', 'flare91', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-08 11:36:28', '2026-03-10 09:55:34', 0);
INSERT INTO `sys_movie` VALUES (62, '地心冒险', '电影', '深入地心探索', '冒险,科幻', 'orbit36', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-08 11:36:28', '2026-03-10 14:31:26', 0);
INSERT INTO `sys_movie` VALUES (63, '明星厨房', '综艺', '明星挑战厨艺', '美食,综艺', 'zenith27', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-10 19:42:11', '2026-03-10 19:42:11', 0);
INSERT INTO `sys_movie` VALUES (64, '龙骑士', '动漫', '骑士与巨龙的战争', '奇幻,动漫', 'nova60', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 10:11:43', '2026-03-10 22:01:03', 0);
INSERT INTO `sys_movie` VALUES (65, '校园恋歌', '网剧', '校园甜蜜爱情', '爱情,校园', 'pixel12', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-10 16:12:49', '2026-03-10 16:12:49', 0);
INSERT INTO `sys_movie` VALUES (66, '历史真相', '纪录片', '揭秘历史事件', '历史,纪录', 'orbit44', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-10 11:26:14', '2026-03-10 11:26:14', 0);
INSERT INTO `sys_movie` VALUES (67, '婆媳之间', '肥皂剧', '婆媳关系真实故事', '家庭,情感', 'drift78', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-10 13:05:27', '2026-03-10 13:05:27', 0);
INSERT INTO `sys_movie` VALUES (68, '破案风暴', '电视剧', '刑警破获连环案件', '悬疑,警匪', 'zen50', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-11 08:44:12', '2026-03-11 08:44:12', 0);
INSERT INTO `sys_movie` VALUES (69, '银河探索', '电影', '宇航员寻找新星球', '科幻,太空', 'echo90', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 10:11:43', '2026-03-11 17:23:55', 0);
INSERT INTO `sys_movie` VALUES (70, '欢乐喜剧人', '综艺', '喜剧演员舞台竞技', '喜剧,综艺', 'alpha34', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-11 19:52:11', '2026-03-11 19:52:11', 0);
INSERT INTO `sys_movie` VALUES (71, '精灵世界', '动漫', '精灵守护大陆', '奇幻,动漫', 'vector71', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 10:11:43', '2026-03-11 21:33:29', 0);
INSERT INTO `sys_movie` VALUES (72, '创业青春', '网剧', '年轻人创业奋斗', '青春,创业', 'terra65', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-11 14:12:03', '2026-03-11 14:12:03', 0);
INSERT INTO `sys_movie` VALUES (73, '自然奥秘', '纪录片', '自然界奇妙现象', '自然,科学', 'luna39', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-11 10:15:37', '2026-03-11 10:15:37', 0);
INSERT INTO `sys_movie` VALUES (74, '邻家爱情', '肥皂剧', '邻居之间的爱情', '爱情,家庭', 'nova84', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-10 09:55:34', '2026-03-11 12:33:44', 0);
INSERT INTO `sys_movie` VALUES (75, '商战时代', '电视剧', '企业竞争故事', '商业,剧情', 'gamma52', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-10 09:55:34', '2026-03-12 09:22:17', 0);
INSERT INTO `sys_movie` VALUES (76, '末日逃亡', '电影', '灾难降临后的生存', '灾难,剧情', 'drift13', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-12 16:18:36', '2026-03-12 16:18:36', 0);
INSERT INTO `sys_movie` VALUES (77, '明星运动会', '综艺', '明星体育竞技', '体育,娱乐', 'test', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-12 20:27:51', '2026-03-12 20:27:51', 0);
INSERT INTO `sys_movie` VALUES (78, '机甲战士', '动漫', '未来机甲战争', '机甲,科幻', 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-09 10:11:43', '2026-03-12 22:41:19', 0);
INSERT INTO `sys_movie` VALUES (79, '再见青春', '网剧', '毕业后的成长', '青春,成长', 'Lucky_Nicke', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-12 11:35:27', '2026-03-12 11:35:27', 0);
INSERT INTO `sys_movie` VALUES (80, '文明谜团', '纪录片', '消失文明揭秘', '历史,文明', 'sky71', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-12 13:14:45', '2026-03-12 13:14:45', 0);
INSERT INTO `sys_movie` VALUES (81, '家庭风波', '肥皂剧', '家庭情感故事', '家庭,生活', 'nova33', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-12 18:05:12', '2026-03-12 18:05:12', 0);
INSERT INTO `sys_movie` VALUES (82, '暗影行动', '电视剧', '秘密行动任务', '动作,悬疑', 'luna82', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-13 08:45:36', '2026-03-13 08:45:36', 0);
INSERT INTO `sys_movie` VALUES (83, '深海危机', '电影', '潜艇遇险故事', '灾难,冒险', 'echo59', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-13 15:29:14', '2026-03-13 15:29:14', 0);
INSERT INTO `sys_movie` VALUES (84, '音乐盛典', '综艺', '歌手音乐竞技', '音乐,娱乐', 'pixel47', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-13 21:14:48', '2026-03-13 21:14:48', 0);
INSERT INTO `sys_movie` VALUES (85, '幻想之城', '动漫', '少年守护城市', '奇幻,动漫', 'orbit92', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-13 19:32:21', '2026-03-13 19:32:21', 0);
INSERT INTO `sys_movie` VALUES (86, '恋爱日常', '网剧', '甜蜜恋爱故事', '爱情,甜宠', 'zen24', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-13 11:22:55', '2026-03-13 11:22:55', 0);
INSERT INTO `sys_movie` VALUES (87, '极地挑战', '纪录片', '极地环境挑战', '探险,自然', 'drift66', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-13 09:03:44', '2026-03-13 09:03:44', 0);
INSERT INTO `sys_movie` VALUES (88, '邻居往事', '肥皂剧', '邻居情感纠纷', '生活,情感', 'alpha73', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-13 17:10:06', '2026-03-13 17:10:06', 0);
INSERT INTO `sys_movie` VALUES (89, '时代浪潮', '电视剧', '时代背景人生故事', '历史,剧情', 'vector88', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-14 09:12:33', '2026-03-14 09:12:33', 0);
INSERT INTO `sys_movie` VALUES (90, '宇宙信号', '电影', '神秘宇宙信号出现', '科幻,悬疑', 'gamma19', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-14 16:48:41', '2026-03-14 16:48:41', 0);
INSERT INTO `sys_movie` VALUES (91, '欢乐碰撞', '综艺', '搞笑互动节目', '搞笑,娱乐', 'terra55', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-14 20:11:54', '2026-03-14 20:11:54', 0);
INSERT INTO `sys_movie` VALUES (92, '幻想冒险', '动漫', '勇者拯救世界', '奇幻,冒险', 'flare91', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-14 18:33:26', '2026-03-14 18:33:26', 0);
INSERT INTO `sys_movie` VALUES (93, '甜蜜时光', '网剧', '甜宠爱情故事', '爱情,甜宠', 'orbit36', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-14 12:09:07', '2026-03-14 12:09:07', 0);
INSERT INTO `sys_movie` VALUES (94, '自然传奇', '纪录片', '自然界奇观记录', '自然,纪录', 'zenith27', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-14 10:55:31', '2026-03-14 10:55:31', 0);
INSERT INTO `sys_movie` VALUES (95, '家庭温度', '肥皂剧', '家庭温暖故事', '家庭,生活', 'nova60', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773477908226.jpg', '1', '60f03e361f8271f1be757511979f0102', '2026-03-14 14:24:19', '2026-03-14 16:45:56', 0);
INSERT INTO `sys_movie` VALUES (101, '231312321', '电视剧', '32131321', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773888320203.jpg', '2', '601ae6aa233d71f19f817511978f0102', '2026-03-19 10:45:24', NULL, 0);
INSERT INTO `sys_movie` VALUES (102, '321', '电影', '21312', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773888696221.jpg', '0', '2083188b233e71f1be8a7511979f0102', '2026-03-19 10:51:49', '2026-03-19 10:52:02', 0);
INSERT INTO `sys_movie` VALUES (103, '32131', '综艺', '22222222', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773888734295.jpg', '1', 'a055a0a1233e71f18a61640086ac0102', '2026-03-19 10:52:18', '2026-03-19 10:52:31', 0);
INSERT INTO `sys_movie` VALUES (104, '12321', '动漫', '3333', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773890108844.jpg', '2', '408544d5234171f1a357640086ad0102', '2026-03-19 11:15:14', NULL, 0);
INSERT INTO `sys_movie` VALUES (105, '3333', '网剧', '3333333333333333333333333333', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773890123465.jpg', '0', '309405de234171f1a357640086ad0102', '2026-03-19 11:15:28', '2026-03-19 11:15:42', 0);
INSERT INTO `sys_movie` VALUES (106, '3333333333333333333333333333333333', '纪录片', '2141241', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773890156408.jpg', '1', '0021e0f1234171f180390361c0c70102', '2026-03-19 11:16:01', '2026-03-19 11:16:15', 0);
INSERT INTO `sys_movie` VALUES (107, '123231', '肥皂剧', '321313', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773890212898.jpg', '0', '20904d13234271f1be8b7511979f0102', '2026-03-19 11:16:56', '2026-03-19 12:42:56', 0);
INSERT INTO `sys_movie` VALUES (108, '123', '综艺', '3211', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773895282790.jpg', '1', '004507e1234d71f191880360d1d70102', '2026-03-19 12:41:28', '2026-03-19 12:43:00', 0);
INSERT INTO `sys_movie` VALUES (109, '123', '电视剧', '321', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773895459217.png', '2', '20b1fd49234e71f19f817511978f0102', '2026-03-19 12:44:23', NULL, 0);
INSERT INTO `sys_movie` VALUES (110, '321111', '综艺', '11111', NULL, 'admin', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-19/1773896192897.jpg', '2', 'e02d64ff234f71f19f817511978f0102', '2026-03-19 12:56:37', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 259 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 461 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_role_menu` VALUES (416, 30, 2, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (417, 30, 3, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (418, 30, 6, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (419, 30, 38, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (420, 30, 41, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (421, 30, 42, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (422, 30, 43, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (423, 30, 44, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (424, 30, 46, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (425, 30, 30, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (426, 30, 31, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (427, 30, 32, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (428, 30, 33, '2026-03-14 22:12:11', NULL, 0);
INSERT INTO `sys_role_menu` VALUES (429, 30, 49, '2026-03-14 22:12:11', NULL, 0);
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
INSERT INTO `sys_user` VALUES (1, 'admin', '96e79218965eb72c92a549dd5a330112', '管理员', '15099909888', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-02-04/1770190067720.jpg', '', 1, '2021-05-31 18:08:43', '2026-03-14 14:40:26', 0);
INSERT INTO `sys_user` VALUES (9, 'Lucky_Nicke', '96e79218965eb72c92a549dd5a330112', 'nicke', '13686811923', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-02-04/1770190031206.jpg', '', 0, '2026-02-27 16:05:50', '2026-03-14 14:58:24', 0);
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
INSERT INTO `sys_user` VALUES (81, 'test', '96e79218965eb72c92a549dd5a330112', '用户31a6aa', '13822222222', 'http://file.lanxige.club/img/yq-third-lwmmm/Default/identicon.png', NULL, 0, '2026-03-14 16:17:57', '2026-03-14 22:11:22', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频审核表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_appro
-- ----------------------------
INSERT INTO `video_appro` VALUES (6, 101, 'CANCEL', NULL, NULL, NULL, '2026-03-19 10:45:24', '2026-03-19 12:55:58', '1');
INSERT INTO `video_appro` VALUES (7, 102, 'REJECT', '1', NULL, '1111111', '2026-03-19 10:51:49', '2026-03-19 12:55:58', '1');
INSERT INTO `video_appro` VALUES (8, 103, 'PASS', '1', NULL, NULL, '2026-03-19 10:52:17', '2026-03-19 12:55:58', '1');
INSERT INTO `video_appro` VALUES (9, 104, 'CANCEL', NULL, NULL, NULL, '2026-03-19 11:15:14', '2026-03-19 12:55:58', '1');
INSERT INTO `video_appro` VALUES (10, 105, 'REJECT', '1', NULL, 'ewqeq', '2026-03-19 11:15:27', '2026-03-19 12:55:58', '1');
INSERT INTO `video_appro` VALUES (11, 106, 'PASS', '1', '2026-03-19 11:16:15', NULL, '2026-03-19 11:16:00', '2026-03-19 12:55:58', '1');
INSERT INTO `video_appro` VALUES (12, 107, 'REJECT', '1', NULL, '321', '2026-03-19 11:16:56', '2026-03-19 12:55:58', '1');
INSERT INTO `video_appro` VALUES (13, 108, 'PASS', '1', '2026-03-19 12:43:00', NULL, '2026-03-19 12:41:27', '2026-03-19 12:55:58', '1');
INSERT INTO `video_appro` VALUES (14, 109, 'CANCEL', NULL, NULL, NULL, '2026-03-19 12:44:23', '2026-03-19 12:55:53', '1');
INSERT INTO `video_appro` VALUES (15, 110, 'CANCEL', NULL, NULL, NULL, '2026-03-19 12:56:36', '2026-03-19 12:56:36', '1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 644 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_comment
-- ----------------------------
INSERT INTO `video_comment` VALUES (120, '47', 77, NULL, NULL, '这事儿发生得也太突然了吧，看得我一愣一愣的。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (121, '47', 65, NULL, NULL, '真是个大新闻啊，感觉整个圈子都要炸了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (122, '47', 61, NULL, NULL, '楼上的说得对，我也是这么想的。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (123, '47', 58, NULL, NULL, '谁能想到会是这样的结果，剧情反转得太厉害了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (124, '47', 71, NULL, NULL, '顶顶顶，这个观点我举双手赞成！', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (125, '47', 53, NULL, NULL, '今天刚听说这事儿，果然细节都在评论区里。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (126, '47', 75, NULL, NULL, '这瓜可真甜，我先搬个小板凳坐好。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (127, '47', 63, NULL, NULL, '事情的真相竟然是这样，细思极恐。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (128, '47', 54, NULL, NULL, '笑死我了，这操作简直绝了。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (129, '47', 78, NULL, NULL, '不说了，我已经开始期待后续发展了。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (130, '48', 68, NULL, NULL, '这波操作真是让人意想不到，服气。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (131, '48', 72, NULL, NULL, '事情的发展越来越有意思了，坐等吃瓜。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (132, '48', 59, NULL, NULL, '这下热闹了，感觉要出大事。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (133, '48', 56, NULL, NULL, '看到这里，我已经震惊得说不出话来了。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (134, '48', 79, NULL, NULL, '原来如此，是我之前想错了。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (135, '48', 64, NULL, NULL, '家人们谁懂啊，这剧情也太刺激了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (136, '48', 69, NULL, NULL, '这事儿我看悬，后面肯定还有戏。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (137, '48', 62, NULL, NULL, '哈哈，果然是这样，我就知道。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (138, '48', 74, NULL, NULL, '这评论区比视频本身还精彩。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (139, '48', 67, NULL, NULL, '支持一下，说得很在理。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (140, '49', 57, NULL, NULL, '这事儿传开了，今天所有人都在聊。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (141, '49', 60, NULL, NULL, '笑不活了，这反转来得猝不及防。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (142, '49', 66, NULL, NULL, '我宣布，这就是年度最佳操作。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (143, '49', 55, NULL, NULL, '没想到啊，真没想到会是这个走向。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (144, '49', 73, NULL, NULL, '楼上总结得精辟，醍醐灌顶。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (145, '49', 61, NULL, NULL, '这瓜保熟吗？我先预定了第一排座位。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (146, '49', 70, NULL, NULL, '事实证明，吃瓜群众的眼睛是雪亮的。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (147, '49', 58, NULL, NULL, '我已经开始脑补下一集的剧情了。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (148, '49', 76, NULL, NULL, '真相只有一个，但评论有一万条。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (149, '49', 65, NULL, NULL, '这下有好戏看了，大家散开别围堵。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (150, '50', 78, NULL, NULL, '这事儿闹得，感觉天都要塌下来了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (151, '50', 63, NULL, NULL, '家人们，都来看看这个大瓜。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (152, '50', 54, NULL, NULL, '这操作简直是教科书级别的，学到了。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (153, '50', 71, NULL, NULL, '笑死，这波我站评论区，不解释。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (154, '50', 59, NULL, NULL, '事情的全貌原来是这样，涨知识了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (155, '50', 67, NULL, NULL, '楼上的分析很到位，逻辑清晰。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (156, '50', 75, NULL, NULL, '这剧情比我看过的小说还精彩。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (157, '50', 56, NULL, NULL, '果然，吃瓜要吃最新的，这个够新鲜。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (158, '50', 69, NULL, NULL, '我宣布，这条视频我已经三连了。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (159, '50', 62, NULL, NULL, '不多说了，我要去消化一下这个信息。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (160, '51', 74, NULL, NULL, '这下好了，整个社区都沸腾了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (161, '51', 53, NULL, NULL, '这操作真是神来之笔，惊为天人。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (162, '51', 68, NULL, NULL, '笑不出来了，这事儿太魔幻了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (163, '51', 64, NULL, NULL, '坐等后续，希望不要烂尾。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (164, '51', 77, NULL, NULL, '真相大白了，果然是我想的那样。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (165, '51', 61, NULL, NULL, '支持正义发声，我们都在看着呢。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (166, '51', 58, NULL, NULL, '这个瓜我已经吃了好几遍了，回味无穷。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (167, '51', 72, NULL, NULL, '没想到你小子还有这一手，牛。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (168, '51', 60, NULL, NULL, '我已经把这个故事讲给朋友们听了。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (169, '51', 66, NULL, NULL, '这评论区简直是人才济济，佩服佩服。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (170, '52', 79, NULL, NULL, '这事儿可真够劲爆的，直接上热搜了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (171, '52', 57, NULL, NULL, '我先来占个沙发，这瓜我吃定了。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (172, '52', 65, NULL, NULL, '楼上的发言非常有见地，点个赞。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (173, '52', 73, NULL, NULL, '这剧情发展得跟电视剧一样，太假了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (174, '52', 69, NULL, NULL, '笑死，这波操作我给满分。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (175, '52', 55, NULL, NULL, '没想到，这也能被挖出来，厉害。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (176, '52', 70, NULL, NULL, '真相往往比传闻更加惊人。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (177, '52', 62, NULL, NULL, '家人们，都来看啊，这里有大事发生。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (178, '52', 67, NULL, NULL, '这事儿我看悬，后面肯定还有料。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (179, '52', 59, NULL, NULL, '不多说了，我先去翻翻以前的帖子。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (180, '53', 63, NULL, NULL, '这事儿终于有眉目了，大家都等着呢。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (181, '53', 56, NULL, NULL, '笑不活了，这操作简直是降维打击。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (182, '53', 76, NULL, NULL, '这瓜的含糖量有点高，我得缓缓。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (183, '53', 61, NULL, NULL, '果然，真相只有一个，感谢科普。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (184, '53', 71, NULL, NULL, '这波我站视频作者，支持原创精神。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (185, '53', 54, NULL, NULL, '楼上的楼上的发言让我恍然大悟。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (186, '53', 68, NULL, NULL, '我已经把这个视频收藏起来了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (187, '53', 74, NULL, NULL, '这事儿还没完，我觉得还有后续。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (188, '53', 60, NULL, NULL, '家人们，这波不冲，更待何时？', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (189, '53', 78, NULL, NULL, '不多说了，我先去外面透透气。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (190, '54', 64, NULL, NULL, '这事儿一出，整个广场都炸锅了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (191, '54', 59, NULL, NULL, '笑死，这操作我是真的学不会。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (192, '54', 72, NULL, NULL, '这剧情也太离谱了，编剧都不敢这么写。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (193, '54', 66, NULL, NULL, '楼上的发言一针见血，说出了我的心声。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (194, '54', 57, NULL, NULL, '我已经开始期待明天的新闻头条了。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (195, '54', 75, NULL, NULL, '这瓜可真大，我现在满脑子都是问号。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (196, '54', 62, NULL, NULL, '不愧是专业人士，分析得头头是道。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (197, '54', 70, NULL, NULL, '这事儿得持续关注，不能掉以轻心。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (198, '54', 55, NULL, NULL, '笑不活了，这评论区比视频还有意思。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (199, '54', 69, NULL, NULL, '不多说了，我要去洗洗眼睛和耳朵。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (200, '55', 67, NULL, NULL, '这事儿总算有个说法了，大家放心了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (201, '55', 58, NULL, NULL, '笑死，这波操作简直是艺术品。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (202, '55', 77, NULL, NULL, '我已经把这个瓜分享给所有朋友了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (203, '55', 65, NULL, NULL, '这下热闹了，各种小作文都来了。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (204, '55', 73, NULL, NULL, '楼上的发言让我陷入了沉思。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (205, '55', 61, NULL, NULL, '这事儿告诉我们，永远不要轻易下结论。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (206, '55', 56, NULL, NULL, '家人们，这瓜我先替你们尝过了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (207, '55', 79, NULL, NULL, '这操作我给满分，不愧是你。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (208, '55', 63, NULL, NULL, '真相大白的感觉，真爽。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (209, '55', 71, NULL, NULL, '不多说了，我先去外面冷静一下。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (210, '56', 60, NULL, NULL, '这事儿一出，所有人都在转发。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (211, '56', 54, NULL, NULL, '笑不活了，这反转来得毫无征兆。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (212, '56', 68, NULL, NULL, '这波操作真是让人拍案叫绝。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (213, '56', 76, NULL, NULL, '楼上的分析很到位，逻辑闭环了。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (214, '56', 64, NULL, NULL, '我已经把这个视频置顶收藏了。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (215, '56', 57, NULL, NULL, '这瓜的含金量太高了，需要消化一阵子。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (216, '56', 74, NULL, NULL, '这事儿还得看官方怎么说。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (217, '56', 62, NULL, NULL, '家人们，这波一定要看完，信息量巨大。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (218, '56', 70, NULL, NULL, '不说了，我先去喝口水压压惊。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (219, '56', 59, NULL, NULL, '真相就是如此，容不得半点虚假。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (220, '57', 66, NULL, NULL, '这事儿可真够轰动的，我刚从朋友圈看到。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (221, '57', 55, NULL, NULL, '笑死，这操作简直是年度最佳。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (222, '57', 78, NULL, NULL, '楼上的发言让我茅塞顿开，醍醐灌顶。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (223, '57', 69, NULL, NULL, '这剧情比小说还精彩，编剧都自愧不如。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (224, '57', 61, NULL, NULL, '我已经把这个故事当成段子讲给别人听了。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (225, '57', 58, NULL, NULL, '这瓜的瓜瓤都快被我吃干净了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (226, '57', 72, NULL, NULL, '这波我站理性发言，反对无端猜测。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (227, '57', 67, NULL, NULL, '家人们，都来关注一下，这里有大事。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (228, '57', 53, NULL, NULL, '不愧是老司机，分析得一针见血。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (229, '57', 75, NULL, NULL, '不多说了，我要去洗洗我的三观。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (230, '58', 65, NULL, NULL, '这事儿可真够劲爆的，整个圈子都炸了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (231, '58', 60, NULL, NULL, '笑不活了，这操作我服，真是绝了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (232, '58', 73, NULL, NULL, '楼上的发言太有道理了，我表示赞同。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (233, '58', 56, NULL, NULL, '这剧情发展得也太快了，我都跟不上节奏了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (234, '58', 79, NULL, NULL, '我已经把这个视频发到群里了，大家一起看。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (235, '58', 63, NULL, NULL, '这瓜可真甜，我先搬个小马扎坐好。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (236, '58', 71, NULL, NULL, '这事儿还没结束，我觉得后面还有戏。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (237, '58', 59, NULL, NULL, '笑死，这评论区简直是卧虎藏龙。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (238, '58', 68, NULL, NULL, '不说了，我先去外面吹吹风冷静一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (239, '58', 76, NULL, NULL, '真相只有一个，感谢有人把线索串起来了。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (240, '59', 64, NULL, NULL, '这事儿总算水落石出了，大家都不用猜了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (241, '59', 57, NULL, NULL, '笑死，这波操作简直是教科书级别的。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (242, '59', 74, NULL, NULL, '楼上的分析太到位了，完全把我心里想的说出来。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (243, '59', 62, NULL, NULL, '这剧情也太魔幻了，编剧都不敢这么编。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (244, '59', 70, NULL, NULL, '我已经把这个视频加入了我的年度回顾。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (245, '59', 55, NULL, NULL, '这瓜的含水量有点高，我得缓缓再吃。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (246, '59', 69, NULL, NULL, '家人们，都来围观一下，这里是第一现场。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (247, '59', 58, NULL, NULL, '这事儿告诉我们，永远不要相信第一印象。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (248, '59', 77, NULL, NULL, '不愧是老江湖，一句话就点破了关键。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (249, '59', 66, NULL, NULL, '不多说了，我要去重新梳理一遍时间线。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (250, '60', 53, NULL, NULL, '这事儿闹得，感觉全世界都知道了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (251, '60', 67, NULL, NULL, '笑不活了，这操作真是神来之笔。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (252, '60', 75, NULL, NULL, '楼上的发言让我对这件事有了新的认识。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (253, '60', 61, NULL, NULL, '这瓜的含糖量超标了，我得含着吃。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (254, '60', 59, NULL, NULL, '我已经把这个故事写进我的日记里了。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (255, '60', 72, NULL, NULL, '这波我站客观公正，不吃任何一方的瓜。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (256, '60', 65, NULL, NULL, '家人们，这波热度，必须得蹭一下。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (257, '60', 56, NULL, NULL, '真相大白的感觉真是太好了。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (258, '60', 78, NULL, NULL, '这事儿还没完，我准备好了瓜子和小板凳。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (259, '60', 63, NULL, NULL, '不说了，我先去外面透透气，压压惊。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (260, '61', 71, NULL, NULL, '这事儿可真够轰动的，现在是全网热点。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (261, '61', 60, NULL, NULL, '笑死，这操作简直是降维打击，太秀了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (262, '61', 54, NULL, NULL, '楼上的分析太精辟了，完全说到点子上了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (263, '61', 68, NULL, NULL, '这剧情发展得跟过山车一样，太刺激了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (264, '61', 76, NULL, NULL, '我已经把这个视频推荐给了所有好友。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (265, '61', 64, NULL, NULL, '这瓜可真大，我现在脑子都是嗡嗡的。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (266, '61', 57, NULL, NULL, '这事儿还得持续观察，看看后续如何发展。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (267, '61', 73, NULL, NULL, '家人们，都来围观，这里有大新闻。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (268, '61', 62, NULL, NULL, '不愧是专业人士，一句话就戳中要害。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (269, '61', 70, NULL, NULL, '不多说了，我要去重新整理一下思绪。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (270, '62', 55, NULL, NULL, '这事儿总算有个定论了，吃瓜群众可以散了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (271, '62', 69, NULL, NULL, '笑不活了，这波操作我愿称之为艺术。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (272, '62', 58, NULL, NULL, '楼上的发言让我豁然开朗，原来如此。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (273, '62', 77, NULL, NULL, '这剧情比电影还精彩，我建议拍成纪录片。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (274, '62', 66, NULL, NULL, '我已经把这个视频加入“年度神作”合集了。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (275, '62', 61, NULL, NULL, '这瓜的含金量太高了，需要慢慢消化。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (276, '62', 74, NULL, NULL, '这事儿还没完，我觉得高潮还在后头。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (277, '62', 53, NULL, NULL, '家人们，这波不看，绝对会后悔。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (278, '62', 79, NULL, NULL, '这操作真是神了，我服了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (279, '62', 67, NULL, NULL, '不多说了，我先去外面冷静十分钟。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (280, '63', 65, NULL, NULL, '这事儿可真够劲爆的，现在全网都在讨论。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (281, '63', 56, NULL, NULL, '笑死，这操作简直是年度最佳，没有之一。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (282, '63', 72, NULL, NULL, '楼上的发言太深刻了，我表示高度赞同。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (283, '63', 60, NULL, NULL, '这剧情发展得也太快了，我都有点跟不上了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (284, '63', 59, NULL, NULL, '我已经把这个视频设为特别关心了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (285, '63', 75, NULL, NULL, '这瓜可真甜，我现在满脑子都是问号。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (286, '63', 63, NULL, NULL, '这波我站真相，让子弹飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (287, '63', 70, NULL, NULL, '家人们，都来关注一下，这里有猛料。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (288, '63', 54, NULL, NULL, '不愧是老司机，一句话就点透了。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (289, '63', 68, NULL, NULL, '不多说了，我要去重新刷新一下世界观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (290, '64', 78, NULL, NULL, '这事儿一出，整个网络都沸腾了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (291, '64', 67, NULL, NULL, '笑不活了，这操作简直是神乎其技。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (292, '64', 57, NULL, NULL, '楼上的分析太到位了，完全说出了我的想法。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (293, '64', 73, NULL, NULL, '这剧情比小说还离谱，编剧都不敢这么写。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (294, '64', 62, NULL, NULL, '我已经把这个视频加入“必看清单”了。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (295, '64', 55, NULL, NULL, '这瓜的瓜籽都快被我吐光了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (296, '64', 76, NULL, NULL, '这事儿还得持续关注，不能掉以轻心。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (297, '64', 64, NULL, NULL, '家人们，都来围观，这里是第一现场。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (298, '64', 58, NULL, NULL, '这波操作我给满分，不愧是高手。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (299, '64', 71, NULL, NULL, '不多说了，我先去外面吹吹风清醒一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (300, '65', 61, NULL, NULL, '这事儿总算尘埃落定了，大家都松了口气。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (301, '65', 59, NULL, NULL, '笑死，这波操作简直是降维打击，学到了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (302, '65', 74, NULL, NULL, '楼上的发言太有见地了，醍醐灌顶。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (303, '65', 69, NULL, NULL, '这剧情发展得太快了，我都有点懵。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (304, '65', 53, NULL, NULL, '我已经把这个视频收藏到我的秘密基地了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (305, '65', 79, NULL, NULL, '这瓜可真够大的，我现在都需要缓一缓。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (306, '65', 66, NULL, NULL, '这事儿还没结束，我觉得后面还有戏。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (307, '65', 56, NULL, NULL, '家人们，这波热度，必须得追一下。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (308, '65', 77, NULL, NULL, '真相只有一个，感谢有人把线索都串起来了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (309, '65', 65, NULL, NULL, '不说了，我先去重新梳理一遍整件事。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (310, '66', 60, NULL, NULL, '这事儿可真够轰动的，现在是全网热搜。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (311, '66', 54, NULL, NULL, '笑不活了，这操作我服，简直是艺术品。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (312, '66', 72, NULL, NULL, '楼上的分析一针见血，说出了我的心声。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (313, '66', 68, NULL, NULL, '这剧情比电视剧还精彩，编剧都得跪。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (314, '66', 57, NULL, NULL, '我已经把这个视频加入了我的年度回顾列表。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (315, '66', 75, NULL, NULL, '这瓜的含水量有点高，我得缓缓再吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (316, '66', 63, NULL, NULL, '这波我站客观，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (317, '66', 70, NULL, NULL, '家人们，都来围观一下，这里有大事发生。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (318, '66', 58, NULL, NULL, '不愧是老江湖，一句话就点破了关键。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (319, '66', 67, NULL, NULL, '不多说了，我要去重新整理一下我的认知。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (320, '67', 55, NULL, NULL, '这事儿总算有个说法了，吃瓜群众可以安心了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (321, '67', 78, NULL, NULL, '笑死，这操作简直是年度神迹，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (322, '67', 64, NULL, NULL, '楼上的发言让我对这件事有了全新的理解。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (323, '67', 59, NULL, NULL, '这剧情发展得太魔幻了，我都怀疑是做梦。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (324, '67', 73, NULL, NULL, '我已经把这个视频推荐给了所有群友。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (325, '67', 61, NULL, NULL, '这瓜的含糖量超标了，我得含着吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (326, '67', 56, NULL, NULL, '这事儿还没完，我觉得后面还有大戏。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (327, '67', 76, NULL, NULL, '家人们，这波热度必须得蹭一下。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (328, '67', 62, NULL, NULL, '这波操作我给满分，简直是降维打击。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (329, '67', 71, NULL, NULL, '不多说了，我先去外面吹吹风冷静一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (330, '68', 53, NULL, NULL, '这事儿可真够劲爆的，现在是全民话题。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (331, '68', 69, NULL, NULL, '笑不活了，这波操作简直是神来之笔。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (332, '68', 57, NULL, NULL, '楼上的分析太精辟了，完全说到我心坎里去了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (333, '68', 74, NULL, NULL, '这剧情发展得跟坐过山车一样，太刺激了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (334, '68', 65, NULL, NULL, '我已经把这个视频加入了“年度神作”收藏夹。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (335, '68', 58, NULL, NULL, '这瓜可真大，我现在脑子都是嗡嗡的。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (336, '68', 79, NULL, NULL, '这事儿还得持续观察，看看官方怎么回应。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (337, '68', 60, NULL, NULL, '家人们，都来围观，这里有大瓜。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (338, '68', 66, NULL, NULL, '不愧是专业人士，一句话就点中要害。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (339, '68', 77, NULL, NULL, '不多说了，我要去重新整理一下我的世界观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (340, '69', 63, NULL, NULL, '这事儿总算真相大白了，大家可以散了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (341, '69', 54, NULL, NULL, '笑死，这操作简直是年度最佳，服气。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (342, '69', 70, NULL, NULL, '楼上的发言太深刻了，让我陷入了思考。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (343, '69', 68, NULL, NULL, '这剧情比电影还精彩，建议直接上映。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (344, '69', 55, NULL, NULL, '我已经把这个视频加入了我的“珍藏版”合集。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (345, '69', 75, NULL, NULL, '这瓜的含金量太高了，需要慢慢消化。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (346, '69', 61, NULL, NULL, '这事儿还没完，我觉得高潮还在后头。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (347, '69', 59, NULL, NULL, '家人们，这波不看绝对会后悔。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (348, '69', 72, NULL, NULL, '这操作真是神了，我给满分。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (349, '69', 67, NULL, NULL, '不说了，我先去外面冷静一下，压压惊。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (350, '70', 56, NULL, NULL, '这事儿一出，整个互联网都炸了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (351, '70', 78, NULL, NULL, '笑不活了，这操作简直是降维打击，太秀了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (352, '70', 64, NULL, NULL, '楼上的分析太到位了，完全说出了我想说的。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (353, '70', 53, NULL, NULL, '这剧情发展得太快了，我都有点跟不上节奏了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (354, '70', 76, NULL, NULL, '我已经把这个视频收藏为“年度必看”。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (355, '70', 62, NULL, NULL, '这瓜可真甜，我现在满脑子都是问号。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (356, '70', 57, NULL, NULL, '这波我站真相，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (357, '70', 73, NULL, NULL, '家人们，都来围观，这里有猛料。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (358, '70', 69, NULL, NULL, '不愧是老司机，一句话就点透了本质。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (359, '70', 60, NULL, NULL, '不多说了，我要去重新刷新一下三观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (360, '71', 71, NULL, NULL, '这事儿可真够轰动的，现在是全网热点。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (361, '71', 58, NULL, NULL, '笑死，这操作简直是神乎其技，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (362, '71', 65, NULL, NULL, '楼上的发言太有见地了，醍醐灌顶。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (363, '71', 54, NULL, NULL, '这剧情比小说还离谱，编剧都不敢这么写。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (364, '71', 79, NULL, NULL, '我已经把这个视频加入“必看清单”了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (365, '71', 61, NULL, NULL, '这瓜的瓜籽都快被我吐光了。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (366, '71', 56, NULL, NULL, '这事儿还得持续关注，不能掉以轻心。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (367, '71', 74, NULL, NULL, '家人们，都来围观，这里是第一现场。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (368, '71', 67, NULL, NULL, '这波操作我给满分，不愧是高手。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (369, '71', 53, NULL, NULL, '不说了，我先去外面吹吹风清醒一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (370, '72', 77, NULL, NULL, '这事儿总算尘埃落定了，大家都松了口气。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (371, '72', 63, NULL, NULL, '笑死，这波操作简直是降维打击，学到了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (372, '72', 59, NULL, NULL, '楼上的发言太有深度了，让我豁然开朗。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (373, '72', 70, NULL, NULL, '这剧情发展得太快了，我都有点懵。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (374, '72', 66, NULL, NULL, '我已经把这个视频收藏到我的秘密基地了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (375, '72', 55, NULL, NULL, '这瓜可真够大的，我现在都需要缓一缓。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (376, '72', 75, NULL, NULL, '这事儿还没结束，我觉得后面还有戏。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (377, '72', 60, NULL, NULL, '家人们，这波热度，必须得追一下。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (378, '72', 58, NULL, NULL, '真相只有一个，感谢有人把线索都串起来了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (379, '72', 68, NULL, NULL, '不多说了，我先去重新梳理一遍整件事。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (380, '73', 57, NULL, NULL, '这事儿可真够劲爆的，现在是全网热搜。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (381, '73', 72, NULL, NULL, '笑不活了，这操作我服，简直是艺术品。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (382, '73', 64, NULL, NULL, '楼上的分析一针见血，说出了我的心声。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (383, '73', 53, NULL, NULL, '这剧情比电视剧还精彩，编剧都得跪。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (384, '73', 78, NULL, NULL, '我已经把这个视频加入了我的年度回顾列表。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (385, '73', 61, NULL, NULL, '这瓜的含水量有点高，我得缓缓再吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (386, '73', 56, NULL, NULL, '这波我站客观，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (387, '73', 76, NULL, NULL, '家人们，都来围观一下，这里有大事发生。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (388, '73', 69, NULL, NULL, '不愧是老江湖，一句话就点破了关键。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (389, '73', 62, NULL, NULL, '不多说了，我要去重新整理一下我的认知。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (390, '74', 54, NULL, NULL, '这事儿总算有个说法了，吃瓜群众可以安心了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (391, '74', 79, NULL, NULL, '笑死，这操作简直是年度神迹，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (392, '74', 65, NULL, NULL, '楼上的发言让我对这件事有了全新的理解。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (393, '74', 58, NULL, NULL, '这剧情发展得太魔幻了，我都怀疑是做梦。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (394, '74', 71, NULL, NULL, '我已经把这个视频推荐给了所有群友。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (395, '74', 60, NULL, NULL, '这瓜的含糖量超标了，我得含着吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (396, '74', 57, NULL, NULL, '这事儿还没完，我觉得后面还有大戏。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (397, '74', 73, NULL, NULL, '家人们，这波热度必须得蹭一下。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (398, '74', 67, NULL, NULL, '这波操作我给满分，简直是降维打击。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (399, '74', 55, NULL, NULL, '不多说了，我先去外面吹吹风冷静一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (400, '75', 77, NULL, NULL, '这事儿可真够劲爆的，现在是全民话题。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (401, '75', 63, NULL, NULL, '笑不活了，这波操作简直是神来之笔。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (402, '75', 59, NULL, NULL, '楼上的分析太精辟了，完全说到我心坎里去了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (403, '75', 74, NULL, NULL, '这剧情发展得跟坐过山车一样，太刺激了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (404, '75', 66, NULL, NULL, '我已经把这个视频加入了“年度神作”收藏夹。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (405, '75', 54, NULL, NULL, '这瓜可真大，我现在脑子都是嗡嗡的。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (406, '75', 70, NULL, NULL, '这事儿还得持续观察，看看官方怎么回应。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (407, '75', 61, NULL, NULL, '家人们，都来围观，这里有大瓜。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (408, '75', 58, NULL, NULL, '不愧是专业人士，一句话就点中要害。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (409, '75', 78, NULL, NULL, '不多说了，我要去重新整理一下我的世界观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (410, '76', 64, NULL, NULL, '这事儿总算真相大白了，大家可以散了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (411, '76', 53, NULL, NULL, '笑死，这操作简直是年度最佳，服气。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (412, '76', 75, NULL, NULL, '楼上的发言太深刻了，让我陷入了思考。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (413, '76', 69, NULL, NULL, '这剧情比电影还精彩，建议直接上映。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (414, '76', 56, NULL, NULL, '我已经把这个视频加入了我的“珍藏版”合集。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (415, '76', 72, NULL, NULL, '这瓜的含金量太高了，需要慢慢消化。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (416, '76', 62, NULL, NULL, '这事儿还没完，我觉得高潮还在后头。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (417, '76', 57, NULL, NULL, '家人们，这波不看绝对会后悔。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (418, '76', 76, NULL, NULL, '这操作真是神了，我给满分。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (419, '76', 60, NULL, NULL, '不说了，我先去外面冷静一下，压压惊。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (420, '77', 55, NULL, NULL, '这事儿一出，整个互联网都炸了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (421, '77', 71, NULL, NULL, '笑不活了，这操作简直是降维打击，太秀了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (422, '77', 67, NULL, NULL, '楼上的分析太到位了，完全说出了我想说的。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (423, '77', 58, NULL, NULL, '这剧情发展得太快了，我都有点跟不上节奏了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (424, '77', 79, NULL, NULL, '我已经把这个视频收藏为“年度必看”。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (425, '77', 63, NULL, NULL, '这瓜可真甜，我现在满脑子都是问号。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (426, '77', 54, NULL, NULL, '这波我站真相，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (427, '77', 73, NULL, NULL, '家人们，都来围观，这里有猛料。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (428, '77', 65, NULL, NULL, '不愧是老司机，一句话就点透了本质。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (429, '77', 59, NULL, NULL, '不多说了，我要去重新刷新一下三观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (430, '78', 70, NULL, NULL, '这事儿可真够轰动的，现在是全网热点。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (431, '78', 61, NULL, NULL, '笑死，这操作简直是神乎其技，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (432, '78', 56, NULL, NULL, '楼上的发言太有见地了，醍醐灌顶。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (433, '78', 77, NULL, NULL, '这剧情比小说还离谱，编剧都不敢这么写。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (434, '78', 68, NULL, NULL, '我已经把这个视频加入“必看清单”了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (435, '78', 53, NULL, NULL, '这瓜的瓜籽都快被我吐光了。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (436, '78', 74, NULL, NULL, '这事儿还得持续关注，不能掉以轻心。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (437, '78', 64, NULL, NULL, '家人们，都来围观，这里是第一现场。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (438, '78', 58, NULL, NULL, '这波操作我给满分，不愧是高手。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (439, '78', 75, NULL, NULL, '不说了，我先去外面吹吹风清醒一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (440, '79', 60, NULL, NULL, '这事儿总算尘埃落定了，大家都松了口气。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (441, '79', 57, NULL, NULL, '笑死，这波操作简直是降维打击，学到了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (442, '79', 72, NULL, NULL, '楼上的发言太有深度了，让我豁然开朗。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (443, '79', 66, NULL, NULL, '这剧情发展得太快了，我都有点懵。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (444, '79', 54, NULL, NULL, '我已经把这个视频收藏到我的秘密基地了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (445, '79', 78, NULL, NULL, '这瓜可真够大的，我现在都需要缓一缓。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (446, '79', 62, NULL, NULL, '这事儿还没结束，我觉得后面还有戏。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (447, '79', 59, NULL, NULL, '家人们，这波热度，必须得追一下。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (448, '79', 76, NULL, NULL, '真相只有一个，感谢有人把线索都串起来了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (449, '79', 65, NULL, NULL, '不多说了，我先去重新梳理一遍整件事。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (450, '80', 53, NULL, NULL, '这事儿可真够劲爆的，现在是全网热搜。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (451, '80', 71, NULL, NULL, '笑不活了，这操作我服，简直是艺术品。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (452, '80', 67, NULL, NULL, '楼上的分析一针见血，说出了我的心声。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (453, '80', 55, NULL, NULL, '这剧情比电视剧还精彩，编剧都得跪。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (454, '80', 79, NULL, NULL, '我已经把这个视频加入了我的年度回顾列表。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (455, '80', 61, NULL, NULL, '这瓜的含水量有点高，我得缓缓再吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (456, '80', 58, NULL, NULL, '这波我站客观，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (457, '80', 73, NULL, NULL, '家人们，都来围观一下，这里有大事发生。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (458, '80', 64, NULL, NULL, '不愧是老江湖，一句话就点破了关键。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (459, '80', 56, NULL, NULL, '不多说了，我要去重新整理一下我的认知。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (460, '81', 77, NULL, NULL, '这事儿总算有个说法了，吃瓜群众可以安心了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (461, '81', 60, NULL, NULL, '笑死，这操作简直是年度神迹，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (462, '81', 54, NULL, NULL, '楼上的发言让我对这件事有了全新的理解。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (463, '81', 70, NULL, NULL, '这剧情发展得太魔幻了，我都怀疑是做梦。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (464, '81', 68, NULL, NULL, '我已经把这个视频推荐给了所有群友。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (465, '81', 57, NULL, NULL, '这瓜的含糖量超标了，我得含着吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (466, '81', 75, NULL, NULL, '这事儿还没完，我觉得后面还有大戏。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (467, '81', 62, NULL, NULL, '家人们，这波热度必须得蹭一下。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (468, '81', 59, NULL, NULL, '这波操作我给满分，简直是降维打击。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (469, '81', 74, NULL, NULL, '不多说了，我先去外面吹吹风冷静一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (470, '82', 65, NULL, NULL, '这事儿可真够劲爆的，现在是全民话题。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (471, '82', 53, NULL, NULL, '笑死，这波操作简直是神来之笔。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (472, '82', 78, NULL, NULL, '楼上的分析太精辟了，完全说到我心坎里去了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (473, '82', 61, NULL, NULL, '这剧情发展得跟坐过山车一样，太刺激了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (474, '82', 56, NULL, NULL, '我已经把这个视频加入了“年度神作”收藏夹。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (475, '82', 72, NULL, NULL, '这瓜可真大，我现在脑子都是嗡嗡的。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (476, '82', 67, NULL, NULL, '这事儿还得持续观察，看看官方怎么回应。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (477, '82', 54, NULL, NULL, '家人们，都来围观，这里有大瓜。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (478, '82', 79, NULL, NULL, '不愧是专业人士，一句话就点中要害。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (479, '82', 64, NULL, NULL, '不多说了，我要去重新整理一下我的世界观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (480, '83', 58, NULL, NULL, '这事儿总算真相大白了，大家可以散了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (481, '83', 71, NULL, NULL, '笑死，这操作简直是年度最佳，服气。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (482, '83', 60, NULL, NULL, '楼上的发言太深刻了，让我陷入了思考。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (483, '83', 55, NULL, NULL, '这剧情比电影还精彩，建议直接上映。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (484, '83', 76, NULL, NULL, '我已经把这个视频加入了我的“珍藏版”合集。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (485, '83', 63, NULL, NULL, '这瓜的含金量太高了，需要慢慢消化。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (486, '83', 57, NULL, NULL, '这事儿还没完，我觉得高潮还在后头。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (487, '83', 70, NULL, NULL, '家人们，这波不看绝对会后悔。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (488, '83', 66, NULL, NULL, '这操作真是神了，我给满分。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (489, '83', 59, NULL, NULL, '不说了，我先去外面冷静一下，压压惊。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (490, '84', 74, NULL, NULL, '这事儿一出，整个互联网都炸了。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (491, '84', 62, NULL, NULL, '笑不活了，这操作简直是降维打击，太秀了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (492, '84', 53, NULL, NULL, '楼上的分析太到位了，完全说出了我想说的。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (493, '84', 78, NULL, NULL, '这剧情发展得太快了，我都有点跟不上节奏了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (494, '84', 65, NULL, NULL, '我已经把这个视频收藏为“年度必看”。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (495, '84', 56, NULL, NULL, '这瓜可真甜，我现在满脑子都是问号。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (496, '84', 73, NULL, NULL, '这波我站真相，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (497, '84', 61, NULL, NULL, '家人们，都来围观，这里有猛料。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (498, '84', 58, NULL, NULL, '不愧是老司机，一句话就点透了本质。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (499, '84', 77, NULL, NULL, '不多说了，我要去重新刷新一下三观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (500, '85', 64, NULL, NULL, '这事儿可真够轰动的，现在是全网热点。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (501, '85', 54, NULL, NULL, '笑死，这操作简直是神乎其技，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (502, '85', 71, NULL, NULL, '楼上的发言太有见地了，醍醐灌顶。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (503, '85', 60, NULL, NULL, '这剧情比小说还离谱，编剧都不敢这么写。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (504, '85', 57, NULL, NULL, '我已经把这个视频加入“必看清单”了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (505, '85', 75, NULL, NULL, '这瓜的瓜籽都快被我吐光了。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (506, '85', 67, NULL, NULL, '这事儿还得持续关注，不能掉以轻心。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (507, '85', 59, NULL, NULL, '家人们，都来围观，这里是第一现场。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (508, '85', 72, NULL, NULL, '这波操作我给满分，不愧是高手。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (509, '85', 63, NULL, NULL, '不说了，我先去外面吹吹风清醒一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (510, '86', 55, NULL, NULL, '这事儿总算尘埃落定了，大家都松了口气。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (511, '86', 79, NULL, NULL, '笑死，这波操作简直是降维打击，学到了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (512, '86', 62, NULL, NULL, '楼上的发言太有深度了，让我豁然开朗。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (513, '86', 53, NULL, NULL, '这剧情发展得太快了，我都有点懵。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (514, '86', 76, NULL, NULL, '我已经把这个视频收藏到我的秘密基地了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (515, '86', 61, NULL, NULL, '这瓜可真够大的，我现在都需要缓一缓。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (516, '86', 58, NULL, NULL, '这事儿还没结束，我觉得后面还有戏。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (517, '86', 70, NULL, NULL, '家人们，这波热度，必须得追一下。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (518, '86', 65, NULL, NULL, '真相只有一个，感谢有人把线索都串起来了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (519, '86', 54, NULL, NULL, '不多说了，我先去重新梳理一遍整件事。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (520, '87', 78, NULL, NULL, '这事儿可真够劲爆的，现在是全网热搜。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (521, '87', 64, NULL, NULL, '笑死，这操作我服，简直是艺术品。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (522, '87', 56, NULL, NULL, '楼上的分析一针见血，说出了我的心声。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (523, '87', 73, NULL, NULL, '这剧情比电视剧还精彩，编剧都得跪。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (524, '87', 60, NULL, NULL, '我已经把这个视频加入了我的年度回顾列表。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (525, '87', 57, NULL, NULL, '这瓜的含水量有点高，我得缓缓再吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (526, '87', 77, NULL, NULL, '这波我站客观，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (527, '87', 66, NULL, NULL, '家人们，都来围观一下，这里有大事发生。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (528, '87', 59, NULL, NULL, '不愧是老江湖，一句话就点破了关键。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (529, '87', 71, NULL, NULL, '不多说了，我要去重新整理一下我的认知。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (530, '88', 55, NULL, NULL, '这事儿总算有个说法了，吃瓜群众可以安心了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (531, '88', 74, NULL, NULL, '笑死，这操作简直是年度神迹，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (532, '88', 63, NULL, NULL, '楼上的发言让我对这件事有了全新的理解。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (533, '88', 53, NULL, NULL, '这剧情发展得太魔幻了，我都怀疑是做梦。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (534, '88', 79, NULL, NULL, '我已经把这个视频推荐给了所有群友。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (535, '88', 62, NULL, NULL, '这瓜的含糖量超标了，我得含着吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (536, '88', 58, NULL, NULL, '这事儿还没完，我觉得后面还有大戏。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (537, '88', 75, NULL, NULL, '家人们，这波热度必须得蹭一下。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (538, '88', 61, NULL, NULL, '这波操作我给满分，简直是降维打击。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (539, '88', 56, NULL, NULL, '不多说了，我先去外面吹吹风冷静一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (540, '89', 70, NULL, NULL, '这事儿可真够劲爆的，现在是全民话题。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (541, '89', 67, NULL, NULL, '笑死，这波操作简直是神来之笔。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (542, '89', 54, NULL, NULL, '楼上的分析太精辟了，完全说到我心坎里去了。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (543, '89', 72, NULL, NULL, '这剧情发展得跟坐过山车一样，太刺激了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (544, '89', 59, NULL, NULL, '我已经把这个视频加入了“年度神作”收藏夹。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (545, '89', 76, NULL, NULL, '这瓜可真大，我现在脑子都是嗡嗡的。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (546, '89', 64, NULL, NULL, '这事儿还得持续观察，看看官方怎么回应。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (547, '89', 57, NULL, NULL, '家人们，都来围观，这里有大瓜。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (548, '89', 78, NULL, NULL, '不愧是专业人士，一句话就点中要害。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (549, '89', 60, NULL, NULL, '不多说了，我要去重新整理一下我的世界观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (550, '90', 55, NULL, NULL, '这事儿总算真相大白了，大家可以散了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (551, '90', 73, NULL, NULL, '笑死，这操作简直是年度最佳，服气。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (552, '90', 61, NULL, NULL, '楼上的发言太深刻了，让我陷入了思考。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (553, '90', 53, NULL, NULL, '这剧情比电影还精彩，建议直接上映。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (554, '90', 77, NULL, NULL, '我已经把这个视频加入了我的“珍藏版”合集。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (555, '90', 65, NULL, NULL, '这瓜的含金量太高了，需要慢慢消化。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (556, '90', 58, NULL, NULL, '这事儿还没完，我觉得高潮还在后头。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (557, '90', 71, NULL, NULL, '家人们，这波不看绝对会后悔。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (558, '90', 62, NULL, NULL, '这操作真是神了，我给满分。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (559, '90', 56, NULL, NULL, '不说了，我先去外面冷静一下，压压惊。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (560, '91', 79, NULL, 560, '这事儿一出，整个互联网都炸了。', 18, 1, 1, '2026-03-14 16:59:00', '2026-03-14 22:17:21', 0);
INSERT INTO `video_comment` VALUES (561, '91', 64, NULL, 561, '笑不活了，这操作简直是降维打击，太秀了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (562, '91', 57, NULL, 562, '楼上的分析太到位了，完全说出了我想说的。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (563, '91', 74, NULL, 563, '这剧情发展得太快了，我都有点跟不上节奏了。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (564, '91', 60, NULL, 564, '我已经把这个视频收藏为“年度必看”。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (565, '91', 54, NULL, 565, '这瓜可真甜，我现在满脑子都是问号。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (566, '91', 78, NULL, 566, '这波我站真相，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (567, '91', 66, NULL, 567, '家人们，都来围观，这里有猛料。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (568, '91', 59, NULL, 568, '不愧是老司机，一句话就点透了本质。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (569, '91', 72, NULL, 569, '不多说了，我要去重新刷新一下三观。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 17:16:19', 0);
INSERT INTO `video_comment` VALUES (570, '92', 53, NULL, NULL, '这事儿可真够轰动的，现在是全网热点。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (571, '92', 75, NULL, NULL, '笑死，这操作简直是神乎其技，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (572, '92', 61, NULL, NULL, '楼上的发言太有见地了，醍醐灌顶。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (573, '92', 56, NULL, NULL, '这剧情比小说还离谱，编剧都不敢这么写。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (574, '92', 70, NULL, NULL, '我已经把这个视频加入“必看清单”了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (575, '92', 58, NULL, NULL, '这瓜的瓜籽都快被我吐光了。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (576, '92', 76, NULL, NULL, '这事儿还得持续关注，不能掉以轻心。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (577, '92', 63, NULL, NULL, '家人们，都来围观，这里是第一现场。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (578, '92', 55, NULL, NULL, '这波操作我给满分，不愧是高手。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (579, '92', 79, NULL, NULL, '不说了，我先去外面吹吹风清醒一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (580, '93', 62, NULL, NULL, '这事儿总算尘埃落定了，大家都松了口气。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (581, '93', 57, NULL, NULL, '笑死，这波操作简直是降维打击，学到了。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (582, '93', 73, NULL, NULL, '楼上的发言太有深度了，让我豁然开朗。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (583, '93', 59, NULL, NULL, '这剧情发展得太快了，我都有点懵。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (584, '93', 77, NULL, NULL, '我已经把这个视频收藏到我的秘密基地了。', 8, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (585, '93', 64, NULL, NULL, '这瓜可真够大的，我现在都需要缓一缓。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (586, '93', 54, NULL, NULL, '这事儿还没结束，我觉得后面还有戏。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (587, '93', 71, NULL, NULL, '家人们，这波热度，必须得追一下。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (588, '93', 60, NULL, NULL, '真相只有一个，感谢有人把线索都串起来了。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (589, '93', 58, NULL, NULL, '不多说了，我先去重新梳理一遍整件事。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (590, '94', 75, NULL, NULL, '这事儿可真够劲爆的，现在是全网热搜。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 22:19:54', 0);
INSERT INTO `video_comment` VALUES (591, '94', 65, NULL, NULL, '笑死，这操作我服，简直是艺术品。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (592, '94', 53, NULL, NULL, '楼上的分析一针见血，说出了我的心声。', 4, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (593, '94', 78, NULL, NULL, '这剧情比电视剧还精彩，编剧都得跪。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (594, '94', 61, NULL, NULL, '我已经把这个视频加入了我的年度回顾列表。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (595, '94', 56, NULL, NULL, '这瓜的含水量有点高，我得缓缓再吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (596, '94', 72, NULL, NULL, '这波我站客观，让子弹再飞一会儿。', 6, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (597, '94', 59, NULL, NULL, '家人们，都来围观一下，这里有大事发生。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (598, '94', 76, NULL, NULL, '不愧是老江湖，一句话就点破了关键。', 5, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (599, '94', 63, NULL, NULL, '不多说了，我要去重新整理一下我的认知。', 1, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (600, '95', 55, NULL, NULL, '这事儿总算有个说法了，吃瓜群众可以安心了。', 10, 0, 1, '2026-03-14 16:59:00', '2026-03-14 22:22:10', 1);
INSERT INTO `video_comment` VALUES (601, '95', 70, NULL, NULL, '笑死，这操作简直是年度神迹，学不会。', 15, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (602, '95', 64, NULL, NULL, '楼上的发言让我对这件事有了全新的理解。', 3, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (603, '95', 57, NULL, NULL, '这剧情发展得太魔幻了，我都怀疑是做梦。', 13, 0, 1, '2026-03-14 16:59:00', '2026-03-14 22:13:44', 1);
INSERT INTO `video_comment` VALUES (604, '95', 79, NULL, NULL, '我已经把这个视频推荐给了所有群友。', 11, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (605, '95', 62, NULL, NULL, '这瓜的含糖量超标了，我得含着吃。', 14, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (606, '95', 58, NULL, NULL, '这事儿还没完，我觉得后面还有大戏。', 7, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (607, '95', 74, NULL, NULL, '家人们，这波热度必须得蹭一下。', 12, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (608, '95', 66, NULL, NULL, '这波操作我给满分，简直是降维打击。', 9, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (609, '95', 53, NULL, NULL, '不多说了，我先去外面吹吹风冷静一下。', 2, 0, 1, '2026-03-14 16:59:00', '2026-03-14 16:59:00', 0);
INSERT INTO `video_comment` VALUES (610, '91', 64, 560, 560, '不错啊', 0, 0, 1, '2026-03-14 17:11:58', '2026-03-14 17:14:40', 0);
INSERT INTO `video_comment` VALUES (611, '91', 57, 560, 560, '完全同意你的观点，互联网炸开锅是必然的！', 3, 1, 1, '2026-03-14 17:13:21', '2026-03-14 21:19:39', 0);
INSERT INTO `video_comment` VALUES (612, '91', 74, 560, 560, '哈哈，这条评论太精彩了，我笑了半天。', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:40', 0);
INSERT INTO `video_comment` VALUES (613, '91', 60, 561, 561, '降维打击这个词用得太贴切了，精彩！', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:40', 0);
INSERT INTO `video_comment` VALUES (614, '91', 54, 561, 561, '操作秀得不要不要的，赞！', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:40', 0);
INSERT INTO `video_comment` VALUES (615, '91', 78, 562, 562, '楼上说得太到位了，我也是同感', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:40', 0);
INSERT INTO `video_comment` VALUES (616, '91', 66, 562, 562, '完全赞同，这条评论点出了关键点！', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:40', 0);
INSERT INTO `video_comment` VALUES (617, '91', 59, 563, 563, '节奏确实有点快，不过剧情很吸引人', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:40', 0);
INSERT INTO `video_comment` VALUES (618, '91', 72, 563, 563, '哈哈，我也是跟不上，但剧情精彩', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:40', 0);
INSERT INTO `video_comment` VALUES (619, '91', 60, 564, 564, '年度必看，我已经收藏好几次了', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:42', 0);
INSERT INTO `video_comment` VALUES (620, '91', 54, 564, 564, '这视频真心值得反复看', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:42', 0);
INSERT INTO `video_comment` VALUES (621, '91', 78, 565, 565, '哈哈，这瓜太甜了，我也满脑问号', 0, 1, 1, '2026-03-14 17:13:21', '2026-03-14 17:15:04', 0);
INSERT INTO `video_comment` VALUES (622, '91', 54, 565, 565, '完全被你一句话戳中笑点', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:46', 0);
INSERT INTO `video_comment` VALUES (623, '91', 78, 566, 566, '站真相👍，让子弹再飞一会儿！', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:46', 0);
INSERT INTO `video_comment` VALUES (624, '91', 66, 566, 566, '哈哈，真相永远第一位', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:46', 0);
INSERT INTO `video_comment` VALUES (625, '91', 59, 567, 567, '猛料来了，我也围观', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:46', 0);
INSERT INTO `video_comment` VALUES (626, '91', 72, 567, 567, '家人们快集合，看热闹！', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:46', 0);
INSERT INTO `video_comment` VALUES (627, '91', 60, 568, 568, '老司机分析太到位，我学到了', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:46', 0);
INSERT INTO `video_comment` VALUES (628, '91', 72, 568, 568, '一针见血，点赞！', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:49', 0);
INSERT INTO `video_comment` VALUES (629, '91', 60, 569, 569, '刷新三观的操作，我也要去看看', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:49', 0);
INSERT INTO `video_comment` VALUES (630, '91', 54, 569, 569, '哈哈，三观再次被刷新', 0, 0, 1, '2026-03-14 17:13:21', '2026-03-14 17:14:49', 0);
INSERT INTO `video_comment` VALUES (631, '91', 1, 621, 565, '33333', 0, 0, 1, '2026-03-14 17:15:04', '2026-03-14 17:15:04', 0);
INSERT INTO `video_comment` VALUES (632, '91', 83, 611, 560, '2435', 0, 0, 1, '2026-03-14 21:17:17', '2026-03-14 21:17:17', 0);
INSERT INTO `video_comment` VALUES (633, '94', 1, NULL, 633, '111111111111111', 1, 1, 1, '2026-03-14 22:18:59', '2026-03-14 22:19:51', 0);
INSERT INTO `video_comment` VALUES (634, '94', 1, NULL, 634, '5675', 1, 0, 1, '2026-03-14 22:19:44', '2026-03-14 22:19:52', 0);
INSERT INTO `video_comment` VALUES (635, '94', 1, 633, 633, '444444444', 1, 0, 1, '2026-03-14 22:19:49', '2026-03-14 22:19:50', 0);
INSERT INTO `video_comment` VALUES (636, '91', 1, NULL, 636, '123', 1, 1, 1, '2026-03-16 09:29:39', '2026-03-16 09:29:43', 0);
INSERT INTO `video_comment` VALUES (637, '91', 1, 636, 636, '321', 0, 0, 1, '2026-03-16 09:29:43', '2026-03-16 09:29:43', 0);
INSERT INTO `video_comment` VALUES (638, '91', 1, NULL, 638, '123321', 1, 2, 1, '2026-03-16 17:15:58', '2026-03-18 16:41:46', 0);
INSERT INTO `video_comment` VALUES (639, '91', 1, 638, 638, '321', 0, 0, 1, '2026-03-16 17:16:46', '2026-03-16 17:16:46', 0);
INSERT INTO `video_comment` VALUES (640, '91', 1, NULL, 640, '32423', 0, 0, 1, '2026-03-18 16:41:41', '2026-03-18 16:41:41', 0);
INSERT INTO `video_comment` VALUES (641, '91', 1, 638, 638, '4324', 0, 0, 1, '2026-03-18 16:41:46', '2026-03-18 16:41:46', 0);
INSERT INTO `video_comment` VALUES (642, '91', 1, NULL, 642, '321', 1, 1, 1, '2026-03-18 16:41:56', '2026-03-18 16:42:00', 0);
INSERT INTO `video_comment` VALUES (643, '91', 1, 642, 642, '123', 0, 0, 1, '2026-03-18 16:42:00', '2026-03-18 16:42:00', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频弹幕表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_danmaku
-- ----------------------------
INSERT INTO `video_danmaku` VALUES (46, 47, 53, '哈哈哈这段太搞笑了', 3.2400, '#000000', '2026-03-08 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (47, 47, 55, '来了来了', 7.5100, '#000000', '2026-03-09 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (48, 48, 56, '经典剧情', 5.1800, '#000000', '2026-03-14 16:38:45', '2026-03-14 16:42:17', 0);
INSERT INTO `video_danmaku` VALUES (49, 48, 57, '导演太会拍了', 12.6600, '#000000', '2026-03-14 16:38:45', '2026-03-14 16:42:17', 0);
INSERT INTO `video_danmaku` VALUES (50, 49, 58, '这个演员是谁', 4.9300, '#000000', '2026-03-10 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (51, 49, 59, '名场面', 8.2700, '#000000', '2026-03-13 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (52, 50, 60, '燃起来了', 2.1100, '#000000', '2026-03-13 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (53, 50, 61, '这镜头绝了', 15.4500, '#000000', '2026-03-09 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (54, 51, 62, '太真实了', 6.3200, '#000000', '2026-03-10 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (55, 51, 63, '哈哈哈哈', 9.8800, '#000000', '2026-03-14 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (56, 52, 64, '突然感动', 14.5500, '#000000', '2026-03-14 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (57, 52, 65, '这剧情反转可以', 11.2100, '#000000', '2026-03-14 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (58, 53, 66, '我直接笑出声', 4.6100, '#000000', '2026-03-14 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (59, 53, 67, '这个bgm好听', 17.2300, '#000000', '2026-03-14 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (60, 54, 68, '演技在线', 6.5400, '#000000', '2026-03-12 16:38:45', '2026-03-14 16:42:17', 0);
INSERT INTO `video_danmaku` VALUES (61, 55, 69, '好看', 3.9500, '#000000', '2026-03-10 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (62, 56, 70, '太上头了', 12.1300, '#000000', '2026-03-10 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (63, 57, 71, '笑死', 7.7700, '#000000', '2026-03-09 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (64, 58, 72, '这段好甜', 5.6600, '#000000', '2026-03-08 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (65, 59, 73, '泪目', 10.4400, '#000000', '2026-03-10 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (66, 60, 74, '这剧情可以', 8.3200, '#000000', '2026-03-09 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (67, 61, 75, '演员不错', 6.9300, '#000000', '2026-03-08 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (68, 62, 76, '笑死我了', 4.1800, '#000000', '2026-03-14 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (69, 63, 77, '太真实', 15.0200, '#000000', '2026-03-08 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (70, 64, 78, '突然燃起来', 13.6600, '#000000', '2026-03-12 16:38:45', '2026-03-14 16:42:31', 0);
INSERT INTO `video_danmaku` VALUES (71, 65, 79, '名场面打卡', 2.9800, '#000000', '2026-03-11 16:38:45', '2026-03-14 16:42:32', 0);
INSERT INTO `video_danmaku` VALUES (72, 66, 80, '导演牛', 9.2200, '#000000', '2026-03-10 16:38:45', '2026-03-14 16:42:17', 0);
INSERT INTO `video_danmaku` VALUES (73, 67, 81, '这段封神', 18.6600, '#000000', '2026-03-10 16:38:45', '2026-03-14 16:42:17', 0);
INSERT INTO `video_danmaku` VALUES (74, 68, 1, '哈哈哈哈哈', 3.6100, '#000000', '2026-03-09 16:38:45', '2026-03-14 16:42:32', 0);
INSERT INTO `video_danmaku` VALUES (75, 69, 9, '好看好看', 7.4400, '#000000', '2026-03-08 16:38:45', '2026-03-14 16:42:32', 0);
INSERT INTO `video_danmaku` VALUES (76, 91, 1, 'fg', 0.0000, '#000000', '2026-03-14 22:17:25', NULL, 0);
INSERT INTO `video_danmaku` VALUES (77, 91, 1, 'erte', 1.1080, '#000000', '2026-03-14 22:17:35', NULL, 0);
INSERT INTO `video_danmaku` VALUES (78, 50, 1, 'rete', 0.0000, '#000000', '2026-03-14 22:17:43', NULL, 0);
INSERT INTO `video_danmaku` VALUES (79, 90, 1, 'ddd', 0.0000, '#000000', '2026-03-14 22:18:07', NULL, 0);
INSERT INTO `video_danmaku` VALUES (80, 94, 1, '444', 0.0000, '#000000', '2026-03-14 22:18:26', NULL, 0);
INSERT INTO `video_danmaku` VALUES (81, 94, 1, '3436', 0.0000, '#000000', '2026-03-14 22:19:36', NULL, 0);
INSERT INTO `video_danmaku` VALUES (82, 58, 1, '123', 0.0000, '#000000', '2026-03-16 10:26:48', NULL, 0);
INSERT INTO `video_danmaku` VALUES (83, 86, 1, '123', 0.0000, '#000000', '2026-03-16 10:29:24', NULL, 0);
INSERT INTO `video_danmaku` VALUES (84, 91, 1, '123', 0.0000, '#000000', '2026-03-16 10:35:15', NULL, 0);
INSERT INTO `video_danmaku` VALUES (85, 91, 1, '123', 0.0000, '#000000', '2026-03-16 10:35:16', NULL, 0);
INSERT INTO `video_danmaku` VALUES (86, 91, 1, '2342', 0.0000, '#000000', '2026-03-18 16:41:35', NULL, 0);
INSERT INTO `video_danmaku` VALUES (87, 106, 1, '234', 4.2271, '#000000', '2026-03-19 11:40:07', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频点赞日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_like_log
-- ----------------------------
INSERT INTO `video_like_log` VALUES (37, 1, 91, NULL, 'video', 1, '2026-03-14 17:15:15', '2026-03-14 17:15:15', 0);
INSERT INTO `video_like_log` VALUES (38, 1, 91, 560, 'comment', 1, '2026-03-14 17:15:20', '2026-03-14 17:15:20', 0);
INSERT INTO `video_like_log` VALUES (39, 1, 91, 611, 'comment', 1, '2026-03-14 17:15:21', '2026-03-14 17:15:21', 0);
INSERT INTO `video_like_log` VALUES (40, 83, 91, NULL, 'video', 1, '2026-03-14 21:15:53', '2026-03-14 21:15:53', 0);
INSERT INTO `video_like_log` VALUES (41, 83, 91, NULL, 'video', 1, '2026-03-14 21:16:03', '2026-03-14 21:16:03', 0);
INSERT INTO `video_like_log` VALUES (42, 83, 91, NULL, 'video', 1, '2026-03-14 21:16:18', '2026-03-14 21:16:18', 0);
INSERT INTO `video_like_log` VALUES (43, 83, 91, 560, 'comment', 1, '2026-03-14 21:17:08', '2026-03-14 21:17:08', 0);
INSERT INTO `video_like_log` VALUES (44, 83, 91, 611, 'comment', 1, '2026-03-14 21:19:35', '2026-03-14 21:19:35', 0);
INSERT INTO `video_like_log` VALUES (45, 1, 90, NULL, 'video', 1, '2026-03-14 22:18:15', '2026-03-14 22:18:15', 0);
INSERT INTO `video_like_log` VALUES (46, 1, 94, NULL, 'video', 1, '2026-03-14 22:19:40', '2026-03-14 22:19:40', 0);
INSERT INTO `video_like_log` VALUES (47, 1, 94, 635, 'comment', 1, '2026-03-14 22:19:50', '2026-03-14 22:19:50', 0);
INSERT INTO `video_like_log` VALUES (48, 1, 94, 633, 'comment', 1, '2026-03-14 22:19:51', '2026-03-14 22:19:51', 0);
INSERT INTO `video_like_log` VALUES (49, 1, 94, 634, 'comment', 1, '2026-03-14 22:19:52', '2026-03-14 22:19:52', 0);
INSERT INTO `video_like_log` VALUES (50, 1, 94, 590, 'comment', 1, '2026-03-14 22:19:54', '2026-03-14 22:19:54', 0);
INSERT INTO `video_like_log` VALUES (51, 1, 91, 636, 'comment', 1, '2026-03-16 09:29:42', '2026-03-16 09:29:42', 0);
INSERT INTO `video_like_log` VALUES (52, 1, 58, NULL, 'video', 1, '2026-03-16 10:26:43', '2026-03-16 10:26:43', 0);
INSERT INTO `video_like_log` VALUES (53, 1, 91, 638, 'comment', 1, '2026-03-16 17:16:01', '2026-03-16 17:16:01', 0);
INSERT INTO `video_like_log` VALUES (54, 1, 91, 642, 'comment', 1, '2026-03-18 16:41:58', '2026-03-18 16:41:58', 0);
INSERT INTO `video_like_log` VALUES (55, 1, 106, NULL, 'video', 1, '2026-03-19 12:40:36', '2026-03-19 12:40:36', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频统计汇总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_stat
-- ----------------------------
INSERT INTO `video_stat` VALUES (4, '47', 842, 63, 421, '2026-03-08 16:38:45', '2026-03-08 16:38:45', 0);
INSERT INTO `video_stat` VALUES (5, '48', 1021, 77, 530, '2026-03-09 16:38:45', '2026-03-09 16:38:45', 0);
INSERT INTO `video_stat` VALUES (6, '49', 643, 41, 312, '2026-03-14 16:38:45', '2026-03-14 16:38:45', 0);
INSERT INTO `video_stat` VALUES (7, '50', 1523, 120, 811, '2026-03-14 16:38:45', '2026-03-14 16:38:45', 0);
INSERT INTO `video_stat` VALUES (8, '51', 932, 65, 470, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (9, '52', 1110, 82, 560, '2026-03-13 16:38:45', '2026-03-13 16:38:45', 0);
INSERT INTO `video_stat` VALUES (10, '53', 780, 44, 392, '2026-03-13 16:38:45', '2026-03-13 16:38:45', 0);
INSERT INTO `video_stat` VALUES (11, '54', 1290, 98, 650, '2026-03-09 16:38:45', '2026-03-09 16:38:45', 0);
INSERT INTO `video_stat` VALUES (12, '55', 564, 33, 270, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (13, '56', 903, 71, 455, '2026-03-14 16:38:45', '2026-03-14 16:38:45', 0);
INSERT INTO `video_stat` VALUES (14, '57', 721, 39, 360, '2026-03-14 16:38:45', '2026-03-14 16:38:45', 0);
INSERT INTO `video_stat` VALUES (15, '58', 1402, 110, 702, '2026-03-14 16:38:45', '2026-03-16 10:26:44', 0);
INSERT INTO `video_stat` VALUES (16, '59', 833, 55, 420, '2026-03-14 16:38:45', '2026-03-14 16:38:45', 0);
INSERT INTO `video_stat` VALUES (17, '60', 1190, 84, 598, '2026-03-14 16:38:45', '2026-03-14 16:38:45', 0);
INSERT INTO `video_stat` VALUES (18, '61', 978, 66, 490, '2026-03-12 16:38:45', '2026-03-12 16:38:45', 0);
INSERT INTO `video_stat` VALUES (19, '62', 1344, 95, 672, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (20, '63', 610, 28, 305, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (21, '64', 744, 37, 371, '2026-03-09 16:38:45', '2026-03-09 16:38:45', 0);
INSERT INTO `video_stat` VALUES (22, '65', 820, 59, 412, '2026-03-08 16:38:45', '2026-03-08 16:38:45', 0);
INSERT INTO `video_stat` VALUES (23, '66', 1083, 80, 544, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (24, '67', 957, 68, 480, '2026-03-09 16:38:45', '2026-03-09 16:38:45', 0);
INSERT INTO `video_stat` VALUES (25, '68', 1432, 111, 720, '2026-03-08 16:38:45', '2026-03-08 16:38:45', 0);
INSERT INTO `video_stat` VALUES (26, '69', 665, 32, 333, '2026-03-14 16:38:45', '2026-03-14 16:38:45', 0);
INSERT INTO `video_stat` VALUES (27, '70', 1221, 92, 610, '2026-03-08 16:38:45', '2026-03-08 16:38:45', 0);
INSERT INTO `video_stat` VALUES (28, '71', 804, 51, 401, '2026-03-12 16:38:45', '2026-03-12 16:38:45', 0);
INSERT INTO `video_stat` VALUES (29, '72', 980, 70, 488, '2026-03-11 16:38:45', '2026-03-11 16:38:45', 0);
INSERT INTO `video_stat` VALUES (30, '73', 712, 36, 355, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (31, '74', 1188, 83, 590, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (32, '75', 1011, 74, 505, '2026-03-09 16:38:45', '2026-03-09 16:38:45', 0);
INSERT INTO `video_stat` VALUES (33, '76', 853, 49, 426, '2026-03-08 16:38:45', '2026-03-08 16:38:45', 0);
INSERT INTO `video_stat` VALUES (34, '77', 1376, 104, 688, '2026-03-12 16:38:45', '2026-03-12 16:38:45', 0);
INSERT INTO `video_stat` VALUES (35, '78', 924, 61, 460, '2026-03-09 16:38:45', '2026-03-09 16:38:45', 0);
INSERT INTO `video_stat` VALUES (36, '79', 742, 38, 372, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (37, '80', 1197, 86, 599, '2026-03-11 16:38:45', '2026-03-11 16:38:45', 0);
INSERT INTO `video_stat` VALUES (38, '81', 1044, 72, 520, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (39, '82', 864, 55, 430, '2026-03-09 16:38:45', '2026-03-09 16:38:45', 0);
INSERT INTO `video_stat` VALUES (40, '83', 1299, 97, 650, '2026-03-08 16:38:45', '2026-03-08 16:38:45', 0);
INSERT INTO `video_stat` VALUES (41, '84', 903, 62, 451, '2026-03-12 16:38:45', '2026-03-12 16:38:45', 0);
INSERT INTO `video_stat` VALUES (42, '85', 777, 40, 390, '2026-03-11 16:38:45', '2026-03-11 16:38:45', 0);
INSERT INTO `video_stat` VALUES (43, '86', 1401, 110, 705, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (44, '87', 1156, 81, 575, '2026-03-08 16:38:45', '2026-03-08 16:38:45', 0);
INSERT INTO `video_stat` VALUES (45, '88', 690, 35, 345, '2026-03-12 16:38:45', '2026-03-12 16:38:45', 0);
INSERT INTO `video_stat` VALUES (46, '89', 972, 64, 486, '2026-03-08 16:38:45', '2026-03-08 16:38:45', 0);
INSERT INTO `video_stat` VALUES (47, '90', 1095, 77, 540, '2026-03-10 16:38:45', '2026-03-19 11:16:32', 0);
INSERT INTO `video_stat` VALUES (48, '91', 824, 54, 410, '2026-03-09 16:38:45', '2026-03-18 16:41:39', 0);
INSERT INTO `video_stat` VALUES (49, '92', 1321, 96, 661, '2026-03-12 16:38:45', '2026-03-12 16:38:45', 0);
INSERT INTO `video_stat` VALUES (50, '93', 752, 42, 370, '2026-03-11 16:38:45', '2026-03-16 17:16:54', 0);
INSERT INTO `video_stat` VALUES (51, '94', 1115, 79, 558, '2026-03-10 16:38:45', '2026-03-14 22:19:40', 0);
INSERT INTO `video_stat` VALUES (52, '95', 908, 57, 454, '2026-03-10 16:38:45', '2026-03-10 16:38:45', 0);
INSERT INTO `video_stat` VALUES (53, '101', 0, 0, 0, '2026-03-19 10:45:24', '2026-03-19 10:45:30', 1);
INSERT INTO `video_stat` VALUES (54, '102', 0, 0, 0, '2026-03-19 10:51:49', '2026-03-19 10:52:01', 1);
INSERT INTO `video_stat` VALUES (55, '103', 0, 0, 0, '2026-03-19 10:52:18', NULL, 0);
INSERT INTO `video_stat` VALUES (56, '104', 0, 0, 0, '2026-03-19 11:15:14', '2026-03-19 11:15:18', 1);
INSERT INTO `video_stat` VALUES (57, '105', 0, 0, 0, '2026-03-19 11:15:28', '2026-03-19 11:15:41', 1);
INSERT INTO `video_stat` VALUES (58, '106', 0, 1, 0, '2026-03-19 11:16:01', '2026-03-19 12:40:47', 0);
INSERT INTO `video_stat` VALUES (59, '107', 0, 0, 0, '2026-03-19 11:16:56', '2026-03-19 12:42:56', 1);
INSERT INTO `video_stat` VALUES (60, '108', 0, 0, 0, '2026-03-19 12:41:28', NULL, 0);
INSERT INTO `video_stat` VALUES (61, '109', 0, 0, 0, '2026-03-19 12:44:23', '2026-03-19 12:56:04', 1);
INSERT INTO `video_stat` VALUES (62, '110', 0, 0, 0, '2026-03-19 12:56:37', '2026-03-19 12:56:40', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户观看记录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_watch_log
-- ----------------------------
INSERT INTO `video_watch_log` VALUES (12, 1, 90, '2026-03-14 22:18:14', '2026-03-14 22:18:14', 0);
INSERT INTO `video_watch_log` VALUES (13, 1, 94, '2026-03-14 22:18:32', '2026-03-14 22:18:32', 0);
INSERT INTO `video_watch_log` VALUES (14, 1, 106, '2026-03-19 11:40:08', '2026-03-19 11:40:08', 0);
INSERT INTO `video_watch_log` VALUES (15, 1, 106, '2026-03-19 11:40:25', '2026-03-19 11:40:25', 0);

SET FOREIGN_KEY_CHECKS = 1;
