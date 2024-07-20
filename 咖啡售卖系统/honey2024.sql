/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : honey2024

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 21/05/2024 11:35:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for advertising
-- ----------------------------
DROP TABLE IF EXISTS `advertising`;
CREATE TABLE `advertising`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `managerid` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '咖啡id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '标题',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '轮播图',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0：下架  1：上架',
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of advertising
-- ----------------------------
INSERT INTO `advertising` VALUES (14, '23', '限时新品上市，先来先得，快来尝尝吧', 'http://localhost:8080/file/download/10e7fafa (1).jpg', 1, '1', '2024-04-14 18:01:59');
INSERT INTO `advertising` VALUES (15, '21', '买一送一，9.9一杯', 'http://localhost:8080/file/download/6d46123b-f8a5-4481-8abb-ae0302cdd0cd.jpg', 1, '1', '2024-04-14 18:02:17');
INSERT INTO `advertising` VALUES (16, '19', '新咖啡', 'http://localhost:8080/file/download/0017029537911922_b.jpg', 1, '12', '2024-04-25 16:21:17');

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'logo',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业执照',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '审核状态',
  `time_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业时间',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business
-- ----------------------------

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `managerid` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '时间',
  `specsname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '用户名称',
  `temp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `muuni`(`managerid`, `userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (2, 23, 11, 1, '2024-05-14 17:00:16', '', '');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '内容',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `rate` decimal(10, 1) NULL DEFAULT NULL COMMENT '评分',
  `fid` int(11) NULL DEFAULT NULL COMMENT '业务模块id',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级评论id',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '回复对象',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1995403289 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (18, '非常非常非常好喝', '钱钱钱', 10, 4.5, 18, NULL, NULL, '2024-04-29 13:54:17');
INSERT INTO `comment` VALUES (19, '一般般叭叭叭', '钱钱钱', 10, 2.5, 19, NULL, NULL, '2024-04-29 14:31:17');
INSERT INTO `comment` VALUES (22, '难喝得很，诗人做的？', '钱钱钱', 10, 1.0, 22, NULL, NULL, '2024-04-29 14:37:57');
INSERT INTO `comment` VALUES (23, '可以可以可以可以', '钱钱钱', 10, 3.5, 23, NULL, NULL, '2024-04-29 14:48:41');
INSERT INTO `comment` VALUES (24, '太好吃了，强力推荐', '钱钱钱', 10, 5.0, 24, NULL, NULL, '2024-04-29 14:49:07');
INSERT INTO `comment` VALUES (1995403268, '真的真的', '钱钱钱', 10, NULL, 19, 19, '钱钱钱', '2024-04-29 14:31:31');
INSERT INTO `comment` VALUES (1995403271, '事实上事实上', '钱钱钱', 10, NULL, 22, 22, '钱钱钱', '2024-04-29 14:42:17');
INSERT INTO `comment` VALUES (1995403273, '不知道不知道', '钱钱钱', 10, NULL, 22, 22, '钱钱钱', '2024-04-29 14:45:02');
INSERT INTO `comment` VALUES (1995403274, '叭叭叭', '钱钱钱', 10, NULL, 22, 22, '钱钱钱', '2024-04-29 14:45:37');
INSERT INTO `comment` VALUES (1995403275, '哈哈哈哈', '钱钱钱', 10, NULL, 19, 19, '钱钱钱', '2024-04-29 14:48:16');
INSERT INTO `comment` VALUES (1995403276, '真的真的', '钱钱钱', 10, NULL, 24, 24, '钱钱钱', '2024-04-29 14:50:07');
INSERT INTO `comment` VALUES (1995403277, '前期钱钱钱', '钱钱钱', 10, 0.0, 24, NULL, NULL, '2024-04-29 15:07:34');
INSERT INTO `comment` VALUES (1995403278, '失望', '小明', 11, 1.5, 25, NULL, NULL, '2024-04-29 15:09:57');
INSERT INTO `comment` VALUES (1995403279, '是吗', '小明', 11, NULL, 19, 19, '钱钱钱', '2024-04-29 15:10:29');
INSERT INTO `comment` VALUES (1995403280, '感觉还行', '小明', 11, 3.0, 22, NULL, NULL, '2024-04-29 18:39:08');
INSERT INTO `comment` VALUES (1995403281, '我感觉还行啊', '小明', 11, NULL, 22, 22, '钱钱钱', '2024-04-29 18:39:18');
INSERT INTO `comment` VALUES (1995403282, '无敌了', '小明', 11, 5.0, 18, NULL, NULL, '2024-04-29 18:40:32');
INSERT INTO `comment` VALUES (1995403283, '真的好喝！！！！！！', '小明', 11, NULL, 18, 18, '钱钱钱', '2024-04-29 18:40:46');
INSERT INTO `comment` VALUES (1995403284, '确实不好喝', '小明', 11, 3.5, 25, NULL, NULL, '2024-05-01 14:25:03');
INSERT INTO `comment` VALUES (1995403286, '很好喝啊，暖胃', '钱钱钱', 10, 4.5, 20, NULL, NULL, '2024-05-03 23:52:56');
INSERT INTO `comment` VALUES (1995403287, '二刷', '钱钱钱', 10, 3.5, 19, NULL, NULL, '2024-05-04 17:42:17');
INSERT INTO `comment` VALUES (1995403288, '确实可以', '小明', 11, NULL, 21, 1995403285, '钱钱钱', '2024-05-14 14:42:27');

-- ----------------------------
-- Table structure for eachff
-- ----------------------------
DROP TABLE IF EXISTS `eachff`;
CREATE TABLE `eachff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名字',
  `userid` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eachff
-- ----------------------------
INSERT INTO `eachff` VALUES (4, '雀巢咖啡', 1, '2023-12-16 19:00:10', NULL);
INSERT INTO `eachff` VALUES (26, '耶耶类', 1, '2023-12-18 17:17:45', NULL);
INSERT INTO `eachff` VALUES (27, '酸奶类', 1, '2023-12-18 17:18:02', NULL);
INSERT INTO `eachff` VALUES (28, '分分', 12, '2024-04-27 19:53:15', NULL);

-- ----------------------------
-- Table structure for forvip
-- ----------------------------
DROP TABLE IF EXISTS `forvip`;
CREATE TABLE `forvip`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vipname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `vipfid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forvip
-- ----------------------------
INSERT INTO `forvip` VALUES (10, '黄金会员', 10, 'b', '2024-04-28 23:28:12');
INSERT INTO `forvip` VALUES (11, '白银会员', 11, 'a', '2024-04-28 23:12:53');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作类型',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (1, '用户信息', '127.0.0.1', 'a', '2023-12-15 16:41:30', '新增');
INSERT INTO `logs` VALUES (2, '用户信息', '127.0.0.1', 'a', '2023-12-15 16:42:49', '删除');
INSERT INTO `logs` VALUES (3, '用户登录', '127.0.0.1', 'a', '2023-12-16 15:34:21', '登录');
INSERT INTO `logs` VALUES (4, '系统公告', '127.0.0.1', 'a', '2023-12-16 15:55:43', '新增');
INSERT INTO `logs` VALUES (5, '系统公告', '127.0.0.1', 'a', '2023-12-16 15:55:43', '新增');
INSERT INTO `logs` VALUES (6, '系统公告', '127.0.0.1', 'a', '2023-12-16 15:55:43', '新增');
INSERT INTO `logs` VALUES (7, '用户登录', '127.0.0.1', 'a', '2023-12-16 17:09:32', '登录');
INSERT INTO `logs` VALUES (38, '咖啡管理', '127.0.0.1', 'a', '2023-12-17 23:18:01', '新增');
INSERT INTO `logs` VALUES (39, '用户登录', '127.0.0.1', 'a', '2023-12-18 13:57:04', '登录');
INSERT INTO `logs` VALUES (40, '系统公告', '127.0.0.1', 'a', '2023-12-18 13:57:39', '修改');
INSERT INTO `logs` VALUES (41, '系统公告', '127.0.0.1', 'a', '2023-12-18 13:57:42', '修改');
INSERT INTO `logs` VALUES (42, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:04:40', '修改');
INSERT INTO `logs` VALUES (43, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:25:32', '修改');
INSERT INTO `logs` VALUES (44, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:25:39', '修改');
INSERT INTO `logs` VALUES (45, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:25:53', '修改');
INSERT INTO `logs` VALUES (46, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:35:48', '新增');
INSERT INTO `logs` VALUES (47, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:35:51', '新增');
INSERT INTO `logs` VALUES (48, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:35:55', '新增');
INSERT INTO `logs` VALUES (49, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:36:00', '新增');
INSERT INTO `logs` VALUES (50, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:36:04', '新增');
INSERT INTO `logs` VALUES (51, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:36:10', '修改');
INSERT INTO `logs` VALUES (52, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:36:16', '修改');
INSERT INTO `logs` VALUES (53, '系统公告', '127.0.0.1', 'a', '2023-12-18 14:37:17', '修改');
INSERT INTO `logs` VALUES (54, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:37:26', '修改');
INSERT INTO `logs` VALUES (55, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:37:30', '修改');
INSERT INTO `logs` VALUES (56, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:37:33', '修改');
INSERT INTO `logs` VALUES (57, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:37:35', '修改');
INSERT INTO `logs` VALUES (58, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:37:45', '修改');
INSERT INTO `logs` VALUES (59, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:38:54', '修改');
INSERT INTO `logs` VALUES (60, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:39:03', '修改');
INSERT INTO `logs` VALUES (61, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:39:04', '修改');
INSERT INTO `logs` VALUES (62, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:39:07', '修改');
INSERT INTO `logs` VALUES (63, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:39:09', '修改');
INSERT INTO `logs` VALUES (64, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:39:10', '修改');
INSERT INTO `logs` VALUES (65, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:39:35', '新增');
INSERT INTO `logs` VALUES (66, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:39:56', '修改');
INSERT INTO `logs` VALUES (67, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:40:17', '修改');
INSERT INTO `logs` VALUES (68, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:40:24', '修改');
INSERT INTO `logs` VALUES (69, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 14:40:28', '删除');
INSERT INTO `logs` VALUES (70, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:59:43', '修改');
INSERT INTO `logs` VALUES (71, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 14:59:50', '修改');
INSERT INTO `logs` VALUES (72, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:00:07', '批量删除');
INSERT INTO `logs` VALUES (73, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:00:17', '批量删除');
INSERT INTO `logs` VALUES (74, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:05:47', '批量删除');
INSERT INTO `logs` VALUES (75, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:06:01', '批量删除');
INSERT INTO `logs` VALUES (76, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:07:35', '修改');
INSERT INTO `logs` VALUES (77, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:07:37', '修改');
INSERT INTO `logs` VALUES (78, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:07:38', '修改');
INSERT INTO `logs` VALUES (79, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:07:39', '修改');
INSERT INTO `logs` VALUES (80, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:07:41', '修改');
INSERT INTO `logs` VALUES (81, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:07:43', '修改');
INSERT INTO `logs` VALUES (82, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:08:01', '批量删除');
INSERT INTO `logs` VALUES (83, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:09:18', '新增');
INSERT INTO `logs` VALUES (84, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:14:28', '修改');
INSERT INTO `logs` VALUES (85, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:14:29', '修改');
INSERT INTO `logs` VALUES (86, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:14:31', '修改');
INSERT INTO `logs` VALUES (87, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:14:32', '修改');
INSERT INTO `logs` VALUES (88, '系统公告', '127.0.0.1', 'a', '2023-12-18 15:14:35', '修改');
INSERT INTO `logs` VALUES (89, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:17:10', '新增');
INSERT INTO `logs` VALUES (90, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:17:13', '新增');
INSERT INTO `logs` VALUES (91, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:17:17', '新增');
INSERT INTO `logs` VALUES (92, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:17:19', '新增');
INSERT INTO `logs` VALUES (93, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:17:22', '新增');
INSERT INTO `logs` VALUES (94, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:18:02', '新增');
INSERT INTO `logs` VALUES (95, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:21:58', '新增');
INSERT INTO `logs` VALUES (96, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:34:11', '删除');
INSERT INTO `logs` VALUES (97, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:34:42', '删除');
INSERT INTO `logs` VALUES (98, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:34:57', '批量删除');
INSERT INTO `logs` VALUES (99, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:35:09', '修改');
INSERT INTO `logs` VALUES (100, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:35:11', '修改');
INSERT INTO `logs` VALUES (101, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:35:15', '修改');
INSERT INTO `logs` VALUES (102, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:35:17', '修改');
INSERT INTO `logs` VALUES (103, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:35:23', '删除');
INSERT INTO `logs` VALUES (104, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:36:07', '新增');
INSERT INTO `logs` VALUES (105, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:37:03', '修改');
INSERT INTO `logs` VALUES (106, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:37:15', '修改');
INSERT INTO `logs` VALUES (107, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:37:21', '修改');
INSERT INTO `logs` VALUES (108, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:37:25', '修改');
INSERT INTO `logs` VALUES (109, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:37:37', '批量删除');
INSERT INTO `logs` VALUES (110, '用户登录', '127.0.0.1', 'a', '2023-12-18 15:58:39', '登录');
INSERT INTO `logs` VALUES (111, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:58:50', '新增');
INSERT INTO `logs` VALUES (112, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:58:53', '新增');
INSERT INTO `logs` VALUES (113, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:59:02', '修改');
INSERT INTO `logs` VALUES (114, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 15:59:09', '批量删除');
INSERT INTO `logs` VALUES (115, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 15:59:26', '修改');
INSERT INTO `logs` VALUES (116, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:00:00', '新增');
INSERT INTO `logs` VALUES (117, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:00:04', '新增');
INSERT INTO `logs` VALUES (118, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:00:12', '修改');
INSERT INTO `logs` VALUES (119, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:00:21', '修改');
INSERT INTO `logs` VALUES (120, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:00:36', '修改');
INSERT INTO `logs` VALUES (121, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:04:35', '批量删除');
INSERT INTO `logs` VALUES (122, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:09:53', '新增');
INSERT INTO `logs` VALUES (123, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:10:01', '修改');
INSERT INTO `logs` VALUES (124, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:10:05', '批量删除');
INSERT INTO `logs` VALUES (125, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:20:52', '新增');
INSERT INTO `logs` VALUES (126, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:21:01', '修改');
INSERT INTO `logs` VALUES (127, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:21:06', '批量删除');
INSERT INTO `logs` VALUES (128, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:28:16', '新增');
INSERT INTO `logs` VALUES (129, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:28:19', '新增');
INSERT INTO `logs` VALUES (130, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:28:50', '修改');
INSERT INTO `logs` VALUES (131, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:28:50', '修改');
INSERT INTO `logs` VALUES (132, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:28:52', '修改');
INSERT INTO `logs` VALUES (133, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:28:57', '修改');
INSERT INTO `logs` VALUES (134, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:29:08', '修改');
INSERT INTO `logs` VALUES (135, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:29:16', '修改');
INSERT INTO `logs` VALUES (136, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:29:28', '修改');
INSERT INTO `logs` VALUES (137, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:29:39', '修改');
INSERT INTO `logs` VALUES (138, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:29:40', '修改');
INSERT INTO `logs` VALUES (139, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:29:42', '修改');
INSERT INTO `logs` VALUES (140, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:29:46', '修改');
INSERT INTO `logs` VALUES (141, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:29:57', '修改');
INSERT INTO `logs` VALUES (142, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:34:24', '修改');
INSERT INTO `logs` VALUES (143, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:34:36', '修改');
INSERT INTO `logs` VALUES (144, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:34:44', '修改');
INSERT INTO `logs` VALUES (145, '用户登录', '127.0.0.1', 'a', '2023-12-18 16:35:23', '登录');
INSERT INTO `logs` VALUES (146, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:35:32', '修改');
INSERT INTO `logs` VALUES (147, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:39:30', '修改');
INSERT INTO `logs` VALUES (148, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:39:39', '修改');
INSERT INTO `logs` VALUES (149, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:39:46', '修改');
INSERT INTO `logs` VALUES (150, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:39:55', '修改');
INSERT INTO `logs` VALUES (151, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:40:01', '修改');
INSERT INTO `logs` VALUES (152, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:41:24', '修改');
INSERT INTO `logs` VALUES (153, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:41:32', '修改');
INSERT INTO `logs` VALUES (154, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 16:41:43', '批量删除');
INSERT INTO `logs` VALUES (155, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:42:26', '修改');
INSERT INTO `logs` VALUES (156, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:42:33', '修改');
INSERT INTO `logs` VALUES (157, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:57:54', '修改');
INSERT INTO `logs` VALUES (158, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:58:01', '修改');
INSERT INTO `logs` VALUES (159, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 16:58:09', '修改');
INSERT INTO `logs` VALUES (160, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 17:15:39', '修改');
INSERT INTO `logs` VALUES (161, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 17:15:46', '修改');
INSERT INTO `logs` VALUES (162, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 17:16:50', '修改');
INSERT INTO `logs` VALUES (163, '咖啡管理', '127.0.0.1', 'a', '2023-12-18 17:16:58', '修改');
INSERT INTO `logs` VALUES (164, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 17:17:32', '新增');
INSERT INTO `logs` VALUES (165, '咖啡分类', '127.0.0.1', 'a', '2023-12-18 17:17:37', '删除');
INSERT INTO `logs` VALUES (226, '咖啡管理', '127.0.0.1', 'a', '2023-12-22 15:02:11', '修改');
INSERT INTO `logs` VALUES (227, '咖啡管理', '127.0.0.1', 'a', '2023-12-22 15:33:22', '新增');
INSERT INTO `logs` VALUES (228, '用户登录', '127.0.0.1', 'a', '2023-12-22 16:35:35', '登录');
INSERT INTO `logs` VALUES (229, '用户登录', '127.0.0.1', 'a', '2023-12-22 21:02:57', '登录');
INSERT INTO `logs` VALUES (230, '咖啡管理', '127.0.0.1', 'a', '2023-12-22 21:33:39', '新增');
INSERT INTO `logs` VALUES (231, '用户登录', '127.0.0.1', 'a', '2023-12-22 23:26:15', '登录');
INSERT INTO `logs` VALUES (232, '用户登录', '127.0.0.1', 'a', '2023-12-23 15:41:30', '登录');
INSERT INTO `logs` VALUES (233, '用户登录', '127.0.0.1', 'a', '2023-12-23 17:47:46', '登录');
INSERT INTO `logs` VALUES (234, '咖啡管理', '127.0.0.1', 'a', '2023-12-23 18:20:31', '新增');
INSERT INTO `logs` VALUES (235, '用户登录', '127.0.0.1', 'a', '2023-12-23 20:01:12', '登录');
INSERT INTO `logs` VALUES (236, '咖啡管理', '127.0.0.1', 'a', '2023-12-23 20:04:03', '新增');
INSERT INTO `logs` VALUES (237, '咖啡管理', '127.0.0.1', 'a', '2023-12-23 20:04:24', '删除');
INSERT INTO `logs` VALUES (238, '用户登录', '127.0.0.1', 'a', '2023-12-23 22:14:54', '登录');
INSERT INTO `logs` VALUES (239, '用户登录', '127.0.0.1', 'a', '2023-12-24 15:12:21', '登录');
INSERT INTO `logs` VALUES (240, '用户登录', '127.0.0.1', 'a', '2023-12-24 15:24:13', '登录');
INSERT INTO `logs` VALUES (241, '用户登录', '127.0.0.1', 'a', '2023-12-24 17:28:25', '登录');
INSERT INTO `logs` VALUES (242, '用户登录', '127.0.0.1', 'a', '2023-12-25 16:42:23', '登录');
INSERT INTO `logs` VALUES (243, '用户登录', '127.0.0.1', 'a', '2023-12-28 19:24:24', '登录');
INSERT INTO `logs` VALUES (244, '用户登录', '127.0.0.1', 'a', '2024-04-09 19:45:58', '登录');
INSERT INTO `logs` VALUES (245, '用户登录', '127.0.0.1', 'a', '2024-04-10 16:14:49', '登录');
INSERT INTO `logs` VALUES (246, '广告管理', '127.0.0.1', 'a', '2024-04-10 16:20:27', '新增');
INSERT INTO `logs` VALUES (247, '用户登录', '127.0.0.1', 'a', '2024-04-10 19:18:10', '登录');
INSERT INTO `logs` VALUES (248, '用户登录', '127.0.0.1', 'a', '2024-04-10 22:58:21', '登录');
INSERT INTO `logs` VALUES (249, '用户登录', '127.0.0.1', 'a', '2024-04-11 13:23:12', '登录');
INSERT INTO `logs` VALUES (250, '用户登录', '127.0.0.1', 'a', '2024-04-11 16:10:40', '登录');
INSERT INTO `logs` VALUES (251, '用户登录', '127.0.0.1', 'a', '2024-04-11 20:25:17', '登录');
INSERT INTO `logs` VALUES (252, '用户登录', '127.0.0.1', 'a', '2024-04-11 22:32:09', '登录');
INSERT INTO `logs` VALUES (253, '用户登录', '127.0.0.1', 'a', '2024-04-12 11:20:26', '登录');
INSERT INTO `logs` VALUES (254, '用户登录', '127.0.0.1', 'a', '2024-04-12 13:41:18', '登录');
INSERT INTO `logs` VALUES (255, '用户登录', '127.0.0.1', 'a', '2024-04-12 16:43:43', '登录');
INSERT INTO `logs` VALUES (256, '订单管理', '127.0.0.1', 'a', '2024-04-12 17:06:57', '修改');
INSERT INTO `logs` VALUES (257, '订单管理', '127.0.0.1', 'a', '2024-04-12 17:09:16', '删除');
INSERT INTO `logs` VALUES (258, '用户登录', '127.0.0.1', 'a', '2024-04-12 18:54:49', '登录');
INSERT INTO `logs` VALUES (259, '订单', '127.0.0.1', 'a', '2024-04-12 18:56:58', '新增');
INSERT INTO `logs` VALUES (260, '订单', '127.0.0.1', 'a', '2024-04-12 19:02:54', '新增');
INSERT INTO `logs` VALUES (261, '用户登录', '127.0.0.1', 'a', '2024-04-12 19:32:58', '登录');
INSERT INTO `logs` VALUES (262, '用户登录', '127.0.0.1', 'a', '2024-04-12 22:00:30', '登录');
INSERT INTO `logs` VALUES (263, '订单', '127.0.0.1', 'a', '2024-04-12 22:02:00', '新增');
INSERT INTO `logs` VALUES (264, '订单管理', '127.0.0.1', 'a', '2024-04-12 22:04:27', '删除');
INSERT INTO `logs` VALUES (265, '订单', '127.0.0.1', 'a', '2024-04-12 22:04:37', '新增');
INSERT INTO `logs` VALUES (266, '订单', '127.0.0.1', 'a', '2024-04-12 22:04:54', '新增');
INSERT INTO `logs` VALUES (267, '用户登录', '127.0.0.1', 'a', '2024-04-13 00:19:41', '登录');
INSERT INTO `logs` VALUES (268, '用户登录', '127.0.0.1', 'a', '2024-04-13 10:37:29', '登录');
INSERT INTO `logs` VALUES (269, '用户登录', '127.0.0.1', 'a', '2024-04-13 13:04:15', '登录');
INSERT INTO `logs` VALUES (270, '订单管理', '127.0.0.1', 'a', '2024-04-13 13:56:13', '删除');
INSERT INTO `logs` VALUES (271, '订单', '127.0.0.1', 'a', '2024-04-13 14:36:38', '新增');
INSERT INTO `logs` VALUES (272, '订单', '127.0.0.1', 'a', '2024-04-13 14:36:38', '新增');
INSERT INTO `logs` VALUES (273, '订单', '127.0.0.1', 'a', '2024-04-13 14:36:39', '新增');
INSERT INTO `logs` VALUES (274, '订单', '127.0.0.1', 'a', '2024-04-13 14:36:39', '新增');
INSERT INTO `logs` VALUES (275, '订单', '127.0.0.1', 'a', '2024-04-13 14:36:39', '新增');
INSERT INTO `logs` VALUES (276, '订单', '127.0.0.1', 'a', '2024-04-13 14:59:50', '新增');
INSERT INTO `logs` VALUES (277, '用户登录', '127.0.0.1', 'a', '2024-04-13 15:07:49', '登录');
INSERT INTO `logs` VALUES (278, '用户登录', '127.0.0.1', 'a', '2024-04-13 17:42:10', '登录');
INSERT INTO `logs` VALUES (279, '用户登录', '127.0.0.1', 'a', '2024-04-13 19:58:52', '登录');
INSERT INTO `logs` VALUES (280, '订单', '127.0.0.1', 'a', '2024-04-13 20:03:06', '新增');
INSERT INTO `logs` VALUES (281, '订单', '127.0.0.1', 'a', '2024-04-13 21:31:46', '新增');
INSERT INTO `logs` VALUES (282, '订单', '127.0.0.1', 'a', '2024-04-13 21:47:32', '新增');
INSERT INTO `logs` VALUES (283, '订单', '127.0.0.1', 'a', '2024-04-13 21:48:27', '新增');
INSERT INTO `logs` VALUES (284, '购物车', '127.0.0.1', 'a', '2024-04-13 21:49:39', '新增');
INSERT INTO `logs` VALUES (285, '购物车', '127.0.0.1', 'a', '2024-04-13 21:49:44', '新增');
INSERT INTO `logs` VALUES (286, '购物车', '127.0.0.1', 'a', '2024-04-13 21:49:48', '新增');
INSERT INTO `logs` VALUES (287, '购物车', '127.0.0.1', 'a', '2024-04-13 21:49:52', '新增');
INSERT INTO `logs` VALUES (288, '购物车', '127.0.0.1', 'a', '2024-04-13 21:49:53', '新增');
INSERT INTO `logs` VALUES (289, '购物车', '127.0.0.1', 'a', '2024-04-13 21:49:53', '新增');
INSERT INTO `logs` VALUES (290, '购物车', '127.0.0.1', 'a', '2024-04-13 21:49:57', '新增');
INSERT INTO `logs` VALUES (291, '购物车', '127.0.0.1', 'a', '2024-04-13 21:49:57', '新增');
INSERT INTO `logs` VALUES (292, '订单', '127.0.0.1', 'a', '2024-04-13 21:50:10', '新增');
INSERT INTO `logs` VALUES (293, '用户登录', '127.0.0.1', 'a', '2024-04-13 22:30:44', '登录');
INSERT INTO `logs` VALUES (294, '用户登录', '127.0.0.1', '1', '2024-04-13 23:56:51', '登录');
INSERT INTO `logs` VALUES (295, '用户登录', '127.0.0.1', 'a', '2024-04-14 00:00:40', '登录');
INSERT INTO `logs` VALUES (296, '用户登录', '127.0.0.1', 'a', '2024-04-14 00:03:02', '登录');
INSERT INTO `logs` VALUES (297, '用户登录', '127.0.0.1', '1', '2024-04-14 00:03:22', '登录');
INSERT INTO `logs` VALUES (298, '订单', '127.0.0.1', '1', '2024-04-14 00:23:03', '新增');
INSERT INTO `logs` VALUES (299, '用户信息', '127.0.0.1', '1', '2024-04-14 00:26:52', '修改');
INSERT INTO `logs` VALUES (300, '用户信息', '127.0.0.1', '1', '2024-04-14 00:27:44', '修改');
INSERT INTO `logs` VALUES (301, '用户登录', '127.0.0.1', '1', '2024-04-14 00:28:20', '登录');
INSERT INTO `logs` VALUES (302, '用户信息', '127.0.0.1', 'a', '2024-04-14 00:28:30', '修改');
INSERT INTO `logs` VALUES (303, '用户信息', '127.0.0.1', 'a', '2024-04-14 00:28:55', '修改');
INSERT INTO `logs` VALUES (304, '用户信息', '127.0.0.1', 'a', '2024-04-14 00:31:25', '修改');
INSERT INTO `logs` VALUES (305, '用户信息', '127.0.0.1', '1', '2024-04-14 00:34:19', '修改');
INSERT INTO `logs` VALUES (306, '用户信息', '127.0.0.1', '1', '2024-04-14 00:35:18', '修改');
INSERT INTO `logs` VALUES (307, '用户信息', '127.0.0.1', '1', '2024-04-14 00:36:43', '修改');
INSERT INTO `logs` VALUES (308, '用户信息', '127.0.0.1', '1', '2024-04-14 00:37:04', '修改');
INSERT INTO `logs` VALUES (309, '用户登录', '127.0.0.1', '1', '2024-04-14 12:35:08', '登录');
INSERT INTO `logs` VALUES (310, '用户登录', '127.0.0.1', '1', '2024-04-14 14:13:45', '登录');
INSERT INTO `logs` VALUES (311, '用户登录', '127.0.0.1', '1', '2024-04-14 14:22:48', '登录');
INSERT INTO `logs` VALUES (312, '用户登录', '127.0.0.1', '1', '2024-04-14 14:32:40', '登录');
INSERT INTO `logs` VALUES (313, '用户登录', '127.0.0.1', '1', '2024-04-14 14:34:46', '登录');
INSERT INTO `logs` VALUES (314, '用户登录', '127.0.0.1', 'a', '2024-04-14 14:40:13', '登录');
INSERT INTO `logs` VALUES (315, '用户登录', '127.0.0.1', '1', '2024-04-14 14:48:09', '登录');
INSERT INTO `logs` VALUES (316, '用户登录', '127.0.0.1', 'a', '2024-04-14 14:48:57', '登录');
INSERT INTO `logs` VALUES (317, '用户登录', '127.0.0.1', '1', '2024-04-14 14:58:11', '登录');
INSERT INTO `logs` VALUES (318, '用户登录', '127.0.0.1', '1', '2024-04-14 14:59:51', '登录');
INSERT INTO `logs` VALUES (319, '用户登录', '127.0.0.1', '1', '2024-04-14 15:00:40', '登录');
INSERT INTO `logs` VALUES (320, '用户登录', '127.0.0.1', 'a', '2024-04-14 15:10:56', '登录');
INSERT INTO `logs` VALUES (321, '用户登录', '127.0.0.1', 'a', '2024-04-14 15:26:01', '登录');
INSERT INTO `logs` VALUES (322, '用户登录', '127.0.0.1', '1', '2024-04-14 15:31:53', '登录');
INSERT INTO `logs` VALUES (323, '用户登录', '127.0.0.1', 'CC', '2024-04-14 15:34:13', '登录');
INSERT INTO `logs` VALUES (324, '用户登录', '127.0.0.1', '1', '2024-04-14 16:18:11', '登录');
INSERT INTO `logs` VALUES (325, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:00:01', '删除');
INSERT INTO `logs` VALUES (326, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:00:12', '修改');
INSERT INTO `logs` VALUES (327, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:00:17', '删除');
INSERT INTO `logs` VALUES (328, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:00:35', '修改');
INSERT INTO `logs` VALUES (329, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:09:04', '新增');
INSERT INTO `logs` VALUES (330, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:09:15', '删除');
INSERT INTO `logs` VALUES (331, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:09:28', '修改');
INSERT INTO `logs` VALUES (332, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:09:33', '修改');
INSERT INTO `logs` VALUES (333, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:09:37', '修改');
INSERT INTO `logs` VALUES (334, '用户登录', '127.0.0.1', 'a', '2024-04-14 17:58:22', '登录');
INSERT INTO `logs` VALUES (335, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:58:27', '删除');
INSERT INTO `logs` VALUES (336, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:58:29', '删除');
INSERT INTO `logs` VALUES (337, '广告管理', '127.0.0.1', 'a', '2024-04-14 17:58:31', '删除');
INSERT INTO `logs` VALUES (338, '广告管理', '127.0.0.1', 'a', '2024-04-14 18:01:59', '新增');
INSERT INTO `logs` VALUES (339, '广告管理', '127.0.0.1', 'a', '2024-04-14 18:02:17', '新增');
INSERT INTO `logs` VALUES (340, '广告管理', '127.0.0.1', 'a', '2024-04-14 18:12:49', '修改');
INSERT INTO `logs` VALUES (341, '广告管理', '127.0.0.1', 'a', '2024-04-14 18:13:26', '修改');
INSERT INTO `logs` VALUES (342, '用户登录', '127.0.0.1', '1', '2024-04-14 18:26:30', '登录');
INSERT INTO `logs` VALUES (343, '用户登录', '127.0.0.1', '1', '2024-04-14 20:04:52', '登录');
INSERT INTO `logs` VALUES (344, '用户登录', '127.0.0.1', 'a', '2024-04-14 20:23:58', '登录');
INSERT INTO `logs` VALUES (345, '订单管理', '127.0.0.1', '1', '2024-04-14 20:24:57', '删除');
INSERT INTO `logs` VALUES (346, '订单管理', '127.0.0.1', '1', '2024-04-14 20:25:00', '删除');
INSERT INTO `logs` VALUES (347, '订单', '127.0.0.1', '1', '2024-04-14 20:25:18', '新增');
INSERT INTO `logs` VALUES (348, '用户登录', '127.0.0.1', 'a', '2024-04-14 22:10:19', '登录');
INSERT INTO `logs` VALUES (349, '购物车', '127.0.0.1', '1', '2024-04-14 22:10:26', '新增');
INSERT INTO `logs` VALUES (350, '购物车', '127.0.0.1', '1', '2024-04-14 22:10:30', '新增');
INSERT INTO `logs` VALUES (351, '订单', '127.0.0.1', '1', '2024-04-14 22:10:45', '新增');
INSERT INTO `logs` VALUES (352, '用户登录', '127.0.0.1', '1', '2024-04-14 22:11:57', '登录');
INSERT INTO `logs` VALUES (353, '订单管理', '127.0.0.1', '1', '2024-04-14 22:12:42', '删除');
INSERT INTO `logs` VALUES (354, '订单管理', '127.0.0.1', '1', '2024-04-14 22:12:44', '删除');
INSERT INTO `logs` VALUES (355, '订单管理', '127.0.0.1', '1', '2024-04-14 22:12:46', '删除');
INSERT INTO `logs` VALUES (356, '购物车', '127.0.0.1', '1', '2024-04-14 22:12:53', '新增');
INSERT INTO `logs` VALUES (357, '购物车', '127.0.0.1', '1', '2024-04-14 22:12:59', '新增');
INSERT INTO `logs` VALUES (358, '购物车', '127.0.0.1', '1', '2024-04-14 22:13:03', '新增');
INSERT INTO `logs` VALUES (359, '订单', '127.0.0.1', '1', '2024-04-14 22:13:09', '新增');
INSERT INTO `logs` VALUES (360, '订单', '127.0.0.1', '1', '2024-04-14 22:13:13', '新增');
INSERT INTO `logs` VALUES (361, '购物车', '127.0.0.1', '1', '2024-04-14 22:13:40', '新增');
INSERT INTO `logs` VALUES (362, '订单', '127.0.0.1', '1', '2024-04-14 22:24:46', '新增');
INSERT INTO `logs` VALUES (363, '订单', '127.0.0.1', '1', '2024-04-14 22:25:42', '新增');
INSERT INTO `logs` VALUES (364, '购物车', '127.0.0.1', '1', '2024-04-14 22:36:46', '新增');
INSERT INTO `logs` VALUES (365, '订单管理', '127.0.0.1', 'a', '2024-04-14 23:11:09', '删除');
INSERT INTO `logs` VALUES (366, '购物车', '127.0.0.1', 'a', '2024-04-14 23:26:12', '新增');
INSERT INTO `logs` VALUES (367, '用户登录', '127.0.0.1', '1', '2024-04-15 12:59:04', '登录');
INSERT INTO `logs` VALUES (368, '用户登录', '127.0.0.1', '1', '2024-04-15 13:31:32', '登录');
INSERT INTO `logs` VALUES (369, '订单', '127.0.0.1', '1', '2024-04-15 13:32:58', '新增');
INSERT INTO `logs` VALUES (370, '用户登录', '127.0.0.1', 'a', '2024-04-15 14:10:40', '登录');
INSERT INTO `logs` VALUES (371, '用户登录', '127.0.0.1', '1', '2024-04-15 16:00:32', '登录');
INSERT INTO `logs` VALUES (372, '用户登录', '127.0.0.1', '1', '2024-04-15 18:15:04', '登录');
INSERT INTO `logs` VALUES (373, '用户登录', '127.0.0.1', 'CC', '2024-04-15 19:42:42', '登录');
INSERT INTO `logs` VALUES (374, '用户登录', '127.0.0.1', 'CC', '2024-04-15 19:46:25', '登录');
INSERT INTO `logs` VALUES (375, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-15 19:47:05', '登录');
INSERT INTO `logs` VALUES (376, '用户登录', '127.0.0.1', '1', '2024-04-15 20:16:21', '登录');
INSERT INTO `logs` VALUES (377, '用户登录', '127.0.0.1', '1', '2024-04-15 22:17:44', '登录');
INSERT INTO `logs` VALUES (378, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-15 22:29:32', '登录');
INSERT INTO `logs` VALUES (379, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-16 19:15:06', '登录');
INSERT INTO `logs` VALUES (380, '用户登录', '127.0.0.1', 'a', '2024-04-16 19:15:11', '登录');
INSERT INTO `logs` VALUES (381, '用户登录', '127.0.0.1', 'a', '2024-04-16 19:15:27', '登录');
INSERT INTO `logs` VALUES (382, '用户登录', '127.0.0.1', 'a', '2024-04-16 19:15:40', '登录');
INSERT INTO `logs` VALUES (383, '用户登录', '127.0.0.1', '1', '2024-04-16 19:22:51', '登录');
INSERT INTO `logs` VALUES (384, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-16 19:36:53', '登录');
INSERT INTO `logs` VALUES (385, '用户登录', '127.0.0.1', 'a', '2024-04-17 13:12:08', '登录');
INSERT INTO `logs` VALUES (386, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-17 15:22:46', '登录');
INSERT INTO `logs` VALUES (387, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-17 15:54:54', '登录');
INSERT INTO `logs` VALUES (388, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-17 18:41:16', '登录');
INSERT INTO `logs` VALUES (389, '用户登录', '127.0.0.1', '1', '2024-04-17 20:57:01', '登录');
INSERT INTO `logs` VALUES (390, '用户登录', '127.0.0.1', 'a', '2024-04-17 22:33:04', '登录');
INSERT INTO `logs` VALUES (391, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 22:33:47', '修改');
INSERT INTO `logs` VALUES (392, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 22:33:56', '修改');
INSERT INTO `logs` VALUES (393, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 23:25:29', '修改');
INSERT INTO `logs` VALUES (394, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 23:25:30', '修改');
INSERT INTO `logs` VALUES (395, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 23:25:31', '修改');
INSERT INTO `logs` VALUES (396, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 23:25:31', '修改');
INSERT INTO `logs` VALUES (397, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 23:25:32', '修改');
INSERT INTO `logs` VALUES (398, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 23:25:33', '修改');
INSERT INTO `logs` VALUES (399, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 23:25:34', '修改');
INSERT INTO `logs` VALUES (400, '咖啡管理', '127.0.0.1', 'a', '2024-04-17 23:25:35', '修改');
INSERT INTO `logs` VALUES (401, '用户登录', '127.0.0.1', '1', '2024-04-18 11:18:55', '登录');
INSERT INTO `logs` VALUES (402, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-18 11:21:12', '登录');
INSERT INTO `logs` VALUES (403, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 11:21:35', '修改');
INSERT INTO `logs` VALUES (404, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 11:41:16', '修改');
INSERT INTO `logs` VALUES (405, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 13:03:08', '修改');
INSERT INTO `logs` VALUES (406, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 13:03:14', '修改');
INSERT INTO `logs` VALUES (407, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 13:04:28', '修改');
INSERT INTO `logs` VALUES (408, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 13:04:32', '修改');
INSERT INTO `logs` VALUES (409, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 13:05:37', '修改');
INSERT INTO `logs` VALUES (410, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 13:05:38', '修改');
INSERT INTO `logs` VALUES (411, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 13:09:00', '修改');
INSERT INTO `logs` VALUES (412, '用户登录', '127.0.0.1', 'a', '2024-04-18 13:36:08', '登录');
INSERT INTO `logs` VALUES (413, '用户登录', '127.0.0.1', 'a', '2024-04-18 19:07:41', '登录');
INSERT INTO `logs` VALUES (414, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-18 19:08:50', '登录');
INSERT INTO `logs` VALUES (415, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 19:08:54', '修改');
INSERT INTO `logs` VALUES (416, '咖啡管理', '127.0.0.1', 'a', '2024-04-18 19:12:08', '修改');
INSERT INTO `logs` VALUES (417, '咖啡管理', '127.0.0.1', 'a', '2024-04-18 19:12:11', '修改');
INSERT INTO `logs` VALUES (418, '咖啡管理', '127.0.0.1', 'a', '2024-04-18 19:13:07', '修改');
INSERT INTO `logs` VALUES (419, '咖啡管理', '127.0.0.1', 'a', '2024-04-18 19:39:27', '修改');
INSERT INTO `logs` VALUES (420, '用户信息', '127.0.0.1', 'a', '2024-04-18 19:41:07', '修改');
INSERT INTO `logs` VALUES (421, '用户信息', '127.0.0.1', 'a', '2024-04-18 20:04:09', '修改');
INSERT INTO `logs` VALUES (422, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 20:07:27', '修改');
INSERT INTO `logs` VALUES (423, '用户信息', '127.0.0.1', 'a', '2024-04-18 20:07:36', '修改');
INSERT INTO `logs` VALUES (424, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 20:07:47', '修改');
INSERT INTO `logs` VALUES (425, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-18 20:12:39', '修改');
INSERT INTO `logs` VALUES (426, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-18 22:53:20', '登录');
INSERT INTO `logs` VALUES (427, '用户登录', '127.0.0.1', 'a', '2024-04-18 23:07:50', '登录');
INSERT INTO `logs` VALUES (428, '用户信息', '127.0.0.1', 'a', '2024-04-18 23:25:54', '修改');
INSERT INTO `logs` VALUES (429, '用户登录', '127.0.0.1', 'a', '2024-04-19 11:08:03', '登录');
INSERT INTO `logs` VALUES (430, '用户登录', '127.0.0.1', 'a', '2024-04-19 13:57:36', '登录');
INSERT INTO `logs` VALUES (431, '系统公告', '127.0.0.1', 'a', '2024-04-19 14:13:05', '批量删除');
INSERT INTO `logs` VALUES (432, '用户登录', '127.0.0.1', '小明', '2024-04-19 14:55:10', '登录');
INSERT INTO `logs` VALUES (433, '用户登录', '127.0.0.1', '小明', '2024-04-19 15:28:39', '登录');
INSERT INTO `logs` VALUES (434, '用户信息', '127.0.0.1', '小明', '2024-04-19 16:20:26', '新增');
INSERT INTO `logs` VALUES (435, '用户登录', '127.0.0.1', 'a', '2024-04-19 16:21:28', '登录');
INSERT INTO `logs` VALUES (436, '用户信息', '127.0.0.1', 'a', '2024-04-19 16:30:56', '删除');
INSERT INTO `logs` VALUES (437, '用户信息', '127.0.0.1', '小明', '2024-04-19 16:36:59', '新增');
INSERT INTO `logs` VALUES (438, '用户登录', '127.0.0.1', 'CC', '2024-04-19 16:38:48', '登录');
INSERT INTO `logs` VALUES (439, '用户信息', '127.0.0.1', 'a', '2024-04-19 17:02:14', '删除');
INSERT INTO `logs` VALUES (440, '用户信息', '127.0.0.1', 'CC', '2024-04-19 17:02:22', '新增');
INSERT INTO `logs` VALUES (441, '用户信息', '127.0.0.1', 'CC', '2024-04-19 17:03:23', '新增');
INSERT INTO `logs` VALUES (442, '用户信息', '127.0.0.1', 'CC', '2024-04-19 17:11:37', '新增');
INSERT INTO `logs` VALUES (443, '用户信息', '127.0.0.1', 'CC', '2024-04-19 17:14:09', '新增');
INSERT INTO `logs` VALUES (444, '用户信息', '127.0.0.1', 'CC', '2024-04-19 17:18:26', '新增');
INSERT INTO `logs` VALUES (445, '用户信息', '127.0.0.1', 'CC', '2024-04-19 17:25:37', '新增');
INSERT INTO `logs` VALUES (446, '用户信息', '127.0.0.1', 'CC', '2024-04-19 17:34:18', '新增');
INSERT INTO `logs` VALUES (447, '用户信息', '127.0.0.1', 'CC', '2024-04-19 17:47:57', '新增');
INSERT INTO `logs` VALUES (448, '用户信息', '127.0.0.1', 'CC', '2024-04-19 18:02:37', '修改');
INSERT INTO `logs` VALUES (449, '用户信息', '127.0.0.1', 'a', '2024-04-19 18:02:53', '删除');
INSERT INTO `logs` VALUES (450, '用户信息', '127.0.0.1', 'a', '2024-04-19 18:02:56', '删除');
INSERT INTO `logs` VALUES (451, '用户信息', '127.0.0.1', 'a', '2024-04-19 18:02:59', '删除');
INSERT INTO `logs` VALUES (452, '用户信息', '127.0.0.1', 'CC', '2024-04-19 18:03:13', '修改');
INSERT INTO `logs` VALUES (453, '用户信息', '127.0.0.1', 'CC', '2024-04-19 18:12:27', '新增');
INSERT INTO `logs` VALUES (454, '用户信息', '127.0.0.1', 'CC', '2024-04-19 18:16:49', '新增');
INSERT INTO `logs` VALUES (455, '用户信息', '127.0.0.1', 'a', '2024-04-19 18:17:24', '删除');
INSERT INTO `logs` VALUES (456, '用户信息', '127.0.0.1', 'CC', '2024-04-19 18:18:46', '修改');
INSERT INTO `logs` VALUES (457, '用户登录', '127.0.0.1', 'a', '2024-04-19 18:23:30', '登录');
INSERT INTO `logs` VALUES (458, '用户信息', '127.0.0.1', 'CC', '2024-04-19 18:35:36', '修改');
INSERT INTO `logs` VALUES (459, '用户信息', '127.0.0.1', 'a', '2024-04-19 18:39:30', '删除');
INSERT INTO `logs` VALUES (460, '用户登录', '127.0.0.1', 'CC', '2024-04-19 18:40:22', '登录');
INSERT INTO `logs` VALUES (461, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 18:40:29', '修改');
INSERT INTO `logs` VALUES (462, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 18:40:59', '修改');
INSERT INTO `logs` VALUES (463, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 18:44:29', '修改');
INSERT INTO `logs` VALUES (464, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 18:46:14', '修改');
INSERT INTO `logs` VALUES (465, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 18:56:28', '修改');
INSERT INTO `logs` VALUES (466, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 18:58:06', '修改');
INSERT INTO `logs` VALUES (467, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 18:59:22', '修改');
INSERT INTO `logs` VALUES (468, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 19:25:16', '登录');
INSERT INTO `logs` VALUES (469, '用户登录', '127.0.0.1', 'a', '2024-04-19 20:27:11', '登录');
INSERT INTO `logs` VALUES (470, '咖啡管理', '127.0.0.1', 'a', '2024-04-19 20:27:26', '修改');
INSERT INTO `logs` VALUES (471, '咖啡管理', '127.0.0.1', 'a', '2024-04-19 20:27:42', '修改');
INSERT INTO `logs` VALUES (472, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 20:28:14', '修改');
INSERT INTO `logs` VALUES (473, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 20:28:41', '修改');
INSERT INTO `logs` VALUES (474, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 21:45:07', '登录');
INSERT INTO `logs` VALUES (475, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 21:46:44', '修改');
INSERT INTO `logs` VALUES (476, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 21:50:03', '修改');
INSERT INTO `logs` VALUES (477, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 21:50:46', '修改');
INSERT INTO `logs` VALUES (478, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:01:15', '修改');
INSERT INTO `logs` VALUES (479, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:01:25', '修改');
INSERT INTO `logs` VALUES (480, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:02:39', '修改');
INSERT INTO `logs` VALUES (481, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:02:48', '修改');
INSERT INTO `logs` VALUES (482, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:03:48', '修改');
INSERT INTO `logs` VALUES (483, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:07:08', '修改');
INSERT INTO `logs` VALUES (484, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 22:08:43', '登录');
INSERT INTO `logs` VALUES (485, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:09:28', '修改');
INSERT INTO `logs` VALUES (486, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:09:59', '修改');
INSERT INTO `logs` VALUES (487, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:10:43', '修改');
INSERT INTO `logs` VALUES (488, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:11:06', '修改');
INSERT INTO `logs` VALUES (489, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:13:48', '修改');
INSERT INTO `logs` VALUES (490, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:14:55', '修改');
INSERT INTO `logs` VALUES (491, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 22:15:35', '登录');
INSERT INTO `logs` VALUES (492, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:24:44', '修改');
INSERT INTO `logs` VALUES (493, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:24:53', '修改');
INSERT INTO `logs` VALUES (494, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 22:26:56', '登录');
INSERT INTO `logs` VALUES (495, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:37:44', '修改');
INSERT INTO `logs` VALUES (496, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 22:57:55', '修改');
INSERT INTO `logs` VALUES (497, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 23:11:34', '登录');
INSERT INTO `logs` VALUES (498, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 23:12:40', '修改');
INSERT INTO `logs` VALUES (499, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 23:14:49', '登录');
INSERT INTO `logs` VALUES (500, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 23:15:10', '修改');
INSERT INTO `logs` VALUES (501, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 23:15:43', '修改');
INSERT INTO `logs` VALUES (502, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 23:32:25', '登录');
INSERT INTO `logs` VALUES (503, '用户登录', '127.0.0.1', 'a', '2024-04-19 23:33:13', '登录');
INSERT INTO `logs` VALUES (504, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 23:38:07', '修改');
INSERT INTO `logs` VALUES (505, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 23:41:18', '修改');
INSERT INTO `logs` VALUES (506, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 23:42:03', '修改');
INSERT INTO `logs` VALUES (507, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 23:42:08', '修改');
INSERT INTO `logs` VALUES (508, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-19 23:44:33', '修改');
INSERT INTO `logs` VALUES (509, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-19 23:48:02', '登录');
INSERT INTO `logs` VALUES (510, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-20 00:01:48', '登录');
INSERT INTO `logs` VALUES (511, '用户登录', '127.0.0.1', 'a', '2024-04-20 10:52:51', '登录');
INSERT INTO `logs` VALUES (512, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-20 10:59:10', '登录');
INSERT INTO `logs` VALUES (513, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:27:59', '修改');
INSERT INTO `logs` VALUES (514, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:31:24', '修改');
INSERT INTO `logs` VALUES (515, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:32:37', '修改');
INSERT INTO `logs` VALUES (516, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:34:49', '修改');
INSERT INTO `logs` VALUES (517, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:36:04', '修改');
INSERT INTO `logs` VALUES (518, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:40:16', '修改');
INSERT INTO `logs` VALUES (519, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:53:02', '修改');
INSERT INTO `logs` VALUES (520, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:53:16', '修改');
INSERT INTO `logs` VALUES (521, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:56:04', '修改');
INSERT INTO `logs` VALUES (522, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 12:58:10', '修改');
INSERT INTO `logs` VALUES (523, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-20 13:04:28', '登录');
INSERT INTO `logs` VALUES (524, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:04:43', '修改');
INSERT INTO `logs` VALUES (525, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:04:54', '修改');
INSERT INTO `logs` VALUES (526, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:11:48', '修改');
INSERT INTO `logs` VALUES (527, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:11:55', '修改');
INSERT INTO `logs` VALUES (528, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:12:16', '修改');
INSERT INTO `logs` VALUES (529, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:13:09', '修改');
INSERT INTO `logs` VALUES (530, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:13:16', '修改');
INSERT INTO `logs` VALUES (531, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:14:45', '修改');
INSERT INTO `logs` VALUES (532, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:14:51', '修改');
INSERT INTO `logs` VALUES (533, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:14:58', '修改');
INSERT INTO `logs` VALUES (534, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:15:30', '修改');
INSERT INTO `logs` VALUES (535, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:16:32', '修改');
INSERT INTO `logs` VALUES (536, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:17:46', '修改');
INSERT INTO `logs` VALUES (537, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:17:53', '修改');
INSERT INTO `logs` VALUES (538, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:18:01', '修改');
INSERT INTO `logs` VALUES (539, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:18:07', '修改');
INSERT INTO `logs` VALUES (540, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:19:46', '修改');
INSERT INTO `logs` VALUES (541, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:23:41', '修改');
INSERT INTO `logs` VALUES (542, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:25:44', '修改');
INSERT INTO `logs` VALUES (543, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:26:07', '修改');
INSERT INTO `logs` VALUES (544, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:26:13', '修改');
INSERT INTO `logs` VALUES (545, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:26:21', '修改');
INSERT INTO `logs` VALUES (546, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:26:28', '修改');
INSERT INTO `logs` VALUES (547, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:27:19', '修改');
INSERT INTO `logs` VALUES (548, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:50:19', '修改');
INSERT INTO `logs` VALUES (549, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-20 13:56:40', '修改');
INSERT INTO `logs` VALUES (550, '用户登录', '127.0.0.1', 'a', '2024-04-21 13:38:54', '登录');
INSERT INTO `logs` VALUES (551, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-21 14:04:32', '登录');
INSERT INTO `logs` VALUES (552, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-21 14:04:45', '修改');
INSERT INTO `logs` VALUES (553, '购物车', '127.0.0.1', '钱钱钱', '2024-04-21 14:08:35', '新增');
INSERT INTO `logs` VALUES (554, '用户登录', '127.0.0.1', 'a', '2024-04-23 16:36:58', '登录');
INSERT INTO `logs` VALUES (555, '用户登录', '127.0.0.1', 'a', '2024-04-23 18:51:13', '登录');
INSERT INTO `logs` VALUES (556, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-23 18:52:54', '登录');
INSERT INTO `logs` VALUES (557, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:26:55', '修改');
INSERT INTO `logs` VALUES (558, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:28:44', '修改');
INSERT INTO `logs` VALUES (559, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:29:14', '修改');
INSERT INTO `logs` VALUES (560, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:29:55', '修改');
INSERT INTO `logs` VALUES (561, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:30:58', '修改');
INSERT INTO `logs` VALUES (562, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:48:10', '修改');
INSERT INTO `logs` VALUES (563, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:48:51', '修改');
INSERT INTO `logs` VALUES (564, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:49:21', '修改');
INSERT INTO `logs` VALUES (565, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 19:56:46', '修改');
INSERT INTO `logs` VALUES (566, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-23 19:59:04', '修改');
INSERT INTO `logs` VALUES (567, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:01:39', '修改');
INSERT INTO `logs` VALUES (568, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:05:20', '修改');
INSERT INTO `logs` VALUES (569, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:06:25', '修改');
INSERT INTO `logs` VALUES (570, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:09:08', '修改');
INSERT INTO `logs` VALUES (571, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:10:29', '修改');
INSERT INTO `logs` VALUES (572, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:12:26', '修改');
INSERT INTO `logs` VALUES (573, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:13:03', '修改');
INSERT INTO `logs` VALUES (574, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:13:45', '修改');
INSERT INTO `logs` VALUES (575, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:14:54', '修改');
INSERT INTO `logs` VALUES (576, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:17:46', '修改');
INSERT INTO `logs` VALUES (577, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:19:18', '修改');
INSERT INTO `logs` VALUES (578, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:26:56', '修改');
INSERT INTO `logs` VALUES (579, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:27:33', '修改');
INSERT INTO `logs` VALUES (580, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:29:28', '修改');
INSERT INTO `logs` VALUES (581, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:30:31', '修改');
INSERT INTO `logs` VALUES (582, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:31:09', '修改');
INSERT INTO `logs` VALUES (583, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 20:36:53', '修改');
INSERT INTO `logs` VALUES (584, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-23 22:08:20', '登录');
INSERT INTO `logs` VALUES (585, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 22:08:26', '修改');
INSERT INTO `logs` VALUES (586, '用户登录', '127.0.0.1', 'a', '2024-04-23 22:08:52', '登录');
INSERT INTO `logs` VALUES (587, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 22:11:38', '修改');
INSERT INTO `logs` VALUES (588, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 22:11:56', '修改');
INSERT INTO `logs` VALUES (589, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-23 22:12:18', '修改');
INSERT INTO `logs` VALUES (590, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-23 22:12:54', '修改');
INSERT INTO `logs` VALUES (591, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 22:55:58', '修改');
INSERT INTO `logs` VALUES (592, '订单管理', '127.0.0.1', 'a', '2024-04-23 23:02:25', '删除');
INSERT INTO `logs` VALUES (593, '订单管理', '127.0.0.1', 'a', '2024-04-23 23:02:27', '删除');
INSERT INTO `logs` VALUES (594, '订单管理', '127.0.0.1', 'a', '2024-04-23 23:02:30', '删除');
INSERT INTO `logs` VALUES (595, '订单管理', '127.0.0.1', 'a', '2024-04-23 23:02:32', '删除');
INSERT INTO `logs` VALUES (596, '订单管理', '127.0.0.1', 'a', '2024-04-23 23:05:20', '删除');
INSERT INTO `logs` VALUES (597, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 23:06:29', '修改');
INSERT INTO `logs` VALUES (598, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 23:08:35', '修改');
INSERT INTO `logs` VALUES (599, '订单管理', '127.0.0.1', 'a', '2024-04-23 23:29:27', '删除');
INSERT INTO `logs` VALUES (600, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-23 23:30:42', '修改');
INSERT INTO `logs` VALUES (601, '用户登录', '127.0.0.1', 'a', '2024-04-24 12:59:12', '登录');
INSERT INTO `logs` VALUES (602, '用户登录', '127.0.0.1', 'a', '2024-04-24 16:10:14', '登录');
INSERT INTO `logs` VALUES (603, '用户登录', '127.0.0.1', 'a', '2024-04-24 19:13:46', '登录');
INSERT INTO `logs` VALUES (604, '用户信息', '127.0.0.1', 'a', '2024-04-24 19:14:07', '修改');
INSERT INTO `logs` VALUES (605, '用户登录', '127.0.0.1', 'a', '2024-04-24 22:50:29', '登录');
INSERT INTO `logs` VALUES (606, '用户登录', '127.0.0.1', 'a', '2024-04-24 22:55:30', '登录');
INSERT INTO `logs` VALUES (607, '用户信息', '127.0.0.1', 'a', '2024-04-24 22:55:39', '修改');
INSERT INTO `logs` VALUES (608, '用户信息', '127.0.0.1', 'a', '2024-04-24 22:56:04', '修改');
INSERT INTO `logs` VALUES (609, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-24 22:57:01', '登录');
INSERT INTO `logs` VALUES (610, '购物车', '127.0.0.1', '钱钱钱', '2024-04-24 23:03:39', '新增');
INSERT INTO `logs` VALUES (611, '购物车', '127.0.0.1', '钱钱钱', '2024-04-24 23:11:24', '新增');
INSERT INTO `logs` VALUES (612, '订单', '127.0.0.1', '钱钱钱', '2024-04-24 23:16:26', '新增');
INSERT INTO `logs` VALUES (613, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-24 23:23:36', '修改');
INSERT INTO `logs` VALUES (614, '用户登录', '127.0.0.1', 'a', '2024-04-25 12:24:58', '登录');
INSERT INTO `logs` VALUES (615, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-25 12:55:48', '登录');
INSERT INTO `logs` VALUES (616, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 12:56:08', '新增');
INSERT INTO `logs` VALUES (617, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 12:56:21', '新增');
INSERT INTO `logs` VALUES (618, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 12:56:39', '新增');
INSERT INTO `logs` VALUES (619, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 12:57:10', '新增');
INSERT INTO `logs` VALUES (620, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 13:26:11', '新增');
INSERT INTO `logs` VALUES (621, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-25 13:50:04', '修改');
INSERT INTO `logs` VALUES (622, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-25 13:51:13', '修改');
INSERT INTO `logs` VALUES (623, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-25 13:52:48', '修改');
INSERT INTO `logs` VALUES (624, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 13:53:05', '新增');
INSERT INTO `logs` VALUES (625, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-25 13:55:09', '修改');
INSERT INTO `logs` VALUES (626, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-25 14:18:27', '删除');
INSERT INTO `logs` VALUES (627, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 14:33:56', '新增');
INSERT INTO `logs` VALUES (628, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-25 14:34:09', '删除');
INSERT INTO `logs` VALUES (629, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-25 14:34:11', '删除');
INSERT INTO `logs` VALUES (630, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-25 14:34:15', '删除');
INSERT INTO `logs` VALUES (631, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 14:34:20', '新增');
INSERT INTO `logs` VALUES (632, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-25 14:58:18', '登录');
INSERT INTO `logs` VALUES (633, '订单', '127.0.0.1', '钱钱钱', '2024-04-25 15:14:24', '新增');
INSERT INTO `logs` VALUES (634, '用户登录', '127.0.0.1', 'a', '2024-04-25 15:29:08', '登录');
INSERT INTO `logs` VALUES (635, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 15:29:21', '修改');
INSERT INTO `logs` VALUES (636, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-25 15:34:36', '修改');
INSERT INTO `logs` VALUES (637, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-25 15:34:51', '修改');
INSERT INTO `logs` VALUES (638, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 15:58:52', '新增');
INSERT INTO `logs` VALUES (639, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 15:59:01', '新增');
INSERT INTO `logs` VALUES (640, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 15:59:06', '新增');
INSERT INTO `logs` VALUES (641, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 16:01:37', '新增');
INSERT INTO `logs` VALUES (642, '购物车', '127.0.0.1', '钱钱钱', '2024-04-25 16:01:41', '新增');
INSERT INTO `logs` VALUES (643, '广告管理', '127.0.0.1', 'a', '2024-04-25 16:21:17', '新增');
INSERT INTO `logs` VALUES (644, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-25 16:28:05', '登录');
INSERT INTO `logs` VALUES (645, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-25 16:39:24', '修改');
INSERT INTO `logs` VALUES (646, '用户登录', '127.0.0.1', 'a', '2024-04-25 18:57:46', '登录');
INSERT INTO `logs` VALUES (647, '系统公告', '127.0.0.1', 'a', '2024-04-25 19:11:40', '新增');
INSERT INTO `logs` VALUES (648, '系统公告', '127.0.0.1', 'a', '2024-04-25 19:11:52', '批量删除');
INSERT INTO `logs` VALUES (649, '系统公告', '127.0.0.1', 'a', '2024-04-25 19:12:00', '批量删除');
INSERT INTO `logs` VALUES (650, '系统公告', '127.0.0.1', 'a', '2024-04-25 19:13:44', '新增');
INSERT INTO `logs` VALUES (651, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-25 19:19:31', '登录');
INSERT INTO `logs` VALUES (652, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:33:57', '修改');
INSERT INTO `logs` VALUES (653, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:40:40', '修改');
INSERT INTO `logs` VALUES (654, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:41:16', '修改');
INSERT INTO `logs` VALUES (655, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:54:12', '修改');
INSERT INTO `logs` VALUES (656, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:54:41', '修改');
INSERT INTO `logs` VALUES (657, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:54:57', '修改');
INSERT INTO `logs` VALUES (658, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:55:19', '修改');
INSERT INTO `logs` VALUES (659, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:55:47', '修改');
INSERT INTO `logs` VALUES (660, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:55:53', '修改');
INSERT INTO `logs` VALUES (661, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 19:56:13', '修改');
INSERT INTO `logs` VALUES (662, '用户登录', '127.0.0.1', 'a', '2024-04-25 22:33:36', '登录');
INSERT INTO `logs` VALUES (663, '咖啡管理', '127.0.0.1', 'a', '2024-04-25 22:34:16', '修改');
INSERT INTO `logs` VALUES (664, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-25 22:55:10', '登录');
INSERT INTO `logs` VALUES (665, '用户登录', '127.0.0.1', 'a', '2024-04-26 22:58:46', '登录');
INSERT INTO `logs` VALUES (666, '用户登录', '127.0.0.1', 'CC', '2024-04-26 23:34:19', '登录');
INSERT INTO `logs` VALUES (667, '用户信息', '127.0.0.1', 'CC', '2024-04-26 23:34:29', '修改');
INSERT INTO `logs` VALUES (668, '用户信息', '127.0.0.1', 'CC', '2024-04-26 23:40:59', '修改');
INSERT INTO `logs` VALUES (669, '用户登录', '127.0.0.1', 'a', '2024-04-27 11:15:36', '登录');
INSERT INTO `logs` VALUES (670, '用户登录', '127.0.0.1', '小明', '2024-04-27 12:37:14', '登录');
INSERT INTO `logs` VALUES (671, '会员管理', '127.0.0.1', '小明', '2024-04-27 12:44:44', '新增');
INSERT INTO `logs` VALUES (672, '会员管理', '127.0.0.1', '小明', '2024-04-27 13:14:33', '新增');
INSERT INTO `logs` VALUES (673, '用户登录', '127.0.0.1', 'a', '2024-04-27 13:30:37', '登录');
INSERT INTO `logs` VALUES (674, '购物车', '127.0.0.1', '小明', '2024-04-27 13:55:44', '新增');
INSERT INTO `logs` VALUES (675, '订单管理', '127.0.0.1', '小明', '2024-04-27 13:56:38', '删除');
INSERT INTO `logs` VALUES (676, '购物车', '127.0.0.1', '小明', '2024-04-27 13:56:46', '新增');
INSERT INTO `logs` VALUES (677, '购物车', '127.0.0.1', '小明', '2024-04-27 13:56:59', '新增');
INSERT INTO `logs` VALUES (678, '订单管理', '127.0.0.1', '小明', '2024-04-27 13:57:15', '删除');
INSERT INTO `logs` VALUES (679, '订单管理', '127.0.0.1', '小明', '2024-04-27 13:57:18', '删除');
INSERT INTO `logs` VALUES (680, '订单管理', '127.0.0.1', '小明', '2024-04-27 13:57:20', '删除');
INSERT INTO `logs` VALUES (681, '订单管理', '127.0.0.1', '小明', '2024-04-27 13:57:23', '删除');
INSERT INTO `logs` VALUES (682, '订单管理', '127.0.0.1', '小明', '2024-04-27 13:57:25', '删除');
INSERT INTO `logs` VALUES (683, '订单管理', '127.0.0.1', '小明', '2024-04-27 13:57:27', '删除');
INSERT INTO `logs` VALUES (684, '购物车', '127.0.0.1', '小明', '2024-04-27 13:57:37', '新增');
INSERT INTO `logs` VALUES (685, '购物车', '127.0.0.1', '小明', '2024-04-27 13:59:18', '新增');
INSERT INTO `logs` VALUES (686, '订单', '127.0.0.1', '小明', '2024-04-27 14:04:18', '新增');
INSERT INTO `logs` VALUES (687, '订单', '127.0.0.1', '小明', '2024-04-27 14:04:43', '新增');
INSERT INTO `logs` VALUES (688, '购物车', '127.0.0.1', '小明', '2024-04-27 14:05:09', '新增');
INSERT INTO `logs` VALUES (689, '购物车', '127.0.0.1', '小明', '2024-04-27 14:06:20', '新增');
INSERT INTO `logs` VALUES (690, '用户登录', '127.0.0.1', '小明', '2024-04-27 14:38:13', '登录');
INSERT INTO `logs` VALUES (691, '会员管理', '127.0.0.1', '小明', '2024-04-27 14:42:06', '修改');
INSERT INTO `logs` VALUES (692, '会员管理', '127.0.0.1', '小明', '2024-04-27 14:42:26', '修改');
INSERT INTO `logs` VALUES (693, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:01:42', '修改');
INSERT INTO `logs` VALUES (694, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:02:52', '修改');
INSERT INTO `logs` VALUES (695, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:03:01', '修改');
INSERT INTO `logs` VALUES (696, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:05:17', '修改');
INSERT INTO `logs` VALUES (697, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:08:31', '修改');
INSERT INTO `logs` VALUES (698, '用户信息', '127.0.0.1', 'a', '2024-04-27 15:18:05', '修改');
INSERT INTO `logs` VALUES (699, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:28:24', '修改');
INSERT INTO `logs` VALUES (700, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:28:48', '修改');
INSERT INTO `logs` VALUES (701, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:30:57', '修改');
INSERT INTO `logs` VALUES (702, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:31:12', '修改');
INSERT INTO `logs` VALUES (703, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:42:07', '修改');
INSERT INTO `logs` VALUES (704, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:44:15', '修改');
INSERT INTO `logs` VALUES (705, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:45:47', '修改');
INSERT INTO `logs` VALUES (706, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:46:38', '新增');
INSERT INTO `logs` VALUES (707, '用户登录', '127.0.0.1', 'a', '2024-04-27 15:49:30', '登录');
INSERT INTO `logs` VALUES (708, '用户信息', '127.0.0.1', 'a', '2024-04-27 15:49:52', '修改');
INSERT INTO `logs` VALUES (709, '会员管理', '127.0.0.1', '小明', '2024-04-27 15:59:41', '新增');
INSERT INTO `logs` VALUES (710, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:02:28', '新增');
INSERT INTO `logs` VALUES (711, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:04:00', '新增');
INSERT INTO `logs` VALUES (712, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:05:50', '新增');
INSERT INTO `logs` VALUES (713, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:08:35', '新增');
INSERT INTO `logs` VALUES (714, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:10:32', '修改');
INSERT INTO `logs` VALUES (715, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:11:57', '修改');
INSERT INTO `logs` VALUES (716, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:26:39', '新增');
INSERT INTO `logs` VALUES (717, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:28:16', '新增');
INSERT INTO `logs` VALUES (718, '用户登录', '127.0.0.1', '小明', '2024-04-27 16:41:26', '登录');
INSERT INTO `logs` VALUES (719, '用户登录', '127.0.0.1', '小明', '2024-04-27 16:42:19', '登录');
INSERT INTO `logs` VALUES (720, '用户信息', '127.0.0.1', '小明', '2024-04-27 16:42:26', '修改');
INSERT INTO `logs` VALUES (721, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:42:26', '新增');
INSERT INTO `logs` VALUES (722, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:43:05', '新增');
INSERT INTO `logs` VALUES (723, '用户信息', '127.0.0.1', '小明', '2024-04-27 16:43:05', '修改');
INSERT INTO `logs` VALUES (724, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:46:16', '新增');
INSERT INTO `logs` VALUES (725, '用户信息', '127.0.0.1', '小明', '2024-04-27 16:46:16', '修改');
INSERT INTO `logs` VALUES (726, '会员管理', '127.0.0.1', '小明', '2024-04-27 16:46:37', '新增');
INSERT INTO `logs` VALUES (727, '用户信息', '127.0.0.1', '小明', '2024-04-27 16:46:37', '修改');
INSERT INTO `logs` VALUES (728, '会员管理', '127.0.0.1', '小明', '2024-04-27 17:08:09', '修改');
INSERT INTO `logs` VALUES (729, '用户信息', '127.0.0.1', '小明', '2024-04-27 17:08:09', '修改');
INSERT INTO `logs` VALUES (730, '用户登录', '127.0.0.1', '小明', '2024-04-27 17:15:02', '登录');
INSERT INTO `logs` VALUES (731, '会员管理', '127.0.0.1', '小明', '2024-04-27 17:15:52', '新增');
INSERT INTO `logs` VALUES (732, '用户信息', '127.0.0.1', '小明', '2024-04-27 17:15:52', '修改');
INSERT INTO `logs` VALUES (733, '会员管理', '127.0.0.1', '小明', '2024-04-27 17:16:15', '新增');
INSERT INTO `logs` VALUES (734, '用户信息', '127.0.0.1', '小明', '2024-04-27 17:16:15', '修改');
INSERT INTO `logs` VALUES (735, '用户登录', '127.0.0.1', 'a', '2024-04-27 19:13:02', '登录');
INSERT INTO `logs` VALUES (736, '咖啡管理', '127.0.0.1', 'a', '2024-04-27 19:13:47', '新增');
INSERT INTO `logs` VALUES (737, '咖啡管理', '127.0.0.1', 'a', '2024-04-27 19:17:04', '删除');
INSERT INTO `logs` VALUES (738, '咖啡管理', '127.0.0.1', 'a', '2024-04-27 19:17:30', '新增');
INSERT INTO `logs` VALUES (739, '用户登录', '127.0.0.1', '小明', '2024-04-27 19:20:28', '登录');
INSERT INTO `logs` VALUES (740, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:20:46', '修改');
INSERT INTO `logs` VALUES (741, '会员管理', '127.0.0.1', '小明', '2024-04-27 19:20:46', '新增');
INSERT INTO `logs` VALUES (742, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:25:14', '修改');
INSERT INTO `logs` VALUES (743, '会员管理', '127.0.0.1', '小明', '2024-04-27 19:25:14', '新增');
INSERT INTO `logs` VALUES (744, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:25:32', '修改');
INSERT INTO `logs` VALUES (745, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:28:08', '修改');
INSERT INTO `logs` VALUES (746, '会员管理', '127.0.0.1', '小明', '2024-04-27 19:28:08', '修改');
INSERT INTO `logs` VALUES (747, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:28:18', '修改');
INSERT INTO `logs` VALUES (748, '会员管理', '127.0.0.1', '小明', '2024-04-27 19:28:18', '修改');
INSERT INTO `logs` VALUES (749, '会员管理', '127.0.0.1', '小明', '2024-04-27 19:33:39', '修改');
INSERT INTO `logs` VALUES (750, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:33:39', '修改');
INSERT INTO `logs` VALUES (751, '会员管理', '127.0.0.1', '小明', '2024-04-27 19:33:59', '修改');
INSERT INTO `logs` VALUES (752, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:33:59', '修改');
INSERT INTO `logs` VALUES (753, '会员管理', '127.0.0.1', '小明', '2024-04-27 19:36:06', '修改');
INSERT INTO `logs` VALUES (754, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:36:06', '修改');
INSERT INTO `logs` VALUES (755, '会员管理', '127.0.0.1', '小明', '2024-04-27 19:36:24', '修改');
INSERT INTO `logs` VALUES (756, '用户信息', '127.0.0.1', '小明', '2024-04-27 19:36:24', '修改');
INSERT INTO `logs` VALUES (757, '用户信息', '127.0.0.1', 'a', '2024-04-27 19:47:08', '修改');
INSERT INTO `logs` VALUES (758, '咖啡分类', '127.0.0.1', 'a', '2024-04-27 19:53:15', '新增');
INSERT INTO `logs` VALUES (759, '咖啡管理', '127.0.0.1', 'a', '2024-04-27 19:54:33', '修改');
INSERT INTO `logs` VALUES (760, '咖啡管理', '127.0.0.1', 'a', '2024-04-27 19:54:38', '修改');
INSERT INTO `logs` VALUES (761, '咖啡管理', '127.0.0.1', 'a', '2024-04-27 19:57:58', '修改');
INSERT INTO `logs` VALUES (762, '咖啡管理', '127.0.0.1', 'a', '2024-04-27 19:58:11', '新增');
INSERT INTO `logs` VALUES (763, '咖啡管理', '127.0.0.1', 'a', '2024-04-27 19:58:22', '删除');
INSERT INTO `logs` VALUES (764, '用户登录', '127.0.0.1', 'a', '2024-04-28 19:22:02', '登录');
INSERT INTO `logs` VALUES (765, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 19:53:32', '修改');
INSERT INTO `logs` VALUES (766, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 19:54:05', '修改');
INSERT INTO `logs` VALUES (767, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 19:58:04', '修改');
INSERT INTO `logs` VALUES (768, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 20:01:26', '修改');
INSERT INTO `logs` VALUES (769, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 20:04:12', '修改');
INSERT INTO `logs` VALUES (770, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 20:04:18', '修改');
INSERT INTO `logs` VALUES (771, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 20:04:29', '修改');
INSERT INTO `logs` VALUES (772, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 20:04:29', '修改');
INSERT INTO `logs` VALUES (773, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 20:04:30', '修改');
INSERT INTO `logs` VALUES (774, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 20:04:38', '修改');
INSERT INTO `logs` VALUES (775, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 20:06:13', '修改');
INSERT INTO `logs` VALUES (776, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 20:06:29', '修改');
INSERT INTO `logs` VALUES (777, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-28 22:24:37', '登录');
INSERT INTO `logs` VALUES (778, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 22:55:42', '修改');
INSERT INTO `logs` VALUES (779, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 22:55:42', '修改');
INSERT INTO `logs` VALUES (780, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 22:56:19', '修改');
INSERT INTO `logs` VALUES (781, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 22:56:19', '修改');
INSERT INTO `logs` VALUES (782, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 22:59:00', '修改');
INSERT INTO `logs` VALUES (783, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 22:59:00', '修改');
INSERT INTO `logs` VALUES (784, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (785, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (786, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (787, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (788, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (789, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (790, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (791, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (792, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:03:04', '修改');
INSERT INTO `logs` VALUES (793, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (794, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (795, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (796, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (797, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (798, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (799, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (800, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (801, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:08:22', '修改');
INSERT INTO `logs` VALUES (802, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '修改');
INSERT INTO `logs` VALUES (803, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '修改');
INSERT INTO `logs` VALUES (804, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '修改');
INSERT INTO `logs` VALUES (805, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '修改');
INSERT INTO `logs` VALUES (806, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '修改');
INSERT INTO `logs` VALUES (807, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '修改');
INSERT INTO `logs` VALUES (808, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '修改');
INSERT INTO `logs` VALUES (809, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '新增');
INSERT INTO `logs` VALUES (810, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 23:12:53', '新增');
INSERT INTO `logs` VALUES (811, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:16:31', '修改');
INSERT INTO `logs` VALUES (812, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:16:31', '修改');
INSERT INTO `logs` VALUES (813, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:16:31', '修改');
INSERT INTO `logs` VALUES (814, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:16:31', '修改');
INSERT INTO `logs` VALUES (815, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:16:31', '修改');
INSERT INTO `logs` VALUES (816, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:16:31', '修改');
INSERT INTO `logs` VALUES (817, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:16:31', '修改');
INSERT INTO `logs` VALUES (818, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 23:16:31', '修改');
INSERT INTO `logs` VALUES (819, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:19:47', '修改');
INSERT INTO `logs` VALUES (820, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:19:47', '修改');
INSERT INTO `logs` VALUES (821, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:19:47', '修改');
INSERT INTO `logs` VALUES (822, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:19:47', '修改');
INSERT INTO `logs` VALUES (823, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:19:47', '修改');
INSERT INTO `logs` VALUES (824, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:19:47', '修改');
INSERT INTO `logs` VALUES (825, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:19:47', '修改');
INSERT INTO `logs` VALUES (826, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 23:19:47', '新增');
INSERT INTO `logs` VALUES (827, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '修改');
INSERT INTO `logs` VALUES (828, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '修改');
INSERT INTO `logs` VALUES (829, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '修改');
INSERT INTO `logs` VALUES (830, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '修改');
INSERT INTO `logs` VALUES (831, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '修改');
INSERT INTO `logs` VALUES (832, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '修改');
INSERT INTO `logs` VALUES (833, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '新增');
INSERT INTO `logs` VALUES (834, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '新增');
INSERT INTO `logs` VALUES (835, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:27:04', '修改');
INSERT INTO `logs` VALUES (836, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:12', '修改');
INSERT INTO `logs` VALUES (837, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:13', '修改');
INSERT INTO `logs` VALUES (838, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:13', '修改');
INSERT INTO `logs` VALUES (839, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:12', '新增');
INSERT INTO `logs` VALUES (840, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:13', '修改');
INSERT INTO `logs` VALUES (841, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:13', '修改');
INSERT INTO `logs` VALUES (842, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:13', '修改');
INSERT INTO `logs` VALUES (843, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:13', '修改');
INSERT INTO `logs` VALUES (844, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-28 23:28:13', '修改');
INSERT INTO `logs` VALUES (845, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-29 11:03:35', '登录');
INSERT INTO `logs` VALUES (846, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-29 11:54:05', '登录');
INSERT INTO `logs` VALUES (847, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (848, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (849, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (850, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (851, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (852, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (853, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (854, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (855, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-29 12:02:26', '修改');
INSERT INTO `logs` VALUES (856, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (857, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (858, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (859, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (860, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (861, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (862, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (863, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (864, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:05:22', '修改');
INSERT INTO `logs` VALUES (865, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (866, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (867, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (868, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (869, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (870, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (871, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (872, '咖啡管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (873, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-29 12:14:41', '修改');
INSERT INTO `logs` VALUES (874, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-29 12:16:06', '修改');
INSERT INTO `logs` VALUES (875, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:16:06', '修改');
INSERT INTO `logs` VALUES (876, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-29 12:32:38', '修改');
INSERT INTO `logs` VALUES (877, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:32:38', '修改');
INSERT INTO `logs` VALUES (878, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:43:34', '修改');
INSERT INTO `logs` VALUES (879, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-29 12:43:34', '修改');
INSERT INTO `logs` VALUES (880, '购物车', '127.0.0.1', '钱钱钱', '2024-04-29 12:52:33', '新增');
INSERT INTO `logs` VALUES (881, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 12:57:43', '删除');
INSERT INTO `logs` VALUES (882, '购物车', '127.0.0.1', '钱钱钱', '2024-04-29 12:57:54', '新增');
INSERT INTO `logs` VALUES (883, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-29 13:08:46', '登录');
INSERT INTO `logs` VALUES (884, '购物车', '127.0.0.1', '钱钱钱', '2024-04-29 13:19:11', '新增');
INSERT INTO `logs` VALUES (885, '购物车', '127.0.0.1', '钱钱钱', '2024-04-29 13:20:39', '新增');
INSERT INTO `logs` VALUES (886, '订单', '127.0.0.1', '钱钱钱', '2024-04-29 13:21:06', '新增');
INSERT INTO `logs` VALUES (887, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:21:30', '删除');
INSERT INTO `logs` VALUES (888, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:21:57', '删除');
INSERT INTO `logs` VALUES (889, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:22:12', '删除');
INSERT INTO `logs` VALUES (890, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:22:52', '删除');
INSERT INTO `logs` VALUES (891, '订单', '127.0.0.1', '钱钱钱', '2024-04-29 13:23:04', '新增');
INSERT INTO `logs` VALUES (892, '订单', '127.0.0.1', '钱钱钱', '2024-04-29 13:23:07', '新增');
INSERT INTO `logs` VALUES (893, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:23:18', '删除');
INSERT INTO `logs` VALUES (894, '购物车', '127.0.0.1', '钱钱钱', '2024-04-29 13:23:47', '新增');
INSERT INTO `logs` VALUES (895, '订单', '127.0.0.1', '钱钱钱', '2024-04-29 13:23:52', '新增');
INSERT INTO `logs` VALUES (896, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:24:07', '删除');
INSERT INTO `logs` VALUES (897, '用户信息', '127.0.0.1', '钱钱钱', '2024-04-29 13:24:32', '修改');
INSERT INTO `logs` VALUES (898, '会员管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:24:32', '修改');
INSERT INTO `logs` VALUES (899, '购物车', '127.0.0.1', '钱钱钱', '2024-04-29 13:24:36', '新增');
INSERT INTO `logs` VALUES (900, '订单', '127.0.0.1', '钱钱钱', '2024-04-29 13:24:40', '新增');
INSERT INTO `logs` VALUES (901, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:43:40', '修改');
INSERT INTO `logs` VALUES (902, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:43:47', '修改');
INSERT INTO `logs` VALUES (903, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:43:49', '修改');
INSERT INTO `logs` VALUES (904, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:43:52', '修改');
INSERT INTO `logs` VALUES (905, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:47:52', '修改');
INSERT INTO `logs` VALUES (906, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:54:06', '修改');
INSERT INTO `logs` VALUES (907, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 13:54:50', '修改');
INSERT INTO `logs` VALUES (908, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 14:29:59', '修改');
INSERT INTO `logs` VALUES (909, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 14:31:02', '修改');
INSERT INTO `logs` VALUES (910, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 14:37:30', '修改');
INSERT INTO `logs` VALUES (911, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 14:44:23', '修改');
INSERT INTO `logs` VALUES (912, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 14:44:26', '修改');
INSERT INTO `logs` VALUES (913, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 14:46:55', '修改');
INSERT INTO `logs` VALUES (914, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 14:48:29', '修改');
INSERT INTO `logs` VALUES (915, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 14:48:47', '修改');
INSERT INTO `logs` VALUES (916, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 15:08:32', '修改');
INSERT INTO `logs` VALUES (917, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 15:08:36', '修改');
INSERT INTO `logs` VALUES (918, '订单管理', '127.0.0.1', '钱钱钱', '2024-04-29 15:08:40', '修改');
INSERT INTO `logs` VALUES (919, '用户登录', '127.0.0.1', '钱钱钱', '2024-04-29 15:09:17', '登录');
INSERT INTO `logs` VALUES (920, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:09:50', '修改');
INSERT INTO `logs` VALUES (921, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:10:15', '修改');
INSERT INTO `logs` VALUES (922, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:11:02', '修改');
INSERT INTO `logs` VALUES (923, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:11:29', '修改');
INSERT INTO `logs` VALUES (924, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:13:35', '修改');
INSERT INTO `logs` VALUES (925, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:13:52', '修改');
INSERT INTO `logs` VALUES (926, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:25:03', '删除');
INSERT INTO `logs` VALUES (927, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:26:48', '删除');
INSERT INTO `logs` VALUES (928, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:27:07', '删除');
INSERT INTO `logs` VALUES (929, '购物车', '127.0.0.1', '小明', '2024-04-29 15:28:10', '新增');
INSERT INTO `logs` VALUES (930, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:30:40', '删除');
INSERT INTO `logs` VALUES (931, '购物车', '127.0.0.1', '小明', '2024-04-29 15:35:21', '新增');
INSERT INTO `logs` VALUES (932, '订单', '127.0.0.1', '小明', '2024-04-29 15:35:26', '新增');
INSERT INTO `logs` VALUES (933, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:36:39', '删除');
INSERT INTO `logs` VALUES (934, '购物车', '127.0.0.1', '小明', '2024-04-29 15:36:44', '新增');
INSERT INTO `logs` VALUES (935, '订单', '127.0.0.1', '小明', '2024-04-29 15:36:49', '新增');
INSERT INTO `logs` VALUES (936, '购物车', '127.0.0.1', '小明', '2024-04-29 15:42:04', '新增');
INSERT INTO `logs` VALUES (937, '购物车', '127.0.0.1', '小明', '2024-04-29 15:42:14', '新增');
INSERT INTO `logs` VALUES (938, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:55:28', '删除');
INSERT INTO `logs` VALUES (939, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:55:29', '删除');
INSERT INTO `logs` VALUES (940, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:55:31', '删除');
INSERT INTO `logs` VALUES (941, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:55:33', '删除');
INSERT INTO `logs` VALUES (942, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:55:35', '删除');
INSERT INTO `logs` VALUES (943, '订单管理', '127.0.0.1', '小明', '2024-04-29 15:58:14', '删除');
INSERT INTO `logs` VALUES (944, '购物车', '127.0.0.1', '小明', '2024-04-29 15:58:23', '新增');
INSERT INTO `logs` VALUES (945, '订单', '127.0.0.1', '小明', '2024-04-29 15:58:33', '新增');
INSERT INTO `logs` VALUES (946, '订单管理', '127.0.0.1', '小明', '2024-04-29 16:17:30', '删除');
INSERT INTO `logs` VALUES (947, '购物车', '127.0.0.1', '小明', '2024-04-29 16:25:02', '新增');
INSERT INTO `logs` VALUES (948, '订单', '127.0.0.1', '小明', '2024-04-29 16:34:58', '新增');
INSERT INTO `logs` VALUES (949, '用户登录', '127.0.0.1', '小明', '2024-04-29 17:11:22', '登录');
INSERT INTO `logs` VALUES (950, '用户登录', '127.0.0.1', '小明', '2024-04-29 18:31:14', '登录');
INSERT INTO `logs` VALUES (951, '购物车', '127.0.0.1', '小明', '2024-04-29 18:38:35', '新增');
INSERT INTO `logs` VALUES (952, '订单', '127.0.0.1', '小明', '2024-04-29 18:38:44', '新增');
INSERT INTO `logs` VALUES (953, '购物车', '127.0.0.1', '小明', '2024-04-29 18:39:54', '新增');
INSERT INTO `logs` VALUES (954, '购物车', '127.0.0.1', '小明', '2024-04-29 18:39:58', '新增');
INSERT INTO `logs` VALUES (955, '购物车', '127.0.0.1', '小明', '2024-04-29 18:40:02', '新增');
INSERT INTO `logs` VALUES (956, '订单', '127.0.0.1', '小明', '2024-04-29 18:40:09', '新增');
INSERT INTO `logs` VALUES (957, '用户信息', '127.0.0.1', '小明', '2024-04-29 18:41:04', '修改');
INSERT INTO `logs` VALUES (958, '会员管理', '127.0.0.1', '小明', '2024-04-29 18:41:04', '修改');
INSERT INTO `logs` VALUES (959, '会员管理', '127.0.0.1', '小明', '2024-04-29 18:41:14', '修改');
INSERT INTO `logs` VALUES (960, '用户信息', '127.0.0.1', '小明', '2024-04-29 18:41:14', '修改');
INSERT INTO `logs` VALUES (961, '会员管理', '127.0.0.1', '小明', '2024-04-29 18:42:14', '修改');
INSERT INTO `logs` VALUES (962, '用户信息', '127.0.0.1', '小明', '2024-04-29 18:42:14', '修改');
INSERT INTO `logs` VALUES (963, '购物车', '127.0.0.1', '小明', '2024-04-29 18:44:08', '新增');
INSERT INTO `logs` VALUES (964, '会员管理', '127.0.0.1', '小明', '2024-04-29 18:49:17', '修改');
INSERT INTO `logs` VALUES (965, '用户信息', '127.0.0.1', '小明', '2024-04-29 18:49:17', '修改');
INSERT INTO `logs` VALUES (966, '会员管理', '127.0.0.1', '小明', '2024-04-29 18:49:35', '修改');
INSERT INTO `logs` VALUES (967, '用户信息', '127.0.0.1', '小明', '2024-04-29 18:49:35', '修改');
INSERT INTO `logs` VALUES (968, '用户信息', '127.0.0.1', '小明', '2024-04-29 18:54:51', '修改');
INSERT INTO `logs` VALUES (969, '会员管理', '127.0.0.1', '小明', '2024-04-29 18:54:51', '修改');
INSERT INTO `logs` VALUES (970, '用户登录', '127.0.0.1', 'a', '2024-04-29 18:56:09', '登录');
INSERT INTO `logs` VALUES (971, '咖啡管理', '127.0.0.1', 'a', '2024-04-29 18:57:08', '修改');
INSERT INTO `logs` VALUES (972, '用户登录', '127.0.0.1', 'a', '2024-04-29 22:41:38', '登录');
INSERT INTO `logs` VALUES (973, '咖啡管理', '127.0.0.1', 'a', '2024-04-29 22:43:08', '修改');
INSERT INTO `logs` VALUES (974, '用户登录', '127.0.0.1', 'a', '2024-04-30 11:56:49', '登录');
INSERT INTO `logs` VALUES (975, '用户登录', '127.0.0.1', 'a', '2024-04-30 13:57:13', '登录');
INSERT INTO `logs` VALUES (976, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 14:37:24', '修改');
INSERT INTO `logs` VALUES (977, '用户信息', '127.0.0.1', 'a', '2024-04-30 15:45:06', '修改');
INSERT INTO `logs` VALUES (978, '用户登录', '127.0.0.1', 'a', '2024-04-30 16:01:30', '登录');
INSERT INTO `logs` VALUES (979, '用户登录', '127.0.0.1', 'a', '2024-04-30 18:08:38', '登录');
INSERT INTO `logs` VALUES (980, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 18:50:56', '修改');
INSERT INTO `logs` VALUES (981, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 18:51:27', '修改');
INSERT INTO `logs` VALUES (982, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 19:29:48', '新增');
INSERT INTO `logs` VALUES (983, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 19:30:35', '删除');
INSERT INTO `logs` VALUES (984, '用户登录', '127.0.0.1', 'a', '2024-04-30 20:12:08', '登录');
INSERT INTO `logs` VALUES (985, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 20:25:52', '新增');
INSERT INTO `logs` VALUES (986, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 20:25:57', '新增');
INSERT INTO `logs` VALUES (987, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 20:26:00', '新增');
INSERT INTO `logs` VALUES (988, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 20:26:13', '新增');
INSERT INTO `logs` VALUES (989, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 21:46:26', '新增');
INSERT INTO `logs` VALUES (990, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 21:47:09', '新增');
INSERT INTO `logs` VALUES (991, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:00:53', '新增');
INSERT INTO `logs` VALUES (992, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:03:58', '修改');
INSERT INTO `logs` VALUES (993, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:04:21', '修改');
INSERT INTO `logs` VALUES (994, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:06:01', '新增');
INSERT INTO `logs` VALUES (995, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:07:08', '删除');
INSERT INTO `logs` VALUES (996, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:09:11', '新增');
INSERT INTO `logs` VALUES (997, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:11:08', '新增');
INSERT INTO `logs` VALUES (998, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:11:15', '删除');
INSERT INTO `logs` VALUES (999, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:11:18', '删除');
INSERT INTO `logs` VALUES (1000, '用户登录', '127.0.0.1', 'a', '2024-04-30 22:12:30', '登录');
INSERT INTO `logs` VALUES (1001, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:12:43', '新增');
INSERT INTO `logs` VALUES (1002, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:14:01', '删除');
INSERT INTO `logs` VALUES (1003, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:14:14', '新增');
INSERT INTO `logs` VALUES (1004, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:16:54', '删除');
INSERT INTO `logs` VALUES (1005, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:17:12', '新增');
INSERT INTO `logs` VALUES (1006, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:17:34', '修改');
INSERT INTO `logs` VALUES (1007, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:20:52', '新增');
INSERT INTO `logs` VALUES (1008, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:23:34', '新增');
INSERT INTO `logs` VALUES (1009, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:25:22', '新增');
INSERT INTO `logs` VALUES (1010, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:26:40', '新增');
INSERT INTO `logs` VALUES (1011, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 22:28:19', '新增');
INSERT INTO `logs` VALUES (1012, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:15:00', '新增');
INSERT INTO `logs` VALUES (1013, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:16:37', '新增');
INSERT INTO `logs` VALUES (1014, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:18:15', '新增');
INSERT INTO `logs` VALUES (1015, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:21:41', '新增');
INSERT INTO `logs` VALUES (1016, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:25:32', '删除');
INSERT INTO `logs` VALUES (1017, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:25:43', '批量删除');
INSERT INTO `logs` VALUES (1018, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:25:58', '修改');
INSERT INTO `logs` VALUES (1019, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:26:58', '新增');
INSERT INTO `logs` VALUES (1020, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:28:23', '删除');
INSERT INTO `logs` VALUES (1021, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:28:30', '新增');
INSERT INTO `logs` VALUES (1022, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:31:33', '新增');
INSERT INTO `logs` VALUES (1023, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:35:34', '新增');
INSERT INTO `logs` VALUES (1024, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:35:41', '删除');
INSERT INTO `logs` VALUES (1025, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:35:43', '删除');
INSERT INTO `logs` VALUES (1026, '咖啡管理', '127.0.0.1', 'a', '2024-04-30 23:35:45', '删除');
INSERT INTO `logs` VALUES (1027, '用户登录', '127.0.0.1', 'a', '2024-05-01 12:58:05', '登录');
INSERT INTO `logs` VALUES (1028, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 12:58:49', '修改');
INSERT INTO `logs` VALUES (1029, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 12:59:04', '修改');
INSERT INTO `logs` VALUES (1030, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 13:00:30', '修改');
INSERT INTO `logs` VALUES (1031, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 13:11:30', '修改');
INSERT INTO `logs` VALUES (1032, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 13:21:45', '修改');
INSERT INTO `logs` VALUES (1033, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 13:21:57', '修改');
INSERT INTO `logs` VALUES (1034, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 13:22:21', '修改');
INSERT INTO `logs` VALUES (1035, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 13:22:30', '修改');
INSERT INTO `logs` VALUES (1036, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 13:22:44', '修改');
INSERT INTO `logs` VALUES (1037, '咖啡管理', '127.0.0.1', 'a', '2024-05-01 13:24:09', '新增');
INSERT INTO `logs` VALUES (1038, '用户登录', '127.0.0.1', '小明', '2024-05-01 14:23:39', '登录');
INSERT INTO `logs` VALUES (1039, '购物车', '127.0.0.1', '小明', '2024-05-01 14:23:53', '新增');
INSERT INTO `logs` VALUES (1040, '订单', '127.0.0.1', '小明', '2024-05-01 14:24:03', '新增');
INSERT INTO `logs` VALUES (1041, '用户信息', '127.0.0.1', '小明', '2024-05-01 14:26:56', '修改');
INSERT INTO `logs` VALUES (1042, '会员管理', '127.0.0.1', '小明', '2024-05-01 14:26:56', '修改');
INSERT INTO `logs` VALUES (1043, '用户信息', '127.0.0.1', '小明', '2024-05-01 14:27:14', '修改');
INSERT INTO `logs` VALUES (1044, '会员管理', '127.0.0.1', '小明', '2024-05-01 14:27:14', '修改');
INSERT INTO `logs` VALUES (1045, '会员管理', '127.0.0.1', '小明', '2024-05-01 14:29:52', '修改');
INSERT INTO `logs` VALUES (1046, '用户信息', '127.0.0.1', '小明', '2024-05-01 14:29:52', '修改');
INSERT INTO `logs` VALUES (1047, '会员管理', '127.0.0.1', '小明', '2024-05-01 14:31:09', '修改');
INSERT INTO `logs` VALUES (1048, '用户信息', '127.0.0.1', '小明', '2024-05-01 14:31:09', '修改');
INSERT INTO `logs` VALUES (1049, '用户信息', '127.0.0.1', '小明', '2024-05-01 14:33:43', '修改');
INSERT INTO `logs` VALUES (1050, '会员管理', '127.0.0.1', '小明', '2024-05-01 14:33:43', '修改');
INSERT INTO `logs` VALUES (1051, '用户信息', '127.0.0.1', '小明', '2024-05-01 14:35:37', '修改');
INSERT INTO `logs` VALUES (1052, '会员管理', '127.0.0.1', '小明', '2024-05-01 14:35:37', '修改');
INSERT INTO `logs` VALUES (1053, '用户信息', '127.0.0.1', '小明', '2024-05-01 14:36:36', '修改');
INSERT INTO `logs` VALUES (1054, '会员管理', '127.0.0.1', '小明', '2024-05-01 14:36:36', '修改');
INSERT INTO `logs` VALUES (1055, '用户登录', '127.0.0.1', '钱钱钱', '2024-05-02 18:39:04', '登录');
INSERT INTO `logs` VALUES (1056, '用户登录', '127.0.0.1', '钱钱钱', '2024-05-02 23:25:18', '登录');
INSERT INTO `logs` VALUES (1057, '购物车', '127.0.0.1', '钱钱钱', '2024-05-02 23:39:23', '新增');
INSERT INTO `logs` VALUES (1058, '购物车', '127.0.0.1', '钱钱钱', '2024-05-02 23:39:29', '新增');
INSERT INTO `logs` VALUES (1059, '购物车', '127.0.0.1', '钱钱钱', '2024-05-02 23:39:33', '新增');
INSERT INTO `logs` VALUES (1060, '订单', '127.0.0.1', '钱钱钱', '2024-05-02 23:39:38', '新增');
INSERT INTO `logs` VALUES (1061, '用户登录', '127.0.0.1', '小明', '2024-05-02 23:39:57', '登录');
INSERT INTO `logs` VALUES (1062, '用户登录', '127.0.0.1', '钱钱钱', '2024-05-02 23:40:28', '登录');
INSERT INTO `logs` VALUES (1063, '用户登录', '127.0.0.1', '钱钱钱', '2024-05-03 23:14:42', '登录');
INSERT INTO `logs` VALUES (1064, '用户登录', '127.0.0.1', '小明', '2024-05-03 23:16:06', '登录');
INSERT INTO `logs` VALUES (1065, '用户登录', '127.0.0.1', 'a', '2024-05-03 23:17:23', '登录');
INSERT INTO `logs` VALUES (1066, '购物车', '127.0.0.1', '钱钱钱', '2024-05-03 23:43:29', '新增');
INSERT INTO `logs` VALUES (1067, '购物车', '127.0.0.1', '钱钱钱', '2024-05-03 23:43:34', '新增');
INSERT INTO `logs` VALUES (1068, '订单', '127.0.0.1', '钱钱钱', '2024-05-03 23:43:38', '新增');
INSERT INTO `logs` VALUES (1069, '订单', '127.0.0.1', '钱钱钱', '2024-05-03 23:43:41', '新增');
INSERT INTO `logs` VALUES (1070, '购物车', '127.0.0.1', '小明', '2024-05-03 23:47:59', '新增');
INSERT INTO `logs` VALUES (1071, '购物车', '127.0.0.1', '小明', '2024-05-03 23:48:29', '新增');
INSERT INTO `logs` VALUES (1072, '订单管理', '127.0.0.1', '小明', '2024-05-03 23:50:27', '删除');
INSERT INTO `logs` VALUES (1073, '订单管理', '127.0.0.1', '小明', '2024-05-03 23:50:57', '删除');
INSERT INTO `logs` VALUES (1074, '订单管理', '127.0.0.1', '小明', '2024-05-03 23:51:03', '删除');
INSERT INTO `logs` VALUES (1075, '购物车', '127.0.0.1', '钱钱钱', '2024-05-03 23:51:34', '新增');
INSERT INTO `logs` VALUES (1076, '订单', '127.0.0.1', '钱钱钱', '2024-05-03 23:51:40', '新增');
INSERT INTO `logs` VALUES (1077, '订单管理', '127.0.0.1', '钱钱钱', '2024-05-03 23:58:48', '删除');
INSERT INTO `logs` VALUES (1078, '订单管理', '127.0.0.1', '钱钱钱', '2024-05-03 23:58:51', '删除');
INSERT INTO `logs` VALUES (1079, '订单管理', '127.0.0.1', '钱钱钱', '2024-05-03 23:58:53', '删除');
INSERT INTO `logs` VALUES (1080, '订单管理', '127.0.0.1', '钱钱钱', '2024-05-03 23:58:54', '删除');
INSERT INTO `logs` VALUES (1081, '订单管理', '127.0.0.1', '小明', '2024-05-03 23:59:03', '删除');
INSERT INTO `logs` VALUES (1082, '订单管理', '127.0.0.1', '小明', '2024-05-03 23:59:05', '删除');
INSERT INTO `logs` VALUES (1083, '用户登录', '127.0.0.1', '小明', '2024-05-04 17:35:42', '登录');
INSERT INTO `logs` VALUES (1084, '用户登录', '127.0.0.1', '钱钱钱', '2024-05-04 17:36:23', '登录');
INSERT INTO `logs` VALUES (1085, '订单管理', '127.0.0.1', '钱钱钱', '2024-05-04 17:40:51', '删除');
INSERT INTO `logs` VALUES (1086, '购物车', '127.0.0.1', '钱钱钱', '2024-05-04 17:41:17', '新增');
INSERT INTO `logs` VALUES (1087, '订单', '127.0.0.1', '钱钱钱', '2024-05-04 17:41:42', '新增');
INSERT INTO `logs` VALUES (1088, '用户登录', '127.0.0.1', '小明', '2024-05-04 19:40:08', '登录');
INSERT INTO `logs` VALUES (1089, '用户登录', '127.0.0.1', '钱钱钱', '2024-05-04 19:45:46', '登录');
INSERT INTO `logs` VALUES (1090, '用户登录', '127.0.0.1', '小明', '2024-05-04 21:47:09', '登录');
INSERT INTO `logs` VALUES (1091, '订单', '127.0.0.1', '小明', '2024-05-04 21:48:08', '新增');
INSERT INTO `logs` VALUES (1092, '订单管理', '127.0.0.1', '小明', '2024-05-04 22:02:40', '修改');
INSERT INTO `logs` VALUES (1093, '订单', '127.0.0.1', '小明', '2024-05-04 22:08:03', '新增');
INSERT INTO `logs` VALUES (1094, '订单管理', '127.0.0.1', '小明', '2024-05-04 22:08:35', '修改');
INSERT INTO `logs` VALUES (1095, '用户登录', '127.0.0.1', '小明', '2024-05-08 12:42:00', '登录');
INSERT INTO `logs` VALUES (1096, '会员管理', '127.0.0.1', '小明', '2024-05-08 12:42:08', '修改');
INSERT INTO `logs` VALUES (1097, '用户信息', '127.0.0.1', '小明', '2024-05-08 12:42:08', '修改');
INSERT INTO `logs` VALUES (1098, '用户信息', '127.0.0.1', '小明', '2024-05-08 13:23:03', '修改');
INSERT INTO `logs` VALUES (1099, '会员管理', '127.0.0.1', '小明', '2024-05-08 13:23:03', '修改');
INSERT INTO `logs` VALUES (1100, '会员管理', '127.0.0.1', '小明', '2024-05-08 13:26:13', '修改');
INSERT INTO `logs` VALUES (1101, '用户信息', '127.0.0.1', '小明', '2024-05-08 13:26:13', '修改');
INSERT INTO `logs` VALUES (1102, '会员管理', '127.0.0.1', '小明', '2024-05-08 13:28:30', '修改');
INSERT INTO `logs` VALUES (1103, '用户信息', '127.0.0.1', '小明', '2024-05-08 13:28:30', '修改');
INSERT INTO `logs` VALUES (1104, '会员管理', '127.0.0.1', '小明', '2024-05-08 13:29:51', '修改');
INSERT INTO `logs` VALUES (1105, '用户信息', '127.0.0.1', '小明', '2024-05-08 13:29:51', '修改');
INSERT INTO `logs` VALUES (1106, '会员管理', '127.0.0.1', '小明', '2024-05-08 13:32:02', '修改');
INSERT INTO `logs` VALUES (1107, '用户信息', '127.0.0.1', '小明', '2024-05-08 13:32:02', '修改');
INSERT INTO `logs` VALUES (1108, '会员管理', '127.0.0.1', '小明', '2024-05-08 13:32:38', '修改');
INSERT INTO `logs` VALUES (1109, '用户信息', '127.0.0.1', '小明', '2024-05-08 13:32:38', '修改');
INSERT INTO `logs` VALUES (1110, '用户信息', '127.0.0.1', '小明', '2024-05-08 13:36:19', '修改');
INSERT INTO `logs` VALUES (1111, '会员管理', '127.0.0.1', '小明', '2024-05-08 13:36:19', '修改');
INSERT INTO `logs` VALUES (1112, '用户登录', '127.0.0.1', '小明', '2024-05-10 15:37:47', '登录');
INSERT INTO `logs` VALUES (1113, '购物车', '127.0.0.1', '小明', '2024-05-10 16:08:56', '新增');
INSERT INTO `logs` VALUES (1114, '购物车', '127.0.0.1', '小明', '2024-05-10 16:09:58', '新增');
INSERT INTO `logs` VALUES (1115, '订单管理', '127.0.0.1', '小明', '2024-05-10 16:15:45', '删除');
INSERT INTO `logs` VALUES (1116, '订单管理', '127.0.0.1', '小明', '2024-05-10 16:15:47', '删除');
INSERT INTO `logs` VALUES (1117, '订单管理', '127.0.0.1', '小明', '2024-05-10 16:15:49', '删除');
INSERT INTO `logs` VALUES (1118, '订单', '127.0.0.1', '小明', '2024-05-10 16:19:07', '新增');
INSERT INTO `logs` VALUES (1119, '订单管理', '127.0.0.1', '小明', '2024-05-10 16:20:40', '删除');
INSERT INTO `logs` VALUES (1120, '订单管理', '127.0.0.1', '小明', '2024-05-10 16:20:42', '删除');
INSERT INTO `logs` VALUES (1121, '用户登录', '127.0.0.1', '小明', '2024-05-13 22:46:27', '登录');
INSERT INTO `logs` VALUES (1122, '订单管理', '127.0.0.1', '小明', '2024-05-13 22:47:54', '修改');
INSERT INTO `logs` VALUES (1123, '购物车', '127.0.0.1', '小明', '2024-05-13 23:20:12', '新增');
INSERT INTO `logs` VALUES (1124, '订单', '127.0.0.1', '小明', '2024-05-13 23:20:16', '新增');
INSERT INTO `logs` VALUES (1125, '订单管理', '127.0.0.1', '小明', '2024-05-13 23:25:17', '修改');
INSERT INTO `logs` VALUES (1126, '购物车', '127.0.0.1', '小明', '2024-05-13 23:26:50', '新增');
INSERT INTO `logs` VALUES (1127, '订单', '127.0.0.1', '小明', '2024-05-13 23:26:54', '新增');
INSERT INTO `logs` VALUES (1128, '订单管理', '127.0.0.1', '小明', '2024-05-13 23:27:36', '修改');
INSERT INTO `logs` VALUES (1129, '购物车', '127.0.0.1', '小明', '2024-05-13 23:31:44', '新增');
INSERT INTO `logs` VALUES (1130, '订单', '127.0.0.1', '小明', '2024-05-13 23:31:47', '新增');
INSERT INTO `logs` VALUES (1131, '订单管理', '127.0.0.1', '小明', '2024-05-13 23:31:52', '修改');
INSERT INTO `logs` VALUES (1132, '订单管理', '127.0.0.1', '小明', '2024-05-13 23:32:09', '删除');
INSERT INTO `logs` VALUES (1133, '订单管理', '127.0.0.1', '小明', '2024-05-13 23:32:11', '删除');
INSERT INTO `logs` VALUES (1134, '用户登录', '127.0.0.1', '小明', '2024-05-14 14:30:58', '登录');
INSERT INTO `logs` VALUES (1135, '购物车', '127.0.0.1', '小明', '2024-05-14 15:32:24', '新增');
INSERT INTO `logs` VALUES (1136, '订单管理', '127.0.0.1', '小明', '2024-05-14 15:32:55', '删除');
INSERT INTO `logs` VALUES (1137, '用户登录', '127.0.0.1', '小明', '2024-05-14 16:58:45', '登录');
INSERT INTO `logs` VALUES (1138, '购物车', '127.0.0.1', '小明', '2024-05-14 17:00:16', '新增');
INSERT INTO `logs` VALUES (1139, '用户登录', '127.0.0.1', '小明', '2024-05-14 22:48:32', '登录');
INSERT INTO `logs` VALUES (1140, '会员管理', '127.0.0.1', '小明', '2024-05-14 23:00:44', '修改');
INSERT INTO `logs` VALUES (1141, '用户信息', '127.0.0.1', '小明', '2024-05-14 23:00:44', '修改');
INSERT INTO `logs` VALUES (1142, '会员管理', '127.0.0.1', '小明', '2024-05-14 23:04:52', '修改');
INSERT INTO `logs` VALUES (1143, '用户信息', '127.0.0.1', '小明', '2024-05-14 23:04:52', '修改');
INSERT INTO `logs` VALUES (1144, '用户信息', '127.0.0.1', '小明', '2024-05-14 23:06:37', '修改');
INSERT INTO `logs` VALUES (1145, '会员管理', '127.0.0.1', '小明', '2024-05-14 23:06:37', '修改');
INSERT INTO `logs` VALUES (1146, '会员管理', '127.0.0.1', '小明', '2024-05-14 23:17:37', '修改');
INSERT INTO `logs` VALUES (1147, '用户信息', '127.0.0.1', '小明', '2024-05-14 23:17:37', '修改');
INSERT INTO `logs` VALUES (1148, '用户信息', '127.0.0.1', '小明', '2024-05-14 23:18:32', '修改');
INSERT INTO `logs` VALUES (1149, '会员管理', '127.0.0.1', '小明', '2024-05-14 23:18:32', '修改');
INSERT INTO `logs` VALUES (1150, '会员管理', '127.0.0.1', '小明', '2024-05-14 23:18:47', '修改');
INSERT INTO `logs` VALUES (1151, '用户信息', '127.0.0.1', '小明', '2024-05-14 23:18:47', '修改');
INSERT INTO `logs` VALUES (1152, '用户登录', '127.0.0.1', '小明', '2024-05-20 20:53:19', '登录');
INSERT INTO `logs` VALUES (1153, '用户登录', '127.0.0.1', '钱钱钱', '2024-05-20 21:14:51', '登录');
INSERT INTO `logs` VALUES (1154, '删除评论', '127.0.0.1', 'a', '2024-05-20 22:02:38', '删除');
INSERT INTO `logs` VALUES (1155, '删除评论', '127.0.0.1', 'a', '2024-05-20 22:02:58', '删除');
INSERT INTO `logs` VALUES (1156, '删除评论', '127.0.0.1', 'a', '2024-05-20 22:03:04', '删除');
INSERT INTO `logs` VALUES (1157, '删除评论', '127.0.0.1', 'a', '2024-05-20 22:03:07', '删除');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '咖啡名称',
  `eachffid` int(11) NULL DEFAULT NULL COMMENT '咖啡分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '商品码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '图片',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '介绍',
  `userid` int(11) NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '1:起售 0：停售',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (18, ',冒泡咖啡', 4, 118.80, NULL, 'http://localhost:8080/file/download/1703228332945_test5.png', '会冒泡，喝了能跑一百公里', 1, '2023-12-22 14:59:14', 0);
INSERT INTO `manager` VALUES (19, '巧克力咖啡', 26, 162.00, NULL, 'http://localhost:8080/file/download/1703228367752_test3.png', '百分之99巧克力', 1, '2023-12-22 14:59:51', 0);
INSERT INTO `manager` VALUES (20, '热咖啡', 27, 59.40, NULL, 'http://localhost:8080/file/download/1703228401957_coffee3.png', '好喝，包的', 1, '2023-12-22 15:00:11', 1);
INSERT INTO `manager` VALUES (21, '热奶茶', 28, 11.80, NULL, 'http://localhost:8080/file/download/coffee1.png', '我嘞个豆，无敌了', 1, '2023-12-22 15:33:21', 0);
INSERT INTO `manager` VALUES (22, '分分咖啡', 27, 11.00, NULL, 'http://localhost:8080/file/download/coffee2.png', '非常好喝', 1, '2023-12-22 21:33:39', 1);
INSERT INTO `manager` VALUES (23, '吸奶茶', 28, 0.54, NULL, 'http://localhost:8080/file/download/test1.png', '赞', 1, '2023-12-23 18:20:31', 1);
INSERT INTO `manager` VALUES (24, '嘻嘻', 28, 106.92, NULL, 'http://localhost:8080/file/download/1714459039287_咖啡3.png', '嘻嘻嘻嘻嘻嘻', 12, '2024-04-27 19:17:29', 1);
INSERT INTO `manager` VALUES (25, '卡卡卡', 28, 32.00, NULL, 'http://localhost:8080/file/download/1714540990972_咖啡.png', '7分咖啡2分奶茶1分茶', 12, '2024-05-01 13:24:09', 1);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `open` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (10, '新品上市', '嘻嘻哈哈咖啡即将于5月6日上线，前一百名免费品尝，先到先得，欢迎大家光临！', '2024-04-25 19:13:44', '12', 1);

-- ----------------------------
-- Table structure for porder
-- ----------------------------
DROP TABLE IF EXISTS `porder`;
CREATE TABLE `porder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '名称',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '编号',
  `totalprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '待付款' COMMENT '状态  ',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '待付款' COMMENT '下单时间',
  `paytime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '付款时间',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `managerid` int(11) NULL DEFAULT NULL,
  `specsname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `temp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of porder
-- ----------------------------
INSERT INTO `porder` VALUES (1, '巧克力咖啡', '202405041714815702565', 162.00, '待付款', '2024-05-04 17:41:42', NULL, 10, 19, NULL, NULL);
INSERT INTO `porder` VALUES (4, '热奶茶', '202405101715329147900', 10.62, '已付款', '2024-05-10 16:19:07', NULL, 11, 21, '中杯', '暖');
INSERT INTO `porder` VALUES (7, ',冒泡咖啡', '202405131715614307142', 106.92, '已付款', '2024-05-13 23:31:47', NULL, 11, 18, '大杯', '冰');

-- ----------------------------
-- Table structure for porder_manager
-- ----------------------------
DROP TABLE IF EXISTS `porder_manager`;
CREATE TABLE `porder_manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `managerid` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of porder_manager
-- ----------------------------
INSERT INTO `porder_manager` VALUES (30, 32, 24, 1);
INSERT INTO `porder_manager` VALUES (31, 33, 22, 1);
INSERT INTO `porder_manager` VALUES (32, 34, 18, 1);
INSERT INTO `porder_manager` VALUES (33, 35, 25, 1);
INSERT INTO `porder_manager` VALUES (34, 36, 22, 1);
INSERT INTO `porder_manager` VALUES (35, 37, 18, 1);
INSERT INTO `porder_manager` VALUES (36, 38, 21, 1);
INSERT INTO `porder_manager` VALUES (37, 39, 20, 2);
INSERT INTO `porder_manager` VALUES (38, 1, 19, 1);
INSERT INTO `porder_manager` VALUES (39, 2, 25, 1);
INSERT INTO `porder_manager` VALUES (40, 3, 19, 1);
INSERT INTO `porder_manager` VALUES (41, 4, 21, 1);
INSERT INTO `porder_manager` VALUES (42, 5, 19, 1);
INSERT INTO `porder_manager` VALUES (43, 6, 24, 1);
INSERT INTO `porder_manager` VALUES (44, 7, 18, 1);

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs`  (
  `managerid` int(11) NULL DEFAULT NULL COMMENT '咖啡',
  `specsname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '大小',
  `temp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL COMMENT '温度',
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of specs
-- ----------------------------
INSERT INTO `specs` VALUES (22, '大杯', '热', '1');
INSERT INTO `specs` VALUES (20, '小杯', '冰', '10');
INSERT INTO `specs` VALUES (21, '中杯', '冰', '11');
INSERT INTO `specs` VALUES (21, '小杯', '暖', '12');
INSERT INTO `specs` VALUES (23, '中杯', '冰', '13');
INSERT INTO `specs` VALUES (23, '小杯', '暖', '14');
INSERT INTO `specs` VALUES (24, '小杯', '冰', '15');
INSERT INTO `specs` VALUES (24, '中杯', '暖', '16');
INSERT INTO `specs` VALUES (22, '中杯', '冰', '2');
INSERT INTO `specs` VALUES (22, '小杯', '暖', '3');
INSERT INTO `specs` VALUES (18, '大杯', '暖', '4');
INSERT INTO `specs` VALUES (18, '中杯', '冰', '5');
INSERT INTO `specs` VALUES (19, '大杯', '暖', '6');
INSERT INTO `specs` VALUES (19, '中杯', '冰', '7');
INSERT INTO `specs` VALUES (20, '大杯', '热', '8');
INSERT INTO `specs` VALUES (20, '中杯', '暖', '9');
INSERT INTO `specs` VALUES (25, '小杯', '冰', '91c64d7d-a3b9-40e9-b653-de7e8c431e11');
INSERT INTO `specs` VALUES (25, '中杯', '暖', 'eba704cd-0a93-4f65-ad99-6b41d51de56a');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `open` tinyint(1) NULL DEFAULT 1 COMMENT '1 vip   0 不是vip',
  `vipfid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `vipname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (8, 'CC', '123', '1', 'http://localhost:8080/file/download/1702978028976_t03acbe70c929da2824.jpg', '用户', '1', NULL, 1, '', '', NULL, '2', '2024-04-26 23:40:59');
INSERT INTO `user` VALUES (10, '钱钱钱', '123', '钱钱钱', 'http://localhost:8080/file/download/1703228203315_me.png', '用户', '1', '1', 0, 'b', '黄金会员', NULL, '南京路', NULL);
INSERT INTO `user` VALUES (11, '小明', '123', '维生素', 'http://localhost:8080/file/download/1713026223521_me-active.png', '用户', '1', '1', 0, 'a', '白银会员', NULL, '1', NULL);
INSERT INTO `user` VALUES (12, 'a', '111', 'aa', 'http://localhost:8080/file/download/1.jpg', '管理员', NULL, '980214813', 1, NULL, NULL, '男', '河北科技师范学院', NULL);

SET FOREIGN_KEY_CHECKS = 1;
