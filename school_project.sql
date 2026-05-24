/*
 Navicat Premium Dump SQL

 Source Server         : local mtsql
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : school_project

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 06/12/2025 09:59:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for academic_classes
-- ----------------------------
DROP TABLE IF EXISTS `academic_classes`;
CREATE TABLE `academic_classes`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `teacher_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` bigint UNSIGNED NULL DEFAULT NULL,
  `time_id` bigint UNSIGNED NULL DEFAULT NULL,
  `level_id` bigint UNSIGNED NULL DEFAULT NULL,
  `academic_year_id` bigint UNSIGNED NOT NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `academic_classes_type_index`(`type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of academic_classes
-- ----------------------------
INSERT INTO `academic_classes` VALUES ('ace7d903-c156-467c-b113-52d2774d6285', 3, 'sd', '2bbe31ef-82ac-43c6-9085-239e73d80cf3', 5, 3, 3, 1, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-25 09:24:05', '2025-02-10 15:25:39');
INSERT INTO `academic_classes` VALUES ('c6953556-271f-4e99-82ea-d0e3844e04c5', 3, NULL, 'ad0bb5d3-b907-4385-9bc7-4566fdc5341c', 5, 4, 3, 3, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-25 09:31:13', '2025-01-25 09:31:13');
INSERT INTO `academic_classes` VALUES ('c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 2, NULL, '2bbe31ef-82ac-43c6-9085-239e73d80cf3', 5, 4, 3, 2, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-25 09:30:59', '2025-01-25 09:30:59');
INSERT INTO `academic_classes` VALUES ('e9d45398-6363-4907-abef-88dfdd878ce0', 2, NULL, 'f8dff761-6cd9-4e2a-a465-1267b6520eda', 4, 6, 5, 1, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-10 15:25:25', '2025-02-10 15:25:25');

-- ----------------------------
-- Table structure for academic_years
-- ----------------------------
DROP TABLE IF EXISTS `academic_years`;
CREATE TABLE `academic_years`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of academic_years
-- ----------------------------
INSERT INTO `academic_years` VALUES (1, 'term 1 2024', '2024-01-01', '2024-03-29', 1, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-25 08:43:07');
INSERT INTO `academic_years` VALUES (2, 'term 2 2024', '2023-06-12', '2024-11-04', 0, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-04 15:43:37', '2024-06-04 15:44:17');
INSERT INTO `academic_years` VALUES (3, 'term 3 2025', '2024-02-11', '2025-06-07', 0, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-04 15:44:17', '2024-06-04 15:45:05');
INSERT INTO `academic_years` VALUES (4, 'term 4 2025', '2024-08-21', '2025-12-04', 0, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-04 15:44:46', '2024-06-04 15:44:46');

-- ----------------------------
-- Table structure for app_settings
-- ----------------------------
DROP TABLE IF EXISTS `app_settings`;
CREATE TABLE `app_settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_settings
-- ----------------------------
INSERT INTO `app_settings` VALUES (1, 'logo', 'Logo', '/src/assets/images/logo.png', 'this logo for app', NULL, NULL);
INSERT INTO `app_settings` VALUES (2, 'name_kh', 'Intitute Name Kh', 'ប្រព័ន្ធគ្រប់គ្រងសាលារៀន', NULL, NULL, NULL);
INSERT INTO `app_settings` VALUES (3, 'name_en', 'Intitute Name En', 'School Management System', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for attendances
-- ----------------------------
DROP TABLE IF EXISTS `attendances`;
CREATE TABLE `attendances`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `month` tinyint NULL DEFAULT NULL,
  `absent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 => Permission, 2 => No Permission',
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `attendances_academic_class_id_index`(`academic_class_id` ASC) USING BTREE,
  INDEX `attendances_student_id_index`(`student_id` ASC) USING BTREE,
  INDEX `attendances_month_index`(`month` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attendances
-- ----------------------------
INSERT INTO `attendances` VALUES ('004341b3-c195-4786-a9fe-96f7909e32d9', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-03', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:51:03', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('096c9272-11df-4e8d-800e-37346ea268bc', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-01-03', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:49:18', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('0e0e7a2a-3a55-40ce-b720-2a0acb5f657b', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-02-01', 2, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-30 09:24:10', '2025-01-30 09:24:10');
INSERT INTO `attendances` VALUES ('1f888b5b-c547-4515-82b4-9ce2cab5e970', 'ace7d903-c156-467c-b113-52d2774d6285', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-01-02', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:12:59', '2025-01-30 13:51:06');
INSERT INTO `attendances` VALUES ('22d8a308-e475-49cb-834d-fcc12f99e832', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'bf3d1f47-607c-4011-94f9-c84b912deb79', '2024-01-19', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-10 14:51:18', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('239f17dc-e1a5-4300-a54a-1b23b99f7266', 'ace7d903-c156-467c-b113-52d2774d6285', 'bf3d1f47-607c-4011-94f9-c84b912deb79', '2024-02-02', 2, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-02 04:00:05', '2025-02-02 04:00:05');
INSERT INTO `attendances` VALUES ('2b231f47-9cce-4535-9ec1-7cea5c0b4a3e', 'e9d45398-6363-4907-abef-88dfdd878ce0', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-01-08', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-11 04:35:53', '2025-02-11 04:35:53');
INSERT INTO `attendances` VALUES ('2c5a0264-8630-45bc-9b42-41fe2f1d1626', 'ace7d903-c156-467c-b113-52d2774d6285', 'bf3d1f47-607c-4011-94f9-c84b912deb79', '2024-01-02', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:12:59', '2025-01-30 13:51:06');
INSERT INTO `attendances` VALUES ('2c975734-a73d-43b4-b369-7797c69b0d4e', 'e9d45398-6363-4907-abef-88dfdd878ce0', '8991ab07-c393-478c-8e27-711cdb406013', '2024-01-01', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-11 04:35:53', '2025-02-11 04:35:53');
INSERT INTO `attendances` VALUES ('2e4a888e-a332-4681-ae91-b0845cda07c4', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', '2024-01-03', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:50:13', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('33356f72-766e-4aa6-b783-7a98f6fa6c30', 'ace7d903-c156-467c-b113-52d2774d6285', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-02-02', 2, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-02 04:00:05', '2025-02-02 04:00:05');
INSERT INTO `attendances` VALUES ('420c4fa9-3836-47ea-8fa8-8ec6d5da0793', 'ace7d903-c156-467c-b113-52d2774d6285', 'bf3d1f47-607c-4011-94f9-c84b912deb79', '2024-02-01', 2, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-02 04:00:05', '2025-02-02 04:00:05');
INSERT INTO `attendances` VALUES ('4307f7dc-5b84-41f0-b5e6-e02907a8290c', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'a94c218e-5f55-48e7-b69d-fa18d64f48eb', '2024-01-07', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:13:51', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('4a396603-060f-4f46-b688-12131a1e545b', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', '2024-02-01', 2, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-30 09:24:10', '2025-01-30 09:24:10');
INSERT INTO `attendances` VALUES ('59ef9210-8a97-4af6-8661-8e6c5d88ec4d', 'ace7d903-c156-467c-b113-52d2774d6285', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-02-01', 2, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-02 04:00:05', '2025-02-02 04:00:05');
INSERT INTO `attendances` VALUES ('5ab5a795-6b8e-42e3-9090-496a0b8b0c5f', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-01-01', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:49:18', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('5cee3def-06dc-4321-9929-a6e8d8a6fed1', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-02-04', 2, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-30 09:24:10', '2025-01-30 09:24:10');
INSERT INTO `attendances` VALUES ('5e8dd310-e274-4736-9730-fa0cd500282d', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', '2024-01-02', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:50:13', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('6cc9e36b-43f5-4101-a1da-6afd04b3cdaa', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'bf3d1f47-607c-4011-94f9-c84b912deb79', '2024-01-24', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-10 14:51:18', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('712c23ac-c516-40a6-8d6b-04b2122f14f0', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-05', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:48:43', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('734504e8-8244-404b-b71e-4304a3d56ac6', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-02-04', 2, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-30 09:24:10', '2025-01-30 09:24:10');
INSERT INTO `attendances` VALUES ('7d9d8a26-eda9-4694-a88d-2f47ae82c2df', 'ace7d903-c156-467c-b113-52d2774d6285', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-01-07', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:12:59', '2025-01-30 13:51:06');
INSERT INTO `attendances` VALUES ('8bb9e4f8-61f9-4305-aa5d-a3f5ca3dc32e', 'e9d45398-6363-4907-abef-88dfdd878ce0', 'bd50ed81-4d73-4d35-907a-e311374cbd05', '2024-01-02', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-11 04:35:53', '2025-02-11 04:35:53');
INSERT INTO `attendances` VALUES ('8d96f885-5ce0-46c6-b930-aa16b2a709da', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-01-02', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:49:18', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('9d174f8e-e83e-4e70-b08f-d59aba47893b', 'ace7d903-c156-467c-b113-52d2774d6285', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-01-01', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:12:59', '2025-01-30 13:51:06');
INSERT INTO `attendances` VALUES ('9f16baf6-f61f-49b6-b46d-627ce94488a2', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-02', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:13:51', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('a696e76d-9795-41d6-b7d7-822f5740d8f2', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', '2024-01-01', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:13:51', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('b1284ad0-bc5b-4b4f-9157-8a255255ffd3', 'e9d45398-6363-4907-abef-88dfdd878ce0', '8991ab07-c393-478c-8e27-711cdb406013', '2024-01-02', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-11 04:35:53', '2025-02-11 04:35:53');
INSERT INTO `attendances` VALUES ('b4f80140-cfba-4518-93b8-1ae71bc36402', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-31', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:13:51', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('b532f465-7ab9-4460-a9f5-9e7e3944c5ab', 'ace7d903-c156-467c-b113-52d2774d6285', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-03', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-28 04:39:22', '2025-01-30 13:51:06');
INSERT INTO `attendances` VALUES ('c0bcecae-b5ad-4135-a33a-21fb4205ed1b', 'ace7d903-c156-467c-b113-52d2774d6285', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-02-05', 2, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-02 04:00:05', '2025-02-02 04:00:05');
INSERT INTO `attendances` VALUES ('c12cf756-7b43-4a25-8583-709eecb09c07', 'e9d45398-6363-4907-abef-88dfdd878ce0', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-01-07', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-11 04:35:53', '2025-02-11 04:35:53');
INSERT INTO `attendances` VALUES ('c3635f62-1460-498f-aba7-dede032caa1b', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-04', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:48:43', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('d2214b5e-bd2d-4de1-8425-18566a2a6236', 'ace7d903-c156-467c-b113-52d2774d6285', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-14', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 13:50:58', '2025-01-30 13:51:06');
INSERT INTO `attendances` VALUES ('d69c5384-b859-47b8-b4e3-a2991ebef0d9', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'a94c218e-5f55-48e7-b69d-fa18d64f48eb', '2024-01-03', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:48:43', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('dab31919-de76-490e-b684-980d4b64351b', 'ace7d903-c156-467c-b113-52d2774d6285', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-07', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-30 13:51:06', '2025-01-30 13:51:06');
INSERT INTO `attendances` VALUES ('e61d6191-e2bf-41fa-94ab-739e4dcda532', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'a94c218e-5f55-48e7-b69d-fa18d64f48eb', '2024-01-13', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:13:51', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('e8e27609-7b90-4904-924e-323188c580df', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'a94c218e-5f55-48e7-b69d-fa18d64f48eb', '2024-01-01', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 14:48:43', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('ea6c83c0-e0ca-4c52-9810-b209ce55c8e4', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'bf3d1f47-607c-4011-94f9-c84b912deb79', '2024-01-01', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:13:57', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('ef7d356c-a2cf-4eae-b377-3384bb1c9fef', 'ace7d903-c156-467c-b113-52d2774d6285', 'bf3d1f47-607c-4011-94f9-c84b912deb79', '2024-01-01', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:12:59', '2025-01-30 13:51:06');
INSERT INTO `attendances` VALUES ('f544c9cf-c793-4634-8700-51fcf1904e8f', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '2024-02-02', 2, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-30 09:24:10', '2025-01-30 09:24:10');
INSERT INTO `attendances` VALUES ('f5d2c067-6370-41c2-8436-3481fb98eccf', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-01', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-30 08:13:51', '2025-02-10 14:51:18');
INSERT INTO `attendances` VALUES ('f7e672b3-d58f-4841-b8b4-ae8368eb9f39', 'e9d45398-6363-4907-abef-88dfdd878ce0', 'bd50ed81-4d73-4d35-907a-e311374cbd05', '2024-01-04', 1, 'P', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-11 04:35:53', '2025-02-11 04:35:53');
INSERT INTO `attendances` VALUES ('f94d823a-d7a5-4fb9-9434-db05c0ec75b6', 'ace7d903-c156-467c-b113-52d2774d6285', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', '2024-01-02', 1, 'A', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-28 04:39:22', '2025-01-30 13:51:06');

-- ----------------------------
-- Table structure for error_logs
-- ----------------------------
DROP TABLE IF EXISTS `error_logs`;
CREATE TABLE `error_logs`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_point` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of error_logs
-- ----------------------------

-- ----------------------------
-- Table structure for exams
-- ----------------------------
DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `academic_class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `att` tinyint NOT NULL DEFAULT 0,
  `quiz` tinyint NOT NULL DEFAULT 0,
  `hw` tinyint NOT NULL DEFAULT 0,
  `re` tinyint NOT NULL DEFAULT 0,
  `voc` tinyint NOT NULL DEFAULT 0,
  `gr` tinyint NOT NULL DEFAULT 0,
  `liu` tinyint NOT NULL DEFAULT 0,
  `wr` tinyint NOT NULL DEFAULT 0,
  `li` tinyint NOT NULL DEFAULT 0,
  `sp` tinyint NOT NULL DEFAULT 0,
  `mid` tinyint NOT NULL DEFAULT 0,
  `attitude` tinyint NOT NULL DEFAULT 0,
  `final` tinyint NOT NULL DEFAULT 0,
  `total` double(5, 2) NOT NULL DEFAULT 0.00,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exams_academic_class_id_index`(`academic_class_id` ASC) USING BTREE,
  INDEX `exams_student_id_index`(`student_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exams
-- ----------------------------
INSERT INTO `exams` VALUES (1, '24325bd4-3602-4e55-ae3d-b99f50c7fcd1', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-23 15:46:32', '2025-01-23 15:46:32', NULL);
INSERT INTO `exams` VALUES (2, '24325bd4-3602-4e55-ae3d-b99f50c7fcd1', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-23 15:46:32', '2025-01-23 15:46:32', NULL);
INSERT INTO `exams` VALUES (3, 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', 10, 9, 8, 10, 9, 10, 10, 10, 10, 10, 0, 0, 0, 96.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-27 08:47:20', '2025-01-29 08:02:15', '1');
INSERT INTO `exams` VALUES (4, 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', 7, 8, 9, 1, 3, 3, 3, 1, 7, 1, 0, 0, 0, 43.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-27 08:47:20', '2025-02-10 15:20:45', '4');
INSERT INTO `exams` VALUES (5, 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'bf3d1f47-607c-4011-94f9-c84b912deb79', 7, 9, 6, 1, 0, 4, 7, 9, 1, 0, 0, 0, 0, 44.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-27 08:47:20', '2025-02-10 15:20:45', '3');
INSERT INTO `exams` VALUES (6, 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', 6, 1, 8, 0, 8, 7, 1, 1, 3, 1, 0, 0, 0, 36.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-27 08:47:20', '2025-01-27 09:09:54', '5');
INSERT INTO `exams` VALUES (7, 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'a94c218e-5f55-48e7-b69d-fa18d64f48eb', 10, 8, 9, 5, 10, 10, 5, 10, 8, 7, 0, 0, 0, 82.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-27 09:09:54', '2025-02-10 15:20:45', '2');
INSERT INTO `exams` VALUES (8, 'ace7d903-c156-467c-b113-52d2774d6285', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', 10, 0, 9, 0, 0, 0, 0, 0, 0, 0, 3, 7, 7, 36.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-27 09:44:31', '2025-02-10 15:15:22', '4');
INSERT INTO `exams` VALUES (9, 'ace7d903-c156-467c-b113-52d2774d6285', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', 10, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 2, 40, 55.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-27 09:44:31', '2025-02-10 15:15:22', '3');
INSERT INTO `exams` VALUES (10, 'ace7d903-c156-467c-b113-52d2774d6285', 'bf3d1f47-607c-4011-94f9-c84b912deb79', 10, 0, 15, 0, 0, 0, 0, 0, 0, 0, 16, 10, 40, 91.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-27 09:44:31', '2025-01-29 08:00:30', '1');
INSERT INTO `exams` VALUES (11, 'ace7d903-c156-467c-b113-52d2774d6285', '1199c7e1-2ebe-4151-8121-07cd8c3b7c78', 10, 0, 15, 0, 0, 0, 0, 0, 0, 0, 15, 8, 35, 83.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '2');
INSERT INTO `exams` VALUES (12, 'ace7d903-c156-467c-b113-52d2774d6285', '4542035f-3561-4b93-a10c-6e867b6122cc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (13, 'ace7d903-c156-467c-b113-52d2774d6285', '73f0df98-3935-4f48-bbd4-301f695296b6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (14, 'ace7d903-c156-467c-b113-52d2774d6285', 'a62dc907-f008-4959-a090-01b2ea3c1d10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (15, 'ace7d903-c156-467c-b113-52d2774d6285', 'e82a5646-4c16-4ebd-9628-eadae51c36b6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (16, 'ace7d903-c156-467c-b113-52d2774d6285', 'e82a5646-4c16-4ebd-9628-eadae51c36b6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (17, 'ace7d903-c156-467c-b113-52d2774d6285', 'f89276e2-2d2f-4f9a-ba9d-ebcbad908a8d', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (18, 'ace7d903-c156-467c-b113-52d2774d6285', 'a94c218e-5f55-48e7-b69d-fa18d64f48eb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (19, 'ace7d903-c156-467c-b113-52d2774d6285', '8991ab07-c393-478c-8e27-711cdb406013', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (20, 'ace7d903-c156-467c-b113-52d2774d6285', '8991ab07-c393-478c-8e27-711cdb406013', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (21, 'ace7d903-c156-467c-b113-52d2774d6285', 'ed0e3b9c-a80d-41d8-a9f0-f5e945b8f279', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (22, 'ace7d903-c156-467c-b113-52d2774d6285', 'e8af7126-125d-440a-ba5a-1cbb58cdc901', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (23, 'ace7d903-c156-467c-b113-52d2774d6285', 'ebc665e5-731e-4ba7-bf1c-7d5a214a5648', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (24, 'ace7d903-c156-467c-b113-52d2774d6285', 'bd50ed81-4d73-4d35-907a-e311374cbd05', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (25, 'ace7d903-c156-467c-b113-52d2774d6285', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (26, 'ace7d903-c156-467c-b113-52d2774d6285', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (27, 'ace7d903-c156-467c-b113-52d2774d6285', '20c1eec3-b445-43c8-a12f-e9344ef7bc2f', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-10 15:15:22', '2025-02-10 15:15:22', '5');
INSERT INTO `exams` VALUES (28, 'e9d45398-6363-4907-abef-88dfdd878ce0', '8991ab07-c393-478c-8e27-711cdb406013', 9, 1, 7, 9, 4, 8, 10, 1, 9, 1, 0, 0, 0, 59.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-11 04:33:43', '2025-02-11 04:33:43', '1');
INSERT INTO `exams` VALUES (29, 'e9d45398-6363-4907-abef-88dfdd878ce0', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', 10, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 20.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-11 04:33:43', '2025-02-11 04:33:43', '2');
INSERT INTO `exams` VALUES (30, 'e9d45398-6363-4907-abef-88dfdd878ce0', 'bd50ed81-4d73-4d35-907a-e311374cbd05', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-11 04:33:43', '2025-02-11 04:33:43', '4');
INSERT INTO `exams` VALUES (31, 'e9d45398-6363-4907-abef-88dfdd878ce0', 'bf3d1f47-607c-4011-94f9-c84b912deb79', 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10.00, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-11 04:33:43', '2025-02-11 04:33:43', '3');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for home_pages
-- ----------------------------
DROP TABLE IF EXISTS `home_pages`;
CREATE TABLE `home_pages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `service_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `service_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `project_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `proejct_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of home_pages
-- ----------------------------
INSERT INTO `home_pages` VALUES (1, 'ដោះស្រាយបញ្ហាអាជីវកម្មជាមួយការអភិវឌ្ឍន៍ទៅជាប្រព័ន្ធគ្រប់គ្រង!', 'សេវាកម្មយើង', 'លក់ និងបង្កើតប្រព័ន្ធគ្រប់គ្រងអាជីវកម្ម(POS SYSTEM) សម្រាប់អាជីវកម្ម ខ្នាតធំ មធ្យម និងខ្នាតតូចសម្រាប់អាជីរកម្មដូចជា ភោជនីយដ្ឋាន ហាងកាហ្វេ ម៉ាត និងដេប៉ូលក់ដំ-រាយ ហាងលក់ និងបង់រំលោះ ម៉ូតូ រថយន្ដ គ្រឿងអេឡិចត្រូវនិច ទូរស័ព្ទ ។ល។', 'ប្រព័ន្ធគ្រប់គ្រងថ្មីៗ', 'លោកអ្នកអាចមានជម្រើសប្រើប្រាស់ជាមួយនឹងប្រព័ន្ធគ្រប់គ្រងអាជីវកម្មដែលបានបង្កើតឡើងរួចមកហើយ ជាមួយនឹងតម្លៃសម្យរម ព្រមទាំងមានការគាំទ្រជាប់ជានិច្ច។');

-- ----------------------------
-- Table structure for levels
-- ----------------------------
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of levels
-- ----------------------------
INSERT INTO `levels` VALUES (1, 'Level 1', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-05-29 10:09:02', '2024-05-31 03:08:11');
INSERT INTO `levels` VALUES (2, 'Level 2', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-05-29 10:08:58', '2024-05-31 03:08:11');
INSERT INTO `levels` VALUES (3, 'Level 3', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-05-30 10:08:53', '2024-05-31 03:08:11');
INSERT INTO `levels` VALUES (4, 'Level 4', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-05-31 03:08:11', '2024-05-31 03:08:11');
INSERT INTO `levels` VALUES (5, 'Level 5', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-09 02:15:36', '2024-06-09 02:15:36');
INSERT INTO `levels` VALUES (7, 'Level 6', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-02-11 01:08:54', '2025-02-11 01:08:54');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (2, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_01_01_000004_create_users_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_12_01_055549_create_roles_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_12_01_055557_create_permissions_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_12_01_075730_create_permission_role_pivot_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_12_01_075804_create_role_user_pivot_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_06_01_121138_create_schools_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_06_04_143540_create_teachers_table', 1);
INSERT INTO `migrations` VALUES (11, '2023_06_05_035925_create_students_table', 1);
INSERT INTO `migrations` VALUES (12, '2023_06_05_042835_create_academic_years_table', 1);
INSERT INTO `migrations` VALUES (13, '2023_06_05_043432_create_academic_classes_table', 1);
INSERT INTO `migrations` VALUES (14, '2023_06_05_043751_create_exams_table', 1);
INSERT INTO `migrations` VALUES (15, '2023_06_05_044123_create_attendances_table', 1);
INSERT INTO `migrations` VALUES (16, '2023_06_05_044502_create_studies_table', 1);
INSERT INTO `migrations` VALUES (17, '2024_01_13_053422_create_error_logs_table', 1);
INSERT INTO `migrations` VALUES (18, '2024_05_20_040708_create_app_settings_table', 1);
INSERT INTO `migrations` VALUES (19, '2024_05_22_031028_create_levels_table', 1);
INSERT INTO `migrations` VALUES (20, '2024_05_22_031028_create_rooms_table', 1);
INSERT INTO `migrations` VALUES (21, '2024_05_22_031028_create_times_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `role_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  INDEX `permission_role_role_id_foreign`(`role_id` ASC) USING BTREE,
  INDEX `permission_role_permission_id_foreign`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '05d22263-630a-41d3-a4d2-05c644bac16d');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '07b63ffc-72d0-476a-8313-d8d7745cc975');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '07c15522-18c9-4881-b364-cb56cbc9f9c3');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '14c4afb0-69e0-4f94-ab35-f6722db431da');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '23e5ed1b-a963-474b-9566-4309df949c39');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '3030f8f7-f56f-4966-8fb1-df4c69c564ed');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '34991281-fd83-4b03-80b8-ffcff34c9c23');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '3be78bbc-7044-47e6-a34d-eb633087ac75');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '73d05c3d-6af6-4bf2-80e4-1509a21ca225');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '81e0cdaa-15a1-480b-833f-dab7d9f5a0b4');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '8ca9d859-be55-446e-af20-9cfbd7ad6d61');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '917227a4-15f2-40cf-b462-765514896c60');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '94a99e19-a26e-430f-9a56-7b8370bbdbe2');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '9b5b1be1-7abc-4ecd-a32d-c4496215711c');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'b2b664b6-4c56-4bad-bd64-4fa0a2e45dcb');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'b2e63276-a584-44e6-9bdd-9e0c1205160b');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'b4ad6583-523e-421b-bf6e-d5beb2fe68ed');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'b73a3b33-73cc-4f73-aa96-a9834235a3f8');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'b74b77cd-88cb-41e0-ba3e-77a227338cfd');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'b74c8e6a-da8d-453d-a670-310eeb7ce720');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'c62fb4c9-6f12-459d-9f73-dbe04273a2ec');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'c746c5cf-69cb-4e1e-881b-12f1ea2a3411');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'ce5d1b2f-97d6-429d-8a8f-21fdfd90da43');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'cf8af575-ae3e-49bb-b102-06534fcda573');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'd04f90a8-6329-477c-bace-9e6716e77322');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'd46b6633-63c0-4894-a9dc-dd04e1a8833c');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'dd204cb3-2286-4c46-84fc-10c19ad6e0f9');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'dee284db-f3c6-408a-8443-1b9528a047a2');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'e0f8528a-1ccf-47ba-9914-dc3f682e83d0');
INSERT INTO `permission_role` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'edc3e437-3af3-409a-8820-9001a6aff3d6');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', '34991281-fd83-4b03-80b8-ffcff34c9c23');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', '73d05c3d-6af6-4bf2-80e4-1509a21ca225');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'dee284db-f3c6-408a-8443-1b9528a047a2');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'edc3e437-3af3-409a-8820-9001a6aff3d6');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'b2e63276-a584-44e6-9bdd-9e0c1205160b');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'cf8af575-ae3e-49bb-b102-06534fcda573');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'ce5d1b2f-97d6-429d-8a8f-21fdfd90da43');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', '917227a4-15f2-40cf-b462-765514896c60');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'b74c8e6a-da8d-453d-a670-310eeb7ce720');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', '23e5ed1b-a963-474b-9566-4309df949c39');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', '3030f8f7-f56f-4966-8fb1-df4c69c564ed');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', '8ca9d859-be55-446e-af20-9cfbd7ad6d61');
INSERT INTO `permission_role` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'b2b664b6-4c56-4bad-bd64-4fa0a2e45dcb');
INSERT INTO `permission_role` VALUES ('c377e432-f113-4850-b80e-cd053a1a40b0', '34991281-fd83-4b03-80b8-ffcff34c9c23');
INSERT INTO `permission_role` VALUES ('c377e432-f113-4850-b80e-cd053a1a40b0', '73d05c3d-6af6-4bf2-80e4-1509a21ca225');
INSERT INTO `permission_role` VALUES ('c377e432-f113-4850-b80e-cd053a1a40b0', 'dee284db-f3c6-408a-8443-1b9528a047a2');
INSERT INTO `permission_role` VALUES ('c377e432-f113-4850-b80e-cd053a1a40b0', 'edc3e437-3af3-409a-8820-9001a6aff3d6');
INSERT INTO `permission_role` VALUES ('c377e432-f113-4850-b80e-cd053a1a40b0', 'b2e63276-a584-44e6-9bdd-9e0c1205160b');
INSERT INTO `permission_role` VALUES ('c377e432-f113-4850-b80e-cd053a1a40b0', 'cf8af575-ae3e-49bb-b102-06534fcda573');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('05d22263-630a-41d3-a4d2-05c644bac16d', 'បង្កើតគ្រូបង្រៀន', 'teacher_create', '4690f0f6-9c2b-4e52-9ca0-ace8719be637', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('07b63ffc-72d0-476a-8313-d8d7745cc975', ' កែប្រែតួនាទី', 'edit_roles', 'e88681c3-9643-4b5a-a18d-26c4397a969a', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('07c15522-18c9-4881-b364-cb56cbc9f9c3', ' លុបតួនាទី', 'delete_roles', 'e88681c3-9643-4b5a-a18d-26c4397a969a', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('14c4afb0-69e0-4f94-ab35-f6722db431da', 'គ្រប់គ្រងសាលារៀន', 'school_access', 'b7ee92ad-e538-482d-a7b5-8c48b3993357', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('21243ee6-eb38-4188-af13-3b7682b9226b', 'ឆ្នាំសិក្សា', 'academic_year', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('23e5ed1b-a963-474b-9566-4309df949c39', 'មើលសិស្ស', 'student_list', 'be706c19-7438-44ab-929b-92a740f366ae', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('3030f8f7-f56f-4966-8fb1-df4c69c564ed', 'បង្កើតសិស្ស', 'student_create', 'be706c19-7438-44ab-929b-92a740f366ae', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('34991281-fd83-4b03-80b8-ffcff34c9c23', 'លុបថ្នាក់រៀន', 'academic_class_delete', 'f78a52b9-d84f-435d-9f83-055cd3df54d8', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('3be78bbc-7044-47e6-a34d-eb633087ac75', 'កែប្រែគ្រូបង្រៀន', 'teacher_edit', '4690f0f6-9c2b-4e52-9ca0-ace8719be637', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('4690f0f6-9c2b-4e52-9ca0-ace8719be637', 'គ្រូបង្រៀន', 'teacher', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('73d05c3d-6af6-4bf2-80e4-1509a21ca225', 'កែប្រែថ្នាក់រៀន', 'academic_class_edit', 'f78a52b9-d84f-435d-9f83-055cd3df54d8', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('7bd47adc-458e-480d-b807-b7d9e461fb84', 'អ្នកប្រើប្រាស់', 'user', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('7e64b6ef-4693-4441-a9e0-100369fe81e4', 'ពិន្ទុ', 'score', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('81e0cdaa-15a1-480b-833f-dab7d9f5a0b4', 'លុបឆ្នាំសិក្សា', 'academic_year_delete', '21243ee6-eb38-4188-af13-3b7682b9226b', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('8ca9d859-be55-446e-af20-9cfbd7ad6d61', 'លុបសិស្ស', 'student_delete', 'be706c19-7438-44ab-929b-92a740f366ae', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('917227a4-15f2-40cf-b462-765514896c60', 'មើលពិន្ទុ', 'score_list', '7e64b6ef-4693-4441-a9e0-100369fe81e4', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('94a99e19-a26e-430f-9a56-7b8370bbdbe2', 'គ្រប់គ្រងអ្នកប្រើប្រាស់', 'view_users', '7bd47adc-458e-480d-b807-b7d9e461fb84', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('9b5b1be1-7abc-4ecd-a32d-c4496215711c', ' បង្កើតតួនាទី', 'create_roles', 'e88681c3-9643-4b5a-a18d-26c4397a969a', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('b2b664b6-4c56-4bad-bd64-4fa0a2e45dcb', 'កែប្រែសិស្ស', 'student_edit', 'be706c19-7438-44ab-929b-92a740f366ae', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('b2e63276-a584-44e6-9bdd-9e0c1205160b', 'មើលវត្តមាន', 'attendance_list', 'f97f2b14-8eab-46de-96ab-61740c9df929', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('b4ad6583-523e-421b-bf6e-d5beb2fe68ed', 'លុបអ្នកប្រើប្រាស់', 'delete_users', '7bd47adc-458e-480d-b807-b7d9e461fb84', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('b73a3b33-73cc-4f73-aa96-a9834235a3f8', 'លុបគ្រូបង្រៀន', 'teacher_delete', '4690f0f6-9c2b-4e52-9ca0-ace8719be637', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('b74b77cd-88cb-41e0-ba3e-77a227338cfd', 'មើលគ្រូបង្រៀន', 'teacher_list', '4690f0f6-9c2b-4e52-9ca0-ace8719be637', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('b74c8e6a-da8d-453d-a670-310eeb7ce720', 'បញ្ចូលពិន្ទុ', 'score_save', '7e64b6ef-4693-4441-a9e0-100369fe81e4', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('b7ee92ad-e538-482d-a7b5-8c48b3993357', 'សាលារៀន', 'school', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('be706c19-7438-44ab-929b-92a740f366ae', 'សិស្ស', 'student', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('c62fb4c9-6f12-459d-9f73-dbe04273a2ec', 'កែប្រែអ្នកប្រើប្រាស់', 'edit_users', '7bd47adc-458e-480d-b807-b7d9e461fb84', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('c746c5cf-69cb-4e1e-881b-12f1ea2a3411', 'តួនាទី', 'view_roles', 'e88681c3-9643-4b5a-a18d-26c4397a969a', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('ce5d1b2f-97d6-429d-8a8f-21fdfd90da43', 'គ្រប់គ្រងសិស្សតាមថ្នាក់', 'manage_student_class_access', 'edf2334b-471b-4a68-99db-56bc1b6d6e26', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('cf8af575-ae3e-49bb-b102-06534fcda573', 'បញ្ចូលវត្តមាន', 'attendance_save', 'f97f2b14-8eab-46de-96ab-61740c9df929', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('d04f90a8-6329-477c-bace-9e6716e77322', 'មើលឆ្នាំសិក្សា', 'academic_year_list', '21243ee6-eb38-4188-af13-3b7682b9226b', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('d46b6633-63c0-4894-a9dc-dd04e1a8833c', 'បង្កើតអ្នកប្រើប្រាស់', 'create_users', '7bd47adc-458e-480d-b807-b7d9e461fb84', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('dd204cb3-2286-4c46-84fc-10c19ad6e0f9', 'បង្កើតឆ្នាំសិក្សា', 'academic_year_create', '21243ee6-eb38-4188-af13-3b7682b9226b', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('dee284db-f3c6-408a-8443-1b9528a047a2', 'បង្កើតថ្នាក់រៀន', 'academic_class_create', 'f78a52b9-d84f-435d-9f83-055cd3df54d8', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('e0f8528a-1ccf-47ba-9914-dc3f682e83d0', 'កែប្រែឆ្នាំសិក្សា', 'academic_year_edit', '21243ee6-eb38-4188-af13-3b7682b9226b', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('e88681c3-9643-4b5a-a18d-26c4397a969a', 'តួនាទី', 'role', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('edc3e437-3af3-409a-8820-9001a6aff3d6', 'មើលថ្នាក់រៀន', 'academic_class_list', 'f78a52b9-d84f-435d-9f83-055cd3df54d8', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('edf2334b-471b-4a68-99db-56bc1b6d6e26', 'សិស្សតាមថ្នាក់', 'manage_student_class', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('f78a52b9-d84f-435d-9f83-055cd3df54d8', 'ថ្នាក់រៀន', 'academic_class', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `permissions` VALUES ('f97f2b14-8eab-46de-96ab-61740c9df929', 'វត្តមាន', 'attendance', NULL, '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', 'ec962b4e04a12bfa6b84cb47c0fd5670d08a4cb83fd61d52151b3f94a6122e4c', '[\"*\"]', '2024-07-10 10:26:27', NULL, '2024-07-09 13:04:38', '2024-07-10 10:26:27');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', 'a2c4e6919ef2fd4b50d284744f00a3410fa9c0f39bbae3b909c5d80c71a74aa2', '[\"*\"]', '2024-07-18 00:24:12', NULL, '2024-07-17 10:44:48', '2024-07-18 00:24:12');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', '4be63a4c2d932850208242022527cdcc6bb8fe3ac5c2dec0f1a70bef3045c5c8', '[\"*\"]', '2024-08-15 03:03:44', NULL, '2024-07-18 02:03:24', '2024-08-15 03:03:44');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', 'a1afbb32f39d23ef6ad2e4ff3e1a4e7b3b2ec4d1546be3fa8d514fed85a103db', '[\"*\"]', '2024-08-16 03:25:20', NULL, '2024-08-15 03:03:54', '2024-08-16 03:25:20');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', 'e1329f3a49e7c944a7087e9aebf3b7c856dd507fa6df3317bba44208591147d9', '[\"*\"]', '2025-02-14 15:36:58', NULL, '2025-02-14 15:36:57', '2025-02-14 15:36:58');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', '851e7640a70a29ab36b41df05df8bdc79313ea2b8011ffc4e56db2db19ce3b44', '[\"*\"]', '2025-03-16 08:28:45', NULL, '2025-02-14 15:36:58', '2025-03-16 08:28:45');
INSERT INTO `personal_access_tokens` VALUES (34, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', '2ed5a3b6cddfb0b6d6dcfb55ed94fb7bd1cc0acb7dd7294661a812fa7ce84b18', '[\"*\"]', '2025-02-16 07:56:02', NULL, '2025-02-16 07:42:25', '2025-02-16 07:56:02');
INSERT INTO `personal_access_tokens` VALUES (35, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', '451e58c09f7fc697084f0fdc47d79d8ef4e8735e86ee5064cae2dd5a561210e8', '[\"*\"]', '2025-02-16 08:22:03', NULL, '2025-02-16 08:12:21', '2025-02-16 08:22:03');
INSERT INTO `personal_access_tokens` VALUES (36, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', 'e80eca7ebf518972d95446240a052b203eefa57f83a41323113bf50ab7c74e16', '[\"*\"]', NULL, NULL, '2025-03-22 07:01:29', '2025-03-22 07:01:29');
INSERT INTO `personal_access_tokens` VALUES (37, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', '9a8b546d449533aa2344257bcee92fef6086021f494d62ead1200c1d96a66f30', '[\"*\"]', NULL, NULL, '2025-03-22 07:24:09', '2025-03-22 07:24:09');
INSERT INTO `personal_access_tokens` VALUES (40, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', 'f57f87aba157139dbf733b25dc4166be5c0f3afb1e47d034f8ef94ee37cf2abb', '[\"*\"]', '2025-03-22 07:50:04', NULL, '2025-03-22 07:49:56', '2025-03-22 07:50:04');
INSERT INTO `personal_access_tokens` VALUES (41, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', '0d66520e26478d506dae7fc8684c64f7cfb1beb81cb908aa06ae3914c13fcef2', '[\"*\"]', '2025-03-24 13:24:24', NULL, '2025-03-24 13:22:26', '2025-03-24 13:24:24');
INSERT INTO `personal_access_tokens` VALUES (43, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', '53a1f743782582c1832a986fb6dc17d04a6eb8c42a886ebb6b75c2df9a5e413c', '[\"*\"]', '2025-12-06 02:43:27', NULL, '2025-10-07 03:18:42', '2025-12-06 02:43:27');
INSERT INTO `personal_access_tokens` VALUES (44, 'App\\Models\\User', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 'Api_Token', '4c9b6fd8a33dd983087ed62697df64e0ef1454b34da5336d3e3a0b7b9bd05241', '[\"*\"]', '2025-10-07 03:57:54', NULL, '2025-10-07 03:18:46', '2025-10-07 03:57:54');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `role_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  INDEX `role_user_role_id_foreign`(`role_id` ASC) USING BTREE,
  INDEX `role_user_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', '6a0652a1-c83f-4233-9bdb-85ce5851dca7');
INSERT INTO `role_user` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'c26e4b34-da70-4f15-9b0c-8e337822af97');
INSERT INTO `role_user` VALUES ('c377e432-f113-4850-b80e-cd053a1a40b0', 'c6ec88fc-ee64-47bb-af3d-d4cd8b44a095');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('11a5d16a-4b43-43c9-b9dc-4339b785fcbe', 'Administrator', '2024-07-09 13:04:29', '2024-07-09 13:04:29', NULL);
INSERT INTO `roles` VALUES ('c2e553c6-2499-4048-914a-46abd46a9341', 'Teacher', '2025-01-30 07:52:31', '2025-01-30 07:52:31', NULL);
INSERT INTO `roles` VALUES ('c377e432-f113-4850-b80e-cd053a1a40b0', 'TEACHER', '2025-03-22 07:26:30', '2025-03-22 07:26:30', NULL);

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `room` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (3, 'Room 1', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '2024-06-01 07:47:16', '2024-06-03 09:54:32');
INSERT INTO `rooms` VALUES (4, 'Room 2', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-04 15:41:50', '2024-06-04 15:41:50');
INSERT INTO `rooms` VALUES (5, 'Room 3', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-04 15:42:29', '2024-06-04 15:42:29');
INSERT INTO `rooms` VALUES (6, 'Room 4', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-04 15:42:40', '2024-06-04 15:42:40');
INSERT INTO `rooms` VALUES (7, 'Room 5', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-04 15:42:49', '2024-06-04 15:42:49');
INSERT INTO `rooms` VALUES (8, 'Room 6', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-09 02:26:09', '2024-06-09 02:26:09');

-- ----------------------------
-- Table structure for schools
-- ----------------------------
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `khmer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` tinyint UNSIGNED NULL DEFAULT 0,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `schools_code_index`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schools
-- ----------------------------

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name_latin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name_latin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint NOT NULL,
  `dob` date NOT NULL,
  `village_birth` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commune_birth` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_birth` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_birth` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `d_last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `d_job` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `d_phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_job` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `village` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commune` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `student_status` tinyint NULL DEFAULT NULL,
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `photo_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `g_first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_job` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_gender` tinyint NULL DEFAULT NULL,
  `g_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `students_code_unique`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('20c1eec3-b445-43c8-a12f-e9344ef7bc2f', '007', 'សេរ៉ា', 'ឡេង', 'SERA', 'LENG', 2, '2000-02-11', 'អូរដំបង', 'អូរដំបង', 'បប', 'បប', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'អូរដំបង', 'អូរដំបង', 'បប', 'បប', '0', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-04 15:04:47', '2024-06-04 15:04:47');
INSERT INTO `students` VALUES ('4542035f-3561-4b93-a10c-6e867b6122cc', '008', 'វឌ្ឍនាកា', 'ចាន់', 'VATANAKA', 'CHAN', 1, '2000-12-31', 'អូរដំបង', 'អូរដំបង', 'បប', 'បប', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'អូរដំបង', 'អូរដំបង', 'បប', 'បប', '0', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-04 15:10:29', '2024-06-04 15:10:29');
INSERT INTO `students` VALUES ('7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', '013', 'អាំង', 'មឹក', 'ANG', 'MEK', 2, '2000-09-09', 'ដូនទាវ', 'ដូនទាវ', 'បប', 'បប', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ដូនទាវ', 'ដូនទាវ', 'បប', 'បប', '0', 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-17 15:45:18', '2024-07-19 04:09:41');
INSERT INTO `students` VALUES ('73f0df98-3935-4f48-bbd4-301f695296b6', '002', 'វិរៈ', 'ឆាយ', 'vireak', 'chay', 1, '2009-12-30', 'ហប់', 'ហប់', 'គាស់ក្រឡ', 'បាត់ដំបង', 'ឆាយ', 'ជា', 'Admin officer', '098080878', 'ធីតា', 'សឹម', 'Admin officer', '098080878', 'ហប់', 'ហប់', 'គាស់ក្រឡ', 'បាត់ដំបង', '09898974', 1, 'btb', NULL, 'good health', 1, 'ធីតា', 'សឹម', '098080878', 'Admin officer', NULL, 'father', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-05-20 04:21:34', '2024-05-20 04:21:34');
INSERT INTO `students` VALUES ('8991ab07-c393-478c-8e27-711cdb406013', '0022', 'រស្មី', 'ទេព', 'REAKSMEY', 'TEP', 1, '2025-01-27', 'BTB', 'BTB', 'BTB', 'BTB', 'សុខ', 'សង្ហា', NULL, '0230222', 'ម', 'ម៉ាក់', NULL, NULL, 'BMC', 'BMC', 'BMC', 'BMC', '0936654', 1, NULL, 'student/January2025/Q9YqJaoKodcy4BGPFOIkYsTvjGyfBUMpOQz9QBH6.png', NULL, 1, NULL, 'ញញេញគ', NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-27 13:11:12', '2025-01-27 13:11:12');
INSERT INTO `students` VALUES ('a62dc907-f008-4959-a090-01b2ea3c1d10', '011', 'តេវ', 'ដា', 'TEV', 'DA', 1, '2002-11-11', 'កាប់គោ', 'កាប់គោ', 'បប', 'បប', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'កាប់គោ', 'កាប់គោ', 'បប', 'បប', '0', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-17 15:42:31', '2024-06-17 15:42:31');
INSERT INTO `students` VALUES ('a94c218e-5f55-48e7-b69d-fa18d64f48eb', '004', 'តុលា', 'តយ', 'Tola', 'TOY', 1, '2000-01-22', 'កាប់គោ', 'អូរចារ', 'បប', 'បប', 'ជា', 'តយ', NULL, NULL, 'បុផ្ផា', 'រឿន', NULL, NULL, 'កាប់គោ', 'អូរចារ', 'បប', 'បប', '0', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-06-04 04:06:35', '2024-06-04 04:07:24');
INSERT INTO `students` VALUES ('bd50ed81-4d73-4d35-907a-e311374cbd05', '009', 'ចន្ធា', 'សៀង', 'CHANTHEA', 'SEANG', 2, '1998-09-09', 'កម្មករ', 'កម្មករ', 'បប', 'បប', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'កម្មករ', 'កម្មករ', 'បប', 'បប', '0', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-04 15:20:46', '2024-06-04 15:20:46');
INSERT INTO `students` VALUES ('bf3d1f47-607c-4011-94f9-c84b912deb79', '0001', 'វិសាល', 'សែម', 'VISAL', 'SEM', 2, '2025-01-24', 'bb', 'bb', 'bb', 'bb', 'ទៀន', 'តន', NULL, NULL, 'ម៉ា', 'កុង', NULL, NULL, 'bb', 'vv', 'vv', 'vv', '0964218913', 1, NULL, 'student/January2025/OpaDklHxaThkATMEBIQknVLp7suKVijVUDNT9bfW.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-25 07:48:00', '2025-01-25 08:00:09');
INSERT INTO `students` VALUES ('cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', '012', 'ហេវបាយ', 'ហៀង', 'HEVBAY', 'HEANG', 2, '2002-09-09', 'បឹងរាំង', 'បឹងរាំង', 'បប', 'បប', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'បឹងរាំង', 'បឹងរាំង', 'បប', 'បប', '0', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-17 15:43:52', '2024-06-17 15:43:52');
INSERT INTO `students` VALUES ('e82a5646-4c16-4ebd-9628-eadae51c36b6', '1245', 'ដេវិត', 'ដួង', 'DEVID', 'DOUNG', 1, '2025-02-11', 'KAB', 'KO', 'BTB', 'BTB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HAB', 'NU', 'NO', 'BTB', '096754987', 1, NULL, 'student/February2025/x2BsnCr4ls80SPuUg3N0ByeQMHbOcmzSdKjyEfOy.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-02-10 15:01:00', '2025-02-10 15:01:00');
INSERT INTO `students` VALUES ('e8af7126-125d-440a-ba5a-1cbb58cdc901', '010', 'សារឿន', 'ប៉យ', 'SAREARN', 'BOUY', 2, '2000-09-09', '២០ឧសភា', '២០ឧសភា', 'បប', 'បប', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '២០ឧសភា', '២០ឧសភា', 'បប', 'បប', '0', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-04 15:22:31', '2024-06-04 15:22:31');
INSERT INTO `students` VALUES ('ebc665e5-731e-4ba7-bf1c-7d5a214a5648', '006', 'ម៉ក់', 'លី', 'MORK', 'LY', 1, '2002-11-02', 'អូរចារ', 'អូរចារ', 'បប', 'បប', 'កយ', 'ម៉ក', NULL, NULL, 'ផង', 'លក្ខណា', NULL, NULL, 'អូរចារ', 'អូរចារ', 'បប', 'បប', '01292841', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2024-05-26 15:45:02', '2024-06-04 14:40:50');
INSERT INTO `students` VALUES ('ed0e3b9c-a80d-41d8-a9f0-f5e945b8f279', '005', 'សំនេត', 'ធី', 'SOMNET', 'THY', 1, '1999-12-31', 'សំរោង២', 'សំរោង២', 'បប', 'បប', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'សំរោង២', 'សំរោង២', 'បប', 'បប', '0', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-04 14:40:37', '2024-06-04 14:40:37');
INSERT INTO `students` VALUES ('f89276e2-2d2f-4f9a-ba9d-ebcbad908a8d', '003', 'រ៉ា', 'ដឿន', 'RA', 'DOUEN', 2, '1999-12-31', '្ហ', 'ហក្', 'ហ', 'ហ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ក្ហ', 'ហ', 'ក្', 'ក', '097642512', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2024-06-04 04:16:13', '2024-06-04 04:16:13');

-- ----------------------------
-- Table structure for studies
-- ----------------------------
DROP TABLE IF EXISTS `studies`;
CREATE TABLE `studies`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_finised` tinyint(1) NOT NULL DEFAULT 0,
  `is_new` tinyint(1) NOT NULL DEFAULT 0,
  `stop_date` date NULL DEFAULT NULL,
  `transfer_date` date NULL DEFAULT NULL,
  `remove_date` date NULL DEFAULT NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '!= 1 => បានផ្ទេរ',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `studies_academic_class_id_index`(`academic_class_id` ASC) USING BTREE,
  INDEX `studies_student_id_index`(`student_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of studies
-- ----------------------------
INSERT INTO `studies` VALUES ('27026ac3-5891-404d-b739-21ab054de430', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-01-27 07:49:19', '2025-01-27 07:49:19');
INSERT INTO `studies` VALUES ('74b8691c-ba09-4a20-a393-e7c2a2aad6f6', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-01-27 07:49:19', '2025-01-27 07:49:19');
INSERT INTO `studies` VALUES ('4486e38d-a173-4569-b27e-b10b5e641e63', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'bf3d1f47-607c-4011-94f9-c84b912deb79', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-01-27 07:49:19', '2025-01-27 07:49:19');
INSERT INTO `studies` VALUES ('4252b813-5a09-4de8-ab38-79574ea551e7', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-01-27 07:49:19', '2025-01-27 07:49:19');
INSERT INTO `studies` VALUES ('f2e5179a-7028-4ae6-a7ad-4d9ab445c7ee', 'c7629583-fcc3-4ff2-afbd-404e1a21e4bb', 'a94c218e-5f55-48e7-b69d-fa18d64f48eb', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-01-27 08:54:34', '2025-01-27 08:54:34');
INSERT INTO `studies` VALUES ('b135090a-4c6e-46be-8c0b-29f07356f26b', 'ace7d903-c156-467c-b113-52d2774d6285', '00b4705f-a49c-4a0a-bf2d-84ca8819ca24', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 0, NULL, '2025-01-27 09:42:01', '2025-02-10 15:16:49');
INSERT INTO `studies` VALUES ('44aa8c30-bb84-437c-bdf7-493a31e6a9e7', 'ace7d903-c156-467c-b113-52d2774d6285', 'bf3d1f47-607c-4011-94f9-c84b912deb79', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-01-27 09:42:01', '2025-01-27 09:42:01');
INSERT INTO `studies` VALUES ('9d3e890f-b278-494b-abb4-0841d3e1b1c2', 'ace7d903-c156-467c-b113-52d2774d6285', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-01-27 09:42:01', '2025-01-27 09:42:01');
INSERT INTO `studies` VALUES ('077715c8-f2e5-42b5-aeb0-81e6a7b345cc', 'ace7d903-c156-467c-b113-52d2774d6285', 'e82a5646-4c16-4ebd-9628-eadae51c36b6', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:24', '2025-02-10 15:13:24');
INSERT INTO `studies` VALUES ('80599e57-ffab-4d84-ad87-7f1fabf4d7af', 'ace7d903-c156-467c-b113-52d2774d6285', '8991ab07-c393-478c-8e27-711cdb406013', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:24', '2025-02-10 15:13:24');
INSERT INTO `studies` VALUES ('7fed63d3-818b-49a4-a0a8-c862e46aa755', 'ace7d903-c156-467c-b113-52d2774d6285', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:24', '2025-02-10 15:13:24');
INSERT INTO `studies` VALUES ('a6d5ef03-162b-4197-942e-319a679a8ec5', 'ace7d903-c156-467c-b113-52d2774d6285', 'e82a5646-4c16-4ebd-9628-eadae51c36b6', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('ca55161e-ce9d-46b3-a5a3-4e5f4fe96ab0', 'ace7d903-c156-467c-b113-52d2774d6285', '8991ab07-c393-478c-8e27-711cdb406013', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('6c6781a3-dc2e-45d6-888e-660ce6aef863', 'ace7d903-c156-467c-b113-52d2774d6285', 'cbf6c3d8-70e7-4e43-bd31-dd0a2d3b161e', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('ba15e7b9-9aa8-43cd-912e-b8c6e4d2394a', 'ace7d903-c156-467c-b113-52d2774d6285', 'a62dc907-f008-4959-a090-01b2ea3c1d10', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 2, NULL, '2025-02-10 15:13:52', '2025-02-10 15:17:20');
INSERT INTO `studies` VALUES ('61c2c30e-10bd-4bc9-a507-f11f76cd0355', 'ace7d903-c156-467c-b113-52d2774d6285', 'e8af7126-125d-440a-ba5a-1cbb58cdc901', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('209769db-fd5d-4d8e-8cc0-8f96b3f27978', 'ace7d903-c156-467c-b113-52d2774d6285', 'bd50ed81-4d73-4d35-907a-e311374cbd05', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('0f1b212a-6a42-46c1-9fa2-872b0ef513f5', 'ace7d903-c156-467c-b113-52d2774d6285', '4542035f-3561-4b93-a10c-6e867b6122cc', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('3ad49437-5e1e-4f14-8498-35cdf38d077e', 'ace7d903-c156-467c-b113-52d2774d6285', '20c1eec3-b445-43c8-a12f-e9344ef7bc2f', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('59bee79e-08cc-4344-8614-51f0845892ae', 'ace7d903-c156-467c-b113-52d2774d6285', 'ed0e3b9c-a80d-41d8-a9f0-f5e945b8f279', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('3304d1cc-e5f8-463d-8974-7c954aab52c7', 'ace7d903-c156-467c-b113-52d2774d6285', 'f89276e2-2d2f-4f9a-ba9d-ebcbad908a8d', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('fcd1461f-c4b4-48a7-9fba-7887df019bc8', 'ace7d903-c156-467c-b113-52d2774d6285', 'a94c218e-5f55-48e7-b69d-fa18d64f48eb', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('b21d91e0-37e7-4a08-9efb-21e5e6dad6a2', 'ace7d903-c156-467c-b113-52d2774d6285', 'ebc665e5-731e-4ba7-bf1c-7d5a214a5648', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('80050792-4372-45bc-9ed7-8c7fff7cd011', 'ace7d903-c156-467c-b113-52d2774d6285', '73f0df98-3935-4f48-bbd4-301f695296b6', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:13:52', '2025-02-10 15:13:52');
INSERT INTO `studies` VALUES ('2f91104b-0eb9-40fe-b68d-186736cc6f2d', 'ace7d903-c156-467c-b113-52d2774d6285', '1199c7e1-2ebe-4151-8121-07cd8c3b7c78', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-10 15:14:07', '2025-02-10 15:14:07');
INSERT INTO `studies` VALUES ('a544b51c-4624-4e28-8d86-050735d6c2ad', 'e9d45398-6363-4907-abef-88dfdd878ce0', '7383104f-e7e9-4fc9-9aff-9959d2dc2fa7', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 2, NULL, '2025-02-11 03:47:34', '2025-02-11 03:47:40');
INSERT INTO `studies` VALUES ('41eb78fc-8449-44fe-a793-b65927030cb0', 'e9d45398-6363-4907-abef-88dfdd878ce0', '8991ab07-c393-478c-8e27-711cdb406013', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-11 04:31:53', '2025-02-11 04:31:53');
INSERT INTO `studies` VALUES ('75059d9a-507b-48a9-ae6e-a2c44849a4ca', 'e9d45398-6363-4907-abef-88dfdd878ce0', 'bf3d1f47-607c-4011-94f9-c84b912deb79', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', 2, NULL, '2025-02-11 04:31:53', '2025-02-11 04:32:19');
INSERT INTO `studies` VALUES ('3e89da90-f856-4b92-9e8b-450fbb3cf837', 'e9d45398-6363-4907-abef-88dfdd878ce0', 'bd50ed81-4d73-4d35-907a-e311374cbd05', NULL, 0, 0, NULL, NULL, NULL, '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, 1, NULL, '2025-02-11 04:31:53', '2025-02-11 04:31:53');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_latin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sex` tinyint NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `photo_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `teachers_code_index`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('2bbe31ef-82ac-43c6-9085-239e73d80cf3', '001', 'សន សីហា', 'SORN SEYHA', 1, '2025-01-23', NULL, 'បាត់ដំបង', NULL, 'គ្រូបង្រៀន', '0', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-24 12:55:28', '2025-01-24 12:55:28');
INSERT INTO `teachers` VALUES ('ab78010c-8693-4819-8e49-583315675494', '002', 'កែវ វណ្ណដា', 'KEO VANNDA', 1, '2025-01-14', NULL, 'បន្ទាយមានជ័យ', NULL, 'គ្រូបង្រៀន', '09732123', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-24 13:09:09', '2025-01-24 12:56:40', '2025-01-24 13:09:09');
INSERT INTO `teachers` VALUES ('ad0bb5d3-b907-4385-9bc7-4566fdc5341c', '003', 'កែន តន', 'KEN TORN', 2, '2022-01-24', NULL, 'បន្ទាយមានជ័យ', 'បាត់ដំបង', 'គ្រូជំនួយ', '0', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, NULL, '2025-01-24 13:12:00', '2025-01-24 13:12:00');
INSERT INTO `teachers` VALUES ('f8dff761-6cd9-4e2a-a465-1267b6520eda', '004', 'សោម រ៉ាហ្វាត់', 'SORM RAFAT', 1, '2013-06-05', 'teacher/January2025/WA84LzNqLgNuYYQSltQ2u37kHdH3uLV0TsYCUnzA.jpg', 'តាកែវ', NULL, 'គ្រូបង្រៀនក្រៅ', '01234789', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', NULL, '2025-01-24 13:17:10', '2025-01-27 13:07:56');
INSERT INTO `teachers` VALUES ('77372cab-8524-48a8-aa36-6adf8a646e7b', '0047', 'រស្មី', 'Reaksmey', 1, '2025-02-02', 'teacher/February2025/R85sEPY9l8Wwz3isW3x9LlbO0EcNvHM9pPP4hju3.png', NULL, NULL, 'គ្រូបង្រៀន', '093554241', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '2025-02-10 14:57:00', '2025-02-10 14:56:05', '2025-02-10 14:57:00');
INSERT INTO `teachers` VALUES ('ad404cd9-c3e0-42bb-912f-94a3eaa01d9f', '0005', 'គួច ដេវិត', 'KHOCH DAVID', 1, '2000-12-02', 'teacher/February2025/TZH2D4g7NNjJbI5ryDZL2sGHn4Pim2ZuyQvvwZUz.jpg', 'បាត់ដំបង', 'បាត់ដំបង', 'គ្រូបង្រៀនជំនួយ', '0124124124', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '2025-02-11 04:28:26', '2025-02-11 04:27:03', '2025-02-11 04:28:26');

-- ----------------------------
-- Table structure for times
-- ----------------------------
DROP TABLE IF EXISTS `times`;
CREATE TABLE `times`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of times
-- ----------------------------
INSERT INTO `times` VALUES (1, '1-2', NULL, NULL, NULL, NULL);
INSERT INTO `times` VALUES (2, '2-3', NULL, NULL, NULL, NULL);
INSERT INTO `times` VALUES (3, '3-4', NULL, NULL, NULL, NULL);
INSERT INTO `times` VALUES (4, '4-5', NULL, NULL, NULL, NULL);
INSERT INTO `times` VALUES (5, '5-6', NULL, NULL, NULL, NULL);
INSERT INTO `times` VALUES (6, '6-7', NULL, NULL, NULL, NULL);
INSERT INTO `times` VALUES (7, '7-8', NULL, NULL, NULL, NULL);
INSERT INTO `times` VALUES (9, '12-1', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '6a0652a1-c83f-4233-9bdb-85ce5851dca7', '2025-02-11 01:09:23', '2025-02-11 01:09:35');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `owner` tinyint(1) NOT NULL DEFAULT 0,
  `is_super` tinyint(1) NOT NULL DEFAULT 0,
  `photo_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username` ASC) USING BTREE,
  INDEX `users_school_id_index`(`school_id` ASC) USING BTREE,
  INDEX `users_teacher_id_index`(`teacher_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('6a0652a1-c83f-4233-9bdb-85ce5851dca7', '57', NULL, 'admin', 'admin@admin.com', NULL, '$2y$10$pNL8RVTvQxiWlLcsSfixzupc1xGGY9Z9JmN.JuKOaxJLar3fVSjJK', 1, 1, 'user/January2025/L4ynfIG5gcltNa2IFU3OJsOmfj7qvI1T9HGReqFu.png', NULL, NULL, '2025-01-25 09:18:08', NULL);
INSERT INTO `users` VALUES ('bf252cb8-b9bb-4bfc-8777-66bf5a9b2e72', '57', NULL, 'smey', 'smey@gmail.com', NULL, '$2y$10$3ZsBNWbmphDjq.KFuWWcouGZ.iuTNcq6YcyUNcwseE1FIlT1AGbcC', 0, 0, NULL, NULL, '2025-01-23 15:50:29', '2025-01-23 15:50:29', NULL);
INSERT INTO `users` VALUES ('c26e4b34-da70-4f15-9b0c-8e337822af97', '57', NULL, 'rafat', 'rafat@gmail.com', NULL, '$2y$10$7tjYlGQMAguDumZ1vG8SPey8G0zv/.7izjddvSc9LZ.5oYFM0qnFy', 0, 0, NULL, NULL, '2025-01-25 09:20:07', '2025-01-25 09:20:07', NULL);
INSERT INTO `users` VALUES ('c6ec88fc-ee64-47bb-af3d-d4cd8b44a095', '57', NULL, 'sds', 'sdd@gmail.com', NULL, '$2y$10$15Zan26Xw1a49o8.JBxlleVYGHShwOUwxLJVuScXy2JbPUtcNzS7i', 0, 0, NULL, NULL, '2025-03-22 07:29:14', '2025-03-22 07:49:25', NULL);

SET FOREIGN_KEY_CHECKS = 1;
