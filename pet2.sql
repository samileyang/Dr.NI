/*
 Navicat Premium Data Transfer

 Source Server         : 57
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : pet2

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 09/01/2019 14:47:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add cage', 7, 'add_cage');
INSERT INTO `auth_permission` VALUES (26, 'Can change cage', 7, 'change_cage');
INSERT INTO `auth_permission` VALUES (27, 'Can delete cage', 7, 'delete_cage');
INSERT INTO `auth_permission` VALUES (28, 'Can view cage', 7, 'view_cage');
INSERT INTO `auth_permission` VALUES (29, 'Can add credit order', 8, 'add_creditorder');
INSERT INTO `auth_permission` VALUES (30, 'Can change credit order', 8, 'change_creditorder');
INSERT INTO `auth_permission` VALUES (31, 'Can delete credit order', 8, 'delete_creditorder');
INSERT INTO `auth_permission` VALUES (32, 'Can view credit order', 8, 'view_creditorder');
INSERT INTO `auth_permission` VALUES (33, 'Can add emp info', 9, 'add_empinfo');
INSERT INTO `auth_permission` VALUES (34, 'Can change emp info', 9, 'change_empinfo');
INSERT INTO `auth_permission` VALUES (35, 'Can delete emp info', 9, 'delete_empinfo');
INSERT INTO `auth_permission` VALUES (36, 'Can view emp info', 9, 'view_empinfo');
INSERT INTO `auth_permission` VALUES (37, 'Can add foster order', 10, 'add_fosterorder');
INSERT INTO `auth_permission` VALUES (38, 'Can change foster order', 10, 'change_fosterorder');
INSERT INTO `auth_permission` VALUES (39, 'Can delete foster order', 10, 'delete_fosterorder');
INSERT INTO `auth_permission` VALUES (40, 'Can view foster order', 10, 'view_fosterorder');
INSERT INTO `auth_permission` VALUES (41, 'Can add inventory', 11, 'add_inventory');
INSERT INTO `auth_permission` VALUES (42, 'Can change inventory', 11, 'change_inventory');
INSERT INTO `auth_permission` VALUES (43, 'Can delete inventory', 11, 'delete_inventory');
INSERT INTO `auth_permission` VALUES (44, 'Can view inventory', 11, 'view_inventory');
INSERT INTO `auth_permission` VALUES (45, 'Can add member', 12, 'add_member');
INSERT INTO `auth_permission` VALUES (46, 'Can change member', 12, 'change_member');
INSERT INTO `auth_permission` VALUES (47, 'Can delete member', 12, 'delete_member');
INSERT INTO `auth_permission` VALUES (48, 'Can view member', 12, 'view_member');
INSERT INTO `auth_permission` VALUES (49, 'Can add member pet', 13, 'add_memberpet');
INSERT INTO `auth_permission` VALUES (50, 'Can change member pet', 13, 'change_memberpet');
INSERT INTO `auth_permission` VALUES (51, 'Can delete member pet', 13, 'delete_memberpet');
INSERT INTO `auth_permission` VALUES (52, 'Can view member pet', 13, 'view_memberpet');
INSERT INTO `auth_permission` VALUES (53, 'Can add salary order', 14, 'add_salaryorder');
INSERT INTO `auth_permission` VALUES (54, 'Can change salary order', 14, 'change_salaryorder');
INSERT INTO `auth_permission` VALUES (55, 'Can delete salary order', 14, 'delete_salaryorder');
INSERT INTO `auth_permission` VALUES (56, 'Can view salary order', 14, 'view_salaryorder');
INSERT INTO `auth_permission` VALUES (57, 'Can add service reservation', 15, 'add_servicereservation');
INSERT INTO `auth_permission` VALUES (58, 'Can change service reservation', 15, 'change_servicereservation');
INSERT INTO `auth_permission` VALUES (59, 'Can delete service reservation', 15, 'delete_servicereservation');
INSERT INTO `auth_permission` VALUES (60, 'Can view service reservation', 15, 'view_servicereservation');
INSERT INTO `auth_permission` VALUES (61, 'Can add service type', 16, 'add_servicetype');
INSERT INTO `auth_permission` VALUES (62, 'Can change service type', 16, 'change_servicetype');
INSERT INTO `auth_permission` VALUES (63, 'Can delete service type', 16, 'delete_servicetype');
INSERT INTO `auth_permission` VALUES (64, 'Can view service type', 16, 'view_servicetype');
INSERT INTO `auth_permission` VALUES (65, 'Can add stock order', 17, 'add_stockorder');
INSERT INTO `auth_permission` VALUES (66, 'Can change stock order', 17, 'change_stockorder');
INSERT INTO `auth_permission` VALUES (67, 'Can delete stock order', 17, 'delete_stockorder');
INSERT INTO `auth_permission` VALUES (68, 'Can view stock order', 17, 'view_stockorder');
INSERT INTO `auth_permission` VALUES (69, 'Can add django session', 18, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (70, 'Can change django session', 18, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (71, 'Can delete django session', 18, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (72, 'Can view django session', 18, 'view_djangosession');
INSERT INTO `auth_permission` VALUES (73, 'Can add emp_ performance', 19, 'add_emp_performance');
INSERT INTO `auth_permission` VALUES (74, 'Can change emp_ performance', 19, 'change_emp_performance');
INSERT INTO `auth_permission` VALUES (75, 'Can delete emp_ performance', 19, 'delete_emp_performance');
INSERT INTO `auth_permission` VALUES (76, 'Can view emp_ performance', 19, 'view_emp_performance');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cage
-- ----------------------------
DROP TABLE IF EXISTS `cage`;
CREATE TABLE `cage`  (
  `cage_num` int(11) NOT NULL,
  `status` tinyint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`cage_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cage
-- ----------------------------
INSERT INTO `cage` VALUES (1, 1);
INSERT INTO `cage` VALUES (2, 0);
INSERT INTO `cage` VALUES (3, 1);

-- ----------------------------
-- Table structure for credit_order
-- ----------------------------
DROP TABLE IF EXISTS `credit_order`;
CREATE TABLE `credit_order`  (
  `order_num` int(11) NOT NULL,
  `date` datetime(6) NULL DEFAULT NULL,
  `point` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `mem_num` int(11) NULL DEFAULT NULL,
  `product_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`order_num`) USING BTREE,
  INDEX `credit_order_mem_num_dac74be3_fk_member_mem_num`(`mem_num`) USING BTREE,
  INDEX `credit_order_product_num_9ede77ef_fk_inventory_product_num`(`product_num`) USING BTREE,
  CONSTRAINT `credit_order_ibfk_1` FOREIGN KEY (`mem_num`) REFERENCES `member` (`mem_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `credit_order_product_num_9ede77ef_fk_inventory_product_num` FOREIGN KEY (`product_num`) REFERENCES `inventory` (`product_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of credit_order
-- ----------------------------
INSERT INTO `credit_order` VALUES (1, '2019-01-16 21:13:26.000000', 1, 1, 10, 1);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'cmdb', 'cage');
INSERT INTO `django_content_type` VALUES (8, 'cmdb', 'creditorder');
INSERT INTO `django_content_type` VALUES (18, 'cmdb', 'djangosession');
INSERT INTO `django_content_type` VALUES (9, 'cmdb', 'empinfo');
INSERT INTO `django_content_type` VALUES (19, 'cmdb', 'emp_performance');
INSERT INTO `django_content_type` VALUES (10, 'cmdb', 'fosterorder');
INSERT INTO `django_content_type` VALUES (11, 'cmdb', 'inventory');
INSERT INTO `django_content_type` VALUES (12, 'cmdb', 'member');
INSERT INTO `django_content_type` VALUES (13, 'cmdb', 'memberpet');
INSERT INTO `django_content_type` VALUES (14, 'cmdb', 'salaryorder');
INSERT INTO `django_content_type` VALUES (15, 'cmdb', 'servicereservation');
INSERT INTO `django_content_type` VALUES (16, 'cmdb', 'servicetype');
INSERT INTO `django_content_type` VALUES (17, 'cmdb', 'stockorder');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-12-31 08:45:36.975963');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2018-12-31 08:45:48.795381');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-12-31 08:45:51.015975');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-12-31 08:45:51.086697');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2018-12-31 08:45:51.157079');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2018-12-31 08:45:52.880994');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2018-12-31 08:45:54.445442');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2018-12-31 08:45:55.716607');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2018-12-31 08:45:55.783788');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2018-12-31 08:45:56.466919');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2018-12-31 08:45:56.540213');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2018-12-31 08:45:56.625770');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2018-12-31 08:45:57.449930');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2018-12-31 08:45:58.453617');
INSERT INTO `django_migrations` VALUES (15, 'cmdb', '0001_initial', '2018-12-31 08:46:27.752206');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2018-12-31 08:46:28.496184');
INSERT INTO `django_migrations` VALUES (17, 'cmdb', '0002_auto_20181231_2118', '2018-12-31 13:19:02.315485');
INSERT INTO `django_migrations` VALUES (18, 'cmdb', '0003_auto_20181231_2227', '2018-12-31 14:27:57.671578');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('t702iullwxvid8dg2qs6ze1bwc6t81rf', 'ZGEzZTU1M2M3ODllNjUyMTVhYWRkMWU1ZmU4NjQxMTZjY2RhNWZkZTp7InVzZXJfbmFtZSI6InRlc3QifQ==', '2019-01-22 03:30:54.987287');

-- ----------------------------
-- Table structure for emp_info
-- ----------------------------
DROP TABLE IF EXISTS `emp_info`;
CREATE TABLE `emp_info`  (
  `emp_num` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salary_time` int(11) NULL DEFAULT NULL,
  `salary_basic` int(11) NULL DEFAULT NULL,
  `last_paid_time` date NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_num` int(11) NULL DEFAULT NULL,
  `mem_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`emp_num`) USING BTREE,
  INDEX `emp_info_service_num_3489caee_fk_service_type_service_num`(`service_num`) USING BTREE,
  CONSTRAINT `emp_info_ibfk_1` FOREIGN KEY (`service_num`) REFERENCES `service_type` (`service_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp_info
-- ----------------------------
INSERT INTO `emp_info` VALUES (1, 'xxc', '123456', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `emp_info` VALUES (2, 'xxc2', '123456', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `emp_info` VALUES (3, 'xxc3', NULL, NULL, NULL, NULL, '打杂', NULL, NULL);

-- ----------------------------
-- Table structure for emp_performance
-- ----------------------------
DROP TABLE IF EXISTS `emp_performance`;
CREATE TABLE `emp_performance`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `emp_num` int(255) NULL DEFAULT NULL,
  `res_num` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `satisfaction` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `salary` int(10) NULL DEFAULT NULL,
  `salary_time` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `emp_num_id` int(25) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Emp_Performance`(`emp_num`) USING BTREE,
  CONSTRAINT `Emp_Performance` FOREIGN KEY (`emp_num`) REFERENCES `emp_info` (`emp_num`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for foster_order
-- ----------------------------
DROP TABLE IF EXISTS `foster_order`;
CREATE TABLE `foster_order`  (
  `foster_num` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` date NULL DEFAULT NULL,
  `endtime` date NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `cage_num` int(11) NULL DEFAULT NULL,
  `pet_num` int(11) NULL DEFAULT NULL,
  `product_num` int(11) NULL DEFAULT NULL,
  `mem_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`foster_num`) USING BTREE,
  INDEX `foster_order_cage_num_ae9d7d0c_fk_cage_cage_num`(`cage_num`) USING BTREE,
  INDEX `foster_order_pet_num_ece563f2_fk_member-pet_pet_num`(`pet_num`) USING BTREE,
  INDEX `foster_order_product_num_49200f1b_fk_inventory_product_num`(`product_num`) USING BTREE,
  CONSTRAINT `foster_order_cage_num_ae9d7d0c_fk_cage_cage_num` FOREIGN KEY (`cage_num`) REFERENCES `cage` (`cage_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foster_order_pet_num_ece563f2_fk_member-pet_pet_num` FOREIGN KEY (`pet_num`) REFERENCES `member_pet` (`pet_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foster_order_product_num_49200f1b_fk_inventory_product_num` FOREIGN KEY (`product_num`) REFERENCES `inventory` (`product_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foster_order
-- ----------------------------
INSERT INTO `foster_order` VALUES (1, '2019-01-07', '2019-01-08', 100, 1, 1, 1, 10);
INSERT INTO `foster_order` VALUES (2, '2019-01-07', '2019-01-08', 100, 1, 1, 1, 10);
INSERT INTO `foster_order` VALUES (3, '2019-01-08', '2019-01-08', 100, 1, 1, 1, 10);
INSERT INTO `foster_order` VALUES (4, '2019-01-08', '2019-01-08', 100, 1, 1, 2, 10);
INSERT INTO `foster_order` VALUES (5, '2019-01-08', NULL, 0, 2, 2, 1, 10);

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `product_num` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `min` int(11) NULL DEFAULT NULL,
  `max` int(11) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `stock_price` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`product_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (1, '猫粮', 20, 100, 3, 2, 3400);
INSERT INTO `inventory` VALUES (2, '狗粮', 30, 120, 4, 3, 200);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `mem_num` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `point` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mem_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 'xxc', 'xxc', 'type', 0);
INSERT INTO `member` VALUES (2, 'hhh', 'hhh', 'type', 1);
INSERT INTO `member` VALUES (10, 'test', 'test', 'type', 0);
INSERT INTO `member` VALUES (12, NULL, NULL, 'type', 0);

-- ----------------------------
-- Table structure for member_pet
-- ----------------------------
DROP TABLE IF EXISTS `member_pet`;
CREATE TABLE `member_pet`  (
  `pet_num` int(11) NOT NULL,
  `pet_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(255) NULL DEFAULT NULL,
  `size` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mem_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pet_num`) USING BTREE,
  INDEX `member-pet_mem_num_40af43b5_fk_member_mem_num`(`mem_num`) USING BTREE,
  CONSTRAINT `member_pet_ibfk_1` FOREIGN KEY (`mem_num`) REFERENCES `member` (`mem_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_pet
-- ----------------------------
INSERT INTO `member_pet` VALUES (1, '拉布拉多', '男', 1, '大', 10);
INSERT INTO `member_pet` VALUES (2, '英短', '女', 0, '小', 10);

-- ----------------------------
-- Table structure for salary_order
-- ----------------------------
DROP TABLE IF EXISTS `salary_order`;
CREATE TABLE `salary_order`  (
  `salary_order_num` int(11) NOT NULL,
  `last_paid_time` date NULL DEFAULT NULL,
  `datetime` date NULL DEFAULT NULL,
  `emp_num` int(11) NULL DEFAULT NULL,
  `salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`salary_order_num`) USING BTREE,
  INDEX `salary_order_emp_num_b941f585_fk_emp_info_emp_num`(`emp_num`) USING BTREE,
  CONSTRAINT `salary_order_emp_num_b941f585_fk_emp_info_emp_num` FOREIGN KEY (`emp_num`) REFERENCES `emp_info` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for service_reservation
-- ----------------------------
DROP TABLE IF EXISTS `service_reservation`;
CREATE TABLE `service_reservation`  (
  `res_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `datetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(255) NULL DEFAULT NULL,
  `final_price` int(11) NULL DEFAULT NULL,
  `emp_num` int(11) NULL DEFAULT NULL,
  `mem_num` int(11) NULL DEFAULT NULL,
  `pet_num` int(11) NULL DEFAULT NULL,
  `service_num` int(11) NULL DEFAULT NULL,
  `check` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`res_num`) USING BTREE,
  INDEX `service_reservation_emp_num_881be7a5_fk_emp_info_emp_num`(`emp_num`) USING BTREE,
  INDEX `service_reservation_mem_num_cb5e20eb_fk_member_mem_num`(`mem_num`) USING BTREE,
  INDEX `service_reservation_pet_num_e3717afe_fk_member-pet_pet_num`(`pet_num`) USING BTREE,
  INDEX `service_reservation_service_num_36767d84_fk_service_t`(`service_num`) USING BTREE,
  CONSTRAINT `service_reservation_emp_num_881be7a5_fk_emp_info_emp_num` FOREIGN KEY (`emp_num`) REFERENCES `emp_info` (`emp_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_reservation_ibfk_1` FOREIGN KEY (`mem_num`) REFERENCES `member` (`mem_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_reservation_pet_num_e3717afe_fk_member-pet_pet_num` FOREIGN KEY (`pet_num`) REFERENCES `member_pet` (`pet_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_reservation_service_num_36767d84_fk_service_t` FOREIGN KEY (`service_num`) REFERENCES `service_type` (`service_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_reservation
-- ----------------------------
INSERT INTO `service_reservation` VALUES ('YY201901071750', '10:00-11:00', 0, 80, 1, 10, 1, 2, '10:00-11:00EmpInfo object (1)', NULL);
INSERT INTO `service_reservation` VALUES ('YY201901073826', '10:00-11:00', 0, 45, 1, 1, 1, 1, '10:00-11:00EmpInfo object (1)', NULL);
INSERT INTO `service_reservation` VALUES ('YY201901081558', '10:00-11:00', 0, 150, 1, 10, 1, 3, '10:00-11:00EmpInfo object (1)', NULL);
INSERT INTO `service_reservation` VALUES ('YY201901082943', '10:00-11:00', 0, 80, 1, 10, 1, 2, '10:00-11:00EmpInfo object (1)', NULL);
INSERT INTO `service_reservation` VALUES ('YY201901084641', '10:00-11:00', 0, 45, 1, 10, 1, 1, '10:00-11:00EmpInfo object (1)', NULL);

-- ----------------------------
-- Table structure for service_type
-- ----------------------------
DROP TABLE IF EXISTS `service_type`;
CREATE TABLE `service_type`  (
  `service_num` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`service_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_type
-- ----------------------------
INSERT INTO `service_type` VALUES (1, '洗澡全套（小只）', 45);
INSERT INTO `service_type` VALUES (2, '洗澡全套（大只）', 80);
INSERT INTO `service_type` VALUES (3, '美容造型（小只）', 150);
INSERT INTO `service_type` VALUES (4, '美容造型（大只）', 180);
INSERT INTO `service_type` VALUES (5, '全身剃毛（小只）', 120);
INSERT INTO `service_type` VALUES (6, '全身剃毛（大只）', 155);

-- ----------------------------
-- Table structure for stock_order
-- ----------------------------
DROP TABLE IF EXISTS `stock_order`;
CREATE TABLE `stock_order`  (
  `stock_num` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NULL DEFAULT NULL,
  `final_price` int(11) NULL DEFAULT NULL,
  `product_num` int(11) NULL DEFAULT NULL,
  `time` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stock_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_order
-- ----------------------------
INSERT INTO `stock_order` VALUES (8, 100, 200, 1, '2019-01-02');
INSERT INTO `stock_order` VALUES (9, 100, 200, 1, '2019-01-03');
INSERT INTO `stock_order` VALUES (10, 1000, 2000, 1, '2019-01-03');
INSERT INTO `stock_order` VALUES (11, 1000, 2000, 1, '2019-01-08');
INSERT INTO `stock_order` VALUES (12, 100, 200, 1, '2019-01-08');

SET FOREIGN_KEY_CHECKS = 1;
