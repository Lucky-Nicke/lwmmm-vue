/*
 Navicat Premium Data Transfer

 Source Server         : Mysql[CentOS7_docker]
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 192.168.239.138:3307
 Source Schema         : lwmmm_db

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 08/04/2026 15:40:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 505 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_value` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影名称',
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `description` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容描述',
  `keyword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字，用来搜索',
  `director` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者姓名',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `is_approval` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否审核标识（0未审核 1已审核  2取消审核）',
  `play_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '播放id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_movie
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `request_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方法名称',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 361 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL DEFAULT 0,
  `menu_id` bigint(20) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 478 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态（1：正常 0：停用）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '96e79218965eb72c92a549dd5a330112', '管理员', '15099909888', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-02-04/1770190067720.jpg', '', 1, '2021-05-31 18:08:43', '2026-04-08 14:55:51', 0);
INSERT INTO `sys_user` VALUES (9, 'Lucky_Nicke', '96e79218965eb72c92a549dd5a330112', 'nicke', '13686811923', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-02-04/1770190031206.jpg', '123123', 1, '2026-02-27 16:05:50', '2026-04-08 15:13:18', 0);
INSERT INTO `sys_user` VALUES (83, 'test_admin', '96e79218965eb72c92a549dd5a330112', 'test_admin', '13211111111', 'http://file.lanxige.club/img/yq-third-lwmmm/2026-03-14/1773493683045.jpg', '123', 1, '2026-03-14 21:08:05', NULL, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '角色id',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_admin_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (112, 30, 83, '2026-04-08 15:38:52', NULL, 0);
INSERT INTO `sys_user_role` VALUES (113, 29, 9, '2026-04-08 15:38:55', NULL, 0);
INSERT INTO `sys_user_role` VALUES (114, 1, 1, '2026-04-08 15:38:57', NULL, 0);

-- ----------------------------
-- Table structure for video_appro
-- ----------------------------
DROP TABLE IF EXISTS `video_appro`;
CREATE TABLE `video_appro`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核序号',
  `video_id` int(11) NOT NULL COMMENT '影视id',
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

-- ----------------------------
-- Table structure for video_comment
-- ----------------------------
DROP TABLE IF EXISTS `video_comment`;
CREATE TABLE `video_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `video_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频ID',
  `user_id` bigint(20) NOT NULL COMMENT '评论用户ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父评论ID',
  `root_id` bigint(20) NULL DEFAULT NULL COMMENT '根评论ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `like_count` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `reply_count` int(11) NOT NULL DEFAULT 0 COMMENT '回复数',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态(1正常 0屏蔽 2删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '删除标识（0未删除 1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 653 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_comment
-- ----------------------------

-- ----------------------------
-- Table structure for video_danmaku
-- ----------------------------
DROP TABLE IF EXISTS `video_danmaku`;
CREATE TABLE `video_danmaku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '弹幕ID',
  `video_id` bigint(20) NOT NULL COMMENT '视频ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
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

-- ----------------------------
-- Table structure for video_like_log
-- ----------------------------
DROP TABLE IF EXISTS `video_like_log`;
CREATE TABLE `video_like_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `video_id` bigint(20) NULL DEFAULT NULL COMMENT '视频ID',
  `comment_id` bigint(20) NULL DEFAULT NULL COMMENT '评论ID',
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

-- ----------------------------
-- Table structure for video_stat
-- ----------------------------
DROP TABLE IF EXISTS `video_stat`;
CREATE TABLE `video_stat`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `video_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频ID',
  `visit_pv` bigint(20) NOT NULL DEFAULT 0 COMMENT '访问量(PV)',
  `like_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `play_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '删除标识（0未删除 1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频统计汇总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_stat
-- ----------------------------

-- ----------------------------
-- Table structure for video_watch_log
-- ----------------------------
DROP TABLE IF EXISTS `video_watch_log`;
CREATE TABLE `video_watch_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `video_id` bigint(20) NOT NULL COMMENT '视频ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除 0未删 1已删',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户观看记录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_watch_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
