/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : db_wechat

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-10-22 16:51:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_access
-- ----------------------------
DROP TABLE IF EXISTS `cms_access`;
CREATE TABLE `cms_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of cms_access
-- ----------------------------

-- ----------------------------
-- Table structure for cms_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cms_auth_rule`;
CREATE TABLE `cms_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员权限规则表';

-- ----------------------------
-- Records of cms_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for cms_office
-- ----------------------------
DROP TABLE IF EXISTS `cms_office`;
CREATE TABLE `cms_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parentId` int(11) NOT NULL COMMENT '父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sequence` int(11) NOT NULL COMMENT '排序',
  `areaId` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` tinyint(1) NOT NULL COMMENT '机构类型',
  `grade` tinyint(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `zipCode` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `isEnabled` tinyint(1) DEFAULT NULL,
  `isVisible` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  `primary_person` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
  `deputy_person` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
  `create` int(11) NOT NULL COMMENT '创建者',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int(11) NOT NULL COMMENT '更新者',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  KEY `isEnabled` (`isEnabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

-- ----------------------------
-- Records of cms_office
-- ----------------------------

-- ----------------------------
-- Table structure for cms_role_office
-- ----------------------------
DROP TABLE IF EXISTS `cms_role_office`;
CREATE TABLE `cms_role_office` (
  `roleId` int(11) NOT NULL COMMENT '角色编号',
  `officeId` int(11) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`roleId`,`officeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

-- ----------------------------
-- Records of cms_role_office
-- ----------------------------

-- ----------------------------
-- Table structure for crap_api
-- ----------------------------
DROP TABLE IF EXISTS `crap_api`;
CREATE TABLE `crap_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '接口名',
  `url` varchar(100) NOT NULL COMMENT '地址',
  `method` varchar(30) NOT NULL COMMENT '请求方法',
  `trueExam` text COMMENT '正确返回样例',
  `falseExam` text COMMENT '错误返回样例',
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `moduleId` varchar(50) NOT NULL COMMENT '模块ID',
  `remark` text COMMENT '备注',
  `errors` text COMMENT '错误信息：json格式',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `updateBy` varchar(100) NOT NULL COMMENT '更新人',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `sequence` int(11) NOT NULL DEFAULT '0' COMMENT '排序：排序，越大越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CrapApi—接口表（interfa）';

-- ----------------------------
-- Records of crap_api
-- ----------------------------

-- ----------------------------
-- Table structure for crap_error_code
-- ----------------------------
DROP TABLE IF EXISTS `crap_error_code`;
CREATE TABLE `crap_error_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorCode` varchar(50) NOT NULL COMMENT '错误码编码',
  `errorMsg` varchar(128) NOT NULL COMMENT '错误码描述',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crap_error_code
-- ----------------------------

-- ----------------------------
-- Table structure for crap_param_request
-- ----------------------------
DROP TABLE IF EXISTS `crap_param_request`;
CREATE TABLE `crap_param_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '参数名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口请求参数';

-- ----------------------------
-- Records of crap_param_request
-- ----------------------------

-- ----------------------------
-- Table structure for crap_param_response
-- ----------------------------
DROP TABLE IF EXISTS `crap_param_response`;
CREATE TABLE `crap_param_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口响应返回参数';

-- ----------------------------
-- Records of crap_param_response
-- ----------------------------

-- ----------------------------
-- Table structure for crawler_image
-- ----------------------------
DROP TABLE IF EXISTS `crawler_image`;
CREATE TABLE `crawler_image` (
  `userCode` varchar(64) DEFAULT NULL,
  `boardId` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `type` varchar(32) DEFAULT NULL COMMENT '数据类型',
  `remark` text COMMENT '对内容的描述 ',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间',
  `source` varchar(32) DEFAULT NULL,
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网络爬虫-图片';

-- ----------------------------
-- Records of crawler_image
-- ----------------------------

-- ----------------------------
-- Table structure for os_api_parameter
-- ----------------------------
DROP TABLE IF EXISTS `os_api_parameter`;
CREATE TABLE `os_api_parameter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '参数名',
  `value` varchar(64) DEFAULT NULL COMMENT '参数值',
  `create` int(11) DEFAULT NULL COMMENT '创建者',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '更新者',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口参数表';

-- ----------------------------
-- Records of os_api_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for os_email_records
-- ----------------------------
DROP TABLE IF EXISTS `os_email_records`;
CREATE TABLE `os_email_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tomail` int(11) DEFAULT NULL COMMENT '收件人',
  `frommail` int(11) DEFAULT NULL COMMENT '发件人',
  `subject` varchar(128) DEFAULT NULL COMMENT '邮件标题',
  `message` text COMMENT '邮件内容',
  `charset` int(11) DEFAULT NULL COMMENT '邮件编码（字典表）',
  `emailType` tinyint(4) DEFAULT NULL COMMENT '邮箱类型：0.找回密码；1.注册；2.改变邮箱；3.通知',
  `level` int(11) DEFAULT NULL COMMENT '邮件紧急级别',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录插入时间',
  `appid` int(11) DEFAULT NULL COMMENT '来源应用id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '链接是否已失效：0.失效；1.未失效；',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件发送记录';

-- ----------------------------
-- Records of os_email_records
-- ----------------------------

-- ----------------------------
-- Table structure for sys_datasource
-- ----------------------------
DROP TABLE IF EXISTS `sys_datasource`;
CREATE TABLE `sys_datasource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceName` varchar(30) NOT NULL COMMENT '连接名称',
  `dbUrl` varchar(128) NOT NULL COMMENT '数据库连接url',
  `dbUserName` varchar(30) NOT NULL COMMENT '数据库登陆用户名',
  `dbPassword` varchar(64) NOT NULL COMMENT '数据库登陆密码',
  `jdbcName` varchar(128) NOT NULL COMMENT ' 数据库连接驱动',
  `databaseType` varchar(64) NOT NULL COMMENT '数据库类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据源配置';

-- ----------------------------
-- Records of sys_datasource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(128) NOT NULL COMMENT '字典类型的中文名称:同种类型下唯一性',
  `itemCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字典类型的编码:同种类型下唯一性',
  `sequence` int(11) NOT NULL COMMENT '排顺字段：越大越靠前',
  `parentId` int(11) NOT NULL,
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效;-1:删除;0:不可用,默认值;1:可用',
  `allowEdit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许编辑;1:允许,默认值;0:不允许',
  `allowDelete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许删除;1:允许删除,默认值,0:不允许删除',
  `create` int(11) NOT NULL COMMENT ' 最初创建者',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` int(11) NOT NULL COMMENT '最后修改人',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据最后更新时间',
  `remark` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemCode` (`itemCode`,`isEnabled`) USING BTREE,
  KEY `isEnabled` (`isEnabled`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '系统参数', 'sysParams', '1', '0', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('2', '业务参数', 'serviceParams', '2', '0', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('3', '其他参数', 'otherParams', '3', '0', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('4', '机构分类', 'organizeCategory', '1', '3', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('5', '角色类型', 'roleType', '2', '3', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('6', '数据库类型', 'dbType', '3', '3', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('7', '系统日志', 'dbLogType', '4', '3', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('8', '审核状态', 'auditState', '5', '3', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('9', '证件名称', 'certificate', '6', '3', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('10', '学历', 'education', '7', '3', '1', '1', '1', '1', '2017-04-11 12:27:25', '1', '2017-04-11 12:27:25', null);
INSERT INTO `sys_dict` VALUES ('11', '婚姻', 'marriage', '8', '3', '1', '1', '1', '1', '2017-04-11 14:03:44', '1', '2017-04-11 14:03:44', null);
INSERT INTO `sys_dict` VALUES ('12', '生育', 'fertility', '9', '3', '1', '1', '1', '1', '2017-04-11 14:06:08', '1', '2017-04-11 14:06:08', null);
INSERT INTO `sys_dict` VALUES ('13', '民族', 'nation', '10', '3', '1', '1', '1', '1', '2017-04-11 14:06:21', '1', '2017-04-11 14:06:21', null);
INSERT INTO `sys_dict` VALUES ('14', '性别', 'sex', '11', '3', '1', '1', '1', '1', '2017-04-11 14:02:07', '1', '2017-04-11 14:02:07', null);
INSERT INTO `sys_dict` VALUES ('15', '健康状况', 'heathType', '1', '4', '1', '1', '1', '1', '2017-04-11 13:48:43', '1', '2017-04-11 13:48:43', null);
INSERT INTO `sys_dict` VALUES ('16', '系统角色', 'sysRole', '1', '5', '1', '1', '1', '1', '2017-05-19 16:53:30', '1', '2017-05-19 16:53:30', null);
INSERT INTO `sys_dict` VALUES ('17', '业务角色', 'busRole', '2', '5', '1', '1', '1', '1', '2017-05-19 16:54:00', '1', '2017-05-19 16:54:00', null);
INSERT INTO `sys_dict` VALUES ('18', '其他角色', 'otherRole', '3', '5', '1', '1', '1', '1', '2017-05-19 16:54:07', '1', '2017-05-19 16:54:07', null);
INSERT INTO `sys_dict` VALUES ('19', 'SqlServer', 'sqlServer', '1', '6', '1', '1', '1', '1', '2017-04-11 14:06:30', '1', '2017-04-11 14:06:30', null);
INSERT INTO `sys_dict` VALUES ('20', 'Oracle', 'oracle', '2', '6', '1', '1', '1', '1', '2017-04-11 14:06:37', '1', '2017-04-11 14:06:37', null);
INSERT INTO `sys_dict` VALUES ('21', 'MySql', 'mySql', '3', '6', '1', '1', '1', '1', '2017-04-11 14:06:42', '1', '2017-04-11 14:06:42', null);
INSERT INTO `sys_dict` VALUES ('22', '登录', 'login', '1', '7', '1', '1', '1', '1', '2017-04-11 13:48:43', '1', '2017-04-11 13:48:43', null);
INSERT INTO `sys_dict` VALUES ('23', '退出', 'exit', '2', '7', '1', '1', '1', '1', '2017-04-11 13:48:43', '1', '2017-04-11 13:48:43', null);
INSERT INTO `sys_dict` VALUES ('24', '访问', 'visit', '3', '7', '1', '1', '1', '1', '2017-04-11 13:48:43', '1', '2017-04-11 13:48:43', null);
INSERT INTO `sys_dict` VALUES ('25', '新增', 'create', '4', '7', '1', '1', '1', '1', '2017-04-11 13:48:43', '1', '2017-04-11 13:48:43', null);
INSERT INTO `sys_dict` VALUES ('26', '删除', 'delete', '5', '7', '1', '1', '1', '1', '2017-04-11 13:48:44', '1', '2017-04-11 13:48:44', null);
INSERT INTO `sys_dict` VALUES ('27', '修改', 'update', '6', '7', '1', '1', '1', '1', '2017-04-11 13:48:44', '1', '2017-04-11 13:48:44', null);
INSERT INTO `sys_dict` VALUES ('28', '提交', 'submit', '7', '7', '1', '1', '1', '1', '2017-04-11 13:48:44', '1', '2017-04-11 13:48:44', null);
INSERT INTO `sys_dict` VALUES ('29', '异常', 'exception', '8', '7', '1', '1', '1', '1', '2017-04-11 13:48:44', '1', '2017-04-11 13:48:44', null);
INSERT INTO `sys_dict` VALUES ('30', '其他', 'otherLog', '9', '7', '1', '1', '1', '1', '2017-05-19 20:21:30', '1', '2017-05-19 20:21:30', null);
INSERT INTO `sys_dict` VALUES ('31', '草稿', 'draft', '1', '8', '1', '1', '1', '1', '2017-05-19 16:55:13', '1', '2017-05-19 16:55:13', null);
INSERT INTO `sys_dict` VALUES ('32', '提交', 'commit', '2', '8', '1', '1', '1', '1', '2017-05-19 16:56:44', '1', '2017-05-19 16:56:44', null);
INSERT INTO `sys_dict` VALUES ('33', '通过', 'adopt', '3', '8', '1', '1', '1', '1', '2017-05-19 18:52:37', '1', '2017-05-19 18:52:37', null);
INSERT INTO `sys_dict` VALUES ('34', '待审', 'pend', '4', '8', '1', '1', '1', '1', '2017-05-19 18:53:01', '1', '2017-05-19 18:53:01', null);
INSERT INTO `sys_dict` VALUES ('35', '退回', 'return', '5', '8', '1', '1', '1', '1', '2017-05-19 18:53:08', '1', '2017-05-19 18:53:08', null);
INSERT INTO `sys_dict` VALUES ('36', '完成', 'complete', '6', '8', '1', '1', '1', '1', '2017-05-19 18:53:22', '1', '2017-05-19 18:53:22', null);
INSERT INTO `sys_dict` VALUES ('37', '废弃', 'scrap', '7', '8', '1', '1', '1', '1', '2017-05-19 18:53:45', '1', '2017-05-19 18:53:45', null);
INSERT INTO `sys_dict` VALUES ('38', '身份证', 'idCard', '1', '9', '1', '1', '1', '1', '2017-05-19 18:54:54', '1', '2017-05-19 18:54:54', null);
INSERT INTO `sys_dict` VALUES ('39', '士兵证', 'soldierCard', '2', '9', '1', '1', '1', '1', '2017-05-19 18:55:02', '1', '2017-05-19 18:55:02', null);
INSERT INTO `sys_dict` VALUES ('40', '军官证', 'OfficerCard', '3', '9', '1', '1', '1', '1', '2017-05-19 18:55:34', '1', '2017-05-19 18:55:34', null);
INSERT INTO `sys_dict` VALUES ('41', '护照', 'passport', '4', '9', '1', '1', '1', '1', '2017-05-19 18:55:47', '1', '2017-05-19 18:55:47', null);
INSERT INTO `sys_dict` VALUES ('42', '其它', 'otherCard', '5', '9', '1', '1', '1', '1', '2017-05-19 20:22:09', '1', '2017-05-19 20:22:09', null);
INSERT INTO `sys_dict` VALUES ('43', '小学', 'pSchool', '1', '10', '1', '1', '1', '1', '2017-05-19 18:56:29', '1', '2017-05-19 18:56:29', null);
INSERT INTO `sys_dict` VALUES ('44', '初中', 'mSchool', '2', '10', '1', '1', '1', '1', '2017-05-19 18:56:48', '1', '2017-05-19 18:56:48', null);
INSERT INTO `sys_dict` VALUES ('45', '高中', 'hSchool', '3', '10', '1', '1', '1', '1', '2017-05-19 18:57:04', '1', '2017-05-19 18:57:04', null);
INSERT INTO `sys_dict` VALUES ('46', '中专', 'sSchool', '4', '10', '1', '1', '1', '1', '2017-05-19 19:23:35', '1', '2017-05-19 19:23:35', null);
INSERT INTO `sys_dict` VALUES ('47', '大专', 'cSchool', '5', '10', '1', '1', '1', '1', '2017-05-19 19:23:47', '1', '2017-05-19 19:23:47', null);
INSERT INTO `sys_dict` VALUES ('48', '本科', 'undergraduate', '6', '10', '1', '1', '1', '1', '2017-05-19 19:23:59', '1', '2017-05-19 19:23:59', null);
INSERT INTO `sys_dict` VALUES ('49', '硕士', 'master', '7', '10', '1', '1', '1', '1', '2017-05-19 19:24:06', '1', '2017-05-19 19:24:06', null);
INSERT INTO `sys_dict` VALUES ('50', '博士', 'doctor', '8', '10', '1', '1', '1', '1', '2017-05-19 19:24:14', '1', '2017-05-19 19:24:14', null);
INSERT INTO `sys_dict` VALUES ('51', '其他', 'otherEdu', '9', '10', '1', '1', '1', '1', '2017-05-19 20:22:43', '1', '2017-05-19 20:22:43', null);
INSERT INTO `sys_dict` VALUES ('52', '已婚', 'married', '1', '11', '1', '1', '1', '1', '2017-05-19 19:24:43', '1', '2017-05-19 19:24:43', null);
INSERT INTO `sys_dict` VALUES ('53', '未婚', 'unmarried', '2', '11', '1', '1', '1', '1', '2017-05-19 19:24:49', '1', '2017-05-19 19:24:49', null);
INSERT INTO `sys_dict` VALUES ('54', '离异', 'divorce', '3', '11', '1', '1', '1', '1', '2017-05-19 19:24:59', '1', '2017-05-19 19:24:59', null);
INSERT INTO `sys_dict` VALUES ('55', '丧偶', 'widowed', '4', '11', '1', '1', '1', '1', '2017-05-19 19:25:10', '1', '2017-05-19 19:25:10', null);
INSERT INTO `sys_dict` VALUES ('56', '其他', 'otherMar', '5', '11', '1', '1', '1', '1', '2017-05-19 20:23:48', '1', '2017-05-19 20:23:48', null);
INSERT INTO `sys_dict` VALUES ('57', '已育', 'fertile', '1', '12', '1', '1', '1', '1', '2017-05-19 20:20:37', '1', '2017-05-19 20:20:37', null);
INSERT INTO `sys_dict` VALUES ('58', '未育', 'noChildren', '2', '12', '1', '1', '1', '1', '2017-05-19 20:23:05', '1', '2017-05-19 20:23:05', null);
INSERT INTO `sys_dict` VALUES ('59', '其他', 'other', '3', '12', '1', '1', '1', '1', '2017-05-19 20:29:26', '1', '2017-05-19 20:29:26', null);
INSERT INTO `sys_dict` VALUES ('60', '汉族', 'hanzu', '1', '13', '1', '1', '1', '1', '2017-05-19 20:26:58', '1', '2017-05-19 20:26:58', null);
INSERT INTO `sys_dict` VALUES ('61', '男', 'male', '1', '14', '1', '1', '1', '1', '2017-04-11 14:04:10', '1', '2017-04-11 14:04:10', null);
INSERT INTO `sys_dict` VALUES ('62', '女', 'female', '3', '14', '1', '1', '1', '1', '2017-04-11 14:04:10', '1', '2017-04-11 14:04:10', null);

-- ----------------------------
-- Table structure for sys_dict_china_city
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_china_city`;
CREATE TABLE `sys_dict_china_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `areaCode` varchar(20) NOT NULL COMMENT '行政区划代码',
  `areaName` varchar(50) NOT NULL COMMENT '所辖行政区',
  `areaType` varchar(10) DEFAULT NULL COMMENT '城乡分类',
  `parentId` int(11) NOT NULL COMMENT '父ID',
  `areaLevel` int(11) DEFAULT NULL COMMENT '行政区级别(类型   0：国家    1：省、直辖市   2：市  3：区   4：街道 、办事处  5：村委会、村)',
  `locationCode` varchar(20) DEFAULT NULL COMMENT '地理位置(省级行政区划分)',
  `economyCode` varchar(20) DEFAULT NULL COMMENT '经济位置(省级行政区划分)',
  `shortName` varchar(50) DEFAULT NULL COMMENT '简称',
  `areaUrl` varchar(258) DEFAULT NULL COMMENT '点击访问地址',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areaCode` (`areaCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3239 DEFAULT CHARSET=utf8 COMMENT='行政区域：省-市-县-镇-村';

-- ----------------------------
-- Records of sys_dict_china_city
-- ----------------------------
INSERT INTO `sys_dict_china_city` VALUES ('1', '110000', '北京市', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11.html', '2017-05-03 16:36:36', '2017-05-03 16:36:36');
INSERT INTO `sys_dict_china_city` VALUES ('2', '120000', '天津市', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12.html', '2017-05-03 16:36:36', '2017-05-03 16:36:36');
INSERT INTO `sys_dict_china_city` VALUES ('3', '130000', '河北省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13.html', '2017-05-03 16:36:36', '2017-05-03 16:36:36');
INSERT INTO `sys_dict_china_city` VALUES ('4', '140000', '山西省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('5', '150000', '内蒙古自治区', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('6', '210000', '辽宁省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('7', '220000', '吉林省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('8', '230000', '黑龙江省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('9', '310000', '上海市', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('10', '320000', '江苏省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('11', '330000', '浙江省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('12', '340000', '安徽省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('13', '350000', '福建省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('14', '360000', '江西省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('15', '370000', '山东省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('16', '410000', '河南省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('17', '420000', '湖北省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('18', '430000', '湖南省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('19', '440000', '广东省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('20', '450000', '广西壮族自治区', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('21', '460000', '海南省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('22', '500000', '重庆市', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('23', '510000', '四川省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('24', '520000', '贵州省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('25', '530000', '云南省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('26', '540000', '西藏自治区', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('27', '610000', '陕西省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('28', '620000', '甘肃省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('29', '630000', '青海省', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('30', '640000', '宁夏回族自治区', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('31', '650000', '新疆维吾尔自治区', '', '100000', '1', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('32', '710000', '台湾省', '', '100000', '1', null, null, null, '', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('33', '810000', '香港特别行政区', '', '100000', '1', null, null, null, '', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('34', '820000', '澳门特别行政区', '', '100000', '1', null, null, null, '', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('35', '900000', '钓鱼岛', '', '100000', '1', null, null, null, '', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('36', '110100000000', '市辖区', '', '1', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/1101.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('37', '110200000000', '县', '', '1', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/1102.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('38', '120100000000', '市辖区', '', '2', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/1201.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('39', '120200000000', '县', '', '2', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/1202.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('40', '130100000000', '石家庄市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1301.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('41', '130200000000', '唐山市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1302.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('42', '130300000000', '秦皇岛市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1303.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('43', '130400000000', '邯郸市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1304.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('44', '130500000000', '邢台市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1305.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('45', '130600000000', '保定市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1306.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('46', '130700000000', '张家口市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1307.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('47', '130800000000', '承德市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1308.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('48', '130900000000', '沧州市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1309.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('49', '131000000000', '廊坊市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1310.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('50', '131100000000', '衡水市', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1311.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('51', '139000000000', '省直辖县级行政区划', '', '3', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/1390.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('52', '140100000000', '太原市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1401.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('53', '140200000000', '大同市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1402.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('54', '140300000000', '阳泉市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1403.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('55', '140400000000', '长治市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1404.html', '2017-05-03 16:36:37', '2017-05-03 16:36:37');
INSERT INTO `sys_dict_china_city` VALUES ('56', '140500000000', '晋城市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1405.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('57', '140600000000', '朔州市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1406.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('58', '140700000000', '晋中市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1407.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('59', '140800000000', '运城市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1408.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('60', '140900000000', '忻州市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1409.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('61', '141000000000', '临汾市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1410.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('62', '141100000000', '吕梁市', '', '4', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/1411.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('63', '150100000000', '呼和浩特市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1501.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('64', '150200000000', '包头市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1502.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('65', '150300000000', '乌海市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1503.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('66', '150400000000', '赤峰市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1504.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('67', '150500000000', '通辽市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1505.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('68', '150600000000', '鄂尔多斯市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1506.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('69', '150700000000', '呼伦贝尔市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1507.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('70', '150800000000', '巴彦淖尔市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1508.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('71', '150900000000', '乌兰察布市', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1509.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('72', '152200000000', '兴安盟', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1522.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('73', '152500000000', '锡林郭勒盟', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1525.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('74', '152900000000', '阿拉善盟', '', '5', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/1529.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('75', '210100000000', '沈阳市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2101.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('76', '210200000000', '大连市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2102.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('77', '210300000000', '鞍山市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2103.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('78', '210400000000', '抚顺市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2104.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('79', '210500000000', '本溪市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2105.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('80', '210600000000', '丹东市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2106.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('81', '210700000000', '锦州市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2107.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('82', '210800000000', '营口市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2108.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('83', '210900000000', '阜新市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2109.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('84', '211000000000', '辽阳市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2110.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('85', '211100000000', '盘锦市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2111.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('86', '211200000000', '铁岭市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2112.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('87', '211300000000', '朝阳市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2113.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('88', '211400000000', '葫芦岛市', '', '6', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/2114.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('89', '220100000000', '长春市', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2201.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('90', '220200000000', '吉林市', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2202.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('91', '220300000000', '四平市', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2203.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('92', '220400000000', '辽源市', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2204.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('93', '220500000000', '通化市', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2205.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('94', '220600000000', '白山市', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2206.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('95', '220700000000', '松原市', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2207.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('96', '220800000000', '白城市', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2208.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('97', '222400000000', '延边朝鲜族自治州', '', '7', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/2224.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('98', '230100000000', '哈尔滨市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2301.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('99', '230200000000', '齐齐哈尔市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2302.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('100', '230300000000', '鸡西市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2303.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('101', '230400000000', '鹤岗市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2304.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('102', '230500000000', '双鸭山市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2305.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('103', '230600000000', '大庆市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2306.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('104', '230700000000', '伊春市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2307.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('105', '230800000000', '佳木斯市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2308.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('106', '230900000000', '七台河市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2309.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('107', '231000000000', '牡丹江市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2310.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('108', '231100000000', '黑河市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2311.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('109', '231200000000', '绥化市', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2312.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('110', '232700000000', '大兴安岭地区', '', '8', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/2327.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('111', '310100000000', '市辖区', '', '9', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/3101.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('112', '310200000000', '县', '', '9', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/3102.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('113', '320100000000', '南京市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3201.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('114', '320200000000', '无锡市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3202.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('115', '320300000000', '徐州市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3203.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('116', '320400000000', '常州市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3204.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('117', '320500000000', '苏州市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3205.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('118', '320600000000', '南通市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3206.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('119', '320700000000', '连云港市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3207.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('120', '320800000000', '淮安市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3208.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('121', '320900000000', '盐城市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3209.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('122', '321000000000', '扬州市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3210.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('123', '321100000000', '镇江市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3211.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('124', '321200000000', '泰州市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3212.html', '2017-05-03 16:36:38', '2017-05-03 16:36:38');
INSERT INTO `sys_dict_china_city` VALUES ('125', '321300000000', '宿迁市', '', '10', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/3213.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('126', '330100000000', '杭州市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3301.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('127', '330200000000', '宁波市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3302.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('128', '330300000000', '温州市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3303.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('129', '330400000000', '嘉兴市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3304.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('130', '330500000000', '湖州市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3305.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('131', '330600000000', '绍兴市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3306.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('132', '330700000000', '金华市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3307.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('133', '330800000000', '衢州市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3308.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('134', '330900000000', '舟山市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3309.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('135', '331000000000', '台州市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3310.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('136', '331100000000', '丽水市', '', '11', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/3311.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('137', '340100000000', '合肥市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3401.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('138', '340200000000', '芜湖市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3402.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('139', '340300000000', '蚌埠市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3403.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('140', '340400000000', '淮南市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3404.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('141', '340500000000', '马鞍山市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3405.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('142', '340600000000', '淮北市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3406.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('143', '340700000000', '铜陵市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3407.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('144', '340800000000', '安庆市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3408.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('145', '341000000000', '黄山市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3410.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('146', '341100000000', '滁州市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3411.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('147', '341200000000', '阜阳市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3412.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('148', '341300000000', '宿州市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3413.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('149', '341500000000', '六安市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3415.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('150', '341600000000', '亳州市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3416.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('151', '341700000000', '池州市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3417.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('152', '341800000000', '宣城市', '', '12', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/3418.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('153', '350100000000', '福州市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3501.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('154', '350200000000', '厦门市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3502.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('155', '350300000000', '莆田市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3503.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('156', '350400000000', '三明市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3504.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('157', '350500000000', '泉州市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3505.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('158', '350600000000', '漳州市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3506.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('159', '350700000000', '南平市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3507.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('160', '350800000000', '龙岩市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3508.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('161', '350900000000', '宁德市', '', '13', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/3509.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('162', '360100000000', '南昌市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3601.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('163', '360200000000', '景德镇市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3602.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('164', '360300000000', '萍乡市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3603.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('165', '360400000000', '九江市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3604.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('166', '360500000000', '新余市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3605.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('167', '360600000000', '鹰潭市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3606.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('168', '360700000000', '赣州市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3607.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('169', '360800000000', '吉安市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3608.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('170', '360900000000', '宜春市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3609.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('171', '361000000000', '抚州市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3610.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('172', '361100000000', '上饶市', '', '14', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/3611.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('173', '370100000000', '济南市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3701.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('174', '370200000000', '青岛市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3702.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('175', '370300000000', '淄博市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3703.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('176', '370400000000', '枣庄市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3704.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('177', '370500000000', '东营市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3705.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('178', '370600000000', '烟台市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3706.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('179', '370700000000', '潍坊市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3707.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('180', '370800000000', '济宁市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3708.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('181', '370900000000', '泰安市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3709.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('182', '371000000000', '威海市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3710.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('183', '371100000000', '日照市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3711.html', '2017-05-03 16:36:39', '2017-05-03 16:36:39');
INSERT INTO `sys_dict_china_city` VALUES ('184', '371200000000', '莱芜市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3712.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('185', '371300000000', '临沂市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3713.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('186', '371400000000', '德州市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3714.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('187', '371500000000', '聊城市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3715.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('188', '371600000000', '滨州市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3716.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('189', '371700000000', '菏泽市', '', '15', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/3717.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('190', '410100000000', '郑州市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4101.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('191', '410200000000', '开封市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4102.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('192', '410300000000', '洛阳市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4103.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('193', '410400000000', '平顶山市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4104.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('194', '410500000000', '安阳市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4105.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('195', '410600000000', '鹤壁市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4106.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('196', '410700000000', '新乡市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4107.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('197', '410800000000', '焦作市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4108.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('198', '410900000000', '濮阳市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4109.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('199', '411000000000', '许昌市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4110.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('200', '411100000000', '漯河市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4111.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('201', '411200000000', '三门峡市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4112.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('202', '411300000000', '南阳市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4113.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('203', '411400000000', '商丘市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4114.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('204', '411500000000', '信阳市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4115.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('205', '411600000000', '周口市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4116.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('206', '411700000000', '驻马店市', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4117.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('207', '419000000000', '省直辖县级行政区划', '', '16', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/4190.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('208', '420100000000', '武汉市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4201.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('209', '420200000000', '黄石市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4202.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('210', '420300000000', '十堰市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4203.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('211', '420500000000', '宜昌市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4205.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('212', '420600000000', '襄阳市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4206.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('213', '420700000000', '鄂州市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4207.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('214', '420800000000', '荆门市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4208.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('215', '420900000000', '孝感市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4209.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('216', '421000000000', '荆州市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4210.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('217', '421100000000', '黄冈市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4211.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('218', '421200000000', '咸宁市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4212.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('219', '421300000000', '随州市', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4213.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('220', '422800000000', '恩施土家族苗族自治州', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4228.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('221', '429000000000', '省直辖县级行政区划', '', '17', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/4290.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('222', '430100000000', '长沙市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4301.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('223', '430200000000', '株洲市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4302.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('224', '430300000000', '湘潭市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4303.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('225', '430400000000', '衡阳市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4304.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('226', '430500000000', '邵阳市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4305.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('227', '430600000000', '岳阳市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4306.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('228', '430700000000', '常德市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4307.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('229', '430800000000', '张家界市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4308.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('230', '430900000000', '益阳市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4309.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('231', '431000000000', '郴州市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4310.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('232', '431100000000', '永州市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4311.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('233', '431200000000', '怀化市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4312.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('234', '431300000000', '娄底市', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4313.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('235', '433100000000', '湘西土家族苗族自治州', '', '18', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/4331.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('236', '440100000000', '广州市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4401.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('237', '440200000000', '韶关市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4402.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('238', '440300000000', '深圳市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4403.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('239', '440400000000', '珠海市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4404.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('240', '440500000000', '汕头市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4405.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('241', '440600000000', '佛山市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4406.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('242', '440700000000', '江门市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4407.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('243', '440800000000', '湛江市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4408.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('244', '440900000000', '茂名市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4409.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('245', '441200000000', '肇庆市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4412.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('246', '441300000000', '惠州市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4413.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('247', '441400000000', '梅州市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4414.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('248', '441500000000', '汕尾市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4415.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('249', '441600000000', '河源市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4416.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('250', '441700000000', '阳江市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4417.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('251', '441800000000', '清远市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4418.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('252', '441900000000', '东莞市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4419.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('253', '442000000000', '中山市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4420.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('254', '445100000000', '潮州市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4451.html', '2017-05-03 16:36:40', '2017-05-03 16:36:40');
INSERT INTO `sys_dict_china_city` VALUES ('255', '445200000000', '揭阳市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4452.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('256', '445300000000', '云浮市', '', '19', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/4453.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('257', '450100000000', '南宁市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4501.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('258', '450200000000', '柳州市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4502.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('259', '450300000000', '桂林市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4503.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('260', '450400000000', '梧州市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4504.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('261', '450500000000', '北海市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4505.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('262', '450600000000', '防城港市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4506.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('263', '450700000000', '钦州市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4507.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('264', '450800000000', '贵港市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4508.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('265', '450900000000', '玉林市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4509.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('266', '451000000000', '百色市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4510.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('267', '451100000000', '贺州市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4511.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('268', '451200000000', '河池市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4512.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('269', '451300000000', '来宾市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4513.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('270', '451400000000', '崇左市', '', '20', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/4514.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('271', '460100000000', '海口市', '', '21', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/4601.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('272', '460200000000', '三亚市', '', '21', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/4602.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('273', '460300000000', '三沙市', '', '21', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/4603.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('274', '469000000000', '省直辖县级行政区划', '', '21', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/4690.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('275', '500100000000', '市辖区', '', '22', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/5001.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('276', '500200000000', '县', '', '22', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/5002.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('277', '510100000000', '成都市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5101.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('278', '510300000000', '自贡市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5103.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('279', '510400000000', '攀枝花市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5104.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('280', '510500000000', '泸州市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5105.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('281', '510600000000', '德阳市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5106.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('282', '510700000000', '绵阳市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5107.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('283', '510800000000', '广元市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5108.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('284', '510900000000', '遂宁市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5109.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('285', '511000000000', '内江市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5110.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('286', '511100000000', '乐山市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5111.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('287', '511300000000', '南充市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5113.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('288', '511400000000', '眉山市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5114.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('289', '511500000000', '宜宾市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5115.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('290', '511600000000', '广安市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5116.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('291', '511700000000', '达州市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5117.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('292', '511800000000', '雅安市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5118.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('293', '511900000000', '巴中市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5119.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('294', '512000000000', '资阳市', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5120.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('295', '513200000000', '阿坝藏族羌族自治州', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5132.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('296', '513300000000', '甘孜藏族自治州', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5133.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('297', '513400000000', '凉山彝族自治州', '', '23', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/5134.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('298', '520100000000', '贵阳市', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5201.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('299', '520200000000', '六盘水市', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5202.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('300', '520300000000', '遵义市', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5203.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('301', '520400000000', '安顺市', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5204.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('302', '520500000000', '毕节市', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5205.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('303', '520600000000', '铜仁市', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5206.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('304', '522300000000', '黔西南布依族苗族自治州', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5223.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('305', '522600000000', '黔东南苗族侗族自治州', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5226.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('306', '522700000000', '黔南布依族苗族自治州', '', '24', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/5227.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('307', '530100000000', '昆明市', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5301.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('308', '530300000000', '曲靖市', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5303.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('309', '530400000000', '玉溪市', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5304.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('310', '530500000000', '保山市', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5305.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('311', '530600000000', '昭通市', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5306.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('312', '530700000000', '丽江市', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5307.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('313', '530800000000', '普洱市', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5308.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('314', '530900000000', '临沧市', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5309.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('315', '532300000000', '楚雄彝族自治州', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5323.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('316', '532500000000', '红河哈尼族彝族自治州', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5325.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('317', '532600000000', '文山壮族苗族自治州', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5326.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('318', '532800000000', '西双版纳傣族自治州', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5328.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('319', '532900000000', '大理白族自治州', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5329.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('320', '533100000000', '德宏傣族景颇族自治州', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5331.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('321', '533300000000', '怒江傈僳族自治州', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5333.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('322', '533400000000', '迪庆藏族自治州', '', '25', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/5334.html', '2017-05-03 16:36:41', '2017-05-03 16:36:41');
INSERT INTO `sys_dict_china_city` VALUES ('323', '540100000000', '拉萨市', '', '26', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/5401.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('324', '540200000000', '日喀则市', '', '26', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/5402.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('325', '540300000000', '昌都市', '', '26', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/5403.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('326', '540400000000', '林芝市', '', '26', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/5404.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('327', '542200000000', '山南地区', '', '26', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/5422.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('328', '542400000000', '那曲地区', '', '26', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/5424.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('329', '542500000000', '阿里地区', '', '26', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/5425.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('330', '610100000000', '西安市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6101.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('331', '610200000000', '铜川市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6102.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('332', '610300000000', '宝鸡市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6103.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('333', '610400000000', '咸阳市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6104.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('334', '610500000000', '渭南市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6105.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('335', '610600000000', '延安市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6106.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('336', '610700000000', '汉中市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6107.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('337', '610800000000', '榆林市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6108.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('338', '610900000000', '安康市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6109.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('339', '611000000000', '商洛市', '', '27', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/6110.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('340', '620100000000', '兰州市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6201.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('341', '620200000000', '嘉峪关市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6202.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('342', '620300000000', '金昌市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6203.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('343', '620400000000', '白银市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6204.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('344', '620500000000', '天水市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6205.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('345', '620600000000', '武威市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6206.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('346', '620700000000', '张掖市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6207.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('347', '620800000000', '平凉市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6208.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('348', '620900000000', '酒泉市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6209.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('349', '621000000000', '庆阳市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6210.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('350', '621100000000', '定西市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6211.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('351', '621200000000', '陇南市', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6212.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('352', '622900000000', '临夏回族自治州', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6229.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('353', '623000000000', '甘南藏族自治州', '', '28', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/6230.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('354', '630100000000', '西宁市', '', '29', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/6301.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('355', '630200000000', '海东市', '', '29', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/6302.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('356', '632200000000', '海北藏族自治州', '', '29', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/6322.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('357', '632300000000', '黄南藏族自治州', '', '29', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/6323.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('358', '632500000000', '海南藏族自治州', '', '29', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/6325.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('359', '632600000000', '果洛藏族自治州', '', '29', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/6326.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('360', '632700000000', '玉树藏族自治州', '', '29', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/6327.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('361', '632800000000', '海西蒙古族藏族自治州', '', '29', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/6328.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('362', '640100000000', '银川市', '', '30', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/6401.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('363', '640200000000', '石嘴山市', '', '30', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/6402.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('364', '640300000000', '吴忠市', '', '30', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/6403.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('365', '640400000000', '固原市', '', '30', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/6404.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('366', '640500000000', '中卫市', '', '30', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/6405.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('367', '650100000000', '乌鲁木齐市', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6501.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('368', '650200000000', '克拉玛依市', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6502.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('369', '650400000000', '吐鲁番市', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6504.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('370', '652200000000', '哈密地区', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6522.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('371', '652300000000', '昌吉回族自治州', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6523.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('372', '652700000000', '博尔塔拉蒙古自治州', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6527.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('373', '652800000000', '巴音郭楞蒙古自治州', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6528.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('374', '652900000000', '阿克苏地区', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6529.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('375', '653000000000', '克孜勒苏柯尔克孜自治州', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6530.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('376', '653100000000', '喀什地区', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6531.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('377', '653200000000', '和田地区', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6532.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('378', '654000000000', '伊犁哈萨克自治州', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6540.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('379', '654200000000', '塔城地区', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6542.html', '2017-05-03 16:36:42', '2017-05-03 16:36:42');
INSERT INTO `sys_dict_china_city` VALUES ('380', '654300000000', '阿勒泰地区', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6543.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('381', '659000000000', '自治区直辖县级行政区划', '', '31', '2', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/6590.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('382', '110101000000', '东城区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110101.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('383', '110102000000', '西城区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110102.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('384', '110105000000', '朝阳区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110105.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('385', '110106000000', '丰台区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110106.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('386', '110107000000', '石景山区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110107.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('387', '110108000000', '海淀区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110108.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('388', '110109000000', '门头沟区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110109.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('389', '110111000000', '房山区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110111.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('390', '110112000000', '通州区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110112.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('391', '110113000000', '顺义区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110113.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('392', '110114000000', '昌平区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110114.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('393', '110115000000', '大兴区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110115.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('394', '110116000000', '怀柔区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110116.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('395', '110117000000', '平谷区', '', '36', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/01/110117.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('396', '110228000000', '密云县', '', '37', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/02/110228.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('397', '110229000000', '延庆县', '', '37', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/11/02/110229.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('398', '120101000000', '和平区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120101.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('399', '120102000000', '河东区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120102.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('400', '120103000000', '河西区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120103.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('401', '120104000000', '南开区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120104.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('402', '120105000000', '河北区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120105.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('403', '120106000000', '红桥区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120106.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('404', '120110000000', '东丽区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120110.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('405', '120111000000', '西青区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120111.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('406', '120112000000', '津南区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120112.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('407', '120113000000', '北辰区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120113.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('408', '120114000000', '武清区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120114.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('409', '120115000000', '宝坻区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120115.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('410', '120116000000', '滨海新区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120116.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('411', '120117000000', '宁河区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120117.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('412', '120118000000', '静海区', '', '38', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/01/120118.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('413', '120225000000', '蓟县', '', '39', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/12/02/120225.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('414', '130102000000', '长安区', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130102.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('415', '130104000000', '桥西区', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130104.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('416', '130105000000', '新华区', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130105.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('417', '130107000000', '井陉矿区', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130107.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('418', '130108000000', '裕华区', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130108.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('419', '130109000000', '藁城区', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130109.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('420', '130110000000', '鹿泉区', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130110.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('421', '130111000000', '栾城区', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130111.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('422', '130121000000', '井陉县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130121.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('423', '130123000000', '正定县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130123.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('424', '130125000000', '行唐县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130125.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('425', '130126000000', '灵寿县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130126.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('426', '130127000000', '高邑县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130127.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('427', '130128000000', '深泽县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130128.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('428', '130129000000', '赞皇县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130129.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('429', '130130000000', '无极县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130130.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('430', '130131000000', '平山县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130131.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('431', '130132000000', '元氏县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130132.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('432', '130133000000', '赵县', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130133.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('433', '130183000000', '晋州市', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130183.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('434', '130184000000', '新乐市', '', '40', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/01/130184.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('435', '130202000000', '路南区', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130202.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('436', '130203000000', '路北区', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130203.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('437', '130204000000', '古冶区', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130204.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('438', '130205000000', '开平区', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130205.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('439', '130207000000', '丰南区', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130207.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('440', '130208000000', '丰润区', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130208.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('441', '130209000000', '曹妃甸区', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130209.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('442', '130223000000', '滦县', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130223.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('443', '130224000000', '滦南县', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130224.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('444', '130225000000', '乐亭县', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130225.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('445', '130227000000', '迁西县', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130227.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('446', '130229000000', '玉田县', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130229.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('447', '130281000000', '遵化市', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130281.html', '2017-05-03 16:36:43', '2017-05-03 16:36:43');
INSERT INTO `sys_dict_china_city` VALUES ('448', '130283000000', '迁安市', '', '41', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/02/130283.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('449', '130302000000', '海港区', '', '42', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/03/130302.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('450', '130303000000', '山海关区', '', '42', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/03/130303.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('451', '130304000000', '北戴河区', '', '42', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/03/130304.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('452', '130306000000', '抚宁区', '', '42', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/03/130306.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('453', '130321000000', '青龙满族自治县', '', '42', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/03/130321.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('454', '130322000000', '昌黎县', '', '42', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/03/130322.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('455', '130324000000', '卢龙县', '', '42', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/03/130324.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('456', '130402000000', '邯山区', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130402.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('457', '130403000000', '丛台区', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130403.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('458', '130404000000', '复兴区', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130404.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('459', '130406000000', '峰峰矿区', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130406.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('460', '130421000000', '邯郸县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130421.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('461', '130423000000', '临漳县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130423.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('462', '130424000000', '成安县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130424.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('463', '130425000000', '大名县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130425.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('464', '130426000000', '涉县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130426.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('465', '130427000000', '磁县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130427.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('466', '130428000000', '肥乡县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130428.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('467', '130429000000', '永年县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130429.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('468', '130430000000', '邱县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130430.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('469', '130431000000', '鸡泽县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130431.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('470', '130432000000', '广平县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130432.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('471', '130433000000', '馆陶县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130433.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('472', '130434000000', '魏县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130434.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('473', '130435000000', '曲周县', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130435.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('474', '130481000000', '武安市', '', '43', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/04/130481.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('475', '130502000000', '桥东区', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130502.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('476', '130503000000', '桥西区', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130503.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('477', '130521000000', '邢台县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130521.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('478', '130522000000', '临城县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130522.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('479', '130523000000', '内丘县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130523.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('480', '130524000000', '柏乡县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130524.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('481', '130525000000', '隆尧县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130525.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('482', '130526000000', '任县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130526.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('483', '130527000000', '南和县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130527.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('484', '130528000000', '宁晋县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130528.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('485', '130529000000', '巨鹿县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130529.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('486', '130530000000', '新河县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130530.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('487', '130531000000', '广宗县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130531.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('488', '130532000000', '平乡县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130532.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('489', '130533000000', '威县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130533.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('490', '130534000000', '清河县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130534.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('491', '130535000000', '临西县', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130535.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('492', '130581000000', '南宫市', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130581.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('493', '130582000000', '沙河市', '', '44', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/05/130582.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('494', '130602000000', '竞秀区', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130602.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('495', '130606000000', '莲池区', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130606.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('496', '130607000000', '满城区', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130607.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('497', '130608000000', '清苑区', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130608.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('498', '130609000000', '徐水区', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130609.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('499', '130623000000', '涞水县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130623.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('500', '130624000000', '阜平县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130624.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('501', '130626000000', '定兴县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130626.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('502', '130627000000', '唐县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130627.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('503', '130628000000', '高阳县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130628.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('504', '130629000000', '容城县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130629.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('505', '130630000000', '涞源县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130630.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('506', '130631000000', '望都县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130631.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('507', '130632000000', '安新县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130632.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('508', '130633000000', '易县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130633.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('509', '130634000000', '曲阳县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130634.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('510', '130635000000', '蠡县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130635.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('511', '130636000000', '顺平县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130636.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('512', '130637000000', '博野县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130637.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('513', '130638000000', '雄县', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130638.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('514', '130681000000', '涿州市', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130681.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('515', '130683000000', '安国市', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130683.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('516', '130684000000', '高碑店市', '', '45', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/06/130684.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('517', '130702000000', '桥东区', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130702.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('518', '130703000000', '桥西区', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130703.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('519', '130705000000', '宣化区', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130705.html', '2017-05-03 16:36:44', '2017-05-03 16:36:44');
INSERT INTO `sys_dict_china_city` VALUES ('520', '130706000000', '下花园区', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130706.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('521', '130721000000', '宣化县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130721.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('522', '130722000000', '张北县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130722.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('523', '130723000000', '康保县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130723.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('524', '130724000000', '沽源县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130724.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('525', '130725000000', '尚义县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130725.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('526', '130726000000', '蔚县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130726.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('527', '130727000000', '阳原县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130727.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('528', '130728000000', '怀安县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130728.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('529', '130729000000', '万全县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130729.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('530', '130730000000', '怀来县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130730.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('531', '130731000000', '涿鹿县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130731.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('532', '130732000000', '赤城县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130732.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('533', '130733000000', '崇礼县', '', '46', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/07/130733.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('534', '130802000000', '双桥区', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130802.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('535', '130803000000', '双滦区', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130803.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('536', '130804000000', '鹰手营子矿区', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130804.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('537', '130821000000', '承德县', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130821.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('538', '130822000000', '兴隆县', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130822.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('539', '130823000000', '平泉县', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130823.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('540', '130824000000', '滦平县', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130824.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('541', '130825000000', '隆化县', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130825.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('542', '130826000000', '丰宁满族自治县', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130826.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('543', '130827000000', '宽城满族自治县', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130827.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('544', '130828000000', '围场满族蒙古族自治县', '', '47', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/08/130828.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('545', '130902000000', '新华区', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130902.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('546', '130903000000', '运河区', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130903.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('547', '130921000000', '沧县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130921.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('548', '130922000000', '青县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130922.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('549', '130923000000', '东光县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130923.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('550', '130924000000', '海兴县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130924.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('551', '130925000000', '盐山县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130925.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('552', '130926000000', '肃宁县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130926.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('553', '130927000000', '南皮县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130927.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('554', '130928000000', '吴桥县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130928.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('555', '130929000000', '献县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130929.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('556', '130930000000', '孟村回族自治县', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130930.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('557', '130981000000', '泊头市', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130981.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('558', '130982000000', '任丘市', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130982.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('559', '130983000000', '黄骅市', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130983.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('560', '130984000000', '河间市', '', '48', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/09/130984.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('561', '131002000000', '安次区', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131002.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('562', '131003000000', '广阳区', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131003.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('563', '131022000000', '固安县', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131022.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('564', '131023000000', '永清县', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131023.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('565', '131024000000', '香河县', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131024.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('566', '131025000000', '大城县', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131025.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('567', '131026000000', '文安县', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131026.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('568', '131028000000', '大厂回族自治县', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131028.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('569', '131081000000', '霸州市', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131081.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('570', '131082000000', '三河市', '', '49', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/10/131082.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('571', '131102000000', '桃城区', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131102.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('572', '131121000000', '枣强县', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131121.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('573', '131122000000', '武邑县', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131122.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('574', '131123000000', '武强县', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131123.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('575', '131124000000', '饶阳县', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131124.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('576', '131125000000', '安平县', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131125.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('577', '131126000000', '故城县', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131126.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('578', '131127000000', '景县', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131127.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('579', '131128000000', '阜城县', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131128.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('580', '131181000000', '冀州市', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131181.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('581', '131182000000', '深州市', '', '50', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/11/131182.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('582', '139001000000', '定州市', '', '51', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/90/139001.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('583', '139002000000', '辛集市', '', '51', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/13/90/139002.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('584', '140105000000', '小店区', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140105.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('585', '140106000000', '迎泽区', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140106.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('586', '140107000000', '杏花岭区', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140107.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('587', '140108000000', '尖草坪区', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140108.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('588', '140109000000', '万柏林区', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140109.html', '2017-05-03 16:36:45', '2017-05-03 16:36:45');
INSERT INTO `sys_dict_china_city` VALUES ('589', '140110000000', '晋源区', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140110.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('590', '140121000000', '清徐县', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140121.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('591', '140122000000', '阳曲县', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140122.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('592', '140123000000', '娄烦县', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140123.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('593', '140181000000', '古交市', '', '52', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/01/140181.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('594', '140202000000', '城区', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140202.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('595', '140203000000', '矿区', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140203.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('596', '140211000000', '南郊区', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140211.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('597', '140212000000', '新荣区', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140212.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('598', '140221000000', '阳高县', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140221.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('599', '140222000000', '天镇县', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140222.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('600', '140223000000', '广灵县', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140223.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('601', '140224000000', '灵丘县', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140224.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('602', '140225000000', '浑源县', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140225.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('603', '140226000000', '左云县', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140226.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('604', '140227000000', '大同县', '', '53', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/02/140227.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('605', '140302000000', '城区', '', '54', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/03/140302.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('606', '140303000000', '矿区', '', '54', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/03/140303.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('607', '140311000000', '郊区', '', '54', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/03/140311.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('608', '140321000000', '平定县', '', '54', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/03/140321.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('609', '140322000000', '盂县', '', '54', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/03/140322.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('610', '140402000000', '城区', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140402.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('611', '140411000000', '郊区', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140411.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('612', '140421000000', '长治县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140421.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('613', '140423000000', '襄垣县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140423.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('614', '140424000000', '屯留县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140424.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('615', '140425000000', '平顺县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140425.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('616', '140426000000', '黎城县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140426.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('617', '140427000000', '壶关县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140427.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('618', '140428000000', '长子县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140428.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('619', '140429000000', '武乡县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140429.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('620', '140430000000', '沁县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140430.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('621', '140431000000', '沁源县', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140431.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('622', '140481000000', '潞城市', '', '55', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/04/140481.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('623', '140502000000', '城区', '', '56', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/05/140502.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('624', '140521000000', '沁水县', '', '56', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/05/140521.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('625', '140522000000', '阳城县', '', '56', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/05/140522.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('626', '140524000000', '陵川县', '', '56', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/05/140524.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('627', '140525000000', '泽州县', '', '56', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/05/140525.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('628', '140581000000', '高平市', '', '56', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/05/140581.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('629', '140602000000', '朔城区', '', '57', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/06/140602.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('630', '140603000000', '平鲁区', '', '57', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/06/140603.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('631', '140621000000', '山阴县', '', '57', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/06/140621.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('632', '140622000000', '应县', '', '57', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/06/140622.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('633', '140623000000', '右玉县', '', '57', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/06/140623.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('634', '140624000000', '怀仁县', '', '57', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/06/140624.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('635', '140702000000', '榆次区', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140702.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('636', '140721000000', '榆社县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140721.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('637', '140722000000', '左权县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140722.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('638', '140723000000', '和顺县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140723.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('639', '140724000000', '昔阳县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140724.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('640', '140725000000', '寿阳县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140725.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('641', '140726000000', '太谷县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140726.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('642', '140727000000', '祁县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140727.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('643', '140728000000', '平遥县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140728.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('644', '140729000000', '灵石县', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140729.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('645', '140781000000', '介休市', '', '58', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/07/140781.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('646', '140802000000', '盐湖区', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140802.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('647', '140821000000', '临猗县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140821.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('648', '140822000000', '万荣县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140822.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('649', '140823000000', '闻喜县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140823.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('650', '140824000000', '稷山县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140824.html', '2017-05-03 16:36:46', '2017-05-03 16:36:46');
INSERT INTO `sys_dict_china_city` VALUES ('651', '140825000000', '新绛县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140825.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('652', '140826000000', '绛县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140826.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('653', '140827000000', '垣曲县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140827.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('654', '140828000000', '夏县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140828.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('655', '140829000000', '平陆县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140829.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('656', '140830000000', '芮城县', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140830.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('657', '140881000000', '永济市', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140881.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('658', '140882000000', '河津市', '', '59', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/08/140882.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('659', '140902000000', '忻府区', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140902.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('660', '140921000000', '定襄县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140921.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('661', '140922000000', '五台县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140922.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('662', '140923000000', '代县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140923.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('663', '140924000000', '繁峙县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140924.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('664', '140925000000', '宁武县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140925.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('665', '140926000000', '静乐县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140926.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('666', '140927000000', '神池县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140927.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('667', '140928000000', '五寨县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140928.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('668', '140929000000', '岢岚县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140929.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('669', '140930000000', '河曲县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140930.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('670', '140931000000', '保德县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140931.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('671', '140932000000', '偏关县', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140932.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('672', '140981000000', '原平市', '', '60', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/09/140981.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('673', '141002000000', '尧都区', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141002.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('674', '141021000000', '曲沃县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141021.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('675', '141022000000', '翼城县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141022.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('676', '141023000000', '襄汾县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141023.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('677', '141024000000', '洪洞县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141024.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('678', '141025000000', '古县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141025.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('679', '141026000000', '安泽县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141026.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('680', '141027000000', '浮山县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141027.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('681', '141028000000', '吉县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141028.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('682', '141029000000', '乡宁县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141029.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('683', '141030000000', '大宁县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141030.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('684', '141031000000', '隰县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141031.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('685', '141032000000', '永和县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141032.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('686', '141033000000', '蒲县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141033.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('687', '141034000000', '汾西县', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141034.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('688', '141081000000', '侯马市', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141081.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('689', '141082000000', '霍州市', '', '61', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/10/141082.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('690', '141102000000', '离石区', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141102.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('691', '141121000000', '文水县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141121.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('692', '141122000000', '交城县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141122.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('693', '141123000000', '兴县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141123.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('694', '141124000000', '临县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141124.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('695', '141125000000', '柳林县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141125.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('696', '141126000000', '石楼县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141126.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('697', '141127000000', '岚县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141127.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('698', '141128000000', '方山县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141128.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('699', '141129000000', '中阳县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141129.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('700', '141130000000', '交口县', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141130.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('701', '141181000000', '孝义市', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141181.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('702', '141182000000', '汾阳市', '', '62', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/14/11/141182.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('703', '150102000000', '新城区', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150102.html', '2017-05-03 16:36:47', '2017-05-03 16:36:47');
INSERT INTO `sys_dict_china_city` VALUES ('704', '150103000000', '回民区', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150103.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('705', '150104000000', '玉泉区', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150104.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('706', '150105000000', '赛罕区', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150105.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('707', '150121000000', '土默特左旗', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150121.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('708', '150122000000', '托克托县', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150122.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('709', '150123000000', '和林格尔县', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150123.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('710', '150124000000', '清水河县', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150124.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('711', '150125000000', '武川县', '', '63', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/01/150125.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('712', '150202000000', '东河区', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150202.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('713', '150203000000', '昆都仑区', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150203.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('714', '150204000000', '青山区', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150204.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('715', '150205000000', '石拐区', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150205.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('716', '150206000000', '白云鄂博矿区', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150206.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('717', '150207000000', '九原区', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150207.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('718', '150221000000', '土默特右旗', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150221.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('719', '150222000000', '固阳县', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150222.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('720', '150223000000', '达尔罕茂明安联合旗', '', '64', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/02/150223.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('721', '150302000000', '海勃湾区', '', '65', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/03/150302.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('722', '150303000000', '海南区', '', '65', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/03/150303.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('723', '150304000000', '乌达区', '', '65', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/03/150304.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('724', '150402000000', '红山区', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150402.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('725', '150403000000', '元宝山区', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150403.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('726', '150404000000', '松山区', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150404.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('727', '150421000000', '阿鲁科尔沁旗', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150421.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('728', '150422000000', '巴林左旗', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150422.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('729', '150423000000', '巴林右旗', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150423.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('730', '150424000000', '林西县', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150424.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('731', '150425000000', '克什克腾旗', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150425.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('732', '150426000000', '翁牛特旗', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150426.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('733', '150428000000', '喀喇沁旗', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150428.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('734', '150429000000', '宁城县', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150429.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('735', '150430000000', '敖汉旗', '', '66', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/04/150430.html', '2017-05-03 16:36:48', '2017-05-03 16:36:48');
INSERT INTO `sys_dict_china_city` VALUES ('736', '150502000000', '科尔沁区', '', '67', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/05/150502.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('737', '150521000000', '科尔沁左翼中旗', '', '67', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/05/150521.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('738', '150522000000', '科尔沁左翼后旗', '', '67', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/05/150522.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('739', '150523000000', '开鲁县', '', '67', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/05/150523.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('740', '150524000000', '库伦旗', '', '67', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/05/150524.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('741', '150525000000', '奈曼旗', '', '67', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/05/150525.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('742', '150526000000', '扎鲁特旗', '', '67', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/05/150526.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('743', '150581000000', '霍林郭勒市', '', '67', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/05/150581.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('744', '150602000000', '东胜区', '', '68', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/06/150602.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('745', '150621000000', '达拉特旗', '', '68', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/06/150621.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('746', '150622000000', '准格尔旗', '', '68', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/06/150622.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('747', '150623000000', '鄂托克前旗', '', '68', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/06/150623.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('748', '150624000000', '鄂托克旗', '', '68', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/06/150624.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('749', '150625000000', '杭锦旗', '', '68', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/06/150625.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('750', '150626000000', '乌审旗', '', '68', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/06/150626.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('751', '150627000000', '伊金霍洛旗', '', '68', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/06/150627.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('752', '150702000000', '海拉尔区', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150702.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('753', '150703000000', '扎赉诺尔区', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150703.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('754', '150721000000', '阿荣旗', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150721.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('755', '150722000000', '莫力达瓦达斡尔族自治旗', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150722.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('756', '150723000000', '鄂伦春自治旗', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150723.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('757', '150724000000', '鄂温克族自治旗', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150724.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('758', '150725000000', '陈巴尔虎旗', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150725.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('759', '150726000000', '新巴尔虎左旗', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150726.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('760', '150727000000', '新巴尔虎右旗', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150727.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('761', '150781000000', '满洲里市', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150781.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('762', '150782000000', '牙克石市', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150782.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('763', '150783000000', '扎兰屯市', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150783.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('764', '150784000000', '额尔古纳市', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150784.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('765', '150785000000', '根河市', '', '69', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/07/150785.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('766', '150802000000', '临河区', '', '70', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/08/150802.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('767', '150821000000', '五原县', '', '70', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/08/150821.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('768', '150822000000', '磴口县', '', '70', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/08/150822.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('769', '150823000000', '乌拉特前旗', '', '70', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/08/150823.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('770', '150824000000', '乌拉特中旗', '', '70', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/08/150824.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('771', '150825000000', '乌拉特后旗', '', '70', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/08/150825.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('772', '150826000000', '杭锦后旗', '', '70', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/08/150826.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('773', '150902000000', '集宁区', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150902.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('774', '150921000000', '卓资县', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150921.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('775', '150922000000', '化德县', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150922.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('776', '150923000000', '商都县', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150923.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('777', '150924000000', '兴和县', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150924.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('778', '150925000000', '凉城县', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150925.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('779', '150926000000', '察哈尔右翼前旗', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150926.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('780', '150927000000', '察哈尔右翼中旗', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150927.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('781', '150928000000', '察哈尔右翼后旗', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150928.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('782', '150929000000', '四子王旗', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150929.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('783', '150981000000', '丰镇市', '', '71', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/09/150981.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('784', '152201000000', '乌兰浩特市', '', '72', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/22/152201.html', '2017-05-03 16:36:49', '2017-05-03 16:36:49');
INSERT INTO `sys_dict_china_city` VALUES ('785', '152202000000', '阿尔山市', '', '72', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/22/152202.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('786', '152221000000', '科尔沁右翼前旗', '', '72', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/22/152221.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('787', '152222000000', '科尔沁右翼中旗', '', '72', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/22/152222.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('788', '152223000000', '扎赉特旗', '', '72', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/22/152223.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('789', '152224000000', '突泉县', '', '72', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/22/152224.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('790', '152501000000', '二连浩特市', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152501.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('791', '152502000000', '锡林浩特市', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152502.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('792', '152522000000', '阿巴嘎旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152522.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('793', '152523000000', '苏尼特左旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152523.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('794', '152524000000', '苏尼特右旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152524.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('795', '152525000000', '东乌珠穆沁旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152525.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('796', '152526000000', '西乌珠穆沁旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152526.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('797', '152527000000', '太仆寺旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152527.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('798', '152528000000', '镶黄旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152528.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('799', '152529000000', '正镶白旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152529.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('800', '152530000000', '正蓝旗', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152530.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('801', '152531000000', '多伦县', '', '73', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/25/152531.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('802', '152921000000', '阿拉善左旗', '', '74', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/29/152921.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('803', '152922000000', '阿拉善右旗', '', '74', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/29/152922.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('804', '152923000000', '额济纳旗', '', '74', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/15/29/152923.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('805', '210102000000', '和平区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210102.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('806', '210103000000', '沈河区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210103.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('807', '210104000000', '大东区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210104.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('808', '210105000000', '皇姑区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210105.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('809', '210106000000', '铁西区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210106.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('810', '210111000000', '苏家屯区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210111.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('811', '210112000000', '浑南区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210112.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('812', '210113000000', '沈北新区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210113.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('813', '210114000000', '于洪区', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210114.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('814', '210122000000', '辽中县', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210122.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('815', '210123000000', '康平县', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210123.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('816', '210124000000', '法库县', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210124.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('817', '210181000000', '新民市', '', '75', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/01/210181.html', '2017-05-03 16:36:50', '2017-05-03 16:36:50');
INSERT INTO `sys_dict_china_city` VALUES ('818', '210202000000', '中山区', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210202.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('819', '210203000000', '西岗区', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210203.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('820', '210204000000', '沙河口区', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210204.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('821', '210211000000', '甘井子区', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210211.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('822', '210212000000', '旅顺口区', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210212.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('823', '210213000000', '金州区', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210213.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('824', '210224000000', '长海县', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210224.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('825', '210281000000', '瓦房店市', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210281.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('826', '210282000000', '普兰店市', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210282.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('827', '210283000000', '庄河市', '', '76', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/02/210283.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('828', '210302000000', '铁东区', '', '77', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/03/210302.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('829', '210303000000', '铁西区', '', '77', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/03/210303.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('830', '210304000000', '立山区', '', '77', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/03/210304.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('831', '210311000000', '千山区', '', '77', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/03/210311.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('832', '210321000000', '台安县', '', '77', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/03/210321.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('833', '210323000000', '岫岩满族自治县', '', '77', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/03/210323.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('834', '210381000000', '海城市', '', '77', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/03/210381.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('835', '210402000000', '新抚区', '', '78', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/04/210402.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('836', '210403000000', '东洲区', '', '78', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/04/210403.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('837', '210404000000', '望花区', '', '78', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/04/210404.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('838', '210411000000', '顺城区', '', '78', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/04/210411.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('839', '210421000000', '抚顺县', '', '78', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/04/210421.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('840', '210422000000', '新宾满族自治县', '', '78', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/04/210422.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('841', '210423000000', '清原满族自治县', '', '78', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/04/210423.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('842', '210502000000', '平山区', '', '79', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/05/210502.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('843', '210503000000', '溪湖区', '', '79', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/05/210503.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('844', '210504000000', '明山区', '', '79', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/05/210504.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('845', '210505000000', '南芬区', '', '79', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/05/210505.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('846', '210521000000', '本溪满族自治县', '', '79', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/05/210521.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('847', '210522000000', '桓仁满族自治县', '', '79', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/05/210522.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('848', '210602000000', '元宝区', '', '80', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/06/210602.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('849', '210603000000', '振兴区', '', '80', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/06/210603.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('850', '210604000000', '振安区', '', '80', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/06/210604.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('851', '210624000000', '宽甸满族自治县', '', '80', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/06/210624.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('852', '210681000000', '东港市', '', '80', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/06/210681.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('853', '210682000000', '凤城市', '', '80', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/06/210682.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('854', '210702000000', '古塔区', '', '81', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/07/210702.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('855', '210703000000', '凌河区', '', '81', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/07/210703.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('856', '210711000000', '太和区', '', '81', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/07/210711.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('857', '210726000000', '黑山县', '', '81', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/07/210726.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('858', '210727000000', '义县', '', '81', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/07/210727.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('859', '210781000000', '凌海市', '', '81', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/07/210781.html', '2017-05-03 16:36:51', '2017-05-03 16:36:51');
INSERT INTO `sys_dict_china_city` VALUES ('860', '210782000000', '北镇市', '', '81', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/07/210782.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('861', '210802000000', '站前区', '', '82', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/08/210802.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('862', '210803000000', '西市区', '', '82', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/08/210803.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('863', '210804000000', '鲅鱼圈区', '', '82', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/08/210804.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('864', '210811000000', '老边区', '', '82', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/08/210811.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('865', '210881000000', '盖州市', '', '82', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/08/210881.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('866', '210882000000', '大石桥市', '', '82', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/08/210882.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('867', '210902000000', '海州区', '', '83', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/09/210902.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('868', '210903000000', '新邱区', '', '83', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/09/210903.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('869', '210904000000', '太平区', '', '83', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/09/210904.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('870', '210905000000', '清河门区', '', '83', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/09/210905.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('871', '210911000000', '细河区', '', '83', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/09/210911.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('872', '210921000000', '阜新蒙古族自治县', '', '83', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/09/210921.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('873', '210922000000', '彰武县', '', '83', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/09/210922.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('874', '211002000000', '白塔区', '', '84', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/10/211002.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('875', '211003000000', '文圣区', '', '84', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/10/211003.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('876', '211004000000', '宏伟区', '', '84', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/10/211004.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('877', '211005000000', '弓长岭区', '', '84', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/10/211005.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('878', '211011000000', '太子河区', '', '84', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/10/211011.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('879', '211021000000', '辽阳县', '', '84', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/10/211021.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('880', '211081000000', '灯塔市', '', '84', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/10/211081.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('881', '211102000000', '双台子区', '', '85', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/11/211102.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('882', '211103000000', '兴隆台区', '', '85', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/11/211103.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('883', '211121000000', '大洼县', '', '85', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/11/211121.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('884', '211122000000', '盘山县', '', '85', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/11/211122.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('885', '211202000000', '银州区', '', '86', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/12/211202.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('886', '211204000000', '清河区', '', '86', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/12/211204.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('887', '211221000000', '铁岭县', '', '86', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/12/211221.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('888', '211223000000', '西丰县', '', '86', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/12/211223.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('889', '211224000000', '昌图县', '', '86', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/12/211224.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('890', '211281000000', '调兵山市', '', '86', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/12/211281.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('891', '211282000000', '开原市', '', '86', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/12/211282.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('892', '211302000000', '双塔区', '', '87', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/13/211302.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('893', '211303000000', '龙城区', '', '87', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/13/211303.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('894', '211321000000', '朝阳县', '', '87', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/13/211321.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('895', '211322000000', '建平县', '', '87', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/13/211322.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('896', '211324000000', '喀喇沁左翼蒙古族自治县', '', '87', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/13/211324.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('897', '211381000000', '北票市', '', '87', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/13/211381.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('898', '211382000000', '凌源市', '', '87', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/13/211382.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('899', '211402000000', '连山区', '', '88', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/14/211402.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('900', '211403000000', '龙港区', '', '88', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/14/211403.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('901', '211404000000', '南票区', '', '88', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/14/211404.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('902', '211421000000', '绥中县', '', '88', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/14/211421.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('903', '211422000000', '建昌县', '', '88', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/14/211422.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('904', '211481000000', '兴城市', '', '88', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/21/14/211481.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('905', '220102000000', '南关区', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220102.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('906', '220103000000', '宽城区', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220103.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('907', '220104000000', '朝阳区', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220104.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('908', '220105000000', '二道区', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220105.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('909', '220106000000', '绿园区', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220106.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('910', '220112000000', '双阳区', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220112.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('911', '220113000000', '九台区', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220113.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('912', '220122000000', '农安县', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220122.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('913', '220182000000', '榆树市', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220182.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('914', '220183000000', '德惠市', '', '89', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/01/220183.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('915', '220202000000', '昌邑区', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220202.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('916', '220203000000', '龙潭区', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220203.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('917', '220204000000', '船营区', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220204.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('918', '220211000000', '丰满区', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220211.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('919', '220221000000', '永吉县', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220221.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('920', '220281000000', '蛟河市', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220281.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('921', '220282000000', '桦甸市', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220282.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('922', '220283000000', '舒兰市', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220283.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('923', '220284000000', '磐石市', '', '90', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/02/220284.html', '2017-05-03 16:36:52', '2017-05-03 16:36:52');
INSERT INTO `sys_dict_china_city` VALUES ('924', '220302000000', '铁西区', '', '91', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/03/220302.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('925', '220303000000', '铁东区', '', '91', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/03/220303.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('926', '220322000000', '梨树县', '', '91', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/03/220322.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('927', '220323000000', '伊通满族自治县', '', '91', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/03/220323.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('928', '220381000000', '公主岭市', '', '91', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/03/220381.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('929', '220382000000', '双辽市', '', '91', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/03/220382.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('930', '220402000000', '龙山区', '', '92', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/04/220402.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('931', '220403000000', '西安区', '', '92', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/04/220403.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('932', '220421000000', '东丰县', '', '92', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/04/220421.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('933', '220422000000', '东辽县', '', '92', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/04/220422.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('934', '220502000000', '东昌区', '', '93', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/05/220502.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('935', '220503000000', '二道江区', '', '93', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/05/220503.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('936', '220521000000', '通化县', '', '93', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/05/220521.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('937', '220523000000', '辉南县', '', '93', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/05/220523.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('938', '220524000000', '柳河县', '', '93', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/05/220524.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('939', '220581000000', '梅河口市', '', '93', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/05/220581.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('940', '220582000000', '集安市', '', '93', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/05/220582.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('941', '220602000000', '浑江区', '', '94', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/06/220602.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('942', '220605000000', '江源区', '', '94', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/06/220605.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('943', '220621000000', '抚松县', '', '94', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/06/220621.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('944', '220622000000', '靖宇县', '', '94', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/06/220622.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('945', '220623000000', '长白朝鲜族自治县', '', '94', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/06/220623.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('946', '220681000000', '临江市', '', '94', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/06/220681.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('947', '220702000000', '宁江区', '', '95', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/07/220702.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('948', '220721000000', '前郭尔罗斯蒙古族自治县', '', '95', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/07/220721.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('949', '220722000000', '长岭县', '', '95', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/07/220722.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('950', '220723000000', '乾安县', '', '95', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/07/220723.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('951', '220781000000', '扶余市', '', '95', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/07/220781.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('952', '220802000000', '洮北区', '', '96', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/08/220802.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('953', '220821000000', '镇赉县', '', '96', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/08/220821.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('954', '220822000000', '通榆县', '', '96', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/08/220822.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('955', '220881000000', '洮南市', '', '96', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/08/220881.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('956', '220882000000', '大安市', '', '96', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/08/220882.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('957', '222401000000', '延吉市', '', '97', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/24/222401.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('958', '222402000000', '图们市', '', '97', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/24/222402.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('959', '222403000000', '敦化市', '', '97', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/24/222403.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('960', '222404000000', '珲春市', '', '97', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/24/222404.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('961', '222405000000', '龙井市', '', '97', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/24/222405.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('962', '222406000000', '和龙市', '', '97', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/24/222406.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('963', '222424000000', '汪清县', '', '97', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/24/222424.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('964', '222426000000', '安图县', '', '97', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/22/24/222426.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('965', '230102000000', '道里区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230102.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('966', '230103000000', '南岗区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230103.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('967', '230104000000', '道外区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230104.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('968', '230108000000', '平房区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230108.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('969', '230109000000', '松北区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230109.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('970', '230110000000', '香坊区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230110.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('971', '230111000000', '呼兰区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230111.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('972', '230112000000', '阿城区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230112.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('973', '230113000000', '双城区', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230113.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('974', '230123000000', '依兰县', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230123.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('975', '230124000000', '方正县', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230124.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('976', '230125000000', '宾县', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230125.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('977', '230126000000', '巴彦县', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230126.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('978', '230127000000', '木兰县', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230127.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('979', '230128000000', '通河县', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230128.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('980', '230129000000', '延寿县', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230129.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('981', '230183000000', '尚志市', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230183.html', '2017-05-03 16:36:53', '2017-05-03 16:36:53');
INSERT INTO `sys_dict_china_city` VALUES ('982', '230184000000', '五常市', '', '98', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/01/230184.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('983', '230202000000', '龙沙区', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230202.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('984', '230203000000', '建华区', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230203.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('985', '230204000000', '铁锋区', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230204.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('986', '230205000000', '昂昂溪区', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230205.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('987', '230206000000', '富拉尔基区', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230206.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('988', '230207000000', '碾子山区', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230207.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('989', '230208000000', '梅里斯达斡尔族区', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230208.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('990', '230221000000', '龙江县', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230221.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('991', '230223000000', '依安县', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230223.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('992', '230224000000', '泰来县', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230224.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('993', '230225000000', '甘南县', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230225.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('994', '230227000000', '富裕县', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230227.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('995', '230229000000', '克山县', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230229.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('996', '230230000000', '克东县', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230230.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('997', '230231000000', '拜泉县', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230231.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('998', '230281000000', '讷河市', '', '99', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/02/230281.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('999', '230302000000', '鸡冠区', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230302.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1000', '230303000000', '恒山区', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230303.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1001', '230304000000', '滴道区', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230304.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1002', '230305000000', '梨树区', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230305.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1003', '230306000000', '城子河区', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230306.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1004', '230307000000', '麻山区', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230307.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1005', '230321000000', '鸡东县', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230321.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1006', '230381000000', '虎林市', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230381.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1007', '230382000000', '密山市', '', '100', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/03/230382.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1008', '230402000000', '向阳区', '', '101', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/04/230402.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1009', '230403000000', '工农区', '', '101', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/04/230403.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1010', '230404000000', '南山区', '', '101', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/04/230404.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1011', '230405000000', '兴安区', '', '101', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/04/230405.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1012', '230406000000', '东山区', '', '101', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/04/230406.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1013', '230407000000', '兴山区', '', '101', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/04/230407.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1014', '230421000000', '萝北县', '', '101', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/04/230421.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1015', '230422000000', '绥滨县', '', '101', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/04/230422.html', '2017-05-03 16:36:54', '2017-05-03 16:36:54');
INSERT INTO `sys_dict_china_city` VALUES ('1016', '230502000000', '尖山区', '', '102', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/05/230502.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1017', '230503000000', '岭东区', '', '102', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/05/230503.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1018', '230505000000', '四方台区', '', '102', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/05/230505.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1019', '230506000000', '宝山区', '', '102', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/05/230506.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1020', '230521000000', '集贤县', '', '102', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/05/230521.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1021', '230522000000', '友谊县', '', '102', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/05/230522.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1022', '230523000000', '宝清县', '', '102', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/05/230523.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1023', '230524000000', '饶河县', '', '102', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/05/230524.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1024', '230602000000', '萨尔图区', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230602.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1025', '230603000000', '龙凤区', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230603.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1026', '230604000000', '让胡路区', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230604.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1027', '230605000000', '红岗区', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230605.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1028', '230606000000', '大同区', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230606.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1029', '230621000000', '肇州县', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230621.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1030', '230622000000', '肇源县', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230622.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1031', '230623000000', '林甸县', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230623.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1032', '230624000000', '杜尔伯特蒙古族自治县', '', '103', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/06/230624.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1033', '230702000000', '伊春区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230702.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1034', '230703000000', '南岔区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230703.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1035', '230704000000', '友好区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230704.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1036', '230705000000', '西林区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230705.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1037', '230706000000', '翠峦区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230706.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1038', '230707000000', '新青区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230707.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1039', '230708000000', '美溪区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230708.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1040', '230709000000', '金山屯区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230709.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1041', '230710000000', '五营区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230710.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1042', '230711000000', '乌马河区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230711.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1043', '230712000000', '汤旺河区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230712.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1044', '230713000000', '带岭区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230713.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1045', '230714000000', '乌伊岭区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230714.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1046', '230715000000', '红星区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230715.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1047', '230716000000', '上甘岭区', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230716.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1048', '230722000000', '嘉荫县', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230722.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1049', '230781000000', '铁力市', '', '104', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/07/230781.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1050', '230803000000', '向阳区', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230803.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1051', '230804000000', '前进区', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230804.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1052', '230805000000', '东风区', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230805.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1053', '230811000000', '郊区', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230811.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1054', '230822000000', '桦南县', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230822.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1055', '230826000000', '桦川县', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230826.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1056', '230828000000', '汤原县', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230828.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1057', '230833000000', '抚远县', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230833.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1058', '230881000000', '同江市', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230881.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1059', '230882000000', '富锦市', '', '105', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/08/230882.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1060', '230902000000', '新兴区', '', '106', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/09/230902.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1061', '230903000000', '桃山区', '', '106', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/09/230903.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1062', '230904000000', '茄子河区', '', '106', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/09/230904.html', '2017-05-03 16:36:55', '2017-05-03 16:36:55');
INSERT INTO `sys_dict_china_city` VALUES ('1063', '230921000000', '勃利县', '', '106', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/09/230921.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1064', '231002000000', '东安区', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231002.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1065', '231003000000', '阳明区', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231003.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1066', '231004000000', '爱民区', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231004.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1067', '231005000000', '西安区', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231005.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1068', '231024000000', '东宁县', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231024.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1069', '231025000000', '林口县', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231025.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1070', '231081000000', '绥芬河市', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231081.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1071', '231083000000', '海林市', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231083.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1072', '231084000000', '宁安市', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231084.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1073', '231085000000', '穆棱市', '', '107', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/10/231085.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1074', '231102000000', '爱辉区', '', '108', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/11/231102.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1075', '231121000000', '嫩江县', '', '108', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/11/231121.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1076', '231123000000', '逊克县', '', '108', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/11/231123.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1077', '231124000000', '孙吴县', '', '108', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/11/231124.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1078', '231181000000', '北安市', '', '108', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/11/231181.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1079', '231182000000', '五大连池市', '', '108', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/11/231182.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1080', '231202000000', '北林区', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231202.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1081', '231221000000', '望奎县', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231221.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1082', '231222000000', '兰西县', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231222.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1083', '231223000000', '青冈县', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231223.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1084', '231224000000', '庆安县', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231224.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1085', '231225000000', '明水县', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231225.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1086', '231226000000', '绥棱县', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231226.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1087', '231281000000', '安达市', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231281.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1088', '231282000000', '肇东市', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231282.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1089', '231283000000', '海伦市', '', '109', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/12/231283.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1090', '232721000000', '呼玛县', '', '110', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/27/232721.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1091', '232722000000', '塔河县', '', '110', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/27/232722.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1092', '232723000000', '漠河县', '', '110', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/23/27/232723.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1093', '310101000000', '黄浦区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310101.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1094', '310104000000', '徐汇区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310104.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1095', '310105000000', '长宁区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310105.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1096', '310106000000', '静安区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310106.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1097', '310107000000', '普陀区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310107.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1098', '310108000000', '闸北区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310108.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1099', '310109000000', '虹口区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310109.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1100', '310110000000', '杨浦区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310110.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1101', '310112000000', '闵行区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310112.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1102', '310113000000', '宝山区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310113.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1103', '310114000000', '嘉定区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310114.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1104', '310115000000', '浦东新区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310115.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1105', '310116000000', '金山区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310116.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1106', '310117000000', '松江区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310117.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1107', '310118000000', '青浦区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310118.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1108', '310120000000', '奉贤区', '', '111', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/01/310120.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1109', '310230000000', '崇明县', '', '112', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/31/02/310230.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1110', '320102000000', '玄武区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320102.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1111', '320104000000', '秦淮区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320104.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1112', '320105000000', '建邺区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320105.html', '2017-05-03 16:36:56', '2017-05-03 16:36:56');
INSERT INTO `sys_dict_china_city` VALUES ('1113', '320106000000', '鼓楼区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320106.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1114', '320111000000', '浦口区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320111.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1115', '320113000000', '栖霞区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320113.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1116', '320114000000', '雨花台区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320114.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1117', '320115000000', '江宁区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320115.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1118', '320116000000', '六合区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320116.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1119', '320117000000', '溧水区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320117.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1120', '320118000000', '高淳区', '', '113', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/01/320118.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1121', '320202000000', '崇安区', '', '114', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/02/320202.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1122', '320203000000', '南长区', '', '114', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/02/320203.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1123', '320204000000', '北塘区', '', '114', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/02/320204.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1124', '320205000000', '锡山区', '', '114', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/02/320205.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1125', '320206000000', '惠山区', '', '114', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/02/320206.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1126', '320211000000', '滨湖区', '', '114', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/02/320211.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1127', '320281000000', '江阴市', '', '114', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/02/320281.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1128', '320282000000', '宜兴市', '', '114', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/02/320282.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1129', '320302000000', '鼓楼区', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320302.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1130', '320303000000', '云龙区', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320303.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1131', '320305000000', '贾汪区', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320305.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1132', '320311000000', '泉山区', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320311.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1133', '320312000000', '铜山区', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320312.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1134', '320321000000', '丰县', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320321.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1135', '320322000000', '沛县', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320322.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1136', '320324000000', '睢宁县', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320324.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1137', '320381000000', '新沂市', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320381.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1138', '320382000000', '邳州市', '', '115', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/03/320382.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1139', '320402000000', '天宁区', '', '116', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/04/320402.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1140', '320404000000', '钟楼区', '', '116', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/04/320404.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1141', '320411000000', '新北区', '', '116', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/04/320411.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1142', '320412000000', '武进区', '', '116', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/04/320412.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1143', '320413000000', '金坛区', '', '116', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/04/320413.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1144', '320481000000', '溧阳市', '', '116', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/04/320481.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1145', '320505000000', '虎丘区', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320505.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1146', '320506000000', '吴中区', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320506.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1147', '320507000000', '相城区', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320507.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1148', '320508000000', '姑苏区', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320508.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1149', '320509000000', '吴江区', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320509.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1150', '320581000000', '常熟市', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320581.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1151', '320582000000', '张家港市', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320582.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1152', '320583000000', '昆山市', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320583.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1153', '320585000000', '太仓市', '', '117', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/05/320585.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1154', '320602000000', '崇川区', '', '118', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/06/320602.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1155', '320611000000', '港闸区', '', '118', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/06/320611.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1156', '320612000000', '通州区', '', '118', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/06/320612.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1157', '320621000000', '海安县', '', '118', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/06/320621.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1158', '320623000000', '如东县', '', '118', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/06/320623.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1159', '320681000000', '启东市', '', '118', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/06/320681.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1160', '320682000000', '如皋市', '', '118', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/06/320682.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1161', '320684000000', '海门市', '', '118', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/06/320684.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1162', '320703000000', '连云区', '', '119', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/07/320703.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1163', '320706000000', '海州区', '', '119', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/07/320706.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1164', '320707000000', '赣榆区', '', '119', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/07/320707.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1165', '320722000000', '东海县', '', '119', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/07/320722.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1166', '320723000000', '灌云县', '', '119', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/07/320723.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1167', '320724000000', '灌南县', '', '119', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/07/320724.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1168', '320802000000', '清河区', '', '120', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/08/320802.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1169', '320803000000', '淮安区', '', '120', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/08/320803.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1170', '320804000000', '淮阴区', '', '120', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/08/320804.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1171', '320811000000', '清浦区', '', '120', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/08/320811.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1172', '320826000000', '涟水县', '', '120', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/08/320826.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1173', '320829000000', '洪泽县', '', '120', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/08/320829.html', '2017-05-03 16:36:57', '2017-05-03 16:36:57');
INSERT INTO `sys_dict_china_city` VALUES ('1174', '320830000000', '盱眙县', '', '120', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/08/320830.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1175', '320831000000', '金湖县', '', '120', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/08/320831.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1176', '320902000000', '亭湖区', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320902.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1177', '320903000000', '盐都区', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320903.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1178', '320904000000', '大丰区', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320904.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1179', '320921000000', '响水县', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320921.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1180', '320922000000', '滨海县', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320922.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1181', '320923000000', '阜宁县', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320923.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1182', '320924000000', '射阳县', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320924.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1183', '320925000000', '建湖县', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320925.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1184', '320981000000', '东台市', '', '121', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/09/320981.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1185', '321002000000', '广陵区', '', '122', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/10/321002.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1186', '321003000000', '邗江区', '', '122', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/10/321003.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1187', '321012000000', '江都区', '', '122', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/10/321012.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1188', '321023000000', '宝应县', '', '122', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/10/321023.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1189', '321081000000', '仪征市', '', '122', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/10/321081.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1190', '321084000000', '高邮市', '', '122', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/10/321084.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1191', '321102000000', '京口区', '', '123', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/11/321102.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1192', '321111000000', '润州区', '', '123', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/11/321111.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1193', '321112000000', '丹徒区', '', '123', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/11/321112.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1194', '321181000000', '丹阳市', '', '123', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/11/321181.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1195', '321182000000', '扬中市', '', '123', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/11/321182.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1196', '321183000000', '句容市', '', '123', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/11/321183.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1197', '321202000000', '海陵区', '', '124', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/12/321202.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1198', '321203000000', '高港区', '', '124', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/12/321203.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1199', '321204000000', '姜堰区', '', '124', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/12/321204.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1200', '321281000000', '兴化市', '', '124', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/12/321281.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1201', '321282000000', '靖江市', '', '124', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/12/321282.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1202', '321283000000', '泰兴市', '', '124', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/12/321283.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1203', '321302000000', '宿城区', '', '125', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/13/321302.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1204', '321311000000', '宿豫区', '', '125', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/13/321311.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1205', '321322000000', '沭阳县', '', '125', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/13/321322.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1206', '321323000000', '泗阳县', '', '125', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/13/321323.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1207', '321324000000', '泗洪县', '', '125', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/32/13/321324.html', '2017-05-03 16:36:58', '2017-05-03 16:36:58');
INSERT INTO `sys_dict_china_city` VALUES ('1208', '330102000000', '上城区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330102.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1209', '330103000000', '下城区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330103.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1210', '330104000000', '江干区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330104.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1211', '330105000000', '拱墅区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330105.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1212', '330106000000', '西湖区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330106.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1213', '330108000000', '滨江区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330108.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1214', '330109000000', '萧山区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330109.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1215', '330110000000', '余杭区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330110.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1216', '330111000000', '富阳区', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330111.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1217', '330122000000', '桐庐县', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330122.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1218', '330127000000', '淳安县', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330127.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1219', '330182000000', '建德市', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330182.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1220', '330185000000', '临安市', '', '126', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/01/330185.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1221', '330203000000', '海曙区', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330203.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1222', '330204000000', '江东区', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330204.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1223', '330205000000', '江北区', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330205.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1224', '330206000000', '北仑区', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330206.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1225', '330211000000', '镇海区', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330211.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1226', '330212000000', '鄞州区', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330212.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1227', '330225000000', '象山县', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330225.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1228', '330226000000', '宁海县', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330226.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1229', '330281000000', '余姚市', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330281.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1230', '330282000000', '慈溪市', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330282.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1231', '330283000000', '奉化市', '', '127', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/02/330283.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1232', '330302000000', '鹿城区', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330302.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1233', '330303000000', '龙湾区', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330303.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1234', '330304000000', '瓯海区', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330304.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1235', '330305000000', '洞头区', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330305.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1236', '330324000000', '永嘉县', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330324.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1237', '330326000000', '平阳县', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330326.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1238', '330327000000', '苍南县', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330327.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1239', '330328000000', '文成县', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330328.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1240', '330329000000', '泰顺县', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330329.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1241', '330381000000', '瑞安市', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330381.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1242', '330382000000', '乐清市', '', '128', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/03/330382.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1243', '330402000000', '南湖区', '', '129', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/04/330402.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1244', '330411000000', '秀洲区', '', '129', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/04/330411.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1245', '330421000000', '嘉善县', '', '129', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/04/330421.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1246', '330424000000', '海盐县', '', '129', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/04/330424.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1247', '330481000000', '海宁市', '', '129', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/04/330481.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1248', '330482000000', '平湖市', '', '129', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/04/330482.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1249', '330483000000', '桐乡市', '', '129', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/04/330483.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1250', '330502000000', '吴兴区', '', '130', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/05/330502.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1251', '330503000000', '南浔区', '', '130', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/05/330503.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1252', '330521000000', '德清县', '', '130', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/05/330521.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1253', '330522000000', '长兴县', '', '130', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/05/330522.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1254', '330523000000', '安吉县', '', '130', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/05/330523.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1255', '330602000000', '越城区', '', '131', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/06/330602.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1256', '330603000000', '柯桥区', '', '131', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/06/330603.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1257', '330604000000', '上虞区', '', '131', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/06/330604.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1258', '330624000000', '新昌县', '', '131', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/06/330624.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1259', '330681000000', '诸暨市', '', '131', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/06/330681.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1260', '330683000000', '嵊州市', '', '131', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/06/330683.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1261', '330702000000', '婺城区', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330702.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1262', '330703000000', '金东区', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330703.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1263', '330723000000', '武义县', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330723.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1264', '330726000000', '浦江县', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330726.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1265', '330727000000', '磐安县', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330727.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1266', '330781000000', '兰溪市', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330781.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1267', '330782000000', '义乌市', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330782.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1268', '330783000000', '东阳市', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330783.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1269', '330784000000', '永康市', '', '132', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/07/330784.html', '2017-05-03 16:36:59', '2017-05-03 16:36:59');
INSERT INTO `sys_dict_china_city` VALUES ('1270', '330802000000', '柯城区', '', '133', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/08/330802.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1271', '330803000000', '衢江区', '', '133', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/08/330803.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1272', '330822000000', '常山县', '', '133', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/08/330822.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1273', '330824000000', '开化县', '', '133', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/08/330824.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1274', '330825000000', '龙游县', '', '133', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/08/330825.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1275', '330881000000', '江山市', '', '133', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/08/330881.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1276', '330902000000', '定海区', '', '134', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/09/330902.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1277', '330903000000', '普陀区', '', '134', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/09/330903.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1278', '330921000000', '岱山县', '', '134', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/09/330921.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1279', '330922000000', '嵊泗县', '', '134', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/09/330922.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1280', '331002000000', '椒江区', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331002.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1281', '331003000000', '黄岩区', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331003.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1282', '331004000000', '路桥区', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331004.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1283', '331021000000', '玉环县', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331021.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1284', '331022000000', '三门县', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331022.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1285', '331023000000', '天台县', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331023.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1286', '331024000000', '仙居县', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331024.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1287', '331081000000', '温岭市', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331081.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1288', '331082000000', '临海市', '', '135', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/10/331082.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1289', '331102000000', '莲都区', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331102.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1290', '331121000000', '青田县', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331121.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1291', '331122000000', '缙云县', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331122.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1292', '331123000000', '遂昌县', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331123.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1293', '331124000000', '松阳县', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331124.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1294', '331125000000', '云和县', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331125.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1295', '331126000000', '庆元县', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331126.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1296', '331127000000', '景宁畲族自治县', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331127.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1297', '331181000000', '龙泉市', '', '136', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/33/11/331181.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1298', '340102000000', '瑶海区', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340102.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1299', '340103000000', '庐阳区', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340103.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1300', '340104000000', '蜀山区', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340104.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1301', '340111000000', '包河区', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340111.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1302', '340121000000', '长丰县', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340121.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1303', '340122000000', '肥东县', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340122.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1304', '340123000000', '肥西县', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340123.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1305', '340124000000', '庐江县', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340124.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1306', '340181000000', '巢湖市', '', '137', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/01/340181.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1307', '340202000000', '镜湖区', '', '138', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/02/340202.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1308', '340203000000', '弋江区', '', '138', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/02/340203.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1309', '340207000000', '鸠江区', '', '138', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/02/340207.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1310', '340208000000', '三山区', '', '138', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/02/340208.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1311', '340221000000', '芜湖县', '', '138', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/02/340221.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1312', '340222000000', '繁昌县', '', '138', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/02/340222.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1313', '340223000000', '南陵县', '', '138', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/02/340223.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1314', '340225000000', '无为县', '', '138', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/02/340225.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1315', '340302000000', '龙子湖区', '', '139', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/03/340302.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1316', '340303000000', '蚌山区', '', '139', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/03/340303.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1317', '340304000000', '禹会区', '', '139', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/03/340304.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1318', '340311000000', '淮上区', '', '139', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/03/340311.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1319', '340321000000', '怀远县', '', '139', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/03/340321.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1320', '340322000000', '五河县', '', '139', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/03/340322.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1321', '340323000000', '固镇县', '', '139', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/03/340323.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1322', '340402000000', '大通区', '', '140', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/04/340402.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1323', '340403000000', '田家庵区', '', '140', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/04/340403.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1324', '340404000000', '谢家集区', '', '140', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/04/340404.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1325', '340405000000', '八公山区', '', '140', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/04/340405.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1326', '340406000000', '潘集区', '', '140', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/04/340406.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1327', '340421000000', '凤台县', '', '140', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/04/340421.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1328', '340503000000', '花山区', '', '141', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/05/340503.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1329', '340504000000', '雨山区', '', '141', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/05/340504.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1330', '340506000000', '博望区', '', '141', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/05/340506.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1331', '340521000000', '当涂县', '', '141', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/05/340521.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1332', '340522000000', '含山县', '', '141', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/05/340522.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1333', '340523000000', '和县', '', '141', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/05/340523.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1334', '340602000000', '杜集区', '', '142', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/06/340602.html', '2017-05-03 16:37:00', '2017-05-03 16:37:00');
INSERT INTO `sys_dict_china_city` VALUES ('1335', '340603000000', '相山区', '', '142', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/06/340603.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1336', '340604000000', '烈山区', '', '142', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/06/340604.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1337', '340621000000', '濉溪县', '', '142', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/06/340621.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1338', '340702000000', '铜官山区', '', '143', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/07/340702.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1339', '340703000000', '狮子山区', '', '143', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/07/340703.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1340', '340711000000', '郊区', '', '143', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/07/340711.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1341', '340721000000', '铜陵县', '', '143', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/07/340721.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1342', '340802000000', '迎江区', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340802.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1343', '340803000000', '大观区', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340803.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1344', '340811000000', '宜秀区', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340811.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1345', '340822000000', '怀宁县', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340822.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1346', '340823000000', '枞阳县', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340823.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1347', '340824000000', '潜山县', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340824.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1348', '340825000000', '太湖县', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340825.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1349', '340826000000', '宿松县', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340826.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1350', '340827000000', '望江县', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340827.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1351', '340828000000', '岳西县', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340828.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1352', '340881000000', '桐城市', '', '144', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/08/340881.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1353', '341002000000', '屯溪区', '', '145', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/10/341002.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1354', '341003000000', '黄山区', '', '145', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/10/341003.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1355', '341004000000', '徽州区', '', '145', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/10/341004.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1356', '341021000000', '歙县', '', '145', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/10/341021.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1357', '341022000000', '休宁县', '', '145', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/10/341022.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1358', '341023000000', '黟县', '', '145', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/10/341023.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1359', '341024000000', '祁门县', '', '145', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/10/341024.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1360', '341102000000', '琅琊区', '', '146', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/11/341102.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1361', '341103000000', '南谯区', '', '146', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/11/341103.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1362', '341122000000', '来安县', '', '146', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/11/341122.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1363', '341124000000', '全椒县', '', '146', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/11/341124.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1364', '341125000000', '定远县', '', '146', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/11/341125.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1365', '341126000000', '凤阳县', '', '146', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/11/341126.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1366', '341181000000', '天长市', '', '146', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/11/341181.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1367', '341182000000', '明光市', '', '146', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/11/341182.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1368', '341202000000', '颍州区', '', '147', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/12/341202.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1369', '341203000000', '颍东区', '', '147', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/12/341203.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1370', '341204000000', '颍泉区', '', '147', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/12/341204.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1371', '341221000000', '临泉县', '', '147', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/12/341221.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1372', '341222000000', '太和县', '', '147', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/12/341222.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1373', '341225000000', '阜南县', '', '147', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/12/341225.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1374', '341226000000', '颍上县', '', '147', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/12/341226.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1375', '341282000000', '界首市', '', '147', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/12/341282.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1376', '341302000000', '�桥区', '', '148', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/13/341302.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1377', '341321000000', '砀山县', '', '148', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/13/341321.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1378', '341322000000', '萧县', '', '148', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/13/341322.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1379', '341323000000', '灵璧县', '', '148', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/13/341323.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1380', '341324000000', '泗县', '', '148', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/13/341324.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1381', '341502000000', '金安区', '', '149', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/15/341502.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1382', '341503000000', '裕安区', '', '149', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/15/341503.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1383', '341521000000', '寿县', '', '149', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/15/341521.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1384', '341522000000', '霍邱县', '', '149', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/15/341522.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1385', '341523000000', '舒城县', '', '149', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/15/341523.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1386', '341524000000', '金寨县', '', '149', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/15/341524.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1387', '341525000000', '霍山县', '', '149', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/15/341525.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1388', '341602000000', '谯城区', '', '150', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/16/341602.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1389', '341621000000', '涡阳县', '', '150', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/16/341621.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1390', '341622000000', '蒙城县', '', '150', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/16/341622.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1391', '341623000000', '利辛县', '', '150', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/16/341623.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1392', '341702000000', '贵池区', '', '151', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/17/341702.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1393', '341721000000', '东至县', '', '151', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/17/341721.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1394', '341722000000', '石台县', '', '151', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/17/341722.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1395', '341723000000', '青阳县', '', '151', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/17/341723.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1396', '341802000000', '宣州区', '', '152', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/18/341802.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1397', '341821000000', '郎溪县', '', '152', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/18/341821.html', '2017-05-03 16:37:01', '2017-05-03 16:37:01');
INSERT INTO `sys_dict_china_city` VALUES ('1398', '341822000000', '广德县', '', '152', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/18/341822.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1399', '341823000000', '泾县', '', '152', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/18/341823.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1400', '341824000000', '绩溪县', '', '152', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/18/341824.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1401', '341825000000', '旌德县', '', '152', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/18/341825.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1402', '341881000000', '宁国市', '', '152', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/34/18/341881.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1403', '350102000000', '鼓楼区', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350102.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1404', '350103000000', '台江区', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350103.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1405', '350104000000', '仓山区', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350104.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1406', '350105000000', '马尾区', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350105.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1407', '350111000000', '晋安区', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350111.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1408', '350121000000', '闽侯县', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350121.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1409', '350122000000', '连江县', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350122.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1410', '350123000000', '罗源县', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350123.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1411', '350124000000', '闽清县', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350124.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1412', '350125000000', '永泰县', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350125.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1413', '350128000000', '平潭县', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350128.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1414', '350181000000', '福清市', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350181.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1415', '350182000000', '长乐市', '', '153', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/01/350182.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1416', '350203000000', '思明区', '', '154', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/02/350203.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1417', '350205000000', '海沧区', '', '154', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/02/350205.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1418', '350206000000', '湖里区', '', '154', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/02/350206.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1419', '350211000000', '集美区', '', '154', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/02/350211.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1420', '350212000000', '同安区', '', '154', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/02/350212.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1421', '350213000000', '翔安区', '', '154', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/02/350213.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1422', '350302000000', '城厢区', '', '155', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/03/350302.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1423', '350303000000', '涵江区', '', '155', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/03/350303.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1424', '350304000000', '荔城区', '', '155', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/03/350304.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1425', '350305000000', '秀屿区', '', '155', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/03/350305.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1426', '350322000000', '仙游县', '', '155', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/03/350322.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1427', '350402000000', '梅列区', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350402.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1428', '350403000000', '三元区', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350403.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1429', '350421000000', '明溪县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350421.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1430', '350423000000', '清流县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350423.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1431', '350424000000', '宁化县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350424.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1432', '350425000000', '大田县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350425.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1433', '350426000000', '尤溪县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350426.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1434', '350427000000', '沙县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350427.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1435', '350428000000', '将乐县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350428.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1436', '350429000000', '泰宁县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350429.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1437', '350430000000', '建宁县', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350430.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1438', '350481000000', '永安市', '', '156', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/04/350481.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1439', '350502000000', '鲤城区', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350502.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1440', '350503000000', '丰泽区', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350503.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1441', '350504000000', '洛江区', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350504.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1442', '350505000000', '泉港区', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350505.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1443', '350521000000', '惠安县', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350521.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1444', '350524000000', '安溪县', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350524.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1445', '350525000000', '永春县', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350525.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1446', '350526000000', '德化县', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350526.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1447', '350581000000', '石狮市', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350581.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1448', '350582000000', '晋江市', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350582.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1449', '350583000000', '南安市', '', '157', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/05/350583.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1450', '350602000000', '芗城区', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350602.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1451', '350603000000', '龙文区', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350603.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1452', '350622000000', '云霄县', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350622.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1453', '350623000000', '漳浦县', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350623.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1454', '350624000000', '诏安县', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350624.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1455', '350625000000', '长泰县', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350625.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1456', '350626000000', '东山县', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350626.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1457', '350627000000', '南靖县', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350627.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1458', '350628000000', '平和县', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350628.html', '2017-05-03 16:37:02', '2017-05-03 16:37:02');
INSERT INTO `sys_dict_china_city` VALUES ('1459', '350629000000', '华安县', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350629.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1460', '350681000000', '龙海市', '', '158', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/06/350681.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1461', '350702000000', '延平区', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350702.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1462', '350703000000', '建阳区', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350703.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1463', '350721000000', '顺昌县', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350721.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1464', '350722000000', '浦城县', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350722.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1465', '350723000000', '光泽县', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350723.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1466', '350724000000', '松溪县', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350724.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1467', '350725000000', '政和县', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350725.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1468', '350781000000', '邵武市', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350781.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1469', '350782000000', '武夷山市', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350782.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1470', '350783000000', '建瓯市', '', '159', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/07/350783.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1471', '350802000000', '新罗区', '', '160', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/08/350802.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1472', '350803000000', '永定区', '', '160', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/08/350803.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1473', '350821000000', '长汀县', '', '160', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/08/350821.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1474', '350823000000', '上杭县', '', '160', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/08/350823.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1475', '350824000000', '武平县', '', '160', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/08/350824.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1476', '350825000000', '连城县', '', '160', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/08/350825.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1477', '350881000000', '漳平市', '', '160', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/08/350881.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1478', '350902000000', '蕉城区', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350902.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1479', '350921000000', '霞浦县', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350921.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1480', '350922000000', '古田县', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350922.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1481', '350923000000', '屏南县', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350923.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1482', '350924000000', '寿宁县', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350924.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1483', '350925000000', '周宁县', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350925.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1484', '350926000000', '柘荣县', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350926.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1485', '350981000000', '福安市', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350981.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1486', '350982000000', '福鼎市', '', '161', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/35/09/350982.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1487', '360102000000', '东湖区', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360102.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1488', '360103000000', '西湖区', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360103.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1489', '360104000000', '青云谱区', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360104.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1490', '360105000000', '湾里区', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360105.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1491', '360111000000', '青山湖区', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360111.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1492', '360112000000', '新建区', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360112.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1493', '360121000000', '南昌县', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360121.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1494', '360123000000', '安义县', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360123.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1495', '360124000000', '进贤县', '', '162', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/01/360124.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1496', '360202000000', '昌江区', '', '163', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/02/360202.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1497', '360203000000', '珠山区', '', '163', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/02/360203.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1498', '360222000000', '浮梁县', '', '163', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/02/360222.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1499', '360281000000', '乐平市', '', '163', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/02/360281.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1500', '360302000000', '安源区', '', '164', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/03/360302.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1501', '360313000000', '湘东区', '', '164', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/03/360313.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1502', '360321000000', '莲花县', '', '164', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/03/360321.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1503', '360322000000', '上栗县', '', '164', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/03/360322.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1504', '360323000000', '芦溪县', '', '164', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/03/360323.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1505', '360402000000', '庐山区', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360402.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1506', '360403000000', '浔阳区', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360403.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1507', '360421000000', '九江县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360421.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1508', '360423000000', '武宁县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360423.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1509', '360424000000', '修水县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360424.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1510', '360425000000', '永修县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360425.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1511', '360426000000', '德安县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360426.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1512', '360427000000', '星子县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360427.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1513', '360428000000', '都昌县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360428.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1514', '360429000000', '湖口县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360429.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1515', '360430000000', '彭泽县', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360430.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1516', '360481000000', '瑞昌市', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360481.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1517', '360482000000', '共青城市', '', '165', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/04/360482.html', '2017-05-03 16:37:03', '2017-05-03 16:37:03');
INSERT INTO `sys_dict_china_city` VALUES ('1518', '360502000000', '渝水区', '', '166', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/05/360502.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1519', '360521000000', '分宜县', '', '166', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/05/360521.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1520', '360602000000', '月湖区', '', '167', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/06/360602.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1521', '360622000000', '余江县', '', '167', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/06/360622.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1522', '360681000000', '贵溪市', '', '167', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/06/360681.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1523', '360702000000', '章贡区', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360702.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1524', '360703000000', '南康区', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360703.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1525', '360721000000', '赣县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360721.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1526', '360722000000', '信丰县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360722.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1527', '360723000000', '大余县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360723.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1528', '360724000000', '上犹县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360724.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1529', '360725000000', '崇义县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360725.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1530', '360726000000', '安远县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360726.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1531', '360727000000', '龙南县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360727.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1532', '360728000000', '定南县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360728.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1533', '360729000000', '全南县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360729.html', '2017-05-03 16:37:04', '2017-05-03 16:37:04');
INSERT INTO `sys_dict_china_city` VALUES ('1534', '360730000000', '宁都县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360730.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1535', '360731000000', '于都县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360731.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1536', '360732000000', '兴国县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360732.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1537', '360733000000', '会昌县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360733.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1538', '360734000000', '寻乌县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360734.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1539', '360735000000', '石城县', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360735.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1540', '360781000000', '瑞金市', '', '168', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/07/360781.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1541', '360802000000', '吉州区', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360802.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1542', '360803000000', '青原区', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360803.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1543', '360821000000', '吉安县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360821.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1544', '360822000000', '吉水县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360822.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1545', '360823000000', '峡江县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360823.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1546', '360824000000', '新干县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360824.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1547', '360825000000', '永丰县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360825.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1548', '360826000000', '泰和县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360826.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1549', '360827000000', '遂川县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360827.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1550', '360828000000', '万安县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360828.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1551', '360829000000', '安福县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360829.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1552', '360830000000', '永新县', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360830.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1553', '360881000000', '井冈山市', '', '169', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/08/360881.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1554', '360902000000', '袁州区', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360902.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1555', '360921000000', '奉新县', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360921.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1556', '360922000000', '万载县', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360922.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1557', '360923000000', '上高县', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360923.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1558', '360924000000', '宜丰县', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360924.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1559', '360925000000', '靖安县', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360925.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1560', '360926000000', '铜鼓县', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360926.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1561', '360981000000', '丰城市', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360981.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1562', '360982000000', '樟树市', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360982.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1563', '360983000000', '高安市', '', '170', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/09/360983.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1564', '361002000000', '临川区', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361002.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1565', '361021000000', '南城县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361021.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1566', '361022000000', '黎川县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361022.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1567', '361023000000', '南丰县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361023.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1568', '361024000000', '崇仁县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361024.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1569', '361025000000', '乐安县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361025.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1570', '361026000000', '宜黄县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361026.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1571', '361027000000', '金溪县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361027.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1572', '361028000000', '资溪县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361028.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1573', '361029000000', '东乡县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361029.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1574', '361030000000', '广昌县', '', '171', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/10/361030.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1575', '361102000000', '信州区', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361102.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1576', '361103000000', '广丰区', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361103.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1577', '361121000000', '上饶县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361121.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1578', '361123000000', '玉山县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361123.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1579', '361124000000', '铅山县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361124.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1580', '361125000000', '横峰县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361125.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1581', '361126000000', '弋阳县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361126.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1582', '361127000000', '余干县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361127.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1583', '361128000000', '鄱阳县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361128.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1584', '361129000000', '万年县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361129.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1585', '361130000000', '婺源县', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361130.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1586', '361181000000', '德兴市', '', '172', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/36/11/361181.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1587', '370102000000', '历下区', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370102.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1588', '370103000000', '市中区', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370103.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1589', '370104000000', '槐荫区', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370104.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1590', '370105000000', '天桥区', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370105.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1591', '370112000000', '历城区', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370112.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1592', '370113000000', '长清区', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370113.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1593', '370124000000', '平阴县', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370124.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1594', '370125000000', '济阳县', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370125.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1595', '370126000000', '商河县', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370126.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1596', '370181000000', '章丘市', '', '173', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/01/370181.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1597', '370202000000', '市南区', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370202.html', '2017-05-03 16:37:05', '2017-05-03 16:37:05');
INSERT INTO `sys_dict_china_city` VALUES ('1598', '370203000000', '市北区', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370203.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1599', '370211000000', '黄岛区', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370211.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1600', '370212000000', '崂山区', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370212.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1601', '370213000000', '李沧区', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370213.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1602', '370214000000', '城阳区', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370214.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1603', '370281000000', '胶州市', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370281.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1604', '370282000000', '即墨市', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370282.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1605', '370283000000', '平度市', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370283.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1606', '370285000000', '莱西市', '', '174', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/02/370285.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1607', '370302000000', '淄川区', '', '175', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/03/370302.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1608', '370303000000', '张店区', '', '175', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/03/370303.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1609', '370304000000', '博山区', '', '175', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/03/370304.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1610', '370305000000', '临淄区', '', '175', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/03/370305.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1611', '370306000000', '周村区', '', '175', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/03/370306.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1612', '370321000000', '桓台县', '', '175', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/03/370321.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1613', '370322000000', '高青县', '', '175', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/03/370322.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1614', '370323000000', '沂源县', '', '175', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/03/370323.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1615', '370402000000', '市中区', '', '176', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/04/370402.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1616', '370403000000', '薛城区', '', '176', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/04/370403.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1617', '370404000000', '峄城区', '', '176', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/04/370404.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1618', '370405000000', '台儿庄区', '', '176', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/04/370405.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1619', '370406000000', '山亭区', '', '176', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/04/370406.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1620', '370481000000', '滕州市', '', '176', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/04/370481.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1621', '370502000000', '东营区', '', '177', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/05/370502.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1622', '370503000000', '河口区', '', '177', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/05/370503.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1623', '370521000000', '垦利县', '', '177', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/05/370521.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1624', '370522000000', '利津县', '', '177', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/05/370522.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1625', '370523000000', '广饶县', '', '177', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/05/370523.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1626', '370602000000', '芝罘区', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370602.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1627', '370611000000', '福山区', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370611.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1628', '370612000000', '牟平区', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370612.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1629', '370613000000', '莱山区', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370613.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1630', '370634000000', '长岛县', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370634.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1631', '370681000000', '龙口市', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370681.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1632', '370682000000', '莱阳市', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370682.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1633', '370683000000', '莱州市', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370683.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1634', '370684000000', '蓬莱市', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370684.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1635', '370685000000', '招远市', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370685.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1636', '370686000000', '栖霞市', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370686.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1637', '370687000000', '海阳市', '', '178', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/06/370687.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1638', '370702000000', '潍城区', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370702.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1639', '370703000000', '寒亭区', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370703.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1640', '370704000000', '坊子区', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370704.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1641', '370705000000', '奎文区', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370705.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1642', '370724000000', '临朐县', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370724.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1643', '370725000000', '昌乐县', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370725.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1644', '370781000000', '青州市', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370781.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1645', '370782000000', '诸城市', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370782.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1646', '370783000000', '寿光市', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370783.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1647', '370784000000', '安丘市', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370784.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1648', '370785000000', '高密市', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370785.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1649', '370786000000', '昌邑市', '', '179', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/07/370786.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1650', '370811000000', '任城区', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370811.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1651', '370812000000', '兖州区', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370812.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1652', '370826000000', '微山县', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370826.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1653', '370827000000', '鱼台县', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370827.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1654', '370828000000', '金乡县', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370828.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1655', '370829000000', '嘉祥县', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370829.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1656', '370830000000', '汶上县', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370830.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1657', '370831000000', '泗水县', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370831.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1658', '370832000000', '梁山县', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370832.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1659', '370881000000', '曲阜市', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370881.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1660', '370883000000', '邹城市', '', '180', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/08/370883.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1661', '370902000000', '泰山区', '', '181', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/09/370902.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1662', '370911000000', '岱岳区', '', '181', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/09/370911.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1663', '370921000000', '宁阳县', '', '181', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/09/370921.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1664', '370923000000', '东平县', '', '181', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/09/370923.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1665', '370982000000', '新泰市', '', '181', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/09/370982.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1666', '370983000000', '肥城市', '', '181', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/09/370983.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1667', '371002000000', '环翠区', '', '182', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/10/371002.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1668', '371003000000', '文登区', '', '182', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/10/371003.html', '2017-05-03 16:37:06', '2017-05-03 16:37:06');
INSERT INTO `sys_dict_china_city` VALUES ('1669', '371082000000', '荣成市', '', '182', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/10/371082.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1670', '371083000000', '乳山市', '', '182', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/10/371083.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1671', '371102000000', '东港区', '', '183', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/11/371102.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1672', '371103000000', '岚山区', '', '183', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/11/371103.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1673', '371121000000', '五莲县', '', '183', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/11/371121.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1674', '371122000000', '莒县', '', '183', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/11/371122.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1675', '371202000000', '莱城区', '', '184', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/12/371202.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1676', '371203000000', '钢城区', '', '184', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/12/371203.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1677', '371302000000', '兰山区', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371302.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1678', '371311000000', '罗庄区', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371311.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1679', '371312000000', '河东区', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371312.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1680', '371321000000', '沂南县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371321.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1681', '371322000000', '郯城县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371322.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1682', '371323000000', '沂水县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371323.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1683', '371324000000', '兰陵县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371324.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1684', '371325000000', '费县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371325.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1685', '371326000000', '平邑县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371326.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1686', '371327000000', '莒南县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371327.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1687', '371328000000', '蒙阴县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371328.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1688', '371329000000', '临沭县', '', '185', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/13/371329.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1689', '371402000000', '德城区', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371402.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1690', '371403000000', '陵城区', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371403.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1691', '371422000000', '宁津县', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371422.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1692', '371423000000', '庆云县', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371423.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1693', '371424000000', '临邑县', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371424.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1694', '371425000000', '齐河县', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371425.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1695', '371426000000', '平原县', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371426.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1696', '371427000000', '夏津县', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371427.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1697', '371428000000', '武城县', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371428.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1698', '371481000000', '乐陵市', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371481.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1699', '371482000000', '禹城市', '', '186', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/14/371482.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1700', '371502000000', '东昌府区', '', '187', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/15/371502.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1701', '371521000000', '阳谷县', '', '187', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/15/371521.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1702', '371522000000', '莘县', '', '187', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/15/371522.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1703', '371523000000', '茌平县', '', '187', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/15/371523.html', '2017-05-03 16:37:07', '2017-05-03 16:37:07');
INSERT INTO `sys_dict_china_city` VALUES ('1704', '371524000000', '东阿县', '', '187', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/15/371524.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1705', '371525000000', '冠县', '', '187', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/15/371525.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1706', '371526000000', '高唐县', '', '187', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/15/371526.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1707', '371581000000', '临清市', '', '187', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/15/371581.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1708', '371602000000', '滨城区', '', '188', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/16/371602.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1709', '371603000000', '沾化区', '', '188', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/16/371603.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1710', '371621000000', '惠民县', '', '188', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/16/371621.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1711', '371622000000', '阳信县', '', '188', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/16/371622.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1712', '371623000000', '无棣县', '', '188', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/16/371623.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1713', '371625000000', '博兴县', '', '188', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/16/371625.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1714', '371626000000', '邹平县', '', '188', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/16/371626.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1715', '371702000000', '牡丹区', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371702.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1716', '371721000000', '曹县', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371721.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1717', '371722000000', '单县', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371722.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1718', '371723000000', '成武县', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371723.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1719', '371724000000', '巨野县', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371724.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1720', '371725000000', '郓城县', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371725.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1721', '371726000000', '鄄城县', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371726.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1722', '371727000000', '定陶县', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371727.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1723', '371728000000', '东明县', '', '189', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/37/17/371728.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1724', '410102000000', '中原区', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410102.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1725', '410103000000', '二七区', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410103.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1726', '410104000000', '管城回族区', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410104.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1727', '410105000000', '金水区', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410105.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1728', '410106000000', '上街区', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410106.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1729', '410108000000', '惠济区', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410108.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1730', '410122000000', '中牟县', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410122.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1731', '410181000000', '巩义市', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410181.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1732', '410182000000', '荥阳市', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410182.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1733', '410183000000', '新密市', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410183.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1734', '410184000000', '新郑市', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410184.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1735', '410185000000', '登封市', '', '190', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/01/410185.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1736', '410202000000', '龙亭区', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410202.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1737', '410203000000', '顺河回族区', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410203.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1738', '410204000000', '鼓楼区', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410204.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1739', '410205000000', '禹王台区', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410205.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1740', '410211000000', '金明区', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410211.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1741', '410212000000', '祥符区', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410212.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1742', '410221000000', '杞县', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410221.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1743', '410222000000', '通许县', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410222.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1744', '410223000000', '尉氏县', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410223.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1745', '410225000000', '兰考县', '', '191', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/02/410225.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1746', '410302000000', '老城区', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410302.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1747', '410303000000', '西工区', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410303.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1748', '410304000000', '�河回族区', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410304.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1749', '410305000000', '涧西区', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410305.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1750', '410306000000', '吉利区', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410306.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1751', '410311000000', '洛龙区', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410311.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1752', '410322000000', '孟津县', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410322.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1753', '410323000000', '新安县', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410323.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1754', '410324000000', '栾川县', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410324.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1755', '410325000000', '嵩县', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410325.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1756', '410326000000', '汝阳县', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410326.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1757', '410327000000', '宜阳县', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410327.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1758', '410328000000', '洛宁县', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410328.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1759', '410329000000', '伊川县', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410329.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1760', '410381000000', '偃师市', '', '192', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/03/410381.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1761', '410402000000', '新华区', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410402.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1762', '410403000000', '卫东区', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410403.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1763', '410404000000', '石龙区', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410404.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1764', '410411000000', '湛河区', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410411.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1765', '410421000000', '宝丰县', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410421.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1766', '410422000000', '叶县', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410422.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1767', '410423000000', '鲁山县', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410423.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1768', '410425000000', '郏县', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410425.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1769', '410481000000', '舞钢市', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410481.html', '2017-05-03 16:37:08', '2017-05-03 16:37:08');
INSERT INTO `sys_dict_china_city` VALUES ('1770', '410482000000', '汝州市', '', '193', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/04/410482.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1771', '410502000000', '文峰区', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410502.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1772', '410503000000', '北关区', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410503.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1773', '410505000000', '殷都区', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410505.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1774', '410506000000', '龙安区', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410506.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1775', '410522000000', '安阳县', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410522.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1776', '410523000000', '汤阴县', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410523.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1777', '410526000000', '滑县', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410526.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1778', '410527000000', '内黄县', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410527.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1779', '410581000000', '林州市', '', '194', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/05/410581.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1780', '410602000000', '鹤山区', '', '195', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/06/410602.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1781', '410603000000', '山城区', '', '195', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/06/410603.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1782', '410611000000', '淇滨区', '', '195', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/06/410611.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1783', '410621000000', '浚县', '', '195', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/06/410621.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1784', '410622000000', '淇县', '', '195', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/06/410622.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1785', '410702000000', '红旗区', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410702.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1786', '410703000000', '卫滨区', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410703.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1787', '410704000000', '凤泉区', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410704.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1788', '410711000000', '牧野区', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410711.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1789', '410721000000', '新乡县', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410721.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1790', '410724000000', '获嘉县', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410724.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1791', '410725000000', '原阳县', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410725.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1792', '410726000000', '延津县', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410726.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1793', '410727000000', '封丘县', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410727.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1794', '410728000000', '长垣县', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410728.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1795', '410781000000', '卫辉市', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410781.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1796', '410782000000', '辉县市', '', '196', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/07/410782.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1797', '410802000000', '解放区', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410802.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1798', '410803000000', '中站区', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410803.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1799', '410804000000', '马村区', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410804.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1800', '410811000000', '山阳区', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410811.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1801', '410821000000', '修武县', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410821.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1802', '410822000000', '博爱县', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410822.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1803', '410823000000', '武陟县', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410823.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1804', '410825000000', '温县', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410825.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1805', '410882000000', '沁阳市', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410882.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1806', '410883000000', '孟州市', '', '197', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/08/410883.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1807', '410902000000', '华龙区', '', '198', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/09/410902.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1808', '410922000000', '清丰县', '', '198', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/09/410922.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1809', '410923000000', '南乐县', '', '198', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/09/410923.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1810', '410926000000', '范县', '', '198', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/09/410926.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1811', '410927000000', '台前县', '', '198', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/09/410927.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1812', '410928000000', '濮阳县', '', '198', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/09/410928.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1813', '411002000000', '魏都区', '', '199', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/10/411002.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1814', '411023000000', '许昌县', '', '199', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/10/411023.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1815', '411024000000', '鄢陵县', '', '199', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/10/411024.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1816', '411025000000', '襄城县', '', '199', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/10/411025.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1817', '411081000000', '禹州市', '', '199', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/10/411081.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1818', '411082000000', '长葛市', '', '199', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/10/411082.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1819', '411102000000', '源汇区', '', '200', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/11/411102.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1820', '411103000000', '郾城区', '', '200', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/11/411103.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1821', '411104000000', '召陵区', '', '200', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/11/411104.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1822', '411121000000', '舞阳县', '', '200', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/11/411121.html', '2017-05-03 16:37:09', '2017-05-03 16:37:09');
INSERT INTO `sys_dict_china_city` VALUES ('1823', '411122000000', '临颍县', '', '200', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/11/411122.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1824', '411202000000', '湖滨区', '', '201', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/12/411202.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1825', '411221000000', '渑池县', '', '201', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/12/411221.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1826', '411222000000', '陕县', '', '201', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/12/411222.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1827', '411224000000', '卢氏县', '', '201', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/12/411224.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1828', '411281000000', '义马市', '', '201', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/12/411281.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1829', '411282000000', '灵宝市', '', '201', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/12/411282.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1830', '411302000000', '宛城区', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411302.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1831', '411303000000', '卧龙区', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411303.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1832', '411321000000', '南召县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411321.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1833', '411322000000', '方城县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411322.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1834', '411323000000', '西峡县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411323.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1835', '411324000000', '镇平县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411324.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1836', '411325000000', '内乡县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411325.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1837', '411326000000', '淅川县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411326.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1838', '411327000000', '社旗县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411327.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1839', '411328000000', '唐河县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411328.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1840', '411329000000', '新野县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411329.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1841', '411330000000', '桐柏县', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411330.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1842', '411381000000', '邓州市', '', '202', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/13/411381.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1843', '411402000000', '梁园区', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411402.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1844', '411403000000', '睢阳区', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411403.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1845', '411421000000', '民权县', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411421.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1846', '411422000000', '睢县', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411422.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1847', '411423000000', '宁陵县', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411423.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1848', '411424000000', '柘城县', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411424.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1849', '411425000000', '虞城县', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411425.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1850', '411426000000', '夏邑县', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411426.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1851', '411481000000', '永城市', '', '203', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/14/411481.html', '2017-05-03 16:37:10', '2017-05-03 16:37:10');
INSERT INTO `sys_dict_china_city` VALUES ('1852', '411502000000', '�河区', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411502.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1853', '411503000000', '平桥区', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411503.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1854', '411521000000', '罗山县', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411521.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1855', '411522000000', '光山县', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411522.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1856', '411523000000', '新县', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411523.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1857', '411524000000', '商城县', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411524.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1858', '411525000000', '固始县', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411525.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1859', '411526000000', '潢川县', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411526.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1860', '411527000000', '淮滨县', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411527.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1861', '411528000000', '息县', '', '204', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/15/411528.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1862', '411602000000', '川汇区', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411602.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1863', '411621000000', '扶沟县', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411621.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1864', '411622000000', '西华县', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411622.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1865', '411623000000', '商水县', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411623.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1866', '411624000000', '沈丘县', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411624.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1867', '411625000000', '郸城县', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411625.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1868', '411626000000', '淮阳县', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411626.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1869', '411627000000', '太康县', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411627.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1870', '411628000000', '鹿邑县', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411628.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1871', '411681000000', '项城市', '', '205', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/16/411681.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1872', '411702000000', '驿城区', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411702.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1873', '411721000000', '西平县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411721.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1874', '411722000000', '上蔡县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411722.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1875', '411723000000', '平舆县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411723.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1876', '411724000000', '正阳县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411724.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1877', '411725000000', '确山县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411725.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1878', '411726000000', '泌阳县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411726.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1879', '411727000000', '汝南县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411727.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1880', '411728000000', '遂平县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411728.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1881', '411729000000', '新蔡县', '', '206', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/17/411729.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1882', '419001000000', '济源市', '', '207', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/41/90/419001.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1883', '420102000000', '江岸区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420102.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1884', '420103000000', '江汉区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420103.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1885', '420104000000', '�口区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420104.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1886', '420105000000', '汉阳区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420105.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1887', '420106000000', '武昌区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420106.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1888', '420107000000', '青山区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420107.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1889', '420111000000', '洪山区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420111.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1890', '420112000000', '东西湖区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420112.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1891', '420113000000', '汉南区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420113.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1892', '420114000000', '蔡甸区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420114.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1893', '420115000000', '江夏区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420115.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1894', '420116000000', '黄陂区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420116.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1895', '420117000000', '新洲区', '', '208', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/01/420117.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1896', '420202000000', '黄石港区', '', '209', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/02/420202.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1897', '420203000000', '西塞山区', '', '209', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/02/420203.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1898', '420204000000', '下陆区', '', '209', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/02/420204.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1899', '420205000000', '铁山区', '', '209', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/02/420205.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1900', '420222000000', '阳新县', '', '209', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/02/420222.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1901', '420281000000', '大冶市', '', '209', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/02/420281.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1902', '420302000000', '茅箭区', '', '210', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/03/420302.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1903', '420303000000', '张湾区', '', '210', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/03/420303.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1904', '420304000000', '郧阳区', '', '210', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/03/420304.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1905', '420322000000', '郧西县', '', '210', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/03/420322.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1906', '420323000000', '竹山县', '', '210', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/03/420323.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1907', '420324000000', '竹溪县', '', '210', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/03/420324.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1908', '420325000000', '房县', '', '210', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/03/420325.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1909', '420381000000', '丹江口市', '', '210', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/03/420381.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1910', '420502000000', '西陵区', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420502.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1911', '420503000000', '伍家岗区', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420503.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1912', '420504000000', '点军区', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420504.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1913', '420505000000', '�亭区', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420505.html', '2017-05-03 16:37:11', '2017-05-03 16:37:11');
INSERT INTO `sys_dict_china_city` VALUES ('1914', '420506000000', '夷陵区', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420506.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1915', '420525000000', '远安县', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420525.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1916', '420526000000', '兴山县', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420526.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1917', '420527000000', '秭归县', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420527.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1918', '420528000000', '长阳土家族自治县', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420528.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1919', '420529000000', '五峰土家族自治县', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420529.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1920', '420581000000', '宜都市', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420581.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1921', '420582000000', '当阳市', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420582.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1922', '420583000000', '枝江市', '', '211', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/05/420583.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1923', '420602000000', '襄城区', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420602.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1924', '420606000000', '樊城区', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420606.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1925', '420607000000', '襄州区', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420607.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1926', '420624000000', '南漳县', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420624.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1927', '420625000000', '谷城县', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420625.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1928', '420626000000', '保康县', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420626.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1929', '420682000000', '老河口市', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420682.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1930', '420683000000', '枣阳市', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420683.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1931', '420684000000', '宜城市', '', '212', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/06/420684.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1932', '420702000000', '梁子湖区', '', '213', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/07/420702.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1933', '420703000000', '华容区', '', '213', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/07/420703.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1934', '420704000000', '鄂城区', '', '213', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/07/420704.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1935', '420802000000', '东宝区', '', '214', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/08/420802.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1936', '420804000000', '掇刀区', '', '214', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/08/420804.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1937', '420821000000', '京山县', '', '214', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/08/420821.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1938', '420822000000', '沙洋县', '', '214', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/08/420822.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1939', '420881000000', '钟祥市', '', '214', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/08/420881.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1940', '420902000000', '孝南区', '', '215', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/09/420902.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1941', '420921000000', '孝昌县', '', '215', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/09/420921.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1942', '420922000000', '大悟县', '', '215', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/09/420922.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1943', '420923000000', '云梦县', '', '215', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/09/420923.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1944', '420981000000', '应城市', '', '215', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/09/420981.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1945', '420982000000', '安陆市', '', '215', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/09/420982.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1946', '420984000000', '汉川市', '', '215', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/09/420984.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1947', '421002000000', '沙市区', '', '216', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/10/421002.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1948', '421003000000', '荆州区', '', '216', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/10/421003.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1949', '421022000000', '公安县', '', '216', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/10/421022.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1950', '421023000000', '监利县', '', '216', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/10/421023.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1951', '421024000000', '江陵县', '', '216', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/10/421024.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1952', '421081000000', '石首市', '', '216', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/10/421081.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1953', '421083000000', '洪湖市', '', '216', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/10/421083.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1954', '421087000000', '松滋市', '', '216', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/10/421087.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1955', '421102000000', '黄州区', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421102.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1956', '421121000000', '团风县', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421121.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1957', '421122000000', '红安县', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421122.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1958', '421123000000', '罗田县', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421123.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1959', '421124000000', '英山县', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421124.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1960', '421125000000', '浠水县', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421125.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1961', '421126000000', '蕲春县', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421126.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1962', '421127000000', '黄梅县', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421127.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1963', '421181000000', '麻城市', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421181.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1964', '421182000000', '武穴市', '', '217', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/11/421182.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1965', '421202000000', '咸安区', '', '218', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/12/421202.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1966', '421221000000', '嘉鱼县', '', '218', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/12/421221.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1967', '421222000000', '通城县', '', '218', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/12/421222.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1968', '421223000000', '崇阳县', '', '218', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/12/421223.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1969', '421224000000', '通山县', '', '218', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/12/421224.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1970', '421281000000', '赤壁市', '', '218', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/12/421281.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1971', '421303000000', '曾都区', '', '219', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/13/421303.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1972', '421321000000', '随县', '', '219', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/13/421321.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1973', '421381000000', '广水市', '', '219', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/13/421381.html', '2017-05-03 16:37:12', '2017-05-03 16:37:12');
INSERT INTO `sys_dict_china_city` VALUES ('1974', '422801000000', '恩施市', '', '220', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/28/422801.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1975', '422802000000', '利川市', '', '220', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/28/422802.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1976', '422822000000', '建始县', '', '220', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/28/422822.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1977', '422823000000', '巴东县', '', '220', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/28/422823.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1978', '422825000000', '宣恩县', '', '220', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/28/422825.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1979', '422826000000', '咸丰县', '', '220', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/28/422826.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1980', '422827000000', '来凤县', '', '220', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/28/422827.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1981', '422828000000', '鹤峰县', '', '220', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/28/422828.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1982', '429004000000', '仙桃市', '', '221', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/90/429004.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1983', '429005000000', '潜江市', '', '221', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/90/429005.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1984', '429006000000', '天门市', '', '221', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/90/429006.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1985', '429021000000', '神农架林区', '', '221', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/42/90/429021.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1986', '430102000000', '芙蓉区', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430102.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1987', '430103000000', '天心区', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430103.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1988', '430104000000', '岳麓区', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430104.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1989', '430105000000', '开福区', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430105.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1990', '430111000000', '雨花区', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430111.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1991', '430112000000', '望城区', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430112.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1992', '430121000000', '长沙县', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430121.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1993', '430124000000', '宁乡县', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430124.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1994', '430181000000', '浏阳市', '', '222', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/01/430181.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1995', '430202000000', '荷塘区', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430202.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1996', '430203000000', '芦淞区', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430203.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1997', '430204000000', '石峰区', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430204.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1998', '430211000000', '天元区', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430211.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('1999', '430221000000', '株洲县', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430221.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2000', '430223000000', '攸县', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430223.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2001', '430224000000', '茶陵县', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430224.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2002', '430225000000', '炎陵县', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430225.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2003', '430281000000', '醴陵市', '', '223', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/02/430281.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2004', '430302000000', '雨湖区', '', '224', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/03/430302.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2005', '430304000000', '岳塘区', '', '224', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/03/430304.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2006', '430321000000', '湘潭县', '', '224', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/03/430321.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2007', '430381000000', '湘乡市', '', '224', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/03/430381.html', '2017-05-03 16:37:13', '2017-05-03 16:37:13');
INSERT INTO `sys_dict_china_city` VALUES ('2008', '430382000000', '韶山市', '', '224', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/03/430382.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2009', '430405000000', '珠晖区', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430405.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2010', '430406000000', '雁峰区', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430406.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2011', '430407000000', '石鼓区', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430407.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2012', '430408000000', '蒸湘区', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430408.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2013', '430412000000', '南岳区', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430412.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2014', '430421000000', '衡阳县', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430421.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2015', '430422000000', '衡南县', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430422.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2016', '430423000000', '衡山县', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430423.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2017', '430424000000', '衡东县', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430424.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2018', '430426000000', '祁东县', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430426.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2019', '430481000000', '耒阳市', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430481.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2020', '430482000000', '常宁市', '', '225', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/04/430482.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2021', '430502000000', '双清区', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430502.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2022', '430503000000', '大祥区', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430503.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2023', '430511000000', '北塔区', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430511.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2024', '430521000000', '邵东县', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430521.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2025', '430522000000', '新邵县', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430522.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2026', '430523000000', '邵阳县', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430523.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2027', '430524000000', '隆回县', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430524.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2028', '430525000000', '洞口县', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430525.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2029', '430527000000', '绥宁县', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430527.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2030', '430528000000', '新宁县', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430528.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2031', '430529000000', '城步苗族自治县', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430529.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2032', '430581000000', '武冈市', '', '226', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/05/430581.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2033', '430602000000', '岳阳楼区', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430602.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2034', '430603000000', '云溪区', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430603.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2035', '430611000000', '君山区', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430611.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2036', '430621000000', '岳阳县', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430621.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2037', '430623000000', '华容县', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430623.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2038', '430624000000', '湘阴县', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430624.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2039', '430626000000', '平江县', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430626.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2040', '430681000000', '汨罗市', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430681.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2041', '430682000000', '临湘市', '', '227', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/06/430682.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2042', '430702000000', '武陵区', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430702.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2043', '430703000000', '鼎城区', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430703.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2044', '430721000000', '安乡县', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430721.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2045', '430722000000', '汉寿县', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430722.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2046', '430723000000', '澧县', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430723.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2047', '430724000000', '临澧县', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430724.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2048', '430725000000', '桃源县', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430725.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2049', '430726000000', '石门县', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430726.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2050', '430781000000', '津市市', '', '228', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/07/430781.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2051', '430802000000', '永定区', '', '229', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/08/430802.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2052', '430811000000', '武陵源区', '', '229', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/08/430811.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2053', '430821000000', '慈利县', '', '229', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/08/430821.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2054', '430822000000', '桑植县', '', '229', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/08/430822.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2055', '430902000000', '资阳区', '', '230', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/09/430902.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2056', '430903000000', '赫山区', '', '230', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/09/430903.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2057', '430921000000', '南县', '', '230', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/09/430921.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2058', '430922000000', '桃江县', '', '230', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/09/430922.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2059', '430923000000', '安化县', '', '230', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/09/430923.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2060', '430981000000', '沅江市', '', '230', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/09/430981.html', '2017-05-03 16:37:14', '2017-05-03 16:37:14');
INSERT INTO `sys_dict_china_city` VALUES ('2061', '431002000000', '北湖区', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431002.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2062', '431003000000', '苏仙区', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431003.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2063', '431021000000', '桂阳县', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431021.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2064', '431022000000', '宜章县', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431022.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2065', '431023000000', '永兴县', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431023.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2066', '431024000000', '嘉禾县', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431024.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2067', '431025000000', '临武县', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431025.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2068', '431026000000', '汝城县', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431026.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2069', '431027000000', '桂东县', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431027.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2070', '431028000000', '安仁县', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431028.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2071', '431081000000', '资兴市', '', '231', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/10/431081.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2072', '431102000000', '零陵区', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431102.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2073', '431103000000', '冷水滩区', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431103.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2074', '431121000000', '祁阳县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431121.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2075', '431122000000', '东安县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431122.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2076', '431123000000', '双牌县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431123.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2077', '431124000000', '道县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431124.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2078', '431125000000', '江永县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431125.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2079', '431126000000', '宁远县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431126.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2080', '431127000000', '蓝山县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431127.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2081', '431128000000', '新田县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431128.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2082', '431129000000', '江华瑶族自治县', '', '232', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/11/431129.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2083', '431202000000', '鹤城区', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431202.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2084', '431221000000', '中方县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431221.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2085', '431222000000', '沅陵县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431222.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2086', '431223000000', '辰溪县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431223.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2087', '431224000000', '溆浦县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431224.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2088', '431225000000', '会同县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431225.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2089', '431226000000', '麻阳苗族自治县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431226.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2090', '431227000000', '新晃侗族自治县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431227.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2091', '431228000000', '芷江侗族自治县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431228.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2092', '431229000000', '靖州苗族侗族自治县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431229.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2093', '431230000000', '通道侗族自治县', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431230.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2094', '431281000000', '洪江市', '', '233', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/12/431281.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2095', '431302000000', '娄星区', '', '234', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/13/431302.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2096', '431321000000', '双峰县', '', '234', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/13/431321.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2097', '431322000000', '新化县', '', '234', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/13/431322.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2098', '431381000000', '冷水江市', '', '234', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/13/431381.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2099', '431382000000', '涟源市', '', '234', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/13/431382.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2100', '433101000000', '吉首市', '', '235', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/31/433101.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2101', '433122000000', '泸溪县', '', '235', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/31/433122.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2102', '433123000000', '凤凰县', '', '235', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/31/433123.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2103', '433124000000', '花垣县', '', '235', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/31/433124.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2104', '433125000000', '保靖县', '', '235', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/31/433125.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2105', '433126000000', '古丈县', '', '235', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/31/433126.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2106', '433127000000', '永顺县', '', '235', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/31/433127.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2107', '433130000000', '龙山县', '', '235', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/43/31/433130.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2108', '440103000000', '荔湾区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440103.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2109', '440104000000', '越秀区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440104.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2110', '440105000000', '海珠区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440105.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2111', '440106000000', '天河区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440106.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2112', '440111000000', '白云区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440111.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2113', '440112000000', '黄埔区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440112.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2114', '440113000000', '番禺区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440113.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2115', '440114000000', '花都区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440114.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2116', '440115000000', '南沙区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440115.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2117', '440117000000', '从化区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440117.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2118', '440118000000', '增城区', '', '236', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/01/440118.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2119', '440203000000', '武江区', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440203.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2120', '440204000000', '浈江区', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440204.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2121', '440205000000', '曲江区', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440205.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2122', '440222000000', '始兴县', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440222.html', '2017-05-03 16:37:15', '2017-05-03 16:37:15');
INSERT INTO `sys_dict_china_city` VALUES ('2123', '440224000000', '仁化县', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440224.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2124', '440229000000', '翁源县', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440229.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2125', '440232000000', '乳源瑶族自治县', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440232.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2126', '440233000000', '新丰县', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440233.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2127', '440281000000', '乐昌市', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440281.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2128', '440282000000', '南雄市', '', '237', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/02/440282.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2129', '440303000000', '罗湖区', '', '238', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/03/440303.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2130', '440304000000', '福田区', '', '238', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/03/440304.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2131', '440305000000', '南山区', '', '238', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/03/440305.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2132', '440306000000', '宝安区', '', '238', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/03/440306.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2133', '440307000000', '龙岗区', '', '238', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/03/440307.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2134', '440308000000', '盐田区', '', '238', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/03/440308.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2135', '440402000000', '香洲区', '', '239', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/04/440402.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2136', '440403000000', '斗门区', '', '239', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/04/440403.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2137', '440404000000', '金湾区', '', '239', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/04/440404.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2138', '440507000000', '龙湖区', '', '240', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/05/440507.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2139', '440511000000', '金平区', '', '240', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/05/440511.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2140', '440512000000', '濠江区', '', '240', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/05/440512.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2141', '440513000000', '潮阳区', '', '240', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/05/440513.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2142', '440514000000', '潮南区', '', '240', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/05/440514.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2143', '440515000000', '澄海区', '', '240', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/05/440515.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2144', '440523000000', '南澳县', '', '240', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/05/440523.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2145', '440604000000', '禅城区', '', '241', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/06/440604.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2146', '440605000000', '南海区', '', '241', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/06/440605.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2147', '440606000000', '顺德区', '', '241', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/06/440606.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2148', '440607000000', '三水区', '', '241', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/06/440607.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2149', '440608000000', '高明区', '', '241', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/06/440608.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2150', '440703000000', '蓬江区', '', '242', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/07/440703.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2151', '440704000000', '江海区', '', '242', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/07/440704.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2152', '440705000000', '新会区', '', '242', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/07/440705.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2153', '440781000000', '台山市', '', '242', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/07/440781.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2154', '440783000000', '开平市', '', '242', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/07/440783.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2155', '440784000000', '鹤山市', '', '242', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/07/440784.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2156', '440785000000', '恩平市', '', '242', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/07/440785.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2157', '440802000000', '赤坎区', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440802.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2158', '440803000000', '霞山区', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440803.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2159', '440804000000', '坡头区', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440804.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2160', '440811000000', '麻章区', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440811.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2161', '440823000000', '遂溪县', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440823.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2162', '440825000000', '徐闻县', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440825.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2163', '440881000000', '廉江市', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440881.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2164', '440882000000', '雷州市', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440882.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2165', '440883000000', '吴川市', '', '243', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/08/440883.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2166', '440902000000', '茂南区', '', '244', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/09/440902.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2167', '440904000000', '电白区', '', '244', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/09/440904.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2168', '440981000000', '高州市', '', '244', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/09/440981.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2169', '440982000000', '化州市', '', '244', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/09/440982.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2170', '440983000000', '信宜市', '', '244', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/09/440983.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2171', '441202000000', '端州区', '', '245', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/12/441202.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2172', '441203000000', '鼎湖区', '', '245', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/12/441203.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2173', '441204000000', '高要区', '', '245', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/12/441204.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2174', '441223000000', '广宁县', '', '245', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/12/441223.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2175', '441224000000', '怀集县', '', '245', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/12/441224.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2176', '441225000000', '封开县', '', '245', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/12/441225.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2177', '441226000000', '德庆县', '', '245', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/12/441226.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2178', '441284000000', '四会市', '', '245', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/12/441284.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2179', '441302000000', '惠城区', '', '246', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/13/441302.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2180', '441303000000', '惠阳区', '', '246', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/13/441303.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2181', '441322000000', '博罗县', '', '246', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/13/441322.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2182', '441323000000', '惠东县', '', '246', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/13/441323.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2183', '441324000000', '龙门县', '', '246', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/13/441324.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2184', '441402000000', '梅江区', '', '247', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/14/441402.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2185', '441403000000', '梅县区', '', '247', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/14/441403.html', '2017-05-03 16:37:16', '2017-05-03 16:37:16');
INSERT INTO `sys_dict_china_city` VALUES ('2186', '441422000000', '大埔县', '', '247', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/14/441422.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2187', '441423000000', '丰顺县', '', '247', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/14/441423.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2188', '441424000000', '五华县', '', '247', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/14/441424.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2189', '441426000000', '平远县', '', '247', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/14/441426.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2190', '441427000000', '蕉岭县', '', '247', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/14/441427.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2191', '441481000000', '兴宁市', '', '247', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/14/441481.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2192', '441502000000', '城区', '', '248', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/15/441502.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2193', '441521000000', '海丰县', '', '248', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/15/441521.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2194', '441523000000', '陆河县', '', '248', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/15/441523.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2195', '441581000000', '陆丰市', '', '248', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/15/441581.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2196', '441602000000', '源城区', '', '249', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/16/441602.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2197', '441621000000', '紫金县', '', '249', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/16/441621.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2198', '441622000000', '龙川县', '', '249', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/16/441622.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2199', '441623000000', '连平县', '', '249', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/16/441623.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2200', '441624000000', '和平县', '', '249', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/16/441624.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2201', '441625000000', '东源县', '', '249', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/16/441625.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2202', '441702000000', '江城区', '', '250', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/17/441702.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2203', '441704000000', '阳东区', '', '250', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/17/441704.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2204', '441721000000', '阳西县', '', '250', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/17/441721.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2205', '441781000000', '阳春市', '', '250', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/17/441781.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2206', '441802000000', '清城区', '', '251', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/18/441802.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2207', '441803000000', '清新区', '', '251', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/18/441803.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2208', '441821000000', '佛冈县', '', '251', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/18/441821.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2209', '441823000000', '阳山县', '', '251', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/18/441823.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2210', '441825000000', '连山壮族瑶族自治县', '', '251', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/18/441825.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2211', '441826000000', '连南瑶族自治县', '', '251', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/18/441826.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2212', '441881000000', '英德市', '', '251', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/18/441881.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2213', '441882000000', '连州市', '', '251', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/18/441882.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2214', '445102000000', '湘桥区', '', '254', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/51/445102.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2215', '445103000000', '潮安区', '', '254', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/51/445103.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2216', '445122000000', '饶平县', '', '254', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/51/445122.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2217', '445202000000', '榕城区', '', '255', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/52/445202.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2218', '445203000000', '揭东区', '', '255', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/52/445203.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2219', '445222000000', '揭西县', '', '255', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/52/445222.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2220', '445224000000', '惠来县', '', '255', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/52/445224.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2221', '445281000000', '普宁市', '', '255', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/52/445281.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2222', '445302000000', '云城区', '', '256', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/53/445302.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2223', '445303000000', '云安区', '', '256', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/53/445303.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2224', '445321000000', '新兴县', '', '256', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/53/445321.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2225', '445322000000', '郁南县', '', '256', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/53/445322.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2226', '445381000000', '罗定市', '', '256', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/44/53/445381.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2227', '450102000000', '兴宁区', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450102.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2228', '450103000000', '青秀区', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450103.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2229', '450105000000', '江南区', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450105.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2230', '450107000000', '西乡塘区', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450107.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2231', '450108000000', '良庆区', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450108.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2232', '450109000000', '邕宁区', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450109.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2233', '450110000000', '武鸣区', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450110.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2234', '450123000000', '隆安县', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450123.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2235', '450124000000', '马山县', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450124.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2236', '450125000000', '上林县', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450125.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2237', '450126000000', '宾阳县', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450126.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2238', '450127000000', '横县', '', '257', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/01/450127.html', '2017-05-03 16:37:17', '2017-05-03 16:37:17');
INSERT INTO `sys_dict_china_city` VALUES ('2239', '450202000000', '城中区', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450202.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2240', '450203000000', '鱼峰区', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450203.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2241', '450204000000', '柳南区', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450204.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2242', '450205000000', '柳北区', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450205.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2243', '450221000000', '柳江县', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450221.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2244', '450222000000', '柳城县', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450222.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2245', '450223000000', '鹿寨县', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450223.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2246', '450224000000', '融安县', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450224.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2247', '450225000000', '融水苗族自治县', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450225.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2248', '450226000000', '三江侗族自治县', '', '258', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/02/450226.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2249', '450302000000', '秀峰区', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450302.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2250', '450303000000', '叠彩区', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450303.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2251', '450304000000', '象山区', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450304.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2252', '450305000000', '七星区', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450305.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2253', '450311000000', '雁山区', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450311.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2254', '450312000000', '临桂区', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450312.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2255', '450321000000', '阳朔县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450321.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2256', '450323000000', '灵川县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450323.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2257', '450324000000', '全州县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450324.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2258', '450325000000', '兴安县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450325.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2259', '450326000000', '永福县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450326.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2260', '450327000000', '灌阳县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450327.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2261', '450328000000', '龙胜各族自治县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450328.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2262', '450329000000', '资源县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450329.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2263', '450330000000', '平乐县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450330.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2264', '450331000000', '荔浦县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450331.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2265', '450332000000', '恭城瑶族自治县', '', '259', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/03/450332.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2266', '450403000000', '万秀区', '', '260', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/04/450403.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2267', '450405000000', '长洲区', '', '260', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/04/450405.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2268', '450406000000', '龙圩区', '', '260', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/04/450406.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2269', '450421000000', '苍梧县', '', '260', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/04/450421.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2270', '450422000000', '藤县', '', '260', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/04/450422.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2271', '450423000000', '蒙山县', '', '260', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/04/450423.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2272', '450481000000', '岑溪市', '', '260', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/04/450481.html', '2017-05-03 16:37:18', '2017-05-03 16:37:18');
INSERT INTO `sys_dict_china_city` VALUES ('2273', '450502000000', '海城区', '', '261', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/05/450502.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2274', '450503000000', '银海区', '', '261', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/05/450503.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2275', '450512000000', '铁山港区', '', '261', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/05/450512.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2276', '450521000000', '合浦县', '', '261', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/05/450521.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2277', '450602000000', '港口区', '', '262', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/06/450602.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2278', '450603000000', '防城区', '', '262', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/06/450603.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2279', '450621000000', '上思县', '', '262', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/06/450621.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2280', '450681000000', '东兴市', '', '262', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/06/450681.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2281', '450702000000', '钦南区', '', '263', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/07/450702.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2282', '450703000000', '钦北区', '', '263', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/07/450703.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2283', '450721000000', '灵山县', '', '263', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/07/450721.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2284', '450722000000', '浦北县', '', '263', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/07/450722.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2285', '450802000000', '港北区', '', '264', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/08/450802.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2286', '450803000000', '港南区', '', '264', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/08/450803.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2287', '450804000000', '覃塘区', '', '264', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/08/450804.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2288', '450821000000', '平南县', '', '264', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/08/450821.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2289', '450881000000', '桂平市', '', '264', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/08/450881.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2290', '450902000000', '玉州区', '', '265', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/09/450902.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2291', '450903000000', '福绵区', '', '265', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/09/450903.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2292', '450921000000', '容县', '', '265', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/09/450921.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2293', '450922000000', '陆川县', '', '265', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/09/450922.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2294', '450923000000', '博白县', '', '265', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/09/450923.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2295', '450924000000', '兴业县', '', '265', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/09/450924.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2296', '450981000000', '北流市', '', '265', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/09/450981.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2297', '451002000000', '右江区', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451002.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2298', '451021000000', '田阳县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451021.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2299', '451022000000', '田东县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451022.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2300', '451023000000', '平果县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451023.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2301', '451024000000', '德保县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451024.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2302', '451026000000', '那坡县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451026.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2303', '451027000000', '凌云县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451027.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2304', '451028000000', '乐业县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451028.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2305', '451029000000', '田林县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451029.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2306', '451030000000', '西林县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451030.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2307', '451031000000', '隆林各族自治县', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451031.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2308', '451081000000', '靖西市', '', '266', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/10/451081.html', '2017-05-03 16:37:19', '2017-05-03 16:37:19');
INSERT INTO `sys_dict_china_city` VALUES ('2309', '451102000000', '八步区', '', '267', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/11/451102.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2310', '451121000000', '昭平县', '', '267', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/11/451121.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2311', '451122000000', '钟山县', '', '267', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/11/451122.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2312', '451123000000', '富川瑶族自治县', '', '267', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/11/451123.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2313', '451202000000', '金城江区', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451202.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2314', '451221000000', '南丹县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451221.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2315', '451222000000', '天峨县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451222.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2316', '451223000000', '凤山县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451223.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2317', '451224000000', '东兰县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451224.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2318', '451225000000', '罗城仫佬族自治县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451225.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2319', '451226000000', '环江毛南族自治县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451226.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2320', '451227000000', '巴马瑶族自治县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451227.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2321', '451228000000', '都安瑶族自治县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451228.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2322', '451229000000', '大化瑶族自治县', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451229.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2323', '451281000000', '宜州市', '', '268', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/12/451281.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2324', '451302000000', '兴宾区', '', '269', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/13/451302.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2325', '451321000000', '忻城县', '', '269', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/13/451321.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2326', '451322000000', '象州县', '', '269', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/13/451322.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2327', '451323000000', '武宣县', '', '269', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/13/451323.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2328', '451324000000', '金秀瑶族自治县', '', '269', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/13/451324.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2329', '451381000000', '合山市', '', '269', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/13/451381.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2330', '451402000000', '江州区', '', '270', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/14/451402.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2331', '451421000000', '扶绥县', '', '270', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/14/451421.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2332', '451422000000', '宁明县', '', '270', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/14/451422.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2333', '451423000000', '龙州县', '', '270', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/14/451423.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2334', '451424000000', '大新县', '', '270', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/14/451424.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2335', '451425000000', '天等县', '', '270', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/14/451425.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2336', '451481000000', '凭祥市', '', '270', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/45/14/451481.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2337', '460105000000', '秀英区', '', '271', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/01/460105.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2338', '460106000000', '龙华区', '', '271', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/01/460106.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2339', '460107000000', '琼山区', '', '271', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/01/460107.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2340', '460108000000', '美兰区', '', '271', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/01/460108.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2341', '460201000000', '市辖区', '', '272', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/02/460201.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2342', '460202000000', '海棠区', '', '272', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/02/460202.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2343', '460203000000', '吉阳区', '', '272', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/02/460203.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2344', '460204000000', '天涯区', '', '272', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/02/460204.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2345', '460205000000', '崖州区', '', '272', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/02/460205.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2346', '460321000000', '西沙群岛', '', '273', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/03/460321.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2347', '460322000000', '南沙群岛', '', '273', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/03/460322.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2348', '460323000000', '中沙群岛的岛礁及其海域', '', '273', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/03/460323.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2349', '469001000000', '五指山市', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469001.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2350', '469002000000', '琼海市', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469002.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2351', '469003000000', '儋州市', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469003.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2352', '469005000000', '文昌市', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469005.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2353', '469006000000', '万宁市', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469006.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2354', '469007000000', '东方市', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469007.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2355', '469021000000', '定安县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469021.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2356', '469022000000', '屯昌县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469022.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2357', '469023000000', '澄迈县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469023.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2358', '469024000000', '临高县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469024.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2359', '469025000000', '白沙黎族自治县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469025.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2360', '469026000000', '昌江黎族自治县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469026.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2361', '469027000000', '乐东黎族自治县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469027.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2362', '469028000000', '陵水黎族自治县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469028.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2363', '469029000000', '保亭黎族苗族自治县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469029.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2364', '469030000000', '琼中黎族苗族自治县', '', '274', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/46/90/469030.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2365', '500101000000', '万州区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500101.html', '2017-05-03 16:37:20', '2017-05-03 16:37:20');
INSERT INTO `sys_dict_china_city` VALUES ('2366', '500102000000', '涪陵区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500102.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2367', '500103000000', '渝中区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500103.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2368', '500104000000', '大渡口区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500104.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2369', '500105000000', '江北区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500105.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2370', '500106000000', '沙坪坝区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500106.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2371', '500107000000', '九龙坡区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500107.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2372', '500108000000', '南岸区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500108.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2373', '500109000000', '北碚区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500109.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2374', '500110000000', '綦江区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500110.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2375', '500111000000', '大足区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500111.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2376', '500112000000', '渝北区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500112.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2377', '500113000000', '巴南区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500113.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2378', '500114000000', '黔江区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500114.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2379', '500115000000', '长寿区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500115.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2380', '500116000000', '江津区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500116.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2381', '500117000000', '合川区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500117.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2382', '500118000000', '永川区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500118.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2383', '500119000000', '南川区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500119.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2384', '500120000000', '璧山区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500120.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2385', '500151000000', '铜梁区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500151.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2386', '500152000000', '潼南区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500152.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2387', '500153000000', '荣昌区', '', '275', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/01/500153.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2388', '500228000000', '梁平县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500228.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2389', '500229000000', '城口县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500229.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2390', '500230000000', '丰都县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500230.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2391', '500231000000', '垫江县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500231.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2392', '500232000000', '武隆县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500232.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2393', '500233000000', '忠县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500233.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2394', '500234000000', '开县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500234.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2395', '500235000000', '云阳县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500235.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2396', '500236000000', '奉节县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500236.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2397', '500237000000', '巫山县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500237.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2398', '500238000000', '巫溪县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500238.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2399', '500240000000', '石柱土家族自治县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500240.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2400', '500241000000', '秀山土家族苗族自治县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500241.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2401', '500242000000', '酉阳土家族苗族自治县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500242.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2402', '500243000000', '彭水苗族土家族自治县', '', '276', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/50/02/500243.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2403', '510104000000', '锦江区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510104.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2404', '510105000000', '青羊区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510105.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2405', '510106000000', '金牛区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510106.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2406', '510107000000', '武侯区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510107.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2407', '510108000000', '成华区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510108.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2408', '510112000000', '龙泉驿区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510112.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2409', '510113000000', '青白江区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510113.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2410', '510114000000', '新都区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510114.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2411', '510115000000', '温江区', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510115.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2412', '510121000000', '金堂县', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510121.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2413', '510122000000', '双流县', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510122.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2414', '510124000000', '郫县', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510124.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2415', '510129000000', '大邑县', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510129.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2416', '510131000000', '蒲江县', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510131.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2417', '510132000000', '新津县', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510132.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2418', '510181000000', '都江堰市', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510181.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2419', '510182000000', '彭州市', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510182.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2420', '510183000000', '邛崃市', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510183.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2421', '510184000000', '崇州市', '', '277', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/01/510184.html', '2017-05-03 16:37:21', '2017-05-03 16:37:21');
INSERT INTO `sys_dict_china_city` VALUES ('2422', '510302000000', '自流井区', '', '278', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/03/510302.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2423', '510303000000', '贡井区', '', '278', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/03/510303.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2424', '510304000000', '大安区', '', '278', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/03/510304.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2425', '510311000000', '沿滩区', '', '278', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/03/510311.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2426', '510321000000', '荣县', '', '278', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/03/510321.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2427', '510322000000', '富顺县', '', '278', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/03/510322.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2428', '510402000000', '东区', '', '279', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/04/510402.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2429', '510403000000', '西区', '', '279', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/04/510403.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2430', '510411000000', '仁和区', '', '279', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/04/510411.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2431', '510421000000', '米易县', '', '279', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/04/510421.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2432', '510422000000', '盐边县', '', '279', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/04/510422.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2433', '510502000000', '江阳区', '', '280', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/05/510502.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2434', '510503000000', '纳溪区', '', '280', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/05/510503.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2435', '510504000000', '龙马潭区', '', '280', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/05/510504.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2436', '510521000000', '泸县', '', '280', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/05/510521.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2437', '510522000000', '合江县', '', '280', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/05/510522.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2438', '510524000000', '叙永县', '', '280', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/05/510524.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2439', '510525000000', '古蔺县', '', '280', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/05/510525.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2440', '510603000000', '旌阳区', '', '281', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/06/510603.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2441', '510623000000', '中江县', '', '281', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/06/510623.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2442', '510626000000', '罗江县', '', '281', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/06/510626.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2443', '510681000000', '广汉市', '', '281', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/06/510681.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2444', '510682000000', '什邡市', '', '281', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/06/510682.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2445', '510683000000', '绵竹市', '', '281', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/06/510683.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2446', '510703000000', '涪城区', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510703.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2447', '510704000000', '游仙区', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510704.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2448', '510722000000', '三台县', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510722.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2449', '510723000000', '盐亭县', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510723.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2450', '510724000000', '安县', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510724.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2451', '510725000000', '梓潼县', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510725.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2452', '510726000000', '北川羌族自治县', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510726.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2453', '510727000000', '平武县', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510727.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2454', '510781000000', '江油市', '', '282', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/07/510781.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2455', '510802000000', '利州区', '', '283', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/08/510802.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2456', '510811000000', '昭化区', '', '283', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/08/510811.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2457', '510812000000', '朝天区', '', '283', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/08/510812.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2458', '510821000000', '旺苍县', '', '283', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/08/510821.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2459', '510822000000', '青川县', '', '283', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/08/510822.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2460', '510823000000', '剑阁县', '', '283', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/08/510823.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2461', '510824000000', '苍溪县', '', '283', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/08/510824.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2462', '510903000000', '船山区', '', '284', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/09/510903.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2463', '510904000000', '安居区', '', '284', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/09/510904.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2464', '510921000000', '蓬溪县', '', '284', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/09/510921.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2465', '510922000000', '射洪县', '', '284', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/09/510922.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2466', '510923000000', '大英县', '', '284', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/09/510923.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2467', '511002000000', '市中区', '', '285', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/10/511002.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2468', '511011000000', '东兴区', '', '285', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/10/511011.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2469', '511024000000', '威远县', '', '285', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/10/511024.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2470', '511025000000', '资中县', '', '285', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/10/511025.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2471', '511028000000', '隆昌县', '', '285', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/10/511028.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2472', '511102000000', '市中区', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511102.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2473', '511111000000', '沙湾区', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511111.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2474', '511112000000', '五通桥区', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511112.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2475', '511113000000', '金口河区', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511113.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2476', '511123000000', '犍为县', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511123.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2477', '511124000000', '井研县', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511124.html', '2017-05-03 16:37:22', '2017-05-03 16:37:22');
INSERT INTO `sys_dict_china_city` VALUES ('2478', '511126000000', '夹江县', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511126.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2479', '511129000000', '沐川县', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511129.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2480', '511132000000', '峨边彝族自治县', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511132.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2481', '511133000000', '马边彝族自治县', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511133.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2482', '511181000000', '峨眉山市', '', '286', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/11/511181.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2483', '511302000000', '顺庆区', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511302.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2484', '511303000000', '高坪区', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511303.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2485', '511304000000', '嘉陵区', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511304.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2486', '511321000000', '南部县', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511321.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2487', '511322000000', '营山县', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511322.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2488', '511323000000', '蓬安县', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511323.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2489', '511324000000', '仪陇县', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511324.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2490', '511325000000', '西充县', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511325.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2491', '511381000000', '阆中市', '', '287', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/13/511381.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2492', '511402000000', '东坡区', '', '288', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/14/511402.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2493', '511403000000', '彭山区', '', '288', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/14/511403.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2494', '511421000000', '仁寿县', '', '288', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/14/511421.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2495', '511423000000', '洪雅县', '', '288', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/14/511423.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2496', '511424000000', '丹棱县', '', '288', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/14/511424.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2497', '511425000000', '青神县', '', '288', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/14/511425.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2498', '511502000000', '翠屏区', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511502.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2499', '511503000000', '南溪区', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511503.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2500', '511521000000', '宜宾县', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511521.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2501', '511523000000', '江安县', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511523.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2502', '511524000000', '长宁县', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511524.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2503', '511525000000', '高县', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511525.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2504', '511526000000', '珙县', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511526.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2505', '511527000000', '筠连县', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511527.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2506', '511528000000', '兴文县', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511528.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2507', '511529000000', '屏山县', '', '289', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/15/511529.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2508', '511602000000', '广安区', '', '290', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/16/511602.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2509', '511603000000', '前锋区', '', '290', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/16/511603.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2510', '511621000000', '岳池县', '', '290', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/16/511621.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2511', '511622000000', '武胜县', '', '290', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/16/511622.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2512', '511623000000', '邻水县', '', '290', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/16/511623.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2513', '511681000000', '华蓥市', '', '290', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/16/511681.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2514', '511702000000', '通川区', '', '291', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/17/511702.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2515', '511703000000', '达川区', '', '291', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/17/511703.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2516', '511722000000', '宣汉县', '', '291', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/17/511722.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2517', '511723000000', '开江县', '', '291', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/17/511723.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2518', '511724000000', '大竹县', '', '291', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/17/511724.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2519', '511725000000', '渠县', '', '291', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/17/511725.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2520', '511781000000', '万源市', '', '291', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/17/511781.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2521', '511802000000', '雨城区', '', '292', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/18/511802.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2522', '511803000000', '名山区', '', '292', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/18/511803.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2523', '511822000000', '荥经县', '', '292', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/18/511822.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2524', '511823000000', '汉源县', '', '292', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/18/511823.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2525', '511824000000', '石棉县', '', '292', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/18/511824.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2526', '511825000000', '天全县', '', '292', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/18/511825.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2527', '511826000000', '芦山县', '', '292', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/18/511826.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2528', '511827000000', '宝兴县', '', '292', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/18/511827.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2529', '511902000000', '巴州区', '', '293', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/19/511902.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2530', '511903000000', '恩阳区', '', '293', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/19/511903.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2531', '511921000000', '通江县', '', '293', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/19/511921.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2532', '511922000000', '南江县', '', '293', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/19/511922.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2533', '511923000000', '平昌县', '', '293', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/19/511923.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2534', '512002000000', '雁江区', '', '294', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/20/512002.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2535', '512021000000', '安岳县', '', '294', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/20/512021.html', '2017-05-03 16:37:23', '2017-05-03 16:37:23');
INSERT INTO `sys_dict_china_city` VALUES ('2536', '512022000000', '乐至县', '', '294', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/20/512022.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2537', '512081000000', '简阳市', '', '294', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/20/512081.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2538', '513221000000', '汶川县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513221.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2539', '513222000000', '理县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513222.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2540', '513223000000', '茂县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513223.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2541', '513224000000', '松潘县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513224.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2542', '513225000000', '九寨沟县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513225.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2543', '513226000000', '金川县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513226.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2544', '513227000000', '小金县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513227.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2545', '513228000000', '黑水县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513228.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2546', '513229000000', '马尔康县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513229.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2547', '513230000000', '壤塘县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513230.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2548', '513231000000', '阿坝县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513231.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2549', '513232000000', '若尔盖县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513232.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2550', '513233000000', '红原县', '', '295', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/32/513233.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2551', '513301000000', '康定市', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513301.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2552', '513322000000', '泸定县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513322.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2553', '513323000000', '丹巴县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513323.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2554', '513324000000', '九龙县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513324.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2555', '513325000000', '雅江县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513325.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2556', '513326000000', '道孚县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513326.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2557', '513327000000', '炉霍县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513327.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2558', '513328000000', '甘孜县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513328.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2559', '513329000000', '新龙县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513329.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2560', '513330000000', '德格县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513330.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2561', '513331000000', '白玉县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513331.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2562', '513332000000', '石渠县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513332.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2563', '513333000000', '色达县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513333.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2564', '513334000000', '理塘县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513334.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2565', '513335000000', '巴塘县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513335.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2566', '513336000000', '乡城县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513336.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2567', '513337000000', '稻城县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513337.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2568', '513338000000', '得荣县', '', '296', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/33/513338.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2569', '513401000000', '西昌市', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513401.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2570', '513422000000', '木里藏族自治县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513422.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2571', '513423000000', '盐源县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513423.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2572', '513424000000', '德昌县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513424.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2573', '513425000000', '会理县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513425.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2574', '513426000000', '会东县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513426.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2575', '513427000000', '宁南县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513427.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2576', '513428000000', '普格县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513428.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2577', '513429000000', '布拖县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513429.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2578', '513430000000', '金阳县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513430.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2579', '513431000000', '昭觉县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513431.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2580', '513432000000', '喜德县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513432.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2581', '513433000000', '冕宁县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513433.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2582', '513434000000', '越西县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513434.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2583', '513435000000', '甘洛县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513435.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2584', '513436000000', '美姑县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513436.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2585', '513437000000', '雷波县', '', '297', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/51/34/513437.html', '2017-05-03 16:37:24', '2017-05-03 16:37:24');
INSERT INTO `sys_dict_china_city` VALUES ('2586', '520102000000', '南明区', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520102.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2587', '520103000000', '云岩区', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520103.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2588', '520111000000', '花溪区', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520111.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2589', '520112000000', '乌当区', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520112.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2590', '520113000000', '白云区', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520113.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2591', '520115000000', '观山湖区', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520115.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2592', '520121000000', '开阳县', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520121.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2593', '520122000000', '息烽县', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520122.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2594', '520123000000', '修文县', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520123.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2595', '520181000000', '清镇市', '', '298', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/01/520181.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2596', '520201000000', '钟山区', '', '299', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/02/520201.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2597', '520203000000', '六枝特区', '', '299', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/02/520203.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2598', '520221000000', '水城县', '', '299', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/02/520221.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2599', '520222000000', '盘县', '', '299', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/02/520222.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2600', '520302000000', '红花岗区', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520302.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2601', '520303000000', '汇川区', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520303.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2602', '520321000000', '遵义县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520321.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2603', '520322000000', '桐梓县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520322.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2604', '520323000000', '绥阳县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520323.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2605', '520324000000', '正安县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520324.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2606', '520325000000', '道真仡佬族苗族自治县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520325.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2607', '520326000000', '务川仡佬族苗族自治县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520326.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2608', '520327000000', '凤冈县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520327.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2609', '520328000000', '湄潭县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520328.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2610', '520329000000', '余庆县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520329.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2611', '520330000000', '习水县', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520330.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2612', '520381000000', '赤水市', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520381.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2613', '520382000000', '仁怀市', '', '300', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/03/520382.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2614', '520402000000', '西秀区', '', '301', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/04/520402.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2615', '520403000000', '平坝区', '', '301', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/04/520403.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2616', '520422000000', '普定县', '', '301', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/04/520422.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2617', '520423000000', '镇宁布依族苗族自治县', '', '301', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/04/520423.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2618', '520424000000', '关岭布依族苗族自治县', '', '301', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/04/520424.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2619', '520425000000', '紫云苗族布依族自治县', '', '301', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/04/520425.html', '2017-05-03 16:37:25', '2017-05-03 16:37:25');
INSERT INTO `sys_dict_china_city` VALUES ('2620', '520502000000', '七星关区', '', '302', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/05/520502.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2621', '520521000000', '大方县', '', '302', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/05/520521.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2622', '520522000000', '黔西县', '', '302', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/05/520522.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2623', '520523000000', '金沙县', '', '302', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/05/520523.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2624', '520524000000', '织金县', '', '302', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/05/520524.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2625', '520525000000', '纳雍县', '', '302', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/05/520525.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2626', '520526000000', '威宁彝族回族苗族自治县', '', '302', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/05/520526.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2627', '520527000000', '赫章县', '', '302', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/05/520527.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2628', '520602000000', '碧江区', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520602.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2629', '520603000000', '万山区', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520603.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2630', '520621000000', '江口县', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520621.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2631', '520622000000', '玉屏侗族自治县', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520622.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2632', '520623000000', '石阡县', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520623.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2633', '520624000000', '思南县', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520624.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2634', '520625000000', '印江土家族苗族自治县', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520625.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2635', '520626000000', '德江县', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520626.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2636', '520627000000', '沿河土家族自治县', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520627.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2637', '520628000000', '松桃苗族自治县', '', '303', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/06/520628.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2638', '522301000000', '兴义市', '', '304', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/23/522301.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2639', '522322000000', '兴仁县', '', '304', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/23/522322.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2640', '522323000000', '普安县', '', '304', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/23/522323.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2641', '522324000000', '晴隆县', '', '304', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/23/522324.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2642', '522325000000', '贞丰县', '', '304', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/23/522325.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2643', '522326000000', '望谟县', '', '304', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/23/522326.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2644', '522327000000', '册亨县', '', '304', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/23/522327.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2645', '522328000000', '安龙县', '', '304', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/23/522328.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2646', '522601000000', '凯里市', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522601.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2647', '522622000000', '黄平县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522622.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2648', '522623000000', '施秉县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522623.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2649', '522624000000', '三穗县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522624.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2650', '522625000000', '镇远县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522625.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2651', '522626000000', '岑巩县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522626.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2652', '522627000000', '天柱县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522627.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2653', '522628000000', '锦屏县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522628.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2654', '522629000000', '剑河县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522629.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2655', '522630000000', '台江县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522630.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2656', '522631000000', '黎平县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522631.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2657', '522632000000', '榕江县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522632.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2658', '522633000000', '从江县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522633.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2659', '522634000000', '雷山县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522634.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2660', '522635000000', '麻江县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522635.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2661', '522636000000', '丹寨县', '', '305', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/26/522636.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2662', '522701000000', '都匀市', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522701.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2663', '522702000000', '福泉市', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522702.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2664', '522722000000', '荔波县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522722.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2665', '522723000000', '贵定县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522723.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2666', '522725000000', '瓮安县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522725.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2667', '522726000000', '独山县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522726.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2668', '522727000000', '平塘县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522727.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2669', '522728000000', '罗甸县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522728.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2670', '522729000000', '长顺县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522729.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2671', '522730000000', '龙里县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522730.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2672', '522731000000', '惠水县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522731.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2673', '522732000000', '三都水族自治县', '', '306', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/52/27/522732.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2674', '530102000000', '五华区', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530102.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2675', '530103000000', '盘龙区', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530103.html', '2017-05-03 16:37:26', '2017-05-03 16:37:26');
INSERT INTO `sys_dict_china_city` VALUES ('2676', '530111000000', '官渡区', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530111.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2677', '530112000000', '西山区', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530112.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2678', '530113000000', '东川区', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530113.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2679', '530114000000', '呈贡区', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530114.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2680', '530122000000', '晋宁县', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530122.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2681', '530124000000', '富民县', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530124.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2682', '530125000000', '宜良县', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530125.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2683', '530126000000', '石林彝族自治县', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530126.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2684', '530127000000', '嵩明县', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530127.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2685', '530128000000', '禄劝彝族苗族自治县', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530128.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2686', '530129000000', '寻甸回族彝族自治县', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530129.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2687', '530181000000', '安宁市', '', '307', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/01/530181.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2688', '530302000000', '麒麟区', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530302.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2689', '530321000000', '马龙县', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530321.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2690', '530322000000', '陆良县', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530322.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2691', '530323000000', '师宗县', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530323.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2692', '530324000000', '罗平县', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530324.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2693', '530325000000', '富源县', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530325.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2694', '530326000000', '会泽县', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530326.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2695', '530328000000', '沾益县', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530328.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2696', '530381000000', '宣威市', '', '308', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/03/530381.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2697', '530402000000', '红塔区', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530402.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2698', '530421000000', '江川县', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530421.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2699', '530422000000', '澄江县', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530422.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2700', '530423000000', '通海县', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530423.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2701', '530424000000', '华宁县', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530424.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2702', '530425000000', '易门县', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530425.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2703', '530426000000', '峨山彝族自治县', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530426.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2704', '530427000000', '新平彝族傣族自治县', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530427.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2705', '530428000000', '元江哈尼族彝族傣族自治县', '', '309', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/04/530428.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2706', '530502000000', '隆阳区', '', '310', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/05/530502.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2707', '530521000000', '施甸县', '', '310', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/05/530521.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2708', '530523000000', '龙陵县', '', '310', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/05/530523.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2709', '530524000000', '昌宁县', '', '310', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/05/530524.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2710', '530581000000', '腾冲市', '', '310', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/05/530581.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2711', '530602000000', '昭阳区', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530602.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2712', '530621000000', '鲁甸县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530621.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2713', '530622000000', '巧家县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530622.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2714', '530623000000', '盐津县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530623.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2715', '530624000000', '大关县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530624.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2716', '530625000000', '永善县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530625.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2717', '530626000000', '绥江县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530626.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2718', '530627000000', '镇雄县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530627.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2719', '530628000000', '彝良县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530628.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2720', '530629000000', '威信县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530629.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2721', '530630000000', '水富县', '', '311', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/06/530630.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2722', '530702000000', '古城区', '', '312', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/07/530702.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2723', '530721000000', '玉龙纳西族自治县', '', '312', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/07/530721.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2724', '530722000000', '永胜县', '', '312', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/07/530722.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2725', '530723000000', '华坪县', '', '312', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/07/530723.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2726', '530724000000', '宁蒗彝族自治县', '', '312', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/07/530724.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2727', '530802000000', '思茅区', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530802.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2728', '530821000000', '宁洱哈尼族彝族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530821.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2729', '530822000000', '墨江哈尼族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530822.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2730', '530823000000', '景东彝族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530823.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2731', '530824000000', '景谷傣族彝族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530824.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2732', '530825000000', '镇沅彝族哈尼族拉祜族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530825.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2733', '530826000000', '江城哈尼族彝族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530826.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2734', '530827000000', '孟连傣族拉祜族佤族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530827.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2735', '530828000000', '澜沧拉祜族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530828.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2736', '530829000000', '西盟佤族自治县', '', '313', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/08/530829.html', '2017-05-03 16:37:27', '2017-05-03 16:37:27');
INSERT INTO `sys_dict_china_city` VALUES ('2737', '530902000000', '临翔区', '', '314', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/09/530902.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2738', '530921000000', '凤庆县', '', '314', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/09/530921.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2739', '530922000000', '云县', '', '314', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/09/530922.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2740', '530923000000', '永德县', '', '314', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/09/530923.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2741', '530924000000', '镇康县', '', '314', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/09/530924.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2742', '530925000000', '双江拉祜族佤族布朗族傣族自治县', '', '314', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/09/530925.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2743', '530926000000', '耿马傣族佤族自治县', '', '314', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/09/530926.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2744', '530927000000', '沧源佤族自治县', '', '314', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/09/530927.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2745', '532301000000', '楚雄市', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532301.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2746', '532322000000', '双柏县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532322.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2747', '532323000000', '牟定县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532323.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2748', '532324000000', '南华县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532324.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2749', '532325000000', '姚安县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532325.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2750', '532326000000', '大姚县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532326.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2751', '532327000000', '永仁县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532327.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2752', '532328000000', '元谋县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532328.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2753', '532329000000', '武定县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532329.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2754', '532331000000', '禄丰县', '', '315', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/23/532331.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2755', '532501000000', '个旧市', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532501.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2756', '532502000000', '开远市', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532502.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2757', '532503000000', '蒙自市', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532503.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2758', '532504000000', '弥勒市', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532504.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2759', '532523000000', '屏边苗族自治县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532523.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2760', '532524000000', '建水县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532524.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2761', '532525000000', '石屏县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532525.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2762', '532527000000', '泸西县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532527.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2763', '532528000000', '元阳县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532528.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2764', '532529000000', '红河县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532529.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2765', '532530000000', '金平苗族瑶族傣族自治县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532530.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2766', '532531000000', '绿春县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532531.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2767', '532532000000', '河口瑶族自治县', '', '316', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/25/532532.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2768', '532601000000', '文山市', '', '317', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/26/532601.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2769', '532622000000', '砚山县', '', '317', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/26/532622.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2770', '532623000000', '西畴县', '', '317', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/26/532623.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2771', '532624000000', '麻栗坡县', '', '317', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/26/532624.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2772', '532625000000', '马关县', '', '317', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/26/532625.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2773', '532626000000', '丘北县', '', '317', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/26/532626.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2774', '532627000000', '广南县', '', '317', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/26/532627.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2775', '532628000000', '富宁县', '', '317', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/26/532628.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2776', '532801000000', '景洪市', '', '318', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/28/532801.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2777', '532822000000', '勐海县', '', '318', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/28/532822.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2778', '532823000000', '勐腊县', '', '318', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/28/532823.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2779', '532901000000', '大理市', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532901.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2780', '532922000000', '漾濞彝族自治县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532922.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2781', '532923000000', '祥云县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532923.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2782', '532924000000', '宾川县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532924.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2783', '532925000000', '弥渡县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532925.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2784', '532926000000', '南涧彝族自治县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532926.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2785', '532927000000', '巍山彝族回族自治县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532927.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2786', '532928000000', '永平县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532928.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2787', '532929000000', '云龙县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532929.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2788', '532930000000', '洱源县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532930.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2789', '532931000000', '剑川县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532931.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2790', '532932000000', '鹤庆县', '', '319', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/29/532932.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2791', '533102000000', '瑞丽市', '', '320', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/31/533102.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2792', '533103000000', '芒市', '', '320', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/31/533103.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2793', '533122000000', '梁河县', '', '320', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/31/533122.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2794', '533123000000', '盈江县', '', '320', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/31/533123.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2795', '533124000000', '陇川县', '', '320', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/31/533124.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2796', '533321000000', '泸水县', '', '321', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/33/533321.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2797', '533323000000', '福贡县', '', '321', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/33/533323.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2798', '533324000000', '贡山独龙族怒族自治县', '', '321', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/33/533324.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2799', '533325000000', '兰坪白族普米族自治县', '', '321', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/33/533325.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2800', '533401000000', '香格里拉市', '', '322', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/34/533401.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2801', '533422000000', '德钦县', '', '322', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/34/533422.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2802', '533423000000', '维西傈僳族自治县', '', '322', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/53/34/533423.html', '2017-05-03 16:37:28', '2017-05-03 16:37:28');
INSERT INTO `sys_dict_china_city` VALUES ('2803', '540102000000', '城关区', '', '323', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/01/540102.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2804', '540121000000', '林周县', '', '323', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/01/540121.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2805', '540122000000', '当雄县', '', '323', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/01/540122.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2806', '540123000000', '尼木县', '', '323', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/01/540123.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2807', '540124000000', '曲水县', '', '323', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/01/540124.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2808', '540125000000', '堆龙德庆县', '', '323', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/01/540125.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2809', '540126000000', '达孜县', '', '323', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/01/540126.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2810', '540127000000', '墨竹工卡县', '', '323', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/01/540127.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2811', '540202000000', '桑珠孜区', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540202.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2812', '540221000000', '南木林县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540221.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2813', '540222000000', '江孜县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540222.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2814', '540223000000', '定日县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540223.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2815', '540224000000', '萨迦县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540224.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2816', '540225000000', '拉孜县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540225.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2817', '540226000000', '昂仁县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540226.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2818', '540227000000', '谢通门县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540227.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2819', '540228000000', '白朗县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540228.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2820', '540229000000', '仁布县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540229.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2821', '540230000000', '康马县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540230.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2822', '540231000000', '定结县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540231.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2823', '540232000000', '仲巴县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540232.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2824', '540233000000', '亚东县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540233.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2825', '540234000000', '吉隆县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540234.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2826', '540235000000', '聂拉木县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540235.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2827', '540236000000', '萨嘎县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540236.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2828', '540237000000', '岗巴县', '', '324', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/02/540237.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2829', '540302000000', '卡若区', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540302.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2830', '540321000000', '江达县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540321.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2831', '540322000000', '贡觉县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540322.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2832', '540323000000', '类乌齐县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540323.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2833', '540324000000', '丁青县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540324.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2834', '540325000000', '察雅县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540325.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2835', '540326000000', '八宿县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540326.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2836', '540327000000', '左贡县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540327.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2837', '540328000000', '芒康县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540328.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2838', '540329000000', '洛隆县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540329.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2839', '540330000000', '边坝县', '', '325', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/03/540330.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2840', '540402000000', '巴宜区', '', '326', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/04/540402.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2841', '540421000000', '工布江达县', '', '326', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/04/540421.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2842', '540422000000', '米林县', '', '326', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/04/540422.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2843', '540423000000', '墨脱县', '', '326', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/04/540423.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2844', '540424000000', '波密县', '', '326', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/04/540424.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2845', '540425000000', '察隅县', '', '326', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/04/540425.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2846', '540426000000', '朗县', '', '326', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/04/540426.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2847', '542221000000', '乃东县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542221.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2848', '542222000000', '扎囊县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542222.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2849', '542223000000', '贡嘎县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542223.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2850', '542224000000', '桑日县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542224.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2851', '542225000000', '琼结县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542225.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2852', '542226000000', '曲松县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542226.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2853', '542227000000', '措美县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542227.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2854', '542228000000', '洛扎县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542228.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2855', '542229000000', '加查县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542229.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2856', '542231000000', '隆子县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542231.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2857', '542232000000', '错那县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542232.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2858', '542233000000', '浪卡子县', '', '327', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/22/542233.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2859', '542421000000', '那曲县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542421.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2860', '542422000000', '嘉黎县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542422.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2861', '542423000000', '比如县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542423.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2862', '542424000000', '聂荣县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542424.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2863', '542425000000', '安多县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542425.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2864', '542426000000', '申扎县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542426.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2865', '542427000000', '索县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542427.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2866', '542428000000', '班戈县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542428.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2867', '542429000000', '巴青县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542429.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2868', '542430000000', '尼玛县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542430.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2869', '542431000000', '双湖县', '', '328', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/24/542431.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2870', '542521000000', '普兰县', '', '329', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/25/542521.html', '2017-05-03 16:37:29', '2017-05-03 16:37:29');
INSERT INTO `sys_dict_china_city` VALUES ('2871', '542522000000', '札达县', '', '329', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/25/542522.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2872', '542523000000', '噶尔县', '', '329', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/25/542523.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2873', '542524000000', '日土县', '', '329', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/25/542524.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2874', '542525000000', '革吉县', '', '329', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/25/542525.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2875', '542526000000', '改则县', '', '329', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/25/542526.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2876', '542527000000', '措勤县', '', '329', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/54/25/542527.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2877', '610102000000', '新城区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610102.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2878', '610103000000', '碑林区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610103.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2879', '610104000000', '莲湖区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610104.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2880', '610111000000', '灞桥区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610111.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2881', '610112000000', '未央区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610112.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2882', '610113000000', '雁塔区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610113.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2883', '610114000000', '阎良区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610114.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2884', '610115000000', '临潼区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610115.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2885', '610116000000', '长安区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610116.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2886', '610117000000', '高陵区', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610117.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2887', '610122000000', '蓝田县', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610122.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2888', '610124000000', '周至县', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610124.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2889', '610125000000', '户县', '', '330', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/01/610125.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2890', '610202000000', '王益区', '', '331', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/02/610202.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2891', '610203000000', '印台区', '', '331', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/02/610203.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2892', '610204000000', '耀州区', '', '331', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/02/610204.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2893', '610222000000', '宜君县', '', '331', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/02/610222.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2894', '610302000000', '渭滨区', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610302.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2895', '610303000000', '金台区', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610303.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2896', '610304000000', '陈仓区', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610304.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2897', '610322000000', '凤翔县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610322.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2898', '610323000000', '岐山县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610323.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2899', '610324000000', '扶风县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610324.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2900', '610326000000', '眉县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610326.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2901', '610327000000', '陇县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610327.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2902', '610328000000', '千阳县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610328.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2903', '610329000000', '麟游县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610329.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2904', '610330000000', '凤县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610330.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2905', '610331000000', '太白县', '', '332', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/03/610331.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2906', '610402000000', '秦都区', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610402.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2907', '610403000000', '杨陵区', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610403.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2908', '610404000000', '渭城区', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610404.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2909', '610422000000', '三原县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610422.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2910', '610423000000', '泾阳县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610423.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2911', '610424000000', '乾县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610424.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2912', '610425000000', '礼泉县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610425.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2913', '610426000000', '永寿县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610426.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2914', '610427000000', '彬县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610427.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2915', '610428000000', '长武县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610428.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2916', '610429000000', '旬邑县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610429.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2917', '610430000000', '淳化县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610430.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2918', '610431000000', '武功县', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610431.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2919', '610481000000', '兴平市', '', '333', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/04/610481.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2920', '610502000000', '临渭区', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610502.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2921', '610521000000', '华县', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610521.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2922', '610522000000', '潼关县', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610522.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2923', '610523000000', '大荔县', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610523.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2924', '610524000000', '合阳县', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610524.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2925', '610525000000', '澄城县', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610525.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2926', '610526000000', '蒲城县', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610526.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2927', '610527000000', '白水县', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610527.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2928', '610528000000', '富平县', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610528.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2929', '610581000000', '韩城市', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610581.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2930', '610582000000', '华阴市', '', '334', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/05/610582.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2931', '610602000000', '宝塔区', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610602.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2932', '610621000000', '延长县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610621.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2933', '610622000000', '延川县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610622.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2934', '610623000000', '子长县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610623.html', '2017-05-03 16:37:30', '2017-05-03 16:37:30');
INSERT INTO `sys_dict_china_city` VALUES ('2935', '610624000000', '安塞县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610624.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2936', '610625000000', '志丹县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610625.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2937', '610626000000', '吴起县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610626.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2938', '610627000000', '甘泉县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610627.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2939', '610628000000', '富县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610628.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2940', '610629000000', '洛川县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610629.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2941', '610630000000', '宜川县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610630.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2942', '610631000000', '黄龙县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610631.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2943', '610632000000', '黄陵县', '', '335', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/06/610632.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2944', '610702000000', '汉台区', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610702.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2945', '610721000000', '南郑县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610721.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2946', '610722000000', '城固县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610722.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2947', '610723000000', '洋县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610723.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2948', '610724000000', '西乡县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610724.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2949', '610725000000', '勉县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610725.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2950', '610726000000', '宁强县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610726.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2951', '610727000000', '略阳县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610727.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2952', '610728000000', '镇巴县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610728.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2953', '610729000000', '留坝县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610729.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2954', '610730000000', '佛坪县', '', '336', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/07/610730.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2955', '610802000000', '榆阳区', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610802.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2956', '610821000000', '神木县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610821.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2957', '610822000000', '府谷县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610822.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2958', '610823000000', '横山县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610823.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2959', '610824000000', '靖边县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610824.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2960', '610825000000', '定边县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610825.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2961', '610826000000', '绥德县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610826.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2962', '610827000000', '米脂县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610827.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2963', '610828000000', '佳县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610828.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2964', '610829000000', '吴堡县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610829.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2965', '610830000000', '清涧县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610830.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2966', '610831000000', '子洲县', '', '337', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/08/610831.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2967', '610902000000', '汉滨区', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610902.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2968', '610921000000', '汉阴县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610921.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2969', '610922000000', '石泉县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610922.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2970', '610923000000', '宁陕县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610923.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2971', '610924000000', '紫阳县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610924.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2972', '610925000000', '岚皋县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610925.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2973', '610926000000', '平利县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610926.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2974', '610927000000', '镇坪县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610927.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2975', '610928000000', '旬阳县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610928.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2976', '610929000000', '白河县', '', '338', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/09/610929.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2977', '611002000000', '商州区', '', '339', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/10/611002.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2978', '611021000000', '洛南县', '', '339', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/10/611021.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2979', '611022000000', '丹凤县', '', '339', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/10/611022.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2980', '611023000000', '商南县', '', '339', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/10/611023.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2981', '611024000000', '山阳县', '', '339', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/10/611024.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2982', '611025000000', '镇安县', '', '339', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/10/611025.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2983', '611026000000', '柞水县', '', '339', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/61/10/611026.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2984', '620102000000', '城关区', '', '340', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/01/620102.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2985', '620103000000', '七里河区', '', '340', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/01/620103.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2986', '620104000000', '西固区', '', '340', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/01/620104.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2987', '620105000000', '安宁区', '', '340', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/01/620105.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2988', '620111000000', '红古区', '', '340', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/01/620111.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2989', '620121000000', '永登县', '', '340', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/01/620121.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2990', '620122000000', '皋兰县', '', '340', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/01/620122.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2991', '620123000000', '榆中县', '', '340', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/01/620123.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2992', '620201000000', '市辖区', '', '341', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/02/620201.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2993', '620302000000', '金川区', '', '342', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/03/620302.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2994', '620321000000', '永昌县', '', '342', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/03/620321.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2995', '620402000000', '白银区', '', '343', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/04/620402.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2996', '620403000000', '平川区', '', '343', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/04/620403.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2997', '620421000000', '靖远县', '', '343', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/04/620421.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2998', '620422000000', '会宁县', '', '343', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/04/620422.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('2999', '620423000000', '景泰县', '', '343', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/04/620423.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('3000', '620502000000', '秦州区', '', '344', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/05/620502.html', '2017-05-03 16:37:31', '2017-05-03 16:37:31');
INSERT INTO `sys_dict_china_city` VALUES ('3001', '620503000000', '麦积区', '', '344', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/05/620503.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3002', '620521000000', '清水县', '', '344', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/05/620521.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3003', '620522000000', '秦安县', '', '344', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/05/620522.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3004', '620523000000', '甘谷县', '', '344', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/05/620523.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3005', '620524000000', '武山县', '', '344', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/05/620524.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3006', '620525000000', '张家川回族自治县', '', '344', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/05/620525.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3007', '620602000000', '凉州区', '', '345', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/06/620602.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3008', '620621000000', '民勤县', '', '345', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/06/620621.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3009', '620622000000', '古浪县', '', '345', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/06/620622.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3010', '620623000000', '天祝藏族自治县', '', '345', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/06/620623.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3011', '620702000000', '甘州区', '', '346', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/07/620702.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3012', '620721000000', '肃南裕固族自治县', '', '346', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/07/620721.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3013', '620722000000', '民乐县', '', '346', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/07/620722.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3014', '620723000000', '临泽县', '', '346', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/07/620723.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3015', '620724000000', '高台县', '', '346', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/07/620724.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3016', '620725000000', '山丹县', '', '346', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/07/620725.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3017', '620802000000', '崆峒区', '', '347', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/08/620802.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3018', '620821000000', '泾川县', '', '347', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/08/620821.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3019', '620822000000', '灵台县', '', '347', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/08/620822.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3020', '620823000000', '崇信县', '', '347', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/08/620823.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3021', '620824000000', '华亭县', '', '347', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/08/620824.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3022', '620825000000', '庄浪县', '', '347', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/08/620825.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3023', '620826000000', '静宁县', '', '347', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/08/620826.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3024', '620902000000', '肃州区', '', '348', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/09/620902.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3025', '620921000000', '金塔县', '', '348', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/09/620921.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3026', '620922000000', '瓜州县', '', '348', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/09/620922.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3027', '620923000000', '肃北蒙古族自治县', '', '348', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/09/620923.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3028', '620924000000', '阿克塞哈萨克族自治县', '', '348', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/09/620924.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3029', '620981000000', '玉门市', '', '348', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/09/620981.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3030', '620982000000', '敦煌市', '', '348', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/09/620982.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3031', '621002000000', '西峰区', '', '349', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/10/621002.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3032', '621021000000', '庆城县', '', '349', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/10/621021.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3033', '621022000000', '环县', '', '349', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/10/621022.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3034', '621023000000', '华池县', '', '349', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/10/621023.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3035', '621024000000', '合水县', '', '349', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/10/621024.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3036', '621025000000', '正宁县', '', '349', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/10/621025.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3037', '621026000000', '宁县', '', '349', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/10/621026.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3038', '621027000000', '镇原县', '', '349', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/10/621027.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3039', '621102000000', '安定区', '', '350', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/11/621102.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3040', '621121000000', '通渭县', '', '350', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/11/621121.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3041', '621122000000', '陇西县', '', '350', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/11/621122.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3042', '621123000000', '渭源县', '', '350', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/11/621123.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3043', '621124000000', '临洮县', '', '350', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/11/621124.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3044', '621125000000', '漳县', '', '350', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/11/621125.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3045', '621126000000', '岷县', '', '350', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/11/621126.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3046', '621202000000', '武都区', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621202.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3047', '621221000000', '成县', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621221.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3048', '621222000000', '文县', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621222.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3049', '621223000000', '宕昌县', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621223.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3050', '621224000000', '康县', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621224.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3051', '621225000000', '西和县', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621225.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3052', '621226000000', '礼县', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621226.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3053', '621227000000', '徽县', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621227.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3054', '621228000000', '两当县', '', '351', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/12/621228.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3055', '622901000000', '临夏市', '', '352', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/29/622901.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3056', '622921000000', '临夏县', '', '352', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/29/622921.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3057', '622922000000', '康乐县', '', '352', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/29/622922.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3058', '622923000000', '永靖县', '', '352', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/29/622923.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3059', '622924000000', '广河县', '', '352', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/29/622924.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3060', '622925000000', '和政县', '', '352', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/29/622925.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3061', '622926000000', '东乡族自治县', '', '352', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/29/622926.html', '2017-05-03 16:37:32', '2017-05-03 16:37:32');
INSERT INTO `sys_dict_china_city` VALUES ('3062', '622927000000', '积石山保安族东乡族撒拉族自治县', '', '352', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/29/622927.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3063', '623001000000', '合作市', '', '353', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/30/623001.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3064', '623021000000', '临潭县', '', '353', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/30/623021.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3065', '623022000000', '卓尼县', '', '353', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/30/623022.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3066', '623023000000', '舟曲县', '', '353', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/30/623023.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3067', '623024000000', '迭部县', '', '353', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/30/623024.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3068', '623025000000', '玛曲县', '', '353', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/30/623025.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3069', '623026000000', '碌曲县', '', '353', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/30/623026.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3070', '623027000000', '夏河县', '', '353', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/62/30/623027.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3071', '630102000000', '城东区', '', '354', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/01/630102.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3072', '630103000000', '城中区', '', '354', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/01/630103.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3073', '630104000000', '城西区', '', '354', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/01/630104.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3074', '630105000000', '城北区', '', '354', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/01/630105.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3075', '630121000000', '大通回族土族自治县', '', '354', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/01/630121.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3076', '630122000000', '湟中县', '', '354', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/01/630122.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3077', '630123000000', '湟源县', '', '354', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/01/630123.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3078', '630202000000', '乐都区', '', '355', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/02/630202.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3079', '630203000000', '平安区', '', '355', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/02/630203.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3080', '630222000000', '民和回族土族自治县', '', '355', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/02/630222.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3081', '630223000000', '互助土族自治县', '', '355', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/02/630223.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3082', '630224000000', '化隆回族自治县', '', '355', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/02/630224.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3083', '630225000000', '循化撒拉族自治县', '', '355', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/02/630225.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3084', '632221000000', '门源回族自治县', '', '356', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/22/632221.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3085', '632222000000', '祁连县', '', '356', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/22/632222.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3086', '632223000000', '海晏县', '', '356', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/22/632223.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3087', '632224000000', '刚察县', '', '356', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/22/632224.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3088', '632321000000', '同仁县', '', '357', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/23/632321.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3089', '632322000000', '尖扎县', '', '357', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/23/632322.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3090', '632323000000', '泽库县', '', '357', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/23/632323.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3091', '632324000000', '河南蒙古族自治县', '', '357', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/23/632324.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3092', '632521000000', '共和县', '', '358', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/25/632521.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3093', '632522000000', '同德县', '', '358', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/25/632522.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3094', '632523000000', '贵德县', '', '358', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/25/632523.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3095', '632524000000', '兴海县', '', '358', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/25/632524.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3096', '632525000000', '贵南县', '', '358', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/25/632525.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3097', '632621000000', '玛沁县', '', '359', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/26/632621.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3098', '632622000000', '班玛县', '', '359', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/26/632622.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3099', '632623000000', '甘德县', '', '359', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/26/632623.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3100', '632624000000', '达日县', '', '359', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/26/632624.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3101', '632625000000', '久治县', '', '359', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/26/632625.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3102', '632626000000', '玛多县', '', '359', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/26/632626.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3103', '632701000000', '玉树市', '', '360', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/27/632701.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3104', '632722000000', '杂多县', '', '360', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/27/632722.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3105', '632723000000', '称多县', '', '360', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/27/632723.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3106', '632724000000', '治多县', '', '360', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/27/632724.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3107', '632725000000', '囊谦县', '', '360', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/27/632725.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3108', '632726000000', '曲麻莱县', '', '360', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/27/632726.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3109', '632801000000', '格尔木市', '', '361', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/28/632801.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3110', '632802000000', '德令哈市', '', '361', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/28/632802.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3111', '632821000000', '乌兰县', '', '361', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/28/632821.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3112', '632822000000', '都兰县', '', '361', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/28/632822.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3113', '632823000000', '天峻县', '', '361', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/28/632823.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3114', '632857000000', '大柴旦行政委员会', '', '361', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/28/632857.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3115', '632858000000', '冷湖行政委员会', '', '361', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/28/632858.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3116', '632859000000', '茫崖行政委员会', '', '361', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/63/28/632859.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3117', '640104000000', '兴庆区', '', '362', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/01/640104.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3118', '640105000000', '西夏区', '', '362', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/01/640105.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3119', '640106000000', '金凤区', '', '362', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/01/640106.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3120', '640121000000', '永宁县', '', '362', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/01/640121.html', '2017-05-03 16:37:33', '2017-05-03 16:37:33');
INSERT INTO `sys_dict_china_city` VALUES ('3121', '640122000000', '贺兰县', '', '362', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/01/640122.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3122', '640181000000', '灵武市', '', '362', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/01/640181.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3123', '640202000000', '大武口区', '', '363', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/02/640202.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3124', '640205000000', '惠农区', '', '363', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/02/640205.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3125', '640221000000', '平罗县', '', '363', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/02/640221.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3126', '640302000000', '利通区', '', '364', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/03/640302.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3127', '640303000000', '红寺堡区', '', '364', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/03/640303.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3128', '640323000000', '盐池县', '', '364', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/03/640323.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3129', '640324000000', '同心县', '', '364', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/03/640324.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3130', '640381000000', '青铜峡市', '', '364', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/03/640381.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3131', '640402000000', '原州区', '', '365', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/04/640402.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3132', '640422000000', '西吉县', '', '365', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/04/640422.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3133', '640423000000', '隆德县', '', '365', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/04/640423.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3134', '640424000000', '泾源县', '', '365', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/04/640424.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3135', '640425000000', '彭阳县', '', '365', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/04/640425.html', '2017-05-03 16:37:34', '2017-05-03 16:37:34');
INSERT INTO `sys_dict_china_city` VALUES ('3136', '640502000000', '沙坡头区', '', '366', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/05/640502.html', '2017-05-03 16:38:04', '2017-05-03 16:38:04');
INSERT INTO `sys_dict_china_city` VALUES ('3137', '640521000000', '中宁县', '', '366', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/05/640521.html', '2017-05-03 16:38:04', '2017-05-03 16:38:04');
INSERT INTO `sys_dict_china_city` VALUES ('3138', '640522000000', '海原县', '', '366', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/64/05/640522.html', '2017-05-03 16:38:04', '2017-05-03 16:38:04');
INSERT INTO `sys_dict_china_city` VALUES ('3139', '650102000000', '天山区', '', '367', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/01/650102.html', '2017-05-03 16:38:14', '2017-05-03 16:38:14');
INSERT INTO `sys_dict_china_city` VALUES ('3140', '650103000000', '沙依巴克区', '', '367', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/01/650103.html', '2017-05-03 16:38:14', '2017-05-03 16:38:14');
INSERT INTO `sys_dict_china_city` VALUES ('3141', '650104000000', '新市区', '', '367', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/01/650104.html', '2017-05-03 16:38:14', '2017-05-03 16:38:14');
INSERT INTO `sys_dict_china_city` VALUES ('3142', '650105000000', '水磨沟区', '', '367', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/01/650105.html', '2017-05-03 16:38:14', '2017-05-03 16:38:14');
INSERT INTO `sys_dict_china_city` VALUES ('3143', '650106000000', '头屯河区', '', '367', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/01/650106.html', '2017-05-03 16:38:14', '2017-05-03 16:38:14');
INSERT INTO `sys_dict_china_city` VALUES ('3144', '650107000000', '达坂城区', '', '367', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/01/650107.html', '2017-05-03 16:38:14', '2017-05-03 16:38:14');
INSERT INTO `sys_dict_china_city` VALUES ('3145', '650109000000', '米东区', '', '367', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/01/650109.html', '2017-05-03 16:38:14', '2017-05-03 16:38:14');
INSERT INTO `sys_dict_china_city` VALUES ('3146', '650121000000', '乌鲁木齐县', '', '367', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/01/650121.html', '2017-05-03 16:38:14', '2017-05-03 16:38:14');
INSERT INTO `sys_dict_china_city` VALUES ('3147', '650202000000', '独山子区', '', '368', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/02/650202.html', '2017-05-03 16:38:25', '2017-05-03 16:38:25');
INSERT INTO `sys_dict_china_city` VALUES ('3148', '650203000000', '克拉玛依区', '', '368', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/02/650203.html', '2017-05-03 16:38:25', '2017-05-03 16:38:25');
INSERT INTO `sys_dict_china_city` VALUES ('3149', '650204000000', '白碱滩区', '', '368', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/02/650204.html', '2017-05-03 16:38:25', '2017-05-03 16:38:25');
INSERT INTO `sys_dict_china_city` VALUES ('3150', '650205000000', '乌尔禾区', '', '368', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/02/650205.html', '2017-05-03 16:38:25', '2017-05-03 16:38:25');
INSERT INTO `sys_dict_china_city` VALUES ('3151', '650402000000', '高昌区', '', '369', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/04/650402.html', '2017-05-03 16:38:35', '2017-05-03 16:38:35');
INSERT INTO `sys_dict_china_city` VALUES ('3152', '650421000000', '鄯善县', '', '369', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/04/650421.html', '2017-05-03 16:38:35', '2017-05-03 16:38:35');
INSERT INTO `sys_dict_china_city` VALUES ('3153', '650422000000', '托克逊县', '', '369', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/04/650422.html', '2017-05-03 16:38:35', '2017-05-03 16:38:35');
INSERT INTO `sys_dict_china_city` VALUES ('3154', '652201000000', '哈密市', '', '370', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/22/652201.html', '2017-05-03 16:38:45', '2017-05-03 16:38:45');
INSERT INTO `sys_dict_china_city` VALUES ('3155', '652222000000', '巴里坤哈萨克自治县', '', '370', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/22/652222.html', '2017-05-03 16:38:46', '2017-05-03 16:38:46');
INSERT INTO `sys_dict_china_city` VALUES ('3156', '652223000000', '伊吾县', '', '370', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/22/652223.html', '2017-05-03 16:38:46', '2017-05-03 16:38:46');
INSERT INTO `sys_dict_china_city` VALUES ('3157', '652301000000', '昌吉市', '', '371', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/23/652301.html', '2017-05-03 16:38:56', '2017-05-03 16:38:56');
INSERT INTO `sys_dict_china_city` VALUES ('3158', '652302000000', '阜康市', '', '371', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/23/652302.html', '2017-05-03 16:38:56', '2017-05-03 16:38:56');
INSERT INTO `sys_dict_china_city` VALUES ('3159', '652323000000', '呼图壁县', '', '371', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/23/652323.html', '2017-05-03 16:38:56', '2017-05-03 16:38:56');
INSERT INTO `sys_dict_china_city` VALUES ('3160', '652324000000', '玛纳斯县', '', '371', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/23/652324.html', '2017-05-03 16:38:56', '2017-05-03 16:38:56');
INSERT INTO `sys_dict_china_city` VALUES ('3161', '652325000000', '奇台县', '', '371', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/23/652325.html', '2017-05-03 16:38:56', '2017-05-03 16:38:56');
INSERT INTO `sys_dict_china_city` VALUES ('3162', '652327000000', '吉木萨尔县', '', '371', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/23/652327.html', '2017-05-03 16:38:56', '2017-05-03 16:38:56');
INSERT INTO `sys_dict_china_city` VALUES ('3163', '652328000000', '木垒哈萨克自治县', '', '371', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/23/652328.html', '2017-05-03 16:38:56', '2017-05-03 16:38:56');
INSERT INTO `sys_dict_china_city` VALUES ('3164', '652701000000', '博乐市', '', '372', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/27/652701.html', '2017-05-03 16:39:06', '2017-05-03 16:39:06');
INSERT INTO `sys_dict_china_city` VALUES ('3165', '652702000000', '阿拉山口市', '', '372', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/27/652702.html', '2017-05-03 16:39:06', '2017-05-03 16:39:06');
INSERT INTO `sys_dict_china_city` VALUES ('3166', '652722000000', '精河县', '', '372', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/27/652722.html', '2017-05-03 16:39:06', '2017-05-03 16:39:06');
INSERT INTO `sys_dict_china_city` VALUES ('3167', '652723000000', '温泉县', '', '372', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/27/652723.html', '2017-05-03 16:39:06', '2017-05-03 16:39:06');
INSERT INTO `sys_dict_china_city` VALUES ('3168', '652801000000', '库尔勒市', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652801.html', '2017-05-03 16:39:17', '2017-05-03 16:39:17');
INSERT INTO `sys_dict_china_city` VALUES ('3169', '652822000000', '轮台县', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652822.html', '2017-05-03 16:39:17', '2017-05-03 16:39:17');
INSERT INTO `sys_dict_china_city` VALUES ('3170', '652823000000', '尉犁县', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652823.html', '2017-05-03 16:39:17', '2017-05-03 16:39:17');
INSERT INTO `sys_dict_china_city` VALUES ('3171', '652824000000', '若羌县', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652824.html', '2017-05-03 16:39:17', '2017-05-03 16:39:17');
INSERT INTO `sys_dict_china_city` VALUES ('3172', '652825000000', '且末县', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652825.html', '2017-05-03 16:39:17', '2017-05-03 16:39:17');
INSERT INTO `sys_dict_china_city` VALUES ('3173', '652826000000', '焉耆回族自治县', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652826.html', '2017-05-03 16:39:17', '2017-05-03 16:39:17');
INSERT INTO `sys_dict_china_city` VALUES ('3174', '652827000000', '和静县', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652827.html', '2017-05-03 16:39:17', '2017-05-03 16:39:17');
INSERT INTO `sys_dict_china_city` VALUES ('3175', '652828000000', '和硕县', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652828.html', '2017-05-03 16:39:18', '2017-05-03 16:39:18');
INSERT INTO `sys_dict_china_city` VALUES ('3176', '652829000000', '博湖县', '', '373', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/28/652829.html', '2017-05-03 16:39:18', '2017-05-03 16:39:18');
INSERT INTO `sys_dict_china_city` VALUES ('3177', '652901000000', '阿克苏市', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652901.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3178', '652922000000', '温宿县', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652922.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3179', '652923000000', '库车县', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652923.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3180', '652924000000', '沙雅县', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652924.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3181', '652925000000', '新和县', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652925.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3182', '652926000000', '拜城县', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652926.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3183', '652927000000', '乌什县', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652927.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3184', '652928000000', '阿瓦提县', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652928.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3185', '652929000000', '柯坪县', '', '374', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/29/652929.html', '2017-05-03 16:39:28', '2017-05-03 16:39:28');
INSERT INTO `sys_dict_china_city` VALUES ('3186', '653001000000', '阿图什市', '', '375', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/30/653001.html', '2017-05-03 16:39:38', '2017-05-03 16:39:38');
INSERT INTO `sys_dict_china_city` VALUES ('3187', '653022000000', '阿克陶县', '', '375', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/30/653022.html', '2017-05-03 16:39:39', '2017-05-03 16:39:39');
INSERT INTO `sys_dict_china_city` VALUES ('3188', '653023000000', '阿合奇县', '', '375', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/30/653023.html', '2017-05-03 16:39:39', '2017-05-03 16:39:39');
INSERT INTO `sys_dict_china_city` VALUES ('3189', '653024000000', '乌恰县', '', '375', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/30/653024.html', '2017-05-03 16:39:39', '2017-05-03 16:39:39');
INSERT INTO `sys_dict_china_city` VALUES ('3190', '653101000000', '喀什市', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653101.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3191', '653121000000', '疏附县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653121.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3192', '653122000000', '疏勒县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653122.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3193', '653123000000', '英吉沙县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653123.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3194', '653124000000', '泽普县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653124.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3195', '653125000000', '莎车县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653125.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3196', '653126000000', '叶城县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653126.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3197', '653127000000', '麦盖提县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653127.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3198', '653128000000', '岳普湖县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653128.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3199', '653129000000', '伽师县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653129.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3200', '653130000000', '巴楚县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653130.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3201', '653131000000', '塔什库尔干塔吉克自治县', '', '376', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/31/653131.html', '2017-05-03 16:39:49', '2017-05-03 16:39:49');
INSERT INTO `sys_dict_china_city` VALUES ('3202', '653201000000', '和田市', '', '377', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/32/653201.html', '2017-05-03 16:39:59', '2017-05-03 16:39:59');
INSERT INTO `sys_dict_china_city` VALUES ('3203', '653221000000', '和田县', '', '377', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/32/653221.html', '2017-05-03 16:40:00', '2017-05-03 16:40:00');
INSERT INTO `sys_dict_china_city` VALUES ('3204', '653222000000', '墨玉县', '', '377', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/32/653222.html', '2017-05-03 16:40:00', '2017-05-03 16:40:00');
INSERT INTO `sys_dict_china_city` VALUES ('3205', '653223000000', '皮山县', '', '377', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/32/653223.html', '2017-05-03 16:40:00', '2017-05-03 16:40:00');
INSERT INTO `sys_dict_china_city` VALUES ('3206', '653224000000', '洛浦县', '', '377', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/32/653224.html', '2017-05-03 16:40:00', '2017-05-03 16:40:00');
INSERT INTO `sys_dict_china_city` VALUES ('3207', '653225000000', '策勒县', '', '377', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/32/653225.html', '2017-05-03 16:40:00', '2017-05-03 16:40:00');
INSERT INTO `sys_dict_china_city` VALUES ('3208', '653226000000', '于田县', '', '377', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/32/653226.html', '2017-05-03 16:40:00', '2017-05-03 16:40:00');
INSERT INTO `sys_dict_china_city` VALUES ('3209', '653227000000', '民丰县', '', '377', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/32/653227.html', '2017-05-03 16:40:00', '2017-05-03 16:40:00');
INSERT INTO `sys_dict_china_city` VALUES ('3210', '654002000000', '伊宁市', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654002.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3211', '654003000000', '奎屯市', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654003.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3212', '654004000000', '霍尔果斯市', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654004.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3213', '654021000000', '伊宁县', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654021.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3214', '654022000000', '察布查尔锡伯自治县', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654022.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3215', '654023000000', '霍城县', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654023.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3216', '654024000000', '巩留县', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654024.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3217', '654025000000', '新源县', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654025.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3218', '654026000000', '昭苏县', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654026.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3219', '654027000000', '特克斯县', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654027.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3220', '654028000000', '尼勒克县', '', '378', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/40/654028.html', '2017-05-03 16:40:10', '2017-05-03 16:40:10');
INSERT INTO `sys_dict_china_city` VALUES ('3221', '654201000000', '塔城市', '', '379', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/42/654201.html', '2017-05-03 16:40:20', '2017-05-03 16:40:20');
INSERT INTO `sys_dict_china_city` VALUES ('3222', '654202000000', '乌苏市', '', '379', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/42/654202.html', '2017-05-03 16:40:21', '2017-05-03 16:40:21');
INSERT INTO `sys_dict_china_city` VALUES ('3223', '654221000000', '额敏县', '', '379', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/42/654221.html', '2017-05-03 16:40:21', '2017-05-03 16:40:21');
INSERT INTO `sys_dict_china_city` VALUES ('3224', '654223000000', '沙湾县', '', '379', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/42/654223.html', '2017-05-03 16:40:21', '2017-05-03 16:40:21');
INSERT INTO `sys_dict_china_city` VALUES ('3225', '654224000000', '托里县', '', '379', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/42/654224.html', '2017-05-03 16:40:21', '2017-05-03 16:40:21');
INSERT INTO `sys_dict_china_city` VALUES ('3226', '654225000000', '裕民县', '', '379', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/42/654225.html', '2017-05-03 16:40:21', '2017-05-03 16:40:21');
INSERT INTO `sys_dict_china_city` VALUES ('3227', '654226000000', '和布克赛尔蒙古自治县', '', '379', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/42/654226.html', '2017-05-03 16:40:21', '2017-05-03 16:40:21');
INSERT INTO `sys_dict_china_city` VALUES ('3228', '654301000000', '阿勒泰市', '', '380', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/43/654301.html', '2017-05-03 16:40:31', '2017-05-03 16:40:31');
INSERT INTO `sys_dict_china_city` VALUES ('3229', '654321000000', '布尔津县', '', '380', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/43/654321.html', '2017-05-03 16:40:31', '2017-05-03 16:40:31');
INSERT INTO `sys_dict_china_city` VALUES ('3230', '654322000000', '富蕴县', '', '380', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/43/654322.html', '2017-05-03 16:40:31', '2017-05-03 16:40:31');
INSERT INTO `sys_dict_china_city` VALUES ('3231', '654323000000', '福海县', '', '380', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/43/654323.html', '2017-05-03 16:40:31', '2017-05-03 16:40:31');
INSERT INTO `sys_dict_china_city` VALUES ('3232', '654324000000', '哈巴河县', '', '380', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/43/654324.html', '2017-05-03 16:40:31', '2017-05-03 16:40:31');
INSERT INTO `sys_dict_china_city` VALUES ('3233', '654325000000', '青河县', '', '380', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/43/654325.html', '2017-05-03 16:40:31', '2017-05-03 16:40:31');
INSERT INTO `sys_dict_china_city` VALUES ('3234', '654326000000', '吉木乃县', '', '380', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/43/654326.html', '2017-05-03 16:40:31', '2017-05-03 16:40:31');
INSERT INTO `sys_dict_china_city` VALUES ('3235', '659001000000', '石河子市', '', '381', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/90/659001.html', '2017-05-03 16:40:41', '2017-05-03 16:40:41');
INSERT INTO `sys_dict_china_city` VALUES ('3236', '659002000000', '阿拉尔市', '', '381', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/90/659002.html', '2017-05-03 16:40:41', '2017-05-03 16:40:41');
INSERT INTO `sys_dict_china_city` VALUES ('3237', '659003000000', '图木舒克市', '', '381', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/90/659003.html', '2017-05-03 16:40:41', '2017-05-03 16:40:41');
INSERT INTO `sys_dict_china_city` VALUES ('3238', '659004000000', '五家渠市', '', '381', '3', null, null, null, 'http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2015/65/90/659004.html', '2017-05-03 16:40:41', '2017-05-03 16:40:41');

-- ----------------------------
-- Table structure for sys_icon
-- ----------------------------
DROP TABLE IF EXISTS `sys_icon`;
CREATE TABLE `sys_icon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayName` varchar(255) NOT NULL COMMENT '显示名称',
  `className` varchar(255) NOT NULL COMMENT 'class 名字',
  `sourceType` varchar(255) NOT NULL COMMENT '来源',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1129 DEFAULT CHARSET=utf8 COMMENT='图标资源';

-- ----------------------------
-- Records of sys_icon
-- ----------------------------
INSERT INTO `sys_icon` VALUES ('1', 'glyphicon-asterisk', 'glyphicon glyphicon-asterisk', 'bootstrap', '2017-05-03 17:10:35');
INSERT INTO `sys_icon` VALUES ('2', 'glyphicon-plus', 'glyphicon glyphicon-plus', 'bootstrap', '2017-05-03 17:10:35');
INSERT INTO `sys_icon` VALUES ('3', 'glyphicon-eur', 'glyphicon glyphicon-eur', 'bootstrap', '2017-05-03 17:10:35');
INSERT INTO `sys_icon` VALUES ('4', 'glyphicon-minus', 'glyphicon glyphicon-minus', 'bootstrap', '2017-05-03 17:10:35');
INSERT INTO `sys_icon` VALUES ('5', 'glyphicon-cloud', 'glyphicon glyphicon-cloud', 'bootstrap', '2017-05-03 17:10:35');
INSERT INTO `sys_icon` VALUES ('6', 'glyphicon-envelope', 'glyphicon glyphicon-envelope', 'bootstrap', '2017-05-03 17:10:35');
INSERT INTO `sys_icon` VALUES ('7', 'glyphicon-pencil', 'glyphicon glyphicon-pencil', 'bootstrap', '2017-05-03 17:10:35');
INSERT INTO `sys_icon` VALUES ('8', 'glyphicon-glass', 'glyphicon glyphicon-glass', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('9', 'glyphicon-music', 'glyphicon glyphicon-music', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('10', 'glyphicon-search', 'glyphicon glyphicon-search', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('11', 'glyphicon-heart', 'glyphicon glyphicon-heart', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('12', 'glyphicon-star', 'glyphicon glyphicon-star', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('13', 'glyphicon-star-empty', 'glyphicon glyphicon-star-empty', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('14', 'glyphicon-user', 'glyphicon glyphicon-user', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('15', 'glyphicon-film', 'glyphicon glyphicon-film', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('16', 'glyphicon-th-large', 'glyphicon glyphicon-th-large', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('17', 'glyphicon-th', 'glyphicon glyphicon-th', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('18', 'glyphicon-th-list', 'glyphicon glyphicon-th-list', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('19', 'glyphicon-ok', 'glyphicon glyphicon-ok', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('20', 'glyphicon-remove', 'glyphicon glyphicon-remove', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('21', 'glyphicon-zoom-in', 'glyphicon glyphicon-zoom-in', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('22', 'glyphicon-zoom-out', 'glyphicon glyphicon-zoom-out', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('23', 'glyphicon-off', 'glyphicon glyphicon-off', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('24', 'glyphicon-signal', 'glyphicon glyphicon-signal', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('25', 'glyphicon-cog', 'glyphicon glyphicon-cog', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('26', 'glyphicon-trash', 'glyphicon glyphicon-trash', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('27', 'glyphicon-home', 'glyphicon glyphicon-home', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('28', 'glyphicon-file', 'glyphicon glyphicon-file', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('29', 'glyphicon-time', 'glyphicon glyphicon-time', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('30', 'glyphicon-road', 'glyphicon glyphicon-road', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('31', 'glyphicon-download-alt', 'glyphicon glyphicon-download-alt', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('32', 'glyphicon-download', 'glyphicon glyphicon-download', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('33', 'glyphicon-upload', 'glyphicon glyphicon-upload', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('34', 'glyphicon-inbox', 'glyphicon glyphicon-inbox', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('35', 'glyphicon-play-circle', 'glyphicon glyphicon-play-circle', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('36', 'glyphicon-repeat', 'glyphicon glyphicon-repeat', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('37', 'glyphicon-refresh', 'glyphicon glyphicon-refresh', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('38', 'glyphicon-list-alt', 'glyphicon glyphicon-list-alt', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('39', 'glyphicon-lock', 'glyphicon glyphicon-lock', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('40', 'glyphicon-flag', 'glyphicon glyphicon-flag', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('41', 'glyphicon-headphones', 'glyphicon glyphicon-headphones', 'bootstrap', '2017-05-03 17:10:36');
INSERT INTO `sys_icon` VALUES ('42', 'glyphicon-volume-off', 'glyphicon glyphicon-volume-off', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('43', 'glyphicon-volume-down', 'glyphicon glyphicon-volume-down', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('44', 'glyphicon-volume-up', 'glyphicon glyphicon-volume-up', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('45', 'glyphicon-qrcode', 'glyphicon glyphicon-qrcode', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('46', 'glyphicon-barcode', 'glyphicon glyphicon-barcode', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('47', 'glyphicon-tag', 'glyphicon glyphicon-tag', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('48', 'glyphicon-tags', 'glyphicon glyphicon-tags', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('49', 'glyphicon-book', 'glyphicon glyphicon-book', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('50', 'glyphicon-bookmark', 'glyphicon glyphicon-bookmark', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('51', 'glyphicon-print', 'glyphicon glyphicon-print', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('52', 'glyphicon-camera', 'glyphicon glyphicon-camera', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('53', 'glyphicon-font', 'glyphicon glyphicon-font', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('54', 'glyphicon-bold', 'glyphicon glyphicon-bold', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('55', 'glyphicon-italic', 'glyphicon glyphicon-italic', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('56', 'glyphicon-text-height', 'glyphicon glyphicon-text-height', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('57', 'glyphicon-text-width', 'glyphicon glyphicon-text-width', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('58', 'glyphicon-align-left', 'glyphicon glyphicon-align-left', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('59', 'glyphicon-align-center', 'glyphicon glyphicon-align-center', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('60', 'glyphicon-align-right', 'glyphicon glyphicon-align-right', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('61', 'glyphicon-align-justify', 'glyphicon glyphicon-align-justify', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('62', 'glyphicon-list', 'glyphicon glyphicon-list', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('63', 'glyphicon-indent-left', 'glyphicon glyphicon-indent-left', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('64', 'glyphicon-indent-right', 'glyphicon glyphicon-indent-right', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('65', 'glyphicon-facetime-video', 'glyphicon glyphicon-facetime-video', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('66', 'glyphicon-picture', 'glyphicon glyphicon-picture', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('67', 'glyphicon-map-marker', 'glyphicon glyphicon-map-marker', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('68', 'glyphicon-adjust', 'glyphicon glyphicon-adjust', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('69', 'glyphicon-tint', 'glyphicon glyphicon-tint', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('70', 'glyphicon-edit', 'glyphicon glyphicon-edit', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('71', 'glyphicon-share', 'glyphicon glyphicon-share', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('72', 'glyphicon-check', 'glyphicon glyphicon-check', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('73', 'glyphicon-move', 'glyphicon glyphicon-move', 'bootstrap', '2017-05-03 17:10:37');
INSERT INTO `sys_icon` VALUES ('74', 'glyphicon-step-backward', 'glyphicon glyphicon-step-backward', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('75', 'glyphicon-fast-backward', 'glyphicon glyphicon-fast-backward', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('76', 'glyphicon-backward', 'glyphicon glyphicon-backward', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('77', 'glyphicon-play', 'glyphicon glyphicon-play', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('78', 'glyphicon-pause', 'glyphicon glyphicon-pause', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('79', 'glyphicon-stop', 'glyphicon glyphicon-stop', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('80', 'glyphicon-forward', 'glyphicon glyphicon-forward', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('81', 'glyphicon-fast-forward', 'glyphicon glyphicon-fast-forward', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('82', 'glyphicon-step-forward', 'glyphicon glyphicon-step-forward', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('83', 'glyphicon-eject', 'glyphicon glyphicon-eject', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('84', 'glyphicon-chevron-left', 'glyphicon glyphicon-chevron-left', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('85', 'glyphicon-chevron-right', 'glyphicon glyphicon-chevron-right', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('86', 'glyphicon-plus-sign', 'glyphicon glyphicon-plus-sign', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('87', 'glyphicon-minus-sign', 'glyphicon glyphicon-minus-sign', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('88', 'glyphicon-remove-sign', 'glyphicon glyphicon-remove-sign', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('89', 'glyphicon-ok-sign', 'glyphicon glyphicon-ok-sign', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('90', 'glyphicon-question-sign', 'glyphicon glyphicon-question-sign', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('91', 'glyphicon-info-sign', 'glyphicon glyphicon-info-sign', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('92', 'glyphicon-screenshot', 'glyphicon glyphicon-screenshot', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('93', 'glyphicon-remove-circle', 'glyphicon glyphicon-remove-circle', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('94', 'glyphicon-ok-circle', 'glyphicon glyphicon-ok-circle', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('95', 'glyphicon-ban-circle', 'glyphicon glyphicon-ban-circle', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('96', 'glyphicon-arrow-left', 'glyphicon glyphicon-arrow-left', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('97', 'glyphicon-arrow-right', 'glyphicon glyphicon-arrow-right', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('98', 'glyphicon-arrow-up', 'glyphicon glyphicon-arrow-up', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('99', 'glyphicon-arrow-down', 'glyphicon glyphicon-arrow-down', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('100', 'glyphicon-share-alt', 'glyphicon glyphicon-share-alt', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('101', 'glyphicon-resize-full', 'glyphicon glyphicon-resize-full', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('102', 'glyphicon-resize-small', 'glyphicon glyphicon-resize-small', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('103', 'glyphicon-exclamation-sign', 'glyphicon glyphicon-exclamation-sign', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('104', 'glyphicon-gift', 'glyphicon glyphicon-gift', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('105', 'glyphicon-leaf', 'glyphicon glyphicon-leaf', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('106', 'glyphicon-fire', 'glyphicon glyphicon-fire', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('107', 'glyphicon-eye-open', 'glyphicon glyphicon-eye-open', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('108', 'glyphicon-eye-close', 'glyphicon glyphicon-eye-close', 'bootstrap', '2017-05-03 17:10:38');
INSERT INTO `sys_icon` VALUES ('109', 'glyphicon-warning-sign', 'glyphicon glyphicon-warning-sign', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('110', 'glyphicon-plane', 'glyphicon glyphicon-plane', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('111', 'glyphicon-calendar', 'glyphicon glyphicon-calendar', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('112', 'glyphicon-random', 'glyphicon glyphicon-random', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('113', 'glyphicon-comment', 'glyphicon glyphicon-comment', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('114', 'glyphicon-magnet', 'glyphicon glyphicon-magnet', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('115', 'glyphicon-chevron-up', 'glyphicon glyphicon-chevron-up', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('116', 'glyphicon-chevron-down', 'glyphicon glyphicon-chevron-down', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('117', 'glyphicon-retweet', 'glyphicon glyphicon-retweet', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('118', 'glyphicon-shopping-cart', 'glyphicon glyphicon-shopping-cart', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('119', 'glyphicon-folder-close', 'glyphicon glyphicon-folder-close', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('120', 'glyphicon-folder-open', 'glyphicon glyphicon-folder-open', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('121', 'glyphicon-resize-vertical', 'glyphicon glyphicon-resize-vertical', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('122', 'glyphicon-resize-horizontal', 'glyphicon glyphicon-resize-horizontal', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('123', 'glyphicon-hdd', 'glyphicon glyphicon-hdd', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('124', 'glyphicon-bullhorn', 'glyphicon glyphicon-bullhorn', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('125', 'glyphicon-bell', 'glyphicon glyphicon-bell', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('126', 'glyphicon-certificate', 'glyphicon glyphicon-certificate', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('127', 'glyphicon-thumbs-up', 'glyphicon glyphicon-thumbs-up', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('128', 'glyphicon-thumbs-down', 'glyphicon glyphicon-thumbs-down', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('129', 'glyphicon-hand-right', 'glyphicon glyphicon-hand-right', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('130', 'glyphicon-hand-left', 'glyphicon glyphicon-hand-left', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('131', 'glyphicon-hand-up', 'glyphicon glyphicon-hand-up', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('132', 'glyphicon-hand-down', 'glyphicon glyphicon-hand-down', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('133', 'glyphicon-circle-arrow-right', 'glyphicon glyphicon-circle-arrow-right', 'bootstrap', '2017-05-03 17:10:39');
INSERT INTO `sys_icon` VALUES ('134', 'glyphicon-circle-arrow-left', 'glyphicon glyphicon-circle-arrow-left', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('135', 'glyphicon-circle-arrow-up', 'glyphicon glyphicon-circle-arrow-up', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('136', 'glyphicon-circle-arrow-down', 'glyphicon glyphicon-circle-arrow-down', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('137', 'glyphicon-globe', 'glyphicon glyphicon-globe', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('138', 'glyphicon-wrench', 'glyphicon glyphicon-wrench', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('139', 'glyphicon-tasks', 'glyphicon glyphicon-tasks', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('140', 'glyphicon-filter', 'glyphicon glyphicon-filter', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('141', 'glyphicon-briefcase', 'glyphicon glyphicon-briefcase', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('142', 'glyphicon-fullscreen', 'glyphicon glyphicon-fullscreen', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('143', 'glyphicon-dashboard', 'glyphicon glyphicon-dashboard', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('144', 'glyphicon-paperclip', 'glyphicon glyphicon-paperclip', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('145', 'glyphicon-heart-empty', 'glyphicon glyphicon-heart-empty', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('146', 'glyphicon-link', 'glyphicon glyphicon-link', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('147', 'glyphicon-phone', 'glyphicon glyphicon-phone', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('148', 'glyphicon-pushpin', 'glyphicon glyphicon-pushpin', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('149', 'glyphicon-usd', 'glyphicon glyphicon-usd', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('150', 'glyphicon-gbp', 'glyphicon glyphicon-gbp', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('151', 'glyphicon-sort', 'glyphicon glyphicon-sort', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('152', 'glyphicon-sort-by-alphabet', 'glyphicon glyphicon-sort-by-alphabet', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('153', 'glyphicon-sort-by-alphabet-alt', 'glyphicon glyphicon-sort-by-alphabet-alt', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('154', 'glyphicon-sort-by-order', 'glyphicon glyphicon-sort-by-order', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('155', 'glyphicon-sort-by-order-alt', 'glyphicon glyphicon-sort-by-order-alt', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('156', 'glyphicon-sort-by-attributes', 'glyphicon glyphicon-sort-by-attributes', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('157', 'glyphicon-sort-by-attributes-alt', 'glyphicon glyphicon-sort-by-attributes-alt', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('158', 'glyphicon-unchecked', 'glyphicon glyphicon-unchecked', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('159', 'glyphicon-expand', 'glyphicon glyphicon-expand', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('160', 'glyphicon-collapse-down', 'glyphicon glyphicon-collapse-down', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('161', 'glyphicon-collapse-up', 'glyphicon glyphicon-collapse-up', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('162', 'glyphicon-log-in', 'glyphicon glyphicon-log-in', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('163', 'glyphicon-flash', 'glyphicon glyphicon-flash', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('164', 'glyphicon-log-out', 'glyphicon glyphicon-log-out', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('165', 'glyphicon-new-window', 'glyphicon glyphicon-new-window', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('166', 'glyphicon-record', 'glyphicon glyphicon-record', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('167', 'glyphicon-save', 'glyphicon glyphicon-save', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('168', 'glyphicon-open', 'glyphicon glyphicon-open', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('169', 'glyphicon-saved', 'glyphicon glyphicon-saved', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('170', 'glyphicon-import', 'glyphicon glyphicon-import', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('171', 'glyphicon-export', 'glyphicon glyphicon-export', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('172', 'glyphicon-send', 'glyphicon glyphicon-send', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('173', 'glyphicon-floppy-disk', 'glyphicon glyphicon-floppy-disk', 'bootstrap', '2017-05-03 17:10:40');
INSERT INTO `sys_icon` VALUES ('174', 'glyphicon-floppy-saved', 'glyphicon glyphicon-floppy-saved', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('175', 'glyphicon-floppy-remove', 'glyphicon glyphicon-floppy-remove', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('176', 'glyphicon-floppy-save', 'glyphicon glyphicon-floppy-save', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('177', 'glyphicon-floppy-open', 'glyphicon glyphicon-floppy-open', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('178', 'glyphicon-credit-card', 'glyphicon glyphicon-credit-card', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('179', 'glyphicon-transfer', 'glyphicon glyphicon-transfer', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('180', 'glyphicon-cutlery', 'glyphicon glyphicon-cutlery', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('181', 'glyphicon-header', 'glyphicon glyphicon-header', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('182', 'glyphicon-compressed', 'glyphicon glyphicon-compressed', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('183', 'glyphicon-earphone', 'glyphicon glyphicon-earphone', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('184', 'glyphicon-phone-alt', 'glyphicon glyphicon-phone-alt', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('185', 'glyphicon-tower', 'glyphicon glyphicon-tower', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('186', 'glyphicon-stats', 'glyphicon glyphicon-stats', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('187', 'glyphicon-sd-video', 'glyphicon glyphicon-sd-video', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('188', 'glyphicon-hd-video', 'glyphicon glyphicon-hd-video', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('189', 'glyphicon-subtitles', 'glyphicon glyphicon-subtitles', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('190', 'glyphicon-sound-stereo', 'glyphicon glyphicon-sound-stereo', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('191', 'glyphicon-sound-dolby', 'glyphicon glyphicon-sound-dolby', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('192', 'glyphicon-sound-5-1', 'glyphicon glyphicon-sound-5-1', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('193', 'glyphicon-sound-6-1', 'glyphicon glyphicon-sound-6-1', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('194', 'glyphicon-sound-7-1', 'glyphicon glyphicon-sound-7-1', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('195', 'glyphicon-copyright-mark', 'glyphicon glyphicon-copyright-mark', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('196', 'glyphicon-registration-mark', 'glyphicon glyphicon-registration-mark', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('197', 'glyphicon-cloud-download', 'glyphicon glyphicon-cloud-download', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('198', 'glyphicon-cloud-upload', 'glyphicon glyphicon-cloud-upload', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('199', 'glyphicon-tree-conifer', 'glyphicon glyphicon-tree-conifer', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('200', 'glyphicon-tree-deciduous', 'glyphicon glyphicon-tree-deciduous', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('201', 'glyphicon-cd', 'glyphicon glyphicon-cd', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('202', 'glyphicon-save-file', 'glyphicon glyphicon-save-file', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('203', 'glyphicon-open-file', 'glyphicon glyphicon-open-file', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('204', 'glyphicon-level-up', 'glyphicon glyphicon-level-up', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('205', 'glyphicon-copy', 'glyphicon glyphicon-copy', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('206', 'glyphicon-paste', 'glyphicon glyphicon-paste', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('207', 'glyphicon-alert', 'glyphicon glyphicon-alert', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('208', 'glyphicon-equalizer', 'glyphicon glyphicon-equalizer', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('209', 'glyphicon-king', 'glyphicon glyphicon-king', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('210', 'glyphicon-queen', 'glyphicon glyphicon-queen', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('211', 'glyphicon-pawn', 'glyphicon glyphicon-pawn', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('212', 'glyphicon-bishop', 'glyphicon glyphicon-bishop', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('213', 'glyphicon-knight', 'glyphicon glyphicon-knight', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('214', 'glyphicon-baby-formula', 'glyphicon glyphicon-baby-formula', 'bootstrap', '2017-05-03 17:10:41');
INSERT INTO `sys_icon` VALUES ('215', 'glyphicon-tent', 'glyphicon glyphicon-tent', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('216', 'glyphicon-blackboard', 'glyphicon glyphicon-blackboard', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('217', 'glyphicon-bed', 'glyphicon glyphicon-bed', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('218', 'glyphicon-apple', 'glyphicon glyphicon-apple', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('219', 'glyphicon-erase', 'glyphicon glyphicon-erase', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('220', 'glyphicon-hourglass', 'glyphicon glyphicon-hourglass', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('221', 'glyphicon-lamp', 'glyphicon glyphicon-lamp', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('222', 'glyphicon-duplicate', 'glyphicon glyphicon-duplicate', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('223', 'glyphicon-piggy-bank', 'glyphicon glyphicon-piggy-bank', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('224', 'glyphicon-scissors', 'glyphicon glyphicon-scissors', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('225', 'glyphicon-bitcoin', 'glyphicon glyphicon-bitcoin', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('226', 'glyphicon-btc', 'glyphicon glyphicon-btc', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('227', 'glyphicon-xbt', 'glyphicon glyphicon-xbt', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('228', 'glyphicon-yen', 'glyphicon glyphicon-yen', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('229', 'glyphicon-jpy', 'glyphicon glyphicon-jpy', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('230', 'glyphicon-ruble', 'glyphicon glyphicon-ruble', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('231', 'glyphicon-rub', 'glyphicon glyphicon-rub', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('232', 'glyphicon-scale', 'glyphicon glyphicon-scale', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('233', 'glyphicon-ice-lolly', 'glyphicon glyphicon-ice-lolly', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('234', 'glyphicon-ice-lolly-tasted', 'glyphicon glyphicon-ice-lolly-tasted', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('235', 'glyphicon-education', 'glyphicon glyphicon-education', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('236', 'glyphicon-option-horizontal', 'glyphicon glyphicon-option-horizontal', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('237', 'glyphicon-option-vertical', 'glyphicon glyphicon-option-vertical', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('238', 'glyphicon-menu-hamburger', 'glyphicon glyphicon-menu-hamburger', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('239', 'glyphicon-modal-window', 'glyphicon glyphicon-modal-window', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('240', 'glyphicon-oil', 'glyphicon glyphicon-oil', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('241', 'glyphicon-grain', 'glyphicon glyphicon-grain', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('242', 'glyphicon-sunglasses', 'glyphicon glyphicon-sunglasses', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('243', 'glyphicon-text-size', 'glyphicon glyphicon-text-size', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('244', 'glyphicon-text-color', 'glyphicon glyphicon-text-color', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('245', 'glyphicon-text-background', 'glyphicon glyphicon-text-background', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('246', 'glyphicon-object-align-top', 'glyphicon glyphicon-object-align-top', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('247', 'glyphicon-object-align-bottom', 'glyphicon glyphicon-object-align-bottom', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('248', 'glyphicon-object-align-horizontal', 'glyphicon glyphicon-object-align-horizontal', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('249', 'glyphicon-object-align-left', 'glyphicon glyphicon-object-align-left', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('250', 'glyphicon-object-align-vertical', 'glyphicon glyphicon-object-align-vertical', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('251', 'glyphicon-object-align-right', 'glyphicon glyphicon-object-align-right', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('252', 'glyphicon-triangle-right', 'glyphicon glyphicon-triangle-right', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('253', 'glyphicon-triangle-left', 'glyphicon glyphicon-triangle-left', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('254', 'glyphicon-triangle-bottom', 'glyphicon glyphicon-triangle-bottom', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('255', 'glyphicon-triangle-top', 'glyphicon glyphicon-triangle-top', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('256', 'glyphicon-console', 'glyphicon glyphicon-console', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('257', 'glyphicon-superscript', 'glyphicon glyphicon-superscript', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('258', 'glyphicon-subscript', 'glyphicon glyphicon-subscript', 'bootstrap', '2017-05-03 17:10:42');
INSERT INTO `sys_icon` VALUES ('259', 'glyphicon-menu-left', 'glyphicon glyphicon-menu-left', 'bootstrap', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('260', 'glyphicon-menu-right', 'glyphicon glyphicon-menu-right', 'bootstrap', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('261', 'glyphicon-menu-down', 'glyphicon glyphicon-menu-down', 'bootstrap', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('262', 'glyphicon-menu-up', 'glyphicon glyphicon-menu-up', 'bootstrap', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('263', 'icon-prev', 'glyphicon icon-prev', 'bootstrap', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('264', 'icon-next', 'glyphicon icon-next', 'bootstrap', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('265', 'fa-glass', 'fa fa-glass', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('266', 'fa-music', 'fa fa-music', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('267', 'fa-search', 'fa fa-search', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('268', 'fa-envelope-o', 'fa fa-envelope-o', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('269', 'fa-heart', 'fa fa-heart', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('270', 'fa-star', 'fa fa-star', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('271', 'fa-star-o', 'fa fa-star-o', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('272', 'fa-user', 'fa fa-user', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('273', 'fa-film', 'fa fa-film', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('274', 'fa-th-large', 'fa fa-th-large', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('275', 'fa-th', 'fa fa-th', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('276', 'fa-th-list', 'fa fa-th-list', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('277', 'fa-check', 'fa fa-check', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('278', 'fa-times', 'fa fa-times', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('279', 'fa-search-plus', 'fa fa-search-plus', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('280', 'fa-search-minus', 'fa fa-search-minus', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('281', 'fa-power-off', 'fa fa-power-off', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('282', 'fa-signal', 'fa fa-signal', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('283', 'fa-cog', 'fa fa-cog', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('284', 'fa-trash-o', 'fa fa-trash-o', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('285', 'fa-home', 'fa fa-home', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('286', 'fa-file-o', 'fa fa-file-o', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('287', 'fa-clock-o', 'fa fa-clock-o', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('288', 'fa-road', 'fa fa-road', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('289', 'fa-download', 'fa fa-download', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('290', 'fa-arrow-circle-o-down', 'fa fa-arrow-circle-o-down', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('291', 'fa-arrow-circle-o-up', 'fa fa-arrow-circle-o-up', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('292', 'fa-inbox', 'fa fa-inbox', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('293', 'fa-play-circle-o', 'fa fa-play-circle-o', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('294', 'fa-repeat', 'fa fa-repeat', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('295', 'fa-refresh', 'fa fa-refresh', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('296', 'fa-list-alt', 'fa fa-list-alt', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('297', 'fa-lock', 'fa fa-lock', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('298', 'fa-flag', 'fa fa-flag', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('299', 'fa-headphones', 'fa fa-headphones', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('300', 'fa-volume-off', 'fa fa-volume-off', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('301', 'fa-volume-down', 'fa fa-volume-down', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('302', 'fa-volume-up', 'fa fa-volume-up', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('303', 'fa-qrcode', 'fa fa-qrcode', 'fontAwesome', '2017-05-03 17:10:43');
INSERT INTO `sys_icon` VALUES ('304', 'fa-barcode', 'fa fa-barcode', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('305', 'fa-tag', 'fa fa-tag', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('306', 'fa-tags', 'fa fa-tags', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('307', 'fa-book', 'fa fa-book', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('308', 'fa-bookmark', 'fa fa-bookmark', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('309', 'fa-print', 'fa fa-print', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('310', 'fa-camera', 'fa fa-camera', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('311', 'fa-font', 'fa fa-font', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('312', 'fa-bold', 'fa fa-bold', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('313', 'fa-italic', 'fa fa-italic', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('314', 'fa-text-height', 'fa fa-text-height', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('315', 'fa-text-width', 'fa fa-text-width', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('316', 'fa-align-left', 'fa fa-align-left', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('317', 'fa-align-center', 'fa fa-align-center', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('318', 'fa-align-right', 'fa fa-align-right', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('319', 'fa-align-justify', 'fa fa-align-justify', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('320', 'fa-list', 'fa fa-list', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('321', 'fa-outdent', 'fa fa-outdent', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('322', 'fa-indent', 'fa fa-indent', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('323', 'fa-video-camera', 'fa fa-video-camera', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('324', 'fa-picture-o', 'fa fa-picture-o', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('325', 'fa-pencil', 'fa fa-pencil', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('326', 'fa-map-marker', 'fa fa-map-marker', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('327', 'fa-adjust', 'fa fa-adjust', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('328', 'fa-tint', 'fa fa-tint', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('329', 'fa-pencil-square-o', 'fa fa-pencil-square-o', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('330', 'fa-share-square-o', 'fa fa-share-square-o', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('331', 'fa-check-square-o', 'fa fa-check-square-o', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('332', 'fa-arrows', 'fa fa-arrows', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('333', 'fa-step-backward', 'fa fa-step-backward', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('334', 'fa-fast-backward', 'fa fa-fast-backward', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('335', 'fa-backward', 'fa fa-backward', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('336', 'fa-play', 'fa fa-play', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('337', 'fa-pause', 'fa fa-pause', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('338', 'fa-stop', 'fa fa-stop', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('339', 'fa-forward', 'fa fa-forward', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('340', 'fa-fast-forward', 'fa fa-fast-forward', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('341', 'fa-step-forward', 'fa fa-step-forward', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('342', 'fa-eject', 'fa fa-eject', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('343', 'fa-chevron-left', 'fa fa-chevron-left', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('344', 'fa-chevron-right', 'fa fa-chevron-right', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('345', 'fa-plus-circle', 'fa fa-plus-circle', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('346', 'fa-minus-circle', 'fa fa-minus-circle', 'fontAwesome', '2017-05-03 17:10:44');
INSERT INTO `sys_icon` VALUES ('347', 'fa-times-circle', 'fa fa-times-circle', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('348', 'fa-check-circle', 'fa fa-check-circle', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('349', 'fa-question-circle', 'fa fa-question-circle', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('350', 'fa-info-circle', 'fa fa-info-circle', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('351', 'fa-crosshairs', 'fa fa-crosshairs', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('352', 'fa-times-circle-o', 'fa fa-times-circle-o', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('353', 'fa-check-circle-o', 'fa fa-check-circle-o', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('354', 'fa-ban', 'fa fa-ban', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('355', 'fa-arrow-left', 'fa fa-arrow-left', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('356', 'fa-arrow-right', 'fa fa-arrow-right', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('357', 'fa-arrow-up', 'fa fa-arrow-up', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('358', 'fa-arrow-down', 'fa fa-arrow-down', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('359', 'fa-share', 'fa fa-share', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('360', 'fa-expand', 'fa fa-expand', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('361', 'fa-compress', 'fa fa-compress', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('362', 'fa-plus', 'fa fa-plus', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('363', 'fa-minus', 'fa fa-minus', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('364', 'fa-asterisk', 'fa fa-asterisk', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('365', 'fa-exclamation-circle', 'fa fa-exclamation-circle', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('366', 'fa-gift', 'fa fa-gift', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('367', 'fa-leaf', 'fa fa-leaf', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('368', 'fa-fire', 'fa fa-fire', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('369', 'fa-eye', 'fa fa-eye', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('370', 'fa-eye-slash', 'fa fa-eye-slash', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('371', 'fa-exclamation-triangle', 'fa fa-exclamation-triangle', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('372', 'fa-plane', 'fa fa-plane', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('373', 'fa-calendar', 'fa fa-calendar', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('374', 'fa-random', 'fa fa-random', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('375', 'fa-comment', 'fa fa-comment', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('376', 'fa-magnet', 'fa fa-magnet', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('377', 'fa-chevron-up', 'fa fa-chevron-up', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('378', 'fa-chevron-down', 'fa fa-chevron-down', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('379', 'fa-retweet', 'fa fa-retweet', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('380', 'fa-shopping-cart', 'fa fa-shopping-cart', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('381', 'fa-folder', 'fa fa-folder', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('382', 'fa-folder-open', 'fa fa-folder-open', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('383', 'fa-arrows-v', 'fa fa-arrows-v', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('384', 'fa-arrows-h', 'fa fa-arrows-h', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('385', 'fa-bar-chart', 'fa fa-bar-chart', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('386', 'fa-twitter-square', 'fa fa-twitter-square', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('387', 'fa-facebook-square', 'fa fa-facebook-square', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('388', 'fa-camera-retro', 'fa fa-camera-retro', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('389', 'fa-key', 'fa fa-key', 'fontAwesome', '2017-05-03 17:10:45');
INSERT INTO `sys_icon` VALUES ('390', 'fa-cogs', 'fa fa-cogs', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('391', 'fa-comments', 'fa fa-comments', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('392', 'fa-thumbs-o-up', 'fa fa-thumbs-o-up', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('393', 'fa-thumbs-o-down', 'fa fa-thumbs-o-down', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('394', 'fa-star-half', 'fa fa-star-half', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('395', 'fa-heart-o', 'fa fa-heart-o', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('396', 'fa-sign-out', 'fa fa-sign-out', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('397', 'fa-linkedin-square', 'fa fa-linkedin-square', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('398', 'fa-thumb-tack', 'fa fa-thumb-tack', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('399', 'fa-external-link', 'fa fa-external-link', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('400', 'fa-sign-in', 'fa fa-sign-in', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('401', 'fa-trophy', 'fa fa-trophy', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('402', 'fa-github-square', 'fa fa-github-square', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('403', 'fa-upload', 'fa fa-upload', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('404', 'fa-lemon-o', 'fa fa-lemon-o', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('405', 'fa-phone', 'fa fa-phone', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('406', 'fa-square-o', 'fa fa-square-o', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('407', 'fa-bookmark-o', 'fa fa-bookmark-o', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('408', 'fa-phone-square', 'fa fa-phone-square', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('409', 'fa-twitter', 'fa fa-twitter', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('410', 'fa-facebook', 'fa fa-facebook', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('411', 'fa-github', 'fa fa-github', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('412', 'fa-unlock', 'fa fa-unlock', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('413', 'fa-credit-card', 'fa fa-credit-card', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('414', 'fa-rss', 'fa fa-rss', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('415', 'fa-hdd-o', 'fa fa-hdd-o', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('416', 'fa-bullhorn', 'fa fa-bullhorn', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('417', 'fa-bell', 'fa fa-bell', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('418', 'fa-certificate', 'fa fa-certificate', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('419', 'fa-hand-o-right', 'fa fa-hand-o-right', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('420', 'fa-hand-o-left', 'fa fa-hand-o-left', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('421', 'fa-hand-o-up', 'fa fa-hand-o-up', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('422', 'fa-hand-o-down', 'fa fa-hand-o-down', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('423', 'fa-arrow-circle-left', 'fa fa-arrow-circle-left', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('424', 'fa-arrow-circle-right', 'fa fa-arrow-circle-right', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('425', 'fa-arrow-circle-up', 'fa fa-arrow-circle-up', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('426', 'fa-arrow-circle-down', 'fa fa-arrow-circle-down', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('427', 'fa-globe', 'fa fa-globe', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('428', 'fa-wrench', 'fa fa-wrench', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('429', 'fa-tasks', 'fa fa-tasks', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('430', 'fa-filter', 'fa fa-filter', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('431', 'fa-briefcase', 'fa fa-briefcase', 'fontAwesome', '2017-05-03 17:10:46');
INSERT INTO `sys_icon` VALUES ('432', 'fa-arrows-alt', 'fa fa-arrows-alt', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('433', 'fa-users', 'fa fa-users', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('434', 'fa-link', 'fa fa-link', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('435', 'fa-cloud', 'fa fa-cloud', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('436', 'fa-flask', 'fa fa-flask', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('437', 'fa-scissors', 'fa fa-scissors', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('438', 'fa-files-o', 'fa fa-files-o', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('439', 'fa-paperclip', 'fa fa-paperclip', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('440', 'fa-floppy-o', 'fa fa-floppy-o', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('441', 'fa-square', 'fa fa-square', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('442', 'fa-bars', 'fa fa-bars', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('443', 'fa-list-ul', 'fa fa-list-ul', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('444', 'fa-list-ol', 'fa fa-list-ol', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('445', 'fa-strikethrough', 'fa fa-strikethrough', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('446', 'fa-underline', 'fa fa-underline', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('447', 'fa-table', 'fa fa-table', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('448', 'fa-magic', 'fa fa-magic', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('449', 'fa-truck', 'fa fa-truck', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('450', 'fa-pinterest', 'fa fa-pinterest', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('451', 'fa-pinterest-square', 'fa fa-pinterest-square', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('452', 'fa-google-plus-square', 'fa fa-google-plus-square', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('453', 'fa-google-plus', 'fa fa-google-plus', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('454', 'fa-money', 'fa fa-money', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('455', 'fa-caret-down', 'fa fa-caret-down', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('456', 'fa-caret-up', 'fa fa-caret-up', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('457', 'fa-caret-left', 'fa fa-caret-left', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('458', 'fa-caret-right', 'fa fa-caret-right', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('459', 'fa-columns', 'fa fa-columns', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('460', 'fa-sort', 'fa fa-sort', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('461', 'fa-sort-desc', 'fa fa-sort-desc', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('462', 'fa-sort-asc', 'fa fa-sort-asc', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('463', 'fa-envelope', 'fa fa-envelope', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('464', 'fa-linkedin', 'fa fa-linkedin', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('465', 'fa-undo', 'fa fa-undo', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('466', 'fa-gavel', 'fa fa-gavel', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('467', 'fa-tachometer', 'fa fa-tachometer', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('468', 'fa-comment-o', 'fa fa-comment-o', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('469', 'fa-comments-o', 'fa fa-comments-o', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('470', 'fa-bolt', 'fa fa-bolt', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('471', 'fa-sitemap', 'fa fa-sitemap', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('472', 'fa-umbrella', 'fa fa-umbrella', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('473', 'fa-clipboard', 'fa fa-clipboard', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('474', 'fa-lightbulb-o', 'fa fa-lightbulb-o', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('475', 'fa-exchange', 'fa fa-exchange', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('476', 'fa-cloud-download', 'fa fa-cloud-download', 'fontAwesome', '2017-05-03 17:10:47');
INSERT INTO `sys_icon` VALUES ('477', 'fa-cloud-upload', 'fa fa-cloud-upload', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('478', 'fa-user-md', 'fa fa-user-md', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('479', 'fa-stethoscope', 'fa fa-stethoscope', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('480', 'fa-suitcase', 'fa fa-suitcase', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('481', 'fa-bell-o', 'fa fa-bell-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('482', 'fa-coffee', 'fa fa-coffee', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('483', 'fa-cutlery', 'fa fa-cutlery', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('484', 'fa-file-text-o', 'fa fa-file-text-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('485', 'fa-building-o', 'fa fa-building-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('486', 'fa-hospital-o', 'fa fa-hospital-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('487', 'fa-ambulance', 'fa fa-ambulance', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('488', 'fa-medkit', 'fa fa-medkit', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('489', 'fa-fighter-jet', 'fa fa-fighter-jet', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('490', 'fa-beer', 'fa fa-beer', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('491', 'fa-h-square', 'fa fa-h-square', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('492', 'fa-plus-square', 'fa fa-plus-square', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('493', 'fa-angle-double-left', 'fa fa-angle-double-left', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('494', 'fa-angle-double-right', 'fa fa-angle-double-right', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('495', 'fa-angle-double-up', 'fa fa-angle-double-up', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('496', 'fa-angle-double-down', 'fa fa-angle-double-down', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('497', 'fa-angle-left', 'fa fa-angle-left', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('498', 'fa-angle-right', 'fa fa-angle-right', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('499', 'fa-angle-up', 'fa fa-angle-up', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('500', 'fa-angle-down', 'fa fa-angle-down', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('501', 'fa-desktop', 'fa fa-desktop', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('502', 'fa-laptop', 'fa fa-laptop', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('503', 'fa-tablet', 'fa fa-tablet', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('504', 'fa-mobile', 'fa fa-mobile', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('505', 'fa-circle-o', 'fa fa-circle-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('506', 'fa-quote-left', 'fa fa-quote-left', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('507', 'fa-quote-right', 'fa fa-quote-right', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('508', 'fa-spinner', 'fa fa-spinner', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('509', 'fa-circle', 'fa fa-circle', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('510', 'fa-reply', 'fa fa-reply', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('511', 'fa-github-alt', 'fa fa-github-alt', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('512', 'fa-folder-o', 'fa fa-folder-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('513', 'fa-folder-open-o', 'fa fa-folder-open-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('514', 'fa-smile-o', 'fa fa-smile-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('515', 'fa-frown-o', 'fa fa-frown-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('516', 'fa-meh-o', 'fa fa-meh-o', 'fontAwesome', '2017-05-03 17:10:48');
INSERT INTO `sys_icon` VALUES ('517', 'fa-gamepad', 'fa fa-gamepad', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('518', 'fa-keyboard-o', 'fa fa-keyboard-o', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('519', 'fa-flag-o', 'fa fa-flag-o', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('520', 'fa-flag-checkered', 'fa fa-flag-checkered', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('521', 'fa-terminal', 'fa fa-terminal', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('522', 'fa-code', 'fa fa-code', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('523', 'fa-reply-all', 'fa fa-reply-all', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('524', 'fa-star-half-o', 'fa fa-star-half-o', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('525', 'fa-location-arrow', 'fa fa-location-arrow', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('526', 'fa-crop', 'fa fa-crop', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('527', 'fa-code-fork', 'fa fa-code-fork', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('528', 'fa-chain-broken', 'fa fa-chain-broken', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('529', 'fa-question', 'fa fa-question', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('530', 'fa-info', 'fa fa-info', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('531', 'fa-exclamation', 'fa fa-exclamation', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('532', 'fa-superscript', 'fa fa-superscript', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('533', 'fa-subscript', 'fa fa-subscript', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('534', 'fa-eraser', 'fa fa-eraser', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('535', 'fa-puzzle-piece', 'fa fa-puzzle-piece', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('536', 'fa-microphone', 'fa fa-microphone', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('537', 'fa-microphone-slash', 'fa fa-microphone-slash', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('538', 'fa-shield', 'fa fa-shield', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('539', 'fa-calendar-o', 'fa fa-calendar-o', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('540', 'fa-fire-extinguisher', 'fa fa-fire-extinguisher', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('541', 'fa-rocket', 'fa fa-rocket', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('542', 'fa-maxcdn', 'fa fa-maxcdn', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('543', 'fa-chevron-circle-left', 'fa fa-chevron-circle-left', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('544', 'fa-chevron-circle-right', 'fa fa-chevron-circle-right', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('545', 'fa-chevron-circle-up', 'fa fa-chevron-circle-up', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('546', 'fa-chevron-circle-down', 'fa fa-chevron-circle-down', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('547', 'fa-html5', 'fa fa-html5', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('548', 'fa-css3', 'fa fa-css3', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('549', 'fa-anchor', 'fa fa-anchor', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('550', 'fa-unlock-alt', 'fa fa-unlock-alt', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('551', 'fa-bullseye', 'fa fa-bullseye', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('552', 'fa-ellipsis-h', 'fa fa-ellipsis-h', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('553', 'fa-ellipsis-v', 'fa fa-ellipsis-v', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('554', 'fa-rss-square', 'fa fa-rss-square', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('555', 'fa-play-circle', 'fa fa-play-circle', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('556', 'fa-ticket', 'fa fa-ticket', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('557', 'fa-minus-square', 'fa fa-minus-square', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('558', 'fa-minus-square-o', 'fa fa-minus-square-o', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('559', 'fa-level-up', 'fa fa-level-up', 'fontAwesome', '2017-05-03 17:10:49');
INSERT INTO `sys_icon` VALUES ('560', 'fa-level-down', 'fa fa-level-down', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('561', 'fa-check-square', 'fa fa-check-square', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('562', 'fa-pencil-square', 'fa fa-pencil-square', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('563', 'fa-external-link-square', 'fa fa-external-link-square', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('564', 'fa-share-square', 'fa fa-share-square', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('565', 'fa-compass', 'fa fa-compass', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('566', 'fa-caret-square-o-down', 'fa fa-caret-square-o-down', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('567', 'fa-caret-square-o-up', 'fa fa-caret-square-o-up', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('568', 'fa-caret-square-o-right', 'fa fa-caret-square-o-right', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('569', 'fa-eur', 'fa fa-eur', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('570', 'fa-gbp', 'fa fa-gbp', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('571', 'fa-usd', 'fa fa-usd', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('572', 'fa-inr', 'fa fa-inr', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('573', 'fa-jpy', 'fa fa-jpy', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('574', 'fa-rub', 'fa fa-rub', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('575', 'fa-krw', 'fa fa-krw', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('576', 'fa-btc', 'fa fa-btc', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('577', 'fa-file', 'fa fa-file', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('578', 'fa-file-text', 'fa fa-file-text', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('579', 'fa-sort-alpha-asc', 'fa fa-sort-alpha-asc', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('580', 'fa-sort-alpha-desc', 'fa fa-sort-alpha-desc', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('581', 'fa-sort-amount-asc', 'fa fa-sort-amount-asc', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('582', 'fa-sort-amount-desc', 'fa fa-sort-amount-desc', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('583', 'fa-sort-numeric-asc', 'fa fa-sort-numeric-asc', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('584', 'fa-sort-numeric-desc', 'fa fa-sort-numeric-desc', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('585', 'fa-thumbs-up', 'fa fa-thumbs-up', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('586', 'fa-thumbs-down', 'fa fa-thumbs-down', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('587', 'fa-youtube-square', 'fa fa-youtube-square', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('588', 'fa-youtube', 'fa fa-youtube', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('589', 'fa-xing', 'fa fa-xing', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('590', 'fa-xing-square', 'fa fa-xing-square', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('591', 'fa-youtube-play', 'fa fa-youtube-play', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('592', 'fa-dropbox', 'fa fa-dropbox', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('593', 'fa-stack-overflow', 'fa fa-stack-overflow', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('594', 'fa-instagram', 'fa fa-instagram', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('595', 'fa-flickr', 'fa fa-flickr', 'fontAwesome', '2017-05-03 17:10:50');
INSERT INTO `sys_icon` VALUES ('596', 'fa-adn', 'fa fa-adn', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('597', 'fa-bitbucket', 'fa fa-bitbucket', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('598', 'fa-bitbucket-square', 'fa fa-bitbucket-square', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('599', 'fa-tumblr', 'fa fa-tumblr', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('600', 'fa-tumblr-square', 'fa fa-tumblr-square', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('601', 'fa-long-arrow-down', 'fa fa-long-arrow-down', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('602', 'fa-long-arrow-up', 'fa fa-long-arrow-up', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('603', 'fa-long-arrow-left', 'fa fa-long-arrow-left', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('604', 'fa-long-arrow-right', 'fa fa-long-arrow-right', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('605', 'fa-apple', 'fa fa-apple', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('606', 'fa-windows', 'fa fa-windows', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('607', 'fa-android', 'fa fa-android', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('608', 'fa-linux', 'fa fa-linux', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('609', 'fa-dribbble', 'fa fa-dribbble', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('610', 'fa-skype', 'fa fa-skype', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('611', 'fa-foursquare', 'fa fa-foursquare', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('612', 'fa-trello', 'fa fa-trello', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('613', 'fa-female', 'fa fa-female', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('614', 'fa-male', 'fa fa-male', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('615', 'fa-gratipay', 'fa fa-gratipay', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('616', 'fa-sun-o', 'fa fa-sun-o', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('617', 'fa-moon-o', 'fa fa-moon-o', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('618', 'fa-archive', 'fa fa-archive', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('619', 'fa-bug', 'fa fa-bug', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('620', 'fa-vk', 'fa fa-vk', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('621', 'fa-weibo', 'fa fa-weibo', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('622', 'fa-renren', 'fa fa-renren', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('623', 'fa-pagelines', 'fa fa-pagelines', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('624', 'fa-stack-exchange', 'fa fa-stack-exchange', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('625', 'fa-arrow-circle-o-right', 'fa fa-arrow-circle-o-right', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('626', 'fa-arrow-circle-o-left', 'fa fa-arrow-circle-o-left', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('627', 'fa-caret-square-o-left', 'fa fa-caret-square-o-left', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('628', 'fa-dot-circle-o', 'fa fa-dot-circle-o', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('629', 'fa-wheelchair', 'fa fa-wheelchair', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('630', 'fa-vimeo-square', 'fa fa-vimeo-square', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('631', 'fa-try', 'fa fa-try', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('632', 'fa-plus-square-o', 'fa fa-plus-square-o', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('633', 'fa-space-shuttle', 'fa fa-space-shuttle', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('634', 'fa-slack', 'fa fa-slack', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('635', 'fa-envelope-square', 'fa fa-envelope-square', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('636', 'fa-wordpress', 'fa fa-wordpress', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('637', 'fa-openid', 'fa fa-openid', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('638', 'fa-university', 'fa fa-university', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('639', 'fa-graduation-cap', 'fa fa-graduation-cap', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('640', 'fa-yahoo', 'fa fa-yahoo', 'fontAwesome', '2017-05-03 17:10:51');
INSERT INTO `sys_icon` VALUES ('641', 'fa-google', 'fa fa-google', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('642', 'fa-reddit', 'fa fa-reddit', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('643', 'fa-reddit-square', 'fa fa-reddit-square', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('644', 'fa-stumbleupon-circle', 'fa fa-stumbleupon-circle', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('645', 'fa-stumbleupon', 'fa fa-stumbleupon', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('646', 'fa-delicious', 'fa fa-delicious', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('647', 'fa-digg', 'fa fa-digg', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('648', 'fa-pied-piper-pp', 'fa fa-pied-piper-pp', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('649', 'fa-pied-piper-alt', 'fa fa-pied-piper-alt', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('650', 'fa-drupal', 'fa fa-drupal', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('651', 'fa-joomla', 'fa fa-joomla', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('652', 'fa-language', 'fa fa-language', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('653', 'fa-fax', 'fa fa-fax', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('654', 'fa-building', 'fa fa-building', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('655', 'fa-child', 'fa fa-child', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('656', 'fa-paw', 'fa fa-paw', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('657', 'fa-spoon', 'fa fa-spoon', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('658', 'fa-cube', 'fa fa-cube', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('659', 'fa-cubes', 'fa fa-cubes', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('660', 'fa-behance', 'fa fa-behance', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('661', 'fa-behance-square', 'fa fa-behance-square', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('662', 'fa-steam', 'fa fa-steam', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('663', 'fa-steam-square', 'fa fa-steam-square', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('664', 'fa-recycle', 'fa fa-recycle', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('665', 'fa-car', 'fa fa-car', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('666', 'fa-taxi', 'fa fa-taxi', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('667', 'fa-tree', 'fa fa-tree', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('668', 'fa-spotify', 'fa fa-spotify', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('669', 'fa-deviantart', 'fa fa-deviantart', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('670', 'fa-soundcloud', 'fa fa-soundcloud', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('671', 'fa-database', 'fa fa-database', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('672', 'fa-file-pdf-o', 'fa fa-file-pdf-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('673', 'fa-file-word-o', 'fa fa-file-word-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('674', 'fa-file-excel-o', 'fa fa-file-excel-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('675', 'fa-file-powerpoint-o', 'fa fa-file-powerpoint-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('676', 'fa-file-image-o', 'fa fa-file-image-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('677', 'fa-file-archive-o', 'fa fa-file-archive-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('678', 'fa-file-audio-o', 'fa fa-file-audio-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('679', 'fa-file-video-o', 'fa fa-file-video-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('680', 'fa-file-code-o', 'fa fa-file-code-o', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('681', 'fa-vine', 'fa fa-vine', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('682', 'fa-codepen', 'fa fa-codepen', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('683', 'fa-jsfiddle', 'fa fa-jsfiddle', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('684', 'fa-life-ring', 'fa fa-life-ring', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('685', 'fa-circle-o-notch', 'fa fa-circle-o-notch', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('686', 'fa-rebel', 'fa fa-rebel', 'fontAwesome', '2017-05-03 17:10:52');
INSERT INTO `sys_icon` VALUES ('687', 'fa-empire', 'fa fa-empire', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('688', 'fa-git-square', 'fa fa-git-square', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('689', 'fa-git', 'fa fa-git', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('690', 'fa-hacker-news', 'fa fa-hacker-news', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('691', 'fa-tencent-weibo', 'fa fa-tencent-weibo', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('692', 'fa-qq', 'fa fa-qq', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('693', 'fa-weixin', 'fa fa-weixin', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('694', 'fa-paper-plane', 'fa fa-paper-plane', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('695', 'fa-paper-plane-o', 'fa fa-paper-plane-o', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('696', 'fa-history', 'fa fa-history', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('697', 'fa-circle-thin', 'fa fa-circle-thin', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('698', 'fa-header', 'fa fa-header', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('699', 'fa-paragraph', 'fa fa-paragraph', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('700', 'fa-sliders', 'fa fa-sliders', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('701', 'fa-share-alt', 'fa fa-share-alt', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('702', 'fa-share-alt-square', 'fa fa-share-alt-square', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('703', 'fa-bomb', 'fa fa-bomb', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('704', 'fa-futbol-o', 'fa fa-futbol-o', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('705', 'fa-tty', 'fa fa-tty', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('706', 'fa-binoculars', 'fa fa-binoculars', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('707', 'fa-plug', 'fa fa-plug', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('708', 'fa-slideshare', 'fa fa-slideshare', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('709', 'fa-twitch', 'fa fa-twitch', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('710', 'fa-yelp', 'fa fa-yelp', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('711', 'fa-newspaper-o', 'fa fa-newspaper-o', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('712', 'fa-wifi', 'fa fa-wifi', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('713', 'fa-calculator', 'fa fa-calculator', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('714', 'fa-paypal', 'fa fa-paypal', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('715', 'fa-google-wallet', 'fa fa-google-wallet', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('716', 'fa-cc-visa', 'fa fa-cc-visa', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('717', 'fa-cc-mastercard', 'fa fa-cc-mastercard', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('718', 'fa-cc-discover', 'fa fa-cc-discover', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('719', 'fa-cc-amex', 'fa fa-cc-amex', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('720', 'fa-cc-paypal', 'fa fa-cc-paypal', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('721', 'fa-cc-stripe', 'fa fa-cc-stripe', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('722', 'fa-bell-slash', 'fa fa-bell-slash', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('723', 'fa-bell-slash-o', 'fa fa-bell-slash-o', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('724', 'fa-trash', 'fa fa-trash', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('725', 'fa-copyright', 'fa fa-copyright', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('726', 'fa-at', 'fa fa-at', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('727', 'fa-eyedropper', 'fa fa-eyedropper', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('728', 'fa-paint-brush', 'fa fa-paint-brush', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('729', 'fa-birthday-cake', 'fa fa-birthday-cake', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('730', 'fa-area-chart', 'fa fa-area-chart', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('731', 'fa-pie-chart', 'fa fa-pie-chart', 'fontAwesome', '2017-05-03 17:10:53');
INSERT INTO `sys_icon` VALUES ('732', 'fa-line-chart', 'fa fa-line-chart', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('733', 'fa-lastfm', 'fa fa-lastfm', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('734', 'fa-lastfm-square', 'fa fa-lastfm-square', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('735', 'fa-toggle-off', 'fa fa-toggle-off', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('736', 'fa-toggle-on', 'fa fa-toggle-on', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('737', 'fa-bicycle', 'fa fa-bicycle', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('738', 'fa-bus', 'fa fa-bus', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('739', 'fa-ioxhost', 'fa fa-ioxhost', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('740', 'fa-angellist', 'fa fa-angellist', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('741', 'fa-cc', 'fa fa-cc', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('742', 'fa-ils', 'fa fa-ils', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('743', 'fa-meanpath', 'fa fa-meanpath', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('744', 'fa-buysellads', 'fa fa-buysellads', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('745', 'fa-connectdevelop', 'fa fa-connectdevelop', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('746', 'fa-dashcube', 'fa fa-dashcube', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('747', 'fa-forumbee', 'fa fa-forumbee', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('748', 'fa-leanpub', 'fa fa-leanpub', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('749', 'fa-sellsy', 'fa fa-sellsy', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('750', 'fa-shirtsinbulk', 'fa fa-shirtsinbulk', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('751', 'fa-simplybuilt', 'fa fa-simplybuilt', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('752', 'fa-skyatlas', 'fa fa-skyatlas', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('753', 'fa-cart-plus', 'fa fa-cart-plus', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('754', 'fa-cart-arrow-down', 'fa fa-cart-arrow-down', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('755', 'fa-diamond', 'fa fa-diamond', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('756', 'fa-ship', 'fa fa-ship', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('757', 'fa-user-secret', 'fa fa-user-secret', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('758', 'fa-motorcycle', 'fa fa-motorcycle', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('759', 'fa-street-view', 'fa fa-street-view', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('760', 'fa-heartbeat', 'fa fa-heartbeat', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('761', 'fa-venus', 'fa fa-venus', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('762', 'fa-mars', 'fa fa-mars', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('763', 'fa-mercury', 'fa fa-mercury', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('764', 'fa-transgender', 'fa fa-transgender', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('765', 'fa-transgender-alt', 'fa fa-transgender-alt', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('766', 'fa-venus-double', 'fa fa-venus-double', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('767', 'fa-mars-double', 'fa fa-mars-double', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('768', 'fa-venus-mars', 'fa fa-venus-mars', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('769', 'fa-mars-stroke', 'fa fa-mars-stroke', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('770', 'fa-mars-stroke-v', 'fa fa-mars-stroke-v', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('771', 'fa-mars-stroke-h', 'fa fa-mars-stroke-h', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('772', 'fa-neuter', 'fa fa-neuter', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('773', 'fa-genderless', 'fa fa-genderless', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('774', 'fa-facebook-official', 'fa fa-facebook-official', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('775', 'fa-pinterest-p', 'fa fa-pinterest-p', 'fontAwesome', '2017-05-03 17:10:54');
INSERT INTO `sys_icon` VALUES ('776', 'fa-whatsapp', 'fa fa-whatsapp', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('777', 'fa-server', 'fa fa-server', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('778', 'fa-user-plus', 'fa fa-user-plus', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('779', 'fa-user-times', 'fa fa-user-times', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('780', 'fa-bed', 'fa fa-bed', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('781', 'fa-viacoin', 'fa fa-viacoin', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('782', 'fa-train', 'fa fa-train', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('783', 'fa-subway', 'fa fa-subway', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('784', 'fa-medium', 'fa fa-medium', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('785', 'fa-y-combinator', 'fa fa-y-combinator', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('786', 'fa-optin-monster', 'fa fa-optin-monster', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('787', 'fa-opencart', 'fa fa-opencart', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('788', 'fa-expeditedssl', 'fa fa-expeditedssl', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('789', 'fa-battery-full', 'fa fa-battery-full', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('790', 'fa-battery-three-quarters', 'fa fa-battery-three-quarters', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('791', 'fa-battery-half', 'fa fa-battery-half', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('792', 'fa-battery-quarter', 'fa fa-battery-quarter', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('793', 'fa-battery-empty', 'fa fa-battery-empty', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('794', 'fa-mouse-pointer', 'fa fa-mouse-pointer', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('795', 'fa-i-cursor', 'fa fa-i-cursor', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('796', 'fa-object-group', 'fa fa-object-group', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('797', 'fa-object-ungroup', 'fa fa-object-ungroup', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('798', 'fa-sticky-note', 'fa fa-sticky-note', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('799', 'fa-sticky-note-o', 'fa fa-sticky-note-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('800', 'fa-cc-jcb', 'fa fa-cc-jcb', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('801', 'fa-cc-diners-club', 'fa fa-cc-diners-club', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('802', 'fa-clone', 'fa fa-clone', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('803', 'fa-balance-scale', 'fa fa-balance-scale', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('804', 'fa-hourglass-o', 'fa fa-hourglass-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('805', 'fa-hourglass-start', 'fa fa-hourglass-start', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('806', 'fa-hourglass-half', 'fa fa-hourglass-half', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('807', 'fa-hourglass-end', 'fa fa-hourglass-end', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('808', 'fa-hourglass', 'fa fa-hourglass', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('809', 'fa-hand-rock-o', 'fa fa-hand-rock-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('810', 'fa-hand-paper-o', 'fa fa-hand-paper-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('811', 'fa-hand-scissors-o', 'fa fa-hand-scissors-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('812', 'fa-hand-lizard-o', 'fa fa-hand-lizard-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('813', 'fa-hand-spock-o', 'fa fa-hand-spock-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('814', 'fa-hand-pointer-o', 'fa fa-hand-pointer-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('815', 'fa-hand-peace-o', 'fa fa-hand-peace-o', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('816', 'fa-trademark', 'fa fa-trademark', 'fontAwesome', '2017-05-03 17:10:55');
INSERT INTO `sys_icon` VALUES ('817', 'fa-registered', 'fa fa-registered', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('818', 'fa-creative-commons', 'fa fa-creative-commons', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('819', 'fa-gg', 'fa fa-gg', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('820', 'fa-gg-circle', 'fa fa-gg-circle', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('821', 'fa-tripadvisor', 'fa fa-tripadvisor', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('822', 'fa-odnoklassniki', 'fa fa-odnoklassniki', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('823', 'fa-odnoklassniki-square', 'fa fa-odnoklassniki-square', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('824', 'fa-get-pocket', 'fa fa-get-pocket', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('825', 'fa-wikipedia-w', 'fa fa-wikipedia-w', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('826', 'fa-safari', 'fa fa-safari', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('827', 'fa-chrome', 'fa fa-chrome', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('828', 'fa-firefox', 'fa fa-firefox', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('829', 'fa-opera', 'fa fa-opera', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('830', 'fa-internet-explorer', 'fa fa-internet-explorer', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('831', 'fa-television', 'fa fa-television', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('832', 'fa-contao', 'fa fa-contao', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('833', 'fa-500px', 'fa fa-500px', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('834', 'fa-amazon', 'fa fa-amazon', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('835', 'fa-calendar-plus-o', 'fa fa-calendar-plus-o', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('836', 'fa-calendar-minus-o', 'fa fa-calendar-minus-o', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('837', 'fa-calendar-times-o', 'fa fa-calendar-times-o', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('838', 'fa-calendar-check-o', 'fa fa-calendar-check-o', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('839', 'fa-industry', 'fa fa-industry', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('840', 'fa-map-pin', 'fa fa-map-pin', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('841', 'fa-map-signs', 'fa fa-map-signs', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('842', 'fa-map-o', 'fa fa-map-o', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('843', 'fa-map', 'fa fa-map', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('844', 'fa-commenting', 'fa fa-commenting', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('845', 'fa-commenting-o', 'fa fa-commenting-o', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('846', 'fa-houzz', 'fa fa-houzz', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('847', 'fa-vimeo', 'fa fa-vimeo', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('848', 'fa-black-tie', 'fa fa-black-tie', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('849', 'fa-fonticons', 'fa fa-fonticons', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('850', 'fa-reddit-alien', 'fa fa-reddit-alien', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('851', 'fa-edge', 'fa fa-edge', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('852', 'fa-credit-card-alt', 'fa fa-credit-card-alt', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('853', 'fa-codiepie', 'fa fa-codiepie', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('854', 'fa-modx', 'fa fa-modx', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('855', 'fa-fort-awesome', 'fa fa-fort-awesome', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('856', 'fa-usb', 'fa fa-usb', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('857', 'fa-product-hunt', 'fa fa-product-hunt', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('858', 'fa-mixcloud', 'fa fa-mixcloud', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('859', 'fa-scribd', 'fa fa-scribd', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('860', 'fa-pause-circle', 'fa fa-pause-circle', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('861', 'fa-pause-circle-o', 'fa fa-pause-circle-o', 'fontAwesome', '2017-05-03 17:10:56');
INSERT INTO `sys_icon` VALUES ('862', 'fa-stop-circle', 'fa fa-stop-circle', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('863', 'fa-stop-circle-o', 'fa fa-stop-circle-o', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('864', 'fa-shopping-bag', 'fa fa-shopping-bag', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('865', 'fa-shopping-basket', 'fa fa-shopping-basket', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('866', 'fa-hashtag', 'fa fa-hashtag', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('867', 'fa-bluetooth', 'fa fa-bluetooth', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('868', 'fa-bluetooth-b', 'fa fa-bluetooth-b', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('869', 'fa-percent', 'fa fa-percent', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('870', 'fa-gitlab', 'fa fa-gitlab', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('871', 'fa-wpbeginner', 'fa fa-wpbeginner', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('872', 'fa-wpforms', 'fa fa-wpforms', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('873', 'fa-envira', 'fa fa-envira', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('874', 'fa-universal-access', 'fa fa-universal-access', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('875', 'fa-wheelchair-alt', 'fa fa-wheelchair-alt', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('876', 'fa-question-circle-o', 'fa fa-question-circle-o', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('877', 'fa-blind', 'fa fa-blind', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('878', 'fa-audio-description', 'fa fa-audio-description', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('879', 'fa-volume-control-phone', 'fa fa-volume-control-phone', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('880', 'fa-braille', 'fa fa-braille', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('881', 'fa-assistive-listening-systems', 'fa fa-assistive-listening-systems', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('882', 'fa-american-sign-language-interpreting', 'fa fa-american-sign-language-interpreting', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('883', 'fa-deaf', 'fa fa-deaf', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('884', 'fa-glide', 'fa fa-glide', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('885', 'fa-glide-g', 'fa fa-glide-g', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('886', 'fa-sign-language', 'fa fa-sign-language', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('887', 'fa-low-vision', 'fa fa-low-vision', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('888', 'fa-viadeo', 'fa fa-viadeo', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('889', 'fa-viadeo-square', 'fa fa-viadeo-square', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('890', 'fa-snapchat', 'fa fa-snapchat', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('891', 'fa-snapchat-ghost', 'fa fa-snapchat-ghost', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('892', 'fa-snapchat-square', 'fa fa-snapchat-square', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('893', 'fa-pied-piper', 'fa fa-pied-piper', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('894', 'fa-first-order', 'fa fa-first-order', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('895', 'fa-yoast', 'fa fa-yoast', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('896', 'fa-themeisle', 'fa fa-themeisle', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('897', 'fa-google-plus-official', 'fa fa-google-plus-official', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('898', 'fa-font-awesome', 'fa fa-font-awesome', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('899', 'fa-handshake-o', 'fa fa-handshake-o', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('900', 'fa-envelope-open', 'fa fa-envelope-open', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('901', 'fa-envelope-open-o', 'fa fa-envelope-open-o', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('902', 'fa-linode', 'fa fa-linode', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('903', 'fa-address-book', 'fa fa-address-book', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('904', 'fa-address-book-o', 'fa fa-address-book-o', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('905', 'fa-address-card', 'fa fa-address-card', 'fontAwesome', '2017-05-03 17:10:57');
INSERT INTO `sys_icon` VALUES ('906', 'fa-address-card-o', 'fa fa-address-card-o', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('907', 'fa-user-circle', 'fa fa-user-circle', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('908', 'fa-user-circle-o', 'fa fa-user-circle-o', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('909', 'fa-user-o', 'fa fa-user-o', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('910', 'fa-id-badge', 'fa fa-id-badge', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('911', 'fa-id-card', 'fa fa-id-card', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('912', 'fa-id-card-o', 'fa fa-id-card-o', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('913', 'fa-quora', 'fa fa-quora', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('914', 'fa-free-code-camp', 'fa fa-free-code-camp', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('915', 'fa-telegram', 'fa fa-telegram', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('916', 'fa-thermometer-full', 'fa fa-thermometer-full', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('917', 'fa-thermometer-three-quarters', 'fa fa-thermometer-three-quarters', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('918', 'fa-thermometer-half', 'fa fa-thermometer-half', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('919', 'fa-thermometer-quarter', 'fa fa-thermometer-quarter', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('920', 'fa-thermometer-empty', 'fa fa-thermometer-empty', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('921', 'fa-shower', 'fa fa-shower', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('922', 'fa-bath', 'fa fa-bath', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('923', 'fa-podcast', 'fa fa-podcast', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('924', 'fa-window-maximize', 'fa fa-window-maximize', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('925', 'fa-window-minimize', 'fa fa-window-minimize', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('926', 'fa-window-restore', 'fa fa-window-restore', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('927', 'fa-window-close', 'fa fa-window-close', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('928', 'fa-window-close-o', 'fa fa-window-close-o', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('929', 'fa-bandcamp', 'fa fa-bandcamp', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('930', 'fa-grav', 'fa fa-grav', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('931', 'fa-etsy', 'fa fa-etsy', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('932', 'fa-imdb', 'fa fa-imdb', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('933', 'fa-ravelry', 'fa fa-ravelry', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('934', 'fa-eercast', 'fa fa-eercast', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('935', 'fa-microchip', 'fa fa-microchip', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('936', 'fa-snowflake-o', 'fa fa-snowflake-o', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('937', 'fa-superpowers', 'fa fa-superpowers', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('938', 'fa-wpexplorer', 'fa fa-wpexplorer', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('939', 'fa-meetup', 'fa fa-meetup', 'fontAwesome', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('940', 'icon-user', 'icon-user', 'simpleLine', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('941', 'icon-people', 'icon-people', 'simpleLine', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('942', 'icon-user-female', 'icon-user-female', 'simpleLine', '2017-05-03 17:10:58');
INSERT INTO `sys_icon` VALUES ('943', 'icon-user-follow', 'icon-user-follow', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('944', 'icon-user-following', 'icon-user-following', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('945', 'icon-user-unfollow', 'icon-user-unfollow', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('946', 'icon-login', 'icon-login', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('947', 'icon-logout', 'icon-logout', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('948', 'icon-emotsmile', 'icon-emotsmile', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('949', 'icon-phone', 'icon-phone', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('950', 'icon-call-end', 'icon-call-end', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('951', 'icon-call-in', 'icon-call-in', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('952', 'icon-call-out', 'icon-call-out', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('953', 'icon-map', 'icon-map', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('954', 'icon-location-pin', 'icon-location-pin', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('955', 'icon-direction', 'icon-direction', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('956', 'icon-directions', 'icon-directions', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('957', 'icon-compass', 'icon-compass', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('958', 'icon-layers', 'icon-layers', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('959', 'icon-menu', 'icon-menu', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('960', 'icon-list', 'icon-list', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('961', 'icon-options-vertical', 'icon-options-vertical', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('962', 'icon-options', 'icon-options', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('963', 'icon-arrow-down', 'icon-arrow-down', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('964', 'icon-arrow-left', 'icon-arrow-left', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('965', 'icon-arrow-right', 'icon-arrow-right', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('966', 'icon-arrow-up', 'icon-arrow-up', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('967', 'icon-arrow-up-circle', 'icon-arrow-up-circle', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('968', 'icon-arrow-left-circle', 'icon-arrow-left-circle', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('969', 'icon-arrow-right-circle', 'icon-arrow-right-circle', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('970', 'icon-arrow-down-circle', 'icon-arrow-down-circle', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('971', 'icon-check', 'icon-check', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('972', 'icon-clock', 'icon-clock', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('973', 'icon-plus', 'icon-plus', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('974', 'icon-minus', 'icon-minus', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('975', 'icon-close', 'icon-close', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('976', 'icon-event', 'icon-event', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('977', 'icon-exclamation', 'icon-exclamation', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('978', 'icon-organization', 'icon-organization', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('979', 'icon-trophy', 'icon-trophy', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('980', 'icon-screen-smartphone', 'icon-screen-smartphone', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('981', 'icon-screen-desktop', 'icon-screen-desktop', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('982', 'icon-plane', 'icon-plane', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('983', 'icon-notebook', 'icon-notebook', 'simpleLine', '2017-05-03 17:10:59');
INSERT INTO `sys_icon` VALUES ('984', 'icon-mustache', 'icon-mustache', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('985', 'icon-mouse', 'icon-mouse', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('986', 'icon-magnet', 'icon-magnet', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('987', 'icon-energy', 'icon-energy', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('988', 'icon-disc', 'icon-disc', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('989', 'icon-cursor', 'icon-cursor', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('990', 'icon-cursor-move', 'icon-cursor-move', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('991', 'icon-crop', 'icon-crop', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('992', 'icon-chemistry', 'icon-chemistry', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('993', 'icon-speedometer', 'icon-speedometer', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('994', 'icon-shield', 'icon-shield', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('995', 'icon-screen-tablet', 'icon-screen-tablet', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('996', 'icon-magic-wand', 'icon-magic-wand', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('997', 'icon-hourglass', 'icon-hourglass', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('998', 'icon-graduation', 'icon-graduation', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('999', 'icon-ghost', 'icon-ghost', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1000', 'icon-game-controller', 'icon-game-controller', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1001', 'icon-fire', 'icon-fire', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1002', 'icon-eyeglass', 'icon-eyeglass', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1003', 'icon-envelope-open', 'icon-envelope-open', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1004', 'icon-envelope-letter', 'icon-envelope-letter', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1005', 'icon-bell', 'icon-bell', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1006', 'icon-badge', 'icon-badge', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1007', 'icon-anchor', 'icon-anchor', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1008', 'icon-wallet', 'icon-wallet', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1009', 'icon-vector', 'icon-vector', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1010', 'icon-speech', 'icon-speech', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1011', 'icon-puzzle', 'icon-puzzle', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1012', 'icon-printer', 'icon-printer', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1013', 'icon-present', 'icon-present', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1014', 'icon-playlist', 'icon-playlist', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1015', 'icon-pin', 'icon-pin', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1016', 'icon-picture', 'icon-picture', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1017', 'icon-handbag', 'icon-handbag', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1018', 'icon-globe-alt', 'icon-globe-alt', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1019', 'icon-globe', 'icon-globe', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1020', 'icon-folder-alt', 'icon-folder-alt', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1021', 'icon-folder', 'icon-folder', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1022', 'icon-film', 'icon-film', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1023', 'icon-feed', 'icon-feed', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1024', 'icon-drop', 'icon-drop', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1025', 'icon-drawer', 'icon-drawer', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1026', 'icon-docs', 'icon-docs', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1027', 'icon-doc', 'icon-doc', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1028', 'icon-diamond', 'icon-diamond', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1029', 'icon-cup', 'icon-cup', 'simpleLine', '2017-05-03 17:11:00');
INSERT INTO `sys_icon` VALUES ('1030', 'icon-calculator', 'icon-calculator', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1031', 'icon-bubbles', 'icon-bubbles', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1032', 'icon-briefcase', 'icon-briefcase', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1033', 'icon-book-open', 'icon-book-open', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1034', 'icon-basket-loaded', 'icon-basket-loaded', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1035', 'icon-basket', 'icon-basket', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1036', 'icon-bag', 'icon-bag', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1037', 'icon-action-undo', 'icon-action-undo', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1038', 'icon-action-redo', 'icon-action-redo', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1039', 'icon-wrench', 'icon-wrench', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1040', 'icon-umbrella', 'icon-umbrella', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1041', 'icon-trash', 'icon-trash', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1042', 'icon-tag', 'icon-tag', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1043', 'icon-support', 'icon-support', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1044', 'icon-frame', 'icon-frame', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1045', 'icon-size-fullscreen', 'icon-size-fullscreen', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1046', 'icon-size-actual', 'icon-size-actual', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1047', 'icon-shuffle', 'icon-shuffle', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1048', 'icon-share-alt', 'icon-share-alt', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1049', 'icon-share', 'icon-share', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1050', 'icon-rocket', 'icon-rocket', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1051', 'icon-question', 'icon-question', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1052', 'icon-pie-chart', 'icon-pie-chart', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1053', 'icon-pencil', 'icon-pencil', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1054', 'icon-note', 'icon-note', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1055', 'icon-loop', 'icon-loop', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1056', 'icon-home', 'icon-home', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1057', 'icon-grid', 'icon-grid', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1058', 'icon-graph', 'icon-graph', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1059', 'icon-microphone', 'icon-microphone', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1060', 'icon-music-tone-alt', 'icon-music-tone-alt', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1061', 'icon-music-tone', 'icon-music-tone', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1062', 'icon-earphones-alt', 'icon-earphones-alt', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1063', 'icon-earphones', 'icon-earphones', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1064', 'icon-equalizer', 'icon-equalizer', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1065', 'icon-like', 'icon-like', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1066', 'icon-dislike', 'icon-dislike', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1067', 'icon-control-start', 'icon-control-start', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1068', 'icon-control-rewind', 'icon-control-rewind', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1069', 'icon-control-play', 'icon-control-play', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1070', 'icon-control-pause', 'icon-control-pause', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1071', 'icon-control-forward', 'icon-control-forward', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1072', 'icon-control-end', 'icon-control-end', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1073', 'icon-volume-1', 'icon-volume-1', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1074', 'icon-volume-2', 'icon-volume-2', 'simpleLine', '2017-05-03 17:11:01');
INSERT INTO `sys_icon` VALUES ('1075', 'icon-volume-off', 'icon-volume-off', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1076', 'icon-calendar', 'icon-calendar', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1077', 'icon-bulb', 'icon-bulb', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1078', 'icon-chart', 'icon-chart', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1079', 'icon-ban', 'icon-ban', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1080', 'icon-bubble', 'icon-bubble', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1081', 'icon-camrecorder', 'icon-camrecorder', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1082', 'icon-camera', 'icon-camera', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1083', 'icon-cloud-download', 'icon-cloud-download', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1084', 'icon-cloud-upload', 'icon-cloud-upload', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1085', 'icon-envelope', 'icon-envelope', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1086', 'icon-eye', 'icon-eye', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1087', 'icon-flag', 'icon-flag', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1088', 'icon-heart', 'icon-heart', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1089', 'icon-info', 'icon-info', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1090', 'icon-key', 'icon-key', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1091', 'icon-link', 'icon-link', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1092', 'icon-lock', 'icon-lock', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1093', 'icon-lock-open', 'icon-lock-open', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1094', 'icon-magnifier', 'icon-magnifier', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1095', 'icon-magnifier-add', 'icon-magnifier-add', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1096', 'icon-magnifier-remove', 'icon-magnifier-remove', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1097', 'icon-paper-clip', 'icon-paper-clip', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1098', 'icon-paper-plane', 'icon-paper-plane', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1099', 'icon-power', 'icon-power', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1100', 'icon-refresh', 'icon-refresh', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1101', 'icon-reload', 'icon-reload', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1102', 'icon-settings', 'icon-settings', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1103', 'icon-star', 'icon-star', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1104', 'icon-symbol-female', 'icon-symbol-female', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1105', 'icon-symbol-male', 'icon-symbol-male', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1106', 'icon-target', 'icon-target', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1107', 'icon-credit-card', 'icon-credit-card', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1108', 'icon-paypal', 'icon-paypal', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1109', 'icon-social-tumblr', 'icon-social-tumblr', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1110', 'icon-social-twitter', 'icon-social-twitter', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1111', 'icon-social-facebook', 'icon-social-facebook', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1112', 'icon-social-instagram', 'icon-social-instagram', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1113', 'icon-social-linkedin', 'icon-social-linkedin', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1114', 'icon-social-pinterest', 'icon-social-pinterest', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1115', 'icon-social-github', 'icon-social-github', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1116', 'icon-social-google', 'icon-social-google', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1117', 'icon-social-reddit', 'icon-social-reddit', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1118', 'icon-social-skype', 'icon-social-skype', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1119', 'icon-social-dribbble', 'icon-social-dribbble', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1120', 'icon-social-behance', 'icon-social-behance', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1121', 'icon-social-foursqare', 'icon-social-foursqare', 'simpleLine', '2017-05-03 17:11:02');
INSERT INTO `sys_icon` VALUES ('1122', 'icon-social-soundcloud', 'icon-social-soundcloud', 'simpleLine', '2017-05-03 17:11:03');
INSERT INTO `sys_icon` VALUES ('1123', 'icon-social-spotify', 'icon-social-spotify', 'simpleLine', '2017-05-03 17:11:03');
INSERT INTO `sys_icon` VALUES ('1124', 'icon-social-stumbleupon', 'icon-social-stumbleupon', 'simpleLine', '2017-05-03 17:11:03');
INSERT INTO `sys_icon` VALUES ('1125', 'icon-social-youtube', 'icon-social-youtube', 'simpleLine', '2017-05-03 17:11:03');
INSERT INTO `sys_icon` VALUES ('1126', 'icon-social-dropbox', 'icon-social-dropbox', 'simpleLine', '2017-05-03 17:11:03');
INSERT INTO `sys_icon` VALUES ('1127', 'icon-social-vkontakte', 'icon-social-vkontakte', 'simpleLine', '2017-05-03 17:11:03');
INSERT INTO `sys_icon` VALUES ('1128', 'icon-social-steam', 'icon-social-steam', 'simpleLine', '2017-05-03 17:11:03');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userCode` int(11) NOT NULL COMMENT '登录人',
  `ipAddress` varchar(20) NOT NULL COMMENT '登录的IP地址',
  `loginStatus` tinyint(2) NOT NULL DEFAULT '1' COMMENT '登录是否成功',
  `browser` varchar(255) DEFAULT NULL COMMENT '登录浏览器',
  `logLeavel` int(11) DEFAULT NULL COMMENT '日志级别',
  `opType` int(11) DEFAULT NULL COMMENT '日志类型',
  `logContent` text COMMENT '日志内容',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录产生时间',
  PRIMARY KEY (`id`),
  KEY `sys_log_login_ibfk_1` (`userCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录历史日志表';

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operate`;
CREATE TABLE `sys_log_operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号(主键)',
  `userCode` int(11) NOT NULL COMMENT '操作人的信息',
  `macAddress` varchar(100) DEFAULT NULL COMMENT 'Mac地址',
  `opType` int(11) NOT NULL COMMENT '日志描述类型(操作代码)',
  `broswer` varchar(128) DEFAULT NULL COMMENT '浏览器',
  `tableName` varchar(100) DEFAULT NULL COMMENT '日志操作表',
  `content` varchar(200) DEFAULT NULL COMMENT '操作日日志内容操作了什么内容，越具体越好（修改前、修改后）',
  `remark` text COMMENT '备注信息，一些其他的需要说明的信息',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '日志记录创建时间',
  PRIMARY KEY (`id`),
  KEY `sys_log_operate_ibfk_1` (`userCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of sys_log_operate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(100) NOT NULL COMMENT '菜单名称',
  `menuUrl` varchar(255) DEFAULT NULL COMMENT '菜单链接地址',
  `parentCode` int(11) NOT NULL COMMENT '父菜单编号',
  `isVisible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可见(启用/禁用),不为空',
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效;-1:删除;0:不可用,默认值;1:可用',
  `allowEdit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许编辑;1:允许,默认值;0:不允许',
  `allowDelete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许删除;1:允许删除,默认值,0:不允许删除',
  `iconClass` varchar(255) DEFAULT NULL COMMENT '菜单图标样式',
  `sequence` int(11) DEFAULT '1' COMMENT '排序',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modifier` int(11) DEFAULT NULL COMMENT '最后修改人',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述说明',
  PRIMARY KEY (`id`),
  KEY `parentCode` (`parentCode`),
  KEY `isEnabled` (`isEnabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理员菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_proxy_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_proxy_info`;
CREATE TABLE `sys_proxy_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(128) DEFAULT NULL COMMENT '地址',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否可用',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='代理IP网站';

-- ----------------------------
-- Records of sys_proxy_info
-- ----------------------------
INSERT INTO `sys_proxy_info` VALUES ('1', 'http://cn-proxy.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('2', 'http://www.xici.net.co/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('3', 'http://www.kuaidaili.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('4', 'http://www.3464.com/data/Proxy/http/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('5', 'http://www.site-digger.com/html/articles/20110516/proxieslist.html', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('6', 'http://www.cz88.net/proxy/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('7', 'http://www.youdaili.net/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('8', 'http://ip.qiaodm.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('9', 'http://www.cn379.cn/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('10', 'http://www.66ip.cn/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('11', 'http://www.haodailiip.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('12', 'http://ip.izmoney.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('13', 'http://proxy.goubanjia.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('14', 'http://www.nianshao.me/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('15', 'http://www.proxy.com.ru/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('16', 'http://pachong.org/anonymous.html', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('17', 'http://www.56ads.com/proxyip/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('18', 'http://ip.baizhongsou.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('19', 'http://www.cool-proxy.net/proxies/http_proxy_list/sort:score/direction:desc', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('20', 'http://proxylist.hidemyass.com/2#listable', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('21', 'http://www.sslproxies.org/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('22', 'http://www.proxy4free.com/list/webproxy1.html', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('23', 'https://incloak.com/proxy-list/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('24', 'https://nordvpn.com/free-proxy-list/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('25', 'http://proxy-list.org/english/index.php', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('26', 'http://www.samair.ru/proxy/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('27', 'http://www.socks-proxy.net/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('28', 'http://free-proxy-list.net/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('29', 'http://www.xroxy.com/proxylist.htm', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('30', 'http://www.mrhinkydink.com/proxies.htm', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('31', 'http://free-proxy.cz/en/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('32', 'http://www.ip181.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('33', 'http://www.xicidaili.com/', '1', null);
INSERT INTO `sys_proxy_info` VALUES ('34', 'http://www.mayidaili.com/', '1', '蚂蚁代理');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleCode` varchar(50) NOT NULL COMMENT '角色编号',
  `roleName` varchar(200) NOT NULL COMMENT '角色名称',
  `categoryCode` varchar(50) NOT NULL COMMENT '角色分类',
  `isVisible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可见;1:可见,默认值;0:不可见',
  `isEnabled` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否有效:默认0无效；',
  `allowEdit` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否允许编辑(1:允许，默认值;0:不允许)',
  `allowDelete` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否允许删除(1:允许，默认值;0:不允许)',
  `sequence` int(11) DEFAULT '0' COMMENT '排序码',
  `creater` int(11) NOT NULL,
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modifier` varchar(255) DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleCode` (`roleCode`,`isEnabled`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'administrators', '超级管理员', '1', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:20', '1', '2017-04-13 11:50:20', null);
INSERT INTO `sys_role` VALUES ('2', 'system', '系统管理员', '1', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:20', '1', '2017-04-13 11:50:20', null);
INSERT INTO `sys_role` VALUES ('3', 'configuration', '统配置员', '1', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:20', '1', '2017-04-13 11:50:20', null);
INSERT INTO `sys_role` VALUES ('4', 'developer', '系统开发人员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('5', 'innerStaff', '内部员工', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('6', 'archvist', '档案管理员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('7', 'guest', '访客人员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('8', 'tester', '测试人员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('9', 'services', '客服人员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('10', 'implement', '实施人员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('11', 'IPQC', '环保巡检员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('12', 'businessPersonnel', '业务人员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('13', 'inventory', '库存管理员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('14', 'contracts', '合同专员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);
INSERT INTO `sys_role` VALUES ('15', 'consumer', '客户维护员', '2', '0', '1', '1', '1', '0', '1', '2017-04-13 11:50:25', '1', '2017-04-13 11:50:25', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色编号',
  `menuId` int(11) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleID` (`roleId`,`menuId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_org`;
CREATE TABLE `sys_role_org` (
  `id` int(11) NOT NULL COMMENT '编号',
  `role` int(11) NOT NULL COMMENT '角色编号',
  `org_id` int(11) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_org
-- ----------------------------

-- ----------------------------
-- Table structure for sys_sysconfig
-- ----------------------------
DROP TABLE IF EXISTS `sys_sysconfig`;
CREATE TABLE `sys_sysconfig` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of sys_sysconfig
-- ----------------------------
INSERT INTO `sys_sysconfig` VALUES ('copyright', 'Copyright © 2016-2017 | 版权所有：独泪了无痕');
INSERT INTO `sys_sysconfig` VALUES ('desc', '地址：北京市海淀区知春路1号学院国际大厦   技术支持：XXXX');
INSERT INTO `sys_sysconfig` VALUES ('icp', 'ICP证：粤ICP备**********号');
INSERT INTO `sys_sysconfig` VALUES ('lang', 'zh-cn');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL COMMENT '登录名，用户名',
  `password` varchar(128) NOT NULL COMMENT '密码(真正的密码与用户名MD5加密)',
  `userType` int(11) DEFAULT NULL COMMENT '用户类型(字典表)',
  `realName` varchar(50) DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `emailstatus` tinyint(1) DEFAULT '0' COMMENT 'email是否经过验证',
  `userSex` tinyint(2) DEFAULT NULL COMMENT '性别',
  `mobile` varchar(50) DEFAULT NULL COMMENT '用户手机号码',
  `telephone` varchar(50) DEFAULT NULL COMMENT '用户电话号码',
  `signature` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `isLocked` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否锁定(1:不锁定;0：锁定)',
  `isVisible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否有效(是否审核);1:可见;0:不可见,默认值',
  `loginFlag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否允许登陆;1:允许,默认值;0:不允许',
  `isEnabled` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否有效;-1:删除;0:不可用,默认值;1:可用',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `create` int(11) DEFAULT NULL COMMENT '最初创建者',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modifier` int(11) DEFAULT NULL COMMENT '最后修改人',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `prevVisit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次登录时间',
  `lastVisit` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后登陆时间',
  `loginIP` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户权限管理系统：系统管理员用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '7d733c1c53ab1729', '1', '独泪了无痕', 'duleilewuhen@sina.com', '0', null, null, null, null, '1', '1', '1', '1', null, null, '2017-10-19 16:20:29', null, '2017-10-19 18:16:18', '2017-10-19 18:15:39', '2017-10-19 18:15:47', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户主键',
  `roleId` int(11) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `RoleInfo` (`userId`,`roleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户权限管理系统：用户-角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for sys_version
-- ----------------------------
DROP TABLE IF EXISTS `sys_version`;
CREATE TABLE `sys_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(50) DEFAULT NULL COMMENT '版本名称',
  `versionCode` varchar(30) DEFAULT NULL COMMENT '版本编码',
  `loginPage` varchar(255) DEFAULT NULL COMMENT '登陆入口页面',
  `versionnum` varchar(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本';

-- ----------------------------
-- Records of sys_version
-- ----------------------------

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '登录名，用户名',
  `userPassword` varchar(100) NOT NULL COMMENT '用户密码',
  `userpic` varchar(50) DEFAULT NULL COMMENT '头像',
  `realname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(50) DEFAULT NULL COMMENT '呢称',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `userSex` tinyint(2) DEFAULT NULL COMMENT '性别',
  `userFrom` varchar(50) NOT NULL COMMENT '用户来源',
  `firstVisit` datetime NOT NULL COMMENT '第一次访问时间(注册时间)',
  `previousVisit` datetime NOT NULL COMMENT '上一次访问时间',
  `lastVisit` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后访问时间',
  `logOnCount` int(11) DEFAULT NULL COMMENT '登录次数',
  `passwordErrorCount` int(11) DEFAULT NULL COMMENT '密码连续错误次数',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `homeAddress` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `auditStatus` tinyint(2) DEFAULT NULL COMMENT '审核状态(1为已审核，0为未审核)',
  `isLocked` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否锁定(1:false:0:true)',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `isEnabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户系统：用户表';

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
