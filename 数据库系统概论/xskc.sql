/*
 Navicat Premium Data Transfer

 Source Server         : pc
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : xskc

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 30/09/2024 14:54:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `Cno` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ccredit` smallint NULL DEFAULT NULL,
  `Cpno` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Cno`) USING BTREE,
  INDEX `Cpno`(`Cpno` ASC) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Cpno`) REFERENCES `course` (`Cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('81001', '程序设计基础与C语言', 4, NULL);
INSERT INTO `course` VALUES ('81002', '数据结构', 4, '81001');
INSERT INTO `course` VALUES ('81003', '数据库系统概论', 4, '81002');
INSERT INTO `course` VALUES ('81004', '信息系统概论', 4, '81003');
INSERT INTO `course` VALUES ('81005', '操作系统', 4, '81001');
INSERT INTO `course` VALUES ('81006', 'Python语言', 3, '81002');
INSERT INTO `course` VALUES ('81007', '离散数学', 4, NULL);
INSERT INTO `course` VALUES ('81008', '大数据技术概论', 4, '81003');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `Sno` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cno` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Grade` smallint NULL DEFAULT NULL,
  `Semester` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Teachingclass` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`, `Cno`) USING BTREE,
  INDEX `Cno`(`Cno` ASC) USING BTREE,
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('20180001', '81001', 85, '20192', '81001-01');
INSERT INTO `sc` VALUES ('20180001', '81002', 96, '20201', '81002-01');
INSERT INTO `sc` VALUES ('20180001', '81003', 87, '20202', '81003-01');
INSERT INTO `sc` VALUES ('20180002', '81001', 80, '20192', '81001-02');
INSERT INTO `sc` VALUES ('20180002', '81002', 98, '20201', '81002-01');
INSERT INTO `sc` VALUES ('20180002', '81003', 71, '20202', '81003-02');
INSERT INTO `sc` VALUES ('20180003', '81001', 81, '20192', '81001-01');
INSERT INTO `sc` VALUES ('20180003', '81002', 76, '20201', '81002-02');
INSERT INTO `sc` VALUES ('20180004', '81001', 56, '20192', '81001-02');
INSERT INTO `sc` VALUES ('20180004', '81002', 97, '20201', '81002-02');
INSERT INTO `sc` VALUES ('20180005', '81003', 68, '20202', '81003-01');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Sno` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Sname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Ssex` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Sbirthdate` date NULL DEFAULT NULL,
  `Smajor` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`) USING BTREE,
  UNIQUE INDEX `Sname`(`Sname` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('20180001', '李勇', '男', '2000-03-08', '信息安全');
INSERT INTO `student` VALUES ('20180002', '刘晨', '女', '1999-09-01', '计算机科学与技术');
INSERT INTO `student` VALUES ('20180003', '王敏', '女', '2001-08-01', '计算机科学与技术');
INSERT INTO `student` VALUES ('20180004', '张立', '女', '2000-01-08', '计算机科学与技术');
INSERT INTO `student` VALUES ('20180005', '陈新奇', '男', '2001-11-01', '信息管理与信息系统');
INSERT INTO `student` VALUES ('20180006', '赵明', '男', '2000-06-12', '数据科学与大数据技术');
INSERT INTO `student` VALUES ('20180007', '王佳佳', '女', '2001-12-07', '数据科学与大数据技术');

SET FOREIGN_KEY_CHECKS = 1;
