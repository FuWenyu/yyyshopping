/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : easyshoping

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-02-21 21:34:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xx_ad
-- ----------------------------
DROP TABLE IF EXISTS `xx_ad`;
CREATE TABLE `xx_ad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `content` longtext,
  `end_date` datetime DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ad_position` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6D301C2E947C2F5` (`ad_position`),
  CONSTRAINT `FK6D301C2E947C2F5` FOREIGN KEY (`ad_position`) REFERENCES `xx_ad_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_ad
-- ----------------------------
INSERT INTO `xx_ad` VALUES ('2', '2014-05-15 01:00:16', '2014-07-08 13:32:12', '2', null, null, null, 'http://localhost:8080/easy-shopping/upload/image/201407/0c4db854-c655-4a21-bcc6-84f84119dc10.jpg', '我们的优势', '1', null, '2');
INSERT INTO `xx_ad` VALUES ('3', '2014-05-15 01:00:17', '2015-03-16 21:47:10', '3', null, null, null, 'http://localhost:8080/easy-shopping/upload/image/201407/f192a7b8-5b73-4c44-b0bc-ac631465db2d.jpg', '享受这一刻的舒适', '1', 'http://www.baidu.com', '3');
INSERT INTO `xx_ad` VALUES ('4', '2014-05-15 01:00:18', '2015-03-16 21:47:19', '4', null, null, null, 'http://localhost:8080/easy-shopping/upload/image/201407/8e2cbc50-37f2-43ad-9963-6366bbf82165.jpg', '浪漫时尚季', '1', 'http://www.baidu.com', '3');
INSERT INTO `xx_ad` VALUES ('5', '2014-05-15 01:00:19', '2015-03-16 21:47:23', '5', null, null, null, 'http://localhost:8080/easy-shopping/upload/image/201407/93720fc6-62c9-436b-9e9a-aa2fa55a3ebb.jpg', '伊见清新', '1', 'http://www.baidu.com', '3');
INSERT INTO `xx_ad` VALUES ('7', '2014-05-15 01:00:21', '2014-07-08 18:07:52', '7', null, null, null, 'http://localhost:8080/easy-shopping/upload/image/201407/63997f5e-9baf-495f-b032-a3ea64c44404.jpg', '特卖会专场', '1', null, '5');
INSERT INTO `xx_ad` VALUES ('8', '2014-05-15 01:00:22', '2015-03-10 22:29:34', '8', null, null, null, 'http://localhost:8080/easy-shopping/upload/image/201407/690592e3-7f58-467a-b177-72c0d33365a8.jpg', '热门商品', '1', 'http://localhost:8080/easy-shopping/product/content/201407/1131.html', '6');
INSERT INTO `xx_ad` VALUES ('9', '2014-05-15 01:00:23', '2015-03-10 22:29:47', '9', null, null, null, 'http://localhost:8080/easy-shopping/upload/image/201407/a20797aa-87b7-42f6-81ff-5156fac2ac7f.jpg', '最新商品', '1', 'http://localhost:8080/easy-shopping/product/content/201407/1041.html', '7');
INSERT INTO `xx_ad` VALUES ('10', '2014-05-15 01:00:24', '2014-05-15 01:00:24', '10', null, '<dl>\r\n	<dt>\r\n		注册即享受\r\n	</dt>\r\n	<dd>\r\n		正品保障、正规发票\r\n	</dd>\r\n	<dd>\r\n		货到付款、会员服务\r\n	</dd>\r\n	<dd>\r\n		自由退换、售后上门\r\n	</dd>\r\n</dl>', null, null, '会员注册', '0', null, '8');
INSERT INTO `xx_ad` VALUES ('11', '2014-05-15 01:00:25', '2015-03-16 21:42:01', '11', null, null, null, 'http://127.0.0.1:8080/easy-shopping/upload/image/ad_login.jpg', '会员登录', '1', null, '9');

-- ----------------------------
-- Table structure for xx_admin
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin`;
CREATE TABLE `xx_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin
-- ----------------------------
INSERT INTO `xx_admin` VALUES ('1', '2014-05-15 00:03:36', '2017-02-21 20:51:36', '技术部', 'admin@test.net', '', '\0', null, '2017-02-21 20:51:36', '0', null, '管理员', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- ----------------------------
-- Table structure for xx_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `xx_admin_role`;
CREATE TABLE `xx_admin_role` (
  `admins` bigint(20) NOT NULL,
  `roles` bigint(20) NOT NULL,
  PRIMARY KEY (`admins`,`roles`),
  KEY `FKD291D6053FF548F7` (`roles`),
  KEY `FKD291D605A022690F` (`admins`),
  CONSTRAINT `FKD291D6053FF548F7` FOREIGN KEY (`roles`) REFERENCES `xx_role` (`id`),
  CONSTRAINT `FKD291D605A022690F` FOREIGN KEY (`admins`) REFERENCES `xx_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_admin_role
-- ----------------------------
INSERT INTO `xx_admin_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for xx_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `xx_ad_position`;
CREATE TABLE `xx_ad_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_ad_position
-- ----------------------------
INSERT INTO `xx_ad_position` VALUES ('1', '2014-05-15 01:00:06', '2014-05-15 01:00:06', null, '50', '头部广告', '<div class=\"headerAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '320');
INSERT INTO `xx_ad_position` VALUES ('2', '2014-05-15 01:00:07', '2014-05-15 01:00:07', null, '52', '底部广告', '<div class=\"footerAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '950');
INSERT INTO `xx_ad_position` VALUES ('3', '2014-05-15 01:00:08', '2014-05-15 01:00:08', null, '290', '首页轮播广告', '<div id=\"slider\" class=\"slider\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '770');
INSERT INTO `xx_ad_position` VALUES ('4', '2014-05-15 01:00:09', '2014-05-15 01:00:09', null, '106', '首页右侧广告', '<div class=\"rightAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '230');
INSERT INTO `xx_ad_position` VALUES ('5', '2014-05-15 01:00:10', '2015-03-10 21:30:41', null, '173', '首页中部广告', '<div class=\"middleAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '1000');
INSERT INTO `xx_ad_position` VALUES ('6', '2014-05-15 01:00:11', '2014-05-15 01:00:11', null, '343', '首页热门商品左则广告', '[#list adPosition.ads as ad]\r\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n		[#if ad.url??]\r\n			<a href=\"${ad.url}\">\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			</a>\r\n		[#else]\r\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n		[/#if]\r\n	[/#if]\r\n[/#list]', '260');
INSERT INTO `xx_ad_position` VALUES ('7', '2014-05-15 01:00:12', '2014-05-15 01:00:12', null, '343', '首页最新商品左则广告', '[#list adPosition.ads as ad]\r\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n		[#if ad.url??]\r\n			<a href=\"${ad.url}\">\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			</a>\r\n		[#else]\r\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n		[/#if]\r\n	[/#if]\r\n[/#list]', '260');
INSERT INTO `xx_ad_position` VALUES ('8', '2014-05-15 01:00:13', '2014-05-15 01:00:13', null, '300', '会员注册右侧广告', '<div class=\"ad\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"text\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					${ad.content}\r\n				</a>\r\n			[#else]\r\n				${ad.content}\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '240');
INSERT INTO `xx_ad_position` VALUES ('9', '2014-05-15 01:00:14', '2014-05-15 01:00:14', null, '330', '会员登录左侧广告', '<div class=\"ad\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', '500');

-- ----------------------------
-- Table structure for xx_area
-- ----------------------------
DROP TABLE IF EXISTS `xx_area`;
CREATE TABLE `xx_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `full_name` longtext NOT NULL,
  `name` varchar(100) NOT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9E19DA6CFE1E12FB` (`parent`),
  CONSTRAINT `FK9E19DA6CFE1E12FB` FOREIGN KEY (`parent`) REFERENCES `xx_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_area
-- ----------------------------
INSERT INTO `xx_area` VALUES ('1', '2014-05-15 00:03:51', '2014-05-15 00:03:51', null, '北京市', '北京市', ',', null);
INSERT INTO `xx_area` VALUES ('2', '2014-05-15 00:03:52', '2014-05-15 00:03:52', null, '北京市东城区', '东城区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('3', '2014-05-15 00:03:53', '2014-05-15 00:03:53', null, '北京市西城区', '西城区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('4', '2014-05-15 00:03:54', '2014-05-15 00:03:54', null, '北京市朝阳区', '朝阳区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('5', '2014-05-15 00:03:55', '2014-05-15 00:03:55', null, '北京市丰台区', '丰台区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('6', '2014-05-15 00:03:56', '2014-05-15 00:03:56', null, '北京市石景山区', '石景山区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('7', '2014-05-15 00:03:57', '2014-05-15 00:03:57', null, '北京市海淀区', '海淀区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('8', '2014-05-15 00:03:58', '2014-05-15 00:03:58', null, '北京市门头沟区', '门头沟区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('9', '2014-05-15 00:03:59', '2014-05-15 00:03:59', null, '北京市房山区', '房山区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('10', '2014-05-15 00:04:00', '2014-05-15 00:04:00', null, '北京市通州区', '通州区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('11', '2014-05-15 00:04:01', '2014-05-15 00:04:01', null, '北京市顺义区', '顺义区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('12', '2014-05-15 00:04:02', '2014-05-15 00:04:02', null, '北京市昌平区', '昌平区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('13', '2014-05-15 00:04:03', '2014-05-15 00:04:03', null, '北京市大兴区', '大兴区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('14', '2014-05-15 00:04:04', '2014-05-15 00:04:04', null, '北京市怀柔区', '怀柔区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('15', '2014-05-15 00:04:05', '2014-05-15 00:04:05', null, '北京市平谷区', '平谷区', ',1,', '1');
INSERT INTO `xx_area` VALUES ('16', '2014-05-15 00:04:06', '2014-05-15 00:04:06', null, '北京市密云县', '密云县', ',1,', '1');
INSERT INTO `xx_area` VALUES ('17', '2014-05-15 00:04:07', '2014-05-15 00:04:07', null, '北京市延庆县', '延庆县', ',1,', '1');
INSERT INTO `xx_area` VALUES ('18', '2014-05-15 00:04:08', '2014-05-15 00:04:08', null, '天津市', '天津市', ',', null);
INSERT INTO `xx_area` VALUES ('19', '2014-05-15 00:04:09', '2014-05-15 00:04:09', null, '天津市和平区', '和平区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('20', '2014-05-15 00:04:10', '2014-05-15 00:04:10', null, '天津市河东区', '河东区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('21', '2014-05-15 00:04:11', '2014-05-15 00:04:11', null, '天津市河西区', '河西区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('22', '2014-05-15 00:04:12', '2014-05-15 00:04:12', null, '天津市南开区', '南开区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('23', '2014-05-15 00:04:13', '2014-05-15 00:04:13', null, '天津市河北区', '河北区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('24', '2014-05-15 00:04:14', '2014-05-15 00:04:14', null, '天津市红桥区', '红桥区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('25', '2014-05-15 00:04:15', '2014-05-15 00:04:15', null, '天津市东丽区', '东丽区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('26', '2014-05-15 00:04:16', '2014-05-15 00:04:16', null, '天津市西青区', '西青区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('27', '2014-05-15 00:04:17', '2014-05-15 00:04:17', null, '天津市津南区', '津南区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('28', '2014-05-15 00:04:18', '2014-05-15 00:04:18', null, '天津市北辰区', '北辰区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('29', '2014-05-15 00:04:19', '2014-05-15 00:04:19', null, '天津市武清区', '武清区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('30', '2014-05-15 00:04:20', '2014-05-15 00:04:20', null, '天津市宝坻区', '宝坻区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('31', '2014-05-15 00:04:21', '2014-05-15 00:04:21', null, '天津市滨海新区', '滨海新区', ',18,', '18');
INSERT INTO `xx_area` VALUES ('32', '2014-05-15 00:04:22', '2014-05-15 00:04:22', null, '天津市宁河县', '宁河县', ',18,', '18');
INSERT INTO `xx_area` VALUES ('33', '2014-05-15 00:04:23', '2014-05-15 00:04:23', null, '天津市静海县', '静海县', ',18,', '18');
INSERT INTO `xx_area` VALUES ('34', '2014-05-15 00:04:24', '2014-05-15 00:04:24', null, '天津市蓟县', '蓟县', ',18,', '18');
INSERT INTO `xx_area` VALUES ('35', '2014-05-15 00:04:25', '2014-05-15 00:04:25', null, '河北省', '河北省', ',', null);
INSERT INTO `xx_area` VALUES ('36', '2014-05-15 00:04:26', '2014-05-15 00:04:26', null, '河北省石家庄市', '石家庄市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('37', '2014-05-15 00:04:27', '2014-05-15 00:04:27', null, '河北省石家庄市长安区', '长安区', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('38', '2014-05-15 00:04:28', '2014-05-15 00:04:28', null, '河北省石家庄市桥东区', '桥东区', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('39', '2014-05-15 00:04:29', '2014-05-15 00:04:29', null, '河北省石家庄市桥西区', '桥西区', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('40', '2014-05-15 00:04:30', '2014-05-15 00:04:30', null, '河北省石家庄市新华区', '新华区', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('41', '2014-05-15 00:04:31', '2014-05-15 00:04:31', null, '河北省石家庄市井陉矿区', '井陉矿区', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('42', '2014-05-15 00:04:32', '2014-05-15 00:04:32', null, '河北省石家庄市裕华区', '裕华区', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('43', '2014-05-15 00:04:33', '2014-05-15 00:04:33', null, '河北省石家庄市井陉县', '井陉县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('44', '2014-05-15 00:04:34', '2014-05-15 00:04:34', null, '河北省石家庄市正定县', '正定县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('45', '2014-05-15 00:04:35', '2014-05-15 00:04:35', null, '河北省石家庄市栾城县', '栾城县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('46', '2014-05-15 00:04:36', '2014-05-15 00:04:36', null, '河北省石家庄市行唐县', '行唐县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('47', '2014-05-15 00:04:37', '2014-05-15 00:04:37', null, '河北省石家庄市灵寿县', '灵寿县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('48', '2014-05-15 00:04:38', '2014-05-15 00:04:38', null, '河北省石家庄市高邑县', '高邑县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('49', '2014-05-15 00:04:39', '2014-05-15 00:04:39', null, '河北省石家庄市深泽县', '深泽县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('50', '2014-05-15 00:04:40', '2014-05-15 00:04:40', null, '河北省石家庄市赞皇县', '赞皇县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('51', '2014-05-15 00:04:41', '2014-05-15 00:04:41', null, '河北省石家庄市无极县', '无极县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('52', '2014-05-15 00:04:42', '2014-05-15 00:04:42', null, '河北省石家庄市平山县', '平山县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('53', '2014-05-15 00:04:43', '2014-05-15 00:04:43', null, '河北省石家庄市元氏县', '元氏县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('54', '2014-05-15 00:04:44', '2014-05-15 00:04:44', null, '河北省石家庄市赵县', '赵县', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('55', '2014-05-15 00:04:45', '2014-05-15 00:04:45', null, '河北省石家庄市辛集市', '辛集市', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('56', '2014-05-15 00:04:46', '2014-05-15 00:04:46', null, '河北省石家庄市藁城市', '藁城市', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('57', '2014-05-15 00:04:47', '2014-05-15 00:04:47', null, '河北省石家庄市晋州市', '晋州市', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('58', '2014-05-15 00:04:48', '2014-05-15 00:04:48', null, '河北省石家庄市新乐市', '新乐市', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('59', '2014-05-15 00:04:49', '2014-05-15 00:04:49', null, '河北省石家庄市鹿泉市', '鹿泉市', ',35,36,', '36');
INSERT INTO `xx_area` VALUES ('60', '2014-05-15 00:04:50', '2014-05-15 00:04:50', null, '河北省唐山市', '唐山市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('61', '2014-05-15 00:04:51', '2014-05-15 00:04:51', null, '河北省唐山市路南区', '路南区', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('62', '2014-05-15 00:04:52', '2014-05-15 00:04:52', null, '河北省唐山市路北区', '路北区', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('63', '2014-05-15 00:04:53', '2014-05-15 00:04:53', null, '河北省唐山市古冶区', '古冶区', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('64', '2014-05-15 00:04:54', '2014-05-15 00:04:54', null, '河北省唐山市开平区', '开平区', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('65', '2014-05-15 00:04:55', '2014-05-15 00:04:55', null, '河北省唐山市丰南区', '丰南区', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('66', '2014-05-15 00:04:56', '2014-05-15 00:04:56', null, '河北省唐山市丰润区', '丰润区', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('67', '2014-05-15 00:04:57', '2014-05-15 00:04:57', null, '河北省唐山市曹妃甸区', '曹妃甸区', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('68', '2014-05-15 00:04:58', '2014-05-15 00:04:58', null, '河北省唐山市滦县', '滦县', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('69', '2014-05-15 00:04:59', '2014-05-15 00:04:59', null, '河北省唐山市滦南县', '滦南县', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('70', '2014-05-15 00:05:00', '2014-05-15 00:05:00', null, '河北省唐山市乐亭县', '乐亭县', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('71', '2014-05-15 00:05:01', '2014-05-15 00:05:01', null, '河北省唐山市迁西县', '迁西县', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('72', '2014-05-15 00:05:02', '2014-05-15 00:05:02', null, '河北省唐山市玉田县', '玉田县', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('73', '2014-05-15 00:05:03', '2014-05-15 00:05:03', null, '河北省唐山市遵化市', '遵化市', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('74', '2014-05-15 00:05:04', '2014-05-15 00:05:04', null, '河北省唐山市迁安市', '迁安市', ',35,60,', '60');
INSERT INTO `xx_area` VALUES ('75', '2014-05-15 00:05:05', '2014-05-15 00:05:05', null, '河北省秦皇岛市', '秦皇岛市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('76', '2014-05-15 00:05:06', '2014-05-15 00:05:06', null, '河北省秦皇岛市海港区', '海港区', ',35,75,', '75');
INSERT INTO `xx_area` VALUES ('77', '2014-05-15 00:05:07', '2014-05-15 00:05:07', null, '河北省秦皇岛市山海关区', '山海关区', ',35,75,', '75');
INSERT INTO `xx_area` VALUES ('78', '2014-05-15 00:05:08', '2014-05-15 00:05:08', null, '河北省秦皇岛市北戴河区', '北戴河区', ',35,75,', '75');
INSERT INTO `xx_area` VALUES ('79', '2014-05-15 00:05:09', '2014-05-15 00:05:09', null, '河北省秦皇岛市青龙满族自治县', '青龙满族自治县', ',35,75,', '75');
INSERT INTO `xx_area` VALUES ('80', '2014-05-15 00:05:10', '2014-05-15 00:05:10', null, '河北省秦皇岛市昌黎县', '昌黎县', ',35,75,', '75');
INSERT INTO `xx_area` VALUES ('81', '2014-05-15 00:05:11', '2014-05-15 00:05:11', null, '河北省秦皇岛市抚宁县', '抚宁县', ',35,75,', '75');
INSERT INTO `xx_area` VALUES ('82', '2014-05-15 00:05:12', '2014-05-15 00:05:12', null, '河北省秦皇岛市卢龙县', '卢龙县', ',35,75,', '75');
INSERT INTO `xx_area` VALUES ('83', '2014-05-15 00:05:13', '2014-05-15 00:05:13', null, '河北省邯郸市', '邯郸市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('84', '2014-05-15 00:05:14', '2014-05-15 00:05:14', null, '河北省邯郸市邯山区', '邯山区', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('85', '2014-05-15 00:05:15', '2014-05-15 00:05:15', null, '河北省邯郸市丛台区', '丛台区', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('86', '2014-05-15 00:05:16', '2014-05-15 00:05:16', null, '河北省邯郸市复兴区', '复兴区', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('87', '2014-05-15 00:05:17', '2014-05-15 00:05:17', null, '河北省邯郸市峰峰矿区', '峰峰矿区', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('88', '2014-05-15 00:05:18', '2014-05-15 00:05:18', null, '河北省邯郸市邯郸县', '邯郸县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('89', '2014-05-15 00:05:19', '2014-05-15 00:05:19', null, '河北省邯郸市临漳县', '临漳县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('90', '2014-05-15 00:05:20', '2014-05-15 00:05:20', null, '河北省邯郸市成安县', '成安县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('91', '2014-05-15 00:05:21', '2014-05-15 00:05:21', null, '河北省邯郸市大名县', '大名县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('92', '2014-05-15 00:05:22', '2014-05-15 00:05:22', null, '河北省邯郸市涉县', '涉县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('93', '2014-05-15 00:05:23', '2014-05-15 00:05:23', null, '河北省邯郸市磁县', '磁县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('94', '2014-05-15 00:05:24', '2014-05-15 00:05:24', null, '河北省邯郸市肥乡县', '肥乡县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('95', '2014-05-15 00:05:25', '2014-05-15 00:05:25', null, '河北省邯郸市永年县', '永年县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('96', '2014-05-15 00:05:26', '2014-05-15 00:05:26', null, '河北省邯郸市邱县', '邱县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('97', '2014-05-15 00:05:27', '2014-05-15 00:05:27', null, '河北省邯郸市鸡泽县', '鸡泽县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('98', '2014-05-15 00:05:28', '2014-05-15 00:05:28', null, '河北省邯郸市广平县', '广平县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('99', '2014-05-15 00:05:29', '2014-05-15 00:05:29', null, '河北省邯郸市馆陶县', '馆陶县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('100', '2014-05-15 00:05:30', '2014-05-15 00:05:30', null, '河北省邯郸市魏县', '魏县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('101', '2014-05-15 00:05:31', '2014-05-15 00:05:31', null, '河北省邯郸市曲周县', '曲周县', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('102', '2014-05-15 00:05:32', '2014-05-15 00:05:32', null, '河北省邯郸市武安市', '武安市', ',35,83,', '83');
INSERT INTO `xx_area` VALUES ('103', '2014-05-15 00:05:33', '2014-05-15 00:05:33', null, '河北省邢台市', '邢台市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('104', '2014-05-15 00:05:34', '2014-05-15 00:05:34', null, '河北省邢台市桥东区', '桥东区', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('105', '2014-05-15 00:05:35', '2014-05-15 00:05:35', null, '河北省邢台市桥西区', '桥西区', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('106', '2014-05-15 00:05:36', '2014-05-15 00:05:36', null, '河北省邢台市邢台县', '邢台县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('107', '2014-05-15 00:05:37', '2014-05-15 00:05:37', null, '河北省邢台市临城县', '临城县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('108', '2014-05-15 00:05:38', '2014-05-15 00:05:38', null, '河北省邢台市内丘县', '内丘县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('109', '2014-05-15 00:05:39', '2014-05-15 00:05:39', null, '河北省邢台市柏乡县', '柏乡县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('110', '2014-05-15 00:05:40', '2014-05-15 00:05:40', null, '河北省邢台市隆尧县', '隆尧县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('111', '2014-05-15 00:05:41', '2014-05-15 00:05:41', null, '河北省邢台市任县', '任县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('112', '2014-05-15 00:05:42', '2014-05-15 00:05:42', null, '河北省邢台市南和县', '南和县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('113', '2014-05-15 00:05:43', '2014-05-15 00:05:43', null, '河北省邢台市宁晋县', '宁晋县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('114', '2014-05-15 00:05:44', '2014-05-15 00:05:44', null, '河北省邢台市巨鹿县', '巨鹿县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('115', '2014-05-15 00:05:45', '2014-05-15 00:05:45', null, '河北省邢台市新河县', '新河县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('116', '2014-05-15 00:05:46', '2014-05-15 00:05:46', null, '河北省邢台市广宗县', '广宗县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('117', '2014-05-15 00:05:47', '2014-05-15 00:05:47', null, '河北省邢台市平乡县', '平乡县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('118', '2014-05-15 00:05:48', '2014-05-15 00:05:48', null, '河北省邢台市威县', '威县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('119', '2014-05-15 00:05:49', '2014-05-15 00:05:49', null, '河北省邢台市清河县', '清河县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('120', '2014-05-15 00:05:50', '2014-05-15 00:05:50', null, '河北省邢台市临西县', '临西县', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('121', '2014-05-15 00:05:51', '2014-05-15 00:05:51', null, '河北省邢台市南宫市', '南宫市', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('122', '2014-05-15 00:05:52', '2014-05-15 00:05:52', null, '河北省邢台市沙河市', '沙河市', ',35,103,', '103');
INSERT INTO `xx_area` VALUES ('123', '2014-05-15 00:05:53', '2014-05-15 00:05:53', null, '河北省保定市', '保定市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('124', '2014-05-15 00:05:54', '2014-05-15 00:05:54', null, '河北省保定市新市区', '新市区', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('125', '2014-05-15 00:05:55', '2014-05-15 00:05:55', null, '河北省保定市北市区', '北市区', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('126', '2014-05-15 00:05:56', '2014-05-15 00:05:56', null, '河北省保定市南市区', '南市区', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('127', '2014-05-15 00:05:57', '2014-05-15 00:05:57', null, '河北省保定市满城县', '满城县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('128', '2014-05-15 00:05:58', '2014-05-15 00:05:58', null, '河北省保定市清苑县', '清苑县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('129', '2014-05-15 00:05:59', '2014-05-15 00:05:59', null, '河北省保定市涞水县', '涞水县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('130', '2014-05-15 00:06:00', '2014-05-15 00:06:00', null, '河北省保定市阜平县', '阜平县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('131', '2014-05-15 00:06:01', '2014-05-15 00:06:01', null, '河北省保定市徐水县', '徐水县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('132', '2014-05-15 00:06:02', '2014-05-15 00:06:02', null, '河北省保定市定兴县', '定兴县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('133', '2014-05-15 00:06:03', '2014-05-15 00:06:03', null, '河北省保定市唐县', '唐县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('134', '2014-05-15 00:06:04', '2014-05-15 00:06:04', null, '河北省保定市高阳县', '高阳县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('135', '2014-05-15 00:06:05', '2014-05-15 00:06:05', null, '河北省保定市容城县', '容城县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('136', '2014-05-15 00:06:06', '2014-05-15 00:06:06', null, '河北省保定市涞源县', '涞源县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('137', '2014-05-15 00:06:07', '2014-05-15 00:06:07', null, '河北省保定市望都县', '望都县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('138', '2014-05-15 00:06:08', '2014-05-15 00:06:08', null, '河北省保定市安新县', '安新县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('139', '2014-05-15 00:06:09', '2014-05-15 00:06:09', null, '河北省保定市易县', '易县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('140', '2014-05-15 00:06:10', '2014-05-15 00:06:10', null, '河北省保定市曲阳县', '曲阳县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('141', '2014-05-15 00:06:11', '2014-05-15 00:06:11', null, '河北省保定市蠡县', '蠡县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('142', '2014-05-15 00:06:12', '2014-05-15 00:06:12', null, '河北省保定市顺平县', '顺平县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('143', '2014-05-15 00:06:13', '2014-05-15 00:06:13', null, '河北省保定市博野县', '博野县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('144', '2014-05-15 00:06:14', '2014-05-15 00:06:14', null, '河北省保定市雄县', '雄县', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('145', '2014-05-15 00:06:15', '2014-05-15 00:06:15', null, '河北省保定市涿州市', '涿州市', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('146', '2014-05-15 00:06:16', '2014-05-15 00:06:16', null, '河北省保定市定州市', '定州市', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('147', '2014-05-15 00:06:17', '2014-05-15 00:06:17', null, '河北省保定市安国市', '安国市', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('148', '2014-05-15 00:06:18', '2014-05-15 00:06:18', null, '河北省保定市高碑店市', '高碑店市', ',35,123,', '123');
INSERT INTO `xx_area` VALUES ('149', '2014-05-15 00:06:19', '2014-05-15 00:06:19', null, '河北省张家口市', '张家口市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('150', '2014-05-15 00:06:20', '2014-05-15 00:06:20', null, '河北省张家口市桥东区', '桥东区', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('151', '2014-05-15 00:06:21', '2014-05-15 00:06:21', null, '河北省张家口市桥西区', '桥西区', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('152', '2014-05-15 00:06:22', '2014-05-15 00:06:22', null, '河北省张家口市宣化区', '宣化区', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('153', '2014-05-15 00:06:23', '2014-05-15 00:06:23', null, '河北省张家口市下花园区', '下花园区', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('154', '2014-05-15 00:06:24', '2014-05-15 00:06:24', null, '河北省张家口市宣化县', '宣化县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('155', '2014-05-15 00:06:25', '2014-05-15 00:06:25', null, '河北省张家口市张北县', '张北县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('156', '2014-05-15 00:06:26', '2014-05-15 00:06:26', null, '河北省张家口市康保县', '康保县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('157', '2014-05-15 00:06:27', '2014-05-15 00:06:27', null, '河北省张家口市沽源县', '沽源县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('158', '2014-05-15 00:06:28', '2014-05-15 00:06:28', null, '河北省张家口市尚义县', '尚义县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('159', '2014-05-15 00:06:29', '2014-05-15 00:06:29', null, '河北省张家口市蔚县', '蔚县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('160', '2014-05-15 00:06:30', '2014-05-15 00:06:30', null, '河北省张家口市阳原县', '阳原县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('161', '2014-05-15 00:06:31', '2014-05-15 00:06:31', null, '河北省张家口市怀安县', '怀安县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('162', '2014-05-15 00:06:32', '2014-05-15 00:06:32', null, '河北省张家口市万全县', '万全县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('163', '2014-05-15 00:06:33', '2014-05-15 00:06:33', null, '河北省张家口市怀来县', '怀来县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('164', '2014-05-15 00:06:34', '2014-05-15 00:06:34', null, '河北省张家口市涿鹿县', '涿鹿县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('165', '2014-05-15 00:06:35', '2014-05-15 00:06:35', null, '河北省张家口市赤城县', '赤城县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('166', '2014-05-15 00:06:36', '2014-05-15 00:06:36', null, '河北省张家口市崇礼县', '崇礼县', ',35,149,', '149');
INSERT INTO `xx_area` VALUES ('167', '2014-05-15 00:06:37', '2014-05-15 00:06:37', null, '河北省承德市', '承德市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('168', '2014-05-15 00:06:38', '2014-05-15 00:06:38', null, '河北省承德市双桥区', '双桥区', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('169', '2014-05-15 00:06:39', '2014-05-15 00:06:39', null, '河北省承德市双滦区', '双滦区', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('170', '2014-05-15 00:06:40', '2014-05-15 00:06:40', null, '河北省承德市鹰手营子矿区', '鹰手营子矿区', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('171', '2014-05-15 00:06:41', '2014-05-15 00:06:41', null, '河北省承德市承德县', '承德县', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('172', '2014-05-15 00:06:42', '2014-05-15 00:06:42', null, '河北省承德市兴隆县', '兴隆县', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('173', '2014-05-15 00:06:43', '2014-05-15 00:06:43', null, '河北省承德市平泉县', '平泉县', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('174', '2014-05-15 00:06:44', '2014-05-15 00:06:44', null, '河北省承德市滦平县', '滦平县', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('175', '2014-05-15 00:06:45', '2014-05-15 00:06:45', null, '河北省承德市隆化县', '隆化县', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('176', '2014-05-15 00:06:46', '2014-05-15 00:06:46', null, '河北省承德市丰宁满族自治县', '丰宁满族自治县', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('177', '2014-05-15 00:06:47', '2014-05-15 00:06:47', null, '河北省承德市宽城满族自治县', '宽城满族自治县', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('178', '2014-05-15 00:06:48', '2014-05-15 00:06:48', null, '河北省承德市围场满族蒙古族自治县', '围场满族蒙古族自治县', ',35,167,', '167');
INSERT INTO `xx_area` VALUES ('179', '2014-05-15 00:06:49', '2014-05-15 00:06:49', null, '河北省沧州市', '沧州市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('180', '2014-05-15 00:06:50', '2014-05-15 00:06:50', null, '河北省沧州市新华区', '新华区', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('181', '2014-05-15 00:06:51', '2014-05-15 00:06:51', null, '河北省沧州市运河区', '运河区', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('182', '2014-05-15 00:06:52', '2014-05-15 00:06:52', null, '河北省沧州市沧县', '沧县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('183', '2014-05-15 00:06:53', '2014-05-15 00:06:53', null, '河北省沧州市青县', '青县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('184', '2014-05-15 00:06:54', '2014-05-15 00:06:54', null, '河北省沧州市东光县', '东光县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('185', '2014-05-15 00:06:55', '2014-05-15 00:06:55', null, '河北省沧州市海兴县', '海兴县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('186', '2014-05-15 00:06:56', '2014-05-15 00:06:56', null, '河北省沧州市盐山县', '盐山县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('187', '2014-05-15 00:06:57', '2014-05-15 00:06:57', null, '河北省沧州市肃宁县', '肃宁县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('188', '2014-05-15 00:06:58', '2014-05-15 00:06:58', null, '河北省沧州市南皮县', '南皮县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('189', '2014-05-15 00:06:59', '2014-05-15 00:06:59', null, '河北省沧州市吴桥县', '吴桥县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('190', '2014-05-15 00:07:00', '2014-05-15 00:07:00', null, '河北省沧州市献县', '献县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('191', '2014-05-15 00:07:01', '2014-05-15 00:07:01', null, '河北省沧州市孟村回族自治县', '孟村回族自治县', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('192', '2014-05-15 00:07:02', '2014-05-15 00:07:02', null, '河北省沧州市泊头市', '泊头市', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('193', '2014-05-15 00:07:03', '2014-05-15 00:07:03', null, '河北省沧州市任丘市', '任丘市', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('194', '2014-05-15 00:07:04', '2014-05-15 00:07:04', null, '河北省沧州市黄骅市', '黄骅市', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('195', '2014-05-15 00:07:05', '2014-05-15 00:07:05', null, '河北省沧州市河间市', '河间市', ',35,179,', '179');
INSERT INTO `xx_area` VALUES ('196', '2014-05-15 00:07:06', '2014-05-15 00:07:06', null, '河北省廊坊市', '廊坊市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('197', '2014-05-15 00:07:07', '2014-05-15 00:07:07', null, '河北省廊坊市安次区', '安次区', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('198', '2014-05-15 00:07:08', '2014-05-15 00:07:08', null, '河北省廊坊市广阳区', '广阳区', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('199', '2014-05-15 00:07:09', '2014-05-15 00:07:09', null, '河北省廊坊市固安县', '固安县', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('200', '2014-05-15 00:07:10', '2014-05-15 00:07:10', null, '河北省廊坊市永清县', '永清县', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('201', '2014-05-15 00:07:11', '2014-05-15 00:07:11', null, '河北省廊坊市香河县', '香河县', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('202', '2014-05-15 00:07:12', '2014-05-15 00:07:12', null, '河北省廊坊市大城县', '大城县', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('203', '2014-05-15 00:07:13', '2014-05-15 00:07:13', null, '河北省廊坊市文安县', '文安县', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('204', '2014-05-15 00:07:14', '2014-05-15 00:07:14', null, '河北省廊坊市大厂回族自治县', '大厂回族自治县', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('205', '2014-05-15 00:07:15', '2014-05-15 00:07:15', null, '河北省廊坊市霸州市', '霸州市', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('206', '2014-05-15 00:07:16', '2014-05-15 00:07:16', null, '河北省廊坊市三河市', '三河市', ',35,196,', '196');
INSERT INTO `xx_area` VALUES ('207', '2014-05-15 00:07:17', '2014-05-15 00:07:17', null, '河北省衡水市', '衡水市', ',35,', '35');
INSERT INTO `xx_area` VALUES ('208', '2014-05-15 00:07:18', '2014-05-15 00:07:18', null, '河北省衡水市桃城区', '桃城区', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('209', '2014-05-15 00:07:19', '2014-05-15 00:07:19', null, '河北省衡水市枣强县', '枣强县', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('210', '2014-05-15 00:07:20', '2014-05-15 00:07:20', null, '河北省衡水市武邑县', '武邑县', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('211', '2014-05-15 00:07:21', '2014-05-15 00:07:21', null, '河北省衡水市武强县', '武强县', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('212', '2014-05-15 00:07:22', '2014-05-15 00:07:22', null, '河北省衡水市饶阳县', '饶阳县', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('213', '2014-05-15 00:07:23', '2014-05-15 00:07:23', null, '河北省衡水市安平县', '安平县', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('214', '2014-05-15 00:07:24', '2014-05-15 00:07:24', null, '河北省衡水市故城县', '故城县', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('215', '2014-05-15 00:07:25', '2014-05-15 00:07:25', null, '河北省衡水市景县', '景县', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('216', '2014-05-15 00:07:26', '2014-05-15 00:07:26', null, '河北省衡水市阜城县', '阜城县', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('217', '2014-05-15 00:07:27', '2014-05-15 00:07:27', null, '河北省衡水市冀州市', '冀州市', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('218', '2014-05-15 00:07:28', '2014-05-15 00:07:28', null, '河北省衡水市深州市', '深州市', ',35,207,', '207');
INSERT INTO `xx_area` VALUES ('219', '2014-05-15 00:07:29', '2014-05-15 00:07:29', null, '山西省', '山西省', ',', null);
INSERT INTO `xx_area` VALUES ('220', '2014-05-15 00:07:30', '2014-05-15 00:07:30', null, '山西省太原市', '太原市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('221', '2014-05-15 00:07:31', '2014-05-15 00:07:31', null, '山西省太原市小店区', '小店区', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('222', '2014-05-15 00:07:32', '2014-05-15 00:07:32', null, '山西省太原市迎泽区', '迎泽区', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('223', '2014-05-15 00:07:33', '2014-05-15 00:07:33', null, '山西省太原市杏花岭区', '杏花岭区', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('224', '2014-05-15 00:07:34', '2014-05-15 00:07:34', null, '山西省太原市尖草坪区', '尖草坪区', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('225', '2014-05-15 00:07:35', '2014-05-15 00:07:35', null, '山西省太原市万柏林区', '万柏林区', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('226', '2014-05-15 00:07:36', '2014-05-15 00:07:36', null, '山西省太原市晋源区', '晋源区', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('227', '2014-05-15 00:07:37', '2014-05-15 00:07:37', null, '山西省太原市清徐县', '清徐县', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('228', '2014-05-15 00:07:38', '2014-05-15 00:07:38', null, '山西省太原市阳曲县', '阳曲县', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('229', '2014-05-15 00:07:39', '2014-05-15 00:07:39', null, '山西省太原市娄烦县', '娄烦县', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('230', '2014-05-15 00:07:40', '2014-05-15 00:07:40', null, '山西省太原市古交市', '古交市', ',219,220,', '220');
INSERT INTO `xx_area` VALUES ('231', '2014-05-15 00:07:41', '2014-05-15 00:07:41', null, '山西省大同市', '大同市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('232', '2014-05-15 00:07:42', '2014-05-15 00:07:42', null, '山西省大同市城区', '城区', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('233', '2014-05-15 00:07:43', '2014-05-15 00:07:43', null, '山西省大同市矿区', '矿区', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('234', '2014-05-15 00:07:44', '2014-05-15 00:07:44', null, '山西省大同市南郊区', '南郊区', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('235', '2014-05-15 00:07:45', '2014-05-15 00:07:45', null, '山西省大同市新荣区', '新荣区', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('236', '2014-05-15 00:07:46', '2014-05-15 00:07:46', null, '山西省大同市阳高县', '阳高县', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('237', '2014-05-15 00:07:47', '2014-05-15 00:07:47', null, '山西省大同市天镇县', '天镇县', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('238', '2014-05-15 00:07:48', '2014-05-15 00:07:48', null, '山西省大同市广灵县', '广灵县', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('239', '2014-05-15 00:07:49', '2014-05-15 00:07:49', null, '山西省大同市灵丘县', '灵丘县', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('240', '2014-05-15 00:07:50', '2014-05-15 00:07:50', null, '山西省大同市浑源县', '浑源县', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('241', '2014-05-15 00:07:51', '2014-05-15 00:07:51', null, '山西省大同市左云县', '左云县', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('242', '2014-05-15 00:07:52', '2014-05-15 00:07:52', null, '山西省大同市大同县', '大同县', ',219,231,', '231');
INSERT INTO `xx_area` VALUES ('243', '2014-05-15 00:07:53', '2014-05-15 00:07:53', null, '山西省阳泉市', '阳泉市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('244', '2014-05-15 00:07:54', '2014-05-15 00:07:54', null, '山西省阳泉市城区', '城区', ',219,243,', '243');
INSERT INTO `xx_area` VALUES ('245', '2014-05-15 00:07:55', '2014-05-15 00:07:55', null, '山西省阳泉市矿区', '矿区', ',219,243,', '243');
INSERT INTO `xx_area` VALUES ('246', '2014-05-15 00:07:56', '2014-05-15 00:07:56', null, '山西省阳泉市郊区', '郊区', ',219,243,', '243');
INSERT INTO `xx_area` VALUES ('247', '2014-05-15 00:07:57', '2014-05-15 00:07:57', null, '山西省阳泉市平定县', '平定县', ',219,243,', '243');
INSERT INTO `xx_area` VALUES ('248', '2014-05-15 00:07:58', '2014-05-15 00:07:58', null, '山西省阳泉市盂县', '盂县', ',219,243,', '243');
INSERT INTO `xx_area` VALUES ('249', '2014-05-15 00:07:59', '2014-05-15 00:07:59', null, '山西省长治市', '长治市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('250', '2014-05-15 00:08:00', '2014-05-15 00:08:00', null, '山西省长治市城区', '城区', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('251', '2014-05-15 00:08:01', '2014-05-15 00:08:01', null, '山西省长治市郊区', '郊区', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('252', '2014-05-15 00:08:02', '2014-05-15 00:08:02', null, '山西省长治市长治县', '长治县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('253', '2014-05-15 00:08:03', '2014-05-15 00:08:03', null, '山西省长治市襄垣县', '襄垣县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('254', '2014-05-15 00:08:04', '2014-05-15 00:08:04', null, '山西省长治市屯留县', '屯留县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('255', '2014-05-15 00:08:05', '2014-05-15 00:08:05', null, '山西省长治市平顺县', '平顺县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('256', '2014-05-15 00:08:06', '2014-05-15 00:08:06', null, '山西省长治市黎城县', '黎城县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('257', '2014-05-15 00:08:07', '2014-05-15 00:08:07', null, '山西省长治市壶关县', '壶关县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('258', '2014-05-15 00:08:08', '2014-05-15 00:08:08', null, '山西省长治市长子县', '长子县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('259', '2014-05-15 00:08:09', '2014-05-15 00:08:09', null, '山西省长治市武乡县', '武乡县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('260', '2014-05-15 00:08:10', '2014-05-15 00:08:10', null, '山西省长治市沁县', '沁县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('261', '2014-05-15 00:08:11', '2014-05-15 00:08:11', null, '山西省长治市沁源县', '沁源县', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('262', '2014-05-15 00:08:12', '2014-05-15 00:08:12', null, '山西省长治市潞城市', '潞城市', ',219,249,', '249');
INSERT INTO `xx_area` VALUES ('263', '2014-05-15 00:08:13', '2014-05-15 00:08:13', null, '山西省晋城市', '晋城市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('264', '2014-05-15 00:08:14', '2014-05-15 00:08:14', null, '山西省晋城市晋城市市辖区', '晋城市市辖区', ',219,263,', '263');
INSERT INTO `xx_area` VALUES ('265', '2014-05-15 00:08:15', '2014-05-15 00:08:15', null, '山西省晋城市城区', '城区', ',219,263,', '263');
INSERT INTO `xx_area` VALUES ('266', '2014-05-15 00:08:16', '2014-05-15 00:08:16', null, '山西省晋城市沁水县', '沁水县', ',219,263,', '263');
INSERT INTO `xx_area` VALUES ('267', '2014-05-15 00:08:17', '2014-05-15 00:08:17', null, '山西省晋城市阳城县', '阳城县', ',219,263,', '263');
INSERT INTO `xx_area` VALUES ('268', '2014-05-15 00:08:18', '2014-05-15 00:08:18', null, '山西省晋城市陵川县', '陵川县', ',219,263,', '263');
INSERT INTO `xx_area` VALUES ('269', '2014-05-15 00:08:19', '2014-05-15 00:08:19', null, '山西省晋城市泽州县', '泽州县', ',219,263,', '263');
INSERT INTO `xx_area` VALUES ('270', '2014-05-15 00:08:20', '2014-05-15 00:08:20', null, '山西省晋城市高平市', '高平市', ',219,263,', '263');
INSERT INTO `xx_area` VALUES ('271', '2014-05-15 00:08:21', '2014-05-15 00:08:21', null, '山西省朔州市', '朔州市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('272', '2014-05-15 00:08:22', '2014-05-15 00:08:22', null, '山西省朔州市朔城区', '朔城区', ',219,271,', '271');
INSERT INTO `xx_area` VALUES ('273', '2014-05-15 00:08:23', '2014-05-15 00:08:23', null, '山西省朔州市平鲁区', '平鲁区', ',219,271,', '271');
INSERT INTO `xx_area` VALUES ('274', '2014-05-15 00:08:24', '2014-05-15 00:08:24', null, '山西省朔州市山阴县', '山阴县', ',219,271,', '271');
INSERT INTO `xx_area` VALUES ('275', '2014-05-15 00:08:25', '2014-05-15 00:08:25', null, '山西省朔州市应县', '应县', ',219,271,', '271');
INSERT INTO `xx_area` VALUES ('276', '2014-05-15 00:08:26', '2014-05-15 00:08:26', null, '山西省朔州市右玉县', '右玉县', ',219,271,', '271');
INSERT INTO `xx_area` VALUES ('277', '2014-05-15 00:08:27', '2014-05-15 00:08:27', null, '山西省朔州市怀仁县', '怀仁县', ',219,271,', '271');
INSERT INTO `xx_area` VALUES ('278', '2014-05-15 00:08:28', '2014-05-15 00:08:28', null, '山西省晋中市', '晋中市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('279', '2014-05-15 00:08:29', '2014-05-15 00:08:29', null, '山西省晋中市榆次区', '榆次区', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('280', '2014-05-15 00:08:30', '2014-05-15 00:08:30', null, '山西省晋中市榆社县', '榆社县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('281', '2014-05-15 00:08:31', '2014-05-15 00:08:31', null, '山西省晋中市左权县', '左权县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('282', '2014-05-15 00:08:32', '2014-05-15 00:08:32', null, '山西省晋中市和顺县', '和顺县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('283', '2014-05-15 00:08:33', '2014-05-15 00:08:33', null, '山西省晋中市昔阳县', '昔阳县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('284', '2014-05-15 00:08:34', '2014-05-15 00:08:34', null, '山西省晋中市寿阳县', '寿阳县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('285', '2014-05-15 00:08:35', '2014-05-15 00:08:35', null, '山西省晋中市太谷县', '太谷县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('286', '2014-05-15 00:08:36', '2014-05-15 00:08:36', null, '山西省晋中市祁县', '祁县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('287', '2014-05-15 00:08:37', '2014-05-15 00:08:37', null, '山西省晋中市平遥县', '平遥县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('288', '2014-05-15 00:08:38', '2014-05-15 00:08:38', null, '山西省晋中市灵石县', '灵石县', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('289', '2014-05-15 00:08:39', '2014-05-15 00:08:39', null, '山西省晋中市介休市', '介休市', ',219,278,', '278');
INSERT INTO `xx_area` VALUES ('290', '2014-05-15 00:08:40', '2014-05-15 00:08:40', null, '山西省运城市', '运城市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('291', '2014-05-15 00:08:41', '2014-05-15 00:08:41', null, '山西省运城市盐湖区', '盐湖区', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('292', '2014-05-15 00:08:42', '2014-05-15 00:08:42', null, '山西省运城市临猗县', '临猗县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('293', '2014-05-15 00:08:43', '2014-05-15 00:08:43', null, '山西省运城市万荣县', '万荣县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('294', '2014-05-15 00:08:44', '2014-05-15 00:08:44', null, '山西省运城市闻喜县', '闻喜县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('295', '2014-05-15 00:08:45', '2014-05-15 00:08:45', null, '山西省运城市稷山县', '稷山县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('296', '2014-05-15 00:08:46', '2014-05-15 00:08:46', null, '山西省运城市新绛县', '新绛县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('297', '2014-05-15 00:08:47', '2014-05-15 00:08:47', null, '山西省运城市绛县', '绛县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('298', '2014-05-15 00:08:48', '2014-05-15 00:08:48', null, '山西省运城市垣曲县', '垣曲县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('299', '2014-05-15 00:08:49', '2014-05-15 00:08:49', null, '山西省运城市夏县', '夏县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('300', '2014-05-15 00:08:50', '2014-05-15 00:08:50', null, '山西省运城市平陆县', '平陆县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('301', '2014-05-15 00:08:51', '2014-05-15 00:08:51', null, '山西省运城市芮城县', '芮城县', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('302', '2014-05-15 00:08:52', '2014-05-15 00:08:52', null, '山西省运城市永济市', '永济市', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('303', '2014-05-15 00:08:53', '2014-05-15 00:08:53', null, '山西省运城市河津市', '河津市', ',219,290,', '290');
INSERT INTO `xx_area` VALUES ('304', '2014-05-15 00:08:54', '2014-05-15 00:08:54', null, '山西省忻州市', '忻州市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('305', '2014-05-15 00:08:55', '2014-05-15 00:08:55', null, '山西省忻州市忻府区', '忻府区', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('306', '2014-05-15 00:08:56', '2014-05-15 00:08:56', null, '山西省忻州市定襄县', '定襄县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('307', '2014-05-15 00:08:57', '2014-05-15 00:08:57', null, '山西省忻州市五台县', '五台县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('308', '2014-05-15 00:08:58', '2014-05-15 00:08:58', null, '山西省忻州市代县', '代县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('309', '2014-05-15 00:08:59', '2014-05-15 00:08:59', null, '山西省忻州市繁峙县', '繁峙县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('310', '2014-05-15 00:09:00', '2014-05-15 00:09:00', null, '山西省忻州市宁武县', '宁武县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('311', '2014-05-15 00:09:01', '2014-05-15 00:09:01', null, '山西省忻州市静乐县', '静乐县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('312', '2014-05-15 00:09:02', '2014-05-15 00:09:02', null, '山西省忻州市神池县', '神池县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('313', '2014-05-15 00:09:03', '2014-05-15 00:09:03', null, '山西省忻州市五寨县', '五寨县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('314', '2014-05-15 00:09:04', '2014-05-15 00:09:04', null, '山西省忻州市岢岚县', '岢岚县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('315', '2014-05-15 00:09:05', '2014-05-15 00:09:05', null, '山西省忻州市河曲县', '河曲县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('316', '2014-05-15 00:09:06', '2014-05-15 00:09:06', null, '山西省忻州市保德县', '保德县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('317', '2014-05-15 00:09:07', '2014-05-15 00:09:07', null, '山西省忻州市偏关县', '偏关县', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('318', '2014-05-15 00:09:08', '2014-05-15 00:09:08', null, '山西省忻州市原平市', '原平市', ',219,304,', '304');
INSERT INTO `xx_area` VALUES ('319', '2014-05-15 00:09:09', '2014-05-15 00:09:09', null, '山西省临汾市', '临汾市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('320', '2014-05-15 00:09:10', '2014-05-15 00:09:10', null, '山西省临汾市尧都区', '尧都区', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('321', '2014-05-15 00:09:11', '2014-05-15 00:09:11', null, '山西省临汾市曲沃县', '曲沃县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('322', '2014-05-15 00:09:12', '2014-05-15 00:09:12', null, '山西省临汾市翼城县', '翼城县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('323', '2014-05-15 00:09:13', '2014-05-15 00:09:13', null, '山西省临汾市襄汾县', '襄汾县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('324', '2014-05-15 00:09:14', '2014-05-15 00:09:14', null, '山西省临汾市洪洞县', '洪洞县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('325', '2014-05-15 00:09:15', '2014-05-15 00:09:15', null, '山西省临汾市古县', '古县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('326', '2014-05-15 00:09:16', '2014-05-15 00:09:16', null, '山西省临汾市安泽县', '安泽县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('327', '2014-05-15 00:09:17', '2014-05-15 00:09:17', null, '山西省临汾市浮山县', '浮山县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('328', '2014-05-15 00:09:18', '2014-05-15 00:09:18', null, '山西省临汾市吉县', '吉县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('329', '2014-05-15 00:09:19', '2014-05-15 00:09:19', null, '山西省临汾市乡宁县', '乡宁县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('330', '2014-05-15 00:09:20', '2014-05-15 00:09:20', null, '山西省临汾市大宁县', '大宁县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('331', '2014-05-15 00:09:21', '2014-05-15 00:09:21', null, '山西省临汾市隰县', '隰县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('332', '2014-05-15 00:09:22', '2014-05-15 00:09:22', null, '山西省临汾市永和县', '永和县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('333', '2014-05-15 00:09:23', '2014-05-15 00:09:23', null, '山西省临汾市蒲县', '蒲县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('334', '2014-05-15 00:09:24', '2014-05-15 00:09:24', null, '山西省临汾市汾西县', '汾西县', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('335', '2014-05-15 00:09:25', '2014-05-15 00:09:25', null, '山西省临汾市侯马市', '侯马市', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('336', '2014-05-15 00:09:26', '2014-05-15 00:09:26', null, '山西省临汾市霍州市', '霍州市', ',219,319,', '319');
INSERT INTO `xx_area` VALUES ('337', '2014-05-15 00:09:27', '2014-05-15 00:09:27', null, '山西省吕梁市', '吕梁市', ',219,', '219');
INSERT INTO `xx_area` VALUES ('338', '2014-05-15 00:09:28', '2014-05-15 00:09:28', null, '山西省吕梁市离石区', '离石区', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('339', '2014-05-15 00:09:29', '2014-05-15 00:09:29', null, '山西省吕梁市文水县', '文水县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('340', '2014-05-15 00:09:30', '2014-05-15 00:09:30', null, '山西省吕梁市交城县', '交城县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('341', '2014-05-15 00:09:31', '2014-05-15 00:09:31', null, '山西省吕梁市兴县', '兴县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('342', '2014-05-15 00:09:32', '2014-05-15 00:09:32', null, '山西省吕梁市临县', '临县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('343', '2014-05-15 00:09:33', '2014-05-15 00:09:33', null, '山西省吕梁市柳林县', '柳林县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('344', '2014-05-15 00:09:34', '2014-05-15 00:09:34', null, '山西省吕梁市石楼县', '石楼县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('345', '2014-05-15 00:09:35', '2014-05-15 00:09:35', null, '山西省吕梁市岚县', '岚县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('346', '2014-05-15 00:09:36', '2014-05-15 00:09:36', null, '山西省吕梁市方山县', '方山县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('347', '2014-05-15 00:09:37', '2014-05-15 00:09:37', null, '山西省吕梁市中阳县', '中阳县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('348', '2014-05-15 00:09:38', '2014-05-15 00:09:38', null, '山西省吕梁市交口县', '交口县', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('349', '2014-05-15 00:09:39', '2014-05-15 00:09:39', null, '山西省吕梁市孝义市', '孝义市', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('350', '2014-05-15 00:09:40', '2014-05-15 00:09:40', null, '山西省吕梁市汾阳市', '汾阳市', ',219,337,', '337');
INSERT INTO `xx_area` VALUES ('351', '2014-05-15 00:09:41', '2014-05-15 00:09:41', null, '内蒙古自治区', '内蒙古自治区', ',', null);
INSERT INTO `xx_area` VALUES ('352', '2014-05-15 00:09:42', '2014-05-15 00:09:42', null, '内蒙古自治区呼和浩特市', '呼和浩特市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('353', '2014-05-15 00:09:43', '2014-05-15 00:09:43', null, '内蒙古自治区呼和浩特市新城区', '新城区', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('354', '2014-05-15 00:09:44', '2014-05-15 00:09:44', null, '内蒙古自治区呼和浩特市回民区', '回民区', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('355', '2014-05-15 00:09:45', '2014-05-15 00:09:45', null, '内蒙古自治区呼和浩特市玉泉区', '玉泉区', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('356', '2014-05-15 00:09:46', '2014-05-15 00:09:46', null, '内蒙古自治区呼和浩特市赛罕区', '赛罕区', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('357', '2014-05-15 00:09:47', '2014-05-15 00:09:47', null, '内蒙古自治区呼和浩特市土默特左旗', '土默特左旗', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('358', '2014-05-15 00:09:48', '2014-05-15 00:09:48', null, '内蒙古自治区呼和浩特市托克托县', '托克托县', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('359', '2014-05-15 00:09:49', '2014-05-15 00:09:49', null, '内蒙古自治区呼和浩特市和林格尔县', '和林格尔县', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('360', '2014-05-15 00:09:50', '2014-05-15 00:09:50', null, '内蒙古自治区呼和浩特市清水河县', '清水河县', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('361', '2014-05-15 00:09:51', '2014-05-15 00:09:51', null, '内蒙古自治区呼和浩特市武川县', '武川县', ',351,352,', '352');
INSERT INTO `xx_area` VALUES ('362', '2014-05-15 00:09:52', '2014-05-15 00:09:52', null, '内蒙古自治区包头市', '包头市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('363', '2014-05-15 00:09:53', '2014-05-15 00:09:53', null, '内蒙古自治区包头市东河区', '东河区', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('364', '2014-05-15 00:09:54', '2014-05-15 00:09:54', null, '内蒙古自治区包头市昆都仑区', '昆都仑区', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('365', '2014-05-15 00:09:55', '2014-05-15 00:09:55', null, '内蒙古自治区包头市青山区', '青山区', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('366', '2014-05-15 00:09:56', '2014-05-15 00:09:56', null, '内蒙古自治区包头市石拐区', '石拐区', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('367', '2014-05-15 00:09:57', '2014-05-15 00:09:57', null, '内蒙古自治区包头市白云鄂博矿区', '白云鄂博矿区', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('368', '2014-05-15 00:09:58', '2014-05-15 00:09:58', null, '内蒙古自治区包头市九原区', '九原区', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('369', '2014-05-15 00:09:59', '2014-05-15 00:09:59', null, '内蒙古自治区包头市土默特右旗', '土默特右旗', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('370', '2014-05-15 00:10:00', '2014-05-15 00:10:00', null, '内蒙古自治区包头市固阳县', '固阳县', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('371', '2014-05-15 00:10:01', '2014-05-15 00:10:01', null, '内蒙古自治区包头市达尔罕茂明安联合旗', '达尔罕茂明安联合旗', ',351,362,', '362');
INSERT INTO `xx_area` VALUES ('372', '2014-05-15 00:10:02', '2014-05-15 00:10:02', null, '内蒙古自治区乌海市', '乌海市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('373', '2014-05-15 00:10:03', '2014-05-15 00:10:03', null, '内蒙古自治区乌海市海勃湾区', '海勃湾区', ',351,372,', '372');
INSERT INTO `xx_area` VALUES ('374', '2014-05-15 00:10:04', '2014-05-15 00:10:04', null, '内蒙古自治区乌海市海南区', '海南区', ',351,372,', '372');
INSERT INTO `xx_area` VALUES ('375', '2014-05-15 00:10:05', '2014-05-15 00:10:05', null, '内蒙古自治区乌海市乌达区', '乌达区', ',351,372,', '372');
INSERT INTO `xx_area` VALUES ('376', '2014-05-15 00:10:06', '2014-05-15 00:10:06', null, '内蒙古自治区赤峰市', '赤峰市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('377', '2014-05-15 00:10:07', '2014-05-15 00:10:07', null, '内蒙古自治区赤峰市红山区', '红山区', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('378', '2014-05-15 00:10:08', '2014-05-15 00:10:08', null, '内蒙古自治区赤峰市元宝山区', '元宝山区', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('379', '2014-05-15 00:10:09', '2014-05-15 00:10:09', null, '内蒙古自治区赤峰市松山区', '松山区', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('380', '2014-05-15 00:10:10', '2014-05-15 00:10:10', null, '内蒙古自治区赤峰市阿鲁科尔沁旗', '阿鲁科尔沁旗', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('381', '2014-05-15 00:10:11', '2014-05-15 00:10:11', null, '内蒙古自治区赤峰市巴林左旗', '巴林左旗', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('382', '2014-05-15 00:10:12', '2014-05-15 00:10:12', null, '内蒙古自治区赤峰市巴林右旗', '巴林右旗', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('383', '2014-05-15 00:10:13', '2014-05-15 00:10:13', null, '内蒙古自治区赤峰市林西县', '林西县', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('384', '2014-05-15 00:10:14', '2014-05-15 00:10:14', null, '内蒙古自治区赤峰市克什克腾旗', '克什克腾旗', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('385', '2014-05-15 00:10:15', '2014-05-15 00:10:15', null, '内蒙古自治区赤峰市翁牛特旗', '翁牛特旗', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('386', '2014-05-15 00:10:16', '2014-05-15 00:10:16', null, '内蒙古自治区赤峰市喀喇沁旗', '喀喇沁旗', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('387', '2014-05-15 00:10:17', '2014-05-15 00:10:17', null, '内蒙古自治区赤峰市宁城县', '宁城县', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('388', '2014-05-15 00:10:18', '2014-05-15 00:10:18', null, '内蒙古自治区赤峰市敖汉旗', '敖汉旗', ',351,376,', '376');
INSERT INTO `xx_area` VALUES ('389', '2014-05-15 00:10:19', '2014-05-15 00:10:19', null, '内蒙古自治区通辽市', '通辽市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('390', '2014-05-15 00:10:20', '2014-05-15 00:10:20', null, '内蒙古自治区通辽市科尔沁区', '科尔沁区', ',351,389,', '389');
INSERT INTO `xx_area` VALUES ('391', '2014-05-15 00:10:21', '2014-05-15 00:10:21', null, '内蒙古自治区通辽市科尔沁左翼中旗', '科尔沁左翼中旗', ',351,389,', '389');
INSERT INTO `xx_area` VALUES ('392', '2014-05-15 00:10:22', '2014-05-15 00:10:22', null, '内蒙古自治区通辽市科尔沁左翼后旗', '科尔沁左翼后旗', ',351,389,', '389');
INSERT INTO `xx_area` VALUES ('393', '2014-05-15 00:10:23', '2014-05-15 00:10:23', null, '内蒙古自治区通辽市开鲁县', '开鲁县', ',351,389,', '389');
INSERT INTO `xx_area` VALUES ('394', '2014-05-15 00:10:24', '2014-05-15 00:10:24', null, '内蒙古自治区通辽市库伦旗', '库伦旗', ',351,389,', '389');
INSERT INTO `xx_area` VALUES ('395', '2014-05-15 00:10:25', '2014-05-15 00:10:25', null, '内蒙古自治区通辽市奈曼旗', '奈曼旗', ',351,389,', '389');
INSERT INTO `xx_area` VALUES ('396', '2014-05-15 00:10:26', '2014-05-15 00:10:26', null, '内蒙古自治区通辽市扎鲁特旗', '扎鲁特旗', ',351,389,', '389');
INSERT INTO `xx_area` VALUES ('397', '2014-05-15 00:10:27', '2014-05-15 00:10:27', null, '内蒙古自治区通辽市霍林郭勒市', '霍林郭勒市', ',351,389,', '389');
INSERT INTO `xx_area` VALUES ('398', '2014-05-15 00:10:28', '2014-05-15 00:10:28', null, '内蒙古自治区鄂尔多斯市', '鄂尔多斯市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('399', '2014-05-15 00:10:29', '2014-05-15 00:10:29', null, '内蒙古自治区鄂尔多斯市东胜区', '东胜区', ',351,398,', '398');
INSERT INTO `xx_area` VALUES ('400', '2014-05-15 00:10:30', '2014-05-15 00:10:30', null, '内蒙古自治区鄂尔多斯市达拉特旗', '达拉特旗', ',351,398,', '398');
INSERT INTO `xx_area` VALUES ('401', '2014-05-15 00:10:31', '2014-05-15 00:10:31', null, '内蒙古自治区鄂尔多斯市准格尔旗', '准格尔旗', ',351,398,', '398');
INSERT INTO `xx_area` VALUES ('402', '2014-05-15 00:10:32', '2014-05-15 00:10:32', null, '内蒙古自治区鄂尔多斯市鄂托克前旗', '鄂托克前旗', ',351,398,', '398');
INSERT INTO `xx_area` VALUES ('403', '2014-05-15 00:10:33', '2014-05-15 00:10:33', null, '内蒙古自治区鄂尔多斯市鄂托克旗', '鄂托克旗', ',351,398,', '398');
INSERT INTO `xx_area` VALUES ('404', '2014-05-15 00:10:34', '2014-05-15 00:10:34', null, '内蒙古自治区鄂尔多斯市杭锦旗', '杭锦旗', ',351,398,', '398');
INSERT INTO `xx_area` VALUES ('405', '2014-05-15 00:10:35', '2014-05-15 00:10:35', null, '内蒙古自治区鄂尔多斯市乌审旗', '乌审旗', ',351,398,', '398');
INSERT INTO `xx_area` VALUES ('406', '2014-05-15 00:10:36', '2014-05-15 00:10:36', null, '内蒙古自治区鄂尔多斯市伊金霍洛旗', '伊金霍洛旗', ',351,398,', '398');
INSERT INTO `xx_area` VALUES ('407', '2014-05-15 00:10:37', '2014-05-15 00:10:37', null, '内蒙古自治区呼伦贝尔市', '呼伦贝尔市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('408', '2014-05-15 00:10:38', '2014-05-15 00:10:38', null, '内蒙古自治区呼伦贝尔市海拉尔区', '海拉尔区', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('409', '2014-05-15 00:10:39', '2014-05-15 00:10:39', null, '内蒙古自治区呼伦贝尔市阿荣旗', '阿荣旗', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('410', '2014-05-15 00:10:40', '2014-05-15 00:10:40', null, '内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗', '莫力达瓦达斡尔族自治旗', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('411', '2014-05-15 00:10:41', '2014-05-15 00:10:41', null, '内蒙古自治区呼伦贝尔市鄂伦春自治旗', '鄂伦春自治旗', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('412', '2014-05-15 00:10:42', '2014-05-15 00:10:42', null, '内蒙古自治区呼伦贝尔市鄂温克族自治旗', '鄂温克族自治旗', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('413', '2014-05-15 00:10:43', '2014-05-15 00:10:43', null, '内蒙古自治区呼伦贝尔市陈巴尔虎旗', '陈巴尔虎旗', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('414', '2014-05-15 00:10:44', '2014-05-15 00:10:44', null, '内蒙古自治区呼伦贝尔市新巴尔虎左旗', '新巴尔虎左旗', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('415', '2014-05-15 00:10:45', '2014-05-15 00:10:45', null, '内蒙古自治区呼伦贝尔市新巴尔虎右旗', '新巴尔虎右旗', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('416', '2014-05-15 00:10:46', '2014-05-15 00:10:46', null, '内蒙古自治区呼伦贝尔市满洲里市', '满洲里市', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('417', '2014-05-15 00:10:47', '2014-05-15 00:10:47', null, '内蒙古自治区呼伦贝尔市牙克石市', '牙克石市', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('418', '2014-05-15 00:10:48', '2014-05-15 00:10:48', null, '内蒙古自治区呼伦贝尔市扎兰屯市', '扎兰屯市', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('419', '2014-05-15 00:10:49', '2014-05-15 00:10:49', null, '内蒙古自治区呼伦贝尔市额尔古纳市', '额尔古纳市', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('420', '2014-05-15 00:10:50', '2014-05-15 00:10:50', null, '内蒙古自治区呼伦贝尔市根河市', '根河市', ',351,407,', '407');
INSERT INTO `xx_area` VALUES ('421', '2014-05-15 00:10:51', '2014-05-15 00:10:51', null, '内蒙古自治区巴彦淖尔市', '巴彦淖尔市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('422', '2014-05-15 00:10:52', '2014-05-15 00:10:52', null, '内蒙古自治区巴彦淖尔市临河区', '临河区', ',351,421,', '421');
INSERT INTO `xx_area` VALUES ('423', '2014-05-15 00:10:53', '2014-05-15 00:10:53', null, '内蒙古自治区巴彦淖尔市五原县', '五原县', ',351,421,', '421');
INSERT INTO `xx_area` VALUES ('424', '2014-05-15 00:10:54', '2014-05-15 00:10:54', null, '内蒙古自治区巴彦淖尔市磴口县', '磴口县', ',351,421,', '421');
INSERT INTO `xx_area` VALUES ('425', '2014-05-15 00:10:55', '2014-05-15 00:10:55', null, '内蒙古自治区巴彦淖尔市乌拉特前旗', '乌拉特前旗', ',351,421,', '421');
INSERT INTO `xx_area` VALUES ('426', '2014-05-15 00:10:56', '2014-05-15 00:10:56', null, '内蒙古自治区巴彦淖尔市乌拉特中旗', '乌拉特中旗', ',351,421,', '421');
INSERT INTO `xx_area` VALUES ('427', '2014-05-15 00:10:57', '2014-05-15 00:10:57', null, '内蒙古自治区巴彦淖尔市乌拉特后旗', '乌拉特后旗', ',351,421,', '421');
INSERT INTO `xx_area` VALUES ('428', '2014-05-15 00:10:58', '2014-05-15 00:10:58', null, '内蒙古自治区巴彦淖尔市杭锦后旗', '杭锦后旗', ',351,421,', '421');
INSERT INTO `xx_area` VALUES ('429', '2014-05-15 00:10:59', '2014-05-15 00:10:59', null, '内蒙古自治区乌兰察布市', '乌兰察布市', ',351,', '351');
INSERT INTO `xx_area` VALUES ('430', '2014-05-15 00:11:00', '2014-05-15 00:11:00', null, '内蒙古自治区乌兰察布市集宁区', '集宁区', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('431', '2014-05-15 00:11:01', '2014-05-15 00:11:01', null, '内蒙古自治区乌兰察布市卓资县', '卓资县', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('432', '2014-05-15 00:11:02', '2014-05-15 00:11:02', null, '内蒙古自治区乌兰察布市化德县', '化德县', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('433', '2014-05-15 00:11:03', '2014-05-15 00:11:03', null, '内蒙古自治区乌兰察布市商都县', '商都县', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('434', '2014-05-15 00:11:04', '2014-05-15 00:11:04', null, '内蒙古自治区乌兰察布市兴和县', '兴和县', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('435', '2014-05-15 00:11:05', '2014-05-15 00:11:05', null, '内蒙古自治区乌兰察布市凉城县', '凉城县', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('436', '2014-05-15 00:11:06', '2014-05-15 00:11:06', null, '内蒙古自治区乌兰察布市察哈尔右翼前旗', '察哈尔右翼前旗', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('437', '2014-05-15 00:11:07', '2014-05-15 00:11:07', null, '内蒙古自治区乌兰察布市察哈尔右翼中旗', '察哈尔右翼中旗', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('438', '2014-05-15 00:11:08', '2014-05-15 00:11:08', null, '内蒙古自治区乌兰察布市察哈尔右翼后旗', '察哈尔右翼后旗', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('439', '2014-05-15 00:11:09', '2014-05-15 00:11:09', null, '内蒙古自治区乌兰察布市四子王旗', '四子王旗', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('440', '2014-05-15 00:11:10', '2014-05-15 00:11:10', null, '内蒙古自治区乌兰察布市丰镇市', '丰镇市', ',351,429,', '429');
INSERT INTO `xx_area` VALUES ('441', '2014-05-15 00:11:11', '2014-05-15 00:11:11', null, '内蒙古自治区兴安盟', '兴安盟', ',351,', '351');
INSERT INTO `xx_area` VALUES ('442', '2014-05-15 00:11:12', '2014-05-15 00:11:12', null, '内蒙古自治区兴安盟乌兰浩特市', '乌兰浩特市', ',351,441,', '441');
INSERT INTO `xx_area` VALUES ('443', '2014-05-15 00:11:13', '2014-05-15 00:11:13', null, '内蒙古自治区兴安盟阿尔山市', '阿尔山市', ',351,441,', '441');
INSERT INTO `xx_area` VALUES ('444', '2014-05-15 00:11:14', '2014-05-15 00:11:14', null, '内蒙古自治区兴安盟科尔沁右翼前旗', '科尔沁右翼前旗', ',351,441,', '441');
INSERT INTO `xx_area` VALUES ('445', '2014-05-15 00:11:15', '2014-05-15 00:11:15', null, '内蒙古自治区兴安盟科尔沁右翼中旗', '科尔沁右翼中旗', ',351,441,', '441');
INSERT INTO `xx_area` VALUES ('446', '2014-05-15 00:11:16', '2014-05-15 00:11:16', null, '内蒙古自治区兴安盟扎赉特旗', '扎赉特旗', ',351,441,', '441');
INSERT INTO `xx_area` VALUES ('447', '2014-05-15 00:11:17', '2014-05-15 00:11:17', null, '内蒙古自治区兴安盟突泉县', '突泉县', ',351,441,', '441');
INSERT INTO `xx_area` VALUES ('448', '2014-05-15 00:11:18', '2014-05-15 00:11:18', null, '内蒙古自治区锡林郭勒盟', '锡林郭勒盟', ',351,', '351');
INSERT INTO `xx_area` VALUES ('449', '2014-05-15 00:11:19', '2014-05-15 00:11:19', null, '内蒙古自治区锡林郭勒盟二连浩特市', '二连浩特市', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('450', '2014-05-15 00:11:20', '2014-05-15 00:11:20', null, '内蒙古自治区锡林郭勒盟锡林浩特市', '锡林浩特市', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('451', '2014-05-15 00:11:21', '2014-05-15 00:11:21', null, '内蒙古自治区锡林郭勒盟阿巴嘎旗', '阿巴嘎旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('452', '2014-05-15 00:11:22', '2014-05-15 00:11:22', null, '内蒙古自治区锡林郭勒盟苏尼特左旗', '苏尼特左旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('453', '2014-05-15 00:11:23', '2014-05-15 00:11:23', null, '内蒙古自治区锡林郭勒盟苏尼特右旗', '苏尼特右旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('454', '2014-05-15 00:11:24', '2014-05-15 00:11:24', null, '内蒙古自治区锡林郭勒盟东乌珠穆沁旗', '东乌珠穆沁旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('455', '2014-05-15 00:11:25', '2014-05-15 00:11:25', null, '内蒙古自治区锡林郭勒盟西乌珠穆沁旗', '西乌珠穆沁旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('456', '2014-05-15 00:11:26', '2014-05-15 00:11:26', null, '内蒙古自治区锡林郭勒盟太仆寺旗', '太仆寺旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('457', '2014-05-15 00:11:27', '2014-05-15 00:11:27', null, '内蒙古自治区锡林郭勒盟镶黄旗', '镶黄旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('458', '2014-05-15 00:11:28', '2014-05-15 00:11:28', null, '内蒙古自治区锡林郭勒盟正镶白旗', '正镶白旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('459', '2014-05-15 00:11:29', '2014-05-15 00:11:29', null, '内蒙古自治区锡林郭勒盟正蓝旗', '正蓝旗', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('460', '2014-05-15 00:11:30', '2014-05-15 00:11:30', null, '内蒙古自治区锡林郭勒盟多伦县', '多伦县', ',351,448,', '448');
INSERT INTO `xx_area` VALUES ('461', '2014-05-15 00:11:31', '2014-05-15 00:11:31', null, '内蒙古自治区阿拉善盟', '阿拉善盟', ',351,', '351');
INSERT INTO `xx_area` VALUES ('462', '2014-05-15 00:11:32', '2014-05-15 00:11:32', null, '内蒙古自治区阿拉善盟阿拉善左旗', '阿拉善左旗', ',351,461,', '461');
INSERT INTO `xx_area` VALUES ('463', '2014-05-15 00:11:33', '2014-05-15 00:11:33', null, '内蒙古自治区阿拉善盟阿拉善右旗', '阿拉善右旗', ',351,461,', '461');
INSERT INTO `xx_area` VALUES ('464', '2014-05-15 00:11:34', '2014-05-15 00:11:34', null, '内蒙古自治区阿拉善盟额济纳旗', '额济纳旗', ',351,461,', '461');
INSERT INTO `xx_area` VALUES ('465', '2014-05-15 00:11:35', '2014-05-15 00:11:35', null, '辽宁省', '辽宁省', ',', null);
INSERT INTO `xx_area` VALUES ('466', '2014-05-15 00:11:36', '2014-05-15 00:11:36', null, '辽宁省沈阳市', '沈阳市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('467', '2014-05-15 00:11:37', '2014-05-15 00:11:37', null, '辽宁省沈阳市和平区', '和平区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('468', '2014-05-15 00:11:38', '2014-05-15 00:11:38', null, '辽宁省沈阳市沈河区', '沈河区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('469', '2014-05-15 00:11:39', '2014-05-15 00:11:39', null, '辽宁省沈阳市大东区', '大东区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('470', '2014-05-15 00:11:40', '2014-05-15 00:11:40', null, '辽宁省沈阳市皇姑区', '皇姑区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('471', '2014-05-15 00:11:41', '2014-05-15 00:11:41', null, '辽宁省沈阳市铁西区', '铁西区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('472', '2014-05-15 00:11:42', '2014-05-15 00:11:42', null, '辽宁省沈阳市苏家屯区', '苏家屯区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('473', '2014-05-15 00:11:43', '2014-05-15 00:11:43', null, '辽宁省沈阳市东陵区', '东陵区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('474', '2014-05-15 00:11:44', '2014-05-15 00:11:44', null, '辽宁省沈阳市沈北新区', '沈北新区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('475', '2014-05-15 00:11:45', '2014-05-15 00:11:45', null, '辽宁省沈阳市于洪区', '于洪区', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('476', '2014-05-15 00:11:46', '2014-05-15 00:11:46', null, '辽宁省沈阳市辽中县', '辽中县', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('477', '2014-05-15 00:11:47', '2014-05-15 00:11:47', null, '辽宁省沈阳市康平县', '康平县', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('478', '2014-05-15 00:11:48', '2014-05-15 00:11:48', null, '辽宁省沈阳市法库县', '法库县', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('479', '2014-05-15 00:11:49', '2014-05-15 00:11:49', null, '辽宁省沈阳市新民市', '新民市', ',465,466,', '466');
INSERT INTO `xx_area` VALUES ('480', '2014-05-15 00:11:50', '2014-05-15 00:11:50', null, '辽宁省大连市', '大连市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('481', '2014-05-15 00:11:51', '2014-05-15 00:11:51', null, '辽宁省大连市中山区', '中山区', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('482', '2014-05-15 00:11:52', '2014-05-15 00:11:52', null, '辽宁省大连市西岗区', '西岗区', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('483', '2014-05-15 00:11:53', '2014-05-15 00:11:53', null, '辽宁省大连市沙河口区', '沙河口区', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('484', '2014-05-15 00:11:54', '2014-05-15 00:11:54', null, '辽宁省大连市甘井子区', '甘井子区', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('485', '2014-05-15 00:11:55', '2014-05-15 00:11:55', null, '辽宁省大连市旅顺口区', '旅顺口区', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('486', '2014-05-15 00:11:56', '2014-05-15 00:11:56', null, '辽宁省大连市金州区', '金州区', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('487', '2014-05-15 00:11:57', '2014-05-15 00:11:57', null, '辽宁省大连市长海县', '长海县', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('488', '2014-05-15 00:11:58', '2014-05-15 00:11:58', null, '辽宁省大连市瓦房店市', '瓦房店市', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('489', '2014-05-15 00:11:59', '2014-05-15 00:11:59', null, '辽宁省大连市普兰店市', '普兰店市', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('490', '2014-05-15 00:12:00', '2014-05-15 00:12:00', null, '辽宁省大连市庄河市', '庄河市', ',465,480,', '480');
INSERT INTO `xx_area` VALUES ('491', '2014-05-15 00:12:01', '2014-05-15 00:12:01', null, '辽宁省鞍山市', '鞍山市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('492', '2014-05-15 00:12:02', '2014-05-15 00:12:02', null, '辽宁省鞍山市铁东区', '铁东区', ',465,491,', '491');
INSERT INTO `xx_area` VALUES ('493', '2014-05-15 00:12:03', '2014-05-15 00:12:03', null, '辽宁省鞍山市铁西区', '铁西区', ',465,491,', '491');
INSERT INTO `xx_area` VALUES ('494', '2014-05-15 00:12:04', '2014-05-15 00:12:04', null, '辽宁省鞍山市立山区', '立山区', ',465,491,', '491');
INSERT INTO `xx_area` VALUES ('495', '2014-05-15 00:12:05', '2014-05-15 00:12:05', null, '辽宁省鞍山市千山区', '千山区', ',465,491,', '491');
INSERT INTO `xx_area` VALUES ('496', '2014-05-15 00:12:06', '2014-05-15 00:12:06', null, '辽宁省鞍山市台安县', '台安县', ',465,491,', '491');
INSERT INTO `xx_area` VALUES ('497', '2014-05-15 00:12:07', '2014-05-15 00:12:07', null, '辽宁省鞍山市岫岩满族自治县', '岫岩满族自治县', ',465,491,', '491');
INSERT INTO `xx_area` VALUES ('498', '2014-05-15 00:12:08', '2014-05-15 00:12:08', null, '辽宁省鞍山市海城市', '海城市', ',465,491,', '491');
INSERT INTO `xx_area` VALUES ('499', '2014-05-15 00:12:09', '2014-05-15 00:12:09', null, '辽宁省抚顺市', '抚顺市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('500', '2014-05-15 00:12:10', '2014-05-15 00:12:10', null, '辽宁省抚顺市新抚区', '新抚区', ',465,499,', '499');
INSERT INTO `xx_area` VALUES ('501', '2014-05-15 00:12:11', '2014-05-15 00:12:11', null, '辽宁省抚顺市东洲区', '东洲区', ',465,499,', '499');
INSERT INTO `xx_area` VALUES ('502', '2014-05-15 00:12:12', '2014-05-15 00:12:12', null, '辽宁省抚顺市望花区', '望花区', ',465,499,', '499');
INSERT INTO `xx_area` VALUES ('503', '2014-05-15 00:12:13', '2014-05-15 00:12:13', null, '辽宁省抚顺市顺城区', '顺城区', ',465,499,', '499');
INSERT INTO `xx_area` VALUES ('504', '2014-05-15 00:12:14', '2014-05-15 00:12:14', null, '辽宁省抚顺市抚顺县', '抚顺县', ',465,499,', '499');
INSERT INTO `xx_area` VALUES ('505', '2014-05-15 00:12:15', '2014-05-15 00:12:15', null, '辽宁省抚顺市新宾满族自治县', '新宾满族自治县', ',465,499,', '499');
INSERT INTO `xx_area` VALUES ('506', '2014-05-15 00:12:16', '2014-05-15 00:12:16', null, '辽宁省抚顺市清原满族自治县', '清原满族自治县', ',465,499,', '499');
INSERT INTO `xx_area` VALUES ('507', '2014-05-15 00:12:17', '2014-05-15 00:12:17', null, '辽宁省本溪市', '本溪市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('508', '2014-05-15 00:12:18', '2014-05-15 00:12:18', null, '辽宁省本溪市平山区', '平山区', ',465,507,', '507');
INSERT INTO `xx_area` VALUES ('509', '2014-05-15 00:12:19', '2014-05-15 00:12:19', null, '辽宁省本溪市溪湖区', '溪湖区', ',465,507,', '507');
INSERT INTO `xx_area` VALUES ('510', '2014-05-15 00:12:20', '2014-05-15 00:12:20', null, '辽宁省本溪市明山区', '明山区', ',465,507,', '507');
INSERT INTO `xx_area` VALUES ('511', '2014-05-15 00:12:21', '2014-05-15 00:12:21', null, '辽宁省本溪市南芬区', '南芬区', ',465,507,', '507');
INSERT INTO `xx_area` VALUES ('512', '2014-05-15 00:12:22', '2014-05-15 00:12:22', null, '辽宁省本溪市本溪满族自治县', '本溪满族自治县', ',465,507,', '507');
INSERT INTO `xx_area` VALUES ('513', '2014-05-15 00:12:23', '2014-05-15 00:12:23', null, '辽宁省本溪市桓仁满族自治县', '桓仁满族自治县', ',465,507,', '507');
INSERT INTO `xx_area` VALUES ('514', '2014-05-15 00:12:24', '2014-05-15 00:12:24', null, '辽宁省丹东市', '丹东市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('515', '2014-05-15 00:12:25', '2014-05-15 00:12:25', null, '辽宁省丹东市元宝区', '元宝区', ',465,514,', '514');
INSERT INTO `xx_area` VALUES ('516', '2014-05-15 00:12:26', '2014-05-15 00:12:26', null, '辽宁省丹东市振兴区', '振兴区', ',465,514,', '514');
INSERT INTO `xx_area` VALUES ('517', '2014-05-15 00:12:27', '2014-05-15 00:12:27', null, '辽宁省丹东市振安区', '振安区', ',465,514,', '514');
INSERT INTO `xx_area` VALUES ('518', '2014-05-15 00:12:28', '2014-05-15 00:12:28', null, '辽宁省丹东市宽甸满族自治县', '宽甸满族自治县', ',465,514,', '514');
INSERT INTO `xx_area` VALUES ('519', '2014-05-15 00:12:29', '2014-05-15 00:12:29', null, '辽宁省丹东市东港市', '东港市', ',465,514,', '514');
INSERT INTO `xx_area` VALUES ('520', '2014-05-15 00:12:30', '2014-05-15 00:12:30', null, '辽宁省丹东市凤城市', '凤城市', ',465,514,', '514');
INSERT INTO `xx_area` VALUES ('521', '2014-05-15 00:12:31', '2014-05-15 00:12:31', null, '辽宁省锦州市', '锦州市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('522', '2014-05-15 00:12:32', '2014-05-15 00:12:32', null, '辽宁省锦州市古塔区', '古塔区', ',465,521,', '521');
INSERT INTO `xx_area` VALUES ('523', '2014-05-15 00:12:33', '2014-05-15 00:12:33', null, '辽宁省锦州市凌河区', '凌河区', ',465,521,', '521');
INSERT INTO `xx_area` VALUES ('524', '2014-05-15 00:12:34', '2014-05-15 00:12:34', null, '辽宁省锦州市太和区', '太和区', ',465,521,', '521');
INSERT INTO `xx_area` VALUES ('525', '2014-05-15 00:12:35', '2014-05-15 00:12:35', null, '辽宁省锦州市黑山县', '黑山县', ',465,521,', '521');
INSERT INTO `xx_area` VALUES ('526', '2014-05-15 00:12:36', '2014-05-15 00:12:36', null, '辽宁省锦州市义县', '义县', ',465,521,', '521');
INSERT INTO `xx_area` VALUES ('527', '2014-05-15 00:12:37', '2014-05-15 00:12:37', null, '辽宁省锦州市凌海市', '凌海市', ',465,521,', '521');
INSERT INTO `xx_area` VALUES ('528', '2014-05-15 00:12:38', '2014-05-15 00:12:38', null, '辽宁省锦州市北镇市', '北镇市', ',465,521,', '521');
INSERT INTO `xx_area` VALUES ('529', '2014-05-15 00:12:39', '2014-05-15 00:12:39', null, '辽宁省营口市', '营口市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('530', '2014-05-15 00:12:40', '2014-05-15 00:12:40', null, '辽宁省营口市站前区', '站前区', ',465,529,', '529');
INSERT INTO `xx_area` VALUES ('531', '2014-05-15 00:12:41', '2014-05-15 00:12:41', null, '辽宁省营口市西市区', '西市区', ',465,529,', '529');
INSERT INTO `xx_area` VALUES ('532', '2014-05-15 00:12:42', '2014-05-15 00:12:42', null, '辽宁省营口市鲅鱼圈区', '鲅鱼圈区', ',465,529,', '529');
INSERT INTO `xx_area` VALUES ('533', '2014-05-15 00:12:43', '2014-05-15 00:12:43', null, '辽宁省营口市老边区', '老边区', ',465,529,', '529');
INSERT INTO `xx_area` VALUES ('534', '2014-05-15 00:12:44', '2014-05-15 00:12:44', null, '辽宁省营口市盖州市', '盖州市', ',465,529,', '529');
INSERT INTO `xx_area` VALUES ('535', '2014-05-15 00:12:45', '2014-05-15 00:12:45', null, '辽宁省营口市大石桥市', '大石桥市', ',465,529,', '529');
INSERT INTO `xx_area` VALUES ('536', '2014-05-15 00:12:46', '2014-05-15 00:12:46', null, '辽宁省阜新市', '阜新市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('537', '2014-05-15 00:12:47', '2014-05-15 00:12:47', null, '辽宁省阜新市海州区', '海州区', ',465,536,', '536');
INSERT INTO `xx_area` VALUES ('538', '2014-05-15 00:12:48', '2014-05-15 00:12:48', null, '辽宁省阜新市新邱区', '新邱区', ',465,536,', '536');
INSERT INTO `xx_area` VALUES ('539', '2014-05-15 00:12:49', '2014-05-15 00:12:49', null, '辽宁省阜新市太平区', '太平区', ',465,536,', '536');
INSERT INTO `xx_area` VALUES ('540', '2014-05-15 00:12:50', '2014-05-15 00:12:50', null, '辽宁省阜新市清河门区', '清河门区', ',465,536,', '536');
INSERT INTO `xx_area` VALUES ('541', '2014-05-15 00:12:51', '2014-05-15 00:12:51', null, '辽宁省阜新市细河区', '细河区', ',465,536,', '536');
INSERT INTO `xx_area` VALUES ('542', '2014-05-15 00:12:52', '2014-05-15 00:12:52', null, '辽宁省阜新市阜新蒙古族自治县', '阜新蒙古族自治县', ',465,536,', '536');
INSERT INTO `xx_area` VALUES ('543', '2014-05-15 00:12:53', '2014-05-15 00:12:53', null, '辽宁省阜新市彰武县', '彰武县', ',465,536,', '536');
INSERT INTO `xx_area` VALUES ('544', '2014-05-15 00:12:54', '2014-05-15 00:12:54', null, '辽宁省辽阳市', '辽阳市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('545', '2014-05-15 00:12:55', '2014-05-15 00:12:55', null, '辽宁省辽阳市白塔区', '白塔区', ',465,544,', '544');
INSERT INTO `xx_area` VALUES ('546', '2014-05-15 00:12:56', '2014-05-15 00:12:56', null, '辽宁省辽阳市文圣区', '文圣区', ',465,544,', '544');
INSERT INTO `xx_area` VALUES ('547', '2014-05-15 00:12:57', '2014-05-15 00:12:57', null, '辽宁省辽阳市宏伟区', '宏伟区', ',465,544,', '544');
INSERT INTO `xx_area` VALUES ('548', '2014-05-15 00:12:58', '2014-05-15 00:12:58', null, '辽宁省辽阳市弓长岭区', '弓长岭区', ',465,544,', '544');
INSERT INTO `xx_area` VALUES ('549', '2014-05-15 00:12:59', '2014-05-15 00:12:59', null, '辽宁省辽阳市太子河区', '太子河区', ',465,544,', '544');
INSERT INTO `xx_area` VALUES ('550', '2014-05-15 00:13:00', '2014-05-15 00:13:00', null, '辽宁省辽阳市辽阳县', '辽阳县', ',465,544,', '544');
INSERT INTO `xx_area` VALUES ('551', '2014-05-15 00:13:01', '2014-05-15 00:13:01', null, '辽宁省辽阳市灯塔市', '灯塔市', ',465,544,', '544');
INSERT INTO `xx_area` VALUES ('552', '2014-05-15 00:13:02', '2014-05-15 00:13:02', null, '辽宁省盘锦市', '盘锦市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('553', '2014-05-15 00:13:03', '2014-05-15 00:13:03', null, '辽宁省盘锦市双台子区', '双台子区', ',465,552,', '552');
INSERT INTO `xx_area` VALUES ('554', '2014-05-15 00:13:04', '2014-05-15 00:13:04', null, '辽宁省盘锦市兴隆台区', '兴隆台区', ',465,552,', '552');
INSERT INTO `xx_area` VALUES ('555', '2014-05-15 00:13:05', '2014-05-15 00:13:05', null, '辽宁省盘锦市大洼县', '大洼县', ',465,552,', '552');
INSERT INTO `xx_area` VALUES ('556', '2014-05-15 00:13:06', '2014-05-15 00:13:06', null, '辽宁省盘锦市盘山县', '盘山县', ',465,552,', '552');
INSERT INTO `xx_area` VALUES ('557', '2014-05-15 00:13:07', '2014-05-15 00:13:07', null, '辽宁省铁岭市', '铁岭市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('558', '2014-05-15 00:13:08', '2014-05-15 00:13:08', null, '辽宁省铁岭市银州区', '银州区', ',465,557,', '557');
INSERT INTO `xx_area` VALUES ('559', '2014-05-15 00:13:09', '2014-05-15 00:13:09', null, '辽宁省铁岭市清河区', '清河区', ',465,557,', '557');
INSERT INTO `xx_area` VALUES ('560', '2014-05-15 00:13:10', '2014-05-15 00:13:10', null, '辽宁省铁岭市铁岭县', '铁岭县', ',465,557,', '557');
INSERT INTO `xx_area` VALUES ('561', '2014-05-15 00:13:11', '2014-05-15 00:13:11', null, '辽宁省铁岭市西丰县', '西丰县', ',465,557,', '557');
INSERT INTO `xx_area` VALUES ('562', '2014-05-15 00:13:12', '2014-05-15 00:13:12', null, '辽宁省铁岭市昌图县', '昌图县', ',465,557,', '557');
INSERT INTO `xx_area` VALUES ('563', '2014-05-15 00:13:13', '2014-05-15 00:13:13', null, '辽宁省铁岭市调兵山市', '调兵山市', ',465,557,', '557');
INSERT INTO `xx_area` VALUES ('564', '2014-05-15 00:13:14', '2014-05-15 00:13:14', null, '辽宁省铁岭市开原市', '开原市', ',465,557,', '557');
INSERT INTO `xx_area` VALUES ('565', '2014-05-15 00:13:15', '2014-05-15 00:13:15', null, '辽宁省朝阳市', '朝阳市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('566', '2014-05-15 00:13:16', '2014-05-15 00:13:16', null, '辽宁省朝阳市双塔区', '双塔区', ',465,565,', '565');
INSERT INTO `xx_area` VALUES ('567', '2014-05-15 00:13:17', '2014-05-15 00:13:17', null, '辽宁省朝阳市龙城区', '龙城区', ',465,565,', '565');
INSERT INTO `xx_area` VALUES ('568', '2014-05-15 00:13:18', '2014-05-15 00:13:18', null, '辽宁省朝阳市朝阳县', '朝阳县', ',465,565,', '565');
INSERT INTO `xx_area` VALUES ('569', '2014-05-15 00:13:19', '2014-05-15 00:13:19', null, '辽宁省朝阳市建平县', '建平县', ',465,565,', '565');
INSERT INTO `xx_area` VALUES ('570', '2014-05-15 00:13:20', '2014-05-15 00:13:20', null, '辽宁省朝阳市喀喇沁左翼蒙古族自治县', '喀喇沁左翼蒙古族自治县', ',465,565,', '565');
INSERT INTO `xx_area` VALUES ('571', '2014-05-15 00:13:21', '2014-05-15 00:13:21', null, '辽宁省朝阳市北票市', '北票市', ',465,565,', '565');
INSERT INTO `xx_area` VALUES ('572', '2014-05-15 00:13:22', '2014-05-15 00:13:22', null, '辽宁省朝阳市凌源市', '凌源市', ',465,565,', '565');
INSERT INTO `xx_area` VALUES ('573', '2014-05-15 00:13:23', '2014-05-15 00:13:23', null, '辽宁省葫芦岛市', '葫芦岛市', ',465,', '465');
INSERT INTO `xx_area` VALUES ('574', '2014-05-15 00:13:24', '2014-05-15 00:13:24', null, '辽宁省葫芦岛市连山区', '连山区', ',465,573,', '573');
INSERT INTO `xx_area` VALUES ('575', '2014-05-15 00:13:25', '2014-05-15 00:13:25', null, '辽宁省葫芦岛市龙港区', '龙港区', ',465,573,', '573');
INSERT INTO `xx_area` VALUES ('576', '2014-05-15 00:13:26', '2014-05-15 00:13:26', null, '辽宁省葫芦岛市南票区', '南票区', ',465,573,', '573');
INSERT INTO `xx_area` VALUES ('577', '2014-05-15 00:13:27', '2014-05-15 00:13:27', null, '辽宁省葫芦岛市绥中县', '绥中县', ',465,573,', '573');
INSERT INTO `xx_area` VALUES ('578', '2014-05-15 00:13:28', '2014-05-15 00:13:28', null, '辽宁省葫芦岛市建昌县', '建昌县', ',465,573,', '573');
INSERT INTO `xx_area` VALUES ('579', '2014-05-15 00:13:29', '2014-05-15 00:13:29', null, '辽宁省葫芦岛市兴城市', '兴城市', ',465,573,', '573');
INSERT INTO `xx_area` VALUES ('580', '2014-05-15 00:13:30', '2014-05-15 00:13:30', null, '吉林省', '吉林省', ',', null);
INSERT INTO `xx_area` VALUES ('581', '2014-05-15 00:13:31', '2014-05-15 00:13:31', null, '吉林省长春市', '长春市', ',580,', '580');
INSERT INTO `xx_area` VALUES ('582', '2014-05-15 00:13:32', '2014-05-15 00:13:32', null, '吉林省长春市南关区', '南关区', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('583', '2014-05-15 00:13:33', '2014-05-15 00:13:33', null, '吉林省长春市宽城区', '宽城区', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('584', '2014-05-15 00:13:34', '2014-05-15 00:13:34', null, '吉林省长春市朝阳区', '朝阳区', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('585', '2014-05-15 00:13:35', '2014-05-15 00:13:35', null, '吉林省长春市二道区', '二道区', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('586', '2014-05-15 00:13:36', '2014-05-15 00:13:36', null, '吉林省长春市绿园区', '绿园区', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('587', '2014-05-15 00:13:37', '2014-05-15 00:13:37', null, '吉林省长春市双阳区', '双阳区', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('588', '2014-05-15 00:13:38', '2014-05-15 00:13:38', null, '吉林省长春市农安县', '农安县', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('589', '2014-05-15 00:13:39', '2014-05-15 00:13:39', null, '吉林省长春市九台市', '九台市', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('590', '2014-05-15 00:13:40', '2014-05-15 00:13:40', null, '吉林省长春市榆树市', '榆树市', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('591', '2014-05-15 00:13:41', '2014-05-15 00:13:41', null, '吉林省长春市德惠市', '德惠市', ',580,581,', '581');
INSERT INTO `xx_area` VALUES ('592', '2014-05-15 00:13:42', '2014-05-15 00:13:42', null, '吉林省吉林市', '吉林市', ',580,', '580');
INSERT INTO `xx_area` VALUES ('593', '2014-05-15 00:13:43', '2014-05-15 00:13:43', null, '吉林省吉林市昌邑区', '昌邑区', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('594', '2014-05-15 00:13:44', '2014-05-15 00:13:44', null, '吉林省吉林市龙潭区', '龙潭区', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('595', '2014-05-15 00:13:45', '2014-05-15 00:13:45', null, '吉林省吉林市船营区', '船营区', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('596', '2014-05-15 00:13:46', '2014-05-15 00:13:46', null, '吉林省吉林市丰满区', '丰满区', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('597', '2014-05-15 00:13:47', '2014-05-15 00:13:47', null, '吉林省吉林市永吉县', '永吉县', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('598', '2014-05-15 00:13:48', '2014-05-15 00:13:48', null, '吉林省吉林市蛟河市', '蛟河市', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('599', '2014-05-15 00:13:49', '2014-05-15 00:13:49', null, '吉林省吉林市桦甸市', '桦甸市', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('600', '2014-05-15 00:13:50', '2014-05-15 00:13:50', null, '吉林省吉林市舒兰市', '舒兰市', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('601', '2014-05-15 00:13:51', '2014-05-15 00:13:51', null, '吉林省吉林市磐石市', '磐石市', ',580,592,', '592');
INSERT INTO `xx_area` VALUES ('602', '2014-05-15 00:13:52', '2014-05-15 00:13:52', null, '吉林省四平市', '四平市', ',580,', '580');
INSERT INTO `xx_area` VALUES ('603', '2014-05-15 00:13:53', '2014-05-15 00:13:53', null, '吉林省四平市铁西区', '铁西区', ',580,602,', '602');
INSERT INTO `xx_area` VALUES ('604', '2014-05-15 00:13:54', '2014-05-15 00:13:54', null, '吉林省四平市铁东区', '铁东区', ',580,602,', '602');
INSERT INTO `xx_area` VALUES ('605', '2014-05-15 00:13:55', '2014-05-15 00:13:55', null, '吉林省四平市梨树县', '梨树县', ',580,602,', '602');
INSERT INTO `xx_area` VALUES ('606', '2014-05-15 00:13:56', '2014-05-15 00:13:56', null, '吉林省四平市伊通满族自治县', '伊通满族自治县', ',580,602,', '602');
INSERT INTO `xx_area` VALUES ('607', '2014-05-15 00:13:57', '2014-05-15 00:13:57', null, '吉林省四平市公主岭市', '公主岭市', ',580,602,', '602');
INSERT INTO `xx_area` VALUES ('608', '2014-05-15 00:13:58', '2014-05-15 00:13:58', null, '吉林省四平市双辽市', '双辽市', ',580,602,', '602');
INSERT INTO `xx_area` VALUES ('609', '2014-05-15 00:13:59', '2014-05-15 00:13:59', null, '吉林省辽源市', '辽源市', ',580,', '580');
INSERT INTO `xx_area` VALUES ('610', '2014-05-15 00:14:00', '2014-05-15 00:14:00', null, '吉林省辽源市龙山区', '龙山区', ',580,609,', '609');
INSERT INTO `xx_area` VALUES ('611', '2014-05-15 00:14:01', '2014-05-15 00:14:01', null, '吉林省辽源市西安区', '西安区', ',580,609,', '609');
INSERT INTO `xx_area` VALUES ('612', '2014-05-15 00:14:02', '2014-05-15 00:14:02', null, '吉林省辽源市东丰县', '东丰县', ',580,609,', '609');
INSERT INTO `xx_area` VALUES ('613', '2014-05-15 00:14:03', '2014-05-15 00:14:03', null, '吉林省辽源市东辽县', '东辽县', ',580,609,', '609');
INSERT INTO `xx_area` VALUES ('614', '2014-05-15 00:14:04', '2014-05-15 00:14:04', null, '吉林省通化市', '通化市', ',580,', '580');
INSERT INTO `xx_area` VALUES ('615', '2014-05-15 00:14:05', '2014-05-15 00:14:05', null, '吉林省通化市东昌区', '东昌区', ',580,614,', '614');
INSERT INTO `xx_area` VALUES ('616', '2014-05-15 00:14:06', '2014-05-15 00:14:06', null, '吉林省通化市二道江区', '二道江区', ',580,614,', '614');
INSERT INTO `xx_area` VALUES ('617', '2014-05-15 00:14:07', '2014-05-15 00:14:07', null, '吉林省通化市通化县', '通化县', ',580,614,', '614');
INSERT INTO `xx_area` VALUES ('618', '2014-05-15 00:14:08', '2014-05-15 00:14:08', null, '吉林省通化市辉南县', '辉南县', ',580,614,', '614');
INSERT INTO `xx_area` VALUES ('619', '2014-05-15 00:14:09', '2014-05-15 00:14:09', null, '吉林省通化市柳河县', '柳河县', ',580,614,', '614');
INSERT INTO `xx_area` VALUES ('620', '2014-05-15 00:14:10', '2014-05-15 00:14:10', null, '吉林省通化市梅河口市', '梅河口市', ',580,614,', '614');
INSERT INTO `xx_area` VALUES ('621', '2014-05-15 00:14:11', '2014-05-15 00:14:11', null, '吉林省通化市集安市', '集安市', ',580,614,', '614');
INSERT INTO `xx_area` VALUES ('622', '2014-05-15 00:14:12', '2014-05-15 00:14:12', null, '吉林省白山市', '白山市', ',580,', '580');
INSERT INTO `xx_area` VALUES ('623', '2014-05-15 00:14:13', '2014-05-15 00:14:13', null, '吉林省白山市浑江区', '浑江区', ',580,622,', '622');
INSERT INTO `xx_area` VALUES ('624', '2014-05-15 00:14:14', '2014-05-15 00:14:14', null, '吉林省白山市江源区', '江源区', ',580,622,', '622');
INSERT INTO `xx_area` VALUES ('625', '2014-05-15 00:14:15', '2014-05-15 00:14:15', null, '吉林省白山市抚松县', '抚松县', ',580,622,', '622');
INSERT INTO `xx_area` VALUES ('626', '2014-05-15 00:14:16', '2014-05-15 00:14:16', null, '吉林省白山市靖宇县', '靖宇县', ',580,622,', '622');
INSERT INTO `xx_area` VALUES ('627', '2014-05-15 00:14:17', '2014-05-15 00:14:17', null, '吉林省白山市长白朝鲜族自治县', '长白朝鲜族自治县', ',580,622,', '622');
INSERT INTO `xx_area` VALUES ('628', '2014-05-15 00:14:18', '2014-05-15 00:14:18', null, '吉林省白山市临江市', '临江市', ',580,622,', '622');
INSERT INTO `xx_area` VALUES ('629', '2014-05-15 00:14:19', '2014-05-15 00:14:19', null, '吉林省松原市', '松原市', ',580,', '580');
INSERT INTO `xx_area` VALUES ('630', '2014-05-15 00:14:20', '2014-05-15 00:14:20', null, '吉林省松原市宁江区', '宁江区', ',580,629,', '629');
INSERT INTO `xx_area` VALUES ('631', '2014-05-15 00:14:21', '2014-05-15 00:14:21', null, '吉林省松原市前郭尔罗斯蒙古族自治县', '前郭尔罗斯蒙古族自治县', ',580,629,', '629');
INSERT INTO `xx_area` VALUES ('632', '2014-05-15 00:14:22', '2014-05-15 00:14:22', null, '吉林省松原市长岭县', '长岭县', ',580,629,', '629');
INSERT INTO `xx_area` VALUES ('633', '2014-05-15 00:14:23', '2014-05-15 00:14:23', null, '吉林省松原市乾安县', '乾安县', ',580,629,', '629');
INSERT INTO `xx_area` VALUES ('634', '2014-05-15 00:14:24', '2014-05-15 00:14:24', null, '吉林省松原市扶余县', '扶余县', ',580,629,', '629');
INSERT INTO `xx_area` VALUES ('635', '2014-05-15 00:14:25', '2014-05-15 00:14:25', null, '吉林省白城市', '白城市', ',580,', '580');
INSERT INTO `xx_area` VALUES ('636', '2014-05-15 00:14:26', '2014-05-15 00:14:26', null, '吉林省白城市洮北区', '洮北区', ',580,635,', '635');
INSERT INTO `xx_area` VALUES ('637', '2014-05-15 00:14:27', '2014-05-15 00:14:27', null, '吉林省白城市镇赉县', '镇赉县', ',580,635,', '635');
INSERT INTO `xx_area` VALUES ('638', '2014-05-15 00:14:28', '2014-05-15 00:14:28', null, '吉林省白城市通榆县', '通榆县', ',580,635,', '635');
INSERT INTO `xx_area` VALUES ('639', '2014-05-15 00:14:29', '2014-05-15 00:14:29', null, '吉林省白城市洮南市', '洮南市', ',580,635,', '635');
INSERT INTO `xx_area` VALUES ('640', '2014-05-15 00:14:30', '2014-05-15 00:14:30', null, '吉林省白城市大安市', '大安市', ',580,635,', '635');
INSERT INTO `xx_area` VALUES ('641', '2014-05-15 00:14:31', '2014-05-15 00:14:31', null, '吉林省延边朝鲜族自治州', '延边朝鲜族自治州', ',580,', '580');
INSERT INTO `xx_area` VALUES ('642', '2014-05-15 00:14:32', '2014-05-15 00:14:32', null, '吉林省延边朝鲜族自治州延吉市', '延吉市', ',580,641,', '641');
INSERT INTO `xx_area` VALUES ('643', '2014-05-15 00:14:33', '2014-05-15 00:14:33', null, '吉林省延边朝鲜族自治州图们市', '图们市', ',580,641,', '641');
INSERT INTO `xx_area` VALUES ('644', '2014-05-15 00:14:34', '2014-05-15 00:14:34', null, '吉林省延边朝鲜族自治州敦化市', '敦化市', ',580,641,', '641');
INSERT INTO `xx_area` VALUES ('645', '2014-05-15 00:14:35', '2014-05-15 00:14:35', null, '吉林省延边朝鲜族自治州珲春市', '珲春市', ',580,641,', '641');
INSERT INTO `xx_area` VALUES ('646', '2014-05-15 00:14:36', '2014-05-15 00:14:36', null, '吉林省延边朝鲜族自治州龙井市', '龙井市', ',580,641,', '641');
INSERT INTO `xx_area` VALUES ('647', '2014-05-15 00:14:37', '2014-05-15 00:14:37', null, '吉林省延边朝鲜族自治州和龙市', '和龙市', ',580,641,', '641');
INSERT INTO `xx_area` VALUES ('648', '2014-05-15 00:14:38', '2014-05-15 00:14:38', null, '吉林省延边朝鲜族自治州汪清县', '汪清县', ',580,641,', '641');
INSERT INTO `xx_area` VALUES ('649', '2014-05-15 00:14:39', '2014-05-15 00:14:39', null, '吉林省延边朝鲜族自治州安图县', '安图县', ',580,641,', '641');
INSERT INTO `xx_area` VALUES ('650', '2014-05-15 00:14:40', '2014-05-15 00:14:40', null, '黑龙江省', '黑龙江省', ',', null);
INSERT INTO `xx_area` VALUES ('651', '2014-05-15 00:14:41', '2014-05-15 00:14:41', null, '黑龙江省哈尔滨市', '哈尔滨市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('652', '2014-05-15 00:14:42', '2014-05-15 00:14:42', null, '黑龙江省哈尔滨市道里区', '道里区', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('653', '2014-05-15 00:14:43', '2014-05-15 00:14:43', null, '黑龙江省哈尔滨市南岗区', '南岗区', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('654', '2014-05-15 00:14:44', '2014-05-15 00:14:44', null, '黑龙江省哈尔滨市道外区', '道外区', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('655', '2014-05-15 00:14:45', '2014-05-15 00:14:45', null, '黑龙江省哈尔滨市平房区', '平房区', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('656', '2014-05-15 00:14:46', '2014-05-15 00:14:46', null, '黑龙江省哈尔滨市松北区', '松北区', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('657', '2014-05-15 00:14:47', '2014-05-15 00:14:47', null, '黑龙江省哈尔滨市香坊区', '香坊区', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('658', '2014-05-15 00:14:48', '2014-05-15 00:14:48', null, '黑龙江省哈尔滨市呼兰区', '呼兰区', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('659', '2014-05-15 00:14:49', '2014-05-15 00:14:49', null, '黑龙江省哈尔滨市阿城区', '阿城区', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('660', '2014-05-15 00:14:50', '2014-05-15 00:14:50', null, '黑龙江省哈尔滨市依兰县', '依兰县', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('661', '2014-05-15 00:14:51', '2014-05-15 00:14:51', null, '黑龙江省哈尔滨市方正县', '方正县', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('662', '2014-05-15 00:14:52', '2014-05-15 00:14:52', null, '黑龙江省哈尔滨市宾县', '宾县', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('663', '2014-05-15 00:14:53', '2014-05-15 00:14:53', null, '黑龙江省哈尔滨市巴彦县', '巴彦县', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('664', '2014-05-15 00:14:54', '2014-05-15 00:14:54', null, '黑龙江省哈尔滨市木兰县', '木兰县', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('665', '2014-05-15 00:14:55', '2014-05-15 00:14:55', null, '黑龙江省哈尔滨市通河县', '通河县', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('666', '2014-05-15 00:14:56', '2014-05-15 00:14:56', null, '黑龙江省哈尔滨市延寿县', '延寿县', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('667', '2014-05-15 00:14:57', '2014-05-15 00:14:57', null, '黑龙江省哈尔滨市双城市', '双城市', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('668', '2014-05-15 00:14:58', '2014-05-15 00:14:58', null, '黑龙江省哈尔滨市尚志市', '尚志市', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('669', '2014-05-15 00:14:59', '2014-05-15 00:14:59', null, '黑龙江省哈尔滨市五常市', '五常市', ',650,651,', '651');
INSERT INTO `xx_area` VALUES ('670', '2014-05-15 00:15:00', '2014-05-15 00:15:00', null, '黑龙江省齐齐哈尔市', '齐齐哈尔市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('671', '2014-05-15 00:15:01', '2014-05-15 00:15:01', null, '黑龙江省齐齐哈尔市龙沙区', '龙沙区', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('672', '2014-05-15 00:15:02', '2014-05-15 00:15:02', null, '黑龙江省齐齐哈尔市建华区', '建华区', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('673', '2014-05-15 00:15:03', '2014-05-15 00:15:03', null, '黑龙江省齐齐哈尔市铁锋区', '铁锋区', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('674', '2014-05-15 00:15:04', '2014-05-15 00:15:04', null, '黑龙江省齐齐哈尔市昂昂溪区', '昂昂溪区', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('675', '2014-05-15 00:15:05', '2014-05-15 00:15:05', null, '黑龙江省齐齐哈尔市富拉尔基区', '富拉尔基区', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('676', '2014-05-15 00:15:06', '2014-05-15 00:15:06', null, '黑龙江省齐齐哈尔市碾子山区', '碾子山区', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('677', '2014-05-15 00:15:07', '2014-05-15 00:15:07', null, '黑龙江省齐齐哈尔市梅里斯达斡尔族区', '梅里斯达斡尔族区', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('678', '2014-05-15 00:15:08', '2014-05-15 00:15:08', null, '黑龙江省齐齐哈尔市龙江县', '龙江县', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('679', '2014-05-15 00:15:09', '2014-05-15 00:15:09', null, '黑龙江省齐齐哈尔市依安县', '依安县', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('680', '2014-05-15 00:15:10', '2014-05-15 00:15:10', null, '黑龙江省齐齐哈尔市泰来县', '泰来县', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('681', '2014-05-15 00:15:11', '2014-05-15 00:15:11', null, '黑龙江省齐齐哈尔市甘南县', '甘南县', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('682', '2014-05-15 00:15:12', '2014-05-15 00:15:12', null, '黑龙江省齐齐哈尔市富裕县', '富裕县', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('683', '2014-05-15 00:15:13', '2014-05-15 00:15:13', null, '黑龙江省齐齐哈尔市克山县', '克山县', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('684', '2014-05-15 00:15:14', '2014-05-15 00:15:14', null, '黑龙江省齐齐哈尔市克东县', '克东县', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('685', '2014-05-15 00:15:15', '2014-05-15 00:15:15', null, '黑龙江省齐齐哈尔市拜泉县', '拜泉县', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('686', '2014-05-15 00:15:16', '2014-05-15 00:15:16', null, '黑龙江省齐齐哈尔市讷河市', '讷河市', ',650,670,', '670');
INSERT INTO `xx_area` VALUES ('687', '2014-05-15 00:15:17', '2014-05-15 00:15:17', null, '黑龙江省鸡西市', '鸡西市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('688', '2014-05-15 00:15:18', '2014-05-15 00:15:18', null, '黑龙江省鸡西市鸡冠区', '鸡冠区', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('689', '2014-05-15 00:15:19', '2014-05-15 00:15:19', null, '黑龙江省鸡西市恒山区', '恒山区', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('690', '2014-05-15 00:15:20', '2014-05-15 00:15:20', null, '黑龙江省鸡西市滴道区', '滴道区', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('691', '2014-05-15 00:15:21', '2014-05-15 00:15:21', null, '黑龙江省鸡西市梨树区', '梨树区', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('692', '2014-05-15 00:15:22', '2014-05-15 00:15:22', null, '黑龙江省鸡西市城子河区', '城子河区', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('693', '2014-05-15 00:15:23', '2014-05-15 00:15:23', null, '黑龙江省鸡西市麻山区', '麻山区', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('694', '2014-05-15 00:15:24', '2014-05-15 00:15:24', null, '黑龙江省鸡西市鸡东县', '鸡东县', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('695', '2014-05-15 00:15:25', '2014-05-15 00:15:25', null, '黑龙江省鸡西市虎林市', '虎林市', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('696', '2014-05-15 00:15:26', '2014-05-15 00:15:26', null, '黑龙江省鸡西市密山市', '密山市', ',650,687,', '687');
INSERT INTO `xx_area` VALUES ('697', '2014-05-15 00:15:27', '2014-05-15 00:15:27', null, '黑龙江省鹤岗市', '鹤岗市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('698', '2014-05-15 00:15:28', '2014-05-15 00:15:28', null, '黑龙江省鹤岗市向阳区', '向阳区', ',650,697,', '697');
INSERT INTO `xx_area` VALUES ('699', '2014-05-15 00:15:29', '2014-05-15 00:15:29', null, '黑龙江省鹤岗市工农区', '工农区', ',650,697,', '697');
INSERT INTO `xx_area` VALUES ('700', '2014-05-15 00:15:30', '2014-05-15 00:15:30', null, '黑龙江省鹤岗市南山区', '南山区', ',650,697,', '697');
INSERT INTO `xx_area` VALUES ('701', '2014-05-15 00:15:31', '2014-05-15 00:15:31', null, '黑龙江省鹤岗市兴安区', '兴安区', ',650,697,', '697');
INSERT INTO `xx_area` VALUES ('702', '2014-05-15 00:15:32', '2014-05-15 00:15:32', null, '黑龙江省鹤岗市东山区', '东山区', ',650,697,', '697');
INSERT INTO `xx_area` VALUES ('703', '2014-05-15 00:15:33', '2014-05-15 00:15:33', null, '黑龙江省鹤岗市兴山区', '兴山区', ',650,697,', '697');
INSERT INTO `xx_area` VALUES ('704', '2014-05-15 00:15:34', '2014-05-15 00:15:34', null, '黑龙江省鹤岗市萝北县', '萝北县', ',650,697,', '697');
INSERT INTO `xx_area` VALUES ('705', '2014-05-15 00:15:35', '2014-05-15 00:15:35', null, '黑龙江省鹤岗市绥滨县', '绥滨县', ',650,697,', '697');
INSERT INTO `xx_area` VALUES ('706', '2014-05-15 00:15:36', '2014-05-15 00:15:36', null, '黑龙江省双鸭山市', '双鸭山市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('707', '2014-05-15 00:15:37', '2014-05-15 00:15:37', null, '黑龙江省双鸭山市尖山区', '尖山区', ',650,706,', '706');
INSERT INTO `xx_area` VALUES ('708', '2014-05-15 00:15:38', '2014-05-15 00:15:38', null, '黑龙江省双鸭山市岭东区', '岭东区', ',650,706,', '706');
INSERT INTO `xx_area` VALUES ('709', '2014-05-15 00:15:39', '2014-05-15 00:15:39', null, '黑龙江省双鸭山市四方台区', '四方台区', ',650,706,', '706');
INSERT INTO `xx_area` VALUES ('710', '2014-05-15 00:15:40', '2014-05-15 00:15:40', null, '黑龙江省双鸭山市宝山区', '宝山区', ',650,706,', '706');
INSERT INTO `xx_area` VALUES ('711', '2014-05-15 00:15:41', '2014-05-15 00:15:41', null, '黑龙江省双鸭山市集贤县', '集贤县', ',650,706,', '706');
INSERT INTO `xx_area` VALUES ('712', '2014-05-15 00:15:42', '2014-05-15 00:15:42', null, '黑龙江省双鸭山市友谊县', '友谊县', ',650,706,', '706');
INSERT INTO `xx_area` VALUES ('713', '2014-05-15 00:15:43', '2014-05-15 00:15:43', null, '黑龙江省双鸭山市宝清县', '宝清县', ',650,706,', '706');
INSERT INTO `xx_area` VALUES ('714', '2014-05-15 00:15:44', '2014-05-15 00:15:44', null, '黑龙江省双鸭山市饶河县', '饶河县', ',650,706,', '706');
INSERT INTO `xx_area` VALUES ('715', '2014-05-15 00:15:45', '2014-05-15 00:15:45', null, '黑龙江省大庆市', '大庆市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('716', '2014-05-15 00:15:46', '2014-05-15 00:15:46', null, '黑龙江省大庆市萨尔图区', '萨尔图区', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('717', '2014-05-15 00:15:47', '2014-05-15 00:15:47', null, '黑龙江省大庆市龙凤区', '龙凤区', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('718', '2014-05-15 00:15:48', '2014-05-15 00:15:48', null, '黑龙江省大庆市让胡路区', '让胡路区', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('719', '2014-05-15 00:15:49', '2014-05-15 00:15:49', null, '黑龙江省大庆市红岗区', '红岗区', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('720', '2014-05-15 00:15:50', '2014-05-15 00:15:50', null, '黑龙江省大庆市大同区', '大同区', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('721', '2014-05-15 00:15:51', '2014-05-15 00:15:51', null, '黑龙江省大庆市肇州县', '肇州县', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('722', '2014-05-15 00:15:52', '2014-05-15 00:15:52', null, '黑龙江省大庆市肇源县', '肇源县', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('723', '2014-05-15 00:15:53', '2014-05-15 00:15:53', null, '黑龙江省大庆市林甸县', '林甸县', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('724', '2014-05-15 00:15:54', '2014-05-15 00:15:54', null, '黑龙江省大庆市杜尔伯特蒙古族自治县', '杜尔伯特蒙古族自治县', ',650,715,', '715');
INSERT INTO `xx_area` VALUES ('725', '2014-05-15 00:15:55', '2014-05-15 00:15:55', null, '黑龙江省伊春市', '伊春市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('726', '2014-05-15 00:15:56', '2014-05-15 00:15:56', null, '黑龙江省伊春市伊春区', '伊春区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('727', '2014-05-15 00:15:57', '2014-05-15 00:15:57', null, '黑龙江省伊春市南岔区', '南岔区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('728', '2014-05-15 00:15:58', '2014-05-15 00:15:58', null, '黑龙江省伊春市友好区', '友好区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('729', '2014-05-15 00:15:59', '2014-05-15 00:15:59', null, '黑龙江省伊春市西林区', '西林区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('730', '2014-05-15 00:16:00', '2014-05-15 00:16:00', null, '黑龙江省伊春市翠峦区', '翠峦区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('731', '2014-05-15 00:16:01', '2014-05-15 00:16:01', null, '黑龙江省伊春市新青区', '新青区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('732', '2014-05-15 00:16:02', '2014-05-15 00:16:02', null, '黑龙江省伊春市美溪区', '美溪区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('733', '2014-05-15 00:16:03', '2014-05-15 00:16:03', null, '黑龙江省伊春市金山屯区', '金山屯区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('734', '2014-05-15 00:16:04', '2014-05-15 00:16:04', null, '黑龙江省伊春市五营区', '五营区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('735', '2014-05-15 00:16:05', '2014-05-15 00:16:05', null, '黑龙江省伊春市乌马河区', '乌马河区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('736', '2014-05-15 00:16:06', '2014-05-15 00:16:06', null, '黑龙江省伊春市汤旺河区', '汤旺河区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('737', '2014-05-15 00:16:07', '2014-05-15 00:16:07', null, '黑龙江省伊春市带岭区', '带岭区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('738', '2014-05-15 00:16:08', '2014-05-15 00:16:08', null, '黑龙江省伊春市乌伊岭区', '乌伊岭区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('739', '2014-05-15 00:16:09', '2014-05-15 00:16:09', null, '黑龙江省伊春市红星区', '红星区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('740', '2014-05-15 00:16:10', '2014-05-15 00:16:10', null, '黑龙江省伊春市上甘岭区', '上甘岭区', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('741', '2014-05-15 00:16:11', '2014-05-15 00:16:11', null, '黑龙江省伊春市嘉荫县', '嘉荫县', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('742', '2014-05-15 00:16:12', '2014-05-15 00:16:12', null, '黑龙江省伊春市铁力市', '铁力市', ',650,725,', '725');
INSERT INTO `xx_area` VALUES ('743', '2014-05-15 00:16:13', '2014-05-15 00:16:13', null, '黑龙江省佳木斯市', '佳木斯市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('744', '2014-05-15 00:16:14', '2014-05-15 00:16:14', null, '黑龙江省佳木斯市向阳区', '向阳区', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('745', '2014-05-15 00:16:15', '2014-05-15 00:16:15', null, '黑龙江省佳木斯市前进区', '前进区', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('746', '2014-05-15 00:16:16', '2014-05-15 00:16:16', null, '黑龙江省佳木斯市东风区', '东风区', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('747', '2014-05-15 00:16:17', '2014-05-15 00:16:17', null, '黑龙江省佳木斯市郊区', '郊区', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('748', '2014-05-15 00:16:18', '2014-05-15 00:16:18', null, '黑龙江省佳木斯市桦南县', '桦南县', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('749', '2014-05-15 00:16:19', '2014-05-15 00:16:19', null, '黑龙江省佳木斯市桦川县', '桦川县', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('750', '2014-05-15 00:16:20', '2014-05-15 00:16:20', null, '黑龙江省佳木斯市汤原县', '汤原县', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('751', '2014-05-15 00:16:21', '2014-05-15 00:16:21', null, '黑龙江省佳木斯市抚远县', '抚远县', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('752', '2014-05-15 00:16:22', '2014-05-15 00:16:22', null, '黑龙江省佳木斯市同江市', '同江市', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('753', '2014-05-15 00:16:23', '2014-05-15 00:16:23', null, '黑龙江省佳木斯市富锦市', '富锦市', ',650,743,', '743');
INSERT INTO `xx_area` VALUES ('754', '2014-05-15 00:16:24', '2014-05-15 00:16:24', null, '黑龙江省七台河市', '七台河市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('755', '2014-05-15 00:16:25', '2014-05-15 00:16:25', null, '黑龙江省七台河市新兴区', '新兴区', ',650,754,', '754');
INSERT INTO `xx_area` VALUES ('756', '2014-05-15 00:16:26', '2014-05-15 00:16:26', null, '黑龙江省七台河市桃山区', '桃山区', ',650,754,', '754');
INSERT INTO `xx_area` VALUES ('757', '2014-05-15 00:16:27', '2014-05-15 00:16:27', null, '黑龙江省七台河市茄子河区', '茄子河区', ',650,754,', '754');
INSERT INTO `xx_area` VALUES ('758', '2014-05-15 00:16:28', '2014-05-15 00:16:28', null, '黑龙江省七台河市勃利县', '勃利县', ',650,754,', '754');
INSERT INTO `xx_area` VALUES ('759', '2014-05-15 00:16:29', '2014-05-15 00:16:29', null, '黑龙江省牡丹江市', '牡丹江市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('760', '2014-05-15 00:16:30', '2014-05-15 00:16:30', null, '黑龙江省牡丹江市东安区', '东安区', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('761', '2014-05-15 00:16:31', '2014-05-15 00:16:31', null, '黑龙江省牡丹江市阳明区', '阳明区', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('762', '2014-05-15 00:16:32', '2014-05-15 00:16:32', null, '黑龙江省牡丹江市爱民区', '爱民区', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('763', '2014-05-15 00:16:33', '2014-05-15 00:16:33', null, '黑龙江省牡丹江市西安区', '西安区', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('764', '2014-05-15 00:16:34', '2014-05-15 00:16:34', null, '黑龙江省牡丹江市东宁县', '东宁县', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('765', '2014-05-15 00:16:35', '2014-05-15 00:16:35', null, '黑龙江省牡丹江市林口县', '林口县', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('766', '2014-05-15 00:16:36', '2014-05-15 00:16:36', null, '黑龙江省牡丹江市绥芬河市', '绥芬河市', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('767', '2014-05-15 00:16:37', '2014-05-15 00:16:37', null, '黑龙江省牡丹江市海林市', '海林市', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('768', '2014-05-15 00:16:38', '2014-05-15 00:16:38', null, '黑龙江省牡丹江市宁安市', '宁安市', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('769', '2014-05-15 00:16:39', '2014-05-15 00:16:39', null, '黑龙江省牡丹江市穆棱市', '穆棱市', ',650,759,', '759');
INSERT INTO `xx_area` VALUES ('770', '2014-05-15 00:16:40', '2014-05-15 00:16:40', null, '黑龙江省黑河市', '黑河市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('771', '2014-05-15 00:16:41', '2014-05-15 00:16:41', null, '黑龙江省黑河市爱辉区', '爱辉区', ',650,770,', '770');
INSERT INTO `xx_area` VALUES ('772', '2014-05-15 00:16:42', '2014-05-15 00:16:42', null, '黑龙江省黑河市嫩江县', '嫩江县', ',650,770,', '770');
INSERT INTO `xx_area` VALUES ('773', '2014-05-15 00:16:43', '2014-05-15 00:16:43', null, '黑龙江省黑河市逊克县', '逊克县', ',650,770,', '770');
INSERT INTO `xx_area` VALUES ('774', '2014-05-15 00:16:44', '2014-05-15 00:16:44', null, '黑龙江省黑河市孙吴县', '孙吴县', ',650,770,', '770');
INSERT INTO `xx_area` VALUES ('775', '2014-05-15 00:16:45', '2014-05-15 00:16:45', null, '黑龙江省黑河市北安市', '北安市', ',650,770,', '770');
INSERT INTO `xx_area` VALUES ('776', '2014-05-15 00:16:46', '2014-05-15 00:16:46', null, '黑龙江省黑河市五大连池市', '五大连池市', ',650,770,', '770');
INSERT INTO `xx_area` VALUES ('777', '2014-05-15 00:16:47', '2014-05-15 00:16:47', null, '黑龙江省绥化市', '绥化市', ',650,', '650');
INSERT INTO `xx_area` VALUES ('778', '2014-05-15 00:16:48', '2014-05-15 00:16:48', null, '黑龙江省绥化市北林区', '北林区', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('779', '2014-05-15 00:16:49', '2014-05-15 00:16:49', null, '黑龙江省绥化市望奎县', '望奎县', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('780', '2014-05-15 00:16:50', '2014-05-15 00:16:50', null, '黑龙江省绥化市兰西县', '兰西县', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('781', '2014-05-15 00:16:51', '2014-05-15 00:16:51', null, '黑龙江省绥化市青冈县', '青冈县', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('782', '2014-05-15 00:16:52', '2014-05-15 00:16:52', null, '黑龙江省绥化市庆安县', '庆安县', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('783', '2014-05-15 00:16:53', '2014-05-15 00:16:53', null, '黑龙江省绥化市明水县', '明水县', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('784', '2014-05-15 00:16:54', '2014-05-15 00:16:54', null, '黑龙江省绥化市绥棱县', '绥棱县', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('785', '2014-05-15 00:16:55', '2014-05-15 00:16:55', null, '黑龙江省绥化市安达市', '安达市', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('786', '2014-05-15 00:16:56', '2014-05-15 00:16:56', null, '黑龙江省绥化市肇东市', '肇东市', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('787', '2014-05-15 00:16:57', '2014-05-15 00:16:57', null, '黑龙江省绥化市海伦市', '海伦市', ',650,777,', '777');
INSERT INTO `xx_area` VALUES ('788', '2014-05-15 00:16:58', '2014-05-15 00:16:58', null, '黑龙江省大兴安岭地区', '大兴安岭地区', ',650,', '650');
INSERT INTO `xx_area` VALUES ('789', '2014-05-15 00:16:59', '2014-05-15 00:16:59', null, '黑龙江省大兴安岭地区呼玛县', '呼玛县', ',650,788,', '788');
INSERT INTO `xx_area` VALUES ('790', '2014-05-15 00:17:00', '2014-05-15 00:17:00', null, '黑龙江省大兴安岭地区塔河县', '塔河县', ',650,788,', '788');
INSERT INTO `xx_area` VALUES ('791', '2014-05-15 00:17:01', '2014-05-15 00:17:01', null, '黑龙江省大兴安岭地区漠河县', '漠河县', ',650,788,', '788');
INSERT INTO `xx_area` VALUES ('792', '2014-05-15 00:17:02', '2014-05-15 00:17:02', null, '上海市', '上海市', ',', null);
INSERT INTO `xx_area` VALUES ('793', '2014-05-15 00:17:03', '2014-05-15 00:17:03', null, '上海市黄浦区', '黄浦区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('794', '2014-05-15 00:17:04', '2014-05-15 00:17:04', null, '上海市徐汇区', '徐汇区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('795', '2014-05-15 00:17:05', '2014-05-15 00:17:05', null, '上海市长宁区', '长宁区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('796', '2014-05-15 00:17:06', '2014-05-15 00:17:06', null, '上海市静安区', '静安区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('797', '2014-05-15 00:17:07', '2014-05-15 00:17:07', null, '上海市普陀区', '普陀区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('798', '2014-05-15 00:17:08', '2014-05-15 00:17:08', null, '上海市闸北区', '闸北区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('799', '2014-05-15 00:17:09', '2014-05-15 00:17:09', null, '上海市虹口区', '虹口区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('800', '2014-05-15 00:17:10', '2014-05-15 00:17:10', null, '上海市杨浦区', '杨浦区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('801', '2014-05-15 00:17:11', '2014-05-15 00:17:11', null, '上海市闵行区', '闵行区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('802', '2014-05-15 00:17:12', '2014-05-15 00:17:12', null, '上海市宝山区', '宝山区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('803', '2014-05-15 00:17:13', '2014-05-15 00:17:13', null, '上海市嘉定区', '嘉定区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('804', '2014-05-15 00:17:14', '2014-05-15 00:17:14', null, '上海市浦东新区', '浦东新区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('805', '2014-05-15 00:17:15', '2014-05-15 00:17:15', null, '上海市金山区', '金山区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('806', '2014-05-15 00:17:16', '2014-05-15 00:17:16', null, '上海市松江区', '松江区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('807', '2014-05-15 00:17:17', '2014-05-15 00:17:17', null, '上海市青浦区', '青浦区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('808', '2014-05-15 00:17:18', '2014-05-15 00:17:18', null, '上海市奉贤区', '奉贤区', ',792,', '792');
INSERT INTO `xx_area` VALUES ('809', '2014-05-15 00:17:19', '2014-05-15 00:17:19', null, '上海市崇明县', '崇明县', ',792,', '792');
INSERT INTO `xx_area` VALUES ('810', '2014-05-15 00:17:20', '2014-05-15 00:17:20', null, '江苏省', '江苏省', ',', null);
INSERT INTO `xx_area` VALUES ('811', '2014-05-15 00:17:21', '2014-05-15 00:17:21', null, '江苏省南京市', '南京市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('812', '2014-05-15 00:17:22', '2014-05-15 00:17:22', null, '江苏省南京市玄武区', '玄武区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('813', '2014-05-15 00:17:23', '2014-05-15 00:17:23', null, '江苏省南京市白下区', '白下区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('814', '2014-05-15 00:17:24', '2014-05-15 00:17:24', null, '江苏省南京市秦淮区', '秦淮区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('815', '2014-05-15 00:17:25', '2014-05-15 00:17:25', null, '江苏省南京市建邺区', '建邺区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('816', '2014-05-15 00:17:26', '2014-05-15 00:17:26', null, '江苏省南京市鼓楼区', '鼓楼区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('817', '2014-05-15 00:17:27', '2014-05-15 00:17:27', null, '江苏省南京市下关区', '下关区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('818', '2014-05-15 00:17:28', '2014-05-15 00:17:28', null, '江苏省南京市浦口区', '浦口区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('819', '2014-05-15 00:17:29', '2014-05-15 00:17:29', null, '江苏省南京市栖霞区', '栖霞区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('820', '2014-05-15 00:17:30', '2014-05-15 00:17:30', null, '江苏省南京市雨花台区', '雨花台区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('821', '2014-05-15 00:17:31', '2014-05-15 00:17:31', null, '江苏省南京市江宁区', '江宁区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('822', '2014-05-15 00:17:32', '2014-05-15 00:17:32', null, '江苏省南京市六合区', '六合区', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('823', '2014-05-15 00:17:33', '2014-05-15 00:17:33', null, '江苏省南京市溧水县', '溧水县', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('824', '2014-05-15 00:17:34', '2014-05-15 00:17:34', null, '江苏省南京市高淳县', '高淳县', ',810,811,', '811');
INSERT INTO `xx_area` VALUES ('825', '2014-05-15 00:17:35', '2014-05-15 00:17:35', null, '江苏省无锡市', '无锡市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('826', '2014-05-15 00:17:36', '2014-05-15 00:17:36', null, '江苏省无锡市崇安区', '崇安区', ',810,825,', '825');
INSERT INTO `xx_area` VALUES ('827', '2014-05-15 00:17:37', '2014-05-15 00:17:37', null, '江苏省无锡市南长区', '南长区', ',810,825,', '825');
INSERT INTO `xx_area` VALUES ('828', '2014-05-15 00:17:38', '2014-05-15 00:17:38', null, '江苏省无锡市北塘区', '北塘区', ',810,825,', '825');
INSERT INTO `xx_area` VALUES ('829', '2014-05-15 00:17:39', '2014-05-15 00:17:39', null, '江苏省无锡市锡山区', '锡山区', ',810,825,', '825');
INSERT INTO `xx_area` VALUES ('830', '2014-05-15 00:17:40', '2014-05-15 00:17:40', null, '江苏省无锡市惠山区', '惠山区', ',810,825,', '825');
INSERT INTO `xx_area` VALUES ('831', '2014-05-15 00:17:41', '2014-05-15 00:17:41', null, '江苏省无锡市滨湖区', '滨湖区', ',810,825,', '825');
INSERT INTO `xx_area` VALUES ('832', '2014-05-15 00:17:42', '2014-05-15 00:17:42', null, '江苏省无锡市江阴市', '江阴市', ',810,825,', '825');
INSERT INTO `xx_area` VALUES ('833', '2014-05-15 00:17:43', '2014-05-15 00:17:43', null, '江苏省无锡市宜兴市', '宜兴市', ',810,825,', '825');
INSERT INTO `xx_area` VALUES ('834', '2014-05-15 00:17:44', '2014-05-15 00:17:44', null, '江苏省徐州市', '徐州市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('835', '2014-05-15 00:17:45', '2014-05-15 00:17:45', null, '江苏省徐州市鼓楼区', '鼓楼区', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('836', '2014-05-15 00:17:46', '2014-05-15 00:17:46', null, '江苏省徐州市云龙区', '云龙区', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('837', '2014-05-15 00:17:47', '2014-05-15 00:17:47', null, '江苏省徐州市贾汪区', '贾汪区', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('838', '2014-05-15 00:17:48', '2014-05-15 00:17:48', null, '江苏省徐州市泉山区', '泉山区', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('839', '2014-05-15 00:17:49', '2014-05-15 00:17:49', null, '江苏省徐州市铜山区', '铜山区', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('840', '2014-05-15 00:17:50', '2014-05-15 00:17:50', null, '江苏省徐州市丰县', '丰县', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('841', '2014-05-15 00:17:51', '2014-05-15 00:17:51', null, '江苏省徐州市沛县', '沛县', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('842', '2014-05-15 00:17:52', '2014-05-15 00:17:52', null, '江苏省徐州市睢宁县', '睢宁县', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('843', '2014-05-15 00:17:53', '2014-05-15 00:17:53', null, '江苏省徐州市新沂市', '新沂市', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('844', '2014-05-15 00:17:54', '2014-05-15 00:17:54', null, '江苏省徐州市邳州市', '邳州市', ',810,834,', '834');
INSERT INTO `xx_area` VALUES ('845', '2014-05-15 00:17:55', '2014-05-15 00:17:55', null, '江苏省常州市', '常州市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('846', '2014-05-15 00:17:56', '2014-05-15 00:17:56', null, '江苏省常州市天宁区', '天宁区', ',810,845,', '845');
INSERT INTO `xx_area` VALUES ('847', '2014-05-15 00:17:57', '2014-05-15 00:17:57', null, '江苏省常州市钟楼区', '钟楼区', ',810,845,', '845');
INSERT INTO `xx_area` VALUES ('848', '2014-05-15 00:17:58', '2014-05-15 00:17:58', null, '江苏省常州市戚墅堰区', '戚墅堰区', ',810,845,', '845');
INSERT INTO `xx_area` VALUES ('849', '2014-05-15 00:17:59', '2014-05-15 00:17:59', null, '江苏省常州市新北区', '新北区', ',810,845,', '845');
INSERT INTO `xx_area` VALUES ('850', '2014-05-15 00:18:00', '2014-05-15 00:18:00', null, '江苏省常州市武进区', '武进区', ',810,845,', '845');
INSERT INTO `xx_area` VALUES ('851', '2014-05-15 00:18:01', '2014-05-15 00:18:01', null, '江苏省常州市溧阳市', '溧阳市', ',810,845,', '845');
INSERT INTO `xx_area` VALUES ('852', '2014-05-15 00:18:02', '2014-05-15 00:18:02', null, '江苏省常州市金坛市', '金坛市', ',810,845,', '845');
INSERT INTO `xx_area` VALUES ('853', '2014-05-15 00:18:03', '2014-05-15 00:18:03', null, '江苏省苏州市', '苏州市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('854', '2014-05-15 00:18:04', '2014-05-15 00:18:04', null, '江苏省苏州市虎丘区', '虎丘区', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('855', '2014-05-15 00:18:05', '2014-05-15 00:18:05', null, '江苏省苏州市吴中区', '吴中区', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('856', '2014-05-15 00:18:06', '2014-05-15 00:18:06', null, '江苏省苏州市相城区', '相城区', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('857', '2014-05-15 00:18:07', '2014-05-15 00:18:07', null, '江苏省苏州市姑苏区', '姑苏区', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('858', '2014-05-15 00:18:08', '2014-05-15 00:18:08', null, '江苏省苏州市吴江区', '吴江区', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('859', '2014-05-15 00:18:09', '2014-05-15 00:18:09', null, '江苏省苏州市常熟市', '常熟市', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('860', '2014-05-15 00:18:10', '2014-05-15 00:18:10', null, '江苏省苏州市张家港市', '张家港市', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('861', '2014-05-15 00:18:11', '2014-05-15 00:18:11', null, '江苏省苏州市昆山市', '昆山市', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('862', '2014-05-15 00:18:12', '2014-05-15 00:18:12', null, '江苏省苏州市太仓市', '太仓市', ',810,853,', '853');
INSERT INTO `xx_area` VALUES ('863', '2014-05-15 00:18:13', '2014-05-15 00:18:13', null, '江苏省南通市', '南通市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('864', '2014-05-15 00:18:14', '2014-05-15 00:18:14', null, '江苏省南通市崇川区', '崇川区', ',810,863,', '863');
INSERT INTO `xx_area` VALUES ('865', '2014-05-15 00:18:15', '2014-05-15 00:18:15', null, '江苏省南通市港闸区', '港闸区', ',810,863,', '863');
INSERT INTO `xx_area` VALUES ('866', '2014-05-15 00:18:16', '2014-05-15 00:18:16', null, '江苏省南通市通州区', '通州区', ',810,863,', '863');
INSERT INTO `xx_area` VALUES ('867', '2014-05-15 00:18:17', '2014-05-15 00:18:17', null, '江苏省南通市海安县', '海安县', ',810,863,', '863');
INSERT INTO `xx_area` VALUES ('868', '2014-05-15 00:18:18', '2014-05-15 00:18:18', null, '江苏省南通市如东县', '如东县', ',810,863,', '863');
INSERT INTO `xx_area` VALUES ('869', '2014-05-15 00:18:19', '2014-05-15 00:18:19', null, '江苏省南通市启东市', '启东市', ',810,863,', '863');
INSERT INTO `xx_area` VALUES ('870', '2014-05-15 00:18:20', '2014-05-15 00:18:20', null, '江苏省南通市如皋市', '如皋市', ',810,863,', '863');
INSERT INTO `xx_area` VALUES ('871', '2014-05-15 00:18:21', '2014-05-15 00:18:21', null, '江苏省南通市海门市', '海门市', ',810,863,', '863');
INSERT INTO `xx_area` VALUES ('872', '2014-05-15 00:18:22', '2014-05-15 00:18:22', null, '江苏省连云港市', '连云港市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('873', '2014-05-15 00:18:23', '2014-05-15 00:18:23', null, '江苏省连云港市连云区', '连云区', ',810,872,', '872');
INSERT INTO `xx_area` VALUES ('874', '2014-05-15 00:18:24', '2014-05-15 00:18:24', null, '江苏省连云港市新浦区', '新浦区', ',810,872,', '872');
INSERT INTO `xx_area` VALUES ('875', '2014-05-15 00:18:25', '2014-05-15 00:18:25', null, '江苏省连云港市海州区', '海州区', ',810,872,', '872');
INSERT INTO `xx_area` VALUES ('876', '2014-05-15 00:18:26', '2014-05-15 00:18:26', null, '江苏省连云港市赣榆县', '赣榆县', ',810,872,', '872');
INSERT INTO `xx_area` VALUES ('877', '2014-05-15 00:18:27', '2014-05-15 00:18:27', null, '江苏省连云港市东海县', '东海县', ',810,872,', '872');
INSERT INTO `xx_area` VALUES ('878', '2014-05-15 00:18:28', '2014-05-15 00:18:28', null, '江苏省连云港市灌云县', '灌云县', ',810,872,', '872');
INSERT INTO `xx_area` VALUES ('879', '2014-05-15 00:18:29', '2014-05-15 00:18:29', null, '江苏省连云港市灌南县', '灌南县', ',810,872,', '872');
INSERT INTO `xx_area` VALUES ('880', '2014-05-15 00:18:30', '2014-05-15 00:18:30', null, '江苏省淮安市', '淮安市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('881', '2014-05-15 00:18:31', '2014-05-15 00:18:31', null, '江苏省淮安市清河区', '清河区', ',810,880,', '880');
INSERT INTO `xx_area` VALUES ('882', '2014-05-15 00:18:32', '2014-05-15 00:18:32', null, '江苏省淮安市淮安区', '淮安区', ',810,880,', '880');
INSERT INTO `xx_area` VALUES ('883', '2014-05-15 00:18:33', '2014-05-15 00:18:33', null, '江苏省淮安市淮阴区', '淮阴区', ',810,880,', '880');
INSERT INTO `xx_area` VALUES ('884', '2014-05-15 00:18:34', '2014-05-15 00:18:34', null, '江苏省淮安市清浦区', '清浦区', ',810,880,', '880');
INSERT INTO `xx_area` VALUES ('885', '2014-05-15 00:18:35', '2014-05-15 00:18:35', null, '江苏省淮安市涟水县', '涟水县', ',810,880,', '880');
INSERT INTO `xx_area` VALUES ('886', '2014-05-15 00:18:36', '2014-05-15 00:18:36', null, '江苏省淮安市洪泽县', '洪泽县', ',810,880,', '880');
INSERT INTO `xx_area` VALUES ('887', '2014-05-15 00:18:37', '2014-05-15 00:18:37', null, '江苏省淮安市盱眙县', '盱眙县', ',810,880,', '880');
INSERT INTO `xx_area` VALUES ('888', '2014-05-15 00:18:38', '2014-05-15 00:18:38', null, '江苏省淮安市金湖县', '金湖县', ',810,880,', '880');
INSERT INTO `xx_area` VALUES ('889', '2014-05-15 00:18:39', '2014-05-15 00:18:39', null, '江苏省盐城市', '盐城市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('890', '2014-05-15 00:18:40', '2014-05-15 00:18:40', null, '江苏省盐城市亭湖区', '亭湖区', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('891', '2014-05-15 00:18:41', '2014-05-15 00:18:41', null, '江苏省盐城市盐都区', '盐都区', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('892', '2014-05-15 00:18:42', '2014-05-15 00:18:42', null, '江苏省盐城市响水县', '响水县', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('893', '2014-05-15 00:18:43', '2014-05-15 00:18:43', null, '江苏省盐城市滨海县', '滨海县', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('894', '2014-05-15 00:18:44', '2014-05-15 00:18:44', null, '江苏省盐城市阜宁县', '阜宁县', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('895', '2014-05-15 00:18:45', '2014-05-15 00:18:45', null, '江苏省盐城市射阳县', '射阳县', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('896', '2014-05-15 00:18:46', '2014-05-15 00:18:46', null, '江苏省盐城市建湖县', '建湖县', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('897', '2014-05-15 00:18:47', '2014-05-15 00:18:47', null, '江苏省盐城市东台市', '东台市', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('898', '2014-05-15 00:18:48', '2014-05-15 00:18:48', null, '江苏省盐城市大丰市', '大丰市', ',810,889,', '889');
INSERT INTO `xx_area` VALUES ('899', '2014-05-15 00:18:49', '2014-05-15 00:18:49', null, '江苏省扬州市', '扬州市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('900', '2014-05-15 00:18:50', '2014-05-15 00:18:50', null, '江苏省扬州市广陵区', '广陵区', ',810,899,', '899');
INSERT INTO `xx_area` VALUES ('901', '2014-05-15 00:18:51', '2014-05-15 00:18:51', null, '江苏省扬州市邗江区', '邗江区', ',810,899,', '899');
INSERT INTO `xx_area` VALUES ('902', '2014-05-15 00:18:52', '2014-05-15 00:18:52', null, '江苏省扬州市江都区', '江都区', ',810,899,', '899');
INSERT INTO `xx_area` VALUES ('903', '2014-05-15 00:18:53', '2014-05-15 00:18:53', null, '江苏省扬州市宝应县', '宝应县', ',810,899,', '899');
INSERT INTO `xx_area` VALUES ('904', '2014-05-15 00:18:54', '2014-05-15 00:18:54', null, '江苏省扬州市仪征市', '仪征市', ',810,899,', '899');
INSERT INTO `xx_area` VALUES ('905', '2014-05-15 00:18:55', '2014-05-15 00:18:55', null, '江苏省扬州市高邮市', '高邮市', ',810,899,', '899');
INSERT INTO `xx_area` VALUES ('906', '2014-05-15 00:18:56', '2014-05-15 00:18:56', null, '江苏省镇江市', '镇江市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('907', '2014-05-15 00:18:57', '2014-05-15 00:18:57', null, '江苏省镇江市京口区', '京口区', ',810,906,', '906');
INSERT INTO `xx_area` VALUES ('908', '2014-05-15 00:18:58', '2014-05-15 00:18:58', null, '江苏省镇江市润州区', '润州区', ',810,906,', '906');
INSERT INTO `xx_area` VALUES ('909', '2014-05-15 00:18:59', '2014-05-15 00:18:59', null, '江苏省镇江市丹徒区', '丹徒区', ',810,906,', '906');
INSERT INTO `xx_area` VALUES ('910', '2014-05-15 00:19:00', '2014-05-15 00:19:00', null, '江苏省镇江市丹阳市', '丹阳市', ',810,906,', '906');
INSERT INTO `xx_area` VALUES ('911', '2014-05-15 00:19:01', '2014-05-15 00:19:01', null, '江苏省镇江市扬中市', '扬中市', ',810,906,', '906');
INSERT INTO `xx_area` VALUES ('912', '2014-05-15 00:19:02', '2014-05-15 00:19:02', null, '江苏省镇江市句容市', '句容市', ',810,906,', '906');
INSERT INTO `xx_area` VALUES ('913', '2014-05-15 00:19:03', '2014-05-15 00:19:03', null, '江苏省泰州市', '泰州市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('914', '2014-05-15 00:19:04', '2014-05-15 00:19:04', null, '江苏省泰州市海陵区', '海陵区', ',810,913,', '913');
INSERT INTO `xx_area` VALUES ('915', '2014-05-15 00:19:05', '2014-05-15 00:19:05', null, '江苏省泰州市高港区', '高港区', ',810,913,', '913');
INSERT INTO `xx_area` VALUES ('916', '2014-05-15 00:19:06', '2014-05-15 00:19:06', null, '江苏省泰州市兴化市', '兴化市', ',810,913,', '913');
INSERT INTO `xx_area` VALUES ('917', '2014-05-15 00:19:07', '2014-05-15 00:19:07', null, '江苏省泰州市靖江市', '靖江市', ',810,913,', '913');
INSERT INTO `xx_area` VALUES ('918', '2014-05-15 00:19:08', '2014-05-15 00:19:08', null, '江苏省泰州市泰兴市', '泰兴市', ',810,913,', '913');
INSERT INTO `xx_area` VALUES ('919', '2014-05-15 00:19:09', '2014-05-15 00:19:09', null, '江苏省泰州市姜堰市', '姜堰市', ',810,913,', '913');
INSERT INTO `xx_area` VALUES ('920', '2014-05-15 00:19:10', '2014-05-15 00:19:10', null, '江苏省宿迁市', '宿迁市', ',810,', '810');
INSERT INTO `xx_area` VALUES ('921', '2014-05-15 00:19:11', '2014-05-15 00:19:11', null, '江苏省宿迁市宿城区', '宿城区', ',810,920,', '920');
INSERT INTO `xx_area` VALUES ('922', '2014-05-15 00:19:12', '2014-05-15 00:19:12', null, '江苏省宿迁市宿豫区', '宿豫区', ',810,920,', '920');
INSERT INTO `xx_area` VALUES ('923', '2014-05-15 00:19:13', '2014-05-15 00:19:13', null, '江苏省宿迁市沭阳县', '沭阳县', ',810,920,', '920');
INSERT INTO `xx_area` VALUES ('924', '2014-05-15 00:19:14', '2014-05-15 00:19:14', null, '江苏省宿迁市泗阳县', '泗阳县', ',810,920,', '920');
INSERT INTO `xx_area` VALUES ('925', '2014-05-15 00:19:15', '2014-05-15 00:19:15', null, '江苏省宿迁市泗洪县', '泗洪县', ',810,920,', '920');
INSERT INTO `xx_area` VALUES ('926', '2014-05-15 00:19:16', '2014-05-15 00:19:16', null, '浙江省', '浙江省', ',', null);
INSERT INTO `xx_area` VALUES ('927', '2014-05-15 00:19:17', '2014-05-15 00:19:17', null, '浙江省杭州市', '杭州市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('928', '2014-05-15 00:19:18', '2014-05-15 00:19:18', null, '浙江省杭州市上城区', '上城区', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('929', '2014-05-15 00:19:19', '2014-05-15 00:19:19', null, '浙江省杭州市下城区', '下城区', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('930', '2014-05-15 00:19:20', '2014-05-15 00:19:20', null, '浙江省杭州市江干区', '江干区', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('931', '2014-05-15 00:19:21', '2014-05-15 00:19:21', null, '浙江省杭州市拱墅区', '拱墅区', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('932', '2014-05-15 00:19:22', '2014-05-15 00:19:22', null, '浙江省杭州市西湖区', '西湖区', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('933', '2014-05-15 00:19:23', '2014-05-15 00:19:23', null, '浙江省杭州市滨江区', '滨江区', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('934', '2014-05-15 00:19:24', '2014-05-15 00:19:24', null, '浙江省杭州市萧山区', '萧山区', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('935', '2014-05-15 00:19:25', '2014-05-15 00:19:25', null, '浙江省杭州市余杭区', '余杭区', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('936', '2014-05-15 00:19:26', '2014-05-15 00:19:26', null, '浙江省杭州市桐庐县', '桐庐县', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('937', '2014-05-15 00:19:27', '2014-05-15 00:19:27', null, '浙江省杭州市淳安县', '淳安县', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('938', '2014-05-15 00:19:28', '2014-05-15 00:19:28', null, '浙江省杭州市建德市', '建德市', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('939', '2014-05-15 00:19:29', '2014-05-15 00:19:29', null, '浙江省杭州市富阳市', '富阳市', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('940', '2014-05-15 00:19:30', '2014-05-15 00:19:30', null, '浙江省杭州市临安市', '临安市', ',926,927,', '927');
INSERT INTO `xx_area` VALUES ('941', '2014-05-15 00:19:31', '2014-05-15 00:19:31', null, '浙江省宁波市', '宁波市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('942', '2014-05-15 00:19:32', '2014-05-15 00:19:32', null, '浙江省宁波市海曙区', '海曙区', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('943', '2014-05-15 00:19:33', '2014-05-15 00:19:33', null, '浙江省宁波市江东区', '江东区', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('944', '2014-05-15 00:19:34', '2014-05-15 00:19:34', null, '浙江省宁波市江北区', '江北区', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('945', '2014-05-15 00:19:35', '2014-05-15 00:19:35', null, '浙江省宁波市北仑区', '北仑区', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('946', '2014-05-15 00:19:36', '2014-05-15 00:19:36', null, '浙江省宁波市镇海区', '镇海区', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('947', '2014-05-15 00:19:37', '2014-05-15 00:19:37', null, '浙江省宁波市鄞州区', '鄞州区', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('948', '2014-05-15 00:19:38', '2014-05-15 00:19:38', null, '浙江省宁波市象山县', '象山县', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('949', '2014-05-15 00:19:39', '2014-05-15 00:19:39', null, '浙江省宁波市宁海县', '宁海县', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('950', '2014-05-15 00:19:40', '2014-05-15 00:19:40', null, '浙江省宁波市余姚市', '余姚市', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('951', '2014-05-15 00:19:41', '2014-05-15 00:19:41', null, '浙江省宁波市慈溪市', '慈溪市', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('952', '2014-05-15 00:19:42', '2014-05-15 00:19:42', null, '浙江省宁波市奉化市', '奉化市', ',926,941,', '941');
INSERT INTO `xx_area` VALUES ('953', '2014-05-15 00:19:43', '2014-05-15 00:19:43', null, '浙江省温州市', '温州市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('954', '2014-05-15 00:19:44', '2014-05-15 00:19:44', null, '浙江省温州市鹿城区', '鹿城区', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('955', '2014-05-15 00:19:45', '2014-05-15 00:19:45', null, '浙江省温州市龙湾区', '龙湾区', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('956', '2014-05-15 00:19:46', '2014-05-15 00:19:46', null, '浙江省温州市瓯海区', '瓯海区', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('957', '2014-05-15 00:19:47', '2014-05-15 00:19:47', null, '浙江省温州市洞头县', '洞头县', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('958', '2014-05-15 00:19:48', '2014-05-15 00:19:48', null, '浙江省温州市永嘉县', '永嘉县', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('959', '2014-05-15 00:19:49', '2014-05-15 00:19:49', null, '浙江省温州市平阳县', '平阳县', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('960', '2014-05-15 00:19:50', '2014-05-15 00:19:50', null, '浙江省温州市苍南县', '苍南县', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('961', '2014-05-15 00:19:51', '2014-05-15 00:19:51', null, '浙江省温州市文成县', '文成县', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('962', '2014-05-15 00:19:52', '2014-05-15 00:19:52', null, '浙江省温州市泰顺县', '泰顺县', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('963', '2014-05-15 00:19:53', '2014-05-15 00:19:53', null, '浙江省温州市瑞安市', '瑞安市', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('964', '2014-05-15 00:19:54', '2014-05-15 00:19:54', null, '浙江省温州市乐清市', '乐清市', ',926,953,', '953');
INSERT INTO `xx_area` VALUES ('965', '2014-05-15 00:19:55', '2014-05-15 00:19:55', null, '浙江省嘉兴市', '嘉兴市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('966', '2014-05-15 00:19:56', '2014-05-15 00:19:56', null, '浙江省嘉兴市南湖区', '南湖区', ',926,965,', '965');
INSERT INTO `xx_area` VALUES ('967', '2014-05-15 00:19:57', '2014-05-15 00:19:57', null, '浙江省嘉兴市秀洲区', '秀洲区', ',926,965,', '965');
INSERT INTO `xx_area` VALUES ('968', '2014-05-15 00:19:58', '2014-05-15 00:19:58', null, '浙江省嘉兴市嘉善县', '嘉善县', ',926,965,', '965');
INSERT INTO `xx_area` VALUES ('969', '2014-05-15 00:19:59', '2014-05-15 00:19:59', null, '浙江省嘉兴市海盐县', '海盐县', ',926,965,', '965');
INSERT INTO `xx_area` VALUES ('970', '2014-05-15 00:20:00', '2014-05-15 00:20:00', null, '浙江省嘉兴市海宁市', '海宁市', ',926,965,', '965');
INSERT INTO `xx_area` VALUES ('971', '2014-05-15 00:20:01', '2014-05-15 00:20:01', null, '浙江省嘉兴市平湖市', '平湖市', ',926,965,', '965');
INSERT INTO `xx_area` VALUES ('972', '2014-05-15 00:20:02', '2014-05-15 00:20:02', null, '浙江省嘉兴市桐乡市', '桐乡市', ',926,965,', '965');
INSERT INTO `xx_area` VALUES ('973', '2014-05-15 00:20:03', '2014-05-15 00:20:03', null, '浙江省湖州市', '湖州市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('974', '2014-05-15 00:20:04', '2014-05-15 00:20:04', null, '浙江省湖州市吴兴区', '吴兴区', ',926,973,', '973');
INSERT INTO `xx_area` VALUES ('975', '2014-05-15 00:20:05', '2014-05-15 00:20:05', null, '浙江省湖州市南浔区', '南浔区', ',926,973,', '973');
INSERT INTO `xx_area` VALUES ('976', '2014-05-15 00:20:06', '2014-05-15 00:20:06', null, '浙江省湖州市德清县', '德清县', ',926,973,', '973');
INSERT INTO `xx_area` VALUES ('977', '2014-05-15 00:20:07', '2014-05-15 00:20:07', null, '浙江省湖州市长兴县', '长兴县', ',926,973,', '973');
INSERT INTO `xx_area` VALUES ('978', '2014-05-15 00:20:08', '2014-05-15 00:20:08', null, '浙江省湖州市安吉县', '安吉县', ',926,973,', '973');
INSERT INTO `xx_area` VALUES ('979', '2014-05-15 00:20:09', '2014-05-15 00:20:09', null, '浙江省绍兴市', '绍兴市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('980', '2014-05-15 00:20:10', '2014-05-15 00:20:10', null, '浙江省绍兴市越城区', '越城区', ',926,979,', '979');
INSERT INTO `xx_area` VALUES ('981', '2014-05-15 00:20:11', '2014-05-15 00:20:11', null, '浙江省绍兴市绍兴县', '绍兴县', ',926,979,', '979');
INSERT INTO `xx_area` VALUES ('982', '2014-05-15 00:20:12', '2014-05-15 00:20:12', null, '浙江省绍兴市新昌县', '新昌县', ',926,979,', '979');
INSERT INTO `xx_area` VALUES ('983', '2014-05-15 00:20:13', '2014-05-15 00:20:13', null, '浙江省绍兴市诸暨市', '诸暨市', ',926,979,', '979');
INSERT INTO `xx_area` VALUES ('984', '2014-05-15 00:20:14', '2014-05-15 00:20:14', null, '浙江省绍兴市上虞市', '上虞市', ',926,979,', '979');
INSERT INTO `xx_area` VALUES ('985', '2014-05-15 00:20:15', '2014-05-15 00:20:15', null, '浙江省绍兴市嵊州市', '嵊州市', ',926,979,', '979');
INSERT INTO `xx_area` VALUES ('986', '2014-05-15 00:20:16', '2014-05-15 00:20:16', null, '浙江省金华市', '金华市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('987', '2014-05-15 00:20:17', '2014-05-15 00:20:17', null, '浙江省金华市婺城区', '婺城区', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('988', '2014-05-15 00:20:18', '2014-05-15 00:20:18', null, '浙江省金华市金东区', '金东区', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('989', '2014-05-15 00:20:19', '2014-05-15 00:20:19', null, '浙江省金华市武义县', '武义县', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('990', '2014-05-15 00:20:20', '2014-05-15 00:20:20', null, '浙江省金华市浦江县', '浦江县', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('991', '2014-05-15 00:20:21', '2014-05-15 00:20:21', null, '浙江省金华市磐安县', '磐安县', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('992', '2014-05-15 00:20:22', '2014-05-15 00:20:22', null, '浙江省金华市兰溪市', '兰溪市', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('993', '2014-05-15 00:20:23', '2014-05-15 00:20:23', null, '浙江省金华市义乌市', '义乌市', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('994', '2014-05-15 00:20:24', '2014-05-15 00:20:24', null, '浙江省金华市东阳市', '东阳市', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('995', '2014-05-15 00:20:25', '2014-05-15 00:20:25', null, '浙江省金华市永康市', '永康市', ',926,986,', '986');
INSERT INTO `xx_area` VALUES ('996', '2014-05-15 00:20:26', '2014-05-15 00:20:26', null, '浙江省衢州市', '衢州市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('997', '2014-05-15 00:20:27', '2014-05-15 00:20:27', null, '浙江省衢州市柯城区', '柯城区', ',926,996,', '996');
INSERT INTO `xx_area` VALUES ('998', '2014-05-15 00:20:28', '2014-05-15 00:20:28', null, '浙江省衢州市衢江区', '衢江区', ',926,996,', '996');
INSERT INTO `xx_area` VALUES ('999', '2014-05-15 00:20:29', '2014-05-15 00:20:29', null, '浙江省衢州市常山县', '常山县', ',926,996,', '996');
INSERT INTO `xx_area` VALUES ('1000', '2014-05-15 00:20:30', '2014-05-15 00:20:30', null, '浙江省衢州市开化县', '开化县', ',926,996,', '996');
INSERT INTO `xx_area` VALUES ('1001', '2014-05-15 00:20:31', '2014-05-15 00:20:31', null, '浙江省衢州市龙游县', '龙游县', ',926,996,', '996');
INSERT INTO `xx_area` VALUES ('1002', '2014-05-15 00:20:32', '2014-05-15 00:20:32', null, '浙江省衢州市江山市', '江山市', ',926,996,', '996');
INSERT INTO `xx_area` VALUES ('1003', '2014-05-15 00:20:33', '2014-05-15 00:20:33', null, '浙江省舟山市', '舟山市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('1004', '2014-05-15 00:20:34', '2014-05-15 00:20:34', null, '浙江省舟山市定海区', '定海区', ',926,1003,', '1003');
INSERT INTO `xx_area` VALUES ('1005', '2014-05-15 00:20:35', '2014-05-15 00:20:35', null, '浙江省舟山市普陀区', '普陀区', ',926,1003,', '1003');
INSERT INTO `xx_area` VALUES ('1006', '2014-05-15 00:20:36', '2014-05-15 00:20:36', null, '浙江省舟山市岱山县', '岱山县', ',926,1003,', '1003');
INSERT INTO `xx_area` VALUES ('1007', '2014-05-15 00:20:37', '2014-05-15 00:20:37', null, '浙江省舟山市嵊泗县', '嵊泗县', ',926,1003,', '1003');
INSERT INTO `xx_area` VALUES ('1008', '2014-05-15 00:20:38', '2014-05-15 00:20:38', null, '浙江省台州市', '台州市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('1009', '2014-05-15 00:20:39', '2014-05-15 00:20:39', null, '浙江省台州市椒江区', '椒江区', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1010', '2014-05-15 00:20:40', '2014-05-15 00:20:40', null, '浙江省台州市黄岩区', '黄岩区', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1011', '2014-05-15 00:20:41', '2014-05-15 00:20:41', null, '浙江省台州市路桥区', '路桥区', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1012', '2014-05-15 00:20:42', '2014-05-15 00:20:42', null, '浙江省台州市玉环县', '玉环县', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1013', '2014-05-15 00:20:43', '2014-05-15 00:20:43', null, '浙江省台州市三门县', '三门县', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1014', '2014-05-15 00:20:44', '2014-05-15 00:20:44', null, '浙江省台州市天台县', '天台县', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1015', '2014-05-15 00:20:45', '2014-05-15 00:20:45', null, '浙江省台州市仙居县', '仙居县', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1016', '2014-05-15 00:20:46', '2014-05-15 00:20:46', null, '浙江省台州市温岭市', '温岭市', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1017', '2014-05-15 00:20:47', '2014-05-15 00:20:47', null, '浙江省台州市临海市', '临海市', ',926,1008,', '1008');
INSERT INTO `xx_area` VALUES ('1018', '2014-05-15 00:20:48', '2014-05-15 00:20:48', null, '浙江省丽水市', '丽水市', ',926,', '926');
INSERT INTO `xx_area` VALUES ('1019', '2014-05-15 00:20:49', '2014-05-15 00:20:49', null, '浙江省丽水市莲都区', '莲都区', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1020', '2014-05-15 00:20:50', '2014-05-15 00:20:50', null, '浙江省丽水市青田县', '青田县', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1021', '2014-05-15 00:20:51', '2014-05-15 00:20:51', null, '浙江省丽水市缙云县', '缙云县', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1022', '2014-05-15 00:20:52', '2014-05-15 00:20:52', null, '浙江省丽水市遂昌县', '遂昌县', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1023', '2014-05-15 00:20:53', '2014-05-15 00:20:53', null, '浙江省丽水市松阳县', '松阳县', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1024', '2014-05-15 00:20:54', '2014-05-15 00:20:54', null, '浙江省丽水市云和县', '云和县', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1025', '2014-05-15 00:20:55', '2014-05-15 00:20:55', null, '浙江省丽水市庆元县', '庆元县', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1026', '2014-05-15 00:20:56', '2014-05-15 00:20:56', null, '浙江省丽水市景宁畲族自治县', '景宁畲族自治县', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1027', '2014-05-15 00:20:57', '2014-05-15 00:20:57', null, '浙江省丽水市龙泉市', '龙泉市', ',926,1018,', '1018');
INSERT INTO `xx_area` VALUES ('1028', '2014-05-15 00:20:58', '2014-05-15 00:20:58', null, '安徽省', '安徽省', ',', null);
INSERT INTO `xx_area` VALUES ('1029', '2014-05-15 00:20:59', '2014-05-15 00:20:59', null, '安徽省合肥市', '合肥市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1030', '2014-05-15 00:21:00', '2014-05-15 00:21:00', null, '安徽省合肥市瑶海区', '瑶海区', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1031', '2014-05-15 00:21:01', '2014-05-15 00:21:01', null, '安徽省合肥市庐阳区', '庐阳区', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1032', '2014-05-15 00:21:02', '2014-05-15 00:21:02', null, '安徽省合肥市蜀山区', '蜀山区', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1033', '2014-05-15 00:21:03', '2014-05-15 00:21:03', null, '安徽省合肥市包河区', '包河区', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1034', '2014-05-15 00:21:04', '2014-05-15 00:21:04', null, '安徽省合肥市长丰县', '长丰县', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1035', '2014-05-15 00:21:05', '2014-05-15 00:21:05', null, '安徽省合肥市肥东县', '肥东县', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1036', '2014-05-15 00:21:06', '2014-05-15 00:21:06', null, '安徽省合肥市肥西县', '肥西县', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1037', '2014-05-15 00:21:07', '2014-05-15 00:21:07', null, '安徽省合肥市庐江县', '庐江县', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1038', '2014-05-15 00:21:08', '2014-05-15 00:21:08', null, '安徽省合肥市巢湖市', '巢湖市', ',1028,1029,', '1029');
INSERT INTO `xx_area` VALUES ('1039', '2014-05-15 00:21:09', '2014-05-15 00:21:09', null, '安徽省芜湖市', '芜湖市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1040', '2014-05-15 00:21:10', '2014-05-15 00:21:10', null, '安徽省芜湖市镜湖区', '镜湖区', ',1028,1039,', '1039');
INSERT INTO `xx_area` VALUES ('1041', '2014-05-15 00:21:11', '2014-05-15 00:21:11', null, '安徽省芜湖市弋江区', '弋江区', ',1028,1039,', '1039');
INSERT INTO `xx_area` VALUES ('1042', '2014-05-15 00:21:12', '2014-05-15 00:21:12', null, '安徽省芜湖市鸠江区', '鸠江区', ',1028,1039,', '1039');
INSERT INTO `xx_area` VALUES ('1043', '2014-05-15 00:21:13', '2014-05-15 00:21:13', null, '安徽省芜湖市三山区', '三山区', ',1028,1039,', '1039');
INSERT INTO `xx_area` VALUES ('1044', '2014-05-15 00:21:14', '2014-05-15 00:21:14', null, '安徽省芜湖市芜湖县', '芜湖县', ',1028,1039,', '1039');
INSERT INTO `xx_area` VALUES ('1045', '2014-05-15 00:21:15', '2014-05-15 00:21:15', null, '安徽省芜湖市繁昌县', '繁昌县', ',1028,1039,', '1039');
INSERT INTO `xx_area` VALUES ('1046', '2014-05-15 00:21:16', '2014-05-15 00:21:16', null, '安徽省芜湖市南陵县', '南陵县', ',1028,1039,', '1039');
INSERT INTO `xx_area` VALUES ('1047', '2014-05-15 00:21:17', '2014-05-15 00:21:17', null, '安徽省芜湖市无为县', '无为县', ',1028,1039,', '1039');
INSERT INTO `xx_area` VALUES ('1048', '2014-05-15 00:21:18', '2014-05-15 00:21:18', null, '安徽省蚌埠市', '蚌埠市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1049', '2014-05-15 00:21:19', '2014-05-15 00:21:19', null, '安徽省蚌埠市龙子湖区', '龙子湖区', ',1028,1048,', '1048');
INSERT INTO `xx_area` VALUES ('1050', '2014-05-15 00:21:20', '2014-05-15 00:21:20', null, '安徽省蚌埠市蚌山区', '蚌山区', ',1028,1048,', '1048');
INSERT INTO `xx_area` VALUES ('1051', '2014-05-15 00:21:21', '2014-05-15 00:21:21', null, '安徽省蚌埠市禹会区', '禹会区', ',1028,1048,', '1048');
INSERT INTO `xx_area` VALUES ('1052', '2014-05-15 00:21:22', '2014-05-15 00:21:22', null, '安徽省蚌埠市淮上区', '淮上区', ',1028,1048,', '1048');
INSERT INTO `xx_area` VALUES ('1053', '2014-05-15 00:21:23', '2014-05-15 00:21:23', null, '安徽省蚌埠市怀远县', '怀远县', ',1028,1048,', '1048');
INSERT INTO `xx_area` VALUES ('1054', '2014-05-15 00:21:24', '2014-05-15 00:21:24', null, '安徽省蚌埠市五河县', '五河县', ',1028,1048,', '1048');
INSERT INTO `xx_area` VALUES ('1055', '2014-05-15 00:21:25', '2014-05-15 00:21:25', null, '安徽省蚌埠市固镇县', '固镇县', ',1028,1048,', '1048');
INSERT INTO `xx_area` VALUES ('1056', '2014-05-15 00:21:26', '2014-05-15 00:21:26', null, '安徽省淮南市', '淮南市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1057', '2014-05-15 00:21:27', '2014-05-15 00:21:27', null, '安徽省淮南市大通区', '大通区', ',1028,1056,', '1056');
INSERT INTO `xx_area` VALUES ('1058', '2014-05-15 00:21:28', '2014-05-15 00:21:28', null, '安徽省淮南市田家庵区', '田家庵区', ',1028,1056,', '1056');
INSERT INTO `xx_area` VALUES ('1059', '2014-05-15 00:21:29', '2014-05-15 00:21:29', null, '安徽省淮南市谢家集区', '谢家集区', ',1028,1056,', '1056');
INSERT INTO `xx_area` VALUES ('1060', '2014-05-15 00:21:30', '2014-05-15 00:21:30', null, '安徽省淮南市八公山区', '八公山区', ',1028,1056,', '1056');
INSERT INTO `xx_area` VALUES ('1061', '2014-05-15 00:21:31', '2014-05-15 00:21:31', null, '安徽省淮南市潘集区', '潘集区', ',1028,1056,', '1056');
INSERT INTO `xx_area` VALUES ('1062', '2014-05-15 00:21:32', '2014-05-15 00:21:32', null, '安徽省淮南市凤台县', '凤台县', ',1028,1056,', '1056');
INSERT INTO `xx_area` VALUES ('1063', '2014-05-15 00:21:33', '2014-05-15 00:21:33', null, '安徽省马鞍山市', '马鞍山市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1064', '2014-05-15 00:21:34', '2014-05-15 00:21:34', null, '安徽省马鞍山市花山区', '花山区', ',1028,1063,', '1063');
INSERT INTO `xx_area` VALUES ('1065', '2014-05-15 00:21:35', '2014-05-15 00:21:35', null, '安徽省马鞍山市雨山区', '雨山区', ',1028,1063,', '1063');
INSERT INTO `xx_area` VALUES ('1066', '2014-05-15 00:21:36', '2014-05-15 00:21:36', null, '安徽省马鞍山市博望区', '博望区', ',1028,1063,', '1063');
INSERT INTO `xx_area` VALUES ('1067', '2014-05-15 00:21:37', '2014-05-15 00:21:37', null, '安徽省马鞍山市当涂县', '当涂县', ',1028,1063,', '1063');
INSERT INTO `xx_area` VALUES ('1068', '2014-05-15 00:21:38', '2014-05-15 00:21:38', null, '安徽省马鞍山市含山县', '含山县', ',1028,1063,', '1063');
INSERT INTO `xx_area` VALUES ('1069', '2014-05-15 00:21:39', '2014-05-15 00:21:39', null, '安徽省马鞍山市和县', '和县', ',1028,1063,', '1063');
INSERT INTO `xx_area` VALUES ('1070', '2014-05-15 00:21:40', '2014-05-15 00:21:40', null, '安徽省淮北市', '淮北市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1071', '2014-05-15 00:21:41', '2014-05-15 00:21:41', null, '安徽省淮北市杜集区', '杜集区', ',1028,1070,', '1070');
INSERT INTO `xx_area` VALUES ('1072', '2014-05-15 00:21:42', '2014-05-15 00:21:42', null, '安徽省淮北市相山区', '相山区', ',1028,1070,', '1070');
INSERT INTO `xx_area` VALUES ('1073', '2014-05-15 00:21:43', '2014-05-15 00:21:43', null, '安徽省淮北市烈山区', '烈山区', ',1028,1070,', '1070');
INSERT INTO `xx_area` VALUES ('1074', '2014-05-15 00:21:44', '2014-05-15 00:21:44', null, '安徽省淮北市濉溪县', '濉溪县', ',1028,1070,', '1070');
INSERT INTO `xx_area` VALUES ('1075', '2014-05-15 00:21:45', '2014-05-15 00:21:45', null, '安徽省铜陵市', '铜陵市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1076', '2014-05-15 00:21:46', '2014-05-15 00:21:46', null, '安徽省铜陵市铜官山区', '铜官山区', ',1028,1075,', '1075');
INSERT INTO `xx_area` VALUES ('1077', '2014-05-15 00:21:47', '2014-05-15 00:21:47', null, '安徽省铜陵市狮子山区', '狮子山区', ',1028,1075,', '1075');
INSERT INTO `xx_area` VALUES ('1078', '2014-05-15 00:21:48', '2014-05-15 00:21:48', null, '安徽省铜陵市郊区', '郊区', ',1028,1075,', '1075');
INSERT INTO `xx_area` VALUES ('1079', '2014-05-15 00:21:49', '2014-05-15 00:21:49', null, '安徽省铜陵市铜陵县', '铜陵县', ',1028,1075,', '1075');
INSERT INTO `xx_area` VALUES ('1080', '2014-05-15 00:21:50', '2014-05-15 00:21:50', null, '安徽省安庆市', '安庆市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1081', '2014-05-15 00:21:51', '2014-05-15 00:21:51', null, '安徽省安庆市迎江区', '迎江区', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1082', '2014-05-15 00:21:52', '2014-05-15 00:21:52', null, '安徽省安庆市大观区', '大观区', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1083', '2014-05-15 00:21:53', '2014-05-15 00:21:53', null, '安徽省安庆市宜秀区', '宜秀区', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1084', '2014-05-15 00:21:54', '2014-05-15 00:21:54', null, '安徽省安庆市怀宁县', '怀宁县', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1085', '2014-05-15 00:21:55', '2014-05-15 00:21:55', null, '安徽省安庆市枞阳县', '枞阳县', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1086', '2014-05-15 00:21:56', '2014-05-15 00:21:56', null, '安徽省安庆市潜山县', '潜山县', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1087', '2014-05-15 00:21:57', '2014-05-15 00:21:57', null, '安徽省安庆市太湖县', '太湖县', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1088', '2014-05-15 00:21:58', '2014-05-15 00:21:58', null, '安徽省安庆市宿松县', '宿松县', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1089', '2014-05-15 00:21:59', '2014-05-15 00:21:59', null, '安徽省安庆市望江县', '望江县', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1090', '2014-05-15 00:22:00', '2014-05-15 00:22:00', null, '安徽省安庆市岳西县', '岳西县', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1091', '2014-05-15 00:22:01', '2014-05-15 00:22:01', null, '安徽省安庆市桐城市', '桐城市', ',1028,1080,', '1080');
INSERT INTO `xx_area` VALUES ('1092', '2014-05-15 00:22:02', '2014-05-15 00:22:02', null, '安徽省黄山市', '黄山市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1093', '2014-05-15 00:22:03', '2014-05-15 00:22:03', null, '安徽省黄山市屯溪区', '屯溪区', ',1028,1092,', '1092');
INSERT INTO `xx_area` VALUES ('1094', '2014-05-15 00:22:04', '2014-05-15 00:22:04', null, '安徽省黄山市黄山区', '黄山区', ',1028,1092,', '1092');
INSERT INTO `xx_area` VALUES ('1095', '2014-05-15 00:22:05', '2014-05-15 00:22:05', null, '安徽省黄山市徽州区', '徽州区', ',1028,1092,', '1092');
INSERT INTO `xx_area` VALUES ('1096', '2014-05-15 00:22:06', '2014-05-15 00:22:06', null, '安徽省黄山市歙县', '歙县', ',1028,1092,', '1092');
INSERT INTO `xx_area` VALUES ('1097', '2014-05-15 00:22:07', '2014-05-15 00:22:07', null, '安徽省黄山市休宁县', '休宁县', ',1028,1092,', '1092');
INSERT INTO `xx_area` VALUES ('1098', '2014-05-15 00:22:08', '2014-05-15 00:22:08', null, '安徽省黄山市黟县', '黟县', ',1028,1092,', '1092');
INSERT INTO `xx_area` VALUES ('1099', '2014-05-15 00:22:09', '2014-05-15 00:22:09', null, '安徽省黄山市祁门县', '祁门县', ',1028,1092,', '1092');
INSERT INTO `xx_area` VALUES ('1100', '2014-05-15 00:22:10', '2014-05-15 00:22:10', null, '安徽省滁州市', '滁州市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1101', '2014-05-15 00:22:11', '2014-05-15 00:22:11', null, '安徽省滁州市琅琊区', '琅琊区', ',1028,1100,', '1100');
INSERT INTO `xx_area` VALUES ('1102', '2014-05-15 00:22:12', '2014-05-15 00:22:12', null, '安徽省滁州市南谯区', '南谯区', ',1028,1100,', '1100');
INSERT INTO `xx_area` VALUES ('1103', '2014-05-15 00:22:13', '2014-05-15 00:22:13', null, '安徽省滁州市来安县', '来安县', ',1028,1100,', '1100');
INSERT INTO `xx_area` VALUES ('1104', '2014-05-15 00:22:14', '2014-05-15 00:22:14', null, '安徽省滁州市全椒县', '全椒县', ',1028,1100,', '1100');
INSERT INTO `xx_area` VALUES ('1105', '2014-05-15 00:22:15', '2014-05-15 00:22:15', null, '安徽省滁州市定远县', '定远县', ',1028,1100,', '1100');
INSERT INTO `xx_area` VALUES ('1106', '2014-05-15 00:22:16', '2014-05-15 00:22:16', null, '安徽省滁州市凤阳县', '凤阳县', ',1028,1100,', '1100');
INSERT INTO `xx_area` VALUES ('1107', '2014-05-15 00:22:17', '2014-05-15 00:22:17', null, '安徽省滁州市天长市', '天长市', ',1028,1100,', '1100');
INSERT INTO `xx_area` VALUES ('1108', '2014-05-15 00:22:18', '2014-05-15 00:22:18', null, '安徽省滁州市明光市', '明光市', ',1028,1100,', '1100');
INSERT INTO `xx_area` VALUES ('1109', '2014-05-15 00:22:19', '2014-05-15 00:22:19', null, '安徽省阜阳市', '阜阳市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1110', '2014-05-15 00:22:20', '2014-05-15 00:22:20', null, '安徽省阜阳市颍州区', '颍州区', ',1028,1109,', '1109');
INSERT INTO `xx_area` VALUES ('1111', '2014-05-15 00:22:21', '2014-05-15 00:22:21', null, '安徽省阜阳市颍东区', '颍东区', ',1028,1109,', '1109');
INSERT INTO `xx_area` VALUES ('1112', '2014-05-15 00:22:22', '2014-05-15 00:22:22', null, '安徽省阜阳市颍泉区', '颍泉区', ',1028,1109,', '1109');
INSERT INTO `xx_area` VALUES ('1113', '2014-05-15 00:22:23', '2014-05-15 00:22:23', null, '安徽省阜阳市临泉县', '临泉县', ',1028,1109,', '1109');
INSERT INTO `xx_area` VALUES ('1114', '2014-05-15 00:22:24', '2014-05-15 00:22:24', null, '安徽省阜阳市太和县', '太和县', ',1028,1109,', '1109');
INSERT INTO `xx_area` VALUES ('1115', '2014-05-15 00:22:25', '2014-05-15 00:22:25', null, '安徽省阜阳市阜南县', '阜南县', ',1028,1109,', '1109');
INSERT INTO `xx_area` VALUES ('1116', '2014-05-15 00:22:26', '2014-05-15 00:22:26', null, '安徽省阜阳市颍上县', '颍上县', ',1028,1109,', '1109');
INSERT INTO `xx_area` VALUES ('1117', '2014-05-15 00:22:27', '2014-05-15 00:22:27', null, '安徽省阜阳市界首市', '界首市', ',1028,1109,', '1109');
INSERT INTO `xx_area` VALUES ('1118', '2014-05-15 00:22:28', '2014-05-15 00:22:28', null, '安徽省宿州市', '宿州市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1119', '2014-05-15 00:22:29', '2014-05-15 00:22:29', null, '安徽省宿州市埇桥区', '埇桥区', ',1028,1118,', '1118');
INSERT INTO `xx_area` VALUES ('1120', '2014-05-15 00:22:30', '2014-05-15 00:22:30', null, '安徽省宿州市砀山县', '砀山县', ',1028,1118,', '1118');
INSERT INTO `xx_area` VALUES ('1121', '2014-05-15 00:22:31', '2014-05-15 00:22:31', null, '安徽省宿州市萧县', '萧县', ',1028,1118,', '1118');
INSERT INTO `xx_area` VALUES ('1122', '2014-05-15 00:22:32', '2014-05-15 00:22:32', null, '安徽省宿州市灵璧县', '灵璧县', ',1028,1118,', '1118');
INSERT INTO `xx_area` VALUES ('1123', '2014-05-15 00:22:33', '2014-05-15 00:22:33', null, '安徽省宿州市泗县', '泗县', ',1028,1118,', '1118');
INSERT INTO `xx_area` VALUES ('1124', '2014-05-15 00:22:34', '2014-05-15 00:22:34', null, '安徽省六安市', '六安市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1125', '2014-05-15 00:22:35', '2014-05-15 00:22:35', null, '安徽省六安市金安区', '金安区', ',1028,1124,', '1124');
INSERT INTO `xx_area` VALUES ('1126', '2014-05-15 00:22:36', '2014-05-15 00:22:36', null, '安徽省六安市裕安区', '裕安区', ',1028,1124,', '1124');
INSERT INTO `xx_area` VALUES ('1127', '2014-05-15 00:22:37', '2014-05-15 00:22:37', null, '安徽省六安市寿县', '寿县', ',1028,1124,', '1124');
INSERT INTO `xx_area` VALUES ('1128', '2014-05-15 00:22:38', '2014-05-15 00:22:38', null, '安徽省六安市霍邱县', '霍邱县', ',1028,1124,', '1124');
INSERT INTO `xx_area` VALUES ('1129', '2014-05-15 00:22:39', '2014-05-15 00:22:39', null, '安徽省六安市舒城县', '舒城县', ',1028,1124,', '1124');
INSERT INTO `xx_area` VALUES ('1130', '2014-05-15 00:22:40', '2014-05-15 00:22:40', null, '安徽省六安市金寨县', '金寨县', ',1028,1124,', '1124');
INSERT INTO `xx_area` VALUES ('1131', '2014-05-15 00:22:41', '2014-05-15 00:22:41', null, '安徽省六安市霍山县', '霍山县', ',1028,1124,', '1124');
INSERT INTO `xx_area` VALUES ('1132', '2014-05-15 00:22:42', '2014-05-15 00:22:42', null, '安徽省亳州市', '亳州市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1133', '2014-05-15 00:22:43', '2014-05-15 00:22:43', null, '安徽省亳州市谯城区', '谯城区', ',1028,1132,', '1132');
INSERT INTO `xx_area` VALUES ('1134', '2014-05-15 00:22:44', '2014-05-15 00:22:44', null, '安徽省亳州市涡阳县', '涡阳县', ',1028,1132,', '1132');
INSERT INTO `xx_area` VALUES ('1135', '2014-05-15 00:22:45', '2014-05-15 00:22:45', null, '安徽省亳州市蒙城县', '蒙城县', ',1028,1132,', '1132');
INSERT INTO `xx_area` VALUES ('1136', '2014-05-15 00:22:46', '2014-05-15 00:22:46', null, '安徽省亳州市利辛县', '利辛县', ',1028,1132,', '1132');
INSERT INTO `xx_area` VALUES ('1137', '2014-05-15 00:22:47', '2014-05-15 00:22:47', null, '安徽省池州市', '池州市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1138', '2014-05-15 00:22:48', '2014-05-15 00:22:48', null, '安徽省池州市贵池区', '贵池区', ',1028,1137,', '1137');
INSERT INTO `xx_area` VALUES ('1139', '2014-05-15 00:22:49', '2014-05-15 00:22:49', null, '安徽省池州市东至县', '东至县', ',1028,1137,', '1137');
INSERT INTO `xx_area` VALUES ('1140', '2014-05-15 00:22:50', '2014-05-15 00:22:50', null, '安徽省池州市石台县', '石台县', ',1028,1137,', '1137');
INSERT INTO `xx_area` VALUES ('1141', '2014-05-15 00:22:51', '2014-05-15 00:22:51', null, '安徽省池州市青阳县', '青阳县', ',1028,1137,', '1137');
INSERT INTO `xx_area` VALUES ('1142', '2014-05-15 00:22:52', '2014-05-15 00:22:52', null, '安徽省宣城市', '宣城市', ',1028,', '1028');
INSERT INTO `xx_area` VALUES ('1143', '2014-05-15 00:22:53', '2014-05-15 00:22:53', null, '安徽省宣城市宣州区', '宣州区', ',1028,1142,', '1142');
INSERT INTO `xx_area` VALUES ('1144', '2014-05-15 00:22:54', '2014-05-15 00:22:54', null, '安徽省宣城市郎溪县', '郎溪县', ',1028,1142,', '1142');
INSERT INTO `xx_area` VALUES ('1145', '2014-05-15 00:22:55', '2014-05-15 00:22:55', null, '安徽省宣城市广德县', '广德县', ',1028,1142,', '1142');
INSERT INTO `xx_area` VALUES ('1146', '2014-05-15 00:22:56', '2014-05-15 00:22:56', null, '安徽省宣城市泾县', '泾县', ',1028,1142,', '1142');
INSERT INTO `xx_area` VALUES ('1147', '2014-05-15 00:22:57', '2014-05-15 00:22:57', null, '安徽省宣城市绩溪县', '绩溪县', ',1028,1142,', '1142');
INSERT INTO `xx_area` VALUES ('1148', '2014-05-15 00:22:58', '2014-05-15 00:22:58', null, '安徽省宣城市旌德县', '旌德县', ',1028,1142,', '1142');
INSERT INTO `xx_area` VALUES ('1149', '2014-05-15 00:22:59', '2014-05-15 00:22:59', null, '安徽省宣城市宁国市', '宁国市', ',1028,1142,', '1142');
INSERT INTO `xx_area` VALUES ('1150', '2014-05-15 00:23:00', '2014-05-15 00:23:00', null, '福建省', '福建省', ',', null);
INSERT INTO `xx_area` VALUES ('1151', '2014-05-15 00:23:01', '2014-05-15 00:23:01', null, '福建省福州市', '福州市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1152', '2014-05-15 00:23:02', '2014-05-15 00:23:02', null, '福建省福州市鼓楼区', '鼓楼区', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1153', '2014-05-15 00:23:03', '2014-05-15 00:23:03', null, '福建省福州市台江区', '台江区', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1154', '2014-05-15 00:23:04', '2014-05-15 00:23:04', null, '福建省福州市仓山区', '仓山区', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1155', '2014-05-15 00:23:05', '2014-05-15 00:23:05', null, '福建省福州市马尾区', '马尾区', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1156', '2014-05-15 00:23:06', '2014-05-15 00:23:06', null, '福建省福州市晋安区', '晋安区', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1157', '2014-05-15 00:23:07', '2014-05-15 00:23:07', null, '福建省福州市闽侯县', '闽侯县', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1158', '2014-05-15 00:23:08', '2014-05-15 00:23:08', null, '福建省福州市连江县', '连江县', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1159', '2014-05-15 00:23:09', '2014-05-15 00:23:09', null, '福建省福州市罗源县', '罗源县', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1160', '2014-05-15 00:23:10', '2014-05-15 00:23:10', null, '福建省福州市闽清县', '闽清县', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1161', '2014-05-15 00:23:11', '2014-05-15 00:23:11', null, '福建省福州市永泰县', '永泰县', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1162', '2014-05-15 00:23:12', '2014-05-15 00:23:12', null, '福建省福州市平潭县', '平潭县', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1163', '2014-05-15 00:23:13', '2014-05-15 00:23:13', null, '福建省福州市福清市', '福清市', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1164', '2014-05-15 00:23:14', '2014-05-15 00:23:14', null, '福建省福州市长乐市', '长乐市', ',1150,1151,', '1151');
INSERT INTO `xx_area` VALUES ('1165', '2014-05-15 00:23:15', '2014-05-15 00:23:15', null, '福建省厦门市', '厦门市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1166', '2014-05-15 00:23:16', '2014-05-15 00:23:16', null, '福建省厦门市思明区', '思明区', ',1150,1165,', '1165');
INSERT INTO `xx_area` VALUES ('1167', '2014-05-15 00:23:17', '2014-05-15 00:23:17', null, '福建省厦门市海沧区', '海沧区', ',1150,1165,', '1165');
INSERT INTO `xx_area` VALUES ('1168', '2014-05-15 00:23:18', '2014-05-15 00:23:18', null, '福建省厦门市湖里区', '湖里区', ',1150,1165,', '1165');
INSERT INTO `xx_area` VALUES ('1169', '2014-05-15 00:23:19', '2014-05-15 00:23:19', null, '福建省厦门市集美区', '集美区', ',1150,1165,', '1165');
INSERT INTO `xx_area` VALUES ('1170', '2014-05-15 00:23:20', '2014-05-15 00:23:20', null, '福建省厦门市同安区', '同安区', ',1150,1165,', '1165');
INSERT INTO `xx_area` VALUES ('1171', '2014-05-15 00:23:21', '2014-05-15 00:23:21', null, '福建省厦门市翔安区', '翔安区', ',1150,1165,', '1165');
INSERT INTO `xx_area` VALUES ('1172', '2014-05-15 00:23:22', '2014-05-15 00:23:22', null, '福建省莆田市', '莆田市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1173', '2014-05-15 00:23:23', '2014-05-15 00:23:23', null, '福建省莆田市城厢区', '城厢区', ',1150,1172,', '1172');
INSERT INTO `xx_area` VALUES ('1174', '2014-05-15 00:23:24', '2014-05-15 00:23:24', null, '福建省莆田市涵江区', '涵江区', ',1150,1172,', '1172');
INSERT INTO `xx_area` VALUES ('1175', '2014-05-15 00:23:25', '2014-05-15 00:23:25', null, '福建省莆田市荔城区', '荔城区', ',1150,1172,', '1172');
INSERT INTO `xx_area` VALUES ('1176', '2014-05-15 00:23:26', '2014-05-15 00:23:26', null, '福建省莆田市秀屿区', '秀屿区', ',1150,1172,', '1172');
INSERT INTO `xx_area` VALUES ('1177', '2014-05-15 00:23:27', '2014-05-15 00:23:27', null, '福建省莆田市仙游县', '仙游县', ',1150,1172,', '1172');
INSERT INTO `xx_area` VALUES ('1178', '2014-05-15 00:23:28', '2014-05-15 00:23:28', null, '福建省三明市', '三明市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1179', '2014-05-15 00:23:29', '2014-05-15 00:23:29', null, '福建省三明市梅列区', '梅列区', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1180', '2014-05-15 00:23:30', '2014-05-15 00:23:30', null, '福建省三明市三元区', '三元区', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1181', '2014-05-15 00:23:31', '2014-05-15 00:23:31', null, '福建省三明市明溪县', '明溪县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1182', '2014-05-15 00:23:32', '2014-05-15 00:23:32', null, '福建省三明市清流县', '清流县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1183', '2014-05-15 00:23:33', '2014-05-15 00:23:33', null, '福建省三明市宁化县', '宁化县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1184', '2014-05-15 00:23:34', '2014-05-15 00:23:34', null, '福建省三明市大田县', '大田县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1185', '2014-05-15 00:23:35', '2014-05-15 00:23:35', null, '福建省三明市尤溪县', '尤溪县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1186', '2014-05-15 00:23:36', '2014-05-15 00:23:36', null, '福建省三明市沙县', '沙县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1187', '2014-05-15 00:23:37', '2014-05-15 00:23:37', null, '福建省三明市将乐县', '将乐县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1188', '2014-05-15 00:23:38', '2014-05-15 00:23:38', null, '福建省三明市泰宁县', '泰宁县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1189', '2014-05-15 00:23:39', '2014-05-15 00:23:39', null, '福建省三明市建宁县', '建宁县', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1190', '2014-05-15 00:23:40', '2014-05-15 00:23:40', null, '福建省三明市永安市', '永安市', ',1150,1178,', '1178');
INSERT INTO `xx_area` VALUES ('1191', '2014-05-15 00:23:41', '2014-05-15 00:23:41', null, '福建省泉州市', '泉州市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1192', '2014-05-15 00:23:42', '2014-05-15 00:23:42', null, '福建省泉州市鲤城区', '鲤城区', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1193', '2014-05-15 00:23:43', '2014-05-15 00:23:43', null, '福建省泉州市丰泽区', '丰泽区', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1194', '2014-05-15 00:23:44', '2014-05-15 00:23:44', null, '福建省泉州市洛江区', '洛江区', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1195', '2014-05-15 00:23:45', '2014-05-15 00:23:45', null, '福建省泉州市泉港区', '泉港区', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1196', '2014-05-15 00:23:46', '2014-05-15 00:23:46', null, '福建省泉州市惠安县', '惠安县', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1197', '2014-05-15 00:23:47', '2014-05-15 00:23:47', null, '福建省泉州市安溪县', '安溪县', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1198', '2014-05-15 00:23:48', '2014-05-15 00:23:48', null, '福建省泉州市永春县', '永春县', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1199', '2014-05-15 00:23:49', '2014-05-15 00:23:49', null, '福建省泉州市德化县', '德化县', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1200', '2014-05-15 00:23:50', '2014-05-15 00:23:50', null, '福建省泉州市金门县', '金门县', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1201', '2014-05-15 00:23:51', '2014-05-15 00:23:51', null, '福建省泉州市石狮市', '石狮市', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1202', '2014-05-15 00:23:52', '2014-05-15 00:23:52', null, '福建省泉州市晋江市', '晋江市', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1203', '2014-05-15 00:23:53', '2014-05-15 00:23:53', null, '福建省泉州市南安市', '南安市', ',1150,1191,', '1191');
INSERT INTO `xx_area` VALUES ('1204', '2014-05-15 00:23:54', '2014-05-15 00:23:54', null, '福建省漳州市', '漳州市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1205', '2014-05-15 00:23:55', '2014-05-15 00:23:55', null, '福建省漳州市芗城区', '芗城区', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1206', '2014-05-15 00:23:56', '2014-05-15 00:23:56', null, '福建省漳州市龙文区', '龙文区', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1207', '2014-05-15 00:23:57', '2014-05-15 00:23:57', null, '福建省漳州市云霄县', '云霄县', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1208', '2014-05-15 00:23:58', '2014-05-15 00:23:58', null, '福建省漳州市漳浦县', '漳浦县', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1209', '2014-05-15 00:23:59', '2014-05-15 00:23:59', null, '福建省漳州市诏安县', '诏安县', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1210', '2014-05-15 00:24:00', '2014-05-15 00:24:00', null, '福建省漳州市长泰县', '长泰县', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1211', '2014-05-15 00:24:01', '2014-05-15 00:24:01', null, '福建省漳州市东山县', '东山县', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1212', '2014-05-15 00:24:02', '2014-05-15 00:24:02', null, '福建省漳州市南靖县', '南靖县', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1213', '2014-05-15 00:24:03', '2014-05-15 00:24:03', null, '福建省漳州市平和县', '平和县', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1214', '2014-05-15 00:24:04', '2014-05-15 00:24:04', null, '福建省漳州市华安县', '华安县', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1215', '2014-05-15 00:24:05', '2014-05-15 00:24:05', null, '福建省漳州市龙海市', '龙海市', ',1150,1204,', '1204');
INSERT INTO `xx_area` VALUES ('1216', '2014-05-15 00:24:06', '2014-05-15 00:24:06', null, '福建省南平市', '南平市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1217', '2014-05-15 00:24:07', '2014-05-15 00:24:07', null, '福建省南平市延平区', '延平区', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1218', '2014-05-15 00:24:08', '2014-05-15 00:24:08', null, '福建省南平市顺昌县', '顺昌县', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1219', '2014-05-15 00:24:09', '2014-05-15 00:24:09', null, '福建省南平市浦城县', '浦城县', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1220', '2014-05-15 00:24:10', '2014-05-15 00:24:10', null, '福建省南平市光泽县', '光泽县', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1221', '2014-05-15 00:24:11', '2014-05-15 00:24:11', null, '福建省南平市松溪县', '松溪县', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1222', '2014-05-15 00:24:12', '2014-05-15 00:24:12', null, '福建省南平市政和县', '政和县', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1223', '2014-05-15 00:24:13', '2014-05-15 00:24:13', null, '福建省南平市邵武市', '邵武市', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1224', '2014-05-15 00:24:14', '2014-05-15 00:24:14', null, '福建省南平市武夷山市', '武夷山市', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1225', '2014-05-15 00:24:15', '2014-05-15 00:24:15', null, '福建省南平市建瓯市', '建瓯市', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1226', '2014-05-15 00:24:16', '2014-05-15 00:24:16', null, '福建省南平市建阳市', '建阳市', ',1150,1216,', '1216');
INSERT INTO `xx_area` VALUES ('1227', '2014-05-15 00:24:17', '2014-05-15 00:24:17', null, '福建省龙岩市', '龙岩市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1228', '2014-05-15 00:24:18', '2014-05-15 00:24:18', null, '福建省龙岩市新罗区', '新罗区', ',1150,1227,', '1227');
INSERT INTO `xx_area` VALUES ('1229', '2014-05-15 00:24:19', '2014-05-15 00:24:19', null, '福建省龙岩市长汀县', '长汀县', ',1150,1227,', '1227');
INSERT INTO `xx_area` VALUES ('1230', '2014-05-15 00:24:20', '2014-05-15 00:24:20', null, '福建省龙岩市永定县', '永定县', ',1150,1227,', '1227');
INSERT INTO `xx_area` VALUES ('1231', '2014-05-15 00:24:21', '2014-05-15 00:24:21', null, '福建省龙岩市上杭县', '上杭县', ',1150,1227,', '1227');
INSERT INTO `xx_area` VALUES ('1232', '2014-05-15 00:24:22', '2014-05-15 00:24:22', null, '福建省龙岩市武平县', '武平县', ',1150,1227,', '1227');
INSERT INTO `xx_area` VALUES ('1233', '2014-05-15 00:24:23', '2014-05-15 00:24:23', null, '福建省龙岩市连城县', '连城县', ',1150,1227,', '1227');
INSERT INTO `xx_area` VALUES ('1234', '2014-05-15 00:24:24', '2014-05-15 00:24:24', null, '福建省龙岩市漳平市', '漳平市', ',1150,1227,', '1227');
INSERT INTO `xx_area` VALUES ('1235', '2014-05-15 00:24:25', '2014-05-15 00:24:25', null, '福建省宁德市', '宁德市', ',1150,', '1150');
INSERT INTO `xx_area` VALUES ('1236', '2014-05-15 00:24:26', '2014-05-15 00:24:26', null, '福建省宁德市蕉城区', '蕉城区', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1237', '2014-05-15 00:24:27', '2014-05-15 00:24:27', null, '福建省宁德市霞浦县', '霞浦县', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1238', '2014-05-15 00:24:28', '2014-05-15 00:24:28', null, '福建省宁德市古田县', '古田县', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1239', '2014-05-15 00:24:29', '2014-05-15 00:24:29', null, '福建省宁德市屏南县', '屏南县', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1240', '2014-05-15 00:24:30', '2014-05-15 00:24:30', null, '福建省宁德市寿宁县', '寿宁县', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1241', '2014-05-15 00:24:31', '2014-05-15 00:24:31', null, '福建省宁德市周宁县', '周宁县', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1242', '2014-05-15 00:24:32', '2014-05-15 00:24:32', null, '福建省宁德市柘荣县', '柘荣县', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1243', '2014-05-15 00:24:33', '2014-05-15 00:24:33', null, '福建省宁德市福安市', '福安市', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1244', '2014-05-15 00:24:34', '2014-05-15 00:24:34', null, '福建省宁德市福鼎市', '福鼎市', ',1150,1235,', '1235');
INSERT INTO `xx_area` VALUES ('1245', '2014-05-15 00:24:35', '2014-05-15 00:24:35', null, '江西省', '江西省', ',', null);
INSERT INTO `xx_area` VALUES ('1246', '2014-05-15 00:24:36', '2014-05-15 00:24:36', null, '江西省南昌市', '南昌市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1247', '2014-05-15 00:24:37', '2014-05-15 00:24:37', null, '江西省南昌市东湖区', '东湖区', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1248', '2014-05-15 00:24:38', '2014-05-15 00:24:38', null, '江西省南昌市西湖区', '西湖区', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1249', '2014-05-15 00:24:39', '2014-05-15 00:24:39', null, '江西省南昌市青云谱区', '青云谱区', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1250', '2014-05-15 00:24:40', '2014-05-15 00:24:40', null, '江西省南昌市湾里区', '湾里区', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1251', '2014-05-15 00:24:41', '2014-05-15 00:24:41', null, '江西省南昌市青山湖区', '青山湖区', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1252', '2014-05-15 00:24:42', '2014-05-15 00:24:42', null, '江西省南昌市南昌县', '南昌县', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1253', '2014-05-15 00:24:43', '2014-05-15 00:24:43', null, '江西省南昌市新建县', '新建县', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1254', '2014-05-15 00:24:44', '2014-05-15 00:24:44', null, '江西省南昌市安义县', '安义县', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1255', '2014-05-15 00:24:45', '2014-05-15 00:24:45', null, '江西省南昌市进贤县', '进贤县', ',1245,1246,', '1246');
INSERT INTO `xx_area` VALUES ('1256', '2014-05-15 00:24:46', '2014-05-15 00:24:46', null, '江西省景德镇市', '景德镇市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1257', '2014-05-15 00:24:47', '2014-05-15 00:24:47', null, '江西省景德镇市昌江区', '昌江区', ',1245,1256,', '1256');
INSERT INTO `xx_area` VALUES ('1258', '2014-05-15 00:24:48', '2014-05-15 00:24:48', null, '江西省景德镇市珠山区', '珠山区', ',1245,1256,', '1256');
INSERT INTO `xx_area` VALUES ('1259', '2014-05-15 00:24:49', '2014-05-15 00:24:49', null, '江西省景德镇市浮梁县', '浮梁县', ',1245,1256,', '1256');
INSERT INTO `xx_area` VALUES ('1260', '2014-05-15 00:24:50', '2014-05-15 00:24:50', null, '江西省景德镇市乐平市', '乐平市', ',1245,1256,', '1256');
INSERT INTO `xx_area` VALUES ('1261', '2014-05-15 00:24:51', '2014-05-15 00:24:51', null, '江西省萍乡市', '萍乡市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1262', '2014-05-15 00:24:52', '2014-05-15 00:24:52', null, '江西省萍乡市安源区', '安源区', ',1245,1261,', '1261');
INSERT INTO `xx_area` VALUES ('1263', '2014-05-15 00:24:53', '2014-05-15 00:24:53', null, '江西省萍乡市湘东区', '湘东区', ',1245,1261,', '1261');
INSERT INTO `xx_area` VALUES ('1264', '2014-05-15 00:24:54', '2014-05-15 00:24:54', null, '江西省萍乡市莲花县', '莲花县', ',1245,1261,', '1261');
INSERT INTO `xx_area` VALUES ('1265', '2014-05-15 00:24:55', '2014-05-15 00:24:55', null, '江西省萍乡市上栗县', '上栗县', ',1245,1261,', '1261');
INSERT INTO `xx_area` VALUES ('1266', '2014-05-15 00:24:56', '2014-05-15 00:24:56', null, '江西省萍乡市芦溪县', '芦溪县', ',1245,1261,', '1261');
INSERT INTO `xx_area` VALUES ('1267', '2014-05-15 00:24:57', '2014-05-15 00:24:57', null, '江西省九江市', '九江市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1268', '2014-05-15 00:24:58', '2014-05-15 00:24:58', null, '江西省九江市庐山区', '庐山区', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1269', '2014-05-15 00:24:59', '2014-05-15 00:24:59', null, '江西省九江市浔阳区', '浔阳区', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1270', '2014-05-15 00:25:00', '2014-05-15 00:25:00', null, '江西省九江市九江县', '九江县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1271', '2014-05-15 00:25:01', '2014-05-15 00:25:01', null, '江西省九江市武宁县', '武宁县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1272', '2014-05-15 00:25:02', '2014-05-15 00:25:02', null, '江西省九江市修水县', '修水县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1273', '2014-05-15 00:25:03', '2014-05-15 00:25:03', null, '江西省九江市永修县', '永修县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1274', '2014-05-15 00:25:04', '2014-05-15 00:25:04', null, '江西省九江市德安县', '德安县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1275', '2014-05-15 00:25:05', '2014-05-15 00:25:05', null, '江西省九江市星子县', '星子县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1276', '2014-05-15 00:25:06', '2014-05-15 00:25:06', null, '江西省九江市都昌县', '都昌县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1277', '2014-05-15 00:25:07', '2014-05-15 00:25:07', null, '江西省九江市湖口县', '湖口县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1278', '2014-05-15 00:25:08', '2014-05-15 00:25:08', null, '江西省九江市彭泽县', '彭泽县', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1279', '2014-05-15 00:25:09', '2014-05-15 00:25:09', null, '江西省九江市瑞昌市', '瑞昌市', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1280', '2014-05-15 00:25:10', '2014-05-15 00:25:10', null, '江西省九江市共青城市', '共青城市', ',1245,1267,', '1267');
INSERT INTO `xx_area` VALUES ('1281', '2014-05-15 00:25:11', '2014-05-15 00:25:11', null, '江西省新余市', '新余市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1282', '2014-05-15 00:25:12', '2014-05-15 00:25:12', null, '江西省新余市渝水区', '渝水区', ',1245,1281,', '1281');
INSERT INTO `xx_area` VALUES ('1283', '2014-05-15 00:25:13', '2014-05-15 00:25:13', null, '江西省新余市分宜县', '分宜县', ',1245,1281,', '1281');
INSERT INTO `xx_area` VALUES ('1284', '2014-05-15 00:25:14', '2014-05-15 00:25:14', null, '江西省鹰潭市', '鹰潭市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1285', '2014-05-15 00:25:15', '2014-05-15 00:25:15', null, '江西省鹰潭市月湖区', '月湖区', ',1245,1284,', '1284');
INSERT INTO `xx_area` VALUES ('1286', '2014-05-15 00:25:16', '2014-05-15 00:25:16', null, '江西省鹰潭市余江县', '余江县', ',1245,1284,', '1284');
INSERT INTO `xx_area` VALUES ('1287', '2014-05-15 00:25:17', '2014-05-15 00:25:17', null, '江西省鹰潭市贵溪市', '贵溪市', ',1245,1284,', '1284');
INSERT INTO `xx_area` VALUES ('1288', '2014-05-15 00:25:18', '2014-05-15 00:25:18', null, '江西省赣州市', '赣州市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1289', '2014-05-15 00:25:19', '2014-05-15 00:25:19', null, '江西省赣州市章贡区', '章贡区', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1290', '2014-05-15 00:25:20', '2014-05-15 00:25:20', null, '江西省赣州市赣县', '赣县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1291', '2014-05-15 00:25:21', '2014-05-15 00:25:21', null, '江西省赣州市信丰县', '信丰县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1292', '2014-05-15 00:25:22', '2014-05-15 00:25:22', null, '江西省赣州市大余县', '大余县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1293', '2014-05-15 00:25:23', '2014-05-15 00:25:23', null, '江西省赣州市上犹县', '上犹县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1294', '2014-05-15 00:25:24', '2014-05-15 00:25:24', null, '江西省赣州市崇义县', '崇义县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1295', '2014-05-15 00:25:25', '2014-05-15 00:25:25', null, '江西省赣州市安远县', '安远县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1296', '2014-05-15 00:25:26', '2014-05-15 00:25:26', null, '江西省赣州市龙南县', '龙南县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1297', '2014-05-15 00:25:27', '2014-05-15 00:25:27', null, '江西省赣州市定南县', '定南县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1298', '2014-05-15 00:25:28', '2014-05-15 00:25:28', null, '江西省赣州市全南县', '全南县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1299', '2014-05-15 00:25:29', '2014-05-15 00:25:29', null, '江西省赣州市宁都县', '宁都县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1300', '2014-05-15 00:25:30', '2014-05-15 00:25:30', null, '江西省赣州市于都县', '于都县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1301', '2014-05-15 00:25:31', '2014-05-15 00:25:31', null, '江西省赣州市兴国县', '兴国县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1302', '2014-05-15 00:25:32', '2014-05-15 00:25:32', null, '江西省赣州市会昌县', '会昌县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1303', '2014-05-15 00:25:33', '2014-05-15 00:25:33', null, '江西省赣州市寻乌县', '寻乌县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1304', '2014-05-15 00:25:34', '2014-05-15 00:25:34', null, '江西省赣州市石城县', '石城县', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1305', '2014-05-15 00:25:35', '2014-05-15 00:25:35', null, '江西省赣州市瑞金市', '瑞金市', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1306', '2014-05-15 00:25:36', '2014-05-15 00:25:36', null, '江西省赣州市南康市', '南康市', ',1245,1288,', '1288');
INSERT INTO `xx_area` VALUES ('1307', '2014-05-15 00:25:37', '2014-05-15 00:25:37', null, '江西省吉安市', '吉安市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1308', '2014-05-15 00:25:38', '2014-05-15 00:25:38', null, '江西省吉安市吉州区', '吉州区', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1309', '2014-05-15 00:25:39', '2014-05-15 00:25:39', null, '江西省吉安市青原区', '青原区', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1310', '2014-05-15 00:25:40', '2014-05-15 00:25:40', null, '江西省吉安市吉安县', '吉安县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1311', '2014-05-15 00:25:41', '2014-05-15 00:25:41', null, '江西省吉安市吉水县', '吉水县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1312', '2014-05-15 00:25:42', '2014-05-15 00:25:42', null, '江西省吉安市峡江县', '峡江县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1313', '2014-05-15 00:25:43', '2014-05-15 00:25:43', null, '江西省吉安市新干县', '新干县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1314', '2014-05-15 00:25:44', '2014-05-15 00:25:44', null, '江西省吉安市永丰县', '永丰县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1315', '2014-05-15 00:25:45', '2014-05-15 00:25:45', null, '江西省吉安市泰和县', '泰和县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1316', '2014-05-15 00:25:46', '2014-05-15 00:25:46', null, '江西省吉安市遂川县', '遂川县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1317', '2014-05-15 00:25:47', '2014-05-15 00:25:47', null, '江西省吉安市万安县', '万安县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1318', '2014-05-15 00:25:48', '2014-05-15 00:25:48', null, '江西省吉安市安福县', '安福县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1319', '2014-05-15 00:25:49', '2014-05-15 00:25:49', null, '江西省吉安市永新县', '永新县', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1320', '2014-05-15 00:25:50', '2014-05-15 00:25:50', null, '江西省吉安市井冈山市', '井冈山市', ',1245,1307,', '1307');
INSERT INTO `xx_area` VALUES ('1321', '2014-05-15 00:25:51', '2014-05-15 00:25:51', null, '江西省宜春市', '宜春市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1322', '2014-05-15 00:25:52', '2014-05-15 00:25:52', null, '江西省宜春市袁州区', '袁州区', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1323', '2014-05-15 00:25:53', '2014-05-15 00:25:53', null, '江西省宜春市奉新县', '奉新县', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1324', '2014-05-15 00:25:54', '2014-05-15 00:25:54', null, '江西省宜春市万载县', '万载县', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1325', '2014-05-15 00:25:55', '2014-05-15 00:25:55', null, '江西省宜春市上高县', '上高县', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1326', '2014-05-15 00:25:56', '2014-05-15 00:25:56', null, '江西省宜春市宜丰县', '宜丰县', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1327', '2014-05-15 00:25:57', '2014-05-15 00:25:57', null, '江西省宜春市靖安县', '靖安县', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1328', '2014-05-15 00:25:58', '2014-05-15 00:25:58', null, '江西省宜春市铜鼓县', '铜鼓县', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1329', '2014-05-15 00:25:59', '2014-05-15 00:25:59', null, '江西省宜春市丰城市', '丰城市', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1330', '2014-05-15 00:26:00', '2014-05-15 00:26:00', null, '江西省宜春市樟树市', '樟树市', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1331', '2014-05-15 00:26:01', '2014-05-15 00:26:01', null, '江西省宜春市高安市', '高安市', ',1245,1321,', '1321');
INSERT INTO `xx_area` VALUES ('1332', '2014-05-15 00:26:02', '2014-05-15 00:26:02', null, '江西省抚州市', '抚州市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1333', '2014-05-15 00:26:03', '2014-05-15 00:26:03', null, '江西省抚州市临川区', '临川区', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1334', '2014-05-15 00:26:04', '2014-05-15 00:26:04', null, '江西省抚州市南城县', '南城县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1335', '2014-05-15 00:26:05', '2014-05-15 00:26:05', null, '江西省抚州市黎川县', '黎川县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1336', '2014-05-15 00:26:06', '2014-05-15 00:26:06', null, '江西省抚州市南丰县', '南丰县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1337', '2014-05-15 00:26:07', '2014-05-15 00:26:07', null, '江西省抚州市崇仁县', '崇仁县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1338', '2014-05-15 00:26:08', '2014-05-15 00:26:08', null, '江西省抚州市乐安县', '乐安县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1339', '2014-05-15 00:26:09', '2014-05-15 00:26:09', null, '江西省抚州市宜黄县', '宜黄县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1340', '2014-05-15 00:26:10', '2014-05-15 00:26:10', null, '江西省抚州市金溪县', '金溪县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1341', '2014-05-15 00:26:11', '2014-05-15 00:26:11', null, '江西省抚州市资溪县', '资溪县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1342', '2014-05-15 00:26:12', '2014-05-15 00:26:12', null, '江西省抚州市东乡县', '东乡县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1343', '2014-05-15 00:26:13', '2014-05-15 00:26:13', null, '江西省抚州市广昌县', '广昌县', ',1245,1332,', '1332');
INSERT INTO `xx_area` VALUES ('1344', '2014-05-15 00:26:14', '2014-05-15 00:26:14', null, '江西省上饶市', '上饶市', ',1245,', '1245');
INSERT INTO `xx_area` VALUES ('1345', '2014-05-15 00:26:15', '2014-05-15 00:26:15', null, '江西省上饶市信州区', '信州区', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1346', '2014-05-15 00:26:16', '2014-05-15 00:26:16', null, '江西省上饶市上饶县', '上饶县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1347', '2014-05-15 00:26:17', '2014-05-15 00:26:17', null, '江西省上饶市广丰县', '广丰县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1348', '2014-05-15 00:26:18', '2014-05-15 00:26:18', null, '江西省上饶市玉山县', '玉山县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1349', '2014-05-15 00:26:19', '2014-05-15 00:26:19', null, '江西省上饶市铅山县', '铅山县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1350', '2014-05-15 00:26:20', '2014-05-15 00:26:20', null, '江西省上饶市横峰县', '横峰县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1351', '2014-05-15 00:26:21', '2014-05-15 00:26:21', null, '江西省上饶市弋阳县', '弋阳县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1352', '2014-05-15 00:26:22', '2014-05-15 00:26:22', null, '江西省上饶市余干县', '余干县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1353', '2014-05-15 00:26:23', '2014-05-15 00:26:23', null, '江西省上饶市鄱阳县', '鄱阳县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1354', '2014-05-15 00:26:24', '2014-05-15 00:26:24', null, '江西省上饶市万年县', '万年县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1355', '2014-05-15 00:26:25', '2014-05-15 00:26:25', null, '江西省上饶市婺源县', '婺源县', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1356', '2014-05-15 00:26:26', '2014-05-15 00:26:26', null, '江西省上饶市德兴市', '德兴市', ',1245,1344,', '1344');
INSERT INTO `xx_area` VALUES ('1357', '2014-05-15 00:26:27', '2014-05-15 00:26:27', null, '山东省', '山东省', ',', null);
INSERT INTO `xx_area` VALUES ('1358', '2014-05-15 00:26:28', '2014-05-15 00:26:28', null, '山东省济南市', '济南市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1359', '2014-05-15 00:26:29', '2014-05-15 00:26:29', null, '山东省济南市历下区', '历下区', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1360', '2014-05-15 00:26:30', '2014-05-15 00:26:30', null, '山东省济南市市中区', '市中区', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1361', '2014-05-15 00:26:31', '2014-05-15 00:26:31', null, '山东省济南市槐荫区', '槐荫区', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1362', '2014-05-15 00:26:32', '2014-05-15 00:26:32', null, '山东省济南市天桥区', '天桥区', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1363', '2014-05-15 00:26:33', '2014-05-15 00:26:33', null, '山东省济南市历城区', '历城区', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1364', '2014-05-15 00:26:34', '2014-05-15 00:26:34', null, '山东省济南市长清区', '长清区', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1365', '2014-05-15 00:26:35', '2014-05-15 00:26:35', null, '山东省济南市平阴县', '平阴县', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1366', '2014-05-15 00:26:36', '2014-05-15 00:26:36', null, '山东省济南市济阳县', '济阳县', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1367', '2014-05-15 00:26:37', '2014-05-15 00:26:37', null, '山东省济南市商河县', '商河县', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1368', '2014-05-15 00:26:38', '2014-05-15 00:26:38', null, '山东省济南市章丘市', '章丘市', ',1357,1358,', '1358');
INSERT INTO `xx_area` VALUES ('1369', '2014-05-15 00:26:39', '2014-05-15 00:26:39', null, '山东省青岛市', '青岛市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1370', '2014-05-15 00:26:40', '2014-05-15 00:26:40', null, '山东省青岛市市南区', '市南区', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1371', '2014-05-15 00:26:41', '2014-05-15 00:26:41', null, '山东省青岛市市北区', '市北区', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1372', '2014-05-15 00:26:42', '2014-05-15 00:26:42', null, '山东省青岛市四方区', '四方区', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1373', '2014-05-15 00:26:43', '2014-05-15 00:26:43', null, '山东省青岛市黄岛区', '黄岛区', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1374', '2014-05-15 00:26:44', '2014-05-15 00:26:44', null, '山东省青岛市崂山区', '崂山区', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1375', '2014-05-15 00:26:45', '2014-05-15 00:26:45', null, '山东省青岛市李沧区', '李沧区', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1376', '2014-05-15 00:26:46', '2014-05-15 00:26:46', null, '山东省青岛市城阳区', '城阳区', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1377', '2014-05-15 00:26:47', '2014-05-15 00:26:47', null, '山东省青岛市胶州市', '胶州市', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1378', '2014-05-15 00:26:48', '2014-05-15 00:26:48', null, '山东省青岛市即墨市', '即墨市', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1379', '2014-05-15 00:26:49', '2014-05-15 00:26:49', null, '山东省青岛市平度市', '平度市', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1380', '2014-05-15 00:26:50', '2014-05-15 00:26:50', null, '山东省青岛市胶南市', '胶南市', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1381', '2014-05-15 00:26:51', '2014-05-15 00:26:51', null, '山东省青岛市莱西市', '莱西市', ',1357,1369,', '1369');
INSERT INTO `xx_area` VALUES ('1382', '2014-05-15 00:26:52', '2014-05-15 00:26:52', null, '山东省淄博市', '淄博市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1383', '2014-05-15 00:26:53', '2014-05-15 00:26:53', null, '山东省淄博市淄川区', '淄川区', ',1357,1382,', '1382');
INSERT INTO `xx_area` VALUES ('1384', '2014-05-15 00:26:54', '2014-05-15 00:26:54', null, '山东省淄博市张店区', '张店区', ',1357,1382,', '1382');
INSERT INTO `xx_area` VALUES ('1385', '2014-05-15 00:26:55', '2014-05-15 00:26:55', null, '山东省淄博市博山区', '博山区', ',1357,1382,', '1382');
INSERT INTO `xx_area` VALUES ('1386', '2014-05-15 00:26:56', '2014-05-15 00:26:56', null, '山东省淄博市临淄区', '临淄区', ',1357,1382,', '1382');
INSERT INTO `xx_area` VALUES ('1387', '2014-05-15 00:26:57', '2014-05-15 00:26:57', null, '山东省淄博市周村区', '周村区', ',1357,1382,', '1382');
INSERT INTO `xx_area` VALUES ('1388', '2014-05-15 00:26:58', '2014-05-15 00:26:58', null, '山东省淄博市桓台县', '桓台县', ',1357,1382,', '1382');
INSERT INTO `xx_area` VALUES ('1389', '2014-05-15 00:26:59', '2014-05-15 00:26:59', null, '山东省淄博市高青县', '高青县', ',1357,1382,', '1382');
INSERT INTO `xx_area` VALUES ('1390', '2014-05-15 00:27:00', '2014-05-15 00:27:00', null, '山东省淄博市沂源县', '沂源县', ',1357,1382,', '1382');
INSERT INTO `xx_area` VALUES ('1391', '2014-05-15 00:27:01', '2014-05-15 00:27:01', null, '山东省枣庄市', '枣庄市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1392', '2014-05-15 00:27:02', '2014-05-15 00:27:02', null, '山东省枣庄市市中区', '市中区', ',1357,1391,', '1391');
INSERT INTO `xx_area` VALUES ('1393', '2014-05-15 00:27:03', '2014-05-15 00:27:03', null, '山东省枣庄市薛城区', '薛城区', ',1357,1391,', '1391');
INSERT INTO `xx_area` VALUES ('1394', '2014-05-15 00:27:04', '2014-05-15 00:27:04', null, '山东省枣庄市峄城区', '峄城区', ',1357,1391,', '1391');
INSERT INTO `xx_area` VALUES ('1395', '2014-05-15 00:27:05', '2014-05-15 00:27:05', null, '山东省枣庄市台儿庄区', '台儿庄区', ',1357,1391,', '1391');
INSERT INTO `xx_area` VALUES ('1396', '2014-05-15 00:27:06', '2014-05-15 00:27:06', null, '山东省枣庄市山亭区', '山亭区', ',1357,1391,', '1391');
INSERT INTO `xx_area` VALUES ('1397', '2014-05-15 00:27:07', '2014-05-15 00:27:07', null, '山东省枣庄市滕州市', '滕州市', ',1357,1391,', '1391');
INSERT INTO `xx_area` VALUES ('1398', '2014-05-15 00:27:08', '2014-05-15 00:27:08', null, '山东省东营市', '东营市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1399', '2014-05-15 00:27:09', '2014-05-15 00:27:09', null, '山东省东营市东营区', '东营区', ',1357,1398,', '1398');
INSERT INTO `xx_area` VALUES ('1400', '2014-05-15 00:27:10', '2014-05-15 00:27:10', null, '山东省东营市河口区', '河口区', ',1357,1398,', '1398');
INSERT INTO `xx_area` VALUES ('1401', '2014-05-15 00:27:11', '2014-05-15 00:27:11', null, '山东省东营市垦利县', '垦利县', ',1357,1398,', '1398');
INSERT INTO `xx_area` VALUES ('1402', '2014-05-15 00:27:12', '2014-05-15 00:27:12', null, '山东省东营市利津县', '利津县', ',1357,1398,', '1398');
INSERT INTO `xx_area` VALUES ('1403', '2014-05-15 00:27:13', '2014-05-15 00:27:13', null, '山东省东营市广饶县', '广饶县', ',1357,1398,', '1398');
INSERT INTO `xx_area` VALUES ('1404', '2014-05-15 00:27:14', '2014-05-15 00:27:14', null, '山东省烟台市', '烟台市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1405', '2014-05-15 00:27:15', '2014-05-15 00:27:15', null, '山东省烟台市芝罘区', '芝罘区', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1406', '2014-05-15 00:27:16', '2014-05-15 00:27:16', null, '山东省烟台市福山区', '福山区', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1407', '2014-05-15 00:27:17', '2014-05-15 00:27:17', null, '山东省烟台市牟平区', '牟平区', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1408', '2014-05-15 00:27:18', '2014-05-15 00:27:18', null, '山东省烟台市莱山区', '莱山区', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1409', '2014-05-15 00:27:19', '2014-05-15 00:27:19', null, '山东省烟台市长岛县', '长岛县', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1410', '2014-05-15 00:27:20', '2014-05-15 00:27:20', null, '山东省烟台市龙口市', '龙口市', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1411', '2014-05-15 00:27:21', '2014-05-15 00:27:21', null, '山东省烟台市莱阳市', '莱阳市', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1412', '2014-05-15 00:27:22', '2014-05-15 00:27:22', null, '山东省烟台市莱州市', '莱州市', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1413', '2014-05-15 00:27:23', '2014-05-15 00:27:23', null, '山东省烟台市蓬莱市', '蓬莱市', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1414', '2014-05-15 00:27:24', '2014-05-15 00:27:24', null, '山东省烟台市招远市', '招远市', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1415', '2014-05-15 00:27:25', '2014-05-15 00:27:25', null, '山东省烟台市栖霞市', '栖霞市', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1416', '2014-05-15 00:27:26', '2014-05-15 00:27:26', null, '山东省烟台市海阳市', '海阳市', ',1357,1404,', '1404');
INSERT INTO `xx_area` VALUES ('1417', '2014-05-15 00:27:27', '2014-05-15 00:27:27', null, '山东省潍坊市', '潍坊市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1418', '2014-05-15 00:27:28', '2014-05-15 00:27:28', null, '山东省潍坊市潍城区', '潍城区', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1419', '2014-05-15 00:27:29', '2014-05-15 00:27:29', null, '山东省潍坊市寒亭区', '寒亭区', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1420', '2014-05-15 00:27:30', '2014-05-15 00:27:30', null, '山东省潍坊市坊子区', '坊子区', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1421', '2014-05-15 00:27:31', '2014-05-15 00:27:31', null, '山东省潍坊市奎文区', '奎文区', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1422', '2014-05-15 00:27:32', '2014-05-15 00:27:32', null, '山东省潍坊市临朐县', '临朐县', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1423', '2014-05-15 00:27:33', '2014-05-15 00:27:33', null, '山东省潍坊市昌乐县', '昌乐县', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1424', '2014-05-15 00:27:34', '2014-05-15 00:27:34', null, '山东省潍坊市青州市', '青州市', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1425', '2014-05-15 00:27:35', '2014-05-15 00:27:35', null, '山东省潍坊市诸城市', '诸城市', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1426', '2014-05-15 00:27:36', '2014-05-15 00:27:36', null, '山东省潍坊市寿光市', '寿光市', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1427', '2014-05-15 00:27:37', '2014-05-15 00:27:37', null, '山东省潍坊市安丘市', '安丘市', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1428', '2014-05-15 00:27:38', '2014-05-15 00:27:38', null, '山东省潍坊市高密市', '高密市', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1429', '2014-05-15 00:27:39', '2014-05-15 00:27:39', null, '山东省潍坊市昌邑市', '昌邑市', ',1357,1417,', '1417');
INSERT INTO `xx_area` VALUES ('1430', '2014-05-15 00:27:40', '2014-05-15 00:27:40', null, '山东省济宁市', '济宁市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1431', '2014-05-15 00:27:41', '2014-05-15 00:27:41', null, '山东省济宁市市中区', '市中区', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1432', '2014-05-15 00:27:42', '2014-05-15 00:27:42', null, '山东省济宁市任城区', '任城区', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1433', '2014-05-15 00:27:43', '2014-05-15 00:27:43', null, '山东省济宁市微山县', '微山县', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1434', '2014-05-15 00:27:44', '2014-05-15 00:27:44', null, '山东省济宁市鱼台县', '鱼台县', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1435', '2014-05-15 00:27:45', '2014-05-15 00:27:45', null, '山东省济宁市金乡县', '金乡县', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1436', '2014-05-15 00:27:46', '2014-05-15 00:27:46', null, '山东省济宁市嘉祥县', '嘉祥县', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1437', '2014-05-15 00:27:47', '2014-05-15 00:27:47', null, '山东省济宁市汶上县', '汶上县', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1438', '2014-05-15 00:27:48', '2014-05-15 00:27:48', null, '山东省济宁市泗水县', '泗水县', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1439', '2014-05-15 00:27:49', '2014-05-15 00:27:49', null, '山东省济宁市梁山县', '梁山县', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1440', '2014-05-15 00:27:50', '2014-05-15 00:27:50', null, '山东省济宁市曲阜市', '曲阜市', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1441', '2014-05-15 00:27:51', '2014-05-15 00:27:51', null, '山东省济宁市兖州市', '兖州市', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1442', '2014-05-15 00:27:52', '2014-05-15 00:27:52', null, '山东省济宁市邹城市', '邹城市', ',1357,1430,', '1430');
INSERT INTO `xx_area` VALUES ('1443', '2014-05-15 00:27:53', '2014-05-15 00:27:53', null, '山东省泰安市', '泰安市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1444', '2014-05-15 00:27:54', '2014-05-15 00:27:54', null, '山东省泰安市泰山区', '泰山区', ',1357,1443,', '1443');
INSERT INTO `xx_area` VALUES ('1445', '2014-05-15 00:27:55', '2014-05-15 00:27:55', null, '山东省泰安市岱岳区', '岱岳区', ',1357,1443,', '1443');
INSERT INTO `xx_area` VALUES ('1446', '2014-05-15 00:27:56', '2014-05-15 00:27:56', null, '山东省泰安市宁阳县', '宁阳县', ',1357,1443,', '1443');
INSERT INTO `xx_area` VALUES ('1447', '2014-05-15 00:27:57', '2014-05-15 00:27:57', null, '山东省泰安市东平县', '东平县', ',1357,1443,', '1443');
INSERT INTO `xx_area` VALUES ('1448', '2014-05-15 00:27:58', '2014-05-15 00:27:58', null, '山东省泰安市新泰市', '新泰市', ',1357,1443,', '1443');
INSERT INTO `xx_area` VALUES ('1449', '2014-05-15 00:27:59', '2014-05-15 00:27:59', null, '山东省泰安市肥城市', '肥城市', ',1357,1443,', '1443');
INSERT INTO `xx_area` VALUES ('1450', '2014-05-15 00:28:00', '2014-05-15 00:28:00', null, '山东省威海市', '威海市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1451', '2014-05-15 00:28:01', '2014-05-15 00:28:01', null, '山东省威海市环翠区', '环翠区', ',1357,1450,', '1450');
INSERT INTO `xx_area` VALUES ('1452', '2014-05-15 00:28:02', '2014-05-15 00:28:02', null, '山东省威海市文登市', '文登市', ',1357,1450,', '1450');
INSERT INTO `xx_area` VALUES ('1453', '2014-05-15 00:28:03', '2014-05-15 00:28:03', null, '山东省威海市荣成市', '荣成市', ',1357,1450,', '1450');
INSERT INTO `xx_area` VALUES ('1454', '2014-05-15 00:28:04', '2014-05-15 00:28:04', null, '山东省威海市乳山市', '乳山市', ',1357,1450,', '1450');
INSERT INTO `xx_area` VALUES ('1455', '2014-05-15 00:28:05', '2014-05-15 00:28:05', null, '山东省日照市', '日照市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1456', '2014-05-15 00:28:06', '2014-05-15 00:28:06', null, '山东省日照市东港区', '东港区', ',1357,1455,', '1455');
INSERT INTO `xx_area` VALUES ('1457', '2014-05-15 00:28:07', '2014-05-15 00:28:07', null, '山东省日照市岚山区', '岚山区', ',1357,1455,', '1455');
INSERT INTO `xx_area` VALUES ('1458', '2014-05-15 00:28:08', '2014-05-15 00:28:08', null, '山东省日照市五莲县', '五莲县', ',1357,1455,', '1455');
INSERT INTO `xx_area` VALUES ('1459', '2014-05-15 00:28:09', '2014-05-15 00:28:09', null, '山东省日照市莒县', '莒县', ',1357,1455,', '1455');
INSERT INTO `xx_area` VALUES ('1460', '2014-05-15 00:28:10', '2014-05-15 00:28:10', null, '山东省莱芜市', '莱芜市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1461', '2014-05-15 00:28:11', '2014-05-15 00:28:11', null, '山东省莱芜市莱城区', '莱城区', ',1357,1460,', '1460');
INSERT INTO `xx_area` VALUES ('1462', '2014-05-15 00:28:12', '2014-05-15 00:28:12', null, '山东省莱芜市钢城区', '钢城区', ',1357,1460,', '1460');
INSERT INTO `xx_area` VALUES ('1463', '2014-05-15 00:28:13', '2014-05-15 00:28:13', null, '山东省临沂市', '临沂市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1464', '2014-05-15 00:28:14', '2014-05-15 00:28:14', null, '山东省临沂市兰山区', '兰山区', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1465', '2014-05-15 00:28:15', '2014-05-15 00:28:15', null, '山东省临沂市罗庄区', '罗庄区', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1466', '2014-05-15 00:28:16', '2014-05-15 00:28:16', null, '山东省临沂市河东区', '河东区', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1467', '2014-05-15 00:28:17', '2014-05-15 00:28:17', null, '山东省临沂市沂南县', '沂南县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1468', '2014-05-15 00:28:18', '2014-05-15 00:28:18', null, '山东省临沂市郯城县', '郯城县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1469', '2014-05-15 00:28:19', '2014-05-15 00:28:19', null, '山东省临沂市沂水县', '沂水县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1470', '2014-05-15 00:28:20', '2014-05-15 00:28:20', null, '山东省临沂市苍山县', '苍山县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1471', '2014-05-15 00:28:21', '2014-05-15 00:28:21', null, '山东省临沂市费县', '费县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1472', '2014-05-15 00:28:22', '2014-05-15 00:28:22', null, '山东省临沂市平邑县', '平邑县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1473', '2014-05-15 00:28:23', '2014-05-15 00:28:23', null, '山东省临沂市莒南县', '莒南县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1474', '2014-05-15 00:28:24', '2014-05-15 00:28:24', null, '山东省临沂市蒙阴县', '蒙阴县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1475', '2014-05-15 00:28:25', '2014-05-15 00:28:25', null, '山东省临沂市临沭县', '临沭县', ',1357,1463,', '1463');
INSERT INTO `xx_area` VALUES ('1476', '2014-05-15 00:28:26', '2014-05-15 00:28:26', null, '山东省德州市', '德州市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1477', '2014-05-15 00:28:27', '2014-05-15 00:28:27', null, '山东省德州市德城区', '德城区', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1478', '2014-05-15 00:28:28', '2014-05-15 00:28:28', null, '山东省德州市陵县', '陵县', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1479', '2014-05-15 00:28:29', '2014-05-15 00:28:29', null, '山东省德州市宁津县', '宁津县', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1480', '2014-05-15 00:28:30', '2014-05-15 00:28:30', null, '山东省德州市庆云县', '庆云县', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1481', '2014-05-15 00:28:31', '2014-05-15 00:28:31', null, '山东省德州市临邑县', '临邑县', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1482', '2014-05-15 00:28:32', '2014-05-15 00:28:32', null, '山东省德州市齐河县', '齐河县', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1483', '2014-05-15 00:28:33', '2014-05-15 00:28:33', null, '山东省德州市平原县', '平原县', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1484', '2014-05-15 00:28:34', '2014-05-15 00:28:34', null, '山东省德州市夏津县', '夏津县', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1485', '2014-05-15 00:28:35', '2014-05-15 00:28:35', null, '山东省德州市武城县', '武城县', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1486', '2014-05-15 00:28:36', '2014-05-15 00:28:36', null, '山东省德州市乐陵市', '乐陵市', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1487', '2014-05-15 00:28:37', '2014-05-15 00:28:37', null, '山东省德州市禹城市', '禹城市', ',1357,1476,', '1476');
INSERT INTO `xx_area` VALUES ('1488', '2014-05-15 00:28:38', '2014-05-15 00:28:38', null, '山东省聊城市', '聊城市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1489', '2014-05-15 00:28:39', '2014-05-15 00:28:39', null, '山东省聊城市东昌府区', '东昌府区', ',1357,1488,', '1488');
INSERT INTO `xx_area` VALUES ('1490', '2014-05-15 00:28:40', '2014-05-15 00:28:40', null, '山东省聊城市阳谷县', '阳谷县', ',1357,1488,', '1488');
INSERT INTO `xx_area` VALUES ('1491', '2014-05-15 00:28:41', '2014-05-15 00:28:41', null, '山东省聊城市莘县', '莘县', ',1357,1488,', '1488');
INSERT INTO `xx_area` VALUES ('1492', '2014-05-15 00:28:42', '2014-05-15 00:28:42', null, '山东省聊城市茌平县', '茌平县', ',1357,1488,', '1488');
INSERT INTO `xx_area` VALUES ('1493', '2014-05-15 00:28:43', '2014-05-15 00:28:43', null, '山东省聊城市东阿县', '东阿县', ',1357,1488,', '1488');
INSERT INTO `xx_area` VALUES ('1494', '2014-05-15 00:28:44', '2014-05-15 00:28:44', null, '山东省聊城市冠县', '冠县', ',1357,1488,', '1488');
INSERT INTO `xx_area` VALUES ('1495', '2014-05-15 00:28:45', '2014-05-15 00:28:45', null, '山东省聊城市高唐县', '高唐县', ',1357,1488,', '1488');
INSERT INTO `xx_area` VALUES ('1496', '2014-05-15 00:28:46', '2014-05-15 00:28:46', null, '山东省聊城市临清市', '临清市', ',1357,1488,', '1488');
INSERT INTO `xx_area` VALUES ('1497', '2014-05-15 00:28:47', '2014-05-15 00:28:47', null, '山东省滨州市', '滨州市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1498', '2014-05-15 00:28:48', '2014-05-15 00:28:48', null, '山东省滨州市滨城区', '滨城区', ',1357,1497,', '1497');
INSERT INTO `xx_area` VALUES ('1499', '2014-05-15 00:28:49', '2014-05-15 00:28:49', null, '山东省滨州市惠民县', '惠民县', ',1357,1497,', '1497');
INSERT INTO `xx_area` VALUES ('1500', '2014-05-15 00:28:50', '2014-05-15 00:28:50', null, '山东省滨州市阳信县', '阳信县', ',1357,1497,', '1497');
INSERT INTO `xx_area` VALUES ('1501', '2014-05-15 00:28:51', '2014-05-15 00:28:51', null, '山东省滨州市无棣县', '无棣县', ',1357,1497,', '1497');
INSERT INTO `xx_area` VALUES ('1502', '2014-05-15 00:28:52', '2014-05-15 00:28:52', null, '山东省滨州市沾化县', '沾化县', ',1357,1497,', '1497');
INSERT INTO `xx_area` VALUES ('1503', '2014-05-15 00:28:53', '2014-05-15 00:28:53', null, '山东省滨州市博兴县', '博兴县', ',1357,1497,', '1497');
INSERT INTO `xx_area` VALUES ('1504', '2014-05-15 00:28:54', '2014-05-15 00:28:54', null, '山东省滨州市邹平县', '邹平县', ',1357,1497,', '1497');
INSERT INTO `xx_area` VALUES ('1505', '2014-05-15 00:28:55', '2014-05-15 00:28:55', null, '山东省菏泽市', '菏泽市', ',1357,', '1357');
INSERT INTO `xx_area` VALUES ('1506', '2014-05-15 00:28:56', '2014-05-15 00:28:56', null, '山东省菏泽市牡丹区', '牡丹区', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1507', '2014-05-15 00:28:57', '2014-05-15 00:28:57', null, '山东省菏泽市曹县', '曹县', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1508', '2014-05-15 00:28:58', '2014-05-15 00:28:58', null, '山东省菏泽市单县', '单县', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1509', '2014-05-15 00:28:59', '2014-05-15 00:28:59', null, '山东省菏泽市成武县', '成武县', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1510', '2014-05-15 00:29:00', '2014-05-15 00:29:00', null, '山东省菏泽市巨野县', '巨野县', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1511', '2014-05-15 00:29:01', '2014-05-15 00:29:01', null, '山东省菏泽市郓城县', '郓城县', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1512', '2014-05-15 00:29:02', '2014-05-15 00:29:02', null, '山东省菏泽市鄄城县', '鄄城县', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1513', '2014-05-15 00:29:03', '2014-05-15 00:29:03', null, '山东省菏泽市定陶县', '定陶县', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1514', '2014-05-15 00:29:04', '2014-05-15 00:29:04', null, '山东省菏泽市东明县', '东明县', ',1357,1505,', '1505');
INSERT INTO `xx_area` VALUES ('1515', '2014-05-15 00:29:05', '2014-05-15 00:29:05', null, '河南省', '河南省', ',', null);
INSERT INTO `xx_area` VALUES ('1516', '2014-05-15 00:29:06', '2014-05-15 00:29:06', null, '河南省郑州市', '郑州市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1517', '2014-05-15 00:29:07', '2014-05-15 00:29:07', null, '河南省郑州市中原区', '中原区', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1518', '2014-05-15 00:29:08', '2014-05-15 00:29:08', null, '河南省郑州市二七区', '二七区', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1519', '2014-05-15 00:29:09', '2014-05-15 00:29:09', null, '河南省郑州市管城回族区', '管城回族区', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1520', '2014-05-15 00:29:10', '2014-05-15 00:29:10', null, '河南省郑州市金水区', '金水区', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1521', '2014-05-15 00:29:11', '2014-05-15 00:29:11', null, '河南省郑州市上街区', '上街区', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1522', '2014-05-15 00:29:12', '2014-05-15 00:29:12', null, '河南省郑州市惠济区', '惠济区', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1523', '2014-05-15 00:29:13', '2014-05-15 00:29:13', null, '河南省郑州市中牟县', '中牟县', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1524', '2014-05-15 00:29:14', '2014-05-15 00:29:14', null, '河南省郑州市巩义市', '巩义市', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1525', '2014-05-15 00:29:15', '2014-05-15 00:29:15', null, '河南省郑州市荥阳市', '荥阳市', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1526', '2014-05-15 00:29:16', '2014-05-15 00:29:16', null, '河南省郑州市新密市', '新密市', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1527', '2014-05-15 00:29:17', '2014-05-15 00:29:17', null, '河南省郑州市新郑市', '新郑市', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1528', '2014-05-15 00:29:18', '2014-05-15 00:29:18', null, '河南省郑州市登封市', '登封市', ',1515,1516,', '1516');
INSERT INTO `xx_area` VALUES ('1529', '2014-05-15 00:29:19', '2014-05-15 00:29:19', null, '河南省开封市', '开封市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1530', '2014-05-15 00:29:20', '2014-05-15 00:29:20', null, '河南省开封市龙亭区', '龙亭区', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1531', '2014-05-15 00:29:21', '2014-05-15 00:29:21', null, '河南省开封市顺河回族区', '顺河回族区', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1532', '2014-05-15 00:29:22', '2014-05-15 00:29:22', null, '河南省开封市鼓楼区', '鼓楼区', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1533', '2014-05-15 00:29:23', '2014-05-15 00:29:23', null, '河南省开封市禹王台区', '禹王台区', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1534', '2014-05-15 00:29:24', '2014-05-15 00:29:24', null, '河南省开封市金明区', '金明区', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1535', '2014-05-15 00:29:25', '2014-05-15 00:29:25', null, '河南省开封市杞县', '杞县', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1536', '2014-05-15 00:29:26', '2014-05-15 00:29:26', null, '河南省开封市通许县', '通许县', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1537', '2014-05-15 00:29:27', '2014-05-15 00:29:27', null, '河南省开封市尉氏县', '尉氏县', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1538', '2014-05-15 00:29:28', '2014-05-15 00:29:28', null, '河南省开封市开封县', '开封县', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1539', '2014-05-15 00:29:29', '2014-05-15 00:29:29', null, '河南省开封市兰考县', '兰考县', ',1515,1529,', '1529');
INSERT INTO `xx_area` VALUES ('1540', '2014-05-15 00:29:30', '2014-05-15 00:29:30', null, '河南省洛阳市', '洛阳市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1541', '2014-05-15 00:29:31', '2014-05-15 00:29:31', null, '河南省洛阳市老城区', '老城区', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1542', '2014-05-15 00:29:32', '2014-05-15 00:29:32', null, '河南省洛阳市西工区', '西工区', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1543', '2014-05-15 00:29:33', '2014-05-15 00:29:33', null, '河南省洛阳市瀍河回族区', '瀍河回族区', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1544', '2014-05-15 00:29:34', '2014-05-15 00:29:34', null, '河南省洛阳市涧西区', '涧西区', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1545', '2014-05-15 00:29:35', '2014-05-15 00:29:35', null, '河南省洛阳市吉利区', '吉利区', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1546', '2014-05-15 00:29:36', '2014-05-15 00:29:36', null, '河南省洛阳市洛龙区', '洛龙区', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1547', '2014-05-15 00:29:37', '2014-05-15 00:29:37', null, '河南省洛阳市孟津县', '孟津县', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1548', '2014-05-15 00:29:38', '2014-05-15 00:29:38', null, '河南省洛阳市新安县', '新安县', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1549', '2014-05-15 00:29:39', '2014-05-15 00:29:39', null, '河南省洛阳市栾川县', '栾川县', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1550', '2014-05-15 00:29:40', '2014-05-15 00:29:40', null, '河南省洛阳市嵩县', '嵩县', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1551', '2014-05-15 00:29:41', '2014-05-15 00:29:41', null, '河南省洛阳市汝阳县', '汝阳县', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1552', '2014-05-15 00:29:42', '2014-05-15 00:29:42', null, '河南省洛阳市宜阳县', '宜阳县', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1553', '2014-05-15 00:29:43', '2014-05-15 00:29:43', null, '河南省洛阳市洛宁县', '洛宁县', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1554', '2014-05-15 00:29:44', '2014-05-15 00:29:44', null, '河南省洛阳市伊川县', '伊川县', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1555', '2014-05-15 00:29:45', '2014-05-15 00:29:45', null, '河南省洛阳市偃师市', '偃师市', ',1515,1540,', '1540');
INSERT INTO `xx_area` VALUES ('1556', '2014-05-15 00:29:46', '2014-05-15 00:29:46', null, '河南省平顶山市', '平顶山市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1557', '2014-05-15 00:29:47', '2014-05-15 00:29:47', null, '河南省平顶山市新华区', '新华区', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1558', '2014-05-15 00:29:48', '2014-05-15 00:29:48', null, '河南省平顶山市卫东区', '卫东区', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1559', '2014-05-15 00:29:49', '2014-05-15 00:29:49', null, '河南省平顶山市石龙区', '石龙区', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1560', '2014-05-15 00:29:50', '2014-05-15 00:29:50', null, '河南省平顶山市湛河区', '湛河区', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1561', '2014-05-15 00:29:51', '2014-05-15 00:29:51', null, '河南省平顶山市宝丰县', '宝丰县', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1562', '2014-05-15 00:29:52', '2014-05-15 00:29:52', null, '河南省平顶山市叶县', '叶县', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1563', '2014-05-15 00:29:53', '2014-05-15 00:29:53', null, '河南省平顶山市鲁山县', '鲁山县', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1564', '2014-05-15 00:29:54', '2014-05-15 00:29:54', null, '河南省平顶山市郏县', '郏县', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1565', '2014-05-15 00:29:55', '2014-05-15 00:29:55', null, '河南省平顶山市舞钢市', '舞钢市', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1566', '2014-05-15 00:29:56', '2014-05-15 00:29:56', null, '河南省平顶山市汝州市', '汝州市', ',1515,1556,', '1556');
INSERT INTO `xx_area` VALUES ('1567', '2014-05-15 00:29:57', '2014-05-15 00:29:57', null, '河南省安阳市', '安阳市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1568', '2014-05-15 00:29:58', '2014-05-15 00:29:58', null, '河南省安阳市文峰区', '文峰区', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1569', '2014-05-15 00:29:59', '2014-05-15 00:29:59', null, '河南省安阳市北关区', '北关区', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1570', '2014-05-15 00:30:00', '2014-05-15 00:30:00', null, '河南省安阳市殷都区', '殷都区', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1571', '2014-05-15 00:30:01', '2014-05-15 00:30:01', null, '河南省安阳市龙安区', '龙安区', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1572', '2014-05-15 00:30:02', '2014-05-15 00:30:02', null, '河南省安阳市安阳县', '安阳县', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1573', '2014-05-15 00:30:03', '2014-05-15 00:30:03', null, '河南省安阳市汤阴县', '汤阴县', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1574', '2014-05-15 00:30:04', '2014-05-15 00:30:04', null, '河南省安阳市滑县', '滑县', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1575', '2014-05-15 00:30:05', '2014-05-15 00:30:05', null, '河南省安阳市内黄县', '内黄县', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1576', '2014-05-15 00:30:06', '2014-05-15 00:30:06', null, '河南省安阳市林州市', '林州市', ',1515,1567,', '1567');
INSERT INTO `xx_area` VALUES ('1577', '2014-05-15 00:30:07', '2014-05-15 00:30:07', null, '河南省鹤壁市', '鹤壁市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1578', '2014-05-15 00:30:08', '2014-05-15 00:30:08', null, '河南省鹤壁市鹤山区', '鹤山区', ',1515,1577,', '1577');
INSERT INTO `xx_area` VALUES ('1579', '2014-05-15 00:30:09', '2014-05-15 00:30:09', null, '河南省鹤壁市山城区', '山城区', ',1515,1577,', '1577');
INSERT INTO `xx_area` VALUES ('1580', '2014-05-15 00:30:10', '2014-05-15 00:30:10', null, '河南省鹤壁市淇滨区', '淇滨区', ',1515,1577,', '1577');
INSERT INTO `xx_area` VALUES ('1581', '2014-05-15 00:30:11', '2014-05-15 00:30:11', null, '河南省鹤壁市浚县', '浚县', ',1515,1577,', '1577');
INSERT INTO `xx_area` VALUES ('1582', '2014-05-15 00:30:12', '2014-05-15 00:30:12', null, '河南省鹤壁市淇县', '淇县', ',1515,1577,', '1577');
INSERT INTO `xx_area` VALUES ('1583', '2014-05-15 00:30:13', '2014-05-15 00:30:13', null, '河南省新乡市', '新乡市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1584', '2014-05-15 00:30:14', '2014-05-15 00:30:14', null, '河南省新乡市红旗区', '红旗区', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1585', '2014-05-15 00:30:15', '2014-05-15 00:30:15', null, '河南省新乡市卫滨区', '卫滨区', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1586', '2014-05-15 00:30:16', '2014-05-15 00:30:16', null, '河南省新乡市凤泉区', '凤泉区', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1587', '2014-05-15 00:30:17', '2014-05-15 00:30:17', null, '河南省新乡市牧野区', '牧野区', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1588', '2014-05-15 00:30:18', '2014-05-15 00:30:18', null, '河南省新乡市新乡县', '新乡县', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1589', '2014-05-15 00:30:19', '2014-05-15 00:30:19', null, '河南省新乡市获嘉县', '获嘉县', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1590', '2014-05-15 00:30:20', '2014-05-15 00:30:20', null, '河南省新乡市原阳县', '原阳县', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1591', '2014-05-15 00:30:21', '2014-05-15 00:30:21', null, '河南省新乡市延津县', '延津县', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1592', '2014-05-15 00:30:22', '2014-05-15 00:30:22', null, '河南省新乡市封丘县', '封丘县', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1593', '2014-05-15 00:30:23', '2014-05-15 00:30:23', null, '河南省新乡市长垣县', '长垣县', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1594', '2014-05-15 00:30:24', '2014-05-15 00:30:24', null, '河南省新乡市卫辉市', '卫辉市', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1595', '2014-05-15 00:30:25', '2014-05-15 00:30:25', null, '河南省新乡市辉县市', '辉县市', ',1515,1583,', '1583');
INSERT INTO `xx_area` VALUES ('1596', '2014-05-15 00:30:26', '2014-05-15 00:30:26', null, '河南省焦作市', '焦作市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1597', '2014-05-15 00:30:27', '2014-05-15 00:30:27', null, '河南省焦作市解放区', '解放区', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1598', '2014-05-15 00:30:28', '2014-05-15 00:30:28', null, '河南省焦作市中站区', '中站区', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1599', '2014-05-15 00:30:29', '2014-05-15 00:30:29', null, '河南省焦作市马村区', '马村区', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1600', '2014-05-15 00:30:30', '2014-05-15 00:30:30', null, '河南省焦作市山阳区', '山阳区', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1601', '2014-05-15 00:30:31', '2014-05-15 00:30:31', null, '河南省焦作市修武县', '修武县', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1602', '2014-05-15 00:30:32', '2014-05-15 00:30:32', null, '河南省焦作市博爱县', '博爱县', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1603', '2014-05-15 00:30:33', '2014-05-15 00:30:33', null, '河南省焦作市武陟县', '武陟县', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1604', '2014-05-15 00:30:34', '2014-05-15 00:30:34', null, '河南省焦作市温县', '温县', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1605', '2014-05-15 00:30:35', '2014-05-15 00:30:35', null, '河南省焦作市沁阳市', '沁阳市', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1606', '2014-05-15 00:30:36', '2014-05-15 00:30:36', null, '河南省焦作市孟州市', '孟州市', ',1515,1596,', '1596');
INSERT INTO `xx_area` VALUES ('1607', '2014-05-15 00:30:37', '2014-05-15 00:30:37', null, '河南省濮阳市', '濮阳市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1608', '2014-05-15 00:30:38', '2014-05-15 00:30:38', null, '河南省濮阳市华龙区', '华龙区', ',1515,1607,', '1607');
INSERT INTO `xx_area` VALUES ('1609', '2014-05-15 00:30:39', '2014-05-15 00:30:39', null, '河南省濮阳市清丰县', '清丰县', ',1515,1607,', '1607');
INSERT INTO `xx_area` VALUES ('1610', '2014-05-15 00:30:40', '2014-05-15 00:30:40', null, '河南省濮阳市南乐县', '南乐县', ',1515,1607,', '1607');
INSERT INTO `xx_area` VALUES ('1611', '2014-05-15 00:30:41', '2014-05-15 00:30:41', null, '河南省濮阳市范县', '范县', ',1515,1607,', '1607');
INSERT INTO `xx_area` VALUES ('1612', '2014-05-15 00:30:42', '2014-05-15 00:30:42', null, '河南省濮阳市台前县', '台前县', ',1515,1607,', '1607');
INSERT INTO `xx_area` VALUES ('1613', '2014-05-15 00:30:43', '2014-05-15 00:30:43', null, '河南省濮阳市濮阳县', '濮阳县', ',1515,1607,', '1607');
INSERT INTO `xx_area` VALUES ('1614', '2014-05-15 00:30:44', '2014-05-15 00:30:44', null, '河南省许昌市', '许昌市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1615', '2014-05-15 00:30:45', '2014-05-15 00:30:45', null, '河南省许昌市魏都区', '魏都区', ',1515,1614,', '1614');
INSERT INTO `xx_area` VALUES ('1616', '2014-05-15 00:30:46', '2014-05-15 00:30:46', null, '河南省许昌市许昌县', '许昌县', ',1515,1614,', '1614');
INSERT INTO `xx_area` VALUES ('1617', '2014-05-15 00:30:47', '2014-05-15 00:30:47', null, '河南省许昌市鄢陵县', '鄢陵县', ',1515,1614,', '1614');
INSERT INTO `xx_area` VALUES ('1618', '2014-05-15 00:30:48', '2014-05-15 00:30:48', null, '河南省许昌市襄城县', '襄城县', ',1515,1614,', '1614');
INSERT INTO `xx_area` VALUES ('1619', '2014-05-15 00:30:49', '2014-05-15 00:30:49', null, '河南省许昌市禹州市', '禹州市', ',1515,1614,', '1614');
INSERT INTO `xx_area` VALUES ('1620', '2014-05-15 00:30:50', '2014-05-15 00:30:50', null, '河南省许昌市长葛市', '长葛市', ',1515,1614,', '1614');
INSERT INTO `xx_area` VALUES ('1621', '2014-05-15 00:30:51', '2014-05-15 00:30:51', null, '河南省漯河市', '漯河市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1622', '2014-05-15 00:30:52', '2014-05-15 00:30:52', null, '河南省漯河市源汇区', '源汇区', ',1515,1621,', '1621');
INSERT INTO `xx_area` VALUES ('1623', '2014-05-15 00:30:53', '2014-05-15 00:30:53', null, '河南省漯河市郾城区', '郾城区', ',1515,1621,', '1621');
INSERT INTO `xx_area` VALUES ('1624', '2014-05-15 00:30:54', '2014-05-15 00:30:54', null, '河南省漯河市召陵区', '召陵区', ',1515,1621,', '1621');
INSERT INTO `xx_area` VALUES ('1625', '2014-05-15 00:30:55', '2014-05-15 00:30:55', null, '河南省漯河市舞阳县', '舞阳县', ',1515,1621,', '1621');
INSERT INTO `xx_area` VALUES ('1626', '2014-05-15 00:30:56', '2014-05-15 00:30:56', null, '河南省漯河市临颍县', '临颍县', ',1515,1621,', '1621');
INSERT INTO `xx_area` VALUES ('1627', '2014-05-15 00:30:57', '2014-05-15 00:30:57', null, '河南省三门峡市', '三门峡市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1628', '2014-05-15 00:30:58', '2014-05-15 00:30:58', null, '河南省三门峡市湖滨区', '湖滨区', ',1515,1627,', '1627');
INSERT INTO `xx_area` VALUES ('1629', '2014-05-15 00:30:59', '2014-05-15 00:30:59', null, '河南省三门峡市渑池县', '渑池县', ',1515,1627,', '1627');
INSERT INTO `xx_area` VALUES ('1630', '2014-05-15 00:31:00', '2014-05-15 00:31:00', null, '河南省三门峡市陕县', '陕县', ',1515,1627,', '1627');
INSERT INTO `xx_area` VALUES ('1631', '2014-05-15 00:31:01', '2014-05-15 00:31:01', null, '河南省三门峡市卢氏县', '卢氏县', ',1515,1627,', '1627');
INSERT INTO `xx_area` VALUES ('1632', '2014-05-15 00:31:02', '2014-05-15 00:31:02', null, '河南省三门峡市义马市', '义马市', ',1515,1627,', '1627');
INSERT INTO `xx_area` VALUES ('1633', '2014-05-15 00:31:03', '2014-05-15 00:31:03', null, '河南省三门峡市灵宝市', '灵宝市', ',1515,1627,', '1627');
INSERT INTO `xx_area` VALUES ('1634', '2014-05-15 00:31:04', '2014-05-15 00:31:04', null, '河南省南阳市', '南阳市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1635', '2014-05-15 00:31:05', '2014-05-15 00:31:05', null, '河南省南阳市宛城区', '宛城区', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1636', '2014-05-15 00:31:06', '2014-05-15 00:31:06', null, '河南省南阳市卧龙区', '卧龙区', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1637', '2014-05-15 00:31:07', '2014-05-15 00:31:07', null, '河南省南阳市南召县', '南召县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1638', '2014-05-15 00:31:08', '2014-05-15 00:31:08', null, '河南省南阳市方城县', '方城县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1639', '2014-05-15 00:31:09', '2014-05-15 00:31:09', null, '河南省南阳市西峡县', '西峡县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1640', '2014-05-15 00:31:10', '2014-05-15 00:31:10', null, '河南省南阳市镇平县', '镇平县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1641', '2014-05-15 00:31:11', '2014-05-15 00:31:11', null, '河南省南阳市内乡县', '内乡县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1642', '2014-05-15 00:31:12', '2014-05-15 00:31:12', null, '河南省南阳市淅川县', '淅川县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1643', '2014-05-15 00:31:13', '2014-05-15 00:31:13', null, '河南省南阳市社旗县', '社旗县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1644', '2014-05-15 00:31:14', '2014-05-15 00:31:14', null, '河南省南阳市唐河县', '唐河县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1645', '2014-05-15 00:31:15', '2014-05-15 00:31:15', null, '河南省南阳市新野县', '新野县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1646', '2014-05-15 00:31:16', '2014-05-15 00:31:16', null, '河南省南阳市桐柏县', '桐柏县', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1647', '2014-05-15 00:31:17', '2014-05-15 00:31:17', null, '河南省南阳市邓州市', '邓州市', ',1515,1634,', '1634');
INSERT INTO `xx_area` VALUES ('1648', '2014-05-15 00:31:18', '2014-05-15 00:31:18', null, '河南省商丘市', '商丘市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1649', '2014-05-15 00:31:19', '2014-05-15 00:31:19', null, '河南省商丘市梁园区', '梁园区', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1650', '2014-05-15 00:31:20', '2014-05-15 00:31:20', null, '河南省商丘市睢阳区', '睢阳区', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1651', '2014-05-15 00:31:21', '2014-05-15 00:31:21', null, '河南省商丘市民权县', '民权县', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1652', '2014-05-15 00:31:22', '2014-05-15 00:31:22', null, '河南省商丘市睢县', '睢县', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1653', '2014-05-15 00:31:23', '2014-05-15 00:31:23', null, '河南省商丘市宁陵县', '宁陵县', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1654', '2014-05-15 00:31:24', '2014-05-15 00:31:24', null, '河南省商丘市柘城县', '柘城县', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1655', '2014-05-15 00:31:25', '2014-05-15 00:31:25', null, '河南省商丘市虞城县', '虞城县', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1656', '2014-05-15 00:31:26', '2014-05-15 00:31:26', null, '河南省商丘市夏邑县', '夏邑县', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1657', '2014-05-15 00:31:27', '2014-05-15 00:31:27', null, '河南省商丘市永城市', '永城市', ',1515,1648,', '1648');
INSERT INTO `xx_area` VALUES ('1658', '2014-05-15 00:31:28', '2014-05-15 00:31:28', null, '河南省信阳市', '信阳市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1659', '2014-05-15 00:31:29', '2014-05-15 00:31:29', null, '河南省信阳市浉河区', '浉河区', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1660', '2014-05-15 00:31:30', '2014-05-15 00:31:30', null, '河南省信阳市平桥区', '平桥区', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1661', '2014-05-15 00:31:31', '2014-05-15 00:31:31', null, '河南省信阳市罗山县', '罗山县', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1662', '2014-05-15 00:31:32', '2014-05-15 00:31:32', null, '河南省信阳市光山县', '光山县', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1663', '2014-05-15 00:31:33', '2014-05-15 00:31:33', null, '河南省信阳市新县', '新县', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1664', '2014-05-15 00:31:34', '2014-05-15 00:31:34', null, '河南省信阳市商城县', '商城县', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1665', '2014-05-15 00:31:35', '2014-05-15 00:31:35', null, '河南省信阳市固始县', '固始县', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1666', '2014-05-15 00:31:36', '2014-05-15 00:31:36', null, '河南省信阳市潢川县', '潢川县', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1667', '2014-05-15 00:31:37', '2014-05-15 00:31:37', null, '河南省信阳市淮滨县', '淮滨县', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1668', '2014-05-15 00:31:38', '2014-05-15 00:31:38', null, '河南省信阳市息县', '息县', ',1515,1658,', '1658');
INSERT INTO `xx_area` VALUES ('1669', '2014-05-15 00:31:39', '2014-05-15 00:31:39', null, '河南省周口市', '周口市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1670', '2014-05-15 00:31:40', '2014-05-15 00:31:40', null, '河南省周口市川汇区', '川汇区', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1671', '2014-05-15 00:31:41', '2014-05-15 00:31:41', null, '河南省周口市扶沟县', '扶沟县', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1672', '2014-05-15 00:31:42', '2014-05-15 00:31:42', null, '河南省周口市西华县', '西华县', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1673', '2014-05-15 00:31:43', '2014-05-15 00:31:43', null, '河南省周口市商水县', '商水县', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1674', '2014-05-15 00:31:44', '2014-05-15 00:31:44', null, '河南省周口市沈丘县', '沈丘县', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1675', '2014-05-15 00:31:45', '2014-05-15 00:31:45', null, '河南省周口市郸城县', '郸城县', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1676', '2014-05-15 00:31:46', '2014-05-15 00:31:46', null, '河南省周口市淮阳县', '淮阳县', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1677', '2014-05-15 00:31:47', '2014-05-15 00:31:47', null, '河南省周口市太康县', '太康县', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1678', '2014-05-15 00:31:48', '2014-05-15 00:31:48', null, '河南省周口市鹿邑县', '鹿邑县', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1679', '2014-05-15 00:31:49', '2014-05-15 00:31:49', null, '河南省周口市项城市', '项城市', ',1515,1669,', '1669');
INSERT INTO `xx_area` VALUES ('1680', '2014-05-15 00:31:50', '2014-05-15 00:31:50', null, '河南省驻马店市', '驻马店市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1681', '2014-05-15 00:31:51', '2014-05-15 00:31:51', null, '河南省驻马店市驿城区', '驿城区', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1682', '2014-05-15 00:31:52', '2014-05-15 00:31:52', null, '河南省驻马店市西平县', '西平县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1683', '2014-05-15 00:31:53', '2014-05-15 00:31:53', null, '河南省驻马店市上蔡县', '上蔡县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1684', '2014-05-15 00:31:54', '2014-05-15 00:31:54', null, '河南省驻马店市平舆县', '平舆县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1685', '2014-05-15 00:31:55', '2014-05-15 00:31:55', null, '河南省驻马店市正阳县', '正阳县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1686', '2014-05-15 00:31:56', '2014-05-15 00:31:56', null, '河南省驻马店市确山县', '确山县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1687', '2014-05-15 00:31:57', '2014-05-15 00:31:57', null, '河南省驻马店市泌阳县', '泌阳县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1688', '2014-05-15 00:31:58', '2014-05-15 00:31:58', null, '河南省驻马店市汝南县', '汝南县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1689', '2014-05-15 00:31:59', '2014-05-15 00:31:59', null, '河南省驻马店市遂平县', '遂平县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1690', '2014-05-15 00:32:00', '2014-05-15 00:32:00', null, '河南省驻马店市新蔡县', '新蔡县', ',1515,1680,', '1680');
INSERT INTO `xx_area` VALUES ('1691', '2014-05-15 00:32:01', '2014-05-15 00:32:01', null, '河南省济源市', '济源市', ',1515,', '1515');
INSERT INTO `xx_area` VALUES ('1692', '2014-05-15 00:32:02', '2014-05-15 00:32:02', null, '湖北省', '湖北省', ',', null);
INSERT INTO `xx_area` VALUES ('1693', '2014-05-15 00:32:03', '2014-05-15 00:32:03', null, '湖北省武汉市', '武汉市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1694', '2014-05-15 00:32:04', '2014-05-15 00:32:04', null, '湖北省武汉市江岸区', '江岸区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1695', '2014-05-15 00:32:05', '2014-05-15 00:32:05', null, '湖北省武汉市江汉区', '江汉区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1696', '2014-05-15 00:32:06', '2014-05-15 00:32:06', null, '湖北省武汉市硚口区', '硚口区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1697', '2014-05-15 00:32:07', '2014-05-15 00:32:07', null, '湖北省武汉市汉阳区', '汉阳区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1698', '2014-05-15 00:32:08', '2014-05-15 00:32:08', null, '湖北省武汉市武昌区', '武昌区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1699', '2014-05-15 00:32:09', '2014-05-15 00:32:09', null, '湖北省武汉市青山区', '青山区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1700', '2014-05-15 00:32:10', '2014-05-15 00:32:10', null, '湖北省武汉市洪山区', '洪山区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1701', '2014-05-15 00:32:11', '2014-05-15 00:32:11', null, '湖北省武汉市东西湖区', '东西湖区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1702', '2014-05-15 00:32:12', '2014-05-15 00:32:12', null, '湖北省武汉市汉南区', '汉南区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1703', '2014-05-15 00:32:13', '2014-05-15 00:32:13', null, '湖北省武汉市蔡甸区', '蔡甸区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1704', '2014-05-15 00:32:14', '2014-05-15 00:32:14', null, '湖北省武汉市江夏区', '江夏区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1705', '2014-05-15 00:32:15', '2014-05-15 00:32:15', null, '湖北省武汉市黄陂区', '黄陂区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1706', '2014-05-15 00:32:16', '2014-05-15 00:32:16', null, '湖北省武汉市新洲区', '新洲区', ',1692,1693,', '1693');
INSERT INTO `xx_area` VALUES ('1707', '2014-05-15 00:32:17', '2014-05-15 00:32:17', null, '湖北省黄石市', '黄石市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1708', '2014-05-15 00:32:18', '2014-05-15 00:32:18', null, '湖北省黄石市黄石港区', '黄石港区', ',1692,1707,', '1707');
INSERT INTO `xx_area` VALUES ('1709', '2014-05-15 00:32:19', '2014-05-15 00:32:19', null, '湖北省黄石市西塞山区', '西塞山区', ',1692,1707,', '1707');
INSERT INTO `xx_area` VALUES ('1710', '2014-05-15 00:32:20', '2014-05-15 00:32:20', null, '湖北省黄石市下陆区', '下陆区', ',1692,1707,', '1707');
INSERT INTO `xx_area` VALUES ('1711', '2014-05-15 00:32:21', '2014-05-15 00:32:21', null, '湖北省黄石市铁山区', '铁山区', ',1692,1707,', '1707');
INSERT INTO `xx_area` VALUES ('1712', '2014-05-15 00:32:22', '2014-05-15 00:32:22', null, '湖北省黄石市阳新县', '阳新县', ',1692,1707,', '1707');
INSERT INTO `xx_area` VALUES ('1713', '2014-05-15 00:32:23', '2014-05-15 00:32:23', null, '湖北省黄石市大冶市', '大冶市', ',1692,1707,', '1707');
INSERT INTO `xx_area` VALUES ('1714', '2014-05-15 00:32:24', '2014-05-15 00:32:24', null, '湖北省十堰市', '十堰市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1715', '2014-05-15 00:32:25', '2014-05-15 00:32:25', null, '湖北省十堰市茅箭区', '茅箭区', ',1692,1714,', '1714');
INSERT INTO `xx_area` VALUES ('1716', '2014-05-15 00:32:26', '2014-05-15 00:32:26', null, '湖北省十堰市张湾区', '张湾区', ',1692,1714,', '1714');
INSERT INTO `xx_area` VALUES ('1717', '2014-05-15 00:32:27', '2014-05-15 00:32:27', null, '湖北省十堰市郧县', '郧县', ',1692,1714,', '1714');
INSERT INTO `xx_area` VALUES ('1718', '2014-05-15 00:32:28', '2014-05-15 00:32:28', null, '湖北省十堰市郧西县', '郧西县', ',1692,1714,', '1714');
INSERT INTO `xx_area` VALUES ('1719', '2014-05-15 00:32:29', '2014-05-15 00:32:29', null, '湖北省十堰市竹山县', '竹山县', ',1692,1714,', '1714');
INSERT INTO `xx_area` VALUES ('1720', '2014-05-15 00:32:30', '2014-05-15 00:32:30', null, '湖北省十堰市竹溪县', '竹溪县', ',1692,1714,', '1714');
INSERT INTO `xx_area` VALUES ('1721', '2014-05-15 00:32:31', '2014-05-15 00:32:31', null, '湖北省十堰市房县', '房县', ',1692,1714,', '1714');
INSERT INTO `xx_area` VALUES ('1722', '2014-05-15 00:32:32', '2014-05-15 00:32:32', null, '湖北省十堰市丹江口市', '丹江口市', ',1692,1714,', '1714');
INSERT INTO `xx_area` VALUES ('1723', '2014-05-15 00:32:33', '2014-05-15 00:32:33', null, '湖北省宜昌市', '宜昌市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1724', '2014-05-15 00:32:34', '2014-05-15 00:32:34', null, '湖北省宜昌市西陵区', '西陵区', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1725', '2014-05-15 00:32:35', '2014-05-15 00:32:35', null, '湖北省宜昌市伍家岗区', '伍家岗区', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1726', '2014-05-15 00:32:36', '2014-05-15 00:32:36', null, '湖北省宜昌市点军区', '点军区', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1727', '2014-05-15 00:32:37', '2014-05-15 00:32:37', null, '湖北省宜昌市猇亭区', '猇亭区', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1728', '2014-05-15 00:32:38', '2014-05-15 00:32:38', null, '湖北省宜昌市夷陵区', '夷陵区', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1729', '2014-05-15 00:32:39', '2014-05-15 00:32:39', null, '湖北省宜昌市远安县', '远安县', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1730', '2014-05-15 00:32:40', '2014-05-15 00:32:40', null, '湖北省宜昌市兴山县', '兴山县', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1731', '2014-05-15 00:32:41', '2014-05-15 00:32:41', null, '湖北省宜昌市秭归县', '秭归县', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1732', '2014-05-15 00:32:42', '2014-05-15 00:32:42', null, '湖北省宜昌市长阳土家族自治县', '长阳土家族自治县', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1733', '2014-05-15 00:32:43', '2014-05-15 00:32:43', null, '湖北省宜昌市五峰土家族自治县', '五峰土家族自治县', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1734', '2014-05-15 00:32:44', '2014-05-15 00:32:44', null, '湖北省宜昌市宜都市', '宜都市', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1735', '2014-05-15 00:32:45', '2014-05-15 00:32:45', null, '湖北省宜昌市当阳市', '当阳市', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1736', '2014-05-15 00:32:46', '2014-05-15 00:32:46', null, '湖北省宜昌市枝江市', '枝江市', ',1692,1723,', '1723');
INSERT INTO `xx_area` VALUES ('1737', '2014-05-15 00:32:47', '2014-05-15 00:32:47', null, '湖北省襄阳市', '襄阳市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1738', '2014-05-15 00:32:48', '2014-05-15 00:32:48', null, '湖北省襄阳市襄城区', '襄城区', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1739', '2014-05-15 00:32:49', '2014-05-15 00:32:49', null, '湖北省襄阳市樊城区', '樊城区', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1740', '2014-05-15 00:32:50', '2014-05-15 00:32:50', null, '湖北省襄阳市襄州区', '襄州区', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1741', '2014-05-15 00:32:51', '2014-05-15 00:32:51', null, '湖北省襄阳市南漳县', '南漳县', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1742', '2014-05-15 00:32:52', '2014-05-15 00:32:52', null, '湖北省襄阳市谷城县', '谷城县', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1743', '2014-05-15 00:32:53', '2014-05-15 00:32:53', null, '湖北省襄阳市保康县', '保康县', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1744', '2014-05-15 00:32:54', '2014-05-15 00:32:54', null, '湖北省襄阳市老河口市', '老河口市', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1745', '2014-05-15 00:32:55', '2014-05-15 00:32:55', null, '湖北省襄阳市枣阳市', '枣阳市', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1746', '2014-05-15 00:32:56', '2014-05-15 00:32:56', null, '湖北省襄阳市宜城市', '宜城市', ',1692,1737,', '1737');
INSERT INTO `xx_area` VALUES ('1747', '2014-05-15 00:32:57', '2014-05-15 00:32:57', null, '湖北省鄂州市', '鄂州市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1748', '2014-05-15 00:32:58', '2014-05-15 00:32:58', null, '湖北省鄂州市梁子湖区', '梁子湖区', ',1692,1747,', '1747');
INSERT INTO `xx_area` VALUES ('1749', '2014-05-15 00:32:59', '2014-05-15 00:32:59', null, '湖北省鄂州市华容区', '华容区', ',1692,1747,', '1747');
INSERT INTO `xx_area` VALUES ('1750', '2014-05-15 00:33:00', '2014-05-15 00:33:00', null, '湖北省鄂州市鄂城区', '鄂城区', ',1692,1747,', '1747');
INSERT INTO `xx_area` VALUES ('1751', '2014-05-15 00:33:01', '2014-05-15 00:33:01', null, '湖北省荆门市', '荆门市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1752', '2014-05-15 00:33:02', '2014-05-15 00:33:02', null, '湖北省荆门市东宝区', '东宝区', ',1692,1751,', '1751');
INSERT INTO `xx_area` VALUES ('1753', '2014-05-15 00:33:03', '2014-05-15 00:33:03', null, '湖北省荆门市掇刀区', '掇刀区', ',1692,1751,', '1751');
INSERT INTO `xx_area` VALUES ('1754', '2014-05-15 00:33:04', '2014-05-15 00:33:04', null, '湖北省荆门市京山县', '京山县', ',1692,1751,', '1751');
INSERT INTO `xx_area` VALUES ('1755', '2014-05-15 00:33:05', '2014-05-15 00:33:05', null, '湖北省荆门市沙洋县', '沙洋县', ',1692,1751,', '1751');
INSERT INTO `xx_area` VALUES ('1756', '2014-05-15 00:33:06', '2014-05-15 00:33:06', null, '湖北省荆门市钟祥市', '钟祥市', ',1692,1751,', '1751');
INSERT INTO `xx_area` VALUES ('1757', '2014-05-15 00:33:07', '2014-05-15 00:33:07', null, '湖北省孝感市', '孝感市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1758', '2014-05-15 00:33:08', '2014-05-15 00:33:08', null, '湖北省孝感市孝南区', '孝南区', ',1692,1757,', '1757');
INSERT INTO `xx_area` VALUES ('1759', '2014-05-15 00:33:09', '2014-05-15 00:33:09', null, '湖北省孝感市孝昌县', '孝昌县', ',1692,1757,', '1757');
INSERT INTO `xx_area` VALUES ('1760', '2014-05-15 00:33:10', '2014-05-15 00:33:10', null, '湖北省孝感市大悟县', '大悟县', ',1692,1757,', '1757');
INSERT INTO `xx_area` VALUES ('1761', '2014-05-15 00:33:11', '2014-05-15 00:33:11', null, '湖北省孝感市云梦县', '云梦县', ',1692,1757,', '1757');
INSERT INTO `xx_area` VALUES ('1762', '2014-05-15 00:33:12', '2014-05-15 00:33:12', null, '湖北省孝感市应城市', '应城市', ',1692,1757,', '1757');
INSERT INTO `xx_area` VALUES ('1763', '2014-05-15 00:33:13', '2014-05-15 00:33:13', null, '湖北省孝感市安陆市', '安陆市', ',1692,1757,', '1757');
INSERT INTO `xx_area` VALUES ('1764', '2014-05-15 00:33:14', '2014-05-15 00:33:14', null, '湖北省孝感市汉川市', '汉川市', ',1692,1757,', '1757');
INSERT INTO `xx_area` VALUES ('1765', '2014-05-15 00:33:15', '2014-05-15 00:33:15', null, '湖北省荆州市', '荆州市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1766', '2014-05-15 00:33:16', '2014-05-15 00:33:16', null, '湖北省荆州市沙市区', '沙市区', ',1692,1765,', '1765');
INSERT INTO `xx_area` VALUES ('1767', '2014-05-15 00:33:17', '2014-05-15 00:33:17', null, '湖北省荆州市荆州区', '荆州区', ',1692,1765,', '1765');
INSERT INTO `xx_area` VALUES ('1768', '2014-05-15 00:33:18', '2014-05-15 00:33:18', null, '湖北省荆州市公安县', '公安县', ',1692,1765,', '1765');
INSERT INTO `xx_area` VALUES ('1769', '2014-05-15 00:33:19', '2014-05-15 00:33:19', null, '湖北省荆州市监利县', '监利县', ',1692,1765,', '1765');
INSERT INTO `xx_area` VALUES ('1770', '2014-05-15 00:33:20', '2014-05-15 00:33:20', null, '湖北省荆州市江陵县', '江陵县', ',1692,1765,', '1765');
INSERT INTO `xx_area` VALUES ('1771', '2014-05-15 00:33:21', '2014-05-15 00:33:21', null, '湖北省荆州市石首市', '石首市', ',1692,1765,', '1765');
INSERT INTO `xx_area` VALUES ('1772', '2014-05-15 00:33:22', '2014-05-15 00:33:22', null, '湖北省荆州市洪湖市', '洪湖市', ',1692,1765,', '1765');
INSERT INTO `xx_area` VALUES ('1773', '2014-05-15 00:33:23', '2014-05-15 00:33:23', null, '湖北省荆州市松滋市', '松滋市', ',1692,1765,', '1765');
INSERT INTO `xx_area` VALUES ('1774', '2014-05-15 00:33:24', '2014-05-15 00:33:24', null, '湖北省黄冈市', '黄冈市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1775', '2014-05-15 00:33:25', '2014-05-15 00:33:25', null, '湖北省黄冈市黄州区', '黄州区', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1776', '2014-05-15 00:33:26', '2014-05-15 00:33:26', null, '湖北省黄冈市团风县', '团风县', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1777', '2014-05-15 00:33:27', '2014-05-15 00:33:27', null, '湖北省黄冈市红安县', '红安县', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1778', '2014-05-15 00:33:28', '2014-05-15 00:33:28', null, '湖北省黄冈市罗田县', '罗田县', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1779', '2014-05-15 00:33:29', '2014-05-15 00:33:29', null, '湖北省黄冈市英山县', '英山县', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1780', '2014-05-15 00:33:30', '2014-05-15 00:33:30', null, '湖北省黄冈市浠水县', '浠水县', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1781', '2014-05-15 00:33:31', '2014-05-15 00:33:31', null, '湖北省黄冈市蕲春县', '蕲春县', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1782', '2014-05-15 00:33:32', '2014-05-15 00:33:32', null, '湖北省黄冈市黄梅县', '黄梅县', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1783', '2014-05-15 00:33:33', '2014-05-15 00:33:33', null, '湖北省黄冈市麻城市', '麻城市', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1784', '2014-05-15 00:33:34', '2014-05-15 00:33:34', null, '湖北省黄冈市武穴市', '武穴市', ',1692,1774,', '1774');
INSERT INTO `xx_area` VALUES ('1785', '2014-05-15 00:33:35', '2014-05-15 00:33:35', null, '湖北省咸宁市', '咸宁市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1786', '2014-05-15 00:33:36', '2014-05-15 00:33:36', null, '湖北省咸宁市咸安区', '咸安区', ',1692,1785,', '1785');
INSERT INTO `xx_area` VALUES ('1787', '2014-05-15 00:33:37', '2014-05-15 00:33:37', null, '湖北省咸宁市嘉鱼县', '嘉鱼县', ',1692,1785,', '1785');
INSERT INTO `xx_area` VALUES ('1788', '2014-05-15 00:33:38', '2014-05-15 00:33:38', null, '湖北省咸宁市通城县', '通城县', ',1692,1785,', '1785');
INSERT INTO `xx_area` VALUES ('1789', '2014-05-15 00:33:39', '2014-05-15 00:33:39', null, '湖北省咸宁市崇阳县', '崇阳县', ',1692,1785,', '1785');
INSERT INTO `xx_area` VALUES ('1790', '2014-05-15 00:33:40', '2014-05-15 00:33:40', null, '湖北省咸宁市通山县', '通山县', ',1692,1785,', '1785');
INSERT INTO `xx_area` VALUES ('1791', '2014-05-15 00:33:41', '2014-05-15 00:33:41', null, '湖北省咸宁市赤壁市', '赤壁市', ',1692,1785,', '1785');
INSERT INTO `xx_area` VALUES ('1792', '2014-05-15 00:33:42', '2014-05-15 00:33:42', null, '湖北省随州市', '随州市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1793', '2014-05-15 00:33:43', '2014-05-15 00:33:43', null, '湖北省随州市曾都区', '曾都区', ',1692,1792,', '1792');
INSERT INTO `xx_area` VALUES ('1794', '2014-05-15 00:33:44', '2014-05-15 00:33:44', null, '湖北省随州市随县', '随县', ',1692,1792,', '1792');
INSERT INTO `xx_area` VALUES ('1795', '2014-05-15 00:33:45', '2014-05-15 00:33:45', null, '湖北省随州市广水市', '广水市', ',1692,1792,', '1792');
INSERT INTO `xx_area` VALUES ('1796', '2014-05-15 00:33:46', '2014-05-15 00:33:46', null, '湖北省恩施土家族苗族自治州', '恩施土家族苗族自治州', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1797', '2014-05-15 00:33:47', '2014-05-15 00:33:47', null, '湖北省恩施土家族苗族自治州恩施市', '恩施市', ',1692,1796,', '1796');
INSERT INTO `xx_area` VALUES ('1798', '2014-05-15 00:33:48', '2014-05-15 00:33:48', null, '湖北省恩施土家族苗族自治州利川市', '利川市', ',1692,1796,', '1796');
INSERT INTO `xx_area` VALUES ('1799', '2014-05-15 00:33:49', '2014-05-15 00:33:49', null, '湖北省恩施土家族苗族自治州建始县', '建始县', ',1692,1796,', '1796');
INSERT INTO `xx_area` VALUES ('1800', '2014-05-15 00:33:50', '2014-05-15 00:33:50', null, '湖北省恩施土家族苗族自治州巴东县', '巴东县', ',1692,1796,', '1796');
INSERT INTO `xx_area` VALUES ('1801', '2014-05-15 00:33:51', '2014-05-15 00:33:51', null, '湖北省恩施土家族苗族自治州宣恩县', '宣恩县', ',1692,1796,', '1796');
INSERT INTO `xx_area` VALUES ('1802', '2014-05-15 00:33:52', '2014-05-15 00:33:52', null, '湖北省恩施土家族苗族自治州咸丰县', '咸丰县', ',1692,1796,', '1796');
INSERT INTO `xx_area` VALUES ('1803', '2014-05-15 00:33:53', '2014-05-15 00:33:53', null, '湖北省恩施土家族苗族自治州来凤县', '来凤县', ',1692,1796,', '1796');
INSERT INTO `xx_area` VALUES ('1804', '2014-05-15 00:33:54', '2014-05-15 00:33:54', null, '湖北省恩施土家族苗族自治州鹤峰县', '鹤峰县', ',1692,1796,', '1796');
INSERT INTO `xx_area` VALUES ('1805', '2014-05-15 00:33:55', '2014-05-15 00:33:55', null, '湖北省仙桃市', '仙桃市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1806', '2014-05-15 00:33:56', '2014-05-15 00:33:56', null, '湖北省潜江市', '潜江市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1807', '2014-05-15 00:33:57', '2014-05-15 00:33:57', null, '湖北省天门市', '天门市', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1808', '2014-05-15 00:33:58', '2014-05-15 00:33:58', null, '湖北省神农架林区', '神农架林区', ',1692,', '1692');
INSERT INTO `xx_area` VALUES ('1809', '2014-05-15 00:33:59', '2014-05-15 00:33:59', null, '湖南省', '湖南省', ',', null);
INSERT INTO `xx_area` VALUES ('1810', '2014-05-15 00:34:00', '2014-05-15 00:34:00', null, '湖南省长沙市', '长沙市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1811', '2014-05-15 00:34:01', '2014-05-15 00:34:01', null, '湖南省长沙市芙蓉区', '芙蓉区', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1812', '2014-05-15 00:34:02', '2014-05-15 00:34:02', null, '湖南省长沙市天心区', '天心区', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1813', '2014-05-15 00:34:03', '2014-05-15 00:34:03', null, '湖南省长沙市岳麓区', '岳麓区', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1814', '2014-05-15 00:34:04', '2014-05-15 00:34:04', null, '湖南省长沙市开福区', '开福区', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1815', '2014-05-15 00:34:05', '2014-05-15 00:34:05', null, '湖南省长沙市雨花区', '雨花区', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1816', '2014-05-15 00:34:06', '2014-05-15 00:34:06', null, '湖南省长沙市望城区', '望城区', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1817', '2014-05-15 00:34:07', '2014-05-15 00:34:07', null, '湖南省长沙市长沙县', '长沙县', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1818', '2014-05-15 00:34:08', '2014-05-15 00:34:08', null, '湖南省长沙市宁乡县', '宁乡县', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1819', '2014-05-15 00:34:09', '2014-05-15 00:34:09', null, '湖南省长沙市浏阳市', '浏阳市', ',1809,1810,', '1810');
INSERT INTO `xx_area` VALUES ('1820', '2014-05-15 00:34:10', '2014-05-15 00:34:10', null, '湖南省株洲市', '株洲市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1821', '2014-05-15 00:34:11', '2014-05-15 00:34:11', null, '湖南省株洲市荷塘区', '荷塘区', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1822', '2014-05-15 00:34:12', '2014-05-15 00:34:12', null, '湖南省株洲市芦淞区', '芦淞区', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1823', '2014-05-15 00:34:13', '2014-05-15 00:34:13', null, '湖南省株洲市石峰区', '石峰区', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1824', '2014-05-15 00:34:14', '2014-05-15 00:34:14', null, '湖南省株洲市天元区', '天元区', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1825', '2014-05-15 00:34:15', '2014-05-15 00:34:15', null, '湖南省株洲市株洲县', '株洲县', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1826', '2014-05-15 00:34:16', '2014-05-15 00:34:16', null, '湖南省株洲市攸县', '攸县', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1827', '2014-05-15 00:34:17', '2014-05-15 00:34:17', null, '湖南省株洲市茶陵县', '茶陵县', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1828', '2014-05-15 00:34:18', '2014-05-15 00:34:18', null, '湖南省株洲市炎陵县', '炎陵县', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1829', '2014-05-15 00:34:19', '2014-05-15 00:34:19', null, '湖南省株洲市醴陵市', '醴陵市', ',1809,1820,', '1820');
INSERT INTO `xx_area` VALUES ('1830', '2014-05-15 00:34:20', '2014-05-15 00:34:20', null, '湖南省湘潭市', '湘潭市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1831', '2014-05-15 00:34:21', '2014-05-15 00:34:21', null, '湖南省湘潭市雨湖区', '雨湖区', ',1809,1830,', '1830');
INSERT INTO `xx_area` VALUES ('1832', '2014-05-15 00:34:22', '2014-05-15 00:34:22', null, '湖南省湘潭市岳塘区', '岳塘区', ',1809,1830,', '1830');
INSERT INTO `xx_area` VALUES ('1833', '2014-05-15 00:34:23', '2014-05-15 00:34:23', null, '湖南省湘潭市湘潭县', '湘潭县', ',1809,1830,', '1830');
INSERT INTO `xx_area` VALUES ('1834', '2014-05-15 00:34:24', '2014-05-15 00:34:24', null, '湖南省湘潭市湘乡市', '湘乡市', ',1809,1830,', '1830');
INSERT INTO `xx_area` VALUES ('1835', '2014-05-15 00:34:25', '2014-05-15 00:34:25', null, '湖南省湘潭市韶山市', '韶山市', ',1809,1830,', '1830');
INSERT INTO `xx_area` VALUES ('1836', '2014-05-15 00:34:26', '2014-05-15 00:34:26', null, '湖南省衡阳市', '衡阳市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1837', '2014-05-15 00:34:27', '2014-05-15 00:34:27', null, '湖南省衡阳市珠晖区', '珠晖区', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1838', '2014-05-15 00:34:28', '2014-05-15 00:34:28', null, '湖南省衡阳市雁峰区', '雁峰区', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1839', '2014-05-15 00:34:29', '2014-05-15 00:34:29', null, '湖南省衡阳市石鼓区', '石鼓区', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1840', '2014-05-15 00:34:30', '2014-05-15 00:34:30', null, '湖南省衡阳市蒸湘区', '蒸湘区', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1841', '2014-05-15 00:34:31', '2014-05-15 00:34:31', null, '湖南省衡阳市南岳区', '南岳区', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1842', '2014-05-15 00:34:32', '2014-05-15 00:34:32', null, '湖南省衡阳市衡阳县', '衡阳县', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1843', '2014-05-15 00:34:33', '2014-05-15 00:34:33', null, '湖南省衡阳市衡南县', '衡南县', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1844', '2014-05-15 00:34:34', '2014-05-15 00:34:34', null, '湖南省衡阳市衡山县', '衡山县', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1845', '2014-05-15 00:34:35', '2014-05-15 00:34:35', null, '湖南省衡阳市衡东县', '衡东县', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1846', '2014-05-15 00:34:36', '2014-05-15 00:34:36', null, '湖南省衡阳市祁东县', '祁东县', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1847', '2014-05-15 00:34:37', '2014-05-15 00:34:37', null, '湖南省衡阳市耒阳市', '耒阳市', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1848', '2014-05-15 00:34:38', '2014-05-15 00:34:38', null, '湖南省衡阳市常宁市', '常宁市', ',1809,1836,', '1836');
INSERT INTO `xx_area` VALUES ('1849', '2014-05-15 00:34:39', '2014-05-15 00:34:39', null, '湖南省邵阳市', '邵阳市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1850', '2014-05-15 00:34:40', '2014-05-15 00:34:40', null, '湖南省邵阳市双清区', '双清区', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1851', '2014-05-15 00:34:41', '2014-05-15 00:34:41', null, '湖南省邵阳市大祥区', '大祥区', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1852', '2014-05-15 00:34:42', '2014-05-15 00:34:42', null, '湖南省邵阳市北塔区', '北塔区', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1853', '2014-05-15 00:34:43', '2014-05-15 00:34:43', null, '湖南省邵阳市邵东县', '邵东县', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1854', '2014-05-15 00:34:44', '2014-05-15 00:34:44', null, '湖南省邵阳市新邵县', '新邵县', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1855', '2014-05-15 00:34:45', '2014-05-15 00:34:45', null, '湖南省邵阳市邵阳县', '邵阳县', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1856', '2014-05-15 00:34:46', '2014-05-15 00:34:46', null, '湖南省邵阳市隆回县', '隆回县', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1857', '2014-05-15 00:34:47', '2014-05-15 00:34:47', null, '湖南省邵阳市洞口县', '洞口县', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1858', '2014-05-15 00:34:48', '2014-05-15 00:34:48', null, '湖南省邵阳市绥宁县', '绥宁县', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1859', '2014-05-15 00:34:49', '2014-05-15 00:34:49', null, '湖南省邵阳市新宁县', '新宁县', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1860', '2014-05-15 00:34:50', '2014-05-15 00:34:50', null, '湖南省邵阳市城步苗族自治县', '城步苗族自治县', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1861', '2014-05-15 00:34:51', '2014-05-15 00:34:51', null, '湖南省邵阳市武冈市', '武冈市', ',1809,1849,', '1849');
INSERT INTO `xx_area` VALUES ('1862', '2014-05-15 00:34:52', '2014-05-15 00:34:52', null, '湖南省岳阳市', '岳阳市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1863', '2014-05-15 00:34:53', '2014-05-15 00:34:53', null, '湖南省岳阳市岳阳楼区', '岳阳楼区', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1864', '2014-05-15 00:34:54', '2014-05-15 00:34:54', null, '湖南省岳阳市云溪区', '云溪区', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1865', '2014-05-15 00:34:55', '2014-05-15 00:34:55', null, '湖南省岳阳市君山区', '君山区', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1866', '2014-05-15 00:34:56', '2014-05-15 00:34:56', null, '湖南省岳阳市岳阳县', '岳阳县', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1867', '2014-05-15 00:34:57', '2014-05-15 00:34:57', null, '湖南省岳阳市华容县', '华容县', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1868', '2014-05-15 00:34:58', '2014-05-15 00:34:58', null, '湖南省岳阳市湘阴县', '湘阴县', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1869', '2014-05-15 00:34:59', '2014-05-15 00:34:59', null, '湖南省岳阳市平江县', '平江县', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1870', '2014-05-15 00:35:00', '2014-05-15 00:35:00', null, '湖南省岳阳市汨罗市', '汨罗市', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1871', '2014-05-15 00:35:01', '2014-05-15 00:35:01', null, '湖南省岳阳市临湘市', '临湘市', ',1809,1862,', '1862');
INSERT INTO `xx_area` VALUES ('1872', '2014-05-15 00:35:02', '2014-05-15 00:35:02', null, '湖南省常德市', '常德市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1873', '2014-05-15 00:35:03', '2014-05-15 00:35:03', null, '湖南省常德市武陵区', '武陵区', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1874', '2014-05-15 00:35:04', '2014-05-15 00:35:04', null, '湖南省常德市鼎城区', '鼎城区', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1875', '2014-05-15 00:35:05', '2014-05-15 00:35:05', null, '湖南省常德市安乡县', '安乡县', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1876', '2014-05-15 00:35:06', '2014-05-15 00:35:06', null, '湖南省常德市汉寿县', '汉寿县', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1877', '2014-05-15 00:35:07', '2014-05-15 00:35:07', null, '湖南省常德市澧县', '澧县', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1878', '2014-05-15 00:35:08', '2014-05-15 00:35:08', null, '湖南省常德市临澧县', '临澧县', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1879', '2014-05-15 00:35:09', '2014-05-15 00:35:09', null, '湖南省常德市桃源县', '桃源县', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1880', '2014-05-15 00:35:10', '2014-05-15 00:35:10', null, '湖南省常德市石门县', '石门县', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1881', '2014-05-15 00:35:11', '2014-05-15 00:35:11', null, '湖南省常德市津市市', '津市市', ',1809,1872,', '1872');
INSERT INTO `xx_area` VALUES ('1882', '2014-05-15 00:35:12', '2014-05-15 00:35:12', null, '湖南省张家界市', '张家界市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1883', '2014-05-15 00:35:13', '2014-05-15 00:35:13', null, '湖南省张家界市永定区', '永定区', ',1809,1882,', '1882');
INSERT INTO `xx_area` VALUES ('1884', '2014-05-15 00:35:14', '2014-05-15 00:35:14', null, '湖南省张家界市武陵源区', '武陵源区', ',1809,1882,', '1882');
INSERT INTO `xx_area` VALUES ('1885', '2014-05-15 00:35:15', '2014-05-15 00:35:15', null, '湖南省张家界市慈利县', '慈利县', ',1809,1882,', '1882');
INSERT INTO `xx_area` VALUES ('1886', '2014-05-15 00:35:16', '2014-05-15 00:35:16', null, '湖南省张家界市桑植县', '桑植县', ',1809,1882,', '1882');
INSERT INTO `xx_area` VALUES ('1887', '2014-05-15 00:35:17', '2014-05-15 00:35:17', null, '湖南省益阳市', '益阳市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1888', '2014-05-15 00:35:18', '2014-05-15 00:35:18', null, '湖南省益阳市资阳区', '资阳区', ',1809,1887,', '1887');
INSERT INTO `xx_area` VALUES ('1889', '2014-05-15 00:35:19', '2014-05-15 00:35:19', null, '湖南省益阳市赫山区', '赫山区', ',1809,1887,', '1887');
INSERT INTO `xx_area` VALUES ('1890', '2014-05-15 00:35:20', '2014-05-15 00:35:20', null, '湖南省益阳市南县', '南县', ',1809,1887,', '1887');
INSERT INTO `xx_area` VALUES ('1891', '2014-05-15 00:35:21', '2014-05-15 00:35:21', null, '湖南省益阳市桃江县', '桃江县', ',1809,1887,', '1887');
INSERT INTO `xx_area` VALUES ('1892', '2014-05-15 00:35:22', '2014-05-15 00:35:22', null, '湖南省益阳市安化县', '安化县', ',1809,1887,', '1887');
INSERT INTO `xx_area` VALUES ('1893', '2014-05-15 00:35:23', '2014-05-15 00:35:23', null, '湖南省益阳市沅江市', '沅江市', ',1809,1887,', '1887');
INSERT INTO `xx_area` VALUES ('1894', '2014-05-15 00:35:24', '2014-05-15 00:35:24', null, '湖南省郴州市', '郴州市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1895', '2014-05-15 00:35:25', '2014-05-15 00:35:25', null, '湖南省郴州市北湖区', '北湖区', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1896', '2014-05-15 00:35:26', '2014-05-15 00:35:26', null, '湖南省郴州市苏仙区', '苏仙区', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1897', '2014-05-15 00:35:27', '2014-05-15 00:35:27', null, '湖南省郴州市桂阳县', '桂阳县', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1898', '2014-05-15 00:35:28', '2014-05-15 00:35:28', null, '湖南省郴州市宜章县', '宜章县', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1899', '2014-05-15 00:35:29', '2014-05-15 00:35:29', null, '湖南省郴州市永兴县', '永兴县', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1900', '2014-05-15 00:35:30', '2014-05-15 00:35:30', null, '湖南省郴州市嘉禾县', '嘉禾县', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1901', '2014-05-15 00:35:31', '2014-05-15 00:35:31', null, '湖南省郴州市临武县', '临武县', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1902', '2014-05-15 00:35:32', '2014-05-15 00:35:32', null, '湖南省郴州市汝城县', '汝城县', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1903', '2014-05-15 00:35:33', '2014-05-15 00:35:33', null, '湖南省郴州市桂东县', '桂东县', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1904', '2014-05-15 00:35:34', '2014-05-15 00:35:34', null, '湖南省郴州市安仁县', '安仁县', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1905', '2014-05-15 00:35:35', '2014-05-15 00:35:35', null, '湖南省郴州市资兴市', '资兴市', ',1809,1894,', '1894');
INSERT INTO `xx_area` VALUES ('1906', '2014-05-15 00:35:36', '2014-05-15 00:35:36', null, '湖南省永州市', '永州市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1907', '2014-05-15 00:35:37', '2014-05-15 00:35:37', null, '湖南省永州市零陵区', '零陵区', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1908', '2014-05-15 00:35:38', '2014-05-15 00:35:38', null, '湖南省永州市冷水滩区', '冷水滩区', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1909', '2014-05-15 00:35:39', '2014-05-15 00:35:39', null, '湖南省永州市祁阳县', '祁阳县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1910', '2014-05-15 00:35:40', '2014-05-15 00:35:40', null, '湖南省永州市东安县', '东安县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1911', '2014-05-15 00:35:41', '2014-05-15 00:35:41', null, '湖南省永州市双牌县', '双牌县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1912', '2014-05-15 00:35:42', '2014-05-15 00:35:42', null, '湖南省永州市道县', '道县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1913', '2014-05-15 00:35:43', '2014-05-15 00:35:43', null, '湖南省永州市江永县', '江永县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1914', '2014-05-15 00:35:44', '2014-05-15 00:35:44', null, '湖南省永州市宁远县', '宁远县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1915', '2014-05-15 00:35:45', '2014-05-15 00:35:45', null, '湖南省永州市蓝山县', '蓝山县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1916', '2014-05-15 00:35:46', '2014-05-15 00:35:46', null, '湖南省永州市新田县', '新田县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1917', '2014-05-15 00:35:47', '2014-05-15 00:35:47', null, '湖南省永州市江华瑶族自治县', '江华瑶族自治县', ',1809,1906,', '1906');
INSERT INTO `xx_area` VALUES ('1918', '2014-05-15 00:35:48', '2014-05-15 00:35:48', null, '湖南省怀化市', '怀化市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1919', '2014-05-15 00:35:49', '2014-05-15 00:35:49', null, '湖南省怀化市鹤城区', '鹤城区', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1920', '2014-05-15 00:35:50', '2014-05-15 00:35:50', null, '湖南省怀化市中方县', '中方县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1921', '2014-05-15 00:35:51', '2014-05-15 00:35:51', null, '湖南省怀化市沅陵县', '沅陵县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1922', '2014-05-15 00:35:52', '2014-05-15 00:35:52', null, '湖南省怀化市辰溪县', '辰溪县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1923', '2014-05-15 00:35:53', '2014-05-15 00:35:53', null, '湖南省怀化市溆浦县', '溆浦县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1924', '2014-05-15 00:35:54', '2014-05-15 00:35:54', null, '湖南省怀化市会同县', '会同县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1925', '2014-05-15 00:35:55', '2014-05-15 00:35:55', null, '湖南省怀化市麻阳苗族自治县', '麻阳苗族自治县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1926', '2014-05-15 00:35:56', '2014-05-15 00:35:56', null, '湖南省怀化市新晃侗族自治县', '新晃侗族自治县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1927', '2014-05-15 00:35:57', '2014-05-15 00:35:57', null, '湖南省怀化市芷江侗族自治县', '芷江侗族自治县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1928', '2014-05-15 00:35:58', '2014-05-15 00:35:58', null, '湖南省怀化市靖州苗族侗族自治县', '靖州苗族侗族自治县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1929', '2014-05-15 00:35:59', '2014-05-15 00:35:59', null, '湖南省怀化市通道侗族自治县', '通道侗族自治县', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1930', '2014-05-15 00:36:00', '2014-05-15 00:36:00', null, '湖南省怀化市洪江市', '洪江市', ',1809,1918,', '1918');
INSERT INTO `xx_area` VALUES ('1931', '2014-05-15 00:36:01', '2014-05-15 00:36:01', null, '湖南省娄底市', '娄底市', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1932', '2014-05-15 00:36:02', '2014-05-15 00:36:02', null, '湖南省娄底市娄星区', '娄星区', ',1809,1931,', '1931');
INSERT INTO `xx_area` VALUES ('1933', '2014-05-15 00:36:03', '2014-05-15 00:36:03', null, '湖南省娄底市双峰县', '双峰县', ',1809,1931,', '1931');
INSERT INTO `xx_area` VALUES ('1934', '2014-05-15 00:36:04', '2014-05-15 00:36:04', null, '湖南省娄底市新化县', '新化县', ',1809,1931,', '1931');
INSERT INTO `xx_area` VALUES ('1935', '2014-05-15 00:36:05', '2014-05-15 00:36:05', null, '湖南省娄底市冷水江市', '冷水江市', ',1809,1931,', '1931');
INSERT INTO `xx_area` VALUES ('1936', '2014-05-15 00:36:06', '2014-05-15 00:36:06', null, '湖南省娄底市涟源市', '涟源市', ',1809,1931,', '1931');
INSERT INTO `xx_area` VALUES ('1937', '2014-05-15 00:36:07', '2014-05-15 00:36:07', null, '湖南省湘西土家族苗族自治州', '湘西土家族苗族自治州', ',1809,', '1809');
INSERT INTO `xx_area` VALUES ('1938', '2014-05-15 00:36:08', '2014-05-15 00:36:08', null, '湖南省湘西土家族苗族自治州吉首市', '吉首市', ',1809,1937,', '1937');
INSERT INTO `xx_area` VALUES ('1939', '2014-05-15 00:36:09', '2014-05-15 00:36:09', null, '湖南省湘西土家族苗族自治州泸溪县', '泸溪县', ',1809,1937,', '1937');
INSERT INTO `xx_area` VALUES ('1940', '2014-05-15 00:36:10', '2014-05-15 00:36:10', null, '湖南省湘西土家族苗族自治州凤凰县', '凤凰县', ',1809,1937,', '1937');
INSERT INTO `xx_area` VALUES ('1941', '2014-05-15 00:36:11', '2014-05-15 00:36:11', null, '湖南省湘西土家族苗族自治州花垣县', '花垣县', ',1809,1937,', '1937');
INSERT INTO `xx_area` VALUES ('1942', '2014-05-15 00:36:12', '2014-05-15 00:36:12', null, '湖南省湘西土家族苗族自治州保靖县', '保靖县', ',1809,1937,', '1937');
INSERT INTO `xx_area` VALUES ('1943', '2014-05-15 00:36:13', '2014-05-15 00:36:13', null, '湖南省湘西土家族苗族自治州古丈县', '古丈县', ',1809,1937,', '1937');
INSERT INTO `xx_area` VALUES ('1944', '2014-05-15 00:36:14', '2014-05-15 00:36:14', null, '湖南省湘西土家族苗族自治州永顺县', '永顺县', ',1809,1937,', '1937');
INSERT INTO `xx_area` VALUES ('1945', '2014-05-15 00:36:15', '2014-05-15 00:36:15', null, '湖南省湘西土家族苗族自治州龙山县', '龙山县', ',1809,1937,', '1937');
INSERT INTO `xx_area` VALUES ('1946', '2014-05-15 00:36:16', '2014-05-15 00:36:16', null, '广东省', '广东省', ',', null);
INSERT INTO `xx_area` VALUES ('1947', '2014-05-15 00:36:17', '2014-05-15 00:36:17', null, '广东省广州市', '广州市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('1948', '2014-05-15 00:36:18', '2014-05-15 00:36:18', null, '广东省广州市荔湾区', '荔湾区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1949', '2014-05-15 00:36:19', '2014-05-15 00:36:19', null, '广东省广州市越秀区', '越秀区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1950', '2014-05-15 00:36:20', '2014-05-15 00:36:20', null, '广东省广州市海珠区', '海珠区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1951', '2014-05-15 00:36:21', '2014-05-15 00:36:21', null, '广东省广州市天河区', '天河区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1952', '2014-05-15 00:36:22', '2014-05-15 00:36:22', null, '广东省广州市白云区', '白云区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1953', '2014-05-15 00:36:23', '2014-05-15 00:36:23', null, '广东省广州市黄埔区', '黄埔区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1954', '2014-05-15 00:36:24', '2014-05-15 00:36:24', null, '广东省广州市番禺区', '番禺区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1955', '2014-05-15 00:36:25', '2014-05-15 00:36:25', null, '广东省广州市花都区', '花都区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1956', '2014-05-15 00:36:26', '2014-05-15 00:36:26', null, '广东省广州市南沙区', '南沙区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1957', '2014-05-15 00:36:27', '2014-05-15 00:36:27', null, '广东省广州市萝岗区', '萝岗区', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1958', '2014-05-15 00:36:28', '2014-05-15 00:36:28', null, '广东省广州市增城市', '增城市', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1959', '2014-05-15 00:36:29', '2014-05-15 00:36:29', null, '广东省广州市从化市', '从化市', ',1946,1947,', '1947');
INSERT INTO `xx_area` VALUES ('1960', '2014-05-15 00:36:30', '2014-05-15 00:36:30', null, '广东省韶关市', '韶关市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('1961', '2014-05-15 00:36:31', '2014-05-15 00:36:31', null, '广东省韶关市武江区', '武江区', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1962', '2014-05-15 00:36:32', '2014-05-15 00:36:32', null, '广东省韶关市浈江区', '浈江区', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1963', '2014-05-15 00:36:33', '2014-05-15 00:36:33', null, '广东省韶关市曲江区', '曲江区', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1964', '2014-05-15 00:36:34', '2014-05-15 00:36:34', null, '广东省韶关市始兴县', '始兴县', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1965', '2014-05-15 00:36:35', '2014-05-15 00:36:35', null, '广东省韶关市仁化县', '仁化县', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1966', '2014-05-15 00:36:36', '2014-05-15 00:36:36', null, '广东省韶关市翁源县', '翁源县', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1967', '2014-05-15 00:36:37', '2014-05-15 00:36:37', null, '广东省韶关市乳源瑶族自治县', '乳源瑶族自治县', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1968', '2014-05-15 00:36:38', '2014-05-15 00:36:38', null, '广东省韶关市新丰县', '新丰县', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1969', '2014-05-15 00:36:39', '2014-05-15 00:36:39', null, '广东省韶关市乐昌市', '乐昌市', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1970', '2014-05-15 00:36:40', '2014-05-15 00:36:40', null, '广东省韶关市南雄市', '南雄市', ',1946,1960,', '1960');
INSERT INTO `xx_area` VALUES ('1971', '2014-05-15 00:36:41', '2014-05-15 00:36:41', null, '广东省深圳市', '深圳市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('1972', '2014-05-15 00:36:42', '2014-05-15 00:36:42', null, '广东省深圳市罗湖区', '罗湖区', ',1946,1971,', '1971');
INSERT INTO `xx_area` VALUES ('1973', '2014-05-15 00:36:43', '2014-05-15 00:36:43', null, '广东省深圳市福田区', '福田区', ',1946,1971,', '1971');
INSERT INTO `xx_area` VALUES ('1974', '2014-05-15 00:36:44', '2014-05-15 00:36:44', null, '广东省深圳市南山区', '南山区', ',1946,1971,', '1971');
INSERT INTO `xx_area` VALUES ('1975', '2014-05-15 00:36:45', '2014-05-15 00:36:45', null, '广东省深圳市宝安区', '宝安区', ',1946,1971,', '1971');
INSERT INTO `xx_area` VALUES ('1976', '2014-05-15 00:36:46', '2014-05-15 00:36:46', null, '广东省深圳市龙岗区', '龙岗区', ',1946,1971,', '1971');
INSERT INTO `xx_area` VALUES ('1977', '2014-05-15 00:36:47', '2014-05-15 00:36:47', null, '广东省深圳市盐田区', '盐田区', ',1946,1971,', '1971');
INSERT INTO `xx_area` VALUES ('1978', '2014-05-15 00:36:48', '2014-05-15 00:36:48', null, '广东省珠海市', '珠海市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('1979', '2014-05-15 00:36:49', '2014-05-15 00:36:49', null, '广东省珠海市香洲区', '香洲区', ',1946,1978,', '1978');
INSERT INTO `xx_area` VALUES ('1980', '2014-05-15 00:36:50', '2014-05-15 00:36:50', null, '广东省珠海市斗门区', '斗门区', ',1946,1978,', '1978');
INSERT INTO `xx_area` VALUES ('1981', '2014-05-15 00:36:51', '2014-05-15 00:36:51', null, '广东省珠海市金湾区', '金湾区', ',1946,1978,', '1978');
INSERT INTO `xx_area` VALUES ('1982', '2014-05-15 00:36:52', '2014-05-15 00:36:52', null, '广东省汕头市', '汕头市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('1983', '2014-05-15 00:36:53', '2014-05-15 00:36:53', null, '广东省汕头市龙湖区', '龙湖区', ',1946,1982,', '1982');
INSERT INTO `xx_area` VALUES ('1984', '2014-05-15 00:36:54', '2014-05-15 00:36:54', null, '广东省汕头市金平区', '金平区', ',1946,1982,', '1982');
INSERT INTO `xx_area` VALUES ('1985', '2014-05-15 00:36:55', '2014-05-15 00:36:55', null, '广东省汕头市濠江区', '濠江区', ',1946,1982,', '1982');
INSERT INTO `xx_area` VALUES ('1986', '2014-05-15 00:36:56', '2014-05-15 00:36:56', null, '广东省汕头市潮阳区', '潮阳区', ',1946,1982,', '1982');
INSERT INTO `xx_area` VALUES ('1987', '2014-05-15 00:36:57', '2014-05-15 00:36:57', null, '广东省汕头市潮南区', '潮南区', ',1946,1982,', '1982');
INSERT INTO `xx_area` VALUES ('1988', '2014-05-15 00:36:58', '2014-05-15 00:36:58', null, '广东省汕头市澄海区', '澄海区', ',1946,1982,', '1982');
INSERT INTO `xx_area` VALUES ('1989', '2014-05-15 00:36:59', '2014-05-15 00:36:59', null, '广东省汕头市南澳县', '南澳县', ',1946,1982,', '1982');
INSERT INTO `xx_area` VALUES ('1990', '2014-05-15 00:37:00', '2014-05-15 00:37:00', null, '广东省佛山市', '佛山市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('1991', '2014-05-15 00:37:01', '2014-05-15 00:37:01', null, '广东省佛山市禅城区', '禅城区', ',1946,1990,', '1990');
INSERT INTO `xx_area` VALUES ('1992', '2014-05-15 00:37:02', '2014-05-15 00:37:02', null, '广东省佛山市南海区', '南海区', ',1946,1990,', '1990');
INSERT INTO `xx_area` VALUES ('1993', '2014-05-15 00:37:03', '2014-05-15 00:37:03', null, '广东省佛山市顺德区', '顺德区', ',1946,1990,', '1990');
INSERT INTO `xx_area` VALUES ('1994', '2014-05-15 00:37:04', '2014-05-15 00:37:04', null, '广东省佛山市三水区', '三水区', ',1946,1990,', '1990');
INSERT INTO `xx_area` VALUES ('1995', '2014-05-15 00:37:05', '2014-05-15 00:37:05', null, '广东省佛山市高明区', '高明区', ',1946,1990,', '1990');
INSERT INTO `xx_area` VALUES ('1996', '2014-05-15 00:37:06', '2014-05-15 00:37:06', null, '广东省江门市', '江门市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('1997', '2014-05-15 00:37:07', '2014-05-15 00:37:07', null, '广东省江门市蓬江区', '蓬江区', ',1946,1996,', '1996');
INSERT INTO `xx_area` VALUES ('1998', '2014-05-15 00:37:08', '2014-05-15 00:37:08', null, '广东省江门市江海区', '江海区', ',1946,1996,', '1996');
INSERT INTO `xx_area` VALUES ('1999', '2014-05-15 00:37:09', '2014-05-15 00:37:09', null, '广东省江门市新会区', '新会区', ',1946,1996,', '1996');
INSERT INTO `xx_area` VALUES ('2000', '2014-05-15 00:37:10', '2014-05-15 00:37:10', null, '广东省江门市台山市', '台山市', ',1946,1996,', '1996');
INSERT INTO `xx_area` VALUES ('2001', '2014-05-15 00:37:11', '2014-05-15 00:37:11', null, '广东省江门市开平市', '开平市', ',1946,1996,', '1996');
INSERT INTO `xx_area` VALUES ('2002', '2014-05-15 00:37:12', '2014-05-15 00:37:12', null, '广东省江门市鹤山市', '鹤山市', ',1946,1996,', '1996');
INSERT INTO `xx_area` VALUES ('2003', '2014-05-15 00:37:13', '2014-05-15 00:37:13', null, '广东省江门市恩平市', '恩平市', ',1946,1996,', '1996');
INSERT INTO `xx_area` VALUES ('2004', '2014-05-15 00:37:14', '2014-05-15 00:37:14', null, '广东省湛江市', '湛江市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2005', '2014-05-15 00:37:15', '2014-05-15 00:37:15', null, '广东省湛江市赤坎区', '赤坎区', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2006', '2014-05-15 00:37:16', '2014-05-15 00:37:16', null, '广东省湛江市霞山区', '霞山区', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2007', '2014-05-15 00:37:17', '2014-05-15 00:37:17', null, '广东省湛江市坡头区', '坡头区', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2008', '2014-05-15 00:37:18', '2014-05-15 00:37:18', null, '广东省湛江市麻章区', '麻章区', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2009', '2014-05-15 00:37:19', '2014-05-15 00:37:19', null, '广东省湛江市遂溪县', '遂溪县', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2010', '2014-05-15 00:37:20', '2014-05-15 00:37:20', null, '广东省湛江市徐闻县', '徐闻县', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2011', '2014-05-15 00:37:21', '2014-05-15 00:37:21', null, '广东省湛江市廉江市', '廉江市', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2012', '2014-05-15 00:37:22', '2014-05-15 00:37:22', null, '广东省湛江市雷州市', '雷州市', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2013', '2014-05-15 00:37:23', '2014-05-15 00:37:23', null, '广东省湛江市吴川市', '吴川市', ',1946,2004,', '2004');
INSERT INTO `xx_area` VALUES ('2014', '2014-05-15 00:37:24', '2014-05-15 00:37:24', null, '广东省茂名市', '茂名市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2015', '2014-05-15 00:37:25', '2014-05-15 00:37:25', null, '广东省茂名市茂南区', '茂南区', ',1946,2014,', '2014');
INSERT INTO `xx_area` VALUES ('2016', '2014-05-15 00:37:26', '2014-05-15 00:37:26', null, '广东省茂名市茂港区', '茂港区', ',1946,2014,', '2014');
INSERT INTO `xx_area` VALUES ('2017', '2014-05-15 00:37:27', '2014-05-15 00:37:27', null, '广东省茂名市电白县', '电白县', ',1946,2014,', '2014');
INSERT INTO `xx_area` VALUES ('2018', '2014-05-15 00:37:28', '2014-05-15 00:37:28', null, '广东省茂名市高州市', '高州市', ',1946,2014,', '2014');
INSERT INTO `xx_area` VALUES ('2019', '2014-05-15 00:37:29', '2014-05-15 00:37:29', null, '广东省茂名市化州市', '化州市', ',1946,2014,', '2014');
INSERT INTO `xx_area` VALUES ('2020', '2014-05-15 00:37:30', '2014-05-15 00:37:30', null, '广东省茂名市信宜市', '信宜市', ',1946,2014,', '2014');
INSERT INTO `xx_area` VALUES ('2021', '2014-05-15 00:37:31', '2014-05-15 00:37:31', null, '广东省肇庆市', '肇庆市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2022', '2014-05-15 00:37:32', '2014-05-15 00:37:32', null, '广东省肇庆市端州区', '端州区', ',1946,2021,', '2021');
INSERT INTO `xx_area` VALUES ('2023', '2014-05-15 00:37:33', '2014-05-15 00:37:33', null, '广东省肇庆市鼎湖区', '鼎湖区', ',1946,2021,', '2021');
INSERT INTO `xx_area` VALUES ('2024', '2014-05-15 00:37:34', '2014-05-15 00:37:34', null, '广东省肇庆市广宁县', '广宁县', ',1946,2021,', '2021');
INSERT INTO `xx_area` VALUES ('2025', '2014-05-15 00:37:35', '2014-05-15 00:37:35', null, '广东省肇庆市怀集县', '怀集县', ',1946,2021,', '2021');
INSERT INTO `xx_area` VALUES ('2026', '2014-05-15 00:37:36', '2014-05-15 00:37:36', null, '广东省肇庆市封开县', '封开县', ',1946,2021,', '2021');
INSERT INTO `xx_area` VALUES ('2027', '2014-05-15 00:37:37', '2014-05-15 00:37:37', null, '广东省肇庆市德庆县', '德庆县', ',1946,2021,', '2021');
INSERT INTO `xx_area` VALUES ('2028', '2014-05-15 00:37:38', '2014-05-15 00:37:38', null, '广东省肇庆市高要市', '高要市', ',1946,2021,', '2021');
INSERT INTO `xx_area` VALUES ('2029', '2014-05-15 00:37:39', '2014-05-15 00:37:39', null, '广东省肇庆市四会市', '四会市', ',1946,2021,', '2021');
INSERT INTO `xx_area` VALUES ('2030', '2014-05-15 00:37:40', '2014-05-15 00:37:40', null, '广东省惠州市', '惠州市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2031', '2014-05-15 00:37:41', '2014-05-15 00:37:41', null, '广东省惠州市惠城区', '惠城区', ',1946,2030,', '2030');
INSERT INTO `xx_area` VALUES ('2032', '2014-05-15 00:37:42', '2014-05-15 00:37:42', null, '广东省惠州市惠阳区', '惠阳区', ',1946,2030,', '2030');
INSERT INTO `xx_area` VALUES ('2033', '2014-05-15 00:37:43', '2014-05-15 00:37:43', null, '广东省惠州市博罗县', '博罗县', ',1946,2030,', '2030');
INSERT INTO `xx_area` VALUES ('2034', '2014-05-15 00:37:44', '2014-05-15 00:37:44', null, '广东省惠州市惠东县', '惠东县', ',1946,2030,', '2030');
INSERT INTO `xx_area` VALUES ('2035', '2014-05-15 00:37:45', '2014-05-15 00:37:45', null, '广东省惠州市龙门县', '龙门县', ',1946,2030,', '2030');
INSERT INTO `xx_area` VALUES ('2036', '2014-05-15 00:37:46', '2014-05-15 00:37:46', null, '广东省梅州市', '梅州市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2037', '2014-05-15 00:37:47', '2014-05-15 00:37:47', null, '广东省梅州市梅江区', '梅江区', ',1946,2036,', '2036');
INSERT INTO `xx_area` VALUES ('2038', '2014-05-15 00:37:48', '2014-05-15 00:37:48', null, '广东省梅州市梅县', '梅县', ',1946,2036,', '2036');
INSERT INTO `xx_area` VALUES ('2039', '2014-05-15 00:37:49', '2014-05-15 00:37:49', null, '广东省梅州市大埔县', '大埔县', ',1946,2036,', '2036');
INSERT INTO `xx_area` VALUES ('2040', '2014-05-15 00:37:50', '2014-05-15 00:37:50', null, '广东省梅州市丰顺县', '丰顺县', ',1946,2036,', '2036');
INSERT INTO `xx_area` VALUES ('2041', '2014-05-15 00:37:51', '2014-05-15 00:37:51', null, '广东省梅州市五华县', '五华县', ',1946,2036,', '2036');
INSERT INTO `xx_area` VALUES ('2042', '2014-05-15 00:37:52', '2014-05-15 00:37:52', null, '广东省梅州市平远县', '平远县', ',1946,2036,', '2036');
INSERT INTO `xx_area` VALUES ('2043', '2014-05-15 00:37:53', '2014-05-15 00:37:53', null, '广东省梅州市蕉岭县', '蕉岭县', ',1946,2036,', '2036');
INSERT INTO `xx_area` VALUES ('2044', '2014-05-15 00:37:54', '2014-05-15 00:37:54', null, '广东省梅州市兴宁市', '兴宁市', ',1946,2036,', '2036');
INSERT INTO `xx_area` VALUES ('2045', '2014-05-15 00:37:55', '2014-05-15 00:37:55', null, '广东省汕尾市', '汕尾市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2046', '2014-05-15 00:37:56', '2014-05-15 00:37:56', null, '广东省汕尾市城区', '城区', ',1946,2045,', '2045');
INSERT INTO `xx_area` VALUES ('2047', '2014-05-15 00:37:57', '2014-05-15 00:37:57', null, '广东省汕尾市海丰县', '海丰县', ',1946,2045,', '2045');
INSERT INTO `xx_area` VALUES ('2048', '2014-05-15 00:37:58', '2014-05-15 00:37:58', null, '广东省汕尾市陆河县', '陆河县', ',1946,2045,', '2045');
INSERT INTO `xx_area` VALUES ('2049', '2014-05-15 00:37:59', '2014-05-15 00:37:59', null, '广东省汕尾市陆丰市', '陆丰市', ',1946,2045,', '2045');
INSERT INTO `xx_area` VALUES ('2050', '2014-05-15 00:38:00', '2014-05-15 00:38:00', null, '广东省河源市', '河源市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2051', '2014-05-15 00:38:01', '2014-05-15 00:38:01', null, '广东省河源市源城区', '源城区', ',1946,2050,', '2050');
INSERT INTO `xx_area` VALUES ('2052', '2014-05-15 00:38:02', '2014-05-15 00:38:02', null, '广东省河源市紫金县', '紫金县', ',1946,2050,', '2050');
INSERT INTO `xx_area` VALUES ('2053', '2014-05-15 00:38:03', '2014-05-15 00:38:03', null, '广东省河源市龙川县', '龙川县', ',1946,2050,', '2050');
INSERT INTO `xx_area` VALUES ('2054', '2014-05-15 00:38:04', '2014-05-15 00:38:04', null, '广东省河源市连平县', '连平县', ',1946,2050,', '2050');
INSERT INTO `xx_area` VALUES ('2055', '2014-05-15 00:38:05', '2014-05-15 00:38:05', null, '广东省河源市和平县', '和平县', ',1946,2050,', '2050');
INSERT INTO `xx_area` VALUES ('2056', '2014-05-15 00:38:06', '2014-05-15 00:38:06', null, '广东省河源市东源县', '东源县', ',1946,2050,', '2050');
INSERT INTO `xx_area` VALUES ('2057', '2014-05-15 00:38:07', '2014-05-15 00:38:07', null, '广东省阳江市', '阳江市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2058', '2014-05-15 00:38:08', '2014-05-15 00:38:08', null, '广东省阳江市江城区', '江城区', ',1946,2057,', '2057');
INSERT INTO `xx_area` VALUES ('2059', '2014-05-15 00:38:09', '2014-05-15 00:38:09', null, '广东省阳江市阳西县', '阳西县', ',1946,2057,', '2057');
INSERT INTO `xx_area` VALUES ('2060', '2014-05-15 00:38:10', '2014-05-15 00:38:10', null, '广东省阳江市阳东县', '阳东县', ',1946,2057,', '2057');
INSERT INTO `xx_area` VALUES ('2061', '2014-05-15 00:38:11', '2014-05-15 00:38:11', null, '广东省阳江市阳春市', '阳春市', ',1946,2057,', '2057');
INSERT INTO `xx_area` VALUES ('2062', '2014-05-15 00:38:12', '2014-05-15 00:38:12', null, '广东省清远市', '清远市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2063', '2014-05-15 00:38:13', '2014-05-15 00:38:13', null, '广东省清远市清城区', '清城区', ',1946,2062,', '2062');
INSERT INTO `xx_area` VALUES ('2064', '2014-05-15 00:38:14', '2014-05-15 00:38:14', null, '广东省清远市佛冈县', '佛冈县', ',1946,2062,', '2062');
INSERT INTO `xx_area` VALUES ('2065', '2014-05-15 00:38:15', '2014-05-15 00:38:15', null, '广东省清远市阳山县', '阳山县', ',1946,2062,', '2062');
INSERT INTO `xx_area` VALUES ('2066', '2014-05-15 00:38:16', '2014-05-15 00:38:16', null, '广东省清远市连山壮族瑶族自治县', '连山壮族瑶族自治县', ',1946,2062,', '2062');
INSERT INTO `xx_area` VALUES ('2067', '2014-05-15 00:38:17', '2014-05-15 00:38:17', null, '广东省清远市连南瑶族自治县', '连南瑶族自治县', ',1946,2062,', '2062');
INSERT INTO `xx_area` VALUES ('2068', '2014-05-15 00:38:18', '2014-05-15 00:38:18', null, '广东省清远市清新县', '清新县', ',1946,2062,', '2062');
INSERT INTO `xx_area` VALUES ('2069', '2014-05-15 00:38:19', '2014-05-15 00:38:19', null, '广东省清远市英德市', '英德市', ',1946,2062,', '2062');
INSERT INTO `xx_area` VALUES ('2070', '2014-05-15 00:38:20', '2014-05-15 00:38:20', null, '广东省清远市连州市', '连州市', ',1946,2062,', '2062');
INSERT INTO `xx_area` VALUES ('2071', '2014-05-15 00:38:21', '2014-05-15 00:38:21', null, '广东省东莞市', '东莞市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2072', '2014-05-15 00:38:22', '2014-05-15 00:38:22', null, '广东省中山市', '中山市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2073', '2014-05-15 00:38:23', '2014-05-15 00:38:23', null, '广东省潮州市', '潮州市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2074', '2014-05-15 00:38:24', '2014-05-15 00:38:24', null, '广东省潮州市湘桥区', '湘桥区', ',1946,2073,', '2073');
INSERT INTO `xx_area` VALUES ('2075', '2014-05-15 00:38:25', '2014-05-15 00:38:25', null, '广东省潮州市潮安县', '潮安县', ',1946,2073,', '2073');
INSERT INTO `xx_area` VALUES ('2076', '2014-05-15 00:38:26', '2014-05-15 00:38:26', null, '广东省潮州市饶平县', '饶平县', ',1946,2073,', '2073');
INSERT INTO `xx_area` VALUES ('2077', '2014-05-15 00:38:27', '2014-05-15 00:38:27', null, '广东省揭阳市', '揭阳市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2078', '2014-05-15 00:38:28', '2014-05-15 00:38:28', null, '广东省揭阳市榕城区', '榕城区', ',1946,2077,', '2077');
INSERT INTO `xx_area` VALUES ('2079', '2014-05-15 00:38:29', '2014-05-15 00:38:29', null, '广东省揭阳市揭东县', '揭东县', ',1946,2077,', '2077');
INSERT INTO `xx_area` VALUES ('2080', '2014-05-15 00:38:30', '2014-05-15 00:38:30', null, '广东省揭阳市揭西县', '揭西县', ',1946,2077,', '2077');
INSERT INTO `xx_area` VALUES ('2081', '2014-05-15 00:38:31', '2014-05-15 00:38:31', null, '广东省揭阳市惠来县', '惠来县', ',1946,2077,', '2077');
INSERT INTO `xx_area` VALUES ('2082', '2014-05-15 00:38:32', '2014-05-15 00:38:32', null, '广东省揭阳市普宁市', '普宁市', ',1946,2077,', '2077');
INSERT INTO `xx_area` VALUES ('2083', '2014-05-15 00:38:33', '2014-05-15 00:38:33', null, '广东省云浮市', '云浮市', ',1946,', '1946');
INSERT INTO `xx_area` VALUES ('2084', '2014-05-15 00:38:34', '2014-05-15 00:38:34', null, '广东省云浮市云城区', '云城区', ',1946,2083,', '2083');
INSERT INTO `xx_area` VALUES ('2085', '2014-05-15 00:38:35', '2014-05-15 00:38:35', null, '广东省云浮市新兴县', '新兴县', ',1946,2083,', '2083');
INSERT INTO `xx_area` VALUES ('2086', '2014-05-15 00:38:36', '2014-05-15 00:38:36', null, '广东省云浮市郁南县', '郁南县', ',1946,2083,', '2083');
INSERT INTO `xx_area` VALUES ('2087', '2014-05-15 00:38:37', '2014-05-15 00:38:37', null, '广东省云浮市云安县', '云安县', ',1946,2083,', '2083');
INSERT INTO `xx_area` VALUES ('2088', '2014-05-15 00:38:38', '2014-05-15 00:38:38', null, '广东省云浮市罗定市', '罗定市', ',1946,2083,', '2083');
INSERT INTO `xx_area` VALUES ('2089', '2014-05-15 00:38:39', '2014-05-15 00:38:39', null, '广西壮族自治区', '广西壮族自治区', ',', null);
INSERT INTO `xx_area` VALUES ('2090', '2014-05-15 00:38:40', '2014-05-15 00:38:40', null, '广西壮族自治区南宁市', '南宁市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2091', '2014-05-15 00:38:41', '2014-05-15 00:38:41', null, '广西壮族自治区南宁市兴宁区', '兴宁区', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2092', '2014-05-15 00:38:42', '2014-05-15 00:38:42', null, '广西壮族自治区南宁市青秀区', '青秀区', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2093', '2014-05-15 00:38:43', '2014-05-15 00:38:43', null, '广西壮族自治区南宁市江南区', '江南区', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2094', '2014-05-15 00:38:44', '2014-05-15 00:38:44', null, '广西壮族自治区南宁市西乡塘区', '西乡塘区', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2095', '2014-05-15 00:38:45', '2014-05-15 00:38:45', null, '广西壮族自治区南宁市良庆区', '良庆区', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2096', '2014-05-15 00:38:46', '2014-05-15 00:38:46', null, '广西壮族自治区南宁市邕宁区', '邕宁区', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2097', '2014-05-15 00:38:47', '2014-05-15 00:38:47', null, '广西壮族自治区南宁市武鸣县', '武鸣县', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2098', '2014-05-15 00:38:48', '2014-05-15 00:38:48', null, '广西壮族自治区南宁市隆安县', '隆安县', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2099', '2014-05-15 00:38:49', '2014-05-15 00:38:49', null, '广西壮族自治区南宁市马山县', '马山县', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2100', '2014-05-15 00:38:50', '2014-05-15 00:38:50', null, '广西壮族自治区南宁市上林县', '上林县', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2101', '2014-05-15 00:38:51', '2014-05-15 00:38:51', null, '广西壮族自治区南宁市宾阳县', '宾阳县', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2102', '2014-05-15 00:38:52', '2014-05-15 00:38:52', null, '广西壮族自治区南宁市横县', '横县', ',2089,2090,', '2090');
INSERT INTO `xx_area` VALUES ('2103', '2014-05-15 00:38:53', '2014-05-15 00:38:53', null, '广西壮族自治区柳州市', '柳州市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2104', '2014-05-15 00:38:54', '2014-05-15 00:38:54', null, '广西壮族自治区柳州市城中区', '城中区', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2105', '2014-05-15 00:38:55', '2014-05-15 00:38:55', null, '广西壮族自治区柳州市鱼峰区', '鱼峰区', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2106', '2014-05-15 00:38:56', '2014-05-15 00:38:56', null, '广西壮族自治区柳州市柳南区', '柳南区', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2107', '2014-05-15 00:38:57', '2014-05-15 00:38:57', null, '广西壮族自治区柳州市柳北区', '柳北区', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2108', '2014-05-15 00:38:58', '2014-05-15 00:38:58', null, '广西壮族自治区柳州市柳江县', '柳江县', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2109', '2014-05-15 00:38:59', '2014-05-15 00:38:59', null, '广西壮族自治区柳州市柳城县', '柳城县', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2110', '2014-05-15 00:39:00', '2014-05-15 00:39:00', null, '广西壮族自治区柳州市鹿寨县', '鹿寨县', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2111', '2014-05-15 00:39:01', '2014-05-15 00:39:01', null, '广西壮族自治区柳州市融安县', '融安县', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2112', '2014-05-15 00:39:02', '2014-05-15 00:39:02', null, '广西壮族自治区柳州市融水苗族自治县', '融水苗族自治县', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2113', '2014-05-15 00:39:03', '2014-05-15 00:39:03', null, '广西壮族自治区柳州市三江侗族自治县', '三江侗族自治县', ',2089,2103,', '2103');
INSERT INTO `xx_area` VALUES ('2114', '2014-05-15 00:39:04', '2014-05-15 00:39:04', null, '广西壮族自治区桂林市', '桂林市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2115', '2014-05-15 00:39:05', '2014-05-15 00:39:05', null, '广西壮族自治区桂林市秀峰区', '秀峰区', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2116', '2014-05-15 00:39:06', '2014-05-15 00:39:06', null, '广西壮族自治区桂林市叠彩区', '叠彩区', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2117', '2014-05-15 00:39:07', '2014-05-15 00:39:07', null, '广西壮族自治区桂林市象山区', '象山区', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2118', '2014-05-15 00:39:08', '2014-05-15 00:39:08', null, '广西壮族自治区桂林市七星区', '七星区', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2119', '2014-05-15 00:39:09', '2014-05-15 00:39:09', null, '广西壮族自治区桂林市雁山区', '雁山区', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2120', '2014-05-15 00:39:10', '2014-05-15 00:39:10', null, '广西壮族自治区桂林市阳朔县', '阳朔县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2121', '2014-05-15 00:39:11', '2014-05-15 00:39:11', null, '广西壮族自治区桂林市临桂县', '临桂县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2122', '2014-05-15 00:39:12', '2014-05-15 00:39:12', null, '广西壮族自治区桂林市灵川县', '灵川县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2123', '2014-05-15 00:39:13', '2014-05-15 00:39:13', null, '广西壮族自治区桂林市全州县', '全州县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2124', '2014-05-15 00:39:14', '2014-05-15 00:39:14', null, '广西壮族自治区桂林市兴安县', '兴安县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2125', '2014-05-15 00:39:15', '2014-05-15 00:39:15', null, '广西壮族自治区桂林市永福县', '永福县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2126', '2014-05-15 00:39:16', '2014-05-15 00:39:16', null, '广西壮族自治区桂林市灌阳县', '灌阳县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2127', '2014-05-15 00:39:17', '2014-05-15 00:39:17', null, '广西壮族自治区桂林市龙胜各族自治县', '龙胜各族自治县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2128', '2014-05-15 00:39:18', '2014-05-15 00:39:18', null, '广西壮族自治区桂林市资源县', '资源县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2129', '2014-05-15 00:39:19', '2014-05-15 00:39:19', null, '广西壮族自治区桂林市平乐县', '平乐县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2130', '2014-05-15 00:39:20', '2014-05-15 00:39:20', null, '广西壮族自治区桂林市荔浦县', '荔浦县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2131', '2014-05-15 00:39:21', '2014-05-15 00:39:21', null, '广西壮族自治区桂林市恭城瑶族自治县', '恭城瑶族自治县', ',2089,2114,', '2114');
INSERT INTO `xx_area` VALUES ('2132', '2014-05-15 00:39:22', '2014-05-15 00:39:22', null, '广西壮族自治区梧州市', '梧州市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2133', '2014-05-15 00:39:23', '2014-05-15 00:39:23', null, '广西壮族自治区梧州市万秀区', '万秀区', ',2089,2132,', '2132');
INSERT INTO `xx_area` VALUES ('2134', '2014-05-15 00:39:24', '2014-05-15 00:39:24', null, '广西壮族自治区梧州市蝶山区', '蝶山区', ',2089,2132,', '2132');
INSERT INTO `xx_area` VALUES ('2135', '2014-05-15 00:39:25', '2014-05-15 00:39:25', null, '广西壮族自治区梧州市长洲区', '长洲区', ',2089,2132,', '2132');
INSERT INTO `xx_area` VALUES ('2136', '2014-05-15 00:39:26', '2014-05-15 00:39:26', null, '广西壮族自治区梧州市苍梧县', '苍梧县', ',2089,2132,', '2132');
INSERT INTO `xx_area` VALUES ('2137', '2014-05-15 00:39:27', '2014-05-15 00:39:27', null, '广西壮族自治区梧州市藤县', '藤县', ',2089,2132,', '2132');
INSERT INTO `xx_area` VALUES ('2138', '2014-05-15 00:39:28', '2014-05-15 00:39:28', null, '广西壮族自治区梧州市蒙山县', '蒙山县', ',2089,2132,', '2132');
INSERT INTO `xx_area` VALUES ('2139', '2014-05-15 00:39:29', '2014-05-15 00:39:29', null, '广西壮族自治区梧州市岑溪市', '岑溪市', ',2089,2132,', '2132');
INSERT INTO `xx_area` VALUES ('2140', '2014-05-15 00:39:30', '2014-05-15 00:39:30', null, '广西壮族自治区北海市', '北海市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2141', '2014-05-15 00:39:31', '2014-05-15 00:39:31', null, '广西壮族自治区北海市海城区', '海城区', ',2089,2140,', '2140');
INSERT INTO `xx_area` VALUES ('2142', '2014-05-15 00:39:32', '2014-05-15 00:39:32', null, '广西壮族自治区北海市银海区', '银海区', ',2089,2140,', '2140');
INSERT INTO `xx_area` VALUES ('2143', '2014-05-15 00:39:33', '2014-05-15 00:39:33', null, '广西壮族自治区北海市铁山港区', '铁山港区', ',2089,2140,', '2140');
INSERT INTO `xx_area` VALUES ('2144', '2014-05-15 00:39:34', '2014-05-15 00:39:34', null, '广西壮族自治区北海市合浦县', '合浦县', ',2089,2140,', '2140');
INSERT INTO `xx_area` VALUES ('2145', '2014-05-15 00:39:35', '2014-05-15 00:39:35', null, '广西壮族自治区防城港市', '防城港市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2146', '2014-05-15 00:39:36', '2014-05-15 00:39:36', null, '广西壮族自治区防城港市港口区', '港口区', ',2089,2145,', '2145');
INSERT INTO `xx_area` VALUES ('2147', '2014-05-15 00:39:37', '2014-05-15 00:39:37', null, '广西壮族自治区防城港市防城区', '防城区', ',2089,2145,', '2145');
INSERT INTO `xx_area` VALUES ('2148', '2014-05-15 00:39:38', '2014-05-15 00:39:38', null, '广西壮族自治区防城港市上思县', '上思县', ',2089,2145,', '2145');
INSERT INTO `xx_area` VALUES ('2149', '2014-05-15 00:39:39', '2014-05-15 00:39:39', null, '广西壮族自治区防城港市东兴市', '东兴市', ',2089,2145,', '2145');
INSERT INTO `xx_area` VALUES ('2150', '2014-05-15 00:39:40', '2014-05-15 00:39:40', null, '广西壮族自治区钦州市', '钦州市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2151', '2014-05-15 00:39:41', '2014-05-15 00:39:41', null, '广西壮族自治区钦州市钦南区', '钦南区', ',2089,2150,', '2150');
INSERT INTO `xx_area` VALUES ('2152', '2014-05-15 00:39:42', '2014-05-15 00:39:42', null, '广西壮族自治区钦州市钦北区', '钦北区', ',2089,2150,', '2150');
INSERT INTO `xx_area` VALUES ('2153', '2014-05-15 00:39:43', '2014-05-15 00:39:43', null, '广西壮族自治区钦州市灵山县', '灵山县', ',2089,2150,', '2150');
INSERT INTO `xx_area` VALUES ('2154', '2014-05-15 00:39:44', '2014-05-15 00:39:44', null, '广西壮族自治区钦州市浦北县', '浦北县', ',2089,2150,', '2150');
INSERT INTO `xx_area` VALUES ('2155', '2014-05-15 00:39:45', '2014-05-15 00:39:45', null, '广西壮族自治区贵港市', '贵港市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2156', '2014-05-15 00:39:46', '2014-05-15 00:39:46', null, '广西壮族自治区贵港市港北区', '港北区', ',2089,2155,', '2155');
INSERT INTO `xx_area` VALUES ('2157', '2014-05-15 00:39:47', '2014-05-15 00:39:47', null, '广西壮族自治区贵港市港南区', '港南区', ',2089,2155,', '2155');
INSERT INTO `xx_area` VALUES ('2158', '2014-05-15 00:39:48', '2014-05-15 00:39:48', null, '广西壮族自治区贵港市覃塘区', '覃塘区', ',2089,2155,', '2155');
INSERT INTO `xx_area` VALUES ('2159', '2014-05-15 00:39:49', '2014-05-15 00:39:49', null, '广西壮族自治区贵港市平南县', '平南县', ',2089,2155,', '2155');
INSERT INTO `xx_area` VALUES ('2160', '2014-05-15 00:39:50', '2014-05-15 00:39:50', null, '广西壮族自治区贵港市桂平市', '桂平市', ',2089,2155,', '2155');
INSERT INTO `xx_area` VALUES ('2161', '2014-05-15 00:39:51', '2014-05-15 00:39:51', null, '广西壮族自治区玉林市', '玉林市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2162', '2014-05-15 00:39:52', '2014-05-15 00:39:52', null, '广西壮族自治区玉林市玉州区', '玉州区', ',2089,2161,', '2161');
INSERT INTO `xx_area` VALUES ('2163', '2014-05-15 00:39:53', '2014-05-15 00:39:53', null, '广西壮族自治区玉林市容县', '容县', ',2089,2161,', '2161');
INSERT INTO `xx_area` VALUES ('2164', '2014-05-15 00:39:54', '2014-05-15 00:39:54', null, '广西壮族自治区玉林市陆川县', '陆川县', ',2089,2161,', '2161');
INSERT INTO `xx_area` VALUES ('2165', '2014-05-15 00:39:55', '2014-05-15 00:39:55', null, '广西壮族自治区玉林市博白县', '博白县', ',2089,2161,', '2161');
INSERT INTO `xx_area` VALUES ('2166', '2014-05-15 00:39:56', '2014-05-15 00:39:56', null, '广西壮族自治区玉林市兴业县', '兴业县', ',2089,2161,', '2161');
INSERT INTO `xx_area` VALUES ('2167', '2014-05-15 00:39:57', '2014-05-15 00:39:57', null, '广西壮族自治区玉林市北流市', '北流市', ',2089,2161,', '2161');
INSERT INTO `xx_area` VALUES ('2168', '2014-05-15 00:39:58', '2014-05-15 00:39:58', null, '广西壮族自治区百色市', '百色市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2169', '2014-05-15 00:39:59', '2014-05-15 00:39:59', null, '广西壮族自治区百色市右江区', '右江区', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2170', '2014-05-15 00:40:00', '2014-05-15 00:40:00', null, '广西壮族自治区百色市田阳县', '田阳县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2171', '2014-05-15 00:40:01', '2014-05-15 00:40:01', null, '广西壮族自治区百色市田东县', '田东县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2172', '2014-05-15 00:40:02', '2014-05-15 00:40:02', null, '广西壮族自治区百色市平果县', '平果县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2173', '2014-05-15 00:40:03', '2014-05-15 00:40:03', null, '广西壮族自治区百色市德保县', '德保县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2174', '2014-05-15 00:40:04', '2014-05-15 00:40:04', null, '广西壮族自治区百色市靖西县', '靖西县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2175', '2014-05-15 00:40:05', '2014-05-15 00:40:05', null, '广西壮族自治区百色市那坡县', '那坡县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2176', '2014-05-15 00:40:06', '2014-05-15 00:40:06', null, '广西壮族自治区百色市凌云县', '凌云县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2177', '2014-05-15 00:40:07', '2014-05-15 00:40:07', null, '广西壮族自治区百色市乐业县', '乐业县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2178', '2014-05-15 00:40:08', '2014-05-15 00:40:08', null, '广西壮族自治区百色市田林县', '田林县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2179', '2014-05-15 00:40:09', '2014-05-15 00:40:09', null, '广西壮族自治区百色市西林县', '西林县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2180', '2014-05-15 00:40:10', '2014-05-15 00:40:10', null, '广西壮族自治区百色市隆林各族自治县', '隆林各族自治县', ',2089,2168,', '2168');
INSERT INTO `xx_area` VALUES ('2181', '2014-05-15 00:40:11', '2014-05-15 00:40:11', null, '广西壮族自治区贺州市', '贺州市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2182', '2014-05-15 00:40:12', '2014-05-15 00:40:12', null, '广西壮族自治区贺州市八步区', '八步区', ',2089,2181,', '2181');
INSERT INTO `xx_area` VALUES ('2183', '2014-05-15 00:40:13', '2014-05-15 00:40:13', null, '广西壮族自治区贺州市昭平县', '昭平县', ',2089,2181,', '2181');
INSERT INTO `xx_area` VALUES ('2184', '2014-05-15 00:40:14', '2014-05-15 00:40:14', null, '广西壮族自治区贺州市钟山县', '钟山县', ',2089,2181,', '2181');
INSERT INTO `xx_area` VALUES ('2185', '2014-05-15 00:40:15', '2014-05-15 00:40:15', null, '广西壮族自治区贺州市富川瑶族自治县', '富川瑶族自治县', ',2089,2181,', '2181');
INSERT INTO `xx_area` VALUES ('2186', '2014-05-15 00:40:16', '2014-05-15 00:40:16', null, '广西壮族自治区河池市', '河池市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2187', '2014-05-15 00:40:17', '2014-05-15 00:40:17', null, '广西壮族自治区河池市金城江区', '金城江区', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2188', '2014-05-15 00:40:18', '2014-05-15 00:40:18', null, '广西壮族自治区河池市南丹县', '南丹县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2189', '2014-05-15 00:40:19', '2014-05-15 00:40:19', null, '广西壮族自治区河池市天峨县', '天峨县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2190', '2014-05-15 00:40:20', '2014-05-15 00:40:20', null, '广西壮族自治区河池市凤山县', '凤山县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2191', '2014-05-15 00:40:21', '2014-05-15 00:40:21', null, '广西壮族自治区河池市东兰县', '东兰县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2192', '2014-05-15 00:40:22', '2014-05-15 00:40:22', null, '广西壮族自治区河池市罗城仫佬族自治县', '罗城仫佬族自治县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2193', '2014-05-15 00:40:23', '2014-05-15 00:40:23', null, '广西壮族自治区河池市环江毛南族自治县', '环江毛南族自治县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2194', '2014-05-15 00:40:24', '2014-05-15 00:40:24', null, '广西壮族自治区河池市巴马瑶族自治县', '巴马瑶族自治县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2195', '2014-05-15 00:40:25', '2014-05-15 00:40:25', null, '广西壮族自治区河池市都安瑶族自治县', '都安瑶族自治县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2196', '2014-05-15 00:40:26', '2014-05-15 00:40:26', null, '广西壮族自治区河池市大化瑶族自治县', '大化瑶族自治县', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2197', '2014-05-15 00:40:27', '2014-05-15 00:40:27', null, '广西壮族自治区河池市宜州市', '宜州市', ',2089,2186,', '2186');
INSERT INTO `xx_area` VALUES ('2198', '2014-05-15 00:40:28', '2014-05-15 00:40:28', null, '广西壮族自治区来宾市', '来宾市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2199', '2014-05-15 00:40:29', '2014-05-15 00:40:29', null, '广西壮族自治区来宾市兴宾区', '兴宾区', ',2089,2198,', '2198');
INSERT INTO `xx_area` VALUES ('2200', '2014-05-15 00:40:30', '2014-05-15 00:40:30', null, '广西壮族自治区来宾市忻城县', '忻城县', ',2089,2198,', '2198');
INSERT INTO `xx_area` VALUES ('2201', '2014-05-15 00:40:31', '2014-05-15 00:40:31', null, '广西壮族自治区来宾市象州县', '象州县', ',2089,2198,', '2198');
INSERT INTO `xx_area` VALUES ('2202', '2014-05-15 00:40:32', '2014-05-15 00:40:32', null, '广西壮族自治区来宾市武宣县', '武宣县', ',2089,2198,', '2198');
INSERT INTO `xx_area` VALUES ('2203', '2014-05-15 00:40:33', '2014-05-15 00:40:33', null, '广西壮族自治区来宾市金秀瑶族自治县', '金秀瑶族自治县', ',2089,2198,', '2198');
INSERT INTO `xx_area` VALUES ('2204', '2014-05-15 00:40:34', '2014-05-15 00:40:34', null, '广西壮族自治区来宾市合山市', '合山市', ',2089,2198,', '2198');
INSERT INTO `xx_area` VALUES ('2205', '2014-05-15 00:40:35', '2014-05-15 00:40:35', null, '广西壮族自治区崇左市', '崇左市', ',2089,', '2089');
INSERT INTO `xx_area` VALUES ('2206', '2014-05-15 00:40:36', '2014-05-15 00:40:36', null, '广西壮族自治区崇左市江洲区', '江洲区', ',2089,2205,', '2205');
INSERT INTO `xx_area` VALUES ('2207', '2014-05-15 00:40:37', '2014-05-15 00:40:37', null, '广西壮族自治区崇左市扶绥县', '扶绥县', ',2089,2205,', '2205');
INSERT INTO `xx_area` VALUES ('2208', '2014-05-15 00:40:38', '2014-05-15 00:40:38', null, '广西壮族自治区崇左市宁明县', '宁明县', ',2089,2205,', '2205');
INSERT INTO `xx_area` VALUES ('2209', '2014-05-15 00:40:39', '2014-05-15 00:40:39', null, '广西壮族自治区崇左市龙州县', '龙州县', ',2089,2205,', '2205');
INSERT INTO `xx_area` VALUES ('2210', '2014-05-15 00:40:40', '2014-05-15 00:40:40', null, '广西壮族自治区崇左市大新县', '大新县', ',2089,2205,', '2205');
INSERT INTO `xx_area` VALUES ('2211', '2014-05-15 00:40:41', '2014-05-15 00:40:41', null, '广西壮族自治区崇左市天等县', '天等县', ',2089,2205,', '2205');
INSERT INTO `xx_area` VALUES ('2212', '2014-05-15 00:40:42', '2014-05-15 00:40:42', null, '广西壮族自治区崇左市凭祥市', '凭祥市', ',2089,2205,', '2205');
INSERT INTO `xx_area` VALUES ('2213', '2014-05-15 00:40:43', '2014-05-15 00:40:43', null, '海南省', '海南省', ',', null);
INSERT INTO `xx_area` VALUES ('2214', '2014-05-15 00:40:44', '2014-05-15 00:40:44', null, '海南省海口市', '海口市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2215', '2014-05-15 00:40:45', '2014-05-15 00:40:45', null, '海南省海口市秀英区', '秀英区', ',2213,2214,', '2214');
INSERT INTO `xx_area` VALUES ('2216', '2014-05-15 00:40:46', '2014-05-15 00:40:46', null, '海南省海口市龙华区', '龙华区', ',2213,2214,', '2214');
INSERT INTO `xx_area` VALUES ('2217', '2014-05-15 00:40:47', '2014-05-15 00:40:47', null, '海南省海口市琼山区', '琼山区', ',2213,2214,', '2214');
INSERT INTO `xx_area` VALUES ('2218', '2014-05-15 00:40:48', '2014-05-15 00:40:48', null, '海南省海口市美兰区', '美兰区', ',2213,2214,', '2214');
INSERT INTO `xx_area` VALUES ('2219', '2014-05-15 00:40:49', '2014-05-15 00:40:49', null, '海南省三亚市', '三亚市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2220', '2014-05-15 00:40:50', '2014-05-15 00:40:50', null, '海南省三沙市', '三沙市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2221', '2014-05-15 00:40:51', '2014-05-15 00:40:51', null, '海南省三沙市西沙群岛', '西沙群岛', ',2213,2220,', '2220');
INSERT INTO `xx_area` VALUES ('2222', '2014-05-15 00:40:52', '2014-05-15 00:40:52', null, '海南省三沙市南沙群岛', '南沙群岛', ',2213,2220,', '2220');
INSERT INTO `xx_area` VALUES ('2223', '2014-05-15 00:40:53', '2014-05-15 00:40:53', null, '海南省三沙市中沙群岛的岛礁及其海域', '中沙群岛的岛礁及其海域', ',2213,2220,', '2220');
INSERT INTO `xx_area` VALUES ('2224', '2014-05-15 00:40:54', '2014-05-15 00:40:54', null, '海南省五指山市', '五指山市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2225', '2014-05-15 00:40:55', '2014-05-15 00:40:55', null, '海南省琼海市', '琼海市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2226', '2014-05-15 00:40:56', '2014-05-15 00:40:56', null, '海南省儋州市', '儋州市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2227', '2014-05-15 00:40:57', '2014-05-15 00:40:57', null, '海南省文昌市', '文昌市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2228', '2014-05-15 00:40:58', '2014-05-15 00:40:58', null, '海南省万宁市', '万宁市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2229', '2014-05-15 00:40:59', '2014-05-15 00:40:59', null, '海南省东方市', '东方市', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2230', '2014-05-15 00:41:00', '2014-05-15 00:41:00', null, '海南省定安县', '定安县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2231', '2014-05-15 00:41:01', '2014-05-15 00:41:01', null, '海南省屯昌县', '屯昌县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2232', '2014-05-15 00:41:02', '2014-05-15 00:41:02', null, '海南省澄迈县', '澄迈县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2233', '2014-05-15 00:41:03', '2014-05-15 00:41:03', null, '海南省临高县', '临高县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2234', '2014-05-15 00:41:04', '2014-05-15 00:41:04', null, '海南省白沙黎族自治县', '白沙黎族自治县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2235', '2014-05-15 00:41:05', '2014-05-15 00:41:05', null, '海南省昌江黎族自治县', '昌江黎族自治县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2236', '2014-05-15 00:41:06', '2014-05-15 00:41:06', null, '海南省乐东黎族自治县', '乐东黎族自治县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2237', '2014-05-15 00:41:07', '2014-05-15 00:41:07', null, '海南省陵水黎族自治县', '陵水黎族自治县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2238', '2014-05-15 00:41:08', '2014-05-15 00:41:08', null, '海南省保亭黎族苗族自治县', '保亭黎族苗族自治县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2239', '2014-05-15 00:41:09', '2014-05-15 00:41:09', null, '海南省琼中黎族苗族自治县', '琼中黎族苗族自治县', ',2213,', '2213');
INSERT INTO `xx_area` VALUES ('2240', '2014-05-15 00:41:10', '2014-05-15 00:41:10', null, '重庆市', '重庆市', ',', null);
INSERT INTO `xx_area` VALUES ('2241', '2014-05-15 00:41:11', '2014-05-15 00:41:11', null, '重庆市万州区', '万州区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2242', '2014-05-15 00:41:12', '2014-05-15 00:41:12', null, '重庆市涪陵区', '涪陵区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2243', '2014-05-15 00:41:13', '2014-05-15 00:41:13', null, '重庆市渝中区', '渝中区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2244', '2014-05-15 00:41:14', '2014-05-15 00:41:14', null, '重庆市大渡口区', '大渡口区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2245', '2014-05-15 00:41:15', '2014-05-15 00:41:15', null, '重庆市江北区', '江北区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2246', '2014-05-15 00:41:16', '2014-05-15 00:41:16', null, '重庆市沙坪坝区', '沙坪坝区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2247', '2014-05-15 00:41:17', '2014-05-15 00:41:17', null, '重庆市九龙坡区', '九龙坡区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2248', '2014-05-15 00:41:18', '2014-05-15 00:41:18', null, '重庆市南岸区', '南岸区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2249', '2014-05-15 00:41:19', '2014-05-15 00:41:19', null, '重庆市北碚区', '北碚区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2250', '2014-05-15 00:41:20', '2014-05-15 00:41:20', null, '重庆市綦江区', '綦江区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2251', '2014-05-15 00:41:21', '2014-05-15 00:41:21', null, '重庆市大足区', '大足区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2252', '2014-05-15 00:41:22', '2014-05-15 00:41:22', null, '重庆市渝北区', '渝北区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2253', '2014-05-15 00:41:23', '2014-05-15 00:41:23', null, '重庆市巴南区', '巴南区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2254', '2014-05-15 00:41:24', '2014-05-15 00:41:24', null, '重庆市黔江区', '黔江区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2255', '2014-05-15 00:41:25', '2014-05-15 00:41:25', null, '重庆市长寿区', '长寿区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2256', '2014-05-15 00:41:26', '2014-05-15 00:41:26', null, '重庆市江津区', '江津区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2257', '2014-05-15 00:41:27', '2014-05-15 00:41:27', null, '重庆市合川区', '合川区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2258', '2014-05-15 00:41:28', '2014-05-15 00:41:28', null, '重庆市永川区', '永川区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2259', '2014-05-15 00:41:29', '2014-05-15 00:41:29', null, '重庆市南川区', '南川区', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2260', '2014-05-15 00:41:30', '2014-05-15 00:41:30', null, '重庆市潼南县', '潼南县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2261', '2014-05-15 00:41:31', '2014-05-15 00:41:31', null, '重庆市铜梁县', '铜梁县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2262', '2014-05-15 00:41:32', '2014-05-15 00:41:32', null, '重庆市荣昌县', '荣昌县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2263', '2014-05-15 00:41:33', '2014-05-15 00:41:33', null, '重庆市璧山县', '璧山县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2264', '2014-05-15 00:41:34', '2014-05-15 00:41:34', null, '重庆市梁平县', '梁平县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2265', '2014-05-15 00:41:35', '2014-05-15 00:41:35', null, '重庆市城口县', '城口县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2266', '2014-05-15 00:41:36', '2014-05-15 00:41:36', null, '重庆市丰都县', '丰都县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2267', '2014-05-15 00:41:37', '2014-05-15 00:41:37', null, '重庆市垫江县', '垫江县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2268', '2014-05-15 00:41:38', '2014-05-15 00:41:38', null, '重庆市武隆县', '武隆县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2269', '2014-05-15 00:41:39', '2014-05-15 00:41:39', null, '重庆市忠县', '忠县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2270', '2014-05-15 00:41:40', '2014-05-15 00:41:40', null, '重庆市开县', '开县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2271', '2014-05-15 00:41:41', '2014-05-15 00:41:41', null, '重庆市云阳县', '云阳县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2272', '2014-05-15 00:41:42', '2014-05-15 00:41:42', null, '重庆市奉节县', '奉节县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2273', '2014-05-15 00:41:43', '2014-05-15 00:41:43', null, '重庆市巫山县', '巫山县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2274', '2014-05-15 00:41:44', '2014-05-15 00:41:44', null, '重庆市巫溪县', '巫溪县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2275', '2014-05-15 00:41:45', '2014-05-15 00:41:45', null, '重庆市石柱土家族自治县', '石柱土家族自治县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2276', '2014-05-15 00:41:46', '2014-05-15 00:41:46', null, '重庆市秀山土家族苗族自治县', '秀山土家族苗族自治县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2277', '2014-05-15 00:41:47', '2014-05-15 00:41:47', null, '重庆市酉阳土家族苗族自治县', '酉阳土家族苗族自治县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2278', '2014-05-15 00:41:48', '2014-05-15 00:41:48', null, '重庆市彭水苗族土家族自治县', '彭水苗族土家族自治县', ',2240,', '2240');
INSERT INTO `xx_area` VALUES ('2279', '2014-05-15 00:41:49', '2014-05-15 00:41:49', null, '四川省', '四川省', ',', null);
INSERT INTO `xx_area` VALUES ('2280', '2014-05-15 00:41:50', '2014-05-15 00:41:50', null, '四川省成都市', '成都市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2281', '2014-05-15 00:41:51', '2014-05-15 00:41:51', null, '四川省成都市锦江区', '锦江区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2282', '2014-05-15 00:41:52', '2014-05-15 00:41:52', null, '四川省成都市青羊区', '青羊区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2283', '2014-05-15 00:41:53', '2014-05-15 00:41:53', null, '四川省成都市金牛区', '金牛区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2284', '2014-05-15 00:41:54', '2014-05-15 00:41:54', null, '四川省成都市武侯区', '武侯区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2285', '2014-05-15 00:41:55', '2014-05-15 00:41:55', null, '四川省成都市成华区', '成华区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2286', '2014-05-15 00:41:56', '2014-05-15 00:41:56', null, '四川省成都市龙泉驿区', '龙泉驿区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2287', '2014-05-15 00:41:57', '2014-05-15 00:41:57', null, '四川省成都市青白江区', '青白江区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2288', '2014-05-15 00:41:58', '2014-05-15 00:41:58', null, '四川省成都市新都区', '新都区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2289', '2014-05-15 00:41:59', '2014-05-15 00:41:59', null, '四川省成都市温江区', '温江区', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2290', '2014-05-15 00:42:00', '2014-05-15 00:42:00', null, '四川省成都市金堂县', '金堂县', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2291', '2014-05-15 00:42:01', '2014-05-15 00:42:01', null, '四川省成都市双流县', '双流县', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2292', '2014-05-15 00:42:02', '2014-05-15 00:42:02', null, '四川省成都市郫县', '郫县', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2293', '2014-05-15 00:42:03', '2014-05-15 00:42:03', null, '四川省成都市大邑县', '大邑县', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2294', '2014-05-15 00:42:04', '2014-05-15 00:42:04', null, '四川省成都市蒲江县', '蒲江县', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2295', '2014-05-15 00:42:05', '2014-05-15 00:42:05', null, '四川省成都市新津县', '新津县', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2296', '2014-05-15 00:42:06', '2014-05-15 00:42:06', null, '四川省成都市都江堰市', '都江堰市', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2297', '2014-05-15 00:42:07', '2014-05-15 00:42:07', null, '四川省成都市彭州市', '彭州市', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2298', '2014-05-15 00:42:08', '2014-05-15 00:42:08', null, '四川省成都市邛崃市', '邛崃市', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2299', '2014-05-15 00:42:09', '2014-05-15 00:42:09', null, '四川省成都市崇州市', '崇州市', ',2279,2280,', '2280');
INSERT INTO `xx_area` VALUES ('2300', '2014-05-15 00:42:10', '2014-05-15 00:42:10', null, '四川省自贡市', '自贡市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2301', '2014-05-15 00:42:11', '2014-05-15 00:42:11', null, '四川省自贡市自流井区', '自流井区', ',2279,2300,', '2300');
INSERT INTO `xx_area` VALUES ('2302', '2014-05-15 00:42:12', '2014-05-15 00:42:12', null, '四川省自贡市贡井区', '贡井区', ',2279,2300,', '2300');
INSERT INTO `xx_area` VALUES ('2303', '2014-05-15 00:42:13', '2014-05-15 00:42:13', null, '四川省自贡市大安区', '大安区', ',2279,2300,', '2300');
INSERT INTO `xx_area` VALUES ('2304', '2014-05-15 00:42:14', '2014-05-15 00:42:14', null, '四川省自贡市沿滩区', '沿滩区', ',2279,2300,', '2300');
INSERT INTO `xx_area` VALUES ('2305', '2014-05-15 00:42:15', '2014-05-15 00:42:15', null, '四川省自贡市荣县', '荣县', ',2279,2300,', '2300');
INSERT INTO `xx_area` VALUES ('2306', '2014-05-15 00:42:16', '2014-05-15 00:42:16', null, '四川省自贡市富顺县', '富顺县', ',2279,2300,', '2300');
INSERT INTO `xx_area` VALUES ('2307', '2014-05-15 00:42:17', '2014-05-15 00:42:17', null, '四川省攀枝花市', '攀枝花市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2308', '2014-05-15 00:42:18', '2014-05-15 00:42:18', null, '四川省攀枝花市东区', '东区', ',2279,2307,', '2307');
INSERT INTO `xx_area` VALUES ('2309', '2014-05-15 00:42:19', '2014-05-15 00:42:19', null, '四川省攀枝花市西区', '西区', ',2279,2307,', '2307');
INSERT INTO `xx_area` VALUES ('2310', '2014-05-15 00:42:20', '2014-05-15 00:42:20', null, '四川省攀枝花市仁和区', '仁和区', ',2279,2307,', '2307');
INSERT INTO `xx_area` VALUES ('2311', '2014-05-15 00:42:21', '2014-05-15 00:42:21', null, '四川省攀枝花市米易县', '米易县', ',2279,2307,', '2307');
INSERT INTO `xx_area` VALUES ('2312', '2014-05-15 00:42:22', '2014-05-15 00:42:22', null, '四川省攀枝花市盐边县', '盐边县', ',2279,2307,', '2307');
INSERT INTO `xx_area` VALUES ('2313', '2014-05-15 00:42:23', '2014-05-15 00:42:23', null, '四川省泸州市', '泸州市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2314', '2014-05-15 00:42:24', '2014-05-15 00:42:24', null, '四川省泸州市江阳区', '江阳区', ',2279,2313,', '2313');
INSERT INTO `xx_area` VALUES ('2315', '2014-05-15 00:42:25', '2014-05-15 00:42:25', null, '四川省泸州市纳溪区', '纳溪区', ',2279,2313,', '2313');
INSERT INTO `xx_area` VALUES ('2316', '2014-05-15 00:42:26', '2014-05-15 00:42:26', null, '四川省泸州市龙马潭区', '龙马潭区', ',2279,2313,', '2313');
INSERT INTO `xx_area` VALUES ('2317', '2014-05-15 00:42:27', '2014-05-15 00:42:27', null, '四川省泸州市泸县', '泸县', ',2279,2313,', '2313');
INSERT INTO `xx_area` VALUES ('2318', '2014-05-15 00:42:28', '2014-05-15 00:42:28', null, '四川省泸州市合江县', '合江县', ',2279,2313,', '2313');
INSERT INTO `xx_area` VALUES ('2319', '2014-05-15 00:42:29', '2014-05-15 00:42:29', null, '四川省泸州市叙永县', '叙永县', ',2279,2313,', '2313');
INSERT INTO `xx_area` VALUES ('2320', '2014-05-15 00:42:30', '2014-05-15 00:42:30', null, '四川省泸州市古蔺县', '古蔺县', ',2279,2313,', '2313');
INSERT INTO `xx_area` VALUES ('2321', '2014-05-15 00:42:31', '2014-05-15 00:42:31', null, '四川省德阳市', '德阳市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2322', '2014-05-15 00:42:32', '2014-05-15 00:42:32', null, '四川省德阳市旌阳区', '旌阳区', ',2279,2321,', '2321');
INSERT INTO `xx_area` VALUES ('2323', '2014-05-15 00:42:33', '2014-05-15 00:42:33', null, '四川省德阳市中江县', '中江县', ',2279,2321,', '2321');
INSERT INTO `xx_area` VALUES ('2324', '2014-05-15 00:42:34', '2014-05-15 00:42:34', null, '四川省德阳市罗江县', '罗江县', ',2279,2321,', '2321');
INSERT INTO `xx_area` VALUES ('2325', '2014-05-15 00:42:35', '2014-05-15 00:42:35', null, '四川省德阳市广汉市', '广汉市', ',2279,2321,', '2321');
INSERT INTO `xx_area` VALUES ('2326', '2014-05-15 00:42:36', '2014-05-15 00:42:36', null, '四川省德阳市什邡市', '什邡市', ',2279,2321,', '2321');
INSERT INTO `xx_area` VALUES ('2327', '2014-05-15 00:42:37', '2014-05-15 00:42:37', null, '四川省德阳市绵竹市', '绵竹市', ',2279,2321,', '2321');
INSERT INTO `xx_area` VALUES ('2328', '2014-05-15 00:42:38', '2014-05-15 00:42:38', null, '四川省绵阳市', '绵阳市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2329', '2014-05-15 00:42:39', '2014-05-15 00:42:39', null, '四川省绵阳市涪城区', '涪城区', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2330', '2014-05-15 00:42:40', '2014-05-15 00:42:40', null, '四川省绵阳市游仙区', '游仙区', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2331', '2014-05-15 00:42:41', '2014-05-15 00:42:41', null, '四川省绵阳市三台县', '三台县', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2332', '2014-05-15 00:42:42', '2014-05-15 00:42:42', null, '四川省绵阳市盐亭县', '盐亭县', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2333', '2014-05-15 00:42:43', '2014-05-15 00:42:43', null, '四川省绵阳市安县', '安县', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2334', '2014-05-15 00:42:44', '2014-05-15 00:42:44', null, '四川省绵阳市梓潼县', '梓潼县', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2335', '2014-05-15 00:42:45', '2014-05-15 00:42:45', null, '四川省绵阳市北川羌族自治县', '北川羌族自治县', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2336', '2014-05-15 00:42:46', '2014-05-15 00:42:46', null, '四川省绵阳市平武县', '平武县', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2337', '2014-05-15 00:42:47', '2014-05-15 00:42:47', null, '四川省绵阳市江油市', '江油市', ',2279,2328,', '2328');
INSERT INTO `xx_area` VALUES ('2338', '2014-05-15 00:42:48', '2014-05-15 00:42:48', null, '四川省广元市', '广元市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2339', '2014-05-15 00:42:49', '2014-05-15 00:42:49', null, '四川省广元市利州区', '利州区', ',2279,2338,', '2338');
INSERT INTO `xx_area` VALUES ('2340', '2014-05-15 00:42:50', '2014-05-15 00:42:50', null, '四川省广元市元坝区', '元坝区', ',2279,2338,', '2338');
INSERT INTO `xx_area` VALUES ('2341', '2014-05-15 00:42:51', '2014-05-15 00:42:51', null, '四川省广元市朝天区', '朝天区', ',2279,2338,', '2338');
INSERT INTO `xx_area` VALUES ('2342', '2014-05-15 00:42:52', '2014-05-15 00:42:52', null, '四川省广元市旺苍县', '旺苍县', ',2279,2338,', '2338');
INSERT INTO `xx_area` VALUES ('2343', '2014-05-15 00:42:53', '2014-05-15 00:42:53', null, '四川省广元市青川县', '青川县', ',2279,2338,', '2338');
INSERT INTO `xx_area` VALUES ('2344', '2014-05-15 00:42:54', '2014-05-15 00:42:54', null, '四川省广元市剑阁县', '剑阁县', ',2279,2338,', '2338');
INSERT INTO `xx_area` VALUES ('2345', '2014-05-15 00:42:55', '2014-05-15 00:42:55', null, '四川省广元市苍溪县', '苍溪县', ',2279,2338,', '2338');
INSERT INTO `xx_area` VALUES ('2346', '2014-05-15 00:42:56', '2014-05-15 00:42:56', null, '四川省遂宁市', '遂宁市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2347', '2014-05-15 00:42:57', '2014-05-15 00:42:57', null, '四川省遂宁市船山区', '船山区', ',2279,2346,', '2346');
INSERT INTO `xx_area` VALUES ('2348', '2014-05-15 00:42:58', '2014-05-15 00:42:58', null, '四川省遂宁市安居区', '安居区', ',2279,2346,', '2346');
INSERT INTO `xx_area` VALUES ('2349', '2014-05-15 00:42:59', '2014-05-15 00:42:59', null, '四川省遂宁市蓬溪县', '蓬溪县', ',2279,2346,', '2346');
INSERT INTO `xx_area` VALUES ('2350', '2014-05-15 00:43:00', '2014-05-15 00:43:00', null, '四川省遂宁市射洪县', '射洪县', ',2279,2346,', '2346');
INSERT INTO `xx_area` VALUES ('2351', '2014-05-15 00:43:01', '2014-05-15 00:43:01', null, '四川省遂宁市大英县', '大英县', ',2279,2346,', '2346');
INSERT INTO `xx_area` VALUES ('2352', '2014-05-15 00:43:02', '2014-05-15 00:43:02', null, '四川省内江市', '内江市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2353', '2014-05-15 00:43:03', '2014-05-15 00:43:03', null, '四川省内江市市中区', '市中区', ',2279,2352,', '2352');
INSERT INTO `xx_area` VALUES ('2354', '2014-05-15 00:43:04', '2014-05-15 00:43:04', null, '四川省内江市东兴区', '东兴区', ',2279,2352,', '2352');
INSERT INTO `xx_area` VALUES ('2355', '2014-05-15 00:43:05', '2014-05-15 00:43:05', null, '四川省内江市威远县', '威远县', ',2279,2352,', '2352');
INSERT INTO `xx_area` VALUES ('2356', '2014-05-15 00:43:06', '2014-05-15 00:43:06', null, '四川省内江市资中县', '资中县', ',2279,2352,', '2352');
INSERT INTO `xx_area` VALUES ('2357', '2014-05-15 00:43:07', '2014-05-15 00:43:07', null, '四川省内江市隆昌县', '隆昌县', ',2279,2352,', '2352');
INSERT INTO `xx_area` VALUES ('2358', '2014-05-15 00:43:08', '2014-05-15 00:43:08', null, '四川省乐山市', '乐山市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2359', '2014-05-15 00:43:09', '2014-05-15 00:43:09', null, '四川省乐山市市中区', '市中区', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2360', '2014-05-15 00:43:10', '2014-05-15 00:43:10', null, '四川省乐山市沙湾区', '沙湾区', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2361', '2014-05-15 00:43:11', '2014-05-15 00:43:11', null, '四川省乐山市五通桥区', '五通桥区', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2362', '2014-05-15 00:43:12', '2014-05-15 00:43:12', null, '四川省乐山市金口河区', '金口河区', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2363', '2014-05-15 00:43:13', '2014-05-15 00:43:13', null, '四川省乐山市犍为县', '犍为县', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2364', '2014-05-15 00:43:14', '2014-05-15 00:43:14', null, '四川省乐山市井研县', '井研县', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2365', '2014-05-15 00:43:15', '2014-05-15 00:43:15', null, '四川省乐山市夹江县', '夹江县', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2366', '2014-05-15 00:43:16', '2014-05-15 00:43:16', null, '四川省乐山市沐川县', '沐川县', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2367', '2014-05-15 00:43:17', '2014-05-15 00:43:17', null, '四川省乐山市峨边彝族自治县', '峨边彝族自治县', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2368', '2014-05-15 00:43:18', '2014-05-15 00:43:18', null, '四川省乐山市马边彝族自治县', '马边彝族自治县', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2369', '2014-05-15 00:43:19', '2014-05-15 00:43:19', null, '四川省乐山市峨眉山市', '峨眉山市', ',2279,2358,', '2358');
INSERT INTO `xx_area` VALUES ('2370', '2014-05-15 00:43:20', '2014-05-15 00:43:20', null, '四川省南充市', '南充市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2371', '2014-05-15 00:43:21', '2014-05-15 00:43:21', null, '四川省南充市顺庆区', '顺庆区', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2372', '2014-05-15 00:43:22', '2014-05-15 00:43:22', null, '四川省南充市高坪区', '高坪区', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2373', '2014-05-15 00:43:23', '2014-05-15 00:43:23', null, '四川省南充市嘉陵区', '嘉陵区', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2374', '2014-05-15 00:43:24', '2014-05-15 00:43:24', null, '四川省南充市南部县', '南部县', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2375', '2014-05-15 00:43:25', '2014-05-15 00:43:25', null, '四川省南充市营山县', '营山县', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2376', '2014-05-15 00:43:26', '2014-05-15 00:43:26', null, '四川省南充市蓬安县', '蓬安县', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2377', '2014-05-15 00:43:27', '2014-05-15 00:43:27', null, '四川省南充市仪陇县', '仪陇县', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2378', '2014-05-15 00:43:28', '2014-05-15 00:43:28', null, '四川省南充市西充县', '西充县', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2379', '2014-05-15 00:43:29', '2014-05-15 00:43:29', null, '四川省南充市阆中市', '阆中市', ',2279,2370,', '2370');
INSERT INTO `xx_area` VALUES ('2380', '2014-05-15 00:43:30', '2014-05-15 00:43:30', null, '四川省眉山市', '眉山市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2381', '2014-05-15 00:43:31', '2014-05-15 00:43:31', null, '四川省眉山市东坡区', '东坡区', ',2279,2380,', '2380');
INSERT INTO `xx_area` VALUES ('2382', '2014-05-15 00:43:32', '2014-05-15 00:43:32', null, '四川省眉山市仁寿县', '仁寿县', ',2279,2380,', '2380');
INSERT INTO `xx_area` VALUES ('2383', '2014-05-15 00:43:33', '2014-05-15 00:43:33', null, '四川省眉山市彭山县', '彭山县', ',2279,2380,', '2380');
INSERT INTO `xx_area` VALUES ('2384', '2014-05-15 00:43:34', '2014-05-15 00:43:34', null, '四川省眉山市洪雅县', '洪雅县', ',2279,2380,', '2380');
INSERT INTO `xx_area` VALUES ('2385', '2014-05-15 00:43:35', '2014-05-15 00:43:35', null, '四川省眉山市丹棱县', '丹棱县', ',2279,2380,', '2380');
INSERT INTO `xx_area` VALUES ('2386', '2014-05-15 00:43:36', '2014-05-15 00:43:36', null, '四川省眉山市青神县', '青神县', ',2279,2380,', '2380');
INSERT INTO `xx_area` VALUES ('2387', '2014-05-15 00:43:37', '2014-05-15 00:43:37', null, '四川省宜宾市', '宜宾市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2388', '2014-05-15 00:43:38', '2014-05-15 00:43:38', null, '四川省宜宾市翠屏区', '翠屏区', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2389', '2014-05-15 00:43:39', '2014-05-15 00:43:39', null, '四川省宜宾市南溪区', '南溪区', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2390', '2014-05-15 00:43:40', '2014-05-15 00:43:40', null, '四川省宜宾市宜宾县', '宜宾县', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2391', '2014-05-15 00:43:41', '2014-05-15 00:43:41', null, '四川省宜宾市江安县', '江安县', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2392', '2014-05-15 00:43:42', '2014-05-15 00:43:42', null, '四川省宜宾市长宁县', '长宁县', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2393', '2014-05-15 00:43:43', '2014-05-15 00:43:43', null, '四川省宜宾市高县', '高县', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2394', '2014-05-15 00:43:44', '2014-05-15 00:43:44', null, '四川省宜宾市珙县', '珙县', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2395', '2014-05-15 00:43:45', '2014-05-15 00:43:45', null, '四川省宜宾市筠连县', '筠连县', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2396', '2014-05-15 00:43:46', '2014-05-15 00:43:46', null, '四川省宜宾市兴文县', '兴文县', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2397', '2014-05-15 00:43:47', '2014-05-15 00:43:47', null, '四川省宜宾市屏山县', '屏山县', ',2279,2387,', '2387');
INSERT INTO `xx_area` VALUES ('2398', '2014-05-15 00:43:48', '2014-05-15 00:43:48', null, '四川省广安市', '广安市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2399', '2014-05-15 00:43:49', '2014-05-15 00:43:49', null, '四川省广安市广安区', '广安区', ',2279,2398,', '2398');
INSERT INTO `xx_area` VALUES ('2400', '2014-05-15 00:43:50', '2014-05-15 00:43:50', null, '四川省广安市岳池县', '岳池县', ',2279,2398,', '2398');
INSERT INTO `xx_area` VALUES ('2401', '2014-05-15 00:43:51', '2014-05-15 00:43:51', null, '四川省广安市武胜县', '武胜县', ',2279,2398,', '2398');
INSERT INTO `xx_area` VALUES ('2402', '2014-05-15 00:43:52', '2014-05-15 00:43:52', null, '四川省广安市邻水县', '邻水县', ',2279,2398,', '2398');
INSERT INTO `xx_area` VALUES ('2403', '2014-05-15 00:43:53', '2014-05-15 00:43:53', null, '四川省广安市华蓥市', '华蓥市', ',2279,2398,', '2398');
INSERT INTO `xx_area` VALUES ('2404', '2014-05-15 00:43:54', '2014-05-15 00:43:54', null, '四川省达州市', '达州市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2405', '2014-05-15 00:43:55', '2014-05-15 00:43:55', null, '四川省达州市通川区', '通川区', ',2279,2404,', '2404');
INSERT INTO `xx_area` VALUES ('2406', '2014-05-15 00:43:56', '2014-05-15 00:43:56', null, '四川省达州市达县', '达县', ',2279,2404,', '2404');
INSERT INTO `xx_area` VALUES ('2407', '2014-05-15 00:43:57', '2014-05-15 00:43:57', null, '四川省达州市宣汉县', '宣汉县', ',2279,2404,', '2404');
INSERT INTO `xx_area` VALUES ('2408', '2014-05-15 00:43:58', '2014-05-15 00:43:58', null, '四川省达州市开江县', '开江县', ',2279,2404,', '2404');
INSERT INTO `xx_area` VALUES ('2409', '2014-05-15 00:43:59', '2014-05-15 00:43:59', null, '四川省达州市大竹县', '大竹县', ',2279,2404,', '2404');
INSERT INTO `xx_area` VALUES ('2410', '2014-05-15 00:44:00', '2014-05-15 00:44:00', null, '四川省达州市渠县', '渠县', ',2279,2404,', '2404');
INSERT INTO `xx_area` VALUES ('2411', '2014-05-15 00:44:01', '2014-05-15 00:44:01', null, '四川省达州市万源市', '万源市', ',2279,2404,', '2404');
INSERT INTO `xx_area` VALUES ('2412', '2014-05-15 00:44:02', '2014-05-15 00:44:02', null, '四川省雅安市', '雅安市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2413', '2014-05-15 00:44:03', '2014-05-15 00:44:03', null, '四川省雅安市雨城区', '雨城区', ',2279,2412,', '2412');
INSERT INTO `xx_area` VALUES ('2414', '2014-05-15 00:44:04', '2014-05-15 00:44:04', null, '四川省雅安市名山区', '名山区', ',2279,2412,', '2412');
INSERT INTO `xx_area` VALUES ('2415', '2014-05-15 00:44:05', '2014-05-15 00:44:05', null, '四川省雅安市荥经县', '荥经县', ',2279,2412,', '2412');
INSERT INTO `xx_area` VALUES ('2416', '2014-05-15 00:44:06', '2014-05-15 00:44:06', null, '四川省雅安市汉源县', '汉源县', ',2279,2412,', '2412');
INSERT INTO `xx_area` VALUES ('2417', '2014-05-15 00:44:07', '2014-05-15 00:44:07', null, '四川省雅安市石棉县', '石棉县', ',2279,2412,', '2412');
INSERT INTO `xx_area` VALUES ('2418', '2014-05-15 00:44:08', '2014-05-15 00:44:08', null, '四川省雅安市天全县', '天全县', ',2279,2412,', '2412');
INSERT INTO `xx_area` VALUES ('2419', '2014-05-15 00:44:09', '2014-05-15 00:44:09', null, '四川省雅安市芦山县', '芦山县', ',2279,2412,', '2412');
INSERT INTO `xx_area` VALUES ('2420', '2014-05-15 00:44:10', '2014-05-15 00:44:10', null, '四川省雅安市宝兴县', '宝兴县', ',2279,2412,', '2412');
INSERT INTO `xx_area` VALUES ('2421', '2014-05-15 00:44:11', '2014-05-15 00:44:11', null, '四川省巴中市', '巴中市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2422', '2014-05-15 00:44:12', '2014-05-15 00:44:12', null, '四川省巴中市巴州区', '巴州区', ',2279,2421,', '2421');
INSERT INTO `xx_area` VALUES ('2423', '2014-05-15 00:44:13', '2014-05-15 00:44:13', null, '四川省巴中市通江县', '通江县', ',2279,2421,', '2421');
INSERT INTO `xx_area` VALUES ('2424', '2014-05-15 00:44:14', '2014-05-15 00:44:14', null, '四川省巴中市南江县', '南江县', ',2279,2421,', '2421');
INSERT INTO `xx_area` VALUES ('2425', '2014-05-15 00:44:15', '2014-05-15 00:44:15', null, '四川省巴中市平昌县', '平昌县', ',2279,2421,', '2421');
INSERT INTO `xx_area` VALUES ('2426', '2014-05-15 00:44:16', '2014-05-15 00:44:16', null, '四川省资阳市', '资阳市', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2427', '2014-05-15 00:44:17', '2014-05-15 00:44:17', null, '四川省资阳市雁江区', '雁江区', ',2279,2426,', '2426');
INSERT INTO `xx_area` VALUES ('2428', '2014-05-15 00:44:18', '2014-05-15 00:44:18', null, '四川省资阳市安岳县', '安岳县', ',2279,2426,', '2426');
INSERT INTO `xx_area` VALUES ('2429', '2014-05-15 00:44:19', '2014-05-15 00:44:19', null, '四川省资阳市乐至县', '乐至县', ',2279,2426,', '2426');
INSERT INTO `xx_area` VALUES ('2430', '2014-05-15 00:44:20', '2014-05-15 00:44:20', null, '四川省资阳市简阳市', '简阳市', ',2279,2426,', '2426');
INSERT INTO `xx_area` VALUES ('2431', '2014-05-15 00:44:21', '2014-05-15 00:44:21', null, '四川省阿坝藏族羌族自治州', '阿坝藏族羌族自治州', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2432', '2014-05-15 00:44:22', '2014-05-15 00:44:22', null, '四川省阿坝藏族羌族自治州汶川县', '汶川县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2433', '2014-05-15 00:44:23', '2014-05-15 00:44:23', null, '四川省阿坝藏族羌族自治州理县', '理县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2434', '2014-05-15 00:44:24', '2014-05-15 00:44:24', null, '四川省阿坝藏族羌族自治州茂县', '茂县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2435', '2014-05-15 00:44:25', '2014-05-15 00:44:25', null, '四川省阿坝藏族羌族自治州松潘县', '松潘县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2436', '2014-05-15 00:44:26', '2014-05-15 00:44:26', null, '四川省阿坝藏族羌族自治州九寨沟县', '九寨沟县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2437', '2014-05-15 00:44:27', '2014-05-15 00:44:27', null, '四川省阿坝藏族羌族自治州金川县', '金川县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2438', '2014-05-15 00:44:28', '2014-05-15 00:44:28', null, '四川省阿坝藏族羌族自治州小金县', '小金县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2439', '2014-05-15 00:44:29', '2014-05-15 00:44:29', null, '四川省阿坝藏族羌族自治州黑水县', '黑水县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2440', '2014-05-15 00:44:30', '2014-05-15 00:44:30', null, '四川省阿坝藏族羌族自治州马尔康县', '马尔康县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2441', '2014-05-15 00:44:31', '2014-05-15 00:44:31', null, '四川省阿坝藏族羌族自治州壤塘县', '壤塘县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2442', '2014-05-15 00:44:32', '2014-05-15 00:44:32', null, '四川省阿坝藏族羌族自治州阿坝县', '阿坝县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2443', '2014-05-15 00:44:33', '2014-05-15 00:44:33', null, '四川省阿坝藏族羌族自治州若尔盖县', '若尔盖县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2444', '2014-05-15 00:44:34', '2014-05-15 00:44:34', null, '四川省阿坝藏族羌族自治州红原县', '红原县', ',2279,2431,', '2431');
INSERT INTO `xx_area` VALUES ('2445', '2014-05-15 00:44:35', '2014-05-15 00:44:35', null, '四川省甘孜藏族自治州', '甘孜藏族自治州', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2446', '2014-05-15 00:44:36', '2014-05-15 00:44:36', null, '四川省甘孜藏族自治州康定县', '康定县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2447', '2014-05-15 00:44:37', '2014-05-15 00:44:37', null, '四川省甘孜藏族自治州泸定县', '泸定县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2448', '2014-05-15 00:44:38', '2014-05-15 00:44:38', null, '四川省甘孜藏族自治州丹巴县', '丹巴县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2449', '2014-05-15 00:44:39', '2014-05-15 00:44:39', null, '四川省甘孜藏族自治州九龙县', '九龙县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2450', '2014-05-15 00:44:40', '2014-05-15 00:44:40', null, '四川省甘孜藏族自治州雅江县', '雅江县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2451', '2014-05-15 00:44:41', '2014-05-15 00:44:41', null, '四川省甘孜藏族自治州道孚县', '道孚县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2452', '2014-05-15 00:44:42', '2014-05-15 00:44:42', null, '四川省甘孜藏族自治州炉霍县', '炉霍县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2453', '2014-05-15 00:44:43', '2014-05-15 00:44:43', null, '四川省甘孜藏族自治州甘孜县', '甘孜县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2454', '2014-05-15 00:44:44', '2014-05-15 00:44:44', null, '四川省甘孜藏族自治州新龙县', '新龙县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2455', '2014-05-15 00:44:45', '2014-05-15 00:44:45', null, '四川省甘孜藏族自治州德格县', '德格县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2456', '2014-05-15 00:44:46', '2014-05-15 00:44:46', null, '四川省甘孜藏族自治州白玉县', '白玉县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2457', '2014-05-15 00:44:47', '2014-05-15 00:44:47', null, '四川省甘孜藏族自治州石渠县', '石渠县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2458', '2014-05-15 00:44:48', '2014-05-15 00:44:48', null, '四川省甘孜藏族自治州色达县', '色达县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2459', '2014-05-15 00:44:49', '2014-05-15 00:44:49', null, '四川省甘孜藏族自治州理塘县', '理塘县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2460', '2014-05-15 00:44:50', '2014-05-15 00:44:50', null, '四川省甘孜藏族自治州巴塘县', '巴塘县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2461', '2014-05-15 00:44:51', '2014-05-15 00:44:51', null, '四川省甘孜藏族自治州乡城县', '乡城县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2462', '2014-05-15 00:44:52', '2014-05-15 00:44:52', null, '四川省甘孜藏族自治州稻城县', '稻城县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2463', '2014-05-15 00:44:53', '2014-05-15 00:44:53', null, '四川省甘孜藏族自治州得荣县', '得荣县', ',2279,2445,', '2445');
INSERT INTO `xx_area` VALUES ('2464', '2014-05-15 00:44:54', '2014-05-15 00:44:54', null, '四川省凉山彝族自治州', '凉山彝族自治州', ',2279,', '2279');
INSERT INTO `xx_area` VALUES ('2465', '2014-05-15 00:44:55', '2014-05-15 00:44:55', null, '四川省凉山彝族自治州西昌市', '西昌市', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2466', '2014-05-15 00:44:56', '2014-05-15 00:44:56', null, '四川省凉山彝族自治州木里藏族自治县', '木里藏族自治县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2467', '2014-05-15 00:44:57', '2014-05-15 00:44:57', null, '四川省凉山彝族自治州盐源县', '盐源县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2468', '2014-05-15 00:44:58', '2014-05-15 00:44:58', null, '四川省凉山彝族自治州德昌县', '德昌县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2469', '2014-05-15 00:44:59', '2014-05-15 00:44:59', null, '四川省凉山彝族自治州会理县', '会理县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2470', '2014-05-15 00:45:00', '2014-05-15 00:45:00', null, '四川省凉山彝族自治州会东县', '会东县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2471', '2014-05-15 00:45:01', '2014-05-15 00:45:01', null, '四川省凉山彝族自治州宁南县', '宁南县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2472', '2014-05-15 00:45:02', '2014-05-15 00:45:02', null, '四川省凉山彝族自治州普格县', '普格县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2473', '2014-05-15 00:45:03', '2014-05-15 00:45:03', null, '四川省凉山彝族自治州布拖县', '布拖县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2474', '2014-05-15 00:45:04', '2014-05-15 00:45:04', null, '四川省凉山彝族自治州金阳县', '金阳县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2475', '2014-05-15 00:45:05', '2014-05-15 00:45:05', null, '四川省凉山彝族自治州昭觉县', '昭觉县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2476', '2014-05-15 00:45:06', '2014-05-15 00:45:06', null, '四川省凉山彝族自治州喜德县', '喜德县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2477', '2014-05-15 00:45:07', '2014-05-15 00:45:07', null, '四川省凉山彝族自治州冕宁县', '冕宁县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2478', '2014-05-15 00:45:08', '2014-05-15 00:45:08', null, '四川省凉山彝族自治州越西县', '越西县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2479', '2014-05-15 00:45:09', '2014-05-15 00:45:09', null, '四川省凉山彝族自治州甘洛县', '甘洛县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2480', '2014-05-15 00:45:10', '2014-05-15 00:45:10', null, '四川省凉山彝族自治州美姑县', '美姑县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2481', '2014-05-15 00:45:11', '2014-05-15 00:45:11', null, '四川省凉山彝族自治州雷波县', '雷波县', ',2279,2464,', '2464');
INSERT INTO `xx_area` VALUES ('2482', '2014-05-15 00:45:12', '2014-05-15 00:45:12', null, '贵州省', '贵州省', ',', null);
INSERT INTO `xx_area` VALUES ('2483', '2014-05-15 00:45:13', '2014-05-15 00:45:13', null, '贵州省贵阳市', '贵阳市', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2484', '2014-05-15 00:45:14', '2014-05-15 00:45:14', null, '贵州省贵阳市南明区', '南明区', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2485', '2014-05-15 00:45:15', '2014-05-15 00:45:15', null, '贵州省贵阳市云岩区', '云岩区', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2486', '2014-05-15 00:45:16', '2014-05-15 00:45:16', null, '贵州省贵阳市花溪区', '花溪区', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2487', '2014-05-15 00:45:17', '2014-05-15 00:45:17', null, '贵州省贵阳市乌当区', '乌当区', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2488', '2014-05-15 00:45:18', '2014-05-15 00:45:18', null, '贵州省贵阳市白云区', '白云区', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2489', '2014-05-15 00:45:19', '2014-05-15 00:45:19', null, '贵州省贵阳市小河区', '小河区', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2490', '2014-05-15 00:45:20', '2014-05-15 00:45:20', null, '贵州省贵阳市开阳县', '开阳县', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2491', '2014-05-15 00:45:21', '2014-05-15 00:45:21', null, '贵州省贵阳市息烽县', '息烽县', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2492', '2014-05-15 00:45:22', '2014-05-15 00:45:22', null, '贵州省贵阳市修文县', '修文县', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2493', '2014-05-15 00:45:23', '2014-05-15 00:45:23', null, '贵州省贵阳市清镇市', '清镇市', ',2482,2483,', '2483');
INSERT INTO `xx_area` VALUES ('2494', '2014-05-15 00:45:24', '2014-05-15 00:45:24', null, '贵州省六盘水市', '六盘水市', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2495', '2014-05-15 00:45:25', '2014-05-15 00:45:25', null, '贵州省六盘水市钟山区', '钟山区', ',2482,2494,', '2494');
INSERT INTO `xx_area` VALUES ('2496', '2014-05-15 00:45:26', '2014-05-15 00:45:26', null, '贵州省六盘水市六枝特区', '六枝特区', ',2482,2494,', '2494');
INSERT INTO `xx_area` VALUES ('2497', '2014-05-15 00:45:27', '2014-05-15 00:45:27', null, '贵州省六盘水市水城县', '水城县', ',2482,2494,', '2494');
INSERT INTO `xx_area` VALUES ('2498', '2014-05-15 00:45:28', '2014-05-15 00:45:28', null, '贵州省六盘水市盘县', '盘县', ',2482,2494,', '2494');
INSERT INTO `xx_area` VALUES ('2499', '2014-05-15 00:45:29', '2014-05-15 00:45:29', null, '贵州省遵义市', '遵义市', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2500', '2014-05-15 00:45:30', '2014-05-15 00:45:30', null, '贵州省遵义市红花岗区', '红花岗区', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2501', '2014-05-15 00:45:31', '2014-05-15 00:45:31', null, '贵州省遵义市汇川区', '汇川区', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2502', '2014-05-15 00:45:32', '2014-05-15 00:45:32', null, '贵州省遵义市遵义县', '遵义县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2503', '2014-05-15 00:45:33', '2014-05-15 00:45:33', null, '贵州省遵义市桐梓县', '桐梓县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2504', '2014-05-15 00:45:34', '2014-05-15 00:45:34', null, '贵州省遵义市绥阳县', '绥阳县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2505', '2014-05-15 00:45:35', '2014-05-15 00:45:35', null, '贵州省遵义市正安县', '正安县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2506', '2014-05-15 00:45:36', '2014-05-15 00:45:36', null, '贵州省遵义市道真仡佬族苗族自治县', '道真仡佬族苗族自治县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2507', '2014-05-15 00:45:37', '2014-05-15 00:45:37', null, '贵州省遵义市务川仡佬族苗族自治县', '务川仡佬族苗族自治县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2508', '2014-05-15 00:45:38', '2014-05-15 00:45:38', null, '贵州省遵义市凤冈县', '凤冈县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2509', '2014-05-15 00:45:39', '2014-05-15 00:45:39', null, '贵州省遵义市湄潭县', '湄潭县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2510', '2014-05-15 00:45:40', '2014-05-15 00:45:40', null, '贵州省遵义市余庆县', '余庆县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2511', '2014-05-15 00:45:41', '2014-05-15 00:45:41', null, '贵州省遵义市习水县', '习水县', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2512', '2014-05-15 00:45:42', '2014-05-15 00:45:42', null, '贵州省遵义市赤水市', '赤水市', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2513', '2014-05-15 00:45:43', '2014-05-15 00:45:43', null, '贵州省遵义市仁怀市', '仁怀市', ',2482,2499,', '2499');
INSERT INTO `xx_area` VALUES ('2514', '2014-05-15 00:45:44', '2014-05-15 00:45:44', null, '贵州省安顺市', '安顺市', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2515', '2014-05-15 00:45:45', '2014-05-15 00:45:45', null, '贵州省安顺市西秀区', '西秀区', ',2482,2514,', '2514');
INSERT INTO `xx_area` VALUES ('2516', '2014-05-15 00:45:46', '2014-05-15 00:45:46', null, '贵州省安顺市平坝县', '平坝县', ',2482,2514,', '2514');
INSERT INTO `xx_area` VALUES ('2517', '2014-05-15 00:45:47', '2014-05-15 00:45:47', null, '贵州省安顺市普定县', '普定县', ',2482,2514,', '2514');
INSERT INTO `xx_area` VALUES ('2518', '2014-05-15 00:45:48', '2014-05-15 00:45:48', null, '贵州省安顺市镇宁布依族苗族自治县', '镇宁布依族苗族自治县', ',2482,2514,', '2514');
INSERT INTO `xx_area` VALUES ('2519', '2014-05-15 00:45:49', '2014-05-15 00:45:49', null, '贵州省安顺市关岭布依族苗族自治县', '关岭布依族苗族自治县', ',2482,2514,', '2514');
INSERT INTO `xx_area` VALUES ('2520', '2014-05-15 00:45:50', '2014-05-15 00:45:50', null, '贵州省安顺市紫云苗族布依族自治县', '紫云苗族布依族自治县', ',2482,2514,', '2514');
INSERT INTO `xx_area` VALUES ('2521', '2014-05-15 00:45:51', '2014-05-15 00:45:51', null, '贵州省毕节市', '毕节市', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2522', '2014-05-15 00:45:52', '2014-05-15 00:45:52', null, '贵州省毕节市七星关区', '七星关区', ',2482,2521,', '2521');
INSERT INTO `xx_area` VALUES ('2523', '2014-05-15 00:45:53', '2014-05-15 00:45:53', null, '贵州省毕节市大方县', '大方县', ',2482,2521,', '2521');
INSERT INTO `xx_area` VALUES ('2524', '2014-05-15 00:45:54', '2014-05-15 00:45:54', null, '贵州省毕节市黔西县', '黔西县', ',2482,2521,', '2521');
INSERT INTO `xx_area` VALUES ('2525', '2014-05-15 00:45:55', '2014-05-15 00:45:55', null, '贵州省毕节市金沙县', '金沙县', ',2482,2521,', '2521');
INSERT INTO `xx_area` VALUES ('2526', '2014-05-15 00:45:56', '2014-05-15 00:45:56', null, '贵州省毕节市织金县', '织金县', ',2482,2521,', '2521');
INSERT INTO `xx_area` VALUES ('2527', '2014-05-15 00:45:57', '2014-05-15 00:45:57', null, '贵州省毕节市纳雍县', '纳雍县', ',2482,2521,', '2521');
INSERT INTO `xx_area` VALUES ('2528', '2014-05-15 00:45:58', '2014-05-15 00:45:58', null, '贵州省毕节市威宁彝族回族苗族自治县', '威宁彝族回族苗族自治县', ',2482,2521,', '2521');
INSERT INTO `xx_area` VALUES ('2529', '2014-05-15 00:45:59', '2014-05-15 00:45:59', null, '贵州省毕节市赫章县', '赫章县', ',2482,2521,', '2521');
INSERT INTO `xx_area` VALUES ('2530', '2014-05-15 00:46:00', '2014-05-15 00:46:00', null, '贵州省铜仁市', '铜仁市', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2531', '2014-05-15 00:46:01', '2014-05-15 00:46:01', null, '贵州省铜仁市碧江区', '碧江区', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2532', '2014-05-15 00:46:02', '2014-05-15 00:46:02', null, '贵州省铜仁市万山区', '万山区', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2533', '2014-05-15 00:46:03', '2014-05-15 00:46:03', null, '贵州省铜仁市江口县', '江口县', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2534', '2014-05-15 00:46:04', '2014-05-15 00:46:04', null, '贵州省铜仁市玉屏侗族自治县', '玉屏侗族自治县', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2535', '2014-05-15 00:46:05', '2014-05-15 00:46:05', null, '贵州省铜仁市石阡县', '石阡县', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2536', '2014-05-15 00:46:06', '2014-05-15 00:46:06', null, '贵州省铜仁市思南县', '思南县', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2537', '2014-05-15 00:46:07', '2014-05-15 00:46:07', null, '贵州省铜仁市印江土家族苗族自治县', '印江土家族苗族自治县', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2538', '2014-05-15 00:46:08', '2014-05-15 00:46:08', null, '贵州省铜仁市德江县', '德江县', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2539', '2014-05-15 00:46:09', '2014-05-15 00:46:09', null, '贵州省铜仁市沿河土家族自治县', '沿河土家族自治县', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2540', '2014-05-15 00:46:10', '2014-05-15 00:46:10', null, '贵州省铜仁市松桃苗族自治县', '松桃苗族自治县', ',2482,2530,', '2530');
INSERT INTO `xx_area` VALUES ('2541', '2014-05-15 00:46:11', '2014-05-15 00:46:11', null, '贵州省黔西南布依族苗族自治州', '黔西南布依族苗族自治州', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2542', '2014-05-15 00:46:12', '2014-05-15 00:46:12', null, '贵州省黔西南布依族苗族自治州兴义市', '兴义市', ',2482,2541,', '2541');
INSERT INTO `xx_area` VALUES ('2543', '2014-05-15 00:46:13', '2014-05-15 00:46:13', null, '贵州省黔西南布依族苗族自治州兴仁县', '兴仁县', ',2482,2541,', '2541');
INSERT INTO `xx_area` VALUES ('2544', '2014-05-15 00:46:14', '2014-05-15 00:46:14', null, '贵州省黔西南布依族苗族自治州普安县', '普安县', ',2482,2541,', '2541');
INSERT INTO `xx_area` VALUES ('2545', '2014-05-15 00:46:15', '2014-05-15 00:46:15', null, '贵州省黔西南布依族苗族自治州晴隆县', '晴隆县', ',2482,2541,', '2541');
INSERT INTO `xx_area` VALUES ('2546', '2014-05-15 00:46:16', '2014-05-15 00:46:16', null, '贵州省黔西南布依族苗族自治州贞丰县', '贞丰县', ',2482,2541,', '2541');
INSERT INTO `xx_area` VALUES ('2547', '2014-05-15 00:46:17', '2014-05-15 00:46:17', null, '贵州省黔西南布依族苗族自治州望谟县', '望谟县', ',2482,2541,', '2541');
INSERT INTO `xx_area` VALUES ('2548', '2014-05-15 00:46:18', '2014-05-15 00:46:18', null, '贵州省黔西南布依族苗族自治州册亨县', '册亨县', ',2482,2541,', '2541');
INSERT INTO `xx_area` VALUES ('2549', '2014-05-15 00:46:19', '2014-05-15 00:46:19', null, '贵州省黔西南布依族苗族自治州安龙县', '安龙县', ',2482,2541,', '2541');
INSERT INTO `xx_area` VALUES ('2550', '2014-05-15 00:46:20', '2014-05-15 00:46:20', null, '贵州省黔东南苗族侗族自治州', '黔东南苗族侗族自治州', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2551', '2014-05-15 00:46:21', '2014-05-15 00:46:21', null, '贵州省黔东南苗族侗族自治州凯里市', '凯里市', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2552', '2014-05-15 00:46:22', '2014-05-15 00:46:22', null, '贵州省黔东南苗族侗族自治州黄平县', '黄平县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2553', '2014-05-15 00:46:23', '2014-05-15 00:46:23', null, '贵州省黔东南苗族侗族自治州施秉县', '施秉县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2554', '2014-05-15 00:46:24', '2014-05-15 00:46:24', null, '贵州省黔东南苗族侗族自治州三穗县', '三穗县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2555', '2014-05-15 00:46:25', '2014-05-15 00:46:25', null, '贵州省黔东南苗族侗族自治州镇远县', '镇远县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2556', '2014-05-15 00:46:26', '2014-05-15 00:46:26', null, '贵州省黔东南苗族侗族自治州岑巩县', '岑巩县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2557', '2014-05-15 00:46:27', '2014-05-15 00:46:27', null, '贵州省黔东南苗族侗族自治州天柱县', '天柱县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2558', '2014-05-15 00:46:28', '2014-05-15 00:46:28', null, '贵州省黔东南苗族侗族自治州锦屏县', '锦屏县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2559', '2014-05-15 00:46:29', '2014-05-15 00:46:29', null, '贵州省黔东南苗族侗族自治州剑河县', '剑河县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2560', '2014-05-15 00:46:30', '2014-05-15 00:46:30', null, '贵州省黔东南苗族侗族自治州台江县', '台江县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2561', '2014-05-15 00:46:31', '2014-05-15 00:46:31', null, '贵州省黔东南苗族侗族自治州黎平县', '黎平县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2562', '2014-05-15 00:46:32', '2014-05-15 00:46:32', null, '贵州省黔东南苗族侗族自治州榕江县', '榕江县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2563', '2014-05-15 00:46:33', '2014-05-15 00:46:33', null, '贵州省黔东南苗族侗族自治州从江县', '从江县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2564', '2014-05-15 00:46:34', '2014-05-15 00:46:34', null, '贵州省黔东南苗族侗族自治州雷山县', '雷山县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2565', '2014-05-15 00:46:35', '2014-05-15 00:46:35', null, '贵州省黔东南苗族侗族自治州麻江县', '麻江县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2566', '2014-05-15 00:46:36', '2014-05-15 00:46:36', null, '贵州省黔东南苗族侗族自治州丹寨县', '丹寨县', ',2482,2550,', '2550');
INSERT INTO `xx_area` VALUES ('2567', '2014-05-15 00:46:37', '2014-05-15 00:46:37', null, '贵州省黔南布依族苗族自治州', '黔南布依族苗族自治州', ',2482,', '2482');
INSERT INTO `xx_area` VALUES ('2568', '2014-05-15 00:46:38', '2014-05-15 00:46:38', null, '贵州省黔南布依族苗族自治州都匀市', '都匀市', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2569', '2014-05-15 00:46:39', '2014-05-15 00:46:39', null, '贵州省黔南布依族苗族自治州福泉市', '福泉市', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2570', '2014-05-15 00:46:40', '2014-05-15 00:46:40', null, '贵州省黔南布依族苗族自治州荔波县', '荔波县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2571', '2014-05-15 00:46:41', '2014-05-15 00:46:41', null, '贵州省黔南布依族苗族自治州贵定县', '贵定县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2572', '2014-05-15 00:46:42', '2014-05-15 00:46:42', null, '贵州省黔南布依族苗族自治州瓮安县', '瓮安县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2573', '2014-05-15 00:46:43', '2014-05-15 00:46:43', null, '贵州省黔南布依族苗族自治州独山县', '独山县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2574', '2014-05-15 00:46:44', '2014-05-15 00:46:44', null, '贵州省黔南布依族苗族自治州平塘县', '平塘县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2575', '2014-05-15 00:46:45', '2014-05-15 00:46:45', null, '贵州省黔南布依族苗族自治州罗甸县', '罗甸县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2576', '2014-05-15 00:46:46', '2014-05-15 00:46:46', null, '贵州省黔南布依族苗族自治州长顺县', '长顺县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2577', '2014-05-15 00:46:47', '2014-05-15 00:46:47', null, '贵州省黔南布依族苗族自治州龙里县', '龙里县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2578', '2014-05-15 00:46:48', '2014-05-15 00:46:48', null, '贵州省黔南布依族苗族自治州惠水县', '惠水县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2579', '2014-05-15 00:46:49', '2014-05-15 00:46:49', null, '贵州省黔南布依族苗族自治州三都水族自治县', '三都水族自治县', ',2482,2567,', '2567');
INSERT INTO `xx_area` VALUES ('2580', '2014-05-15 00:46:50', '2014-05-15 00:46:50', null, '云南省', '云南省', ',', null);
INSERT INTO `xx_area` VALUES ('2581', '2014-05-15 00:46:51', '2014-05-15 00:46:51', null, '云南省昆明市', '昆明市', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2582', '2014-05-15 00:46:52', '2014-05-15 00:46:52', null, '云南省昆明市五华区', '五华区', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2583', '2014-05-15 00:46:53', '2014-05-15 00:46:53', null, '云南省昆明市盘龙区', '盘龙区', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2584', '2014-05-15 00:46:54', '2014-05-15 00:46:54', null, '云南省昆明市官渡区', '官渡区', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2585', '2014-05-15 00:46:55', '2014-05-15 00:46:55', null, '云南省昆明市西山区', '西山区', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2586', '2014-05-15 00:46:56', '2014-05-15 00:46:56', null, '云南省昆明市东川区', '东川区', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2587', '2014-05-15 00:46:57', '2014-05-15 00:46:57', null, '云南省昆明市呈贡区', '呈贡区', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2588', '2014-05-15 00:46:58', '2014-05-15 00:46:58', null, '云南省昆明市晋宁县', '晋宁县', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2589', '2014-05-15 00:46:59', '2014-05-15 00:46:59', null, '云南省昆明市富民县', '富民县', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2590', '2014-05-15 00:47:00', '2014-05-15 00:47:00', null, '云南省昆明市宜良县', '宜良县', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2591', '2014-05-15 00:47:01', '2014-05-15 00:47:01', null, '云南省昆明市石林彝族自治县', '石林彝族自治县', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2592', '2014-05-15 00:47:02', '2014-05-15 00:47:02', null, '云南省昆明市嵩明县', '嵩明县', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2593', '2014-05-15 00:47:03', '2014-05-15 00:47:03', null, '云南省昆明市禄劝彝族苗族自治县', '禄劝彝族苗族自治县', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2594', '2014-05-15 00:47:04', '2014-05-15 00:47:04', null, '云南省昆明市寻甸回族彝族自治县', '寻甸回族彝族自治县', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2595', '2014-05-15 00:47:05', '2014-05-15 00:47:05', null, '云南省昆明市安宁市', '安宁市', ',2580,2581,', '2581');
INSERT INTO `xx_area` VALUES ('2596', '2014-05-15 00:47:06', '2014-05-15 00:47:06', null, '云南省曲靖市', '曲靖市', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2597', '2014-05-15 00:47:07', '2014-05-15 00:47:07', null, '云南省曲靖市麒麟区', '麒麟区', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2598', '2014-05-15 00:47:08', '2014-05-15 00:47:08', null, '云南省曲靖市马龙县', '马龙县', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2599', '2014-05-15 00:47:09', '2014-05-15 00:47:09', null, '云南省曲靖市陆良县', '陆良县', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2600', '2014-05-15 00:47:10', '2014-05-15 00:47:10', null, '云南省曲靖市师宗县', '师宗县', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2601', '2014-05-15 00:47:11', '2014-05-15 00:47:11', null, '云南省曲靖市罗平县', '罗平县', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2602', '2014-05-15 00:47:12', '2014-05-15 00:47:12', null, '云南省曲靖市富源县', '富源县', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2603', '2014-05-15 00:47:13', '2014-05-15 00:47:13', null, '云南省曲靖市会泽县', '会泽县', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2604', '2014-05-15 00:47:14', '2014-05-15 00:47:14', null, '云南省曲靖市沾益县', '沾益县', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2605', '2014-05-15 00:47:15', '2014-05-15 00:47:15', null, '云南省曲靖市宣威市', '宣威市', ',2580,2596,', '2596');
INSERT INTO `xx_area` VALUES ('2606', '2014-05-15 00:47:16', '2014-05-15 00:47:16', null, '云南省玉溪市', '玉溪市', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2607', '2014-05-15 00:47:17', '2014-05-15 00:47:17', null, '云南省玉溪市红塔区', '红塔区', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2608', '2014-05-15 00:47:18', '2014-05-15 00:47:18', null, '云南省玉溪市江川县', '江川县', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2609', '2014-05-15 00:47:19', '2014-05-15 00:47:19', null, '云南省玉溪市澄江县', '澄江县', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2610', '2014-05-15 00:47:20', '2014-05-15 00:47:20', null, '云南省玉溪市通海县', '通海县', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2611', '2014-05-15 00:47:21', '2014-05-15 00:47:21', null, '云南省玉溪市华宁县', '华宁县', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2612', '2014-05-15 00:47:22', '2014-05-15 00:47:22', null, '云南省玉溪市易门县', '易门县', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2613', '2014-05-15 00:47:23', '2014-05-15 00:47:23', null, '云南省玉溪市峨山彝族自治县', '峨山彝族自治县', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2614', '2014-05-15 00:47:24', '2014-05-15 00:47:24', null, '云南省玉溪市新平彝族傣族自治县', '新平彝族傣族自治县', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2615', '2014-05-15 00:47:25', '2014-05-15 00:47:25', null, '云南省玉溪市元江哈尼族彝族傣族自治县', '元江哈尼族彝族傣族自治县', ',2580,2606,', '2606');
INSERT INTO `xx_area` VALUES ('2616', '2014-05-15 00:47:26', '2014-05-15 00:47:26', null, '云南省保山市', '保山市', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2617', '2014-05-15 00:47:27', '2014-05-15 00:47:27', null, '云南省保山市隆阳区', '隆阳区', ',2580,2616,', '2616');
INSERT INTO `xx_area` VALUES ('2618', '2014-05-15 00:47:28', '2014-05-15 00:47:28', null, '云南省保山市施甸县', '施甸县', ',2580,2616,', '2616');
INSERT INTO `xx_area` VALUES ('2619', '2014-05-15 00:47:29', '2014-05-15 00:47:29', null, '云南省保山市腾冲县', '腾冲县', ',2580,2616,', '2616');
INSERT INTO `xx_area` VALUES ('2620', '2014-05-15 00:47:30', '2014-05-15 00:47:30', null, '云南省保山市龙陵县', '龙陵县', ',2580,2616,', '2616');
INSERT INTO `xx_area` VALUES ('2621', '2014-05-15 00:47:31', '2014-05-15 00:47:31', null, '云南省保山市昌宁县', '昌宁县', ',2580,2616,', '2616');
INSERT INTO `xx_area` VALUES ('2622', '2014-05-15 00:47:32', '2014-05-15 00:47:32', null, '云南省昭通市', '昭通市', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2623', '2014-05-15 00:47:33', '2014-05-15 00:47:33', null, '云南省昭通市昭阳区', '昭阳区', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2624', '2014-05-15 00:47:34', '2014-05-15 00:47:34', null, '云南省昭通市鲁甸县', '鲁甸县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2625', '2014-05-15 00:47:35', '2014-05-15 00:47:35', null, '云南省昭通市巧家县', '巧家县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2626', '2014-05-15 00:47:36', '2014-05-15 00:47:36', null, '云南省昭通市盐津县', '盐津县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2627', '2014-05-15 00:47:37', '2014-05-15 00:47:37', null, '云南省昭通市大关县', '大关县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2628', '2014-05-15 00:47:38', '2014-05-15 00:47:38', null, '云南省昭通市永善县', '永善县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2629', '2014-05-15 00:47:39', '2014-05-15 00:47:39', null, '云南省昭通市绥江县', '绥江县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2630', '2014-05-15 00:47:40', '2014-05-15 00:47:40', null, '云南省昭通市镇雄县', '镇雄县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2631', '2014-05-15 00:47:41', '2014-05-15 00:47:41', null, '云南省昭通市彝良县', '彝良县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2632', '2014-05-15 00:47:42', '2014-05-15 00:47:42', null, '云南省昭通市威信县', '威信县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2633', '2014-05-15 00:47:43', '2014-05-15 00:47:43', null, '云南省昭通市水富县', '水富县', ',2580,2622,', '2622');
INSERT INTO `xx_area` VALUES ('2634', '2014-05-15 00:47:44', '2014-05-15 00:47:44', null, '云南省丽江市', '丽江市', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2635', '2014-05-15 00:47:45', '2014-05-15 00:47:45', null, '云南省丽江市古城区', '古城区', ',2580,2634,', '2634');
INSERT INTO `xx_area` VALUES ('2636', '2014-05-15 00:47:46', '2014-05-15 00:47:46', null, '云南省丽江市玉龙纳西族自治县', '玉龙纳西族自治县', ',2580,2634,', '2634');
INSERT INTO `xx_area` VALUES ('2637', '2014-05-15 00:47:47', '2014-05-15 00:47:47', null, '云南省丽江市永胜县', '永胜县', ',2580,2634,', '2634');
INSERT INTO `xx_area` VALUES ('2638', '2014-05-15 00:47:48', '2014-05-15 00:47:48', null, '云南省丽江市华坪县', '华坪县', ',2580,2634,', '2634');
INSERT INTO `xx_area` VALUES ('2639', '2014-05-15 00:47:49', '2014-05-15 00:47:49', null, '云南省丽江市宁蒗彝族自治县', '宁蒗彝族自治县', ',2580,2634,', '2634');
INSERT INTO `xx_area` VALUES ('2640', '2014-05-15 00:47:50', '2014-05-15 00:47:50', null, '云南省普洱市', '普洱市', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2641', '2014-05-15 00:47:51', '2014-05-15 00:47:51', null, '云南省普洱市思茅区', '思茅区', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2642', '2014-05-15 00:47:52', '2014-05-15 00:47:52', null, '云南省普洱市宁洱哈尼族彝族自治县', '宁洱哈尼族彝族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2643', '2014-05-15 00:47:53', '2014-05-15 00:47:53', null, '云南省普洱市墨江哈尼族自治县', '墨江哈尼族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2644', '2014-05-15 00:47:54', '2014-05-15 00:47:54', null, '云南省普洱市景东彝族自治县', '景东彝族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2645', '2014-05-15 00:47:55', '2014-05-15 00:47:55', null, '云南省普洱市景谷傣族彝族自治县', '景谷傣族彝族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2646', '2014-05-15 00:47:56', '2014-05-15 00:47:56', null, '云南省普洱市镇沅彝族哈尼族拉祜族自治县', '镇沅彝族哈尼族拉祜族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2647', '2014-05-15 00:47:57', '2014-05-15 00:47:57', null, '云南省普洱市江城哈尼族彝族自治县', '江城哈尼族彝族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2648', '2014-05-15 00:47:58', '2014-05-15 00:47:58', null, '云南省普洱市孟连傣族拉祜族佤族自治县', '孟连傣族拉祜族佤族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2649', '2014-05-15 00:47:59', '2014-05-15 00:47:59', null, '云南省普洱市澜沧拉祜族自治县', '澜沧拉祜族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2650', '2014-05-15 00:48:00', '2014-05-15 00:48:00', null, '云南省普洱市西盟佤族自治县', '西盟佤族自治县', ',2580,2640,', '2640');
INSERT INTO `xx_area` VALUES ('2651', '2014-05-15 00:48:01', '2014-05-15 00:48:01', null, '云南省临沧市', '临沧市', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2652', '2014-05-15 00:48:02', '2014-05-15 00:48:02', null, '云南省临沧市临翔区', '临翔区', ',2580,2651,', '2651');
INSERT INTO `xx_area` VALUES ('2653', '2014-05-15 00:48:03', '2014-05-15 00:48:03', null, '云南省临沧市凤庆县', '凤庆县', ',2580,2651,', '2651');
INSERT INTO `xx_area` VALUES ('2654', '2014-05-15 00:48:04', '2014-05-15 00:48:04', null, '云南省临沧市云县', '云县', ',2580,2651,', '2651');
INSERT INTO `xx_area` VALUES ('2655', '2014-05-15 00:48:05', '2014-05-15 00:48:05', null, '云南省临沧市永德县', '永德县', ',2580,2651,', '2651');
INSERT INTO `xx_area` VALUES ('2656', '2014-05-15 00:48:06', '2014-05-15 00:48:06', null, '云南省临沧市镇康县', '镇康县', ',2580,2651,', '2651');
INSERT INTO `xx_area` VALUES ('2657', '2014-05-15 00:48:07', '2014-05-15 00:48:07', null, '云南省临沧市双江拉祜族佤族布朗族傣族自治县', '双江拉祜族佤族布朗族傣族自治县', ',2580,2651,', '2651');
INSERT INTO `xx_area` VALUES ('2658', '2014-05-15 00:48:08', '2014-05-15 00:48:08', null, '云南省临沧市耿马傣族佤族自治县', '耿马傣族佤族自治县', ',2580,2651,', '2651');
INSERT INTO `xx_area` VALUES ('2659', '2014-05-15 00:48:09', '2014-05-15 00:48:09', null, '云南省临沧市沧源佤族自治县', '沧源佤族自治县', ',2580,2651,', '2651');
INSERT INTO `xx_area` VALUES ('2660', '2014-05-15 00:48:10', '2014-05-15 00:48:10', null, '云南省楚雄彝族自治州', '楚雄彝族自治州', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2661', '2014-05-15 00:48:11', '2014-05-15 00:48:11', null, '云南省楚雄彝族自治州楚雄市', '楚雄市', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2662', '2014-05-15 00:48:12', '2014-05-15 00:48:12', null, '云南省楚雄彝族自治州双柏县', '双柏县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2663', '2014-05-15 00:48:13', '2014-05-15 00:48:13', null, '云南省楚雄彝族自治州牟定县', '牟定县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2664', '2014-05-15 00:48:14', '2014-05-15 00:48:14', null, '云南省楚雄彝族自治州南华县', '南华县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2665', '2014-05-15 00:48:15', '2014-05-15 00:48:15', null, '云南省楚雄彝族自治州姚安县', '姚安县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2666', '2014-05-15 00:48:16', '2014-05-15 00:48:16', null, '云南省楚雄彝族自治州大姚县', '大姚县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2667', '2014-05-15 00:48:17', '2014-05-15 00:48:17', null, '云南省楚雄彝族自治州永仁县', '永仁县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2668', '2014-05-15 00:48:18', '2014-05-15 00:48:18', null, '云南省楚雄彝族自治州元谋县', '元谋县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2669', '2014-05-15 00:48:19', '2014-05-15 00:48:19', null, '云南省楚雄彝族自治州武定县', '武定县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2670', '2014-05-15 00:48:20', '2014-05-15 00:48:20', null, '云南省楚雄彝族自治州禄丰县', '禄丰县', ',2580,2660,', '2660');
INSERT INTO `xx_area` VALUES ('2671', '2014-05-15 00:48:21', '2014-05-15 00:48:21', null, '云南省红河哈尼族彝族自治州', '红河哈尼族彝族自治州', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2672', '2014-05-15 00:48:22', '2014-05-15 00:48:22', null, '云南省红河哈尼族彝族自治州个旧市', '个旧市', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2673', '2014-05-15 00:48:23', '2014-05-15 00:48:23', null, '云南省红河哈尼族彝族自治州开远市', '开远市', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2674', '2014-05-15 00:48:24', '2014-05-15 00:48:24', null, '云南省红河哈尼族彝族自治州蒙自市', '蒙自市', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2675', '2014-05-15 00:48:25', '2014-05-15 00:48:25', null, '云南省红河哈尼族彝族自治州屏边苗族自治县', '屏边苗族自治县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2676', '2014-05-15 00:48:26', '2014-05-15 00:48:26', null, '云南省红河哈尼族彝族自治州建水县', '建水县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2677', '2014-05-15 00:48:27', '2014-05-15 00:48:27', null, '云南省红河哈尼族彝族自治州石屏县', '石屏县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2678', '2014-05-15 00:48:28', '2014-05-15 00:48:28', null, '云南省红河哈尼族彝族自治州弥勒县', '弥勒县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2679', '2014-05-15 00:48:29', '2014-05-15 00:48:29', null, '云南省红河哈尼族彝族自治州泸西县', '泸西县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2680', '2014-05-15 00:48:30', '2014-05-15 00:48:30', null, '云南省红河哈尼族彝族自治州元阳县', '元阳县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2681', '2014-05-15 00:48:31', '2014-05-15 00:48:31', null, '云南省红河哈尼族彝族自治州红河县', '红河县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2682', '2014-05-15 00:48:32', '2014-05-15 00:48:32', null, '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县', '金平苗族瑶族傣族自治县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2683', '2014-05-15 00:48:33', '2014-05-15 00:48:33', null, '云南省红河哈尼族彝族自治州绿春县', '绿春县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2684', '2014-05-15 00:48:34', '2014-05-15 00:48:34', null, '云南省红河哈尼族彝族自治州河口瑶族自治县', '河口瑶族自治县', ',2580,2671,', '2671');
INSERT INTO `xx_area` VALUES ('2685', '2014-05-15 00:48:35', '2014-05-15 00:48:35', null, '云南省文山壮族苗族自治州', '文山壮族苗族自治州', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2686', '2014-05-15 00:48:36', '2014-05-15 00:48:36', null, '云南省文山壮族苗族自治州文山市', '文山市', ',2580,2685,', '2685');
INSERT INTO `xx_area` VALUES ('2687', '2014-05-15 00:48:37', '2014-05-15 00:48:37', null, '云南省文山壮族苗族自治州砚山县', '砚山县', ',2580,2685,', '2685');
INSERT INTO `xx_area` VALUES ('2688', '2014-05-15 00:48:38', '2014-05-15 00:48:38', null, '云南省文山壮族苗族自治州西畴县', '西畴县', ',2580,2685,', '2685');
INSERT INTO `xx_area` VALUES ('2689', '2014-05-15 00:48:39', '2014-05-15 00:48:39', null, '云南省文山壮族苗族自治州麻栗坡县', '麻栗坡县', ',2580,2685,', '2685');
INSERT INTO `xx_area` VALUES ('2690', '2014-05-15 00:48:40', '2014-05-15 00:48:40', null, '云南省文山壮族苗族自治州马关县', '马关县', ',2580,2685,', '2685');
INSERT INTO `xx_area` VALUES ('2691', '2014-05-15 00:48:41', '2014-05-15 00:48:41', null, '云南省文山壮族苗族自治州丘北县', '丘北县', ',2580,2685,', '2685');
INSERT INTO `xx_area` VALUES ('2692', '2014-05-15 00:48:42', '2014-05-15 00:48:42', null, '云南省文山壮族苗族自治州广南县', '广南县', ',2580,2685,', '2685');
INSERT INTO `xx_area` VALUES ('2693', '2014-05-15 00:48:43', '2014-05-15 00:48:43', null, '云南省文山壮族苗族自治州富宁县', '富宁县', ',2580,2685,', '2685');
INSERT INTO `xx_area` VALUES ('2694', '2014-05-15 00:48:44', '2014-05-15 00:48:44', null, '云南省西双版纳傣族自治州', '西双版纳傣族自治州', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2695', '2014-05-15 00:48:45', '2014-05-15 00:48:45', null, '云南省西双版纳傣族自治州景洪市', '景洪市', ',2580,2694,', '2694');
INSERT INTO `xx_area` VALUES ('2696', '2014-05-15 00:48:46', '2014-05-15 00:48:46', null, '云南省西双版纳傣族自治州勐海县', '勐海县', ',2580,2694,', '2694');
INSERT INTO `xx_area` VALUES ('2697', '2014-05-15 00:48:47', '2014-05-15 00:48:47', null, '云南省西双版纳傣族自治州勐腊县', '勐腊县', ',2580,2694,', '2694');
INSERT INTO `xx_area` VALUES ('2698', '2014-05-15 00:48:48', '2014-05-15 00:48:48', null, '云南省大理白族自治州', '大理白族自治州', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2699', '2014-05-15 00:48:49', '2014-05-15 00:48:49', null, '云南省大理白族自治州大理市', '大理市', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2700', '2014-05-15 00:48:50', '2014-05-15 00:48:50', null, '云南省大理白族自治州漾濞彝族自治县', '漾濞彝族自治县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2701', '2014-05-15 00:48:51', '2014-05-15 00:48:51', null, '云南省大理白族自治州祥云县', '祥云县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2702', '2014-05-15 00:48:52', '2014-05-15 00:48:52', null, '云南省大理白族自治州宾川县', '宾川县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2703', '2014-05-15 00:48:53', '2014-05-15 00:48:53', null, '云南省大理白族自治州弥渡县', '弥渡县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2704', '2014-05-15 00:48:54', '2014-05-15 00:48:54', null, '云南省大理白族自治州南涧彝族自治县', '南涧彝族自治县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2705', '2014-05-15 00:48:55', '2014-05-15 00:48:55', null, '云南省大理白族自治州巍山彝族回族自治县', '巍山彝族回族自治县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2706', '2014-05-15 00:48:56', '2014-05-15 00:48:56', null, '云南省大理白族自治州永平县', '永平县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2707', '2014-05-15 00:48:57', '2014-05-15 00:48:57', null, '云南省大理白族自治州云龙县', '云龙县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2708', '2014-05-15 00:48:58', '2014-05-15 00:48:58', null, '云南省大理白族自治州洱源县', '洱源县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2709', '2014-05-15 00:48:59', '2014-05-15 00:48:59', null, '云南省大理白族自治州剑川县', '剑川县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2710', '2014-05-15 00:49:00', '2014-05-15 00:49:00', null, '云南省大理白族自治州鹤庆县', '鹤庆县', ',2580,2698,', '2698');
INSERT INTO `xx_area` VALUES ('2711', '2014-05-15 00:49:01', '2014-05-15 00:49:01', null, '云南省德宏傣族景颇族自治州', '德宏傣族景颇族自治州', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2712', '2014-05-15 00:49:02', '2014-05-15 00:49:02', null, '云南省德宏傣族景颇族自治州瑞丽市', '瑞丽市', ',2580,2711,', '2711');
INSERT INTO `xx_area` VALUES ('2713', '2014-05-15 00:49:03', '2014-05-15 00:49:03', null, '云南省德宏傣族景颇族自治州芒市', '芒市', ',2580,2711,', '2711');
INSERT INTO `xx_area` VALUES ('2714', '2014-05-15 00:49:04', '2014-05-15 00:49:04', null, '云南省德宏傣族景颇族自治州梁河县', '梁河县', ',2580,2711,', '2711');
INSERT INTO `xx_area` VALUES ('2715', '2014-05-15 00:49:05', '2014-05-15 00:49:05', null, '云南省德宏傣族景颇族自治州盈江县', '盈江县', ',2580,2711,', '2711');
INSERT INTO `xx_area` VALUES ('2716', '2014-05-15 00:49:06', '2014-05-15 00:49:06', null, '云南省德宏傣族景颇族自治州陇川县', '陇川县', ',2580,2711,', '2711');
INSERT INTO `xx_area` VALUES ('2717', '2014-05-15 00:49:07', '2014-05-15 00:49:07', null, '云南省怒江傈僳族自治州', '怒江傈僳族自治州', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2718', '2014-05-15 00:49:08', '2014-05-15 00:49:08', null, '云南省怒江傈僳族自治州泸水县', '泸水县', ',2580,2717,', '2717');
INSERT INTO `xx_area` VALUES ('2719', '2014-05-15 00:49:09', '2014-05-15 00:49:09', null, '云南省怒江傈僳族自治州福贡县', '福贡县', ',2580,2717,', '2717');
INSERT INTO `xx_area` VALUES ('2720', '2014-05-15 00:49:10', '2014-05-15 00:49:10', null, '云南省怒江傈僳族自治州贡山独龙族怒族自治县', '贡山独龙族怒族自治县', ',2580,2717,', '2717');
INSERT INTO `xx_area` VALUES ('2721', '2014-05-15 00:49:11', '2014-05-15 00:49:11', null, '云南省怒江傈僳族自治州兰坪白族普米族自治县', '兰坪白族普米族自治县', ',2580,2717,', '2717');
INSERT INTO `xx_area` VALUES ('2722', '2014-05-15 00:49:12', '2014-05-15 00:49:12', null, '云南省迪庆藏族自治州', '迪庆藏族自治州', ',2580,', '2580');
INSERT INTO `xx_area` VALUES ('2723', '2014-05-15 00:49:13', '2014-05-15 00:49:13', null, '云南省迪庆藏族自治州香格里拉县', '香格里拉县', ',2580,2722,', '2722');
INSERT INTO `xx_area` VALUES ('2724', '2014-05-15 00:49:14', '2014-05-15 00:49:14', null, '云南省迪庆藏族自治州德钦县', '德钦县', ',2580,2722,', '2722');
INSERT INTO `xx_area` VALUES ('2725', '2014-05-15 00:49:15', '2014-05-15 00:49:15', null, '云南省迪庆藏族自治州维西傈僳族自治县', '维西傈僳族自治县', ',2580,2722,', '2722');
INSERT INTO `xx_area` VALUES ('2726', '2014-05-15 00:49:16', '2014-05-15 00:49:16', null, '西藏自治区', '西藏自治区', ',', null);
INSERT INTO `xx_area` VALUES ('2727', '2014-05-15 00:49:17', '2014-05-15 00:49:17', null, '西藏自治区拉萨市', '拉萨市', ',2726,', '2726');
INSERT INTO `xx_area` VALUES ('2728', '2014-05-15 00:49:18', '2014-05-15 00:49:18', null, '西藏自治区拉萨市城关区', '城关区', ',2726,2727,', '2727');
INSERT INTO `xx_area` VALUES ('2729', '2014-05-15 00:49:19', '2014-05-15 00:49:19', null, '西藏自治区拉萨市林周县', '林周县', ',2726,2727,', '2727');
INSERT INTO `xx_area` VALUES ('2730', '2014-05-15 00:49:20', '2014-05-15 00:49:20', null, '西藏自治区拉萨市当雄县', '当雄县', ',2726,2727,', '2727');
INSERT INTO `xx_area` VALUES ('2731', '2014-05-15 00:49:21', '2014-05-15 00:49:21', null, '西藏自治区拉萨市尼木县', '尼木县', ',2726,2727,', '2727');
INSERT INTO `xx_area` VALUES ('2732', '2014-05-15 00:49:22', '2014-05-15 00:49:22', null, '西藏自治区拉萨市曲水县', '曲水县', ',2726,2727,', '2727');
INSERT INTO `xx_area` VALUES ('2733', '2014-05-15 00:49:23', '2014-05-15 00:49:23', null, '西藏自治区拉萨市堆龙德庆县', '堆龙德庆县', ',2726,2727,', '2727');
INSERT INTO `xx_area` VALUES ('2734', '2014-05-15 00:49:24', '2014-05-15 00:49:24', null, '西藏自治区拉萨市达孜县', '达孜县', ',2726,2727,', '2727');
INSERT INTO `xx_area` VALUES ('2735', '2014-05-15 00:49:25', '2014-05-15 00:49:25', null, '西藏自治区拉萨市墨竹工卡县', '墨竹工卡县', ',2726,2727,', '2727');
INSERT INTO `xx_area` VALUES ('2736', '2014-05-15 00:49:26', '2014-05-15 00:49:26', null, '西藏自治区昌都地区', '昌都地区', ',2726,', '2726');
INSERT INTO `xx_area` VALUES ('2737', '2014-05-15 00:49:27', '2014-05-15 00:49:27', null, '西藏自治区昌都地区昌都县', '昌都县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2738', '2014-05-15 00:49:28', '2014-05-15 00:49:28', null, '西藏自治区昌都地区江达县', '江达县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2739', '2014-05-15 00:49:29', '2014-05-15 00:49:29', null, '西藏自治区昌都地区贡觉县', '贡觉县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2740', '2014-05-15 00:49:30', '2014-05-15 00:49:30', null, '西藏自治区昌都地区类乌齐县', '类乌齐县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2741', '2014-05-15 00:49:31', '2014-05-15 00:49:31', null, '西藏自治区昌都地区丁青县', '丁青县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2742', '2014-05-15 00:49:32', '2014-05-15 00:49:32', null, '西藏自治区昌都地区察雅县', '察雅县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2743', '2014-05-15 00:49:33', '2014-05-15 00:49:33', null, '西藏自治区昌都地区八宿县', '八宿县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2744', '2014-05-15 00:49:34', '2014-05-15 00:49:34', null, '西藏自治区昌都地区左贡县', '左贡县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2745', '2014-05-15 00:49:35', '2014-05-15 00:49:35', null, '西藏自治区昌都地区芒康县', '芒康县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2746', '2014-05-15 00:49:36', '2014-05-15 00:49:36', null, '西藏自治区昌都地区洛隆县', '洛隆县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2747', '2014-05-15 00:49:37', '2014-05-15 00:49:37', null, '西藏自治区昌都地区边坝县', '边坝县', ',2726,2736,', '2736');
INSERT INTO `xx_area` VALUES ('2748', '2014-05-15 00:49:38', '2014-05-15 00:49:38', null, '西藏自治区山南地区', '山南地区', ',2726,', '2726');
INSERT INTO `xx_area` VALUES ('2749', '2014-05-15 00:49:39', '2014-05-15 00:49:39', null, '西藏自治区山南地区乃东县', '乃东县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2750', '2014-05-15 00:49:40', '2014-05-15 00:49:40', null, '西藏自治区山南地区扎囊县', '扎囊县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2751', '2014-05-15 00:49:41', '2014-05-15 00:49:41', null, '西藏自治区山南地区贡嘎县', '贡嘎县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2752', '2014-05-15 00:49:42', '2014-05-15 00:49:42', null, '西藏自治区山南地区桑日县', '桑日县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2753', '2014-05-15 00:49:43', '2014-05-15 00:49:43', null, '西藏自治区山南地区琼结县', '琼结县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2754', '2014-05-15 00:49:44', '2014-05-15 00:49:44', null, '西藏自治区山南地区曲松县', '曲松县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2755', '2014-05-15 00:49:45', '2014-05-15 00:49:45', null, '西藏自治区山南地区措美县', '措美县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2756', '2014-05-15 00:49:46', '2014-05-15 00:49:46', null, '西藏自治区山南地区洛扎县', '洛扎县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2757', '2014-05-15 00:49:47', '2014-05-15 00:49:47', null, '西藏自治区山南地区加查县', '加查县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2758', '2014-05-15 00:49:48', '2014-05-15 00:49:48', null, '西藏自治区山南地区隆子县', '隆子县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2759', '2014-05-15 00:49:49', '2014-05-15 00:49:49', null, '西藏自治区山南地区错那县', '错那县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2760', '2014-05-15 00:49:50', '2014-05-15 00:49:50', null, '西藏自治区山南地区浪卡子县', '浪卡子县', ',2726,2748,', '2748');
INSERT INTO `xx_area` VALUES ('2761', '2014-05-15 00:49:51', '2014-05-15 00:49:51', null, '西藏自治区日喀则地区', '日喀则地区', ',2726,', '2726');
INSERT INTO `xx_area` VALUES ('2762', '2014-05-15 00:49:52', '2014-05-15 00:49:52', null, '西藏自治区日喀则地区日喀则市', '日喀则市', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2763', '2014-05-15 00:49:53', '2014-05-15 00:49:53', null, '西藏自治区日喀则地区南木林县', '南木林县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2764', '2014-05-15 00:49:54', '2014-05-15 00:49:54', null, '西藏自治区日喀则地区江孜县', '江孜县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2765', '2014-05-15 00:49:55', '2014-05-15 00:49:55', null, '西藏自治区日喀则地区定日县', '定日县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2766', '2014-05-15 00:49:56', '2014-05-15 00:49:56', null, '西藏自治区日喀则地区萨迦县', '萨迦县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2767', '2014-05-15 00:49:57', '2014-05-15 00:49:57', null, '西藏自治区日喀则地区拉孜县', '拉孜县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2768', '2014-05-15 00:49:58', '2014-05-15 00:49:58', null, '西藏自治区日喀则地区昂仁县', '昂仁县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2769', '2014-05-15 00:49:59', '2014-05-15 00:49:59', null, '西藏自治区日喀则地区谢通门县', '谢通门县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2770', '2014-05-15 00:50:00', '2014-05-15 00:50:00', null, '西藏自治区日喀则地区白朗县', '白朗县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2771', '2014-05-15 00:50:01', '2014-05-15 00:50:01', null, '西藏自治区日喀则地区仁布县', '仁布县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2772', '2014-05-15 00:50:02', '2014-05-15 00:50:02', null, '西藏自治区日喀则地区康马县', '康马县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2773', '2014-05-15 00:50:03', '2014-05-15 00:50:03', null, '西藏自治区日喀则地区定结县', '定结县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2774', '2014-05-15 00:50:04', '2014-05-15 00:50:04', null, '西藏自治区日喀则地区仲巴县', '仲巴县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2775', '2014-05-15 00:50:05', '2014-05-15 00:50:05', null, '西藏自治区日喀则地区亚东县', '亚东县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2776', '2014-05-15 00:50:06', '2014-05-15 00:50:06', null, '西藏自治区日喀则地区吉隆县', '吉隆县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2777', '2014-05-15 00:50:07', '2014-05-15 00:50:07', null, '西藏自治区日喀则地区聂拉木县', '聂拉木县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2778', '2014-05-15 00:50:08', '2014-05-15 00:50:08', null, '西藏自治区日喀则地区萨嘎县', '萨嘎县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2779', '2014-05-15 00:50:09', '2014-05-15 00:50:09', null, '西藏自治区日喀则地区岗巴县', '岗巴县', ',2726,2761,', '2761');
INSERT INTO `xx_area` VALUES ('2780', '2014-05-15 00:50:10', '2014-05-15 00:50:10', null, '西藏自治区那曲地区', '那曲地区', ',2726,', '2726');
INSERT INTO `xx_area` VALUES ('2781', '2014-05-15 00:50:11', '2014-05-15 00:50:11', null, '西藏自治区那曲地区那曲县', '那曲县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2782', '2014-05-15 00:50:12', '2014-05-15 00:50:12', null, '西藏自治区那曲地区嘉黎县', '嘉黎县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2783', '2014-05-15 00:50:13', '2014-05-15 00:50:13', null, '西藏自治区那曲地区比如县', '比如县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2784', '2014-05-15 00:50:14', '2014-05-15 00:50:14', null, '西藏自治区那曲地区聂荣县', '聂荣县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2785', '2014-05-15 00:50:15', '2014-05-15 00:50:15', null, '西藏自治区那曲地区安多县', '安多县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2786', '2014-05-15 00:50:16', '2014-05-15 00:50:16', null, '西藏自治区那曲地区申扎县', '申扎县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2787', '2014-05-15 00:50:17', '2014-05-15 00:50:17', null, '西藏自治区那曲地区索县', '索县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2788', '2014-05-15 00:50:18', '2014-05-15 00:50:18', null, '西藏自治区那曲地区班戈县', '班戈县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2789', '2014-05-15 00:50:19', '2014-05-15 00:50:19', null, '西藏自治区那曲地区巴青县', '巴青县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2790', '2014-05-15 00:50:20', '2014-05-15 00:50:20', null, '西藏自治区那曲地区尼玛县', '尼玛县', ',2726,2780,', '2780');
INSERT INTO `xx_area` VALUES ('2791', '2014-05-15 00:50:21', '2014-05-15 00:50:21', null, '西藏自治区阿里地区', '阿里地区', ',2726,', '2726');
INSERT INTO `xx_area` VALUES ('2792', '2014-05-15 00:50:22', '2014-05-15 00:50:22', null, '西藏自治区阿里地区普兰县', '普兰县', ',2726,2791,', '2791');
INSERT INTO `xx_area` VALUES ('2793', '2014-05-15 00:50:23', '2014-05-15 00:50:23', null, '西藏自治区阿里地区札达县', '札达县', ',2726,2791,', '2791');
INSERT INTO `xx_area` VALUES ('2794', '2014-05-15 00:50:24', '2014-05-15 00:50:24', null, '西藏自治区阿里地区噶尔县', '噶尔县', ',2726,2791,', '2791');
INSERT INTO `xx_area` VALUES ('2795', '2014-05-15 00:50:25', '2014-05-15 00:50:25', null, '西藏自治区阿里地区日土县', '日土县', ',2726,2791,', '2791');
INSERT INTO `xx_area` VALUES ('2796', '2014-05-15 00:50:26', '2014-05-15 00:50:26', null, '西藏自治区阿里地区革吉县', '革吉县', ',2726,2791,', '2791');
INSERT INTO `xx_area` VALUES ('2797', '2014-05-15 00:50:27', '2014-05-15 00:50:27', null, '西藏自治区阿里地区改则县', '改则县', ',2726,2791,', '2791');
INSERT INTO `xx_area` VALUES ('2798', '2014-05-15 00:50:28', '2014-05-15 00:50:28', null, '西藏自治区阿里地区措勤县', '措勤县', ',2726,2791,', '2791');
INSERT INTO `xx_area` VALUES ('2799', '2014-05-15 00:50:29', '2014-05-15 00:50:29', null, '西藏自治区林芝地区', '林芝地区', ',2726,', '2726');
INSERT INTO `xx_area` VALUES ('2800', '2014-05-15 00:50:30', '2014-05-15 00:50:30', null, '西藏自治区林芝地区林芝县', '林芝县', ',2726,2799,', '2799');
INSERT INTO `xx_area` VALUES ('2801', '2014-05-15 00:50:31', '2014-05-15 00:50:31', null, '西藏自治区林芝地区工布江达县', '工布江达县', ',2726,2799,', '2799');
INSERT INTO `xx_area` VALUES ('2802', '2014-05-15 00:50:32', '2014-05-15 00:50:32', null, '西藏自治区林芝地区米林县', '米林县', ',2726,2799,', '2799');
INSERT INTO `xx_area` VALUES ('2803', '2014-05-15 00:50:33', '2014-05-15 00:50:33', null, '西藏自治区林芝地区墨脱县', '墨脱县', ',2726,2799,', '2799');
INSERT INTO `xx_area` VALUES ('2804', '2014-05-15 00:50:34', '2014-05-15 00:50:34', null, '西藏自治区林芝地区波密县', '波密县', ',2726,2799,', '2799');
INSERT INTO `xx_area` VALUES ('2805', '2014-05-15 00:50:35', '2014-05-15 00:50:35', null, '西藏自治区林芝地区察隅县', '察隅县', ',2726,2799,', '2799');
INSERT INTO `xx_area` VALUES ('2806', '2014-05-15 00:50:36', '2014-05-15 00:50:36', null, '西藏自治区林芝地区朗县', '朗县', ',2726,2799,', '2799');
INSERT INTO `xx_area` VALUES ('2807', '2014-05-15 00:50:37', '2014-05-15 00:50:37', null, '陕西省', '陕西省', ',', null);
INSERT INTO `xx_area` VALUES ('2808', '2014-05-15 00:50:38', '2014-05-15 00:50:38', null, '陕西省西安市', '西安市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2809', '2014-05-15 00:50:39', '2014-05-15 00:50:39', null, '陕西省西安市新城区', '新城区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2810', '2014-05-15 00:50:40', '2014-05-15 00:50:40', null, '陕西省西安市碑林区', '碑林区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2811', '2014-05-15 00:50:41', '2014-05-15 00:50:41', null, '陕西省西安市莲湖区', '莲湖区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2812', '2014-05-15 00:50:42', '2014-05-15 00:50:42', null, '陕西省西安市灞桥区', '灞桥区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2813', '2014-05-15 00:50:43', '2014-05-15 00:50:43', null, '陕西省西安市未央区', '未央区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2814', '2014-05-15 00:50:44', '2014-05-15 00:50:44', null, '陕西省西安市雁塔区', '雁塔区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2815', '2014-05-15 00:50:45', '2014-05-15 00:50:45', null, '陕西省西安市阎良区', '阎良区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2816', '2014-05-15 00:50:46', '2014-05-15 00:50:46', null, '陕西省西安市临潼区', '临潼区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2817', '2014-05-15 00:50:47', '2014-05-15 00:50:47', null, '陕西省西安市长安区', '长安区', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2818', '2014-05-15 00:50:48', '2014-05-15 00:50:48', null, '陕西省西安市蓝田县', '蓝田县', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2819', '2014-05-15 00:50:49', '2014-05-15 00:50:49', null, '陕西省西安市周至县', '周至县', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2820', '2014-05-15 00:50:50', '2014-05-15 00:50:50', null, '陕西省西安市户县', '户县', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2821', '2014-05-15 00:50:51', '2014-05-15 00:50:51', null, '陕西省西安市高陵县', '高陵县', ',2807,2808,', '2808');
INSERT INTO `xx_area` VALUES ('2822', '2014-05-15 00:50:52', '2014-05-15 00:50:52', null, '陕西省铜川市', '铜川市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2823', '2014-05-15 00:50:53', '2014-05-15 00:50:53', null, '陕西省铜川市王益区', '王益区', ',2807,2822,', '2822');
INSERT INTO `xx_area` VALUES ('2824', '2014-05-15 00:50:54', '2014-05-15 00:50:54', null, '陕西省铜川市印台区', '印台区', ',2807,2822,', '2822');
INSERT INTO `xx_area` VALUES ('2825', '2014-05-15 00:50:55', '2014-05-15 00:50:55', null, '陕西省铜川市耀州区', '耀州区', ',2807,2822,', '2822');
INSERT INTO `xx_area` VALUES ('2826', '2014-05-15 00:50:56', '2014-05-15 00:50:56', null, '陕西省铜川市宜君县', '宜君县', ',2807,2822,', '2822');
INSERT INTO `xx_area` VALUES ('2827', '2014-05-15 00:50:57', '2014-05-15 00:50:57', null, '陕西省宝鸡市', '宝鸡市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2828', '2014-05-15 00:50:58', '2014-05-15 00:50:58', null, '陕西省宝鸡市渭滨区', '渭滨区', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2829', '2014-05-15 00:50:59', '2014-05-15 00:50:59', null, '陕西省宝鸡市金台区', '金台区', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2830', '2014-05-15 00:51:00', '2014-05-15 00:51:00', null, '陕西省宝鸡市陈仓区', '陈仓区', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2831', '2014-05-15 00:51:01', '2014-05-15 00:51:01', null, '陕西省宝鸡市凤翔县', '凤翔县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2832', '2014-05-15 00:51:02', '2014-05-15 00:51:02', null, '陕西省宝鸡市岐山县', '岐山县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2833', '2014-05-15 00:51:03', '2014-05-15 00:51:03', null, '陕西省宝鸡市扶风县', '扶风县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2834', '2014-05-15 00:51:04', '2014-05-15 00:51:04', null, '陕西省宝鸡市眉县', '眉县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2835', '2014-05-15 00:51:05', '2014-05-15 00:51:05', null, '陕西省宝鸡市陇县', '陇县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2836', '2014-05-15 00:51:06', '2014-05-15 00:51:06', null, '陕西省宝鸡市千阳县', '千阳县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2837', '2014-05-15 00:51:07', '2014-05-15 00:51:07', null, '陕西省宝鸡市麟游县', '麟游县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2838', '2014-05-15 00:51:08', '2014-05-15 00:51:08', null, '陕西省宝鸡市凤县', '凤县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2839', '2014-05-15 00:51:09', '2014-05-15 00:51:09', null, '陕西省宝鸡市太白县', '太白县', ',2807,2827,', '2827');
INSERT INTO `xx_area` VALUES ('2840', '2014-05-15 00:51:10', '2014-05-15 00:51:10', null, '陕西省咸阳市', '咸阳市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2841', '2014-05-15 00:51:11', '2014-05-15 00:51:11', null, '陕西省咸阳市秦都区', '秦都区', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2842', '2014-05-15 00:51:12', '2014-05-15 00:51:12', null, '陕西省咸阳市杨陵区', '杨陵区', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2843', '2014-05-15 00:51:13', '2014-05-15 00:51:13', null, '陕西省咸阳市渭城区', '渭城区', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2844', '2014-05-15 00:51:14', '2014-05-15 00:51:14', null, '陕西省咸阳市三原县', '三原县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2845', '2014-05-15 00:51:15', '2014-05-15 00:51:15', null, '陕西省咸阳市泾阳县', '泾阳县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2846', '2014-05-15 00:51:16', '2014-05-15 00:51:16', null, '陕西省咸阳市乾县', '乾县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2847', '2014-05-15 00:51:17', '2014-05-15 00:51:17', null, '陕西省咸阳市礼泉县', '礼泉县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2848', '2014-05-15 00:51:18', '2014-05-15 00:51:18', null, '陕西省咸阳市永寿县', '永寿县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2849', '2014-05-15 00:51:19', '2014-05-15 00:51:19', null, '陕西省咸阳市彬县', '彬县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2850', '2014-05-15 00:51:20', '2014-05-15 00:51:20', null, '陕西省咸阳市长武县', '长武县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2851', '2014-05-15 00:51:21', '2014-05-15 00:51:21', null, '陕西省咸阳市旬邑县', '旬邑县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2852', '2014-05-15 00:51:22', '2014-05-15 00:51:22', null, '陕西省咸阳市淳化县', '淳化县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2853', '2014-05-15 00:51:23', '2014-05-15 00:51:23', null, '陕西省咸阳市武功县', '武功县', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2854', '2014-05-15 00:51:24', '2014-05-15 00:51:24', null, '陕西省咸阳市兴平市', '兴平市', ',2807,2840,', '2840');
INSERT INTO `xx_area` VALUES ('2855', '2014-05-15 00:51:25', '2014-05-15 00:51:25', null, '陕西省渭南市', '渭南市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2856', '2014-05-15 00:51:26', '2014-05-15 00:51:26', null, '陕西省渭南市临渭区', '临渭区', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2857', '2014-05-15 00:51:27', '2014-05-15 00:51:27', null, '陕西省渭南市华县', '华县', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2858', '2014-05-15 00:51:28', '2014-05-15 00:51:28', null, '陕西省渭南市潼关县', '潼关县', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2859', '2014-05-15 00:51:29', '2014-05-15 00:51:29', null, '陕西省渭南市大荔县', '大荔县', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2860', '2014-05-15 00:51:30', '2014-05-15 00:51:30', null, '陕西省渭南市合阳县', '合阳县', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2861', '2014-05-15 00:51:31', '2014-05-15 00:51:31', null, '陕西省渭南市澄城县', '澄城县', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2862', '2014-05-15 00:51:32', '2014-05-15 00:51:32', null, '陕西省渭南市蒲城县', '蒲城县', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2863', '2014-05-15 00:51:33', '2014-05-15 00:51:33', null, '陕西省渭南市白水县', '白水县', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2864', '2014-05-15 00:51:34', '2014-05-15 00:51:34', null, '陕西省渭南市富平县', '富平县', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2865', '2014-05-15 00:51:35', '2014-05-15 00:51:35', null, '陕西省渭南市韩城市', '韩城市', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2866', '2014-05-15 00:51:36', '2014-05-15 00:51:36', null, '陕西省渭南市华阴市', '华阴市', ',2807,2855,', '2855');
INSERT INTO `xx_area` VALUES ('2867', '2014-05-15 00:51:37', '2014-05-15 00:51:37', null, '陕西省延安市', '延安市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2868', '2014-05-15 00:51:38', '2014-05-15 00:51:38', null, '陕西省延安市宝塔区', '宝塔区', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2869', '2014-05-15 00:51:39', '2014-05-15 00:51:39', null, '陕西省延安市延长县', '延长县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2870', '2014-05-15 00:51:40', '2014-05-15 00:51:40', null, '陕西省延安市延川县', '延川县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2871', '2014-05-15 00:51:41', '2014-05-15 00:51:41', null, '陕西省延安市子长县', '子长县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2872', '2014-05-15 00:51:42', '2014-05-15 00:51:42', null, '陕西省延安市安塞县', '安塞县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2873', '2014-05-15 00:51:43', '2014-05-15 00:51:43', null, '陕西省延安市志丹县', '志丹县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2874', '2014-05-15 00:51:44', '2014-05-15 00:51:44', null, '陕西省延安市吴起县', '吴起县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2875', '2014-05-15 00:51:45', '2014-05-15 00:51:45', null, '陕西省延安市甘泉县', '甘泉县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2876', '2014-05-15 00:51:46', '2014-05-15 00:51:46', null, '陕西省延安市富县', '富县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2877', '2014-05-15 00:51:47', '2014-05-15 00:51:47', null, '陕西省延安市洛川县', '洛川县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2878', '2014-05-15 00:51:48', '2014-05-15 00:51:48', null, '陕西省延安市宜川县', '宜川县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2879', '2014-05-15 00:51:49', '2014-05-15 00:51:49', null, '陕西省延安市黄龙县', '黄龙县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2880', '2014-05-15 00:51:50', '2014-05-15 00:51:50', null, '陕西省延安市黄陵县', '黄陵县', ',2807,2867,', '2867');
INSERT INTO `xx_area` VALUES ('2881', '2014-05-15 00:51:51', '2014-05-15 00:51:51', null, '陕西省汉中市', '汉中市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2882', '2014-05-15 00:51:52', '2014-05-15 00:51:52', null, '陕西省汉中市汉台区', '汉台区', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2883', '2014-05-15 00:51:53', '2014-05-15 00:51:53', null, '陕西省汉中市南郑县', '南郑县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2884', '2014-05-15 00:51:54', '2014-05-15 00:51:54', null, '陕西省汉中市城固县', '城固县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2885', '2014-05-15 00:51:55', '2014-05-15 00:51:55', null, '陕西省汉中市洋县', '洋县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2886', '2014-05-15 00:51:56', '2014-05-15 00:51:56', null, '陕西省汉中市西乡县', '西乡县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2887', '2014-05-15 00:51:57', '2014-05-15 00:51:57', null, '陕西省汉中市勉县', '勉县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2888', '2014-05-15 00:51:58', '2014-05-15 00:51:58', null, '陕西省汉中市宁强县', '宁强县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2889', '2014-05-15 00:51:59', '2014-05-15 00:51:59', null, '陕西省汉中市略阳县', '略阳县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2890', '2014-05-15 00:52:00', '2014-05-15 00:52:00', null, '陕西省汉中市镇巴县', '镇巴县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2891', '2014-05-15 00:52:01', '2014-05-15 00:52:01', null, '陕西省汉中市留坝县', '留坝县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2892', '2014-05-15 00:52:02', '2014-05-15 00:52:02', null, '陕西省汉中市佛坪县', '佛坪县', ',2807,2881,', '2881');
INSERT INTO `xx_area` VALUES ('2893', '2014-05-15 00:52:03', '2014-05-15 00:52:03', null, '陕西省榆林市', '榆林市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2894', '2014-05-15 00:52:04', '2014-05-15 00:52:04', null, '陕西省榆林市榆阳区', '榆阳区', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2895', '2014-05-15 00:52:05', '2014-05-15 00:52:05', null, '陕西省榆林市神木县', '神木县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2896', '2014-05-15 00:52:06', '2014-05-15 00:52:06', null, '陕西省榆林市府谷县', '府谷县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2897', '2014-05-15 00:52:07', '2014-05-15 00:52:07', null, '陕西省榆林市横山县', '横山县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2898', '2014-05-15 00:52:08', '2014-05-15 00:52:08', null, '陕西省榆林市靖边县', '靖边县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2899', '2014-05-15 00:52:09', '2014-05-15 00:52:09', null, '陕西省榆林市定边县', '定边县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2900', '2014-05-15 00:52:10', '2014-05-15 00:52:10', null, '陕西省榆林市绥德县', '绥德县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2901', '2014-05-15 00:52:11', '2014-05-15 00:52:11', null, '陕西省榆林市米脂县', '米脂县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2902', '2014-05-15 00:52:12', '2014-05-15 00:52:12', null, '陕西省榆林市佳县', '佳县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2903', '2014-05-15 00:52:13', '2014-05-15 00:52:13', null, '陕西省榆林市吴堡县', '吴堡县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2904', '2014-05-15 00:52:14', '2014-05-15 00:52:14', null, '陕西省榆林市清涧县', '清涧县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2905', '2014-05-15 00:52:15', '2014-05-15 00:52:15', null, '陕西省榆林市子洲县', '子洲县', ',2807,2893,', '2893');
INSERT INTO `xx_area` VALUES ('2906', '2014-05-15 00:52:16', '2014-05-15 00:52:16', null, '陕西省安康市', '安康市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2907', '2014-05-15 00:52:17', '2014-05-15 00:52:17', null, '陕西省安康市汉滨区', '汉滨区', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2908', '2014-05-15 00:52:18', '2014-05-15 00:52:18', null, '陕西省安康市汉阴县', '汉阴县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2909', '2014-05-15 00:52:19', '2014-05-15 00:52:19', null, '陕西省安康市石泉县', '石泉县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2910', '2014-05-15 00:52:20', '2014-05-15 00:52:20', null, '陕西省安康市宁陕县', '宁陕县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2911', '2014-05-15 00:52:21', '2014-05-15 00:52:21', null, '陕西省安康市紫阳县', '紫阳县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2912', '2014-05-15 00:52:22', '2014-05-15 00:52:22', null, '陕西省安康市岚皋县', '岚皋县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2913', '2014-05-15 00:52:23', '2014-05-15 00:52:23', null, '陕西省安康市平利县', '平利县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2914', '2014-05-15 00:52:24', '2014-05-15 00:52:24', null, '陕西省安康市镇坪县', '镇坪县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2915', '2014-05-15 00:52:25', '2014-05-15 00:52:25', null, '陕西省安康市旬阳县', '旬阳县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2916', '2014-05-15 00:52:26', '2014-05-15 00:52:26', null, '陕西省安康市白河县', '白河县', ',2807,2906,', '2906');
INSERT INTO `xx_area` VALUES ('2917', '2014-05-15 00:52:27', '2014-05-15 00:52:27', null, '陕西省商洛市', '商洛市', ',2807,', '2807');
INSERT INTO `xx_area` VALUES ('2918', '2014-05-15 00:52:28', '2014-05-15 00:52:28', null, '陕西省商洛市商州区', '商州区', ',2807,2917,', '2917');
INSERT INTO `xx_area` VALUES ('2919', '2014-05-15 00:52:29', '2014-05-15 00:52:29', null, '陕西省商洛市洛南县', '洛南县', ',2807,2917,', '2917');
INSERT INTO `xx_area` VALUES ('2920', '2014-05-15 00:52:30', '2014-05-15 00:52:30', null, '陕西省商洛市丹凤县', '丹凤县', ',2807,2917,', '2917');
INSERT INTO `xx_area` VALUES ('2921', '2014-05-15 00:52:31', '2014-05-15 00:52:31', null, '陕西省商洛市商南县', '商南县', ',2807,2917,', '2917');
INSERT INTO `xx_area` VALUES ('2922', '2014-05-15 00:52:32', '2014-05-15 00:52:32', null, '陕西省商洛市山阳县', '山阳县', ',2807,2917,', '2917');
INSERT INTO `xx_area` VALUES ('2923', '2014-05-15 00:52:33', '2014-05-15 00:52:33', null, '陕西省商洛市镇安县', '镇安县', ',2807,2917,', '2917');
INSERT INTO `xx_area` VALUES ('2924', '2014-05-15 00:52:34', '2014-05-15 00:52:34', null, '陕西省商洛市柞水县', '柞水县', ',2807,2917,', '2917');
INSERT INTO `xx_area` VALUES ('2925', '2014-05-15 00:52:35', '2014-05-15 00:52:35', null, '甘肃省', '甘肃省', ',', null);
INSERT INTO `xx_area` VALUES ('2926', '2014-05-15 00:52:36', '2014-05-15 00:52:36', null, '甘肃省兰州市', '兰州市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2927', '2014-05-15 00:52:37', '2014-05-15 00:52:37', null, '甘肃省兰州市城关区', '城关区', ',2925,2926,', '2926');
INSERT INTO `xx_area` VALUES ('2928', '2014-05-15 00:52:38', '2014-05-15 00:52:38', null, '甘肃省兰州市七里河区', '七里河区', ',2925,2926,', '2926');
INSERT INTO `xx_area` VALUES ('2929', '2014-05-15 00:52:39', '2014-05-15 00:52:39', null, '甘肃省兰州市西固区', '西固区', ',2925,2926,', '2926');
INSERT INTO `xx_area` VALUES ('2930', '2014-05-15 00:52:40', '2014-05-15 00:52:40', null, '甘肃省兰州市安宁区', '安宁区', ',2925,2926,', '2926');
INSERT INTO `xx_area` VALUES ('2931', '2014-05-15 00:52:41', '2014-05-15 00:52:41', null, '甘肃省兰州市红古区', '红古区', ',2925,2926,', '2926');
INSERT INTO `xx_area` VALUES ('2932', '2014-05-15 00:52:42', '2014-05-15 00:52:42', null, '甘肃省兰州市永登县', '永登县', ',2925,2926,', '2926');
INSERT INTO `xx_area` VALUES ('2933', '2014-05-15 00:52:43', '2014-05-15 00:52:43', null, '甘肃省兰州市皋兰县', '皋兰县', ',2925,2926,', '2926');
INSERT INTO `xx_area` VALUES ('2934', '2014-05-15 00:52:44', '2014-05-15 00:52:44', null, '甘肃省兰州市榆中县', '榆中县', ',2925,2926,', '2926');
INSERT INTO `xx_area` VALUES ('2935', '2014-05-15 00:52:45', '2014-05-15 00:52:45', null, '甘肃省嘉峪关市', '嘉峪关市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2936', '2014-05-15 00:52:46', '2014-05-15 00:52:46', null, '甘肃省金昌市', '金昌市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2937', '2014-05-15 00:52:47', '2014-05-15 00:52:47', null, '甘肃省金昌市金川区', '金川区', ',2925,2936,', '2936');
INSERT INTO `xx_area` VALUES ('2938', '2014-05-15 00:52:48', '2014-05-15 00:52:48', null, '甘肃省金昌市永昌县', '永昌县', ',2925,2936,', '2936');
INSERT INTO `xx_area` VALUES ('2939', '2014-05-15 00:52:49', '2014-05-15 00:52:49', null, '甘肃省白银市', '白银市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2940', '2014-05-15 00:52:50', '2014-05-15 00:52:50', null, '甘肃省白银市白银区', '白银区', ',2925,2939,', '2939');
INSERT INTO `xx_area` VALUES ('2941', '2014-05-15 00:52:51', '2014-05-15 00:52:51', null, '甘肃省白银市平川区', '平川区', ',2925,2939,', '2939');
INSERT INTO `xx_area` VALUES ('2942', '2014-05-15 00:52:52', '2014-05-15 00:52:52', null, '甘肃省白银市靖远县', '靖远县', ',2925,2939,', '2939');
INSERT INTO `xx_area` VALUES ('2943', '2014-05-15 00:52:53', '2014-05-15 00:52:53', null, '甘肃省白银市会宁县', '会宁县', ',2925,2939,', '2939');
INSERT INTO `xx_area` VALUES ('2944', '2014-05-15 00:52:54', '2014-05-15 00:52:54', null, '甘肃省白银市景泰县', '景泰县', ',2925,2939,', '2939');
INSERT INTO `xx_area` VALUES ('2945', '2014-05-15 00:52:55', '2014-05-15 00:52:55', null, '甘肃省天水市', '天水市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2946', '2014-05-15 00:52:56', '2014-05-15 00:52:56', null, '甘肃省天水市秦州区', '秦州区', ',2925,2945,', '2945');
INSERT INTO `xx_area` VALUES ('2947', '2014-05-15 00:52:57', '2014-05-15 00:52:57', null, '甘肃省天水市麦积区', '麦积区', ',2925,2945,', '2945');
INSERT INTO `xx_area` VALUES ('2948', '2014-05-15 00:52:58', '2014-05-15 00:52:58', null, '甘肃省天水市清水县', '清水县', ',2925,2945,', '2945');
INSERT INTO `xx_area` VALUES ('2949', '2014-05-15 00:52:59', '2014-05-15 00:52:59', null, '甘肃省天水市秦安县', '秦安县', ',2925,2945,', '2945');
INSERT INTO `xx_area` VALUES ('2950', '2014-05-15 00:53:00', '2014-05-15 00:53:00', null, '甘肃省天水市甘谷县', '甘谷县', ',2925,2945,', '2945');
INSERT INTO `xx_area` VALUES ('2951', '2014-05-15 00:53:01', '2014-05-15 00:53:01', null, '甘肃省天水市武山县', '武山县', ',2925,2945,', '2945');
INSERT INTO `xx_area` VALUES ('2952', '2014-05-15 00:53:02', '2014-05-15 00:53:02', null, '甘肃省天水市张家川回族自治县', '张家川回族自治县', ',2925,2945,', '2945');
INSERT INTO `xx_area` VALUES ('2953', '2014-05-15 00:53:03', '2014-05-15 00:53:03', null, '甘肃省武威市', '武威市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2954', '2014-05-15 00:53:04', '2014-05-15 00:53:04', null, '甘肃省武威市凉州区', '凉州区', ',2925,2953,', '2953');
INSERT INTO `xx_area` VALUES ('2955', '2014-05-15 00:53:05', '2014-05-15 00:53:05', null, '甘肃省武威市民勤县', '民勤县', ',2925,2953,', '2953');
INSERT INTO `xx_area` VALUES ('2956', '2014-05-15 00:53:06', '2014-05-15 00:53:06', null, '甘肃省武威市古浪县', '古浪县', ',2925,2953,', '2953');
INSERT INTO `xx_area` VALUES ('2957', '2014-05-15 00:53:07', '2014-05-15 00:53:07', null, '甘肃省武威市天祝藏族自治县', '天祝藏族自治县', ',2925,2953,', '2953');
INSERT INTO `xx_area` VALUES ('2958', '2014-05-15 00:53:08', '2014-05-15 00:53:08', null, '甘肃省张掖市', '张掖市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2959', '2014-05-15 00:53:09', '2014-05-15 00:53:09', null, '甘肃省张掖市甘州区', '甘州区', ',2925,2958,', '2958');
INSERT INTO `xx_area` VALUES ('2960', '2014-05-15 00:53:10', '2014-05-15 00:53:10', null, '甘肃省张掖市肃南裕固族自治县', '肃南裕固族自治县', ',2925,2958,', '2958');
INSERT INTO `xx_area` VALUES ('2961', '2014-05-15 00:53:11', '2014-05-15 00:53:11', null, '甘肃省张掖市民乐县', '民乐县', ',2925,2958,', '2958');
INSERT INTO `xx_area` VALUES ('2962', '2014-05-15 00:53:12', '2014-05-15 00:53:12', null, '甘肃省张掖市临泽县', '临泽县', ',2925,2958,', '2958');
INSERT INTO `xx_area` VALUES ('2963', '2014-05-15 00:53:13', '2014-05-15 00:53:13', null, '甘肃省张掖市高台县', '高台县', ',2925,2958,', '2958');
INSERT INTO `xx_area` VALUES ('2964', '2014-05-15 00:53:14', '2014-05-15 00:53:14', null, '甘肃省张掖市山丹县', '山丹县', ',2925,2958,', '2958');
INSERT INTO `xx_area` VALUES ('2965', '2014-05-15 00:53:15', '2014-05-15 00:53:15', null, '甘肃省平凉市', '平凉市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2966', '2014-05-15 00:53:16', '2014-05-15 00:53:16', null, '甘肃省平凉市崆峒区', '崆峒区', ',2925,2965,', '2965');
INSERT INTO `xx_area` VALUES ('2967', '2014-05-15 00:53:17', '2014-05-15 00:53:17', null, '甘肃省平凉市泾川县', '泾川县', ',2925,2965,', '2965');
INSERT INTO `xx_area` VALUES ('2968', '2014-05-15 00:53:18', '2014-05-15 00:53:18', null, '甘肃省平凉市灵台县', '灵台县', ',2925,2965,', '2965');
INSERT INTO `xx_area` VALUES ('2969', '2014-05-15 00:53:19', '2014-05-15 00:53:19', null, '甘肃省平凉市崇信县', '崇信县', ',2925,2965,', '2965');
INSERT INTO `xx_area` VALUES ('2970', '2014-05-15 00:53:20', '2014-05-15 00:53:20', null, '甘肃省平凉市华亭县', '华亭县', ',2925,2965,', '2965');
INSERT INTO `xx_area` VALUES ('2971', '2014-05-15 00:53:21', '2014-05-15 00:53:21', null, '甘肃省平凉市庄浪县', '庄浪县', ',2925,2965,', '2965');
INSERT INTO `xx_area` VALUES ('2972', '2014-05-15 00:53:22', '2014-05-15 00:53:22', null, '甘肃省平凉市静宁县', '静宁县', ',2925,2965,', '2965');
INSERT INTO `xx_area` VALUES ('2973', '2014-05-15 00:53:23', '2014-05-15 00:53:23', null, '甘肃省酒泉市', '酒泉市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2974', '2014-05-15 00:53:24', '2014-05-15 00:53:24', null, '甘肃省酒泉市肃州区', '肃州区', ',2925,2973,', '2973');
INSERT INTO `xx_area` VALUES ('2975', '2014-05-15 00:53:25', '2014-05-15 00:53:25', null, '甘肃省酒泉市金塔县', '金塔县', ',2925,2973,', '2973');
INSERT INTO `xx_area` VALUES ('2976', '2014-05-15 00:53:26', '2014-05-15 00:53:26', null, '甘肃省酒泉市瓜州县', '瓜州县', ',2925,2973,', '2973');
INSERT INTO `xx_area` VALUES ('2977', '2014-05-15 00:53:27', '2014-05-15 00:53:27', null, '甘肃省酒泉市肃北蒙古族自治县', '肃北蒙古族自治县', ',2925,2973,', '2973');
INSERT INTO `xx_area` VALUES ('2978', '2014-05-15 00:53:28', '2014-05-15 00:53:28', null, '甘肃省酒泉市阿克塞哈萨克族自治县', '阿克塞哈萨克族自治县', ',2925,2973,', '2973');
INSERT INTO `xx_area` VALUES ('2979', '2014-05-15 00:53:29', '2014-05-15 00:53:29', null, '甘肃省酒泉市玉门市', '玉门市', ',2925,2973,', '2973');
INSERT INTO `xx_area` VALUES ('2980', '2014-05-15 00:53:30', '2014-05-15 00:53:30', null, '甘肃省酒泉市敦煌市', '敦煌市', ',2925,2973,', '2973');
INSERT INTO `xx_area` VALUES ('2981', '2014-05-15 00:53:31', '2014-05-15 00:53:31', null, '甘肃省庆阳市', '庆阳市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2982', '2014-05-15 00:53:32', '2014-05-15 00:53:32', null, '甘肃省庆阳市西峰区', '西峰区', ',2925,2981,', '2981');
INSERT INTO `xx_area` VALUES ('2983', '2014-05-15 00:53:33', '2014-05-15 00:53:33', null, '甘肃省庆阳市庆城县', '庆城县', ',2925,2981,', '2981');
INSERT INTO `xx_area` VALUES ('2984', '2014-05-15 00:53:34', '2014-05-15 00:53:34', null, '甘肃省庆阳市环县', '环县', ',2925,2981,', '2981');
INSERT INTO `xx_area` VALUES ('2985', '2014-05-15 00:53:35', '2014-05-15 00:53:35', null, '甘肃省庆阳市华池县', '华池县', ',2925,2981,', '2981');
INSERT INTO `xx_area` VALUES ('2986', '2014-05-15 00:53:36', '2014-05-15 00:53:36', null, '甘肃省庆阳市合水县', '合水县', ',2925,2981,', '2981');
INSERT INTO `xx_area` VALUES ('2987', '2014-05-15 00:53:37', '2014-05-15 00:53:37', null, '甘肃省庆阳市正宁县', '正宁县', ',2925,2981,', '2981');
INSERT INTO `xx_area` VALUES ('2988', '2014-05-15 00:53:38', '2014-05-15 00:53:38', null, '甘肃省庆阳市宁县', '宁县', ',2925,2981,', '2981');
INSERT INTO `xx_area` VALUES ('2989', '2014-05-15 00:53:39', '2014-05-15 00:53:39', null, '甘肃省庆阳市镇原县', '镇原县', ',2925,2981,', '2981');
INSERT INTO `xx_area` VALUES ('2990', '2014-05-15 00:53:40', '2014-05-15 00:53:40', null, '甘肃省定西市', '定西市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2991', '2014-05-15 00:53:41', '2014-05-15 00:53:41', null, '甘肃省定西市安定区', '安定区', ',2925,2990,', '2990');
INSERT INTO `xx_area` VALUES ('2992', '2014-05-15 00:53:42', '2014-05-15 00:53:42', null, '甘肃省定西市通渭县', '通渭县', ',2925,2990,', '2990');
INSERT INTO `xx_area` VALUES ('2993', '2014-05-15 00:53:43', '2014-05-15 00:53:43', null, '甘肃省定西市陇西县', '陇西县', ',2925,2990,', '2990');
INSERT INTO `xx_area` VALUES ('2994', '2014-05-15 00:53:44', '2014-05-15 00:53:44', null, '甘肃省定西市渭源县', '渭源县', ',2925,2990,', '2990');
INSERT INTO `xx_area` VALUES ('2995', '2014-05-15 00:53:45', '2014-05-15 00:53:45', null, '甘肃省定西市临洮县', '临洮县', ',2925,2990,', '2990');
INSERT INTO `xx_area` VALUES ('2996', '2014-05-15 00:53:46', '2014-05-15 00:53:46', null, '甘肃省定西市漳县', '漳县', ',2925,2990,', '2990');
INSERT INTO `xx_area` VALUES ('2997', '2014-05-15 00:53:47', '2014-05-15 00:53:47', null, '甘肃省定西市岷县', '岷县', ',2925,2990,', '2990');
INSERT INTO `xx_area` VALUES ('2998', '2014-05-15 00:53:48', '2014-05-15 00:53:48', null, '甘肃省陇南市', '陇南市', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('2999', '2014-05-15 00:53:49', '2014-05-15 00:53:49', null, '甘肃省陇南市武都区', '武都区', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3000', '2014-05-15 00:53:50', '2014-05-15 00:53:50', null, '甘肃省陇南市成县', '成县', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3001', '2014-05-15 00:53:51', '2014-05-15 00:53:51', null, '甘肃省陇南市文县', '文县', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3002', '2014-05-15 00:53:52', '2014-05-15 00:53:52', null, '甘肃省陇南市宕昌县', '宕昌县', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3003', '2014-05-15 00:53:53', '2014-05-15 00:53:53', null, '甘肃省陇南市康县', '康县', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3004', '2014-05-15 00:53:54', '2014-05-15 00:53:54', null, '甘肃省陇南市西和县', '西和县', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3005', '2014-05-15 00:53:55', '2014-05-15 00:53:55', null, '甘肃省陇南市礼县', '礼县', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3006', '2014-05-15 00:53:56', '2014-05-15 00:53:56', null, '甘肃省陇南市徽县', '徽县', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3007', '2014-05-15 00:53:57', '2014-05-15 00:53:57', null, '甘肃省陇南市两当县', '两当县', ',2925,2998,', '2998');
INSERT INTO `xx_area` VALUES ('3008', '2014-05-15 00:53:58', '2014-05-15 00:53:58', null, '甘肃省临夏回族自治州', '临夏回族自治州', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('3009', '2014-05-15 00:53:59', '2014-05-15 00:53:59', null, '甘肃省临夏回族自治州临夏市', '临夏市', ',2925,3008,', '3008');
INSERT INTO `xx_area` VALUES ('3010', '2014-05-15 00:54:00', '2014-05-15 00:54:00', null, '甘肃省临夏回族自治州临夏县', '临夏县', ',2925,3008,', '3008');
INSERT INTO `xx_area` VALUES ('3011', '2014-05-15 00:54:01', '2014-05-15 00:54:01', null, '甘肃省临夏回族自治州康乐县', '康乐县', ',2925,3008,', '3008');
INSERT INTO `xx_area` VALUES ('3012', '2014-05-15 00:54:02', '2014-05-15 00:54:02', null, '甘肃省临夏回族自治州永靖县', '永靖县', ',2925,3008,', '3008');
INSERT INTO `xx_area` VALUES ('3013', '2014-05-15 00:54:03', '2014-05-15 00:54:03', null, '甘肃省临夏回族自治州广河县', '广河县', ',2925,3008,', '3008');
INSERT INTO `xx_area` VALUES ('3014', '2014-05-15 00:54:04', '2014-05-15 00:54:04', null, '甘肃省临夏回族自治州和政县', '和政县', ',2925,3008,', '3008');
INSERT INTO `xx_area` VALUES ('3015', '2014-05-15 00:54:05', '2014-05-15 00:54:05', null, '甘肃省临夏回族自治州东乡族自治县', '东乡族自治县', ',2925,3008,', '3008');
INSERT INTO `xx_area` VALUES ('3016', '2014-05-15 00:54:06', '2014-05-15 00:54:06', null, '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县', '积石山保安族东乡族撒拉族自治县', ',2925,3008,', '3008');
INSERT INTO `xx_area` VALUES ('3017', '2014-05-15 00:54:07', '2014-05-15 00:54:07', null, '甘肃省甘南藏族自治州', '甘南藏族自治州', ',2925,', '2925');
INSERT INTO `xx_area` VALUES ('3018', '2014-05-15 00:54:08', '2014-05-15 00:54:08', null, '甘肃省甘南藏族自治州合作市', '合作市', ',2925,3017,', '3017');
INSERT INTO `xx_area` VALUES ('3019', '2014-05-15 00:54:09', '2014-05-15 00:54:09', null, '甘肃省甘南藏族自治州临潭县', '临潭县', ',2925,3017,', '3017');
INSERT INTO `xx_area` VALUES ('3020', '2014-05-15 00:54:10', '2014-05-15 00:54:10', null, '甘肃省甘南藏族自治州卓尼县', '卓尼县', ',2925,3017,', '3017');
INSERT INTO `xx_area` VALUES ('3021', '2014-05-15 00:54:11', '2014-05-15 00:54:11', null, '甘肃省甘南藏族自治州舟曲县', '舟曲县', ',2925,3017,', '3017');
INSERT INTO `xx_area` VALUES ('3022', '2014-05-15 00:54:12', '2014-05-15 00:54:12', null, '甘肃省甘南藏族自治州迭部县', '迭部县', ',2925,3017,', '3017');
INSERT INTO `xx_area` VALUES ('3023', '2014-05-15 00:54:13', '2014-05-15 00:54:13', null, '甘肃省甘南藏族自治州玛曲县', '玛曲县', ',2925,3017,', '3017');
INSERT INTO `xx_area` VALUES ('3024', '2014-05-15 00:54:14', '2014-05-15 00:54:14', null, '甘肃省甘南藏族自治州碌曲县', '碌曲县', ',2925,3017,', '3017');
INSERT INTO `xx_area` VALUES ('3025', '2014-05-15 00:54:15', '2014-05-15 00:54:15', null, '甘肃省甘南藏族自治州夏河县', '夏河县', ',2925,3017,', '3017');
INSERT INTO `xx_area` VALUES ('3026', '2014-05-15 00:54:16', '2014-05-15 00:54:16', null, '青海省', '青海省', ',', null);
INSERT INTO `xx_area` VALUES ('3027', '2014-05-15 00:54:17', '2014-05-15 00:54:17', null, '青海省西宁市', '西宁市', ',3026,', '3026');
INSERT INTO `xx_area` VALUES ('3028', '2014-05-15 00:54:18', '2014-05-15 00:54:18', null, '青海省西宁市城东区', '城东区', ',3026,3027,', '3027');
INSERT INTO `xx_area` VALUES ('3029', '2014-05-15 00:54:19', '2014-05-15 00:54:19', null, '青海省西宁市城中区', '城中区', ',3026,3027,', '3027');
INSERT INTO `xx_area` VALUES ('3030', '2014-05-15 00:54:20', '2014-05-15 00:54:20', null, '青海省西宁市城西区', '城西区', ',3026,3027,', '3027');
INSERT INTO `xx_area` VALUES ('3031', '2014-05-15 00:54:21', '2014-05-15 00:54:21', null, '青海省西宁市城北区', '城北区', ',3026,3027,', '3027');
INSERT INTO `xx_area` VALUES ('3032', '2014-05-15 00:54:22', '2014-05-15 00:54:22', null, '青海省西宁市大通回族土族自治县', '大通回族土族自治县', ',3026,3027,', '3027');
INSERT INTO `xx_area` VALUES ('3033', '2014-05-15 00:54:23', '2014-05-15 00:54:23', null, '青海省西宁市湟中县', '湟中县', ',3026,3027,', '3027');
INSERT INTO `xx_area` VALUES ('3034', '2014-05-15 00:54:24', '2014-05-15 00:54:24', null, '青海省西宁市湟源县', '湟源县', ',3026,3027,', '3027');
INSERT INTO `xx_area` VALUES ('3035', '2014-05-15 00:54:25', '2014-05-15 00:54:25', null, '青海省海东地区', '海东地区', ',3026,', '3026');
INSERT INTO `xx_area` VALUES ('3036', '2014-05-15 00:54:26', '2014-05-15 00:54:26', null, '青海省海东地区平安县', '平安县', ',3026,3035,', '3035');
INSERT INTO `xx_area` VALUES ('3037', '2014-05-15 00:54:27', '2014-05-15 00:54:27', null, '青海省海东地区民和回族土族自治县', '民和回族土族自治县', ',3026,3035,', '3035');
INSERT INTO `xx_area` VALUES ('3038', '2014-05-15 00:54:28', '2014-05-15 00:54:28', null, '青海省海东地区乐都县', '乐都县', ',3026,3035,', '3035');
INSERT INTO `xx_area` VALUES ('3039', '2014-05-15 00:54:29', '2014-05-15 00:54:29', null, '青海省海东地区互助土族自治县', '互助土族自治县', ',3026,3035,', '3035');
INSERT INTO `xx_area` VALUES ('3040', '2014-05-15 00:54:30', '2014-05-15 00:54:30', null, '青海省海东地区化隆回族自治县', '化隆回族自治县', ',3026,3035,', '3035');
INSERT INTO `xx_area` VALUES ('3041', '2014-05-15 00:54:31', '2014-05-15 00:54:31', null, '青海省海东地区循化撒拉族自治县', '循化撒拉族自治县', ',3026,3035,', '3035');
INSERT INTO `xx_area` VALUES ('3042', '2014-05-15 00:54:32', '2014-05-15 00:54:32', null, '青海省海北藏族自治州', '海北藏族自治州', ',3026,', '3026');
INSERT INTO `xx_area` VALUES ('3043', '2014-05-15 00:54:33', '2014-05-15 00:54:33', null, '青海省海北藏族自治州门源回族自治县', '门源回族自治县', ',3026,3042,', '3042');
INSERT INTO `xx_area` VALUES ('3044', '2014-05-15 00:54:34', '2014-05-15 00:54:34', null, '青海省海北藏族自治州祁连县', '祁连县', ',3026,3042,', '3042');
INSERT INTO `xx_area` VALUES ('3045', '2014-05-15 00:54:35', '2014-05-15 00:54:35', null, '青海省海北藏族自治州海晏县', '海晏县', ',3026,3042,', '3042');
INSERT INTO `xx_area` VALUES ('3046', '2014-05-15 00:54:36', '2014-05-15 00:54:36', null, '青海省海北藏族自治州刚察县', '刚察县', ',3026,3042,', '3042');
INSERT INTO `xx_area` VALUES ('3047', '2014-05-15 00:54:37', '2014-05-15 00:54:37', null, '青海省黄南藏族自治州', '黄南藏族自治州', ',3026,', '3026');
INSERT INTO `xx_area` VALUES ('3048', '2014-05-15 00:54:38', '2014-05-15 00:54:38', null, '青海省黄南藏族自治州同仁县', '同仁县', ',3026,3047,', '3047');
INSERT INTO `xx_area` VALUES ('3049', '2014-05-15 00:54:39', '2014-05-15 00:54:39', null, '青海省黄南藏族自治州尖扎县', '尖扎县', ',3026,3047,', '3047');
INSERT INTO `xx_area` VALUES ('3050', '2014-05-15 00:54:40', '2014-05-15 00:54:40', null, '青海省黄南藏族自治州泽库县', '泽库县', ',3026,3047,', '3047');
INSERT INTO `xx_area` VALUES ('3051', '2014-05-15 00:54:41', '2014-05-15 00:54:41', null, '青海省黄南藏族自治州河南蒙古族自治县', '河南蒙古族自治县', ',3026,3047,', '3047');
INSERT INTO `xx_area` VALUES ('3052', '2014-05-15 00:54:42', '2014-05-15 00:54:42', null, '青海省海南藏族自治州', '海南藏族自治州', ',3026,', '3026');
INSERT INTO `xx_area` VALUES ('3053', '2014-05-15 00:54:43', '2014-05-15 00:54:43', null, '青海省海南藏族自治州共和县', '共和县', ',3026,3052,', '3052');
INSERT INTO `xx_area` VALUES ('3054', '2014-05-15 00:54:44', '2014-05-15 00:54:44', null, '青海省海南藏族自治州同德县', '同德县', ',3026,3052,', '3052');
INSERT INTO `xx_area` VALUES ('3055', '2014-05-15 00:54:45', '2014-05-15 00:54:45', null, '青海省海南藏族自治州贵德县', '贵德县', ',3026,3052,', '3052');
INSERT INTO `xx_area` VALUES ('3056', '2014-05-15 00:54:46', '2014-05-15 00:54:46', null, '青海省海南藏族自治州兴海县', '兴海县', ',3026,3052,', '3052');
INSERT INTO `xx_area` VALUES ('3057', '2014-05-15 00:54:47', '2014-05-15 00:54:47', null, '青海省海南藏族自治州贵南县', '贵南县', ',3026,3052,', '3052');
INSERT INTO `xx_area` VALUES ('3058', '2014-05-15 00:54:48', '2014-05-15 00:54:48', null, '青海省果洛藏族自治州', '果洛藏族自治州', ',3026,', '3026');
INSERT INTO `xx_area` VALUES ('3059', '2014-05-15 00:54:49', '2014-05-15 00:54:49', null, '青海省果洛藏族自治州玛沁县', '玛沁县', ',3026,3058,', '3058');
INSERT INTO `xx_area` VALUES ('3060', '2014-05-15 00:54:50', '2014-05-15 00:54:50', null, '青海省果洛藏族自治州班玛县', '班玛县', ',3026,3058,', '3058');
INSERT INTO `xx_area` VALUES ('3061', '2014-05-15 00:54:51', '2014-05-15 00:54:51', null, '青海省果洛藏族自治州甘德县', '甘德县', ',3026,3058,', '3058');
INSERT INTO `xx_area` VALUES ('3062', '2014-05-15 00:54:52', '2014-05-15 00:54:52', null, '青海省果洛藏族自治州达日县', '达日县', ',3026,3058,', '3058');
INSERT INTO `xx_area` VALUES ('3063', '2014-05-15 00:54:53', '2014-05-15 00:54:53', null, '青海省果洛藏族自治州久治县', '久治县', ',3026,3058,', '3058');
INSERT INTO `xx_area` VALUES ('3064', '2014-05-15 00:54:54', '2014-05-15 00:54:54', null, '青海省果洛藏族自治州玛多县', '玛多县', ',3026,3058,', '3058');
INSERT INTO `xx_area` VALUES ('3065', '2014-05-15 00:54:55', '2014-05-15 00:54:55', null, '青海省玉树藏族自治州', '玉树藏族自治州', ',3026,', '3026');
INSERT INTO `xx_area` VALUES ('3066', '2014-05-15 00:54:56', '2014-05-15 00:54:56', null, '青海省玉树藏族自治州玉树县', '玉树县', ',3026,3065,', '3065');
INSERT INTO `xx_area` VALUES ('3067', '2014-05-15 00:54:57', '2014-05-15 00:54:57', null, '青海省玉树藏族自治州杂多县', '杂多县', ',3026,3065,', '3065');
INSERT INTO `xx_area` VALUES ('3068', '2014-05-15 00:54:58', '2014-05-15 00:54:58', null, '青海省玉树藏族自治州称多县', '称多县', ',3026,3065,', '3065');
INSERT INTO `xx_area` VALUES ('3069', '2014-05-15 00:54:59', '2014-05-15 00:54:59', null, '青海省玉树藏族自治州治多县', '治多县', ',3026,3065,', '3065');
INSERT INTO `xx_area` VALUES ('3070', '2014-05-15 00:55:00', '2014-05-15 00:55:00', null, '青海省玉树藏族自治州囊谦县', '囊谦县', ',3026,3065,', '3065');
INSERT INTO `xx_area` VALUES ('3071', '2014-05-15 00:55:01', '2014-05-15 00:55:01', null, '青海省玉树藏族自治州曲麻莱县', '曲麻莱县', ',3026,3065,', '3065');
INSERT INTO `xx_area` VALUES ('3072', '2014-05-15 00:55:02', '2014-05-15 00:55:02', null, '青海省海西蒙古族藏族自治州', '海西蒙古族藏族自治州', ',3026,', '3026');
INSERT INTO `xx_area` VALUES ('3073', '2014-05-15 00:55:03', '2014-05-15 00:55:03', null, '青海省海西蒙古族藏族自治州格尔木市', '格尔木市', ',3026,3072,', '3072');
INSERT INTO `xx_area` VALUES ('3074', '2014-05-15 00:55:04', '2014-05-15 00:55:04', null, '青海省海西蒙古族藏族自治州德令哈市', '德令哈市', ',3026,3072,', '3072');
INSERT INTO `xx_area` VALUES ('3075', '2014-05-15 00:55:05', '2014-05-15 00:55:05', null, '青海省海西蒙古族藏族自治州乌兰县', '乌兰县', ',3026,3072,', '3072');
INSERT INTO `xx_area` VALUES ('3076', '2014-05-15 00:55:06', '2014-05-15 00:55:06', null, '青海省海西蒙古族藏族自治州都兰县', '都兰县', ',3026,3072,', '3072');
INSERT INTO `xx_area` VALUES ('3077', '2014-05-15 00:55:07', '2014-05-15 00:55:07', null, '青海省海西蒙古族藏族自治州天峻县', '天峻县', ',3026,3072,', '3072');
INSERT INTO `xx_area` VALUES ('3078', '2014-05-15 00:55:08', '2014-05-15 00:55:08', null, '宁夏回族自治区', '宁夏回族自治区', ',', null);
INSERT INTO `xx_area` VALUES ('3079', '2014-05-15 00:55:09', '2014-05-15 00:55:09', null, '宁夏回族自治区银川市', '银川市', ',3078,', '3078');
INSERT INTO `xx_area` VALUES ('3080', '2014-05-15 00:55:10', '2014-05-15 00:55:10', null, '宁夏回族自治区银川市兴庆区', '兴庆区', ',3078,3079,', '3079');
INSERT INTO `xx_area` VALUES ('3081', '2014-05-15 00:55:11', '2014-05-15 00:55:11', null, '宁夏回族自治区银川市西夏区', '西夏区', ',3078,3079,', '3079');
INSERT INTO `xx_area` VALUES ('3082', '2014-05-15 00:55:12', '2014-05-15 00:55:12', null, '宁夏回族自治区银川市金凤区', '金凤区', ',3078,3079,', '3079');
INSERT INTO `xx_area` VALUES ('3083', '2014-05-15 00:55:13', '2014-05-15 00:55:13', null, '宁夏回族自治区银川市永宁县', '永宁县', ',3078,3079,', '3079');
INSERT INTO `xx_area` VALUES ('3084', '2014-05-15 00:55:14', '2014-05-15 00:55:14', null, '宁夏回族自治区银川市贺兰县', '贺兰县', ',3078,3079,', '3079');
INSERT INTO `xx_area` VALUES ('3085', '2014-05-15 00:55:15', '2014-05-15 00:55:15', null, '宁夏回族自治区银川市灵武市', '灵武市', ',3078,3079,', '3079');
INSERT INTO `xx_area` VALUES ('3086', '2014-05-15 00:55:16', '2014-05-15 00:55:16', null, '宁夏回族自治区石嘴山市', '石嘴山市', ',3078,', '3078');
INSERT INTO `xx_area` VALUES ('3087', '2014-05-15 00:55:17', '2014-05-15 00:55:17', null, '宁夏回族自治区石嘴山市大武口区', '大武口区', ',3078,3086,', '3086');
INSERT INTO `xx_area` VALUES ('3088', '2014-05-15 00:55:18', '2014-05-15 00:55:18', null, '宁夏回族自治区石嘴山市惠农区', '惠农区', ',3078,3086,', '3086');
INSERT INTO `xx_area` VALUES ('3089', '2014-05-15 00:55:19', '2014-05-15 00:55:19', null, '宁夏回族自治区石嘴山市平罗县', '平罗县', ',3078,3086,', '3086');
INSERT INTO `xx_area` VALUES ('3090', '2014-05-15 00:55:20', '2014-05-15 00:55:20', null, '宁夏回族自治区吴忠市', '吴忠市', ',3078,', '3078');
INSERT INTO `xx_area` VALUES ('3091', '2014-05-15 00:55:21', '2014-05-15 00:55:21', null, '宁夏回族自治区吴忠市利通区', '利通区', ',3078,3090,', '3090');
INSERT INTO `xx_area` VALUES ('3092', '2014-05-15 00:55:22', '2014-05-15 00:55:22', null, '宁夏回族自治区吴忠市红寺堡区', '红寺堡区', ',3078,3090,', '3090');
INSERT INTO `xx_area` VALUES ('3093', '2014-05-15 00:55:23', '2014-05-15 00:55:23', null, '宁夏回族自治区吴忠市盐池县', '盐池县', ',3078,3090,', '3090');
INSERT INTO `xx_area` VALUES ('3094', '2014-05-15 00:55:24', '2014-05-15 00:55:24', null, '宁夏回族自治区吴忠市同心县', '同心县', ',3078,3090,', '3090');
INSERT INTO `xx_area` VALUES ('3095', '2014-05-15 00:55:25', '2014-05-15 00:55:25', null, '宁夏回族自治区吴忠市青铜峡市', '青铜峡市', ',3078,3090,', '3090');
INSERT INTO `xx_area` VALUES ('3096', '2014-05-15 00:55:26', '2014-05-15 00:55:26', null, '宁夏回族自治区固原市', '固原市', ',3078,', '3078');
INSERT INTO `xx_area` VALUES ('3097', '2014-05-15 00:55:27', '2014-05-15 00:55:27', null, '宁夏回族自治区固原市原州区', '原州区', ',3078,3096,', '3096');
INSERT INTO `xx_area` VALUES ('3098', '2014-05-15 00:55:28', '2014-05-15 00:55:28', null, '宁夏回族自治区固原市西吉县', '西吉县', ',3078,3096,', '3096');
INSERT INTO `xx_area` VALUES ('3099', '2014-05-15 00:55:29', '2014-05-15 00:55:29', null, '宁夏回族自治区固原市隆德县', '隆德县', ',3078,3096,', '3096');
INSERT INTO `xx_area` VALUES ('3100', '2014-05-15 00:55:30', '2014-05-15 00:55:30', null, '宁夏回族自治区固原市泾源县', '泾源县', ',3078,3096,', '3096');
INSERT INTO `xx_area` VALUES ('3101', '2014-05-15 00:55:31', '2014-05-15 00:55:31', null, '宁夏回族自治区固原市彭阳县', '彭阳县', ',3078,3096,', '3096');
INSERT INTO `xx_area` VALUES ('3102', '2014-05-15 00:55:32', '2014-05-15 00:55:32', null, '宁夏回族自治区中卫市', '中卫市', ',3078,', '3078');
INSERT INTO `xx_area` VALUES ('3103', '2014-05-15 00:55:33', '2014-05-15 00:55:33', null, '宁夏回族自治区中卫市沙坡头区', '沙坡头区', ',3078,3102,', '3102');
INSERT INTO `xx_area` VALUES ('3104', '2014-05-15 00:55:34', '2014-05-15 00:55:34', null, '宁夏回族自治区中卫市中宁县', '中宁县', ',3078,3102,', '3102');
INSERT INTO `xx_area` VALUES ('3105', '2014-05-15 00:55:35', '2014-05-15 00:55:35', null, '宁夏回族自治区中卫市海原县', '海原县', ',3078,3102,', '3102');
INSERT INTO `xx_area` VALUES ('3106', '2014-05-15 00:55:36', '2014-05-15 00:55:36', null, '新疆维吾尔自治区', '新疆维吾尔自治区', ',', null);
INSERT INTO `xx_area` VALUES ('3107', '2014-05-15 00:55:37', '2014-05-15 00:55:37', null, '新疆维吾尔自治区乌鲁木齐市', '乌鲁木齐市', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3108', '2014-05-15 00:55:38', '2014-05-15 00:55:38', null, '新疆维吾尔自治区乌鲁木齐市天山区', '天山区', ',3106,3107,', '3107');
INSERT INTO `xx_area` VALUES ('3109', '2014-05-15 00:55:39', '2014-05-15 00:55:39', null, '新疆维吾尔自治区乌鲁木齐市沙依巴克区', '沙依巴克区', ',3106,3107,', '3107');
INSERT INTO `xx_area` VALUES ('3110', '2014-05-15 00:55:40', '2014-05-15 00:55:40', null, '新疆维吾尔自治区乌鲁木齐市新市区', '新市区', ',3106,3107,', '3107');
INSERT INTO `xx_area` VALUES ('3111', '2014-05-15 00:55:41', '2014-05-15 00:55:41', null, '新疆维吾尔自治区乌鲁木齐市水磨沟区', '水磨沟区', ',3106,3107,', '3107');
INSERT INTO `xx_area` VALUES ('3112', '2014-05-15 00:55:42', '2014-05-15 00:55:42', null, '新疆维吾尔自治区乌鲁木齐市头屯河区', '头屯河区', ',3106,3107,', '3107');
INSERT INTO `xx_area` VALUES ('3113', '2014-05-15 00:55:43', '2014-05-15 00:55:43', null, '新疆维吾尔自治区乌鲁木齐市达坂城区', '达坂城区', ',3106,3107,', '3107');
INSERT INTO `xx_area` VALUES ('3114', '2014-05-15 00:55:44', '2014-05-15 00:55:44', null, '新疆维吾尔自治区乌鲁木齐市米东区', '米东区', ',3106,3107,', '3107');
INSERT INTO `xx_area` VALUES ('3115', '2014-05-15 00:55:45', '2014-05-15 00:55:45', null, '新疆维吾尔自治区乌鲁木齐市乌鲁木齐县', '乌鲁木齐县', ',3106,3107,', '3107');
INSERT INTO `xx_area` VALUES ('3116', '2014-05-15 00:55:46', '2014-05-15 00:55:46', null, '新疆维吾尔自治区克拉玛依市', '克拉玛依市', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3117', '2014-05-15 00:55:47', '2014-05-15 00:55:47', null, '新疆维吾尔自治区克拉玛依市独山子区', '独山子区', ',3106,3116,', '3116');
INSERT INTO `xx_area` VALUES ('3118', '2014-05-15 00:55:48', '2014-05-15 00:55:48', null, '新疆维吾尔自治区克拉玛依市克拉玛依区', '克拉玛依区', ',3106,3116,', '3116');
INSERT INTO `xx_area` VALUES ('3119', '2014-05-15 00:55:49', '2014-05-15 00:55:49', null, '新疆维吾尔自治区克拉玛依市白碱滩区', '白碱滩区', ',3106,3116,', '3116');
INSERT INTO `xx_area` VALUES ('3120', '2014-05-15 00:55:50', '2014-05-15 00:55:50', null, '新疆维吾尔自治区克拉玛依市乌尔禾区', '乌尔禾区', ',3106,3116,', '3116');
INSERT INTO `xx_area` VALUES ('3121', '2014-05-15 00:55:51', '2014-05-15 00:55:51', null, '新疆维吾尔自治区吐鲁番地区', '吐鲁番地区', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3122', '2014-05-15 00:55:52', '2014-05-15 00:55:52', null, '新疆维吾尔自治区吐鲁番地区吐鲁番市', '吐鲁番市', ',3106,3121,', '3121');
INSERT INTO `xx_area` VALUES ('3123', '2014-05-15 00:55:53', '2014-05-15 00:55:53', null, '新疆维吾尔自治区吐鲁番地区鄯善县', '鄯善县', ',3106,3121,', '3121');
INSERT INTO `xx_area` VALUES ('3124', '2014-05-15 00:55:54', '2014-05-15 00:55:54', null, '新疆维吾尔自治区吐鲁番地区托克逊县', '托克逊县', ',3106,3121,', '3121');
INSERT INTO `xx_area` VALUES ('3125', '2014-05-15 00:55:55', '2014-05-15 00:55:55', null, '新疆维吾尔自治区哈密地区', '哈密地区', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3126', '2014-05-15 00:55:56', '2014-05-15 00:55:56', null, '新疆维吾尔自治区哈密地区哈密市', '哈密市', ',3106,3125,', '3125');
INSERT INTO `xx_area` VALUES ('3127', '2014-05-15 00:55:57', '2014-05-15 00:55:57', null, '新疆维吾尔自治区哈密地区巴里坤哈萨克自治县', '巴里坤哈萨克自治县', ',3106,3125,', '3125');
INSERT INTO `xx_area` VALUES ('3128', '2014-05-15 00:55:58', '2014-05-15 00:55:58', null, '新疆维吾尔自治区哈密地区伊吾县', '伊吾县', ',3106,3125,', '3125');
INSERT INTO `xx_area` VALUES ('3129', '2014-05-15 00:55:59', '2014-05-15 00:55:59', null, '新疆维吾尔自治区昌吉回族自治州', '昌吉回族自治州', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3130', '2014-05-15 00:56:00', '2014-05-15 00:56:00', null, '新疆维吾尔自治区昌吉回族自治州昌吉市', '昌吉市', ',3106,3129,', '3129');
INSERT INTO `xx_area` VALUES ('3131', '2014-05-15 00:56:01', '2014-05-15 00:56:01', null, '新疆维吾尔自治区昌吉回族自治州阜康市', '阜康市', ',3106,3129,', '3129');
INSERT INTO `xx_area` VALUES ('3132', '2014-05-15 00:56:02', '2014-05-15 00:56:02', null, '新疆维吾尔自治区昌吉回族自治州呼图壁县', '呼图壁县', ',3106,3129,', '3129');
INSERT INTO `xx_area` VALUES ('3133', '2014-05-15 00:56:03', '2014-05-15 00:56:03', null, '新疆维吾尔自治区昌吉回族自治州玛纳斯县', '玛纳斯县', ',3106,3129,', '3129');
INSERT INTO `xx_area` VALUES ('3134', '2014-05-15 00:56:04', '2014-05-15 00:56:04', null, '新疆维吾尔自治区昌吉回族自治州奇台县', '奇台县', ',3106,3129,', '3129');
INSERT INTO `xx_area` VALUES ('3135', '2014-05-15 00:56:05', '2014-05-15 00:56:05', null, '新疆维吾尔自治区昌吉回族自治州吉木萨尔县', '吉木萨尔县', ',3106,3129,', '3129');
INSERT INTO `xx_area` VALUES ('3136', '2014-05-15 00:56:06', '2014-05-15 00:56:06', null, '新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县', '木垒哈萨克自治县', ',3106,3129,', '3129');
INSERT INTO `xx_area` VALUES ('3137', '2014-05-15 00:56:07', '2014-05-15 00:56:07', null, '新疆维吾尔自治区博尔塔拉蒙古自治州', '博尔塔拉蒙古自治州', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3138', '2014-05-15 00:56:08', '2014-05-15 00:56:08', null, '新疆维吾尔自治区博尔塔拉蒙古自治州博乐市', '博乐市', ',3106,3137,', '3137');
INSERT INTO `xx_area` VALUES ('3139', '2014-05-15 00:56:09', '2014-05-15 00:56:09', null, '新疆维吾尔自治区博尔塔拉蒙古自治州精河县', '精河县', ',3106,3137,', '3137');
INSERT INTO `xx_area` VALUES ('3140', '2014-05-15 00:56:10', '2014-05-15 00:56:10', null, '新疆维吾尔自治区博尔塔拉蒙古自治州温泉县', '温泉县', ',3106,3137,', '3137');
INSERT INTO `xx_area` VALUES ('3141', '2014-05-15 00:56:11', '2014-05-15 00:56:11', null, '新疆维吾尔自治区巴音郭楞蒙古自治州', '巴音郭楞蒙古自治州', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3142', '2014-05-15 00:56:12', '2014-05-15 00:56:12', null, '新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市', '库尔勒市', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3143', '2014-05-15 00:56:13', '2014-05-15 00:56:13', null, '新疆维吾尔自治区巴音郭楞蒙古自治州轮台县', '轮台县', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3144', '2014-05-15 00:56:14', '2014-05-15 00:56:14', null, '新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县', '尉犁县', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3145', '2014-05-15 00:56:15', '2014-05-15 00:56:15', null, '新疆维吾尔自治区巴音郭楞蒙古自治州若羌县', '若羌县', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3146', '2014-05-15 00:56:16', '2014-05-15 00:56:16', null, '新疆维吾尔自治区巴音郭楞蒙古自治州且末县', '且末县', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3147', '2014-05-15 00:56:17', '2014-05-15 00:56:17', null, '新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县', '焉耆回族自治县', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3148', '2014-05-15 00:56:18', '2014-05-15 00:56:18', null, '新疆维吾尔自治区巴音郭楞蒙古自治州和静县', '和静县', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3149', '2014-05-15 00:56:19', '2014-05-15 00:56:19', null, '新疆维吾尔自治区巴音郭楞蒙古自治州和硕县', '和硕县', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3150', '2014-05-15 00:56:20', '2014-05-15 00:56:20', null, '新疆维吾尔自治区巴音郭楞蒙古自治州博湖县', '博湖县', ',3106,3141,', '3141');
INSERT INTO `xx_area` VALUES ('3151', '2014-05-15 00:56:21', '2014-05-15 00:56:21', null, '新疆维吾尔自治区阿克苏地区', '阿克苏地区', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3152', '2014-05-15 00:56:22', '2014-05-15 00:56:22', null, '新疆维吾尔自治区阿克苏地区阿克苏市', '阿克苏市', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3153', '2014-05-15 00:56:23', '2014-05-15 00:56:23', null, '新疆维吾尔自治区阿克苏地区温宿县', '温宿县', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3154', '2014-05-15 00:56:24', '2014-05-15 00:56:24', null, '新疆维吾尔自治区阿克苏地区库车县', '库车县', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3155', '2014-05-15 00:56:25', '2014-05-15 00:56:25', null, '新疆维吾尔自治区阿克苏地区沙雅县', '沙雅县', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3156', '2014-05-15 00:56:26', '2014-05-15 00:56:26', null, '新疆维吾尔自治区阿克苏地区新和县', '新和县', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3157', '2014-05-15 00:56:27', '2014-05-15 00:56:27', null, '新疆维吾尔自治区阿克苏地区拜城县', '拜城县', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3158', '2014-05-15 00:56:28', '2014-05-15 00:56:28', null, '新疆维吾尔自治区阿克苏地区乌什县', '乌什县', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3159', '2014-05-15 00:56:29', '2014-05-15 00:56:29', null, '新疆维吾尔自治区阿克苏地区阿瓦提县', '阿瓦提县', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3160', '2014-05-15 00:56:30', '2014-05-15 00:56:30', null, '新疆维吾尔自治区阿克苏地区柯坪县', '柯坪县', ',3106,3151,', '3151');
INSERT INTO `xx_area` VALUES ('3161', '2014-05-15 00:56:31', '2014-05-15 00:56:31', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州', '克孜勒苏柯尔克孜自治州', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3162', '2014-05-15 00:56:32', '2014-05-15 00:56:32', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市', '阿图什市', ',3106,3161,', '3161');
INSERT INTO `xx_area` VALUES ('3163', '2014-05-15 00:56:33', '2014-05-15 00:56:33', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县', '阿克陶县', ',3106,3161,', '3161');
INSERT INTO `xx_area` VALUES ('3164', '2014-05-15 00:56:34', '2014-05-15 00:56:34', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县', '阿合奇县', ',3106,3161,', '3161');
INSERT INTO `xx_area` VALUES ('3165', '2014-05-15 00:56:35', '2014-05-15 00:56:35', null, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县', '乌恰县', ',3106,3161,', '3161');
INSERT INTO `xx_area` VALUES ('3166', '2014-05-15 00:56:36', '2014-05-15 00:56:36', null, '新疆维吾尔自治区喀什地区', '喀什地区', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3167', '2014-05-15 00:56:37', '2014-05-15 00:56:37', null, '新疆维吾尔自治区喀什地区喀什市', '喀什市', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3168', '2014-05-15 00:56:38', '2014-05-15 00:56:38', null, '新疆维吾尔自治区喀什地区疏附县', '疏附县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3169', '2014-05-15 00:56:39', '2014-05-15 00:56:39', null, '新疆维吾尔自治区喀什地区疏勒县', '疏勒县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3170', '2014-05-15 00:56:40', '2014-05-15 00:56:40', null, '新疆维吾尔自治区喀什地区英吉沙县', '英吉沙县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3171', '2014-05-15 00:56:41', '2014-05-15 00:56:41', null, '新疆维吾尔自治区喀什地区泽普县', '泽普县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3172', '2014-05-15 00:56:42', '2014-05-15 00:56:42', null, '新疆维吾尔自治区喀什地区莎车县', '莎车县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3173', '2014-05-15 00:56:43', '2014-05-15 00:56:43', null, '新疆维吾尔自治区喀什地区叶城县', '叶城县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3174', '2014-05-15 00:56:44', '2014-05-15 00:56:44', null, '新疆维吾尔自治区喀什地区麦盖提县', '麦盖提县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3175', '2014-05-15 00:56:45', '2014-05-15 00:56:45', null, '新疆维吾尔自治区喀什地区岳普湖县', '岳普湖县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3176', '2014-05-15 00:56:46', '2014-05-15 00:56:46', null, '新疆维吾尔自治区喀什地区伽师县', '伽师县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3177', '2014-05-15 00:56:47', '2014-05-15 00:56:47', null, '新疆维吾尔自治区喀什地区巴楚县', '巴楚县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3178', '2014-05-15 00:56:48', '2014-05-15 00:56:48', null, '新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县', '塔什库尔干塔吉克自治县', ',3106,3166,', '3166');
INSERT INTO `xx_area` VALUES ('3179', '2014-05-15 00:56:49', '2014-05-15 00:56:49', null, '新疆维吾尔自治区和田地区', '和田地区', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3180', '2014-05-15 00:56:50', '2014-05-15 00:56:50', null, '新疆维吾尔自治区和田地区和田市', '和田市', ',3106,3179,', '3179');
INSERT INTO `xx_area` VALUES ('3181', '2014-05-15 00:56:51', '2014-05-15 00:56:51', null, '新疆维吾尔自治区和田地区和田县', '和田县', ',3106,3179,', '3179');
INSERT INTO `xx_area` VALUES ('3182', '2014-05-15 00:56:52', '2014-05-15 00:56:52', null, '新疆维吾尔自治区和田地区墨玉县', '墨玉县', ',3106,3179,', '3179');
INSERT INTO `xx_area` VALUES ('3183', '2014-05-15 00:56:53', '2014-05-15 00:56:53', null, '新疆维吾尔自治区和田地区皮山县', '皮山县', ',3106,3179,', '3179');
INSERT INTO `xx_area` VALUES ('3184', '2014-05-15 00:56:54', '2014-05-15 00:56:54', null, '新疆维吾尔自治区和田地区洛浦县', '洛浦县', ',3106,3179,', '3179');
INSERT INTO `xx_area` VALUES ('3185', '2014-05-15 00:56:55', '2014-05-15 00:56:55', null, '新疆维吾尔自治区和田地区策勒县', '策勒县', ',3106,3179,', '3179');
INSERT INTO `xx_area` VALUES ('3186', '2014-05-15 00:56:56', '2014-05-15 00:56:56', null, '新疆维吾尔自治区和田地区于田县', '于田县', ',3106,3179,', '3179');
INSERT INTO `xx_area` VALUES ('3187', '2014-05-15 00:56:57', '2014-05-15 00:56:57', null, '新疆维吾尔自治区和田地区民丰县', '民丰县', ',3106,3179,', '3179');
INSERT INTO `xx_area` VALUES ('3188', '2014-05-15 00:56:58', '2014-05-15 00:56:58', null, '新疆维吾尔自治区伊犁哈萨克自治州', '伊犁哈萨克自治州', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3189', '2014-05-15 00:56:59', '2014-05-15 00:56:59', null, '新疆维吾尔自治区伊犁哈萨克自治州伊宁市', '伊宁市', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3190', '2014-05-15 00:57:00', '2014-05-15 00:57:00', null, '新疆维吾尔自治区伊犁哈萨克自治州奎屯市', '奎屯市', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3191', '2014-05-15 00:57:01', '2014-05-15 00:57:01', null, '新疆维吾尔自治区伊犁哈萨克自治州伊宁县', '伊宁县', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3192', '2014-05-15 00:57:02', '2014-05-15 00:57:02', null, '新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县', '察布查尔锡伯自治县', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3193', '2014-05-15 00:57:03', '2014-05-15 00:57:03', null, '新疆维吾尔自治区伊犁哈萨克自治州霍城县', '霍城县', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3194', '2014-05-15 00:57:04', '2014-05-15 00:57:04', null, '新疆维吾尔自治区伊犁哈萨克自治州巩留县', '巩留县', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3195', '2014-05-15 00:57:05', '2014-05-15 00:57:05', null, '新疆维吾尔自治区伊犁哈萨克自治州新源县', '新源县', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3196', '2014-05-15 00:57:06', '2014-05-15 00:57:06', null, '新疆维吾尔自治区伊犁哈萨克自治州昭苏县', '昭苏县', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3197', '2014-05-15 00:57:07', '2014-05-15 00:57:07', null, '新疆维吾尔自治区伊犁哈萨克自治州特克斯县', '特克斯县', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3198', '2014-05-15 00:57:08', '2014-05-15 00:57:08', null, '新疆维吾尔自治区伊犁哈萨克自治州尼勒克县', '尼勒克县', ',3106,3188,', '3188');
INSERT INTO `xx_area` VALUES ('3199', '2014-05-15 00:57:09', '2014-05-15 00:57:09', null, '新疆维吾尔自治区塔城地区', '塔城地区', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3200', '2014-05-15 00:57:10', '2014-05-15 00:57:10', null, '新疆维吾尔自治区塔城地区塔城市', '塔城市', ',3106,3199,', '3199');
INSERT INTO `xx_area` VALUES ('3201', '2014-05-15 00:57:11', '2014-05-15 00:57:11', null, '新疆维吾尔自治区塔城地区乌苏市', '乌苏市', ',3106,3199,', '3199');
INSERT INTO `xx_area` VALUES ('3202', '2014-05-15 00:57:12', '2014-05-15 00:57:12', null, '新疆维吾尔自治区塔城地区额敏县', '额敏县', ',3106,3199,', '3199');
INSERT INTO `xx_area` VALUES ('3203', '2014-05-15 00:57:13', '2014-05-15 00:57:13', null, '新疆维吾尔自治区塔城地区沙湾县', '沙湾县', ',3106,3199,', '3199');
INSERT INTO `xx_area` VALUES ('3204', '2014-05-15 00:57:14', '2014-05-15 00:57:14', null, '新疆维吾尔自治区塔城地区托里县', '托里县', ',3106,3199,', '3199');
INSERT INTO `xx_area` VALUES ('3205', '2014-05-15 00:57:15', '2014-05-15 00:57:15', null, '新疆维吾尔自治区塔城地区裕民县', '裕民县', ',3106,3199,', '3199');
INSERT INTO `xx_area` VALUES ('3206', '2014-05-15 00:57:16', '2014-05-15 00:57:16', null, '新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县', '和布克赛尔蒙古自治县', ',3106,3199,', '3199');
INSERT INTO `xx_area` VALUES ('3207', '2014-05-15 00:57:17', '2014-05-15 00:57:17', null, '新疆维吾尔自治区阿勒泰地区', '阿勒泰地区', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3208', '2014-05-15 00:57:18', '2014-05-15 00:57:18', null, '新疆维吾尔自治区阿勒泰地区阿勒泰市', '阿勒泰市', ',3106,3207,', '3207');
INSERT INTO `xx_area` VALUES ('3209', '2014-05-15 00:57:19', '2014-05-15 00:57:19', null, '新疆维吾尔自治区阿勒泰地区布尔津县', '布尔津县', ',3106,3207,', '3207');
INSERT INTO `xx_area` VALUES ('3210', '2014-05-15 00:57:20', '2014-05-15 00:57:20', null, '新疆维吾尔自治区阿勒泰地区富蕴县', '富蕴县', ',3106,3207,', '3207');
INSERT INTO `xx_area` VALUES ('3211', '2014-05-15 00:57:21', '2014-05-15 00:57:21', null, '新疆维吾尔自治区阿勒泰地区福海县', '福海县', ',3106,3207,', '3207');
INSERT INTO `xx_area` VALUES ('3212', '2014-05-15 00:57:22', '2014-05-15 00:57:22', null, '新疆维吾尔自治区阿勒泰地区哈巴河县', '哈巴河县', ',3106,3207,', '3207');
INSERT INTO `xx_area` VALUES ('3213', '2014-05-15 00:57:23', '2014-05-15 00:57:23', null, '新疆维吾尔自治区阿勒泰地区青河县', '青河县', ',3106,3207,', '3207');
INSERT INTO `xx_area` VALUES ('3214', '2014-05-15 00:57:24', '2014-05-15 00:57:24', null, '新疆维吾尔自治区阿勒泰地区吉木乃县', '吉木乃县', ',3106,3207,', '3207');
INSERT INTO `xx_area` VALUES ('3215', '2014-05-15 00:57:25', '2014-05-15 00:57:25', null, '新疆维吾尔自治区石河子市', '石河子市', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3216', '2014-05-15 00:57:26', '2014-05-15 00:57:26', null, '新疆维吾尔自治区阿拉尔市', '阿拉尔市', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3217', '2014-05-15 00:57:27', '2014-05-15 00:57:27', null, '新疆维吾尔自治区图木舒克市', '图木舒克市', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3218', '2014-05-15 00:57:28', '2014-05-15 00:57:28', null, '新疆维吾尔自治区五家渠市', '五家渠市', ',3106,', '3106');
INSERT INTO `xx_area` VALUES ('3219', '2014-05-15 00:57:29', '2014-05-15 00:57:29', null, '台湾省', '台湾省', ',', null);
INSERT INTO `xx_area` VALUES ('3220', '2014-05-15 00:57:30', '2014-05-15 00:57:30', null, '台湾省台北市', '台北市', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3221', '2014-05-15 00:57:31', '2014-05-15 00:57:31', null, '台湾省高雄市', '高雄市', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3222', '2014-05-15 00:57:32', '2014-05-15 00:57:32', null, '台湾省台南市', '台南市', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3223', '2014-05-15 00:57:33', '2014-05-15 00:57:33', null, '台湾省台中市', '台中市', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3224', '2014-05-15 00:57:34', '2014-05-15 00:57:34', null, '台湾省金门县', '金门县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3225', '2014-05-15 00:57:35', '2014-05-15 00:57:35', null, '台湾省南投县', '南投县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3226', '2014-05-15 00:57:36', '2014-05-15 00:57:36', null, '台湾省基隆市', '基隆市', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3227', '2014-05-15 00:57:37', '2014-05-15 00:57:37', null, '台湾省新竹市', '新竹市', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3228', '2014-05-15 00:57:38', '2014-05-15 00:57:38', null, '台湾省嘉义市', '嘉义市', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3229', '2014-05-15 00:57:39', '2014-05-15 00:57:39', null, '台湾省新北市', '新北市', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3230', '2014-05-15 00:57:40', '2014-05-15 00:57:40', null, '台湾省宜兰县', '宜兰县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3231', '2014-05-15 00:57:41', '2014-05-15 00:57:41', null, '台湾省新竹县', '新竹县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3232', '2014-05-15 00:57:42', '2014-05-15 00:57:42', null, '台湾省桃园县', '桃园县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3233', '2014-05-15 00:57:43', '2014-05-15 00:57:43', null, '台湾省苗栗县', '苗栗县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3234', '2014-05-15 00:57:44', '2014-05-15 00:57:44', null, '台湾省彰化县', '彰化县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3235', '2014-05-15 00:57:45', '2014-05-15 00:57:45', null, '台湾省嘉义县', '嘉义县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3236', '2014-05-15 00:57:46', '2014-05-15 00:57:46', null, '台湾省云林县', '云林县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3237', '2014-05-15 00:57:47', '2014-05-15 00:57:47', null, '台湾省屏东县', '屏东县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3238', '2014-05-15 00:57:48', '2014-05-15 00:57:48', null, '台湾省台东县', '台东县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3239', '2014-05-15 00:57:49', '2014-05-15 00:57:49', null, '台湾省花莲县', '花莲县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3240', '2014-05-15 00:57:50', '2014-05-15 00:57:50', null, '台湾省澎湖县', '澎湖县', ',3219,', '3219');
INSERT INTO `xx_area` VALUES ('3241', '2014-05-15 00:57:51', '2014-05-15 00:57:51', null, '台湾省台北市中正区', '中正区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3242', '2014-05-15 00:57:52', '2014-05-15 00:57:52', null, '台湾省台北市大同区', '大同区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3243', '2014-05-15 00:57:53', '2014-05-15 00:57:53', null, '台湾省台北市中山区', '中山区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3244', '2014-05-15 00:57:54', '2014-05-15 00:57:54', null, '台湾省台北市松山区', '松山区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3245', '2014-05-15 00:57:55', '2014-05-15 00:57:55', null, '台湾省台北市大安区', '大安区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3246', '2014-05-15 00:57:56', '2014-05-15 00:57:56', null, '台湾省台北市万华区', '万华区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3247', '2014-05-15 00:57:57', '2014-05-15 00:57:57', null, '台湾省台北市信义区', '信义区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3248', '2014-05-15 00:57:58', '2014-05-15 00:57:58', null, '台湾省台北市士林区', '士林区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3249', '2014-05-15 00:57:59', '2014-05-15 00:57:59', null, '台湾省台北市北投区', '北投区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3250', '2014-05-15 00:58:00', '2014-05-15 00:58:00', null, '台湾省台北市内湖区', '内湖区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3251', '2014-05-15 00:58:01', '2014-05-15 00:58:01', null, '台湾省台北市南港区', '南港区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3252', '2014-05-15 00:58:02', '2014-05-15 00:58:02', null, '台湾省台北市文山区', '文山区', ',3219,3220,', '3220');
INSERT INTO `xx_area` VALUES ('3253', '2014-05-15 00:58:03', '2014-05-15 00:58:03', null, '台湾省嘉义县东区', '东区', ',3219,3235,', '3235');
INSERT INTO `xx_area` VALUES ('3254', '2014-05-15 00:58:04', '2014-05-15 00:58:04', null, '台湾省嘉义县西区', '西区', ',3219,3235,', '3235');
INSERT INTO `xx_area` VALUES ('3255', '2014-05-15 00:58:05', '2014-05-15 00:58:05', null, '台湾省高雄市新兴区', '新兴区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3256', '2014-05-15 00:58:06', '2014-05-15 00:58:06', null, '台湾省高雄市前金区', '前金区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3257', '2014-05-15 00:58:07', '2014-05-15 00:58:07', null, '台湾省高雄市芩雅区', '芩雅区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3258', '2014-05-15 00:58:08', '2014-05-15 00:58:08', null, '台湾省高雄市盐埕区', '盐埕区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3259', '2014-05-15 00:58:09', '2014-05-15 00:58:09', null, '台湾省高雄市鼓山区', '鼓山区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3260', '2014-05-15 00:58:10', '2014-05-15 00:58:10', null, '台湾省高雄市旗津区', '旗津区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3261', '2014-05-15 00:58:11', '2014-05-15 00:58:11', null, '台湾省高雄市前镇区', '前镇区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3262', '2014-05-15 00:58:12', '2014-05-15 00:58:12', null, '台湾省高雄市三民区', '三民区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3263', '2014-05-15 00:58:13', '2014-05-15 00:58:13', null, '台湾省高雄市左营区', '左营区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3264', '2014-05-15 00:58:14', '2014-05-15 00:58:14', null, '台湾省高雄市楠梓区', '楠梓区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3265', '2014-05-15 00:58:15', '2014-05-15 00:58:15', null, '台湾省高雄市小港区', '小港区', ',3219,3221,', '3221');
INSERT INTO `xx_area` VALUES ('3266', '2014-05-15 00:58:16', '2014-05-15 00:58:16', null, '台湾省基隆市仁爱区', '仁爱区', ',3219,3226,', '3226');
INSERT INTO `xx_area` VALUES ('3267', '2014-05-15 00:58:17', '2014-05-15 00:58:17', null, '台湾省基隆市信义区', '信义区', ',3219,3226,', '3226');
INSERT INTO `xx_area` VALUES ('3268', '2014-05-15 00:58:18', '2014-05-15 00:58:18', null, '台湾省基隆市中正区', '中正区', ',3219,3226,', '3226');
INSERT INTO `xx_area` VALUES ('3269', '2014-05-15 00:58:19', '2014-05-15 00:58:19', null, '台湾省基隆市中山区', '中山区', ',3219,3226,', '3226');
INSERT INTO `xx_area` VALUES ('3270', '2014-05-15 00:58:20', '2014-05-15 00:58:20', null, '台湾省基隆市安乐区', '安乐区', ',3219,3226,', '3226');
INSERT INTO `xx_area` VALUES ('3271', '2014-05-15 00:58:21', '2014-05-15 00:58:21', null, '台湾省基隆市暖暖区', '暖暖区', ',3219,3226,', '3226');
INSERT INTO `xx_area` VALUES ('3272', '2014-05-15 00:58:22', '2014-05-15 00:58:22', null, '台湾省基隆市七堵区', '七堵区', ',3219,3226,', '3226');
INSERT INTO `xx_area` VALUES ('3273', '2014-05-15 00:58:23', '2014-05-15 00:58:23', null, '台湾省台南市中西区', '中西区', ',3219,3222,', '3222');
INSERT INTO `xx_area` VALUES ('3274', '2014-05-15 00:58:24', '2014-05-15 00:58:24', null, '台湾省台南市东区', '东区', ',3219,3222,', '3222');
INSERT INTO `xx_area` VALUES ('3275', '2014-05-15 00:58:25', '2014-05-15 00:58:25', null, '台湾省台南市南区', '南区', ',3219,3222,', '3222');
INSERT INTO `xx_area` VALUES ('3276', '2014-05-15 00:58:26', '2014-05-15 00:58:26', null, '台湾省台南市北区', '北区', ',3219,3222,', '3222');
INSERT INTO `xx_area` VALUES ('3277', '2014-05-15 00:58:27', '2014-05-15 00:58:27', null, '台湾省台南市安平区', '安平区', ',3219,3222,', '3222');
INSERT INTO `xx_area` VALUES ('3278', '2014-05-15 00:58:28', '2014-05-15 00:58:28', null, '台湾省台南市安南区', '安南区', ',3219,3222,', '3222');
INSERT INTO `xx_area` VALUES ('3279', '2014-05-15 00:58:29', '2014-05-15 00:58:29', null, '台湾省新竹市东区', '东区', ',3219,3227,', '3227');
INSERT INTO `xx_area` VALUES ('3280', '2014-05-15 00:58:30', '2014-05-15 00:58:30', null, '台湾省新竹市北区', '北区', ',3219,3227,', '3227');
INSERT INTO `xx_area` VALUES ('3281', '2014-05-15 00:58:31', '2014-05-15 00:58:31', null, '台湾省新竹市香山区', '香山区', ',3219,3227,', '3227');
INSERT INTO `xx_area` VALUES ('3282', '2014-05-15 00:58:32', '2014-05-15 00:58:32', null, '台湾省台中市中区', '中区', ',3219,3223,', '3223');
INSERT INTO `xx_area` VALUES ('3283', '2014-05-15 00:58:33', '2014-05-15 00:58:33', null, '台湾省台中市东区', '东区', ',3219,3223,', '3223');
INSERT INTO `xx_area` VALUES ('3284', '2014-05-15 00:58:34', '2014-05-15 00:58:34', null, '台湾省台中市南区', '南区', ',3219,3223,', '3223');
INSERT INTO `xx_area` VALUES ('3285', '2014-05-15 00:58:35', '2014-05-15 00:58:35', null, '台湾省台中市西区', '西区', ',3219,3223,', '3223');
INSERT INTO `xx_area` VALUES ('3286', '2014-05-15 00:58:36', '2014-05-15 00:58:36', null, '台湾省台中市北区', '北区', ',3219,3223,', '3223');
INSERT INTO `xx_area` VALUES ('3287', '2014-05-15 00:58:37', '2014-05-15 00:58:37', null, '台湾省台中市北屯区', '北屯区', ',3219,3223,', '3223');
INSERT INTO `xx_area` VALUES ('3288', '2014-05-15 00:58:38', '2014-05-15 00:58:38', null, '台湾省台中市西屯区', '西屯区', ',3219,3223,', '3223');
INSERT INTO `xx_area` VALUES ('3289', '2014-05-15 00:58:39', '2014-05-15 00:58:39', null, '台湾省台中市南屯区', '南屯区', ',3219,3223,', '3223');
INSERT INTO `xx_area` VALUES ('3290', '2014-05-15 00:58:40', '2014-05-15 00:58:40', null, '台湾省嘉义市东区', '东区', ',3219,3228,', '3228');
INSERT INTO `xx_area` VALUES ('3291', '2014-05-15 00:58:41', '2014-05-15 00:58:41', null, '台湾省嘉义市西区', '西区', ',3219,3228,', '3228');
INSERT INTO `xx_area` VALUES ('3292', '2014-05-15 00:58:42', '2014-05-15 00:58:42', null, '香港特别行政区', '香港特别行政区', ',', null);
INSERT INTO `xx_area` VALUES ('3293', '2014-05-15 00:58:43', '2014-05-15 00:58:43', null, '香港特别行政区香港岛', '香港岛', ',3292,', '3292');
INSERT INTO `xx_area` VALUES ('3294', '2014-05-15 00:58:44', '2014-05-15 00:58:44', null, '香港特别行政区九龙', '九龙', ',3292,', '3292');
INSERT INTO `xx_area` VALUES ('3295', '2014-05-15 00:58:45', '2014-05-15 00:58:45', null, '香港特别行政区新界', '新界', ',3292,', '3292');
INSERT INTO `xx_area` VALUES ('3296', '2014-05-15 00:58:46', '2014-05-15 00:58:46', null, '香港特别行政区九龙九龙城区', '九龙城区', ',3292,3294,', '3294');
INSERT INTO `xx_area` VALUES ('3297', '2014-05-15 00:58:47', '2014-05-15 00:58:47', null, '香港特别行政区九龙油尖旺区', '油尖旺区', ',3292,3294,', '3294');
INSERT INTO `xx_area` VALUES ('3298', '2014-05-15 00:58:48', '2014-05-15 00:58:48', null, '香港特别行政区九龙深水埗区', '深水埗区', ',3292,3294,', '3294');
INSERT INTO `xx_area` VALUES ('3299', '2014-05-15 00:58:49', '2014-05-15 00:58:49', null, '香港特别行政区九龙黄大仙区', '黄大仙区', ',3292,3294,', '3294');
INSERT INTO `xx_area` VALUES ('3300', '2014-05-15 00:58:50', '2014-05-15 00:58:50', null, '香港特别行政区九龙观塘区', '观塘区', ',3292,3294,', '3294');
INSERT INTO `xx_area` VALUES ('3301', '2014-05-15 00:58:51', '2014-05-15 00:58:51', null, '香港特别行政区香港岛中西区', '中西区', ',3292,3293,', '3293');
INSERT INTO `xx_area` VALUES ('3302', '2014-05-15 00:58:52', '2014-05-15 00:58:52', null, '香港特别行政区香港岛湾仔', '湾仔', ',3292,3293,', '3293');
INSERT INTO `xx_area` VALUES ('3303', '2014-05-15 00:58:53', '2014-05-15 00:58:53', null, '香港特别行政区香港岛东区', '东区', ',3292,3293,', '3293');
INSERT INTO `xx_area` VALUES ('3304', '2014-05-15 00:58:54', '2014-05-15 00:58:54', null, '香港特别行政区香港岛南区', '南区', ',3292,3293,', '3293');
INSERT INTO `xx_area` VALUES ('3305', '2014-05-15 00:58:55', '2014-05-15 00:58:55', null, '香港特别行政区新界北区', '北区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3306', '2014-05-15 00:58:56', '2014-05-15 00:58:56', null, '香港特别行政区新界大埔区', '大埔区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3307', '2014-05-15 00:58:57', '2014-05-15 00:58:57', null, '香港特别行政区新界沙田区', '沙田区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3308', '2014-05-15 00:58:58', '2014-05-15 00:58:58', null, '香港特别行政区新界西贡区', '西贡区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3309', '2014-05-15 00:58:59', '2014-05-15 00:58:59', null, '香港特别行政区新界元朗区', '元朗区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3310', '2014-05-15 00:59:00', '2014-05-15 00:59:00', null, '香港特别行政区新界屯门区', '屯门区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3311', '2014-05-15 00:59:01', '2014-05-15 00:59:01', null, '香港特别行政区新界荃湾区', '荃湾区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3312', '2014-05-15 00:59:02', '2014-05-15 00:59:02', null, '香港特别行政区新界葵青区', '葵青区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3313', '2014-05-15 00:59:03', '2014-05-15 00:59:03', null, '香港特别行政区新界离岛区', '离岛区', ',3292,3295,', '3295');
INSERT INTO `xx_area` VALUES ('3314', '2014-05-15 00:59:04', '2014-05-15 00:59:04', null, '澳门特别行政区', '澳门特别行政区', ',', null);
INSERT INTO `xx_area` VALUES ('3315', '2014-05-15 00:59:05', '2014-05-15 00:59:05', null, '澳门特别行政区澳门半岛', '澳门半岛', ',3314,', '3314');
INSERT INTO `xx_area` VALUES ('3316', '2014-05-15 00:59:06', '2014-05-15 00:59:06', null, '澳门特别行政区离岛', '离岛', ',3314,', '3314');

-- ----------------------------
-- Table structure for xx_article
-- ----------------------------
DROP TABLE IF EXISTS `xx_article`;
CREATE TABLE `xx_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` longtext,
  `hits` bigint(20) NOT NULL,
  `is_publication` bit(1) NOT NULL,
  `is_top` bit(1) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `article_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK636982B7CA3B1F7` (`article_category`),
  CONSTRAINT `FK636982B7CA3B1F7` FOREIGN KEY (`article_category`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article
-- ----------------------------
INSERT INTO `xx_article` VALUES ('1', '2014-05-15 00:00:57', '2015-03-10 21:01:08', null, '<p>\r\n	用户购物流程如下：\r\n</p>\r\n<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/8e486c07-1365-4fa7-bc62-a40340e0ba59.jpg\" />', '17', '', '\0', null, null, null, '购物流程', '3');
INSERT INTO `xx_article` VALUES ('20', '2014-05-15 00:01:16', '2014-05-15 00:01:16', null, '<p class=\"MsoNormal\">\r\n	<span> </span> \r\n</p>\r\n低价一站到底<br />\r\n<br />\r\n4月27日商城开启低价一站到底，一天三场万人抢购，服饰全场满1999减200，满999减100，品牌服装冲锋底价，更有全场满返现金券，部分品类满100就返30元现金券，更多惊喜，尽在4月27日开启！<br />', '2', '', '\0', null, null, null, '低价一站到底', '2');
INSERT INTO `xx_article` VALUES ('33', '2014-05-15 00:01:28', '2014-05-15 00:01:28', null, '<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 越来越多的70后、80后发现，身边的父母长辈开始聊网购了，甚至有不少人已经能在网上购物。在这一现象的背后，网购已经成为人们主流的消费方式和拉动经济增长的新引擎，国内零售业也由此进入了新旧经济模式转型的关键节点。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　在今年的全国两会上，还有不少50、60后代表饶有兴致地谈起网购经历。就连广大农村地区的居民也加入了电子商务大军，不少农民还扯条网线当上了“网商”，直接把家里的土特产卖到了全国各地。根据中国互联网络信息中心（CNNIC）发布的报告，截至2012年12月底，我国网络购物用户规模达到2.42亿。艾瑞咨询数据显示，2012年中国网络购物市场交易规模达1.3万亿元，在社会消费品总零售额的占比达到6.2%。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　在网购规模逐年扩大的同时，百货商场沦落为“试衣间”的趋势也越来越明显。就连年销售额400多亿、拥有银泰百货等金字招牌的银泰集团董事长沈国军也公开表示：“电子商务发展势不可挡，传统零售业务不变革的话是死路一条。”而在传统零售商尝试转型之前，不少制造商早已加入了网销大军。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	　　为此电商服务平台为创业者电商提供最好的服务，无论有无开网店的经验，电商服务平台的技术人员都会帮您实现，并将您培养成一名成功的创业者。省钱省力，上手迅速。一个完整的开网店过程：谋划网站功能--找电商服务平台签合同做网站，空间费，带宽费，域名费--网站开发费用--学习网店后台操作--开通支付功能--向网店上传商品--开始运作。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n　　企业尤其是传统企业想要做好电子商务，想要进军电子商务市场，想要在电子商务市场竞争中逆流而上，必要的电子商务力量与支持绝对不能少。', '2', '', '\0', null, null, null, '创业者电商 促进中国经济生活转型', '1');

-- ----------------------------
-- Table structure for xx_article_category
-- ----------------------------
DROP TABLE IF EXISTS `xx_article_category`;
CREATE TABLE `xx_article_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57108986F587647A` (`parent`),
  CONSTRAINT `FK57108986F587647A` FOREIGN KEY (`parent`) REFERENCES `xx_article_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article_category
-- ----------------------------
INSERT INTO `xx_article_category` VALUES ('1', '2014-05-15 00:00:50', '2014-05-15 00:00:50', '1', '0', '商城动态', null, null, null, ',', null);
INSERT INTO `xx_article_category` VALUES ('2', '2014-05-15 00:00:51', '2014-05-15 00:00:51', '2', '0', '活动促销', null, null, null, ',', null);
INSERT INTO `xx_article_category` VALUES ('3', '2014-05-15 00:00:52', '2014-05-15 00:00:52', '3', '0', '购物指南', null, null, null, ',', null);
INSERT INTO `xx_article_category` VALUES ('4', '2014-05-15 00:00:53', '2014-05-15 00:00:53', '4', '0', '支付方式', null, null, null, ',', null);
INSERT INTO `xx_article_category` VALUES ('5', '2014-05-15 00:00:54', '2014-05-15 00:00:54', '5', '0', '配送方式', null, null, null, ',', null);
INSERT INTO `xx_article_category` VALUES ('6', '2014-05-15 00:00:55', '2014-05-15 00:00:55', '6', '0', '售后服务', null, null, null, ',', null);
INSERT INTO `xx_article_category` VALUES ('7', '2014-05-15 00:00:56', '2014-05-15 00:00:56', '7', '0', '关于我们', null, null, null, ',', null);

-- ----------------------------
-- Table structure for xx_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `xx_article_tag`;
CREATE TABLE `xx_article_tag` (
  `articles` bigint(20) NOT NULL,
  `tags` bigint(20) NOT NULL,
  PRIMARY KEY (`articles`,`tags`),
  KEY `FKB9183E12C842716F` (`tags`),
  KEY `FKB9183E1229F6DEEF` (`articles`),
  CONSTRAINT `FKB9183E1229F6DEEF` FOREIGN KEY (`articles`) REFERENCES `xx_article` (`id`),
  CONSTRAINT `FKB9183E12C842716F` FOREIGN KEY (`tags`) REFERENCES `xx_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for xx_attribute
-- ----------------------------
DROP TABLE IF EXISTS `xx_attribute`;
CREATE TABLE `xx_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `property_index` int(11) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE81F41DD7629117` (`product_category`),
  CONSTRAINT `FKE81F41DD7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_attribute
-- ----------------------------
INSERT INTO `xx_attribute` VALUES ('68', '2014-06-29 18:59:13', '2014-06-29 18:59:13', '1', '属性1', '0', '79');
INSERT INTO `xx_attribute` VALUES ('69', '2014-06-29 19:05:34', '2014-06-29 19:05:34', '1', '商品属性', '0', '80');

-- ----------------------------
-- Table structure for xx_attribute_option
-- ----------------------------
DROP TABLE IF EXISTS `xx_attribute_option`;
CREATE TABLE `xx_attribute_option` (
  `attribute` bigint(20) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  KEY `FK96E026D75E1B95F4` (`attribute`),
  CONSTRAINT `FK96E026D75E1B95F4` FOREIGN KEY (`attribute`) REFERENCES `xx_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_attribute_option
-- ----------------------------
INSERT INTO `xx_attribute_option` VALUES ('68', '可选项');
INSERT INTO `xx_attribute_option` VALUES ('69', '属性可选项');

-- ----------------------------
-- Table structure for xx_brand
-- ----------------------------
DROP TABLE IF EXISTS `xx_brand`;
CREATE TABLE `xx_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `introduction` longtext,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_brand
-- ----------------------------

-- ----------------------------
-- Table structure for xx_cart
-- ----------------------------
DROP TABLE IF EXISTS `xx_cart`;
CREATE TABLE `xx_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `cart_key` varchar(255) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9E1A84FF7C62EDF8` (`member`),
  CONSTRAINT `FK9E1A84FF7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cart
-- ----------------------------
INSERT INTO `xx_cart` VALUES ('1', '2014-07-22 22:42:51', '2014-07-22 22:42:51', 'f1655017-dc43-4475-8d43-8c3d3e38a919ba3f85bc2e923986ce2e0a852d374ce5', null);

-- ----------------------------
-- Table structure for xx_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_cart_item`;
CREATE TABLE `xx_cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `cart` bigint(20) NOT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1A67F65339A23004` (`cart`),
  KEY `FK1A67F65379F8D99A` (`product`),
  CONSTRAINT `FK1A67F65339A23004` FOREIGN KEY (`cart`) REFERENCES `xx_cart` (`id`),
  CONSTRAINT `FK1A67F65379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_cart_item
-- ----------------------------

-- ----------------------------
-- Table structure for xx_consultation
-- ----------------------------
DROP TABLE IF EXISTS `xx_consultation`;
CREATE TABLE `xx_consultation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_show` bit(1) NOT NULL,
  `for_consultation` bigint(20) DEFAULT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33228D687C62EDF8` (`member`),
  KEY `FK33228D68366B868C` (`for_consultation`),
  KEY `FK33228D6879F8D99A` (`product`),
  CONSTRAINT `FK33228D68366B868C` FOREIGN KEY (`for_consultation`) REFERENCES `xx_consultation` (`id`),
  CONSTRAINT `FK33228D6879F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK33228D687C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_consultation
-- ----------------------------

-- ----------------------------
-- Table structure for xx_coupon
-- ----------------------------
DROP TABLE IF EXISTS `xx_coupon`;
CREATE TABLE `xx_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `introduction` longtext,
  `is_enabled` bit(1) NOT NULL,
  `is_exchange` bit(1) NOT NULL,
  `maximum_price` decimal(21,6) DEFAULT NULL,
  `maximum_quantity` int(11) DEFAULT NULL,
  `minimum_price` decimal(21,6) DEFAULT NULL,
  `minimum_quantity` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `point` bigint(20) DEFAULT NULL,
  `prefix` varchar(255) NOT NULL,
  `price_expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for xx_coupon_code
-- ----------------------------
DROP TABLE IF EXISTS `xx_coupon_code`;
CREATE TABLE `xx_coupon_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `code` varchar(100) NOT NULL,
  `is_used` bit(1) NOT NULL,
  `used_date` datetime DEFAULT NULL,
  `coupon` bigint(20) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FKEF53A3A77C62EDF8` (`member`),
  KEY `FKEF53A3A75B638910` (`coupon`),
  CONSTRAINT `FKEF53A3A75B638910` FOREIGN KEY (`coupon`) REFERENCES `xx_coupon` (`id`),
  CONSTRAINT `FKEF53A3A77C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_coupon_code
-- ----------------------------

-- ----------------------------
-- Table structure for xx_delivery_center
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_center`;
CREATE TABLE `xx_delivery_center` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK18EB77C139A0DADE` (`area`),
  CONSTRAINT `FK18EB77C139A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_delivery_center
-- ----------------------------
INSERT INTO `xx_delivery_center` VALUES ('1', '2014-05-15 00:00:15', '2014-05-15 00:00:15', '新建安天坛东路888号', '北京市东城区', '李小明', '\0', null, '13888888888', '北京发货中心', '010-88888888', '100062', '2');
INSERT INTO `xx_delivery_center` VALUES ('2', '2017-02-14 20:22:59', '2017-02-14 20:23:16', '321', '北京市', '123', '', '123', '123', '123', '123', '123', '1');

-- ----------------------------
-- Table structure for xx_delivery_corp
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_corp`;
CREATE TABLE `xx_delivery_corp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_delivery_corp
-- ----------------------------
INSERT INTO `xx_delivery_corp` VALUES ('1', '2014-05-15 00:00:01', '2014-05-15 00:00:01', '1', 'yuantong', '圆通速递', 'http://www.yto.net.cn');
INSERT INTO `xx_delivery_corp` VALUES ('2', '2014-05-15 00:00:02', '2014-05-15 00:00:02', '2', 'shentong', '申通快递', 'http://www.sto.cn');
INSERT INTO `xx_delivery_corp` VALUES ('3', '2014-05-15 00:00:03', '2014-05-15 00:00:03', '3', 'yunda', '韵达快运', 'http://www.yundaex.com');
INSERT INTO `xx_delivery_corp` VALUES ('4', '2014-05-15 00:00:04', '2014-05-15 00:00:04', '4', 'shunfeng', '顺丰速递', 'http://www.sf-express.com');

-- ----------------------------
-- Table structure for xx_delivery_template
-- ----------------------------
DROP TABLE IF EXISTS `xx_delivery_template`;
CREATE TABLE `xx_delivery_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `background` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `height` int(11) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `offsetx` int(11) NOT NULL,
  `offsety` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_delivery_template
-- ----------------------------
INSERT INTO `xx_delivery_template` VALUES ('1', '2014-05-15 00:00:16', '2014-05-15 00:00:16', 'http://storage.shopxx.net/demo-image/3.0/delivery_template/yto.png', '<DIV class=item style=\"Z-INDEX: 10; LEFT: 102px; TOP: 127px\"><PRE>${deliveryCenter.name}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 9; LEFT: 103px; TOP: 98px\"><PRE>${deliveryCenter.contact}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 11; LEFT: 102px; TOP: 164px\"><PRE>${deliveryCenter.areaName}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 3; LEFT: 116px; TOP: 227px\"><PRE>${deliveryCenter.mobile}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 5; LEFT: 278px; TOP: 227px\"><PRE>${deliveryCenter.phone}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=\"item selected\" style=\"Z-INDEX: 7; LEFT: 459px; TOP: 113px\"><PRE>${order.consignee}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 10; LEFT: 455px; TOP: 171px\"><PRE>${order.areaName}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 15; LEFT: 408px; TOP: 203px\"><PRE>${order.address}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 1; LEFT: 50px; TOP: 198px\"><PRE>${deliveryCenter.address}</PRE>\r\n<DIV class=resize></DIV></DIV>\r\n<DIV class=item style=\"Z-INDEX: 18; LEFT: 501px; TOP: 226px\"><PRE>${order.phone}</PRE>\r\n<DIV class=resize></DIV></DIV>', '483', '', null, '圆通快递', '0', '0', '800');

-- ----------------------------
-- Table structure for xx_deposit
-- ----------------------------
DROP TABLE IF EXISTS `xx_deposit`;
CREATE TABLE `xx_deposit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `balance` decimal(21,6) NOT NULL,
  `credit` decimal(21,6) NOT NULL,
  `debit` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `member` bigint(20) NOT NULL,
  `orders` bigint(20) DEFAULT NULL,
  `payment` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEBB7CC5F7C62EDF8` (`member`),
  KEY `FKEBB7CC5F4115A3C8` (`payment`),
  KEY `FKEBB7CC5FB992E8EF` (`orders`),
  CONSTRAINT `FKEBB7CC5F4115A3C8` FOREIGN KEY (`payment`) REFERENCES `xx_payment` (`id`),
  CONSTRAINT `FKEBB7CC5F7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FKEBB7CC5FB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_deposit
-- ----------------------------

-- ----------------------------
-- Table structure for xx_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `xx_friend_link`;
CREATE TABLE `xx_friend_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_friend_link
-- ----------------------------
INSERT INTO `xx_friend_link` VALUES ('3', '2014-05-15 00:00:39', '2014-05-15 00:00:39', '3', 'http://storage.shopxx.net/demo-image/3.0/friend_link/alipay.gif', '支付宝', '1', 'http://www.alipay.com');
INSERT INTO `xx_friend_link` VALUES ('4', '2014-05-15 00:00:40', '2014-05-15 00:00:40', '4', 'http://storage.shopxx.net/demo-image/3.0/friend_link/tenpay.gif', '财付通', '1', 'http://www.tenpay.com');
INSERT INTO `xx_friend_link` VALUES ('5', '2014-05-15 00:00:41', '2014-05-15 00:00:41', '5', 'http://storage.shopxx.net/demo-image/3.0/friend_link/chinapay.gif', '银联在线', '1', 'http://www.chinapay.com');
INSERT INTO `xx_friend_link` VALUES ('6', '2014-05-15 00:00:42', '2014-05-15 00:00:42', '6', 'http://storage.shopxx.net/demo-image/3.0/friend_link/99bill.gif', '快钱支付', '1', 'http://www.99bill.com');
INSERT INTO `xx_friend_link` VALUES ('8', '2014-05-15 00:00:44', '2014-05-15 00:00:44', '8', 'http://storage.shopxx.net/demo-image/3.0/friend_link/kuaidi100.gif', '快递100', '1', 'http://www.kuaidi100.com');
INSERT INTO `xx_friend_link` VALUES ('9', '2014-05-15 00:00:45', '2014-05-15 00:00:45', '9', 'http://storage.shopxx.net/demo-image/3.0/friend_link/cnzz.gif', '站长统计', '1', 'http://www.cnzz.com');

-- ----------------------------
-- Table structure for xx_gift_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_gift_item`;
CREATE TABLE `xx_gift_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `gift` bigint(20) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gift` (`gift`,`promotion`),
  KEY `FK2FB85243FD463A02` (`promotion`),
  KEY `FK2FB852438C9B75DB` (`gift`),
  CONSTRAINT `FK2FB852438C9B75DB` FOREIGN KEY (`gift`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK2FB85243FD463A02` FOREIGN KEY (`promotion`) REFERENCES `xx_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_gift_item
-- ----------------------------

-- ----------------------------
-- Table structure for xx_goods
-- ----------------------------
DROP TABLE IF EXISTS `xx_goods`;
CREATE TABLE `xx_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_goods
-- ----------------------------
INSERT INTO `xx_goods` VALUES ('336', '2014-07-07 11:52:17', '2014-07-07 11:52:17');
INSERT INTO `xx_goods` VALUES ('340', '2014-07-07 11:52:17', '2014-07-07 11:52:17');
INSERT INTO `xx_goods` VALUES ('358', '2014-07-07 11:52:17', '2014-07-07 11:52:17');
INSERT INTO `xx_goods` VALUES ('372', '2014-07-07 11:56:42', '2014-07-07 11:56:42');
INSERT INTO `xx_goods` VALUES ('373', '2014-07-07 11:56:42', '2014-07-07 11:56:42');
INSERT INTO `xx_goods` VALUES ('391', '2014-07-07 11:56:42', '2014-07-07 11:56:42');
INSERT INTO `xx_goods` VALUES ('405', '2014-07-08 18:38:12', '2014-07-08 18:38:12');

-- ----------------------------
-- Table structure for xx_log
-- ----------------------------
DROP TABLE IF EXISTS `xx_log`;
CREATE TABLE `xx_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext,
  `ip` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `parameter` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_log
-- ----------------------------
INSERT INTO `xx_log` VALUES ('87', '2015-03-10 22:26:51', '2015-03-10 22:26:51', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nparameter_203 = \nparameter_202 = \nbrandId = \nparameter_201 = \nparameter_200 = \n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/T恤/T1fTNaFKpbXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/T恤/T1fTNaFKpbXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nproductImages[0].title = \nsn = T356--宝华500_P20.00\nparameter_199 = \nparameter_198 = \nparameter_197 = \nparameter_196 = \nproductImages[0].order = \nparameter_195 = \nparameter_194 = \nimage = \nisMarketable = true\nparameter_193 = \nparameter_192 = \nparameter_191 = \nparameter_190 = \ncost = 20\nparameter_204 = \nparameter_205 = \n_isTop = false\nparameter_206 = \nprice = 30\nparameter_207 = \nparameter_208 = \nintroduction = <p><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/736780939/T2Di1dXKFaXXXXXXXX-736780939.jpg><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/736780939/T2a.1dXHxaXXXXXXXX-736780939.jpg><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/736780939/T20BidXJRaXXXXXXXX-736780939.jpg></p><p>&nbsp;</p><p><img align=absMiddle src=http://img01.taobaocdn.com/imgextra/i1/736780939/T2n6udXKBaXXXXXXXX-736780939.jpg><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/736780939/T29b1fXM0XXXXXXXXX-736780939.jpg><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/736780939/T28KmfXMRXXXXXXXXX-736780939.jpg></p><p>&nbsp;</p><p><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/736780939/T2561dXKlaXXXXXXXX-736780939.jpg><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/736780939/T2j5WfXK8XXXXXXXXX-736780939.jpg><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/736780939/T2S7qdXIXaXXXXXXXX-736780939.jpg><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/736780939/T2CA5dXJVaXXXXXXXX-736780939.jpg></p>\nproductCategoryId = 81\nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/T恤/T1fTNaFKpbXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nid = 1041\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = T356#模特实拍 夏装新款老鹰印花V领宽松短袖t恤女韩版夏\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/T恤/T1fTNaFKpbXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 36\nkeyword = \nunit = 件\npoint = 30\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('88', '2015-03-10 22:27:05', '2015-03-10 22:27:05', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nparameter_203 = \nparameter_202 = \nbrandId = \nparameter_201 = \nparameter_200 = \n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/T恤/T18MG5FyJaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/T恤/T18MG5FyJaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nproductImages[0].title = \nsn = 217#--富丽C3012_P10.00\nparameter_199 = \nparameter_198 = \nparameter_197 = \nparameter_196 = \nproductImages[0].order = \nparameter_195 = \nparameter_194 = \nimage = \nisMarketable = true\nparameter_193 = \nparameter_192 = \nparameter_191 = \nparameter_190 = \ncost = 10\nparameter_204 = \nparameter_205 = \n_isTop = false\nparameter_206 = \nprice = 20\nparameter_207 = \nparameter_208 = \nintroduction = <p><img align=absmiddle src=http://img03.taobaocdn.com/imgextra/i3/808851672/T2R36IXBBXXXXXXXXX-808851672.jpg><img align=absmiddle src=http://img03.taobaocdn.com/imgextra/i3/808851672/T2ns2HXzJaXXXXXXXX-808851672.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><strong><span style=color: #ff0000;><strong>◆</strong>面料<strong><span style=color: #ff0000;>：棉质</span></strong></span></strong></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><strong><span style=color: #ff0000;><strong><span style=color: #ff0000;></span></strong></span></strong><strong><span style=color: #ff0000;>◆洗涤建议：建议手洗</span></strong></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #000000;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><strong><span style=color: #ff0000;></span></strong></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><strong><span style=color: #ff0000;><strong>◆标牌：有标（介意慎拍）</strong></span></strong></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><strong><span style=color: #ff0000;>◆注意：网购均有色差 不能接受微小色 差者慎重</span></strong><strong><span style=color: #ff0000;>小店不承担因色差问题产生的退换 鞠躬敬谢</span></strong></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><strong><span style=color: #ff0000;>◆平铺尺寸:（手工测量，有-3cm误差 单位：cm）</span></strong></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><span style=font-size: 14.0px;><span style=color: #000000;><span style=line-height: 21.0px;>长67 &nbsp; 肩宽48 &nbsp; 胸围96 &nbsp; 袖长18</span></span></span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><span style=font-size: 14.0px;><span style=color: #000000;><span style=line-height: 21.0px;></span></span></span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><span style=font-size: 14.0px;><span style=color: #000000;><span style=line-height: 21.0px;></span></span></span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=absmiddle src=http://img03.taobaocdn.com/imgextra/i3/808851672/T2EOEaXzlXXXXXXXXX-808851672.jpg></p>\nproductCategoryId = 81\nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/T恤/T18MG5FyJaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nid = 1036\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 217#韩国ulzzang 时尚学院风小汽车字母印花百搭宽松短袖T恤\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/T恤/T18MG5FyJaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 18\nkeyword = \nunit = 件\npoint = 20\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('89', '2015-03-10 23:11:11', '2015-03-10 23:11:11', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T14tlOXA8hXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T14tlOXA8hXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 9007--富丽B2011_P23.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 23\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 33\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p>&nbsp;</p><table align=center border=0 cellpadding=0 cellspacing=0 width=750><tr><td height=92 valign=top><img alt= height=90 style=margin: 0.0px;float: none; width=750 src=http://img03.taobaocdn.com/imgextra/i3/120122963/T2dtp3XCRaXXXXXXXX-120122963.jpg><a target=_blank></a></td></tr></table><table align=center border=0 cellpadding=0 cellspacing=0 width=750><tr><td height=8></td></tr></table><table align=center border=0 cellpadding=0 cellspacing=0 width=750><tr><td height=69><img height=131 width=750 src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2k3D3XvRXXXXXXXXX_!!120122963.jpg></td></tr></table><table align=center border=0 cellpadding=0 cellspacing=0 width=750><tr><td valign=top width=421><table border=0 cellpadding=0 cellspacing=0 height=412 width=408><tr><td height=50 valign=top width=408><span style=font-size: 12.0px;><img alt= height=43 width=412 src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2q1D3XwlXXXXXXXXX-120122963.jpg></span></td></tr><tr><td height=140 valign=top><table border=0 cellpadding=0 cellspacing=0 height=168 width=100%><tr><td width=9%><span style=font-size: 12.0px;></span></td><td align=left width=91%><table border=0 cellpadding=0 cellspacing=0 height=153 width=100%><tr><td align=left height=30 width=21%><span style=font-size: 12.0px;>宝贝编号：</span></td><td align=left height=30 width=79%><span style=font-size: 12.0px;line-height: 18.0px;>FL-9007</span></td></tr><tr><td align=left height=30><span style=font-size: 12.0px;>关于面料：</span></td><td align=left height=30><span style=font-size: 12.0px;>涤纶斜纹料！</span></td></tr><tr><td align=left height=30><span style=font-size: 12.0px;>颜色选择：</span></td><td align=left height=30><span style=font-size: 12.0px;line-height: 18.0px;>卡其色 深蓝色</span></td></tr><tr><td align=left height=30><span style=font-size: 12.0px;>号码选择：</span></td><td align=left height=30><span style=font-size: 12.0px;>S M L XL 2XL 3XL 【0.180KG】</span></td></tr></table></td></tr></table></td></tr><tr><td height=194 valign=bottom><table align=center border=0 cellpadding=0 cellspacing=0 height=111 width=90%><tr><td align=center height=64><table border=0 cellpadding=0 cellspacing=0 width=165><tr><td align=left height=30><img height=23 width=60 src=http://img04.taobaocdn.com/imgextra/i4/120122963/T28Qf2Xt4aXXXXXXXX_!!120122963.jpg></td></tr><tr><td height=19><table align=center border=0 cellpadding=0 cellspacing=0 height=19 width=158><tr><td background=http://img01.taobaocdn.com/imgextra/i1/120122963/T2w.H4XqlXXXXXXXXX_!!120122963.jpg><table border=0 cellpadding=0 cellspacing=0 width=158><tr><td align=center width=32></td><td align=center width=31></td><td align=center width=31><img height=14 style=width: 14.0px;height: 13.0px; width=14 src=http://img04.taobaocdn.com/imgextra/i4/120122963/T2ntn4XtRXXXXXXXXX_!!120122963.jpg></td><td align=center width=31><br></td><td align=center></td></tr></table></td></tr></table></td></tr><tr><td height=28><span style=font-size: 12.0px;>紧身 修型 合身 宽松 肥大</span></td></tr></table></td><td align=center><table border=0 cellpadding=0 cellspacing=0 width=165><tr><td align=left height=30><span><span style=font-size: 12.0px;><img height=23 width=60 src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2hvz3XydXXXXXXXXX_!!120122963.jpg></span></span></td></tr><tr><td height=19><table align=center border=0 cellpadding=0 cellspacing=0 height=19 width=158><tr><td background=http://img01.taobaocdn.com/imgextra/i1/120122963/T2w.H4XqlXXXXXXXXX_!!120122963.jpg><table border=0 cellpadding=0 cellspacing=0 width=158><tr><td align=center width=32><img height=14 style=line-height: 18.0px;font-size: 12.0px; width=14 src=http://img04.taobaocdn.com/imgextra/i4/120122963/T2ntn4XtRXXXXXXXXX_!!120122963.jpg></td><td align=center width=31><span><span style=font-size: 12.0px;></span></span></td><td align=center width=31></td><td align=center width=31><span><span style=font-size: 12.0px;></span></span></td><td align=center></td></tr></table></td></tr></table></td></tr><tr><td height=28><span style=font-size: 12.0px;>无弹 微弹 中弹 高弹 超弹</span></td></tr></table></td></tr><tr><td align=center height=47><table border=0 cellpadding=0 cellspacing=0 width=165><tr><td align=left height=30><img height=23 width=60 src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2XUv2Xu0aXXXXXXXX_!!120122963.jpg></td></tr><tr><td height=19><table align=center border=0 cellpadding=0 cellspacing=0 height=19 width=158><tr><td background=http://img01.taobaocdn.com/imgextra/i1/120122963/T2w.H4XqlXXXXXXXXX_!!120122963.jpg><table border=0 cellpadding=0 cellspacing=0 width=158><tr><td align=center width=32></td><td align=center width=31><img height=14 width=14 src=http://img04.taobaocdn.com/imgextra/i4/120122963/T2ntn4XtRXXXXXXXXX_!!120122963.jpg></td><td align=center width=31>&nbsp;</td><td align=center width=31></td><td align=center></td></tr></table></td></tr></table></td></tr><tr><td height=28><span style=font-size: 12.0px;>较透 偏薄 适中 偏厚 加厚</span></td></tr></table></td><td align=center><table border=0 cellpadding=0 cellspacing=0 width=165><tr><td align=left height=30><img height=23 width=60 src=http://img04.taobaocdn.com/imgextra/i4/120122963/T2GAb2XAXXXXXXXXXX_!!120122963.jpg></td></tr><tr><td height=19><table align=center border=0 cellpadding=0 cellspacing=0 height=19 width=158><tr><td background=http://img01.taobaocdn.com/imgextra/i1/120122963/T2w.H4XqlXXXXXXXXX_!!120122963.jpg><table border=0 cellpadding=0 cellspacing=0 width=158><tr><td align=center width=32></td><td align=center width=31><img height=14 width=14 src=http://img04.taobaocdn.com/imgextra/i4/120122963/T2ntn4XtRXXXXXXXXX_!!120122963.jpg></td><td align=center width=31>&nbsp;</td><td align=center width=31></td><td align=center></td></tr></table></td></tr></table></td></tr><tr><td height=28><span style=font-size: 12.0px;>软 偏软 适中 偏硬 硬</span></td></tr></table></td></tr></table></td></tr></table></td><td align=center width=329><img height=380 style=height: 400.0px;width: 310.0px;float: none;margin: 0.0px; width=310 src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2T9mdXH0XXXXXXXXX-120122963.jpg></td></tr></table><table align=center border=0 cellpadding=0 cellspacing=0 width=750><tr><td height=20></td></tr></table><table align=center border=1 bordercolor=#cccccc cellpadding=0 cellspacing=0 height=250 width=746><tr><td align=center bgcolor=#cccccc colspan=8 height=38 valign=middle><span style=color: #ffffff;><span style=font-size: 14.0px;><font color=#000000><strong>尺码信息<span style=font-size: 10.0px;>▲▲</span></strong><span style=font-size: 8.0px;>ABOUT SIZE</span></font></span></span></td></tr><tr><td align=center bgcolor=#ffffff height=23 valign=middle><span style=color: #666666;><span style=font-size: 12.0px;>尺码</span></span></td><td align=center bgcolor=#ffffff height=23 valign=middle><span style=color: #666666;><span style=font-size: 12.0px;>腰围</span></span></td><td align=center bgcolor=#ffffff height=23 valign=middle><span style=color: #666666;><span style=font-size: 12.0px;>臀围</span></span></td><td align=center bgcolor=#ffffff height=23 valign=middle><span style=color: #666666;><span style=font-size: 12.0px;>前档</span></span></td><td align=center bgcolor=#ffffff height=23 valign=middle><span style=color: #666666;><span style=font-size: 12.0px;>后档</span></span></td><td align=center bgcolor=#ffffff height=23 valign=middle><span style=color: #666666;><span style=font-size: 12.0px;>裤脚围</span></span></td><td align=center bgcolor=#ffffff height=23 valign=middle><span style=color: #666666;><span style=font-size: 12.0px;>裤长</span></span></td></tr><tr><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>S码</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>60-70cm</span></span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>98cm</span></span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>23.5cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>32.5cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>54cm</span></span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>30cm</span></span></td></tr><tr><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>M码</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>64-74cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>102cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>24cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>33cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>56cm</span></span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>31cm</span></span></td></tr><tr><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>L码</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>68-78cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>106cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>24.5cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>33.5cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>58cm</span></span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>32cm</span></span></td></tr><tr><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>XL码</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>72-82cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>110cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>25cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>34cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>60cm</span></span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>33cm</span></span></td></tr><tr><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>2XL码</span></span></span><br></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>76-86cm</span></span></span><br></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>114cm</span></span></span><br></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>26cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>35cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>62cm</span></span></span><br></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;><span style=line-height: 18.0px;>34cm</span></span></span></td></tr><tr><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>3XL码</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>80-90cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>118cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>27cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>36cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>64cm</span></span></td><td align=center height=23 valign=middle><span style=color: #000000;><span style=font-size: 10.0px;>35cm</span></span></td></tr><tr><td align=center bgcolor=#cccccc colspan=8 height=30 valign=middle><span style=color: #000000;><strong><span style=font-size: 14.0px;>备注<span style=font-size: 10.0px;>▲▲</span></span></strong><span style=font-size: 14.0px;><span style=font-size: 8.0px;>MUST READ</span></span></span></td></tr><tr><td align=center colspan=8 height=32 valign=middle><div align=left><span style=text-align: left;>1、因不同的计量方法，测量允许2-3cm内误差，此种状况并非质量问题。<br>2、衣服的颜色因灯光的原因可能会与原来的原色有所区别，单品以实物为准。</span></div></td></tr></table><p style=text-align: center;>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style=font-size: 18.0px;>拥有光泽度的西装面料，</span></p><p align=center><span style=font-size: 18.0px;><span>突显上质的时尚质感，</span></span></p><p align=center><span style=font-size: 18.0px;><span>裤管反折更显轻閒自在，</span></span></p><p align=center><span style=font-size: 18.0px;><span>繫上蝴蝶结腰带，</span></span></p><p align=center><span style=font-size: 18.0px;><span>增加整体造型感，</span></span></p><p align=center><span style=font-size: 18.0px;><span>简约中不失专业形象。</span></span></p><p align=center><span style=font-size: 18.0px;><span>醒您：釦可开，拉鍊可开，腰围鬆紧，口袋前真后假</span></span></p><p align=center><span style=font-size: 18.0px;><span>皮带全长约48.5吋，打洞处为27.5-44.5吋</span></span></p><p align=center><span style=font-size: 18.0px;><span>臀围非弹性范围，为平放至褶皱约略撑开测量</span></span></p><p align=center><span style=font-size: 18.0px;><span>建议单独洗涤，手洗或放洗衣袋洗最佳喔(勿用热水)</span></span></p><p align=center><br><img src=http://img03.taobaocdn.com/imgextra/i3/120122963/T2T7ycXN8XXXXXXXXX-120122963.jpg></p><p align=center><img src=http://img01.taobaocdn.com/imgextra/i1/120122963/T2K1qaXMFaXXXXXXXX-120122963.jpg></p><p align=center><br><img src=http://img01.taobaocdn.com/imgextra/i1/120122963/T2BRKcXOJXXXXXXXXX-120122963.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/120122963/T2IhycXONXXXXXXXXX-120122963.jpg><br><img src=http://img01.taobaocdn.com/imgextra/i1/120122963/T28F5bXM0aXXXXXXXX-120122963.jpg><br><img src=http://img01.taobaocdn.com/imgextra/i1/120122963/T26KqcXQ4XXXXXXXXX-120122963.jpg><br><img src=http://img01.taobaocdn.com/imgextra/i1/120122963/T2c_KcXLJXXXXXXXXX-120122963.jpg><br><img src=http://img01.taobaocdn.com/imgextra/i1/120122963/T2t01dXIXXXXXXXXXX-120122963.jpg><br><img src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2vO1cXPRXXXXXXXXX-120122963.jpg><br><img src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2k1OcXQVXXXXXXXXX-120122963.jpg><br><img src=http://img04.taobaocdn.com/imgextra/i4/120122963/T2Q2WcXRdXXXXXXXXX-120122963.jpg><br><img src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2B6mbXGJaXXXXXXXX-120122963.jpg></p><p align=center><img src=http://img01.taobaocdn.com/imgextra/i1/120122963/T2K4WcXQlXXXXXXXXX-120122963.jpg></p><p align=center><img src=http://img04.taobaocdn.com/imgextra/i4/120122963/T2GZGdXKtXXXXXXXXX-120122963.jpg></p><p align=center><img src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2JFScXSpXXXXXXXXX-120122963.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/120122963/T2rvydXJVXXXXXXXXX-120122963.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/120122963/T2msCcXR0XXXXXXXXX-120122963.jpg><br><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/120122963/T2bk5bXGBaXXXXXXXX-120122963.jpg><br><img src=http://img02.taobaocdn.com/imgextra/i2/120122963/T2PBOcXOXXXXXXXXXX-120122963.jpg></p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T14tlOXA8hXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1229\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 现货!9007#新款韩版女西装短裤夏装 大码短裤热裤胖mm显瘦短裤\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T14tlOXA8hXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 41.4\nparameter_175 = \nkeyword = \nunit = 件\npoint = 33\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('90', '2015-03-10 23:11:17', '2015-03-10 23:11:17', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1LX2kXhFbXXbQtXE__075218.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1LX2kXhFbXXbQtXE__075218.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 17--女人街C312_P39.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 39\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 49\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p style=text-align: center;><br>&nbsp;</p><p style=text-align: center;><img src=http://img02.taobaocdn.com/imgextra/i2/828818366/TB2q2GrXVXXXXcUXXXXXXXXXXXX_!!828818366.jpg><br><br><img src=http://img02.taobaocdn.com/imgextra/i2/828818366/TB2br5iXVXXXXXQXpXXXXXXXXXX_!!828818366.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/828818366/TB2L6OsXVXXXXXuXXXXXXXXXXXX_!!828818366.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/828818366/TB2bkGsXVXXXXa2XXXXXXXXXXXX_!!828818366.jpg><br><br><img src=http://img02.taobaocdn.com/imgextra/i2/828818366/TB2NJusXVXXXXbDXXXXXXXXXXXX_!!828818366.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/828818366/TB24FqqXVXXXXXUXpXXXXXXXXXX_!!828818366.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/828818366/TB2gSylXVXXXXaEXpXXXXXXXXXX_!!828818366.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/828818366/TB2etGsXVXXXXa4XXXXXXXXXXXX_!!828818366.jpg><br><br></p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1LX2kXhFbXXbQtXE__075218.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1230\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 2014韩版夏装新款森女糖果拼接雪纺衫休闲短裤上下套装女 017\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1LX2kXhFbXXbQtXE__075218.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 70.2\nparameter_175 = \nkeyword = \nunit = 件\npoint = 49\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('91', '2015-03-10 23:11:23', '2015-03-10 23:11:23', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1SZ5PXAxdXXXXXXXX_!!1-item_pic.gif_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1SZ5PXAxdXXXXXXXX_!!1-item_pic.gif_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 0--富丽B2033-1_P15.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 15\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 25\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p align=center><strong>【友情小提示】</strong></p><p align=center><strong>（由于显示器不同，各台电脑显示出的图片颜色也许与实物会稍有不同 ）</strong></p><p align=center><strong>（我们已尽量调到最接近，还是请买家购买前请有心理准备 ）</strong></p><p align=center><strong>请不要根据图片想象衣服面料，大小等实际情况，购买前请仔细阅读宝贝描述。</strong></p><span style=color: #ff0000;><span style=font-size: 36.0px;><font color=#000000 size=5><p align=center>【面料】棉混纺</p><p align=center>【尺码】S M L XL</p><p align=center>S&nbsp; 裤长：32&nbsp; 腰围：70 </p><p align=center>M&nbsp; 裤长：32&nbsp; 腰围：74</p><p align=center>L&nbsp; 裤长：33&nbsp; 腰围：76</p><p align=center>XL&nbsp; 裤长：33&nbsp; 腰围：78</p></font></span></span><p align=center><img border=0 src=http://cnc13.kabiqi.com//pic/2012/2/13/Fangji/6355-11.jpg></p><p align=center><img border=0 src=http://cnc13.kabiqi.com//pic/2012/2/13/Fangji/6355-12.jpg></p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1SZ5PXAxdXXXXXXXX_!!1-item_pic.gif_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1231\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 6355#2014夏季新款女 韩版大码显瘦中腰短裤女裤休闲裤(带腰带)\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1SZ5PXAxdXXXXXXXX_!!1-item_pic.gif_460x460.jpg\n_isMarketable = false\nmarketPrice = 27\nparameter_175 = \nkeyword = \nunit = 件\npoint = 25\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('92', '2015-03-10 23:11:31', '2015-03-10 23:11:31', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1lqmHXydhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1lqmHXydhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 8101#--富丽D4070_P18.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 18\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 28\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p style=margin: 0.0cm 0.0cm 0.0pt;><font face=宋体><b><span style=background: white;color: red;font-size: 15.0pt;></span></b></font></p><p style=margin: 0.0cm 0.0cm 0.0pt;><font face=宋体><b><span style=background: white;color: red;font-size: 15.0pt;><b><span style=color: blue;font-size: 13.5pt;>MM</span></b><b><span style=color: blue;font-size: 13.5pt;>们，有模特身上的配套雪纺衫哦</span></b><span style=font-family: tahoma;background: white;color: #404040;></span></span></b></font></p><p style=margin: 0.0cm 0.0cm 0.0pt;><span><font face=宋体></font></span></p><p><span style=font-family: 宋体;background: white;color: black;font-size: 12.0pt;>非常大牌的<font color=#ff0000>菱格短裤</font>，做工超精致，</span></p><p><span style=font-family: 宋体;background: white;color: black;font-size: 12.0pt;>上身效果很棒，略高腰的设计，更加的显瘦，非常时尚百搭</span><font face=宋体>，</font></p><p><font face=宋体>后腰有松紧，每个人都可以穿，</font></p><p><font face=宋体>搭配<font color=#ff0000>雪纺衫、</font></font><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><font color=#ff0000>T</font></span><span style=font-family: 宋体;background: white;color: black;font-size: 12.0pt;><font color=#ff0000>恤，背心</font>，都非常有范，很有气质的款哦</span><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;>~</span></p><p><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;></span></p><p>&nbsp;</p><table border=1 cellpadding=0 cellspacing=0 style=border-collapse: collapse;><tr><td style=border-bottom: windowtext 1.0pt solid;border-left: windowtext 1.0pt solid;padding-bottom: 0.0cm;background-color: transparent;padding-left: 5.4pt;width: 93.75pt;padding-right: 5.4pt;border-top: windowtext 1.0pt solid;border-right: windowtext 1.0pt solid;padding-top: 0.0cm; valign=top width=125><p align=center style=text-align: center;margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><strong><span style=font-family: 宋体;background: white;color: #222222;font-size: 10.5pt;font-weight: normal;>S</span></strong><strong><span style=font-family: 宋体;background: white;color: #222222;font-size: 10.5pt;font-weight: normal;>码</span></strong></span></p></td><td style=border-bottom: windowtext 1.0pt solid;border-left: #e9e9e9;padding-bottom: 0.0cm;background-color: transparent;padding-left: 5.4pt;width: 294.7pt;padding-right: 5.4pt;border-top: windowtext 1.0pt solid;border-right: windowtext 1.0pt solid;padding-top: 0.0cm; valign=top width=393><p style=margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><span style=color: #222222;font-size: 10.5pt;><font face=宋体>腰围：<span>62-72<span>&nbsp;</span></span>臀围：<span>86<span>&nbsp;</span></span>前档<span>/</span>后档：<span>25/34<span>&nbsp;</span></span>裤长：<span>31</span></font></span></span></p></td></tr><tr><td style=border-bottom: windowtext 1.0pt solid;border-left: windowtext 1.0pt solid;padding-bottom: 0.0cm;background-color: transparent;padding-left: 5.4pt;width: 93.75pt;padding-right: 5.4pt;border-top: #e9e9e9;border-right: windowtext 1.0pt solid;padding-top: 0.0cm; valign=top width=125><p align=center style=text-align: center;margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><strong><span style=font-family: 宋体;background: white;color: #222222;font-size: 10.5pt;font-weight: normal;>M</span></strong><strong><span style=font-family: 宋体;background: white;color: #222222;font-size: 10.5pt;font-weight: normal;>码</span></strong></span></p></td><td style=border-bottom: windowtext 1.0pt solid;border-left: #e9e9e9;padding-bottom: 0.0cm;background-color: transparent;padding-left: 5.4pt;width: 294.7pt;padding-right: 5.4pt;border-top: #e9e9e9;border-right: windowtext 1.0pt solid;padding-top: 0.0cm; valign=top width=393><p style=margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><span style=color: #222222;font-size: 10.5pt;><font face=宋体>腰围：<span>62-72<span>&nbsp;</span></span>臀围：<span>86<span>&nbsp;</span></span>前档<span>/</span>后档：<span>26/35<span>&nbsp;</span></span>裤长：<span>32</span></font></span></span></p></td></tr><tr><td style=border-bottom: windowtext 1.0pt solid;border-left: windowtext 1.0pt solid;padding-bottom: 0.0cm;background-color: transparent;padding-left: 5.4pt;width: 93.75pt;padding-right: 5.4pt;border-top: #e9e9e9;border-right: windowtext 1.0pt solid;padding-top: 0.0cm; valign=top width=125><p style=text-indent: 31.5pt;margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><font face=宋体><span style=color: #222222;font-size: 10.5pt;>L</span><span style=color: #222222;font-size: 10.5pt;>码</span></font></span></p></td><td style=border-bottom: windowtext 1.0pt solid;border-left: #e9e9e9;padding-bottom: 0.0cm;background-color: transparent;padding-left: 5.4pt;width: 294.7pt;padding-right: 5.4pt;border-top: #e9e9e9;border-right: windowtext 1.0pt solid;padding-top: 0.0cm; valign=top width=393><p style=margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><span style=color: #222222;font-size: 10.5pt;><font face=宋体>腰围：<span>66-76</span>臀围：<span>90<span>&nbsp;</span></span>前档<span>/</span>后档：<span>27/36<span>&nbsp;</span></span>裤长：<span>33</span></font></span></span></p></td></tr></table><p align=left style=text-align: left;line-height: 15.75pt;margin: 13.45pt 0.0cm;background: white;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><b><span style=font-family: 宋体;color: red;font-size: 13.5pt;>展示图片中模特穿<span>S</span>码衣衣，身高：<span>167CM;</span>体重：<span>47KG</span>，供<span>MM</span>们参考。</span></b></span></p><p><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><b><span style=font-family: 宋体;color: red;font-size: 13.5pt;></span></b><span style=font-family: tahoma;color: red;></span></span></p><p style=text-indent: 5.25pt;margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><span style=font-family: tahoma;color: red;><strong><u><span style=font-family: 楷体_gb2312;color: #444444;font-size: 13.5pt;>模特展示（</span></u></strong><strong><u><span style=font-family: 楷体_gb2312;color: #444444;font-size: 13.5pt;>Photo</span></u></strong><strong><u><span style=font-family: simsun;color: #444444;font-size: 13.5pt;>&nbsp;</span></u></strong><strong><u><span style=font-family: 楷体_gb2312;color: #444444;font-size: 13.5pt;>Of</span></u></strong><strong><u><span style=font-family: simsun;color: #444444;font-size: 13.5pt;>&nbsp;</span></u></strong><strong><u><span style=font-family: 楷体_gb2312;color: #444444;font-size: 13.5pt;>Modle Show</span></u></strong><strong><u><span style=font-family: 楷体_gb2312;color: #444444;font-size: 13.5pt;>）：</span></u></strong><span style=font-family: 楷体_gb2312;color: #222222;></span></span></span></p><p style=text-indent: 5.25pt;margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><span style=font-family: tahoma;color: red;><strong><span style=font-family: 楷体_gb2312;color: #444444;font-size: 13.5pt;>100%</span></strong><strong><span style=font-family: 楷体_gb2312;color: #444444;font-size: 13.5pt;>实物拍摄</span></strong><span style=font-family: 楷体_gb2312;color: #222222;></span></span></span></p><p style=text-indent: 5.25pt;margin: 0.0cm 0.0cm 0.0pt;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><span style=font-family: tahoma;color: red;><strong><span style=font-family: 楷体_gb2312;color: #444444;font-size: 13.5pt;>因拍摄过程中由于灯光，照相机等器材原因，可能造成图片和产品实际颜色存在细微差异，颜色以实物为准。</span></strong><span style=font-family: 楷体_gb2312;color: #222222;></span></span></span></p><p align=left style=text-align: left;line-height: 15.75pt;margin: 13.45pt 0.0cm;background: white;>&nbsp;</p><p><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;>&nbsp;<img align=middle src=http://tbphoto3.bababian.com/upload7/%E5%BC%A0%E5%AE%87%E6%9E%9C2009/201306/001130800543_m.jpg></span></p><p>&nbsp;</p><p align=left style=text-align: left;line-height: 15.75pt;margin: 13.45pt 0.0cm;background: white;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><img align=middle src=http://tbphoto3.bababian.com/upload7/%E5%BC%A0%E5%AE%87%E6%9E%9C2009/201306/001130800546_m.jpg></span></p><p align=left style=text-align: left;line-height: 15.75pt;margin: 13.45pt 0.0cm;background: white;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><img align=middle src=http://tbphoto3.bababian.com/upload7/%E5%BC%A0%E5%AE%87%E6%9E%9C2009/201306/001130800548_m.jpg></span></p><p align=left style=text-align: left;line-height: 15.75pt;margin: 13.45pt 0.0cm;background: white;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;><img align=middle src=http://tbphoto3.bababian.com/upload7/%E5%BC%A0%E5%AE%87%E6%9E%9C2009/201306/001130800549_m.jpg></span></p><p align=left style=text-align: left;line-height: 15.75pt;margin: 13.45pt 0.0cm;background: white;><span style=font-family: tahoma;background: white;color: black;font-size: 12.0pt;></span></p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1lqmHXydhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1232\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 实拍8101#2014夏新款韩版百搭显瘦松紧腰短裤热裤女裤子送腰带\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1lqmHXydhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 32.4\nparameter_175 = \nkeyword = \nunit = 件\npoint = 28\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('93', '2015-03-10 23:11:39', '2015-03-10 23:11:39', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1gMVsXx0fXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1gMVsXx0fXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 10105--宝华515_P30.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 30\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 40\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <div style=padding-right: 0.0px;padding-left: 0.0px;font-size: 14.0px;float: left;padding-bottom: 0.0px;margin: 0.0px;width: 750.0px;color: #404040;padding-top: 0.0px;><table style=border-right: #c6aa6e 1.0px solid;border-top: #c6aa6e 1.0px solid;margin-bottom: 18.0px;border-left: #c6aa6e 1.0px solid;border-bottom: #c6aa6e 1.0px solid; cellspacing=0 cellpadding=0 width=750 border=0><tr><td align=left bgcolor=#ffffff><div style=padding-right: 0.0px;padding-left: 0.0px;float: right;padding-bottom: 0.0px;margin: 0.0px;width: 710.0px;padding-top: 0.0px;background-color: #ffffff;><table cellspacing=0 cellpadding=0 width=710 border=0><tr><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle width=10>&nbsp;</td><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle width=68>品名</td><td style=font-size: 14.0px;border-left: #c6aa6e 1.0px solid;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left width=15 bgcolor=#ffffff>&nbsp;</td><td style=font-size: 14.0px;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left width=617 bgcolor=#ffffff><table style=margin-top: 12.0px;margin-bottom: 12.0px;line-height: 20.0px; cellspacing=0 cellpadding=0 width=600 border=0><tr><td width=600>白色超级百搭荷叶边小短裤</td></tr></table></td></tr><tr><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle>&nbsp;</td><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle>材质</td><td style=font-size: 14.0px;border-left: #c6aa6e 1.0px solid;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left bgcolor=#ffffff>&nbsp;</td><td style=font-size: 14.0px;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left bgcolor=#ffffff><table style=margin-top: 12.0px;margin-bottom: 12.0px;line-height: 20.0px; cellspacing=0 cellpadding=0 width=600 border=0><tr><td width=600>100%涤纶</td></tr></table></td></tr><tr><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle>&nbsp;</td><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle>规格</td><td style=font-size: 14.0px;border-left: #c6aa6e 1.0px solid;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left bgcolor=#ffffff>&nbsp;</td><td style=font-size: 14.0px;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left bgcolor=#ffffff><table style=margin-top: 12.0px;margin-bottom: 12.0px;line-height: 20.0px; cellspacing=0 cellpadding=0 width=600 border=0><tr><td width=600>S 裤长23cm 低腰腰围80cm 臀围86cm 前档17cm</td></tr></table></td></tr><tr><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle>&nbsp;</td><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle>&nbsp;</td><td style=font-size: 14.0px;border-left: #c6aa6e 1.0px solid;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left bgcolor=#ffffff>&nbsp;</td><td style=font-size: 14.0px;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left bgcolor=#ffffff><table style=margin-top: 12.0px;margin-bottom: 12.0px;line-height: 20.0px; cellspacing=0 cellpadding=0 width=600 border=0><tr><td width=600>M 裤长24cm 低腰腰围84cm 臀围90cm 前档18cm</td></tr></table></td></tr><tr><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle>&nbsp;</td><td style=font-size: 14.0px;color: #000000;font-family: 宋体;background-color: #ffffff; valign=center align=middle>&nbsp;</td><td style=font-size: 14.0px;border-left: #c6aa6e 1.0px solid;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left bgcolor=#ffffff>&nbsp;</td><td style=font-size: 14.0px;color: #404040;border-bottom: #c6aa6e 1.0px dashed;font-family: 宋体;background-color: #ffffff; valign=center align=left bgcolor=#ffffff><table style=margin-top: 12.0px;margin-bottom: 12.0px;line-height: 20.0px; cellspacing=0 cellpadding=0 width=600 border=0><tr><td width=600>L 裤长25cm 低腰腰围88cm 臀围94cm 前档19cm</td></tr></table></td></tr></table><p style=text-align: center; align=left>XL&nbsp; 裤长26cm 低腰腰围92cm 臀围98m 前档20cm</p></div></td></tr></table></div><div style=text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/129804701/T2q1icXNtXXXXXXXXX_!!129804701.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/129804701/T21fybXRFXXXXXXXXX_!!129804701.jpg><br><br><div style=text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/129804701/T2koSbXQXXXXXXXXXX_!!129804701.jpg><br><br><img src=http://img02.taobaocdn.com/imgextra/i2/129804701/T2wfKcXMdXXXXXXXXX_!!129804701.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/129804701/T2QtWbXGJaXXXXXXXX_!!129804701.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/129804701/T2tkCbXShXXXXXXXXX_!!129804701.jpg><br><br><div style=text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/129804701/T2fDSbXQpXXXXXXXXX_!!129804701.jpg><br><br></div></div></div>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1gMVsXx0fXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1233\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 只有S)10105 2013夏装新款白色超级百搭荷叶边女装小短裤热裤\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1gMVsXx0fXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 54\nparameter_175 = \nkeyword = \nunit = 件\npoint = 40\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('94', '2015-03-10 23:11:48', '2015-03-10 23:11:48', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1II86XrRbXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1II86XrRbXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 1231#--女人街C27_P36.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 36\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 46\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p align=center>&nbsp;</p><strong><font color=#0080ff size=5 face=黑体><p align=center><font color=#ff0000></font>&nbsp;</p></font></strong><strong><font color=#0080ff size=5 face=黑体></font></strong><p align=center><strong><font size=4>尺码表：</font></strong></p><p align=center><strong><font size=4>（<font color=#ff0000>同款皮带档口另外有售</font>）</font></strong></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508127049.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><div align=center><strong><font color=#ff0000 size=5 face=黑体><strong><font color=#0080ff size=6 face=黑体>本店自拍图如下▼</font></strong></font></strong></div><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img32.wal8.com/img32/234372_20120217125222/136790281511.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img32.wal8.com/img32/234372_20120217125222/136790281997.jpg></p><p align=center><img align=middle src=http://bnisi.img32.wal8.com/img32/234372_20120217125222/13679028159.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img32.wal8.com/img32/234372_20120217125222/136790281456.jpg></p><p align=center><img align=middle src=http://bnisi.img32.wal8.com/img32/234372_20120217125222/136790282082.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/13656471289.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136548932091.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136548932414.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/13654893225.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136548932369.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530926526.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530926905.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530926978.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530927091.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530927161.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530926985.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530927055.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530927126.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530927449.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136530927516.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><div align=center><strong><font color=#ff0000 size=5 face=黑体><strong><font color=#ff0000 size=4><font color=#0080ff size=6><strong>以下为网络图▼</strong></font></font></strong></font></strong></div><p align=center><strong><font size=4></font></strong>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508127357.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508127181.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508127211.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/1365082906.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508290671.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508126617.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508126447.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508126155.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508126263.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508290741.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508290516.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508125991.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508126309.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/1365081259.jpg></p><p align=center><img align=middle src=http://bnisi.img31.wal8.com/img31/234372_20120217125222/136508126067.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1II86XrRbXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1234\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 实拍 1331# 2014春夏新款 女装 蕾丝 高腰 修身 直筒 短裤\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1II86XrRbXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 64.8\nparameter_175 = \nkeyword = \nunit = 件\npoint = 46\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('95', '2015-03-10 23:11:53', '2015-03-10 23:11:53', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1qaXsFnpdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1qaXsFnpdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 6003#--女人街A288-A_P16.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 16\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 26\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p align=center>货号；6003</p><p align=center>面料；微弹！</p><p align=center>颜色；浅蓝色&nbsp; 玫红 黑色 白色&nbsp;&nbsp; 黄色 绿色</p><p align=center>尺码 腰围 前裆 后裆 裤口裤长</p><p align=center>S码72cm 27cm 36cm 60cm 34cm</p><p align=center>M码76cm27cm 36cm 62cm34cm</p><p align=center>L码80cm 27.5cm 36.5cm 64cm 34c m</p><p align=center>XL码84cm 28cm 37cm 66cm34cm</p><p style=text-align: center;><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622778.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622730.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622711.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622689.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622668.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622655.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622630.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622616.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622583.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622580.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132622546.JPG></p><p align=center>&nbsp;</p><p style=text-align: center;><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132624718.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132624711.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132624704.JPG><br><img src=http://tbphoto3.bababian.com/upload7/784153439qch/201306/001132624697.JPG></p><p align=center><br>&nbsp;</p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1qaXsFnpdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1235\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 实拍!!!2014春夏新款百搭女高腰短裤头阔腿休闲短裤6003#\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1qaXsFnpdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 28.8\nparameter_175 = \nkeyword = \nunit = 件\npoint = 26\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('96', '2015-03-10 23:11:59', '2015-03-10 23:11:59', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1at0mXp0hXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1at0mXp0hXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 0--女人街619-C_P25.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 25\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 35\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p align=center>&nbsp;</p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228618_m.jpg></p><p align=center>&nbsp;</p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228621_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228631_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228646_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228640_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228643_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121219369_m.png></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228640_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228645_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228652_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228647_m.jpg></p><p align=center>&nbsp;</p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228649_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228644_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228654_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201303/001121228651_m.jpg></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201305/001128607680_m.JPG></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201305/001128607601_m.JPG></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201305/001128607459_m.JPG><img src=http://tbphoto3.bababian.com/upload6/liwei123/201305/001128607569_m.JPG></p><p align=center><img src=http://tbphoto3.bababian.com/upload6/liwei123/201305/001128607288_m.jpg></p><p align=center>&nbsp;</p><p align=center>&nbsp;</p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1at0mXp0hXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1236\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 5036# 2013夏季款女装 时尚显瘦短裤 女夏韩版修身休闲热裤 短裤\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1at0mXp0hXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 45\nparameter_175 = \nkeyword = \nunit = 件\npoint = 35\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('97', '2015-03-10 23:12:05', '2015-03-10 23:12:05', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T17GJ7XBVaXXXXXXXX_!!2-item_pic.png_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T17GJ7XBVaXXXXXXXX_!!2-item_pic.png_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 6617#--宝华339-A_P26.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 26\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 36\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p align=center>&nbsp;</p><p align=center>&nbsp;</p><table border=0 cellspacing=0 cellpadding=0 width=770 align=center><tr><td align=middle><table border=0 cellspacing=0 cellpadding=3 width=770 bgcolor=#e1dcd6><tr><td bgcolor=#ffffff height=10 width=66%><span><span><span><span><b><font color=#94d0d9>尺寸表</font></b></span></span></span></span></td><td bgcolor=#ffffff height=10 width=34% align=left><p><span><span><span><span><font color=#a8b0b0>單位：厘米( 1寸=2.54cm)量法:平放撑开量</font></span></span></span></span></p></td></tr></table></td></tr><tr><td valign=center align=middle><table border=0 cellspacing=1 cellpadding=8 width=770 bgcolor=#e1dcd6><tr><td bgcolor=#eeede8 height=30 valign=center width=78><span><span><span><span><font color=#666666>布标尺寸</font></span></span></span></span></td><td bgcolor=#eeede8 height=30 valign=center width=50><span><span><span><span><font color=#666666>腰围</font></span></span></span></span></td><td bgcolor=#eeede8 height=30 valign=center width=50><span><span><span><span><font color=#666666>臀围</font></span></span></span></span></td><td bgcolor=#eeede8 height=30 valign=center width=50><span><span><span><span><font color=#666666>大腿围</font></span></span></span></span></td><td bgcolor=#eeede8 height=30 valign=center width=50><span><span><span><span><font color=#666666>裤档</font></span></span></span></span></td><td bgcolor=#eeede8 height=30 valign=center width=50><span><span><span><span><font color=#666666>裤管宽</font></span></span></span></span></td><td bgcolor=#eeede8 height=30 valign=center width=50><span><span><span><span><font color=#666666>全长</font></span></span></span></span></td><td bgcolor=#eeede8 height=30 valign=center width=58><span><span><span><font color=#666666><span>建议</span></font></span></span></span></td></tr><tr><td bgcolor=#ffffff height=30 valign=center><span><span><span><font color=#94d0d9><span>S</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>66</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><span><font color=#333333>約</font></span><font color=#333333><span>90-94</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>58</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>24</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>54</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>30</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>25-27码</span></font></span></span></span></td></tr><tr><td bgcolor=#ffffff height=30 valign=center><span><span><span><font color=#94d0d9><span>M</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>70</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><span><font color=#333333>約94-99</font></span></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>64</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>25</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>56</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>32</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>28-30码</span></font></span></span></span></td></tr><tr><td bgcolor=#ffffff height=30 valign=center><span><span><span><span><font color=#94d0d9>L</font></span></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><span><font color=#333333>74</font></span></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><span><font color=#333333>約102-107</font></span></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>66</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>25.5</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>61</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>33</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>31-32码</span></font></span></span></span></td></tr><tr><td bgcolor=#ffffff height=30 valign=center><span><span><span><span><font color=#94d0d9>XL</font></span></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><span><font color=#333333>78</font></span></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><span><font color=#333333>約109-114</font></span></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>68</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>26</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>63</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>35</span></font></span></span></span></td><td bgcolor=#ffffff height=35 valign=center><span><span><span><font color=#333333><span>33-34码</span></font></span></span></span></td></tr></table></td></tr></table><p>&nbsp;</p><p align=center><span><span><font color=#a0958c>※ 商品会因每个人测量方式不同，会略有2-3厘米内误差属正常范围。<br>※ 体型 &amp; 国际衣码对照表<a target=_blank>请参考</a></font></span></span></p><p align=center>&nbsp;</p><p align=center><span><span><font color=#ff5a00 size=3>注意事项</font><br><font color=#a0958c size=3>1. 卖场一律以&lsquo;厘米&rsquo;为计算单位。<br>2. 身高体重与尺寸没有绝对的关系，155cm丰腴与168cm瘦高的女生也许会穿同一个尺寸</font></span></span></p><p align=center>&nbsp;</p><p align=center><img src=></p><p align=center><img src=></p><p align=center><img src=></p><p align=center><img src=></p><p align=center><img src=></p><p align=center><img src=></p><p align=center><img src=></p><p align=center>&nbsp;</p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T17GJ7XBVaXXXXXXXX_!!2-item_pic.png_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1240\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 6617#2013夏百搭休闲女裤短裤 口袋拼接女直筒短西裤 短热裤\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T17GJ7XBVaXXXXXXXX_!!2-item_pic.png_460x460.jpg\n_isMarketable = false\nmarketPrice = 46.8\nparameter_175 = \nkeyword = \nunit = 件\npoint = 36\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('98', '2015-03-10 23:12:14', '2015-03-10 23:12:14', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1GDmrXzpaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1GDmrXzpaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 9939--大西豪429_P27.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 27\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 37\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><font color=#00ff40 size=4><strong>9939#2013春装新品 女装大码百搭热裤 韩版休闲雪纺短裤 女夏 4色</strong></font></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><br><img style=border-width: 0.0px;vertical-align: top; src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2szgpXrVaXXXXXXXX_!!671297861.jpg><br>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/671297861/T2iBQpXrpaXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2ITsvXsBXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/671297861/T2Po3pXudaXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/671297861/T2K5wtXzpXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/671297861/T2i73vXp0XXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2tuItXDJXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/671297861/T2VckqXs4aXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/671297861/T2YS3tXB8XXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2lMQtXylXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2jl3nXulaXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/671297861/T2goAtXBXXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2EBEvXtpXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/671297861/T2JSQsXzVXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/671297861/T2n27uXyxXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2EzspXvNaXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/671297861/T2n33tXDlXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/671297861/T23q.uXzdXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T29RAvXrxXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/671297861/T211ctXBBXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/671297861/T231kpXw0aXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2XHAuXBXXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/671297861/T29ysoXtFaXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/671297861/T2p.suXxNXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/671297861/T2n0cwXrtXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/671297861/T2lA3oXvdaXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/671297861/T25EUpXuxaXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2LLcpXwNaXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/671297861/T2eHguXxBXXXXXXXXX_!!671297861.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;color: #404040;text-transform: none;text-indent: 0.0px;letter-spacing: normal;word-spacing: 0.0px;white-space: normal;orphans: 2;widows: 2;background-color: #ffffff;><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/671297861/T2.XkuXAFXXXXXXXXX_!!671297861.jpg></p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1GDmrXzpaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1243\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 9939#2013春装新品 女装大码百搭热裤韩版休闲雪纺短裤女夏  实拍\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1GDmrXzpaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 48.6\nparameter_175 = \nkeyword = \nunit = 件\npoint = 37\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('99', '2015-03-10 23:12:20', '2015-03-10 23:12:20', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 8878#--富丽D4073-A_P23.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 23\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 33\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p style=padding-right: 0.0px;padding-left: 0.0px;padding-bottom: 0.0px;margin: 1.12em 0.0px;padding-top: 0.0px;><font face=Arial color=#333333 size=2>S码：&nbsp;腰围68CM 臀围92CM 裤长24CM(两侧量尺寸) &nbsp;裤脚46CM<br>M码：腰围72CM&nbsp;臀围96CM&nbsp;裤长24CM(两侧量尺寸) &nbsp; 裤脚48CM&nbsp;<br>L码： 腰围76CM 臀围100CM 裤长24CM(两侧量尺寸) &nbsp; &nbsp;裤脚50CM</font></p><div style=float: left;width: 100.0%;text-align: center;><img src=http://img04.taobaocdn.com/imgextra/i4/664190928/T2vsgRXldXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img04.taobaocdn.com/imgextra/i4/664190928/T24.ZQXktXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/664190928/T2ueMRXitXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/664190928/T2vjMQXjxXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/664190928/T2qRIPXgdaXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img02.taobaocdn.com/imgextra/i2/664190928/T29L7QXdxaXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/664190928/T2cqMQXntXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/664190928/T28SAQXnNXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img02.taobaocdn.com/imgextra/i2/664190928/T2Fy3RXcpXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/664190928/T2kBMRXaVXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/664190928/T2ywURXf4XXXXXXXXX_!!664190928.jpg><br></div>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1246\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 8878#夏季女装 韩版休闲拼色蕾丝西装短裤 热裤\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 41.4\nparameter_175 = \nkeyword = \nunit = 件\npoint = 33\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('100', '2015-03-10 23:12:25', '2015-03-10 23:12:25', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 9828#--女人街508-2_P15.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 15\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 25\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <p><span style=font-size: 18.0px;><font color=#666666>●质地：类是雪纺面料</font></span></p><div><div style=display: block;><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666></font></span><span style=font-size: 18.0px;><font color=#666666>●尺寸:均为人工手量 有2cm左右误差属正常</font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666>均 码 ： 腰围-68-80cm 臀围-102cm 腿围-58cm 裤长-29cm</font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;>&nbsp;</p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666></font></font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666></font></font></font></span></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666></font></font></span></p><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666>●注意：网购均有色差 已经尽力调整 不能接受色差者谨慎下单 小店不承担因色差问题产生的退换！</font></font></font></font></span><p><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666>（照片中的搭配不属于售出范围 具体问店主 请看好拍哟）</font></font></font></font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666>●没有&ldquo;完美&rdquo;的衣服 接受不了微小瑕疵(如线头 可以洗掉的小印记)的亲绕行</font></font></font></font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666>微小瑕疵不作为质量问题退换货</font></font></font></font></span></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><span style=color: #990000;><font size=2><font size=2></font></font></span></font></font></font></font></font></font></font></font></font></font></font></font></font></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><span style=color: #990000;><font size=2><font size=2></font></font></span></font></font></font></font></font></font></font></font></font></font></font></font></font></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><span style=color: #990000;><font size=2><font size=2></font></font></span></font></font></font></font></font></font></font></font></font></font></font></font></font></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 14.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><span style=color: #990000;><font color=#666666><font color=#666666><font color=#666666><span style=color: #ff0000;><span style=font-size: 14.0px;><span style=background-color: #000000;><strong>宝贝说明：</strong></span></span></span></font></font></font></span></font></font></font></font></font></font></font></font></font></font></font></font></font></span></p><p><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;></span></span></span></span></span></p><p align=center style=margin-right: 0.0px;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><strong><font color=#ff9900>经典的百搭西装短裤</font></strong></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=font-size: 14.0px;><span style=color: #ff9900;><strong>褶皱的裤型看着精干 立体</strong></span></span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=font-size: 14.0px;><span style=color: #ff9900;><strong>拖沓 纯色大方</strong></span></span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=font-size: 14.0px;><span style=color: #ff9900;><strong>雪纺材质很清凉哦</strong></span></span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=color: #ff0000;>送皮带哦</span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=color: #ff0000;></span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span><img alt= 201355182938798 src=http://img02.taobaocdn.com/imgextra/i2/855310629/TB2D._FXVXXXXXtXXXXXXXXXXXX-855310629.jpg><img alt= 201355182948570 style=color: #222222;line-height: 1.5; src=http://img03.taobaocdn.com/imgextra/i3/855310629/TB2XiYGXVXXXXXbXXXXXXXXXXXX-855310629.jpg></p><img alt= 201355182943600 src=http://img04.taobaocdn.com/imgextra/i4/855310629/TB2sbbFXVXXXXbdXXXXXXXXXXXX-855310629.jpg><img alt= 201355183040567 style=line-height: 1.5; src=http://img02.taobaocdn.com/imgextra/i2/855310629/TB2puYGXVXXXXXEXXXXXXXXXXXX-855310629.jpg></div><p>&nbsp;</p><p>&nbsp;</p></div><p>&nbsp;</p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1247\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 夏秋装新款女装 女裤大码百搭热 韩版休闲雪纺短裤  9828#\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 27\nparameter_175 = \nkeyword = \nunit = 件\npoint = 25\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('101', '2015-03-10 23:12:30', '2015-03-10 23:12:30', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nparameter_145 = \nproductImages[0].title = \nparameter_146 = \nparameter_144 = \nsn = 3313--女人街713_P30.00\nparameter_149 = \nproductImages[0].order = \nimage = \nisMarketable = true\ncost = 30\nparameter_150 = \n_isTop = false\nparameter_151 = \nprice = 40\nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nparameter_154 = \nintroduction = <div align=center><strong><font color=#008040 size=5>雪纺上衣尺寸</font></strong></div><div align=center><strong><font color=#008040 size=5>M 衣长&nbsp;59&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 胸围86&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 袖口26</font></strong></div><div align=center><strong><font color=#008040 size=5>L 衣长&nbsp;60&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 胸围94&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 袖口28 </font></strong></div><div align=center><strong><font color=#008040 size=5>模特上身穿的上衣也有货，需要套装的请联系客服</font></strong></div><div align=center><strong><font color=#008040 size=5>裤子尺寸</font></strong></div><div align=center><strong><font color=#008040 size=5>腰围&nbsp;&nbsp;&nbsp; 裤长&nbsp;&nbsp; 臀围 </font></strong></div><div align=center><strong><font color=#008040 size=5>S&nbsp;&nbsp;66&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;35&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;82&nbsp;&nbsp;&nbsp;&nbsp; </font></strong></div><div align=center><strong><font color=#008040 size=5>&nbsp;M&nbsp;&nbsp;70&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 36&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 88&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></strong></div><div align=center><strong><font color=#008040 size=5>&nbsp;&nbsp;&nbsp;L&nbsp;&nbsp;74&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;37&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;94&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </font></strong></div><p>&nbsp;</p><p style=text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/603887775/T21NWZXDdaXXXXXXXX_!!603887775.jpg><br><img src=http://img04.taobaocdn.com/imgextra/i4/603887775/T2zeffXwVaXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2ASr8XjpbXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2r8zJXblbXXXXXXXX_!!603887775.jpg><br><img src=http://img02.taobaocdn.com/imgextra/i2/603887775/T2B._UXlpbXXXXXXXX_!!603887775.jpg><br><img src=http://img01.taobaocdn.com/imgextra/i1/603887775/TB2USTEXVXXXXaKXXXXXXXXXXXX_!!603887775.jpg><br></p><p style=text-align: center;><img src=http://img02.taobaocdn.com/imgextra/i2/603887775/T2_6kFXotaXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2r8zJXblbXXXXXXXX_!!603887775.jpg><br><img src=http://img01.taobaocdn.com/imgextra/i1/603887775/T21NWZXDdaXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2ASr8XjpbXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2EtODXy8aXXXXXXXX_!!603887775.jpg><br><img src=http://img04.taobaocdn.com/imgextra/i4/603887775/T2mn8WXdpeXXXXXXXX_!!603887775.jpg><br><img src=http://img02.taobaocdn.com/imgextra/i2/603887775/T2B._UXlpbXXXXXXXX_!!603887775.jpg><br><img><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2ocsMXbBbXXXXXXXX_!!603887775.jpg><br></p>\nproductCategoryId = 80\nparameter_155 = \nisList = true\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nweight = \nseoKeywords = \nmemo = \nattribute_69 = \nparameter_160 = \nid = 1248\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 2014夏装新款女装 加金线休闲裤超短裤女裤子夏季韩版热裤裙裤\ntagIds = 5\nisTop = true\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\n_isMarketable = false\nmarketPrice = 54\nparameter_175 = \nkeyword = \nunit = 件\npoint = 40\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('102', '2015-03-10 23:13:21', '2015-03-10 23:13:21', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nproductImages[0].title = \nparameter_145 = \nparameter_146 = \nparameter_144 = \nsn = 3313--女人街713_P30.00\nparameter_149 = \nproductImages[0].order = \nisMarketable = true\nimage = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ncost = 30\n_isTop = false\nparameter_150 = \nprice = 40\nparameter_151 = \nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nproductCategoryId = 80\nintroduction = <div align=center><strong><font color=#008040 size=5>雪纺上衣尺寸</font></strong></div><div align=center><strong><font color=#008040 size=5>M 衣长&nbsp;59&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 胸围86&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 袖口26</font></strong></div><div align=center><strong><font color=#008040 size=5>L 衣长&nbsp;60&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 胸围94&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 袖口28 </font></strong></div><div align=center><strong><font color=#008040 size=5>模特上身穿的上衣也有货，需要套装的请联系客服</font></strong></div><div align=center><strong><font color=#008040 size=5>裤子尺寸</font></strong></div><div align=center><strong><font color=#008040 size=5>腰围&nbsp;&nbsp;&nbsp; 裤长&nbsp;&nbsp; 臀围 </font></strong></div><div align=center><strong><font color=#008040 size=5>S&nbsp;&nbsp;66&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;35&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;82&nbsp;&nbsp;&nbsp;&nbsp; </font></strong></div><div align=center><strong><font color=#008040 size=5>&nbsp;M&nbsp;&nbsp;70&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 36&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 88&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></strong></div><div align=center><strong><font color=#008040 size=5>&nbsp;&nbsp;&nbsp;L&nbsp;&nbsp;74&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;37&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;94&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </font></strong></div><p>&nbsp;</p><p style=text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/603887775/T21NWZXDdaXXXXXXXX_!!603887775.jpg><br><img src=http://img04.taobaocdn.com/imgextra/i4/603887775/T2zeffXwVaXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2ASr8XjpbXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2r8zJXblbXXXXXXXX_!!603887775.jpg><br><img src=http://img02.taobaocdn.com/imgextra/i2/603887775/T2B._UXlpbXXXXXXXX_!!603887775.jpg><br><img src=http://img01.taobaocdn.com/imgextra/i1/603887775/TB2USTEXVXXXXaKXXXXXXXXXXXX_!!603887775.jpg><br></p><p style=text-align: center;><img src=http://img02.taobaocdn.com/imgextra/i2/603887775/T2_6kFXotaXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2r8zJXblbXXXXXXXX_!!603887775.jpg><br><img src=http://img01.taobaocdn.com/imgextra/i1/603887775/T21NWZXDdaXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2ASr8XjpbXXXXXXXX_!!603887775.jpg><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2EtODXy8aXXXXXXXX_!!603887775.jpg><br><img src=http://img04.taobaocdn.com/imgextra/i4/603887775/T2mn8WXdpeXXXXXXXX_!!603887775.jpg><br><img src=http://img02.taobaocdn.com/imgextra/i2/603887775/T2B._UXlpbXXXXXXXX_!!603887775.jpg><br><img><br><img src=http://img03.taobaocdn.com/imgextra/i3/603887775/T2ocsMXbBbXXXXXXXX_!!603887775.jpg><br></p>\nparameter_154 = \nparameter_155 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nattribute_69 = \nparameter_160 = \nid = 1248\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 2014夏装新款女装 加金线休闲裤超短裤女裤子夏季韩版热裤裙裤\nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1Ho4iFXhXXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmarketPrice = 54\nparameter_175 = \nkeyword = \npoint = 40\nunit = 件\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('103', '2015-03-10 23:13:28', '2015-03-10 23:13:28', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'seoDescription = \nbrandId = \nseoTitle = \n_isGift = false\nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstockMemo = \nparameter_147 = \nparameter_148 = \nproductImages[0].title = \nparameter_145 = \nparameter_146 = \nparameter_144 = \nsn = 9828#--女人街508-2_P15.00\nparameter_149 = \nproductImages[0].order = \nisMarketable = true\nimage = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ncost = 15\n_isTop = false\nparameter_150 = \nprice = 25\nparameter_151 = \nparameter_156 = \nparameter_157 = \nparameter_158 = \nparameter_159 = \nparameter_152 = \nparameter_153 = \nproductCategoryId = 80\nintroduction = <p><span style=font-size: 18.0px;><font color=#666666>●质地：类是雪纺面料</font></span></p><div><div style=display: block;><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666></font></span><span style=font-size: 18.0px;><font color=#666666>●尺寸:均为人工手量 有2cm左右误差属正常</font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666>均 码 ： 腰围-68-80cm 臀围-102cm 腿围-58cm 裤长-29cm</font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;>&nbsp;</p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666></font></font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666></font></font></font></span></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666></font></font></span></p><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666>●注意：网购均有色差 已经尽力调整 不能接受色差者谨慎下单 小店不承担因色差问题产生的退换！</font></font></font></font></span><p><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666>（照片中的搭配不属于售出范围 具体问店主 请看好拍哟）</font></font></font></font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666>●没有&ldquo;完美&rdquo;的衣服 接受不了微小瑕疵(如线头 可以洗掉的小印记)的亲绕行</font></font></font></font></span></p><p align=left style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 18.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666>微小瑕疵不作为质量问题退换货</font></font></font></font></span></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><span style=color: #990000;><font size=2><font size=2></font></font></span></font></font></font></font></font></font></font></font></font></font></font></font></font></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><span style=color: #990000;><font size=2><font size=2></font></font></span></font></font></font></font></font></font></font></font></font></font></font></font></font></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><font color=#666666 size=2><span style=color: #990000;><font size=2><font size=2></font></font></span></font></font></font></font></font></font></font></font></font></font></font></font></font></p><p style=padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><span style=font-size: 14.0px;><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><font color=#666666><span style=color: #990000;><font color=#666666><font color=#666666><font color=#666666><span style=color: #ff0000;><span style=font-size: 14.0px;><span style=background-color: #000000;><strong>宝贝说明：</strong></span></span></span></font></font></font></span></font></font></font></font></font></font></font></font></font></font></font></font></font></span></p><p><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;></span></span></span></span></span></p><p align=center style=margin-right: 0.0px;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><strong><font color=#ff9900>经典的百搭西装短裤</font></strong></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=font-size: 14.0px;><span style=color: #ff9900;><strong>褶皱的裤型看着精干 立体</strong></span></span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=font-size: 14.0px;><span style=color: #ff9900;><strong>拖沓 纯色大方</strong></span></span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=font-size: 14.0px;><span style=color: #ff9900;><strong>雪纺材质很清凉哦</strong></span></span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=color: #ff0000;>送皮带哦</span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span></p><p align=center style=color: #404040;><span style=color: #444444;><span style=font-size: 14.0px;><span style=font-size: 14.0px;><span style=background-color: #000000;><span style=background-color: #ffffff;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><span style=color: #666666;><span style=font-family: microsoft yahei;><span style=font-size: 14.0px;><span style=color: #000000;><font color=#000000><span style=font-family: simsun;><span style=font-size: 14.0px;><span style=color: #999999;><strong><span style=color: #666666;><span style=font-size: 12.0px;><font color=#808080 size=2><span style=color: #ff0000;></span></font></span></span></strong></span></span></span></font></span></span></span></span></span></span></span></span></span></span></span></span></span><img alt= 201355182938798 src=http://img02.taobaocdn.com/imgextra/i2/855310629/TB2D._FXVXXXXXtXXXXXXXXXXXX-855310629.jpg><img alt= 201355182948570 style=color: #222222;line-height: 1.5; src=http://img03.taobaocdn.com/imgextra/i3/855310629/TB2XiYGXVXXXXXbXXXXXXXXXXXX-855310629.jpg></p><img alt= 201355182943600 src=http://img04.taobaocdn.com/imgextra/i4/855310629/TB2sbbFXVXXXXbdXXXXXXXXXXXX-855310629.jpg><img alt= 201355183040567 style=line-height: 1.5; src=http://img02.taobaocdn.com/imgextra/i2/855310629/TB2puYGXVXXXXXEXXXXXXXXXXXX-855310629.jpg></div><p>&nbsp;</p><p>&nbsp;</p></div><p>&nbsp;</p>\nparameter_154 = \nparameter_155 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nattribute_69 = \nparameter_160 = \nid = 1247\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nname = 夏秋装新款女装 女裤大码百搭热 韩版休闲雪纺短裤  9828#\nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1RDewXwxfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmarketPrice = 27\nparameter_175 = \nkeyword = \npoint = 25\nunit = 件\n_isList = false\n');
INSERT INTO `xx_log` VALUES ('104', '2015-03-10 23:16:26', '2015-03-10 23:16:26', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'isList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\nmemo = \nseoKeywords = \nseoDescription = \nbrandId = \nid = 1246\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 5\nname = 8878#夏季女装 韩版休闲拼色蕾丝西装短裤 热裤\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\nsn = 8878#--富丽D4073-A_P23.00\nmarketPrice = 41.4\nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = http://localhost:8080/easy-shopping/upload/image/201407/夏季短裤/T1_ESaXXpsXXXjyHoZ_031428.jpg_460x460.jpg\ncost = 23\npoint = 33\nunit = 件\n_isTop = false\nprice = 33\n_isList = false\nproductCategoryId = 92\nintroduction = <p style=padding-right: 0.0px;padding-left: 0.0px;padding-bottom: 0.0px;margin: 1.12em 0.0px;padding-top: 0.0px;><font face=Arial color=#333333 size=2>S码：&nbsp;腰围68CM 臀围92CM 裤长24CM(两侧量尺寸) &nbsp;裤脚46CM<br>M码：腰围72CM&nbsp;臀围96CM&nbsp;裤长24CM(两侧量尺寸) &nbsp; 裤脚48CM&nbsp;<br>L码： 腰围76CM 臀围100CM 裤长24CM(两侧量尺寸) &nbsp; &nbsp;裤脚50CM</font></p><div style=float: left;width: 100.0%;text-align: center;><img src=http://img04.taobaocdn.com/imgextra/i4/664190928/T2vsgRXldXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img04.taobaocdn.com/imgextra/i4/664190928/T24.ZQXktXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/664190928/T2ueMRXitXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/664190928/T2vjMQXjxXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/664190928/T2qRIPXgdaXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img02.taobaocdn.com/imgextra/i2/664190928/T29L7QXdxaXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/664190928/T2cqMQXntXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/664190928/T28SAQXnNXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img02.taobaocdn.com/imgextra/i2/664190928/T2Fy3RXcpXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img01.taobaocdn.com/imgextra/i1/664190928/T2kBMRXaVXXXXXXXXX_!!664190928.jpg><br></div><div style=float: left;width: 100.0%;text-align: center;><img src=http://img03.taobaocdn.com/imgextra/i3/664190928/T2ywURXf4XXXXXXXXX_!!664190928.jpg><br></div>\n');
INSERT INTO `xx_log` VALUES ('105', '2015-03-10 23:17:12', '2015-03-10 23:17:12', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1183\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 5\nname = 实拍秋夏宽松可爱甜美牛仔背带裙 短裙吊带裙 连衣裙 半身裙 3031\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\nsn = 3031--大时代126_P32.00\nmarketPrice = 57.6\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 32\npoint = 42\nunit = 件\n_isTop = false\nprice = 42\n_isList = false\nproductCategoryId = 85\nintroduction = <p align=center><strong><font size=5 face=楷体_GB2312>颜色：图片色</font></strong><br><font color=#000000 size=5 face=楷体_GB2312><strong>面料：</strong></font><font color=#ff0000 size=4><strong><font face=楷体_GB2312><font size=5>牛仔面料，无弹力</font></font></strong></font></p><p align=center><font color=#ff0000><strong><font size=5><font face=楷体_GB2312><font color=#000000>尺寸说明：</font>（单位CM）</font></font></strong></font></p><p align=center><font size=4 face=楷体_GB2312>平铺手工测量有少许误差</font></p><p align=center>●<font color=#333333>关于颜色：网购难免会有色差!!请以实物色为准</font></p><p align=center><strong><span style=font-size: 24.0px;><font color=#333333></font></span></strong></p><p align=center><strong><span style=font-size: 24.0px;><font color=#333333>&nbsp;S：<span style=color: #cc0000;>裙长</span>31<span style=color: #cc0000;>腰围</span>72<span style=color: #cc0000;>下摆围<font color=#808000>86</font></span><font color=#808000>&nbsp;</font><span style=color: #cc0000;>带长</span>37（可调）</font></span></strong></p><p align=center><strong><font size=5><font color=#666666>M:&nbsp;</font><font color=#ff0000>裙长</font><font color=#666666>31</font>&nbsp;<font color=#ff0000>腰围</font><font color=#666666>74</font><font color=#ff0000>下摆围</font><font color=#808040>90</font><font color=#ff0000>带长</font><font color=#666666>37(可调)</font></font></strong></p><p align=center><strong><font size=5><font color=#666666>L:&nbsp;&nbsp;</font><font color=#ff0000>裙长</font><font color=#666666>32</font>&nbsp;<font color=#ff0000>腰围</font><font color=#666666>78</font>&nbsp;<font color=#ff0000>下摆围</font><font color=#808040>94</font><font color=#ff0000>带长</font><font color=#666666>37(可调)</font></font></strong></p><p align=center><strong><font color=#666666 size=5>XL：<font color=#ff0000>裙长</font>32<font color=#ff0000>腰围</font>80<font color=#ff0000>下摆围</font><font color=#808040>98</font><font color=#ff0000>带长</font>38（可调）</font></strong></p><p><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font color=#808080 size=3 face=宋体-PUA></font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font color=#808080 size=3 face=宋体-PUA></font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font color=#808080 size=3 face=宋体-PUA>充满2012时尚的KK，</font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font face=宋体-PUA><font color=#808080 size=3>时髦的背带设计，穿出不一样的味道，</font></font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font face=宋体-PUA><font color=#808080 size=3>充满了诱人的复古味道，</font></font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#808080 size=3 face=宋体-PUA>超有独特味道，是今年春季不可缺或缺的单品！！！</font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px; align=center><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑></font></strong></font></strong></span></span></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5>网络图片，供参考。</font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong>&nbsp;</p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p><strong><font color=#666666 size=5></font></strong></p><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0385.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0386.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0387.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0390.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0394.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0398.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0402.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0403.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0406.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0408.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0410.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0411.jpg>\n');
INSERT INTO `xx_log` VALUES ('106', '2015-03-10 23:17:36', '2015-03-10 23:17:36', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'isList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1OAGDXBFdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nseoDescription = \nbrandId = \nid = 965\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1OAGDXBFdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1OAGDXBFdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 5\nname = 实拍1350#新款夏装韩版大码女打底裙无袖背心裙两件套雪纺连衣裙\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1OAGDXBFdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 1350#--宝华511_P20.00\nmarketPrice = 36\nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 20\npoint = 30\nunit = 件\n_isTop = false\nprice = 30\n_isList = false\nproductCategoryId = 91\nintroduction = <p style=text-align: center;>&nbsp;</p><p style=text-align: center;><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001129003243.png><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001129003244.png><br><br>&nbsp;</p><p style=text-align: center;><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128973567.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128973995.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128973063.jpg><br><br>&nbsp;</p><p style=text-align: center;><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128978290.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128978021.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977851.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977773.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977468.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977300.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977201.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128976989.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128976638.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128976462.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128975976.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128975138.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977648.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128974971.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128974552.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977545.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128975453.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977609.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977585.jpg><br><br><img src=http://tbphoto3.bababian.com/upload6/%E8%A1%A3%E5%9B%AD%E6%96%B9/201305/001128977559.jpg><br><br>&nbsp;</p>\n');
INSERT INTO `xx_log` VALUES ('107', '2015-03-10 23:17:46', '2015-03-10 23:17:46', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'isList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1Lch.XwhfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nseoDescription = \nbrandId = \nid = 967\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1Lch.XwhfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1Lch.XwhfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 5\nname = 8692#艾米家2014猫头图案无袖修身包臀打底 背心女\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1Lch.XwhfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 0--女人街A68_P25.00\nmarketPrice = 45\nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 25\npoint = 35\nunit = 件\n_isTop = false\nprice = 35\n_isList = false\nproductCategoryId = 91\nintroduction = <p><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/115363867/T2bVcKXeBaXXXXXXXX_!!115363867.jpg></p><p><img align=absMiddle src=http://img01.taobaocdn.com/imgextra/i1/115363867/T2sKQKXXdaXXXXXXXX_!!115363867.jpg></p>\n');
INSERT INTO `xx_log` VALUES ('108', '2015-03-10 23:17:55', '2015-03-10 23:17:55', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'isList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1fh1aXvhfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nseoDescription = \nbrandId = \nid = 968\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1fh1aXvhfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1fh1aXvhfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 5\nname = 1024#2013夏季新款无袖雪纺衫大码小背心女打底衫夏宽松小吊带衫\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/背心/T1fh1aXvhfXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 0--机筑巷C8_P17.00\nmarketPrice = 30.6\nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 17\npoint = 27\nunit = 件\n_isTop = false\nprice = 27\n_isList = false\nproductCategoryId = 91\nintroduction = <p align=center style=background: white;text-align: center;margin: 0.0cm 0.0cm 10.0pt;><b><span style=font-size: 12.0pt;font-family: 宋体;color: #365f91;><span style=font-size: medium;>一款绝对不显庸俗，穿出青春感的</span></span></b></p><p align=center style=background: white;text-align: center;margin: 0.0cm 0.0cm 10.0pt;><span style=font-size: medium;><b><span style=font-family: 微软雅黑 sans-serif;color: #365f91;>超个性韩版潮甜美雪纺衫。。</span></b></span></p><p align=center style=background: white;text-align: center;margin: 0.0cm 0.0cm 10.0pt;><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/176365251/T2FRM9XkVXXXXXXXXX_!!176365251.jpg></p><p align=center style=background: white;text-align: center;margin: 0.0cm 0.0cm 10.0pt;>&nbsp;</p><p align=center style=background: white;text-align: center;margin: 0.0cm 0.0cm 10.0pt;>&nbsp;</p><p align=center style=background: white;text-align: center;margin: 0.0cm 0.0cm 10.0pt;>&nbsp;</p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><span style=font-size: medium;><b><span style=font-family: 微软雅黑 sans-serif;color: #365f91;>。</span></b></span></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><span style=font-size: medium;><b><span style=font-family: 微软雅黑 sans-serif;color: #365f91;></span></b></span></p><div align=center style=margin-right: 0.0px;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/176365251/T2Wi.ZXmFaXXXXXXXX_!!176365251.jpg></div><div align=center style=margin-right: 0.0px;>&nbsp;</div><p align=center><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/176365251/T2Wi.ZXmFaXXXXXXXX_!!176365251.jpg><br>&nbsp;</p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://tbphoto3.bababian.com/upload7/%E5%90%8D%E5%A5%B3%E4%BA%BA/201304/001125614578_m.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://tbphoto3.bababian.com/upload7/%E5%90%8D%E5%A5%B3%E4%BA%BA/201304/001125614576_m.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;>&nbsp;</p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/176365251/T2y7TSXdhbXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/176365251/T2Yqo_Xj0XXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/176365251/T2.pZ9XhpaXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img01.taobaocdn.com/imgextra/i1/176365251/T2cOVnXXVOXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/176365251/T2XGc9XmdXXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/176365251/T2OtMYXl8aXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/176365251/T2FQo9XlhXXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/176365251/T2QZKJXntbXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;>&nbsp;</p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/176365251/T2ok3dXaFbXXXXXXXX_!!176365251.jpg></p><p align=center style=margin: 0.0cm 0.0cm 10.0pt;background-color: white;><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/176365251/T2Hkl.XcBdXXXXXXXX_!!176365251.jpg></p>\n');
INSERT INTO `xx_log` VALUES ('109', '2015-03-10 23:18:39', '2015-03-10 23:18:39', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1183\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 5\ntagIds = 6\nname = 实拍秋夏宽松可爱甜美牛仔背带裙 短裙吊带裙 连衣裙 半身裙 3031\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\nsn = 3031--大时代126_P32.00\nmarketPrice = 57.6\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1nHTiXehpXXXk9sA._111532.jpg_460x460.jpg\ncost = 32\npoint = 42\nunit = 件\n_isTop = false\nprice = 42\n_isList = false\nproductCategoryId = 85\nintroduction = <p align=center><strong><font size=5 face=楷体_GB2312>颜色：图片色</font></strong><br><font color=#000000 size=5 face=楷体_GB2312><strong>面料：</strong></font><font color=#ff0000 size=4><strong><font face=楷体_GB2312><font size=5>牛仔面料，无弹力</font></font></strong></font></p><p align=center><font color=#ff0000><strong><font size=5><font face=楷体_GB2312><font color=#000000>尺寸说明：</font>（单位CM）</font></font></strong></font></p><p align=center><font size=4 face=楷体_GB2312>平铺手工测量有少许误差</font></p><p align=center>●<font color=#333333>关于颜色：网购难免会有色差!!请以实物色为准</font></p><p align=center><strong><span style=font-size: 24.0px;><font color=#333333></font></span></strong></p><p align=center><strong><span style=font-size: 24.0px;><font color=#333333>&nbsp;S：<span style=color: #cc0000;>裙长</span>31<span style=color: #cc0000;>腰围</span>72<span style=color: #cc0000;>下摆围<font color=#808000>86</font></span><font color=#808000>&nbsp;</font><span style=color: #cc0000;>带长</span>37（可调）</font></span></strong></p><p align=center><strong><font size=5><font color=#666666>M:&nbsp;</font><font color=#ff0000>裙长</font><font color=#666666>31</font>&nbsp;<font color=#ff0000>腰围</font><font color=#666666>74</font><font color=#ff0000>下摆围</font><font color=#808040>90</font><font color=#ff0000>带长</font><font color=#666666>37(可调)</font></font></strong></p><p align=center><strong><font size=5><font color=#666666>L:&nbsp;&nbsp;</font><font color=#ff0000>裙长</font><font color=#666666>32</font>&nbsp;<font color=#ff0000>腰围</font><font color=#666666>78</font>&nbsp;<font color=#ff0000>下摆围</font><font color=#808040>94</font><font color=#ff0000>带长</font><font color=#666666>37(可调)</font></font></strong></p><p align=center><strong><font color=#666666 size=5>XL：<font color=#ff0000>裙长</font>32<font color=#ff0000>腰围</font>80<font color=#ff0000>下摆围</font><font color=#808040>98</font><font color=#ff0000>带长</font>38（可调）</font></strong></p><p><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font color=#808080 size=3 face=宋体-PUA></font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font color=#808080 size=3 face=宋体-PUA></font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font color=#808080 size=3 face=宋体-PUA>充满2012时尚的KK，</font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font face=宋体-PUA><font color=#808080 size=3>时髦的背带设计，穿出不一样的味道，</font></font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#333333 size=2><font face=宋体-PUA><font color=#808080 size=3>充满了诱人的复古味道，</font></font></font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;text-align: center;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px;><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑><font color=#808080 size=3 face=宋体-PUA>超有独特味道，是今年春季不可缺或缺的单品！！！</font></font></strong></font></strong></span></span></font></strong></p><p style=padding-bottom: 0.0px;padding-top: 0.0px;padding-left: 0.0px;margin: 1.12em 0.0px;padding-right: 0.0px; align=center><strong><font color=#666666 size=5><span style=white-space: normal;text-transform: none;word-spacing: 0.0px;color: #404040;orphans: 2;widows: 2;letter-spacing: normal;background-color: #ffffff;text-indent: 0.0px;><span style=font-size: 24.0px;><strong><font color=#5a5a5a face=微软雅黑><strong><font color=#5a5a5a face=微软雅黑></font></strong></font></strong></span></span></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5>网络图片，供参考。</font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong>&nbsp;</p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p align=center><strong><font color=#666666 size=5></font></strong></p><p><strong><font color=#666666 size=5></font></strong></p><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0385.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0386.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0387.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0390.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0394.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0398.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0402.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0403.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0406.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0408.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0410.jpg><img border=0 src=http://luoyibing.vip.kabiqi.com//3031实拍1/IMG_0411.jpg>\n');
INSERT INTO `xx_log` VALUES ('110', '2015-03-10 23:18:44', '2015-03-10 23:18:44', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T11WNKXBVhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1184\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T11WNKXBVhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T11WNKXBVhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 2014夏季 新款 圆领 吊带 系带 无袖牛仔雪纺连衣裙-7728\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T11WNKXBVhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 7728--女人街511-1_P35.00\nmarketPrice = 63\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 35\npoint = 45\nunit = 件\n_isTop = false\nprice = 45\n_isList = false\nproductCategoryId = 85\nintroduction = <p align=center><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2uUmhXKtaXXXXXXXX_!!99924954.jpg></p><p align=center><img align=middle src=http://img03.taobaocdn.com/imgextra/i3/99924954/T2zLGjXN0XXXXXXXXX_!!99924954.jpg></p><p align=center>&nbsp;</p><p align=center><img align=middle src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2XmOiXRFXXXXXXXXX_!!99924954.jpg></p><p align=center><img src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2ijiiXF4aXXXXXXXX_!!99924954.jpg></p><p align=center><img src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2ueqjXQRXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2jcqjXSdXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/TB2HivDXVXXXXbjXXXXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T2f3ijXP4XXXXXXXXX_!!99924954.jpg><br><br><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T2TkmiXGtaXXXXXXXX_!!99924954.jpg></p><p align=center><font><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T2KLGjXQJXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2f99hXKFaXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T2bt9jXQtXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/TB2scLDXVXXXXXBXpXXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/TB2l2bDXVXXXXczXXXXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2IL1kXGVXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2mUajXLpXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T27zChXL0aXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T2AMWiXH8aXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2pzekXFhXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/TB26jnDXVXXXXaUXXXXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2G11iXIVaXXXXXXXX_!!99924954.jpg><br><br></font></p><font><font><font><div style=text-align: center; align=center>&nbsp;</div><p align=center><font><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2JXiiXJ4aXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2CvShXO0aXXXXXXXX_!!99924954.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/99924954/T2VBujXLVXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2ovKkXGVXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T20D5hXLxaXXXXXXXX_!!99924954.jpg><br><br></font></p><div style=text-align: center;>&nbsp;</div><div style=text-align: center;><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2E5yjXONXXXXXXXXX_!!99924954.jpg></div><div style=text-align: center;>&nbsp;</div><font><p align=center><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2vAGjXNBXXXXXXXXX_!!99924954.jpg><br><br><br><img src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2EOakXKFXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/99924954/T2qYyjXSpXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/99924954/T2kXmkXKFXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T26UCjXKNXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T2b6uhXLRaXXXXXXXX_!!99924954.jpg><br><br><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/99924954/T2jJqjXQVXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/99924954/T27Y1iXJFaXXXXXXXX_!!99924954.jpg><br><br><img src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2AJ1jXQdXXXXXXXXX_!!99924954.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/99924954/T2aRWjXMNXXXXXXXXX_!!99924954.jpg><br><img align=middle src=http://img02.taobaocdn.com/imgextra/i2/99924954/T2KSSiXUlXXXXXXXXX_!!99924954.jpg></p></font></font></font></font>\n');
INSERT INTO `xx_log` VALUES ('111', '2015-03-10 23:18:48', '2015-03-10 23:18:48', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T19ruiXhNgXXXtA2w__075954.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1185\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T19ruiXhNgXXXtA2w__075954.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T19ruiXhNgXXXtA2w__075954.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 8126款半身牛仔裙 特价\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T19ruiXhNgXXXtA2w__075954.jpg_460x460.jpg\nsn = 0--富丽D4060-A_P20.00\nmarketPrice = 36\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 20\npoint = 30\nunit = 件\n_isTop = false\nprice = 30\n_isList = false\nproductCategoryId = 85\nintroduction = <br><br><table border=0 cellspacing=0 cellpadding=0 width=570 align=center height=300><tr><td><table border=0 cellspacing=5 cellpadding=0 width=570 height=337><tr><td bgcolor=#fab8c1 height=32 width=123>&nbsp;<strong><font color=#ffffff>商品名称</font></strong></td><td bgcolor=#eaeaea width=432>&nbsp;8126#牛仔拼色半身裙</td></tr><tr><td bgcolor=#fab8c1 height=32>&nbsp;<strong><font color=#ffffff>商品材质</font></strong></td><td bgcolor=#eaeaea>&nbsp;60%棉+40%涤纶 </td></tr><tr><td bgcolor=#fab8c1 height=32>&nbsp;<strong><font color=#ffffff>商品尺寸</font></strong></td><td bgcolor=#eaeaea><p>M码:腰围76厘米，长度80厘米，臀围82厘米</p><p>L码:腰围80厘米 长度82厘米，臀围86厘米</p><p><br>&nbsp;</p></td></tr><tr><td bgcolor=#fab8c1 height=32>&nbsp;<strong><font color=#ffffff>颜色选择</font></strong></td><td bgcolor=#eaeaea>&nbsp;灰色</td></tr><tr><td bgcolor=#fab8c1 height=32 colspan=2>&nbsp;<strong><font color=#ffffff>宝贝详情：</font></strong></td></tr><tr><td bgcolor=#eaeaea height=142 colspan=2>&nbsp;</td></tr></table></td></tr></table><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><div style=text-align: center;><img src=http://img02.taobaocdn.com/imgextra/i2/713843109/T2tAkgXEJXXXXXXXXX_!!713843109.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/713843109/T2E0AjXsNXXXXXXXXX_!!713843109.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/713843109/T2MQQdXwlaXXXXXXXX_!!713843109.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/713843109/T26cgjXtdXXXXXXXXX_!!713843109.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/713843109/T2trQeXvBaXXXXXXXX_!!713843109.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/713843109/T2_q.jXttXXXXXXXXX_!!713843109.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/713843109/T2wjcfXtlaXXXXXXXX_!!713843109.jpg><br><br><img src=http://img02.taobaocdn.com/imgextra/i2/713843109/T2yKMkXpJXXXXXXXXX_!!713843109.jpg><br><br><img src=http://img04.taobaocdn.com/imgextra/i4/713843109/T2FiQgXpdaXXXXXXXX_!!713843109.jpg><br><br><img src=http://img01.taobaocdn.com/imgextra/i1/713843109/T2ZaMiXw8XXXXXXXXX_!!713843109.jpg><br><br><img src=http://img03.taobaocdn.com/imgextra/i3/713843109/T2FQsiXsRXXXXXXXXX_!!713843109.jpg><br>&nbsp;</div><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p><p align=center>&nbsp;</p>\n');
INSERT INTO `xx_log` VALUES ('112', '2015-03-10 23:18:54', '2015-03-10 23:18:54', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1i8RoXwRiXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1186\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1i8RoXwRiXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1i8RoXwRiXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 【本店实拍】2014韩版女装春秋短裤牛仔热裤牛仔裙裤蕾丝裙裤621\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1i8RoXwRiXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 621--女人街808-B_P25.00\nmarketPrice = 45\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 25\npoint = 35\nunit = 件\n_isTop = false\nprice = 35\n_isList = false\nproductCategoryId = 85\nintroduction = <p><img src=http://875831850.myzcm.net/2012/08/875831850/621/尺寸图.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0270.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0267.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0265.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0262.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0260.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0250.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0247.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0245.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0238.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0236.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0254.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0253.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0252.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0257.jpg><img src=http://875831850.myzcm.net/2012/08/875831850/621/kh000889-0304_0255.jpg></p>\n');
INSERT INTO `xx_log` VALUES ('113', '2015-03-10 23:19:01', '2015-03-10 23:19:01', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1yQJRXDFhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1187\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1yQJRXDFhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1yQJRXDFhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 2013新款日系无袖收腰蝴蝶结牛仔裙大裙摆连衣裙子A9559【实拍】\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1yQJRXDFhXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 9559--宝华416-B_P38.00\nmarketPrice = 68.4\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 38\npoint = 48\nunit = 件\n_isTop = false\nprice = 48\n_isList = false\nproductCategoryId = 85\nintroduction = <p style=text-align: center;><span style=color: #ff0000;><span style=font-size: 36.0px;></span></span></p><p style=text-align: center;><font color=#660000>vivi最新揭载，Lena秀肩膀立体蝴蝶结超美超减龄~~牛仔连衣裙~~</font></p><p style=text-align: center;><span style=color: #000000;><span style=font-size: 14.0px;></span></span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=font-size: 18.0px;><strong><span style=color: #000000;>M：胸围80-86 裙长76 腰围68</span></strong></span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=font-size: 18.0px;><strong><span style=color: #000000;>L: 胸围82-88 裙长78 腰围74</span></strong></span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=color: #000000;><font size=+0><span style=font-size: 14.0px;></span>材质：100%棉</font></span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=color: #000000;>2012最新款春夏美裙，超美的一款牛仔裙~lena在vivi3月中大篇幅秀了哦~</span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=color: #000000;>牛仔裙本身就很讨喜~亲们的夏天衣柜里肯定有牛仔裙的身影吧~</span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=color: #000000;>dazzlin今年出的这款，简直符合光对牛仔裙的任何要求~~！</span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=color: #000000;>刚刚好的长度，不会让人显得拖沓~~腰部设计更是完美~~显身材比例哦~</span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=color: #000000;>穿上去有瞬间变九头身完美比例的感觉~~</span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><span style=color: #000000;>肩部的袖子那就是胸前蝴蝶结的另一部分~超别致的甜美气质~适合所有气质的女生呢~~</span></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>木扣增添了整条裙子的小清新气质~让人超想去海边~~~</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>外面随意搭配一件开衫或者短外套~</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>就能对付春秋的天气了哦~</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>夏天直接穿，没有任何多余的累赘，整条裙子本身就是亮点中的亮点~~</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>让你在人群中体现与众不同的气质~</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530820345.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530819686.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530819853.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530820022.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530820172.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530819207.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530819054.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530818887.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530818737.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530818568.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530818417.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530818268.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530818102.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530817933.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530817768.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/13653081952.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530817597.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530817431.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530817262.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530817117.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530819374.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530816953.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530816804.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530816656.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530816507.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530816357.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530816209.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;><img align=absmiddle src=http://img31.wal8.com/img31/236506_20120227214344/136530820516.jpg></p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p><p style=margin: 1.12em 0.0px;padding: 0.0px;text-align: center;>&nbsp;</p>\n');
INSERT INTO `xx_log` VALUES ('114', '2015-03-10 23:19:06', '2015-03-10 23:19:06', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1189\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 8529夏季短袖连衣裙 女牛仔连衣裙 韩版甜美 蕾丝薄款韩版 实拍\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 8529#--大时代转角01_P56.00\nmarketPrice = 100.8\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 56\npoint = 66\nunit = 件\n_isTop = false\nprice = 66\n_isList = false\nproductCategoryId = 85\nintroduction = <p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T2ERT3Xp4XXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2jJ61Xv4aXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2h_z2XE8XXXXXXXXX_!!693655899.jpg><img align=absMiddle src=http://img01.taobaocdn.com/imgextra/i1/693655899/T2IHY2XtlaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2alr3XqxXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2Tw62XpXaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2MTT2XDRXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2Srr3XCFXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T2vnP2XE0XXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2zRT2XpJaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img01.taobaocdn.com/imgextra/i1/693655899/T2vl63XqdXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2sEf1XsxaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T29Uv2XDVXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2hy21XvJaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;>&nbsp;</p><p style=text-align: center;>&nbsp;</p>\n');
INSERT INTO `xx_log` VALUES ('115', '2015-03-10 23:19:11', '2015-03-10 23:19:11', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1189\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 8529夏季短袖连衣裙 女牛仔连衣裙 韩版甜美 蕾丝薄款韩版 实拍\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 8529#--大时代转角01_P56.00\nmarketPrice = 100.8\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ncost = 56\npoint = 66\nunit = 件\n_isTop = false\nprice = 66\n_isList = false\nproductCategoryId = 85\nintroduction = <p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T2ERT3Xp4XXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2jJ61Xv4aXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2h_z2XE8XXXXXXXXX_!!693655899.jpg><img align=absMiddle src=http://img01.taobaocdn.com/imgextra/i1/693655899/T2IHY2XtlaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2alr3XqxXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2Tw62XpXaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2MTT2XDRXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2Srr3XCFXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T2vnP2XE0XXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2zRT2XpJaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img01.taobaocdn.com/imgextra/i1/693655899/T2vl63XqdXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2sEf1XsxaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T29Uv2XDVXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2hy21XvJaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;>&nbsp;</p><p style=text-align: center;>&nbsp;</p>\n');
INSERT INTO `xx_log` VALUES ('116', '2015-03-10 23:19:15', '2015-03-10 23:19:15', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1189\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 8529夏季短袖连衣裙 女牛仔连衣裙 韩版甜美 蕾丝薄款韩版 实拍\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 8529#--大时代转角01_P56.00\nmarketPrice = 100.8\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1Y7XWXtBdXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ncost = 56\npoint = 66\nunit = 件\n_isTop = false\nprice = 66\n_isList = false\nproductCategoryId = 85\nintroduction = <p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T2ERT3Xp4XXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2jJ61Xv4aXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2h_z2XE8XXXXXXXXX_!!693655899.jpg><img align=absMiddle src=http://img01.taobaocdn.com/imgextra/i1/693655899/T2IHY2XtlaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2alr3XqxXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2Tw62XpXaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2MTT2XDRXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2Srr3XCFXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T2vnP2XE0XXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2zRT2XpJaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img01.taobaocdn.com/imgextra/i1/693655899/T2vl63XqdXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img03.taobaocdn.com/imgextra/i3/693655899/T2sEf1XsxaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img04.taobaocdn.com/imgextra/i4/693655899/T29Uv2XDVXXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;><img align=absMiddle src=http://img02.taobaocdn.com/imgextra/i2/693655899/T2hy21XvJaXXXXXXXX_!!693655899.jpg></p><p style=text-align: center;>&nbsp;</p><p style=text-align: center;>&nbsp;</p>\n');
INSERT INTO `xx_log` VALUES ('117', '2015-03-10 23:19:20', '2015-03-10 23:19:20', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1hTlbFchaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1197\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1hTlbFchaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1hTlbFchaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 实拍 6182 原单好品质 蕾丝拼接浅色系牛仔背带短裙\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1hTlbFchaXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = Jan-82--大西豪101-102_P37.00\nmarketPrice = 66.6\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 37\npoint = 47\nunit = 件\n_isTop = false\nprice = 47\n_isList = false\nproductCategoryId = 85\nintroduction = <p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;font: 14.0px 21.0px tahoma arial 宋体 sans-serif;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><strong>有没有很精致的呢~</strong></p><p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;font: 14.0px 21.0px tahoma arial 宋体 sans-serif;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><strong>背带是可以调节的 所以长短可以稍微控制下哈。。</strong></p><p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;font: 14.0px 21.0px tahoma arial 宋体 sans-serif;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><strong>S 下半身裙长：29cm（背带可调节长短） 腰围：78cm 臀围：85cm</strong></p><p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;font: 14.0px 21.0px tahoma arial 宋体 sans-serif;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><strong>M 下半身裙长：30cm（背带可调节长短） 腰围：80cm 臀围：88cm</strong></p><p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;font: 14.0px 21.0px tahoma arial 宋体 sans-serif;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;L 下半身裙长 ：31cm(背带可调节长短） 腰围：82cm 臀围：90cm&nbsp;&nbsp;&nbsp;</strong><br><br><strong><img src=http://img04.taobaocdn.com/imgextra/i4/799143100/T2uWSaX9dXXXXXXXXX_!!799143100.jpg><img src=http://img02.taobaocdn.com/imgextra/i2/799143100/T24bWaX.NXXXXXXXXX_!!799143100.jpg><img src=http://img02.taobaocdn.com/imgextra/i2/799143100/T2ptyaX8FXXXXXXXXX_!!799143100.jpg><img src=http://img02.taobaocdn.com/imgextra/i2/799143100/T2JHOcXZpXXXXXXXXX_!!799143100.jpg><img src=http://img04.taobaocdn.com/imgextra/i4/799143100/T2xEebXZlXXXXXXXXX_!!799143100.jpg><img src=http://img01.taobaocdn.com/imgextra/i1/799143100/T2z4SXX3NaXXXXXXXX_!!799143100.jpg><img src=http://img02.taobaocdn.com/imgextra/i2/799143100/T2jzKbX2hXXXXXXXXX_!!799143100.jpg><img src=http://img04.taobaocdn.com/imgextra/i4/799143100/T2cNGaX7XXXXXXXXXX_!!799143100.jpg><img src=http://img01.taobaocdn.com/imgextra/i1/799143100/T2XCiaX6BXXXXXXXXX_!!799143100.jpg><img src=http://img02.taobaocdn.com/imgextra/i2/799143100/T23ImbX4tXXXXXXXXX_!!799143100.jpg><img src=http://img03.taobaocdn.com/imgextra/i3/799143100/T27haaX4xXXXXXXXXX_!!799143100.jpg><img src=http://img03.taobaocdn.com/imgextra/i3/799143100/T2xpWbX5hXXXXXXXXX_!!799143100.jpg><img src=http://img03.taobaocdn.com/imgextra/i3/799143100/T2bX1bX5xXXXXXXXXX_!!799143100.jpg><img src=http://img04.taobaocdn.com/imgextra/i4/799143100/T2noyXXWFaXXXXXXXX_!!799143100.jpg><img src=http://img04.taobaocdn.com/imgextra/i4/799143100/T2aICbX4BXXXXXXXXX_!!799143100.jpg></strong></p>\n');
INSERT INTO `xx_log` VALUES ('118', '2015-03-10 23:19:57', '2015-03-10 23:19:57', null, '0:0:0:0:0:0:0:1', '编辑商品', 'admin', 'parameter_189 = \nisList = true\nweight = \nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1M.d7Xw8gXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nmemo = \nseoKeywords = \nparameter_186 = \nparameter_185 = \nparameter_188 = \nparameter_187 = \nparameter_182 = \nparameter_181 = \nparameter_184 = \nseoDescription = \nparameter_183 = \nbrandId = \nparameter_180 = \nid = 1188\n_isGift = false\nseoTitle = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1M.d7Xw8gXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nstock = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1M.d7Xw8gXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\ntoken = 9e35ef4e-f54c-4d13-8b1d-60d1e2d58210\nstockMemo = \ntagIds = 6\nname = 0699# 实拍2013韩版显瘦牛仔裙 后背蕾丝 配小熊 腰带 牛仔连衣裙\nproductImages[0].title = \nisTop = true\n_isMarketable = false\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/牛仔裙/T1M.d7Xw8gXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nsn = 699--女人街717A_P49.00\nmarketPrice = 88.2\nparameter_179 = \nkeyword = \nproductImages[0].order = \nisMarketable = true\nimage = \ncost = 49\npoint = 59\nunit = 件\n_isTop = false\nprice = 59\n_isList = false\nproductCategoryId = 85\nintroduction = <div><div><br><div style=text-align: center;><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/a.jpg><p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><font color=#ff0000 size=6><strong>【宝贝详情..o(&cap;_&cap;)o百分百实物拍摄】：</strong></font></p><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/a6.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/a1.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/a4.jpg><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/a5.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/a3.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/a2.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/a7.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/Img13768.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/Img13769.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/DSC_05_1.JPG><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/DSC_05_4.JPG><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/8a.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/DSC_05_3.JPG><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/5a.jpg><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/DSC_05_2.JPG><br><br><img src=http://tbphoto2.bababian.com/upload5/wangluoniouzai/0568/7a.jpg><br>&nbsp;</div></div></div><div>&nbsp;</div><div><div><div>&nbsp;</div><div>&nbsp;</div></div><div><div>&nbsp;</div><div><div>&nbsp;</div></div></div></div><p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><strong><font color=#ff0000 size=6></font></strong></p><p align=center><span style=font-size: 18.0px;><strong><font color=#000000 size=7 style=background-color: #ff0080;><strong>模特实拍 非官方杂志图</strong></font></strong></span></p><p><span style=font-size: 18.0px;><strong>本店模特均为独家专属模特 ，图片都是独一无二的，盗图一经发现 直接投诉到淘宝!</strong></span></p><p><strong><font color=#666666 size=2>◆关于色差－本店尽全力减小色差问题的存在，但是由于每台显示器的品牌设置不同，同件物品在室内与在室外看的颜色也会有所差异，所以这个问题是网购中的弊端，无法避免的，恳请对颜色要求很高的MM慎重购买。</font></strong><br>&nbsp;</p><p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><img align=middle src=http://tbphoto2.bababian.com/upload5/demoncatt/2012my/mst_m.jpg></p><p style=text-align: center;padding-bottom: 0.0px;widows: 2;text-transform: none;background-color: #ffffff;text-indent: 0.0px;margin: 1.12em 0.0px;padding-left: 0.0px;padding-right: 0.0px;white-space: normal;orphans: 2;letter-spacing: normal;color: #404040;word-spacing: 0.0px;padding-top: 0.0px;><strong><font color=#ff0000 size=6></font></strong></p>\n');
INSERT INTO `xx_log` VALUES ('119', '2017-02-14 20:25:45', '2017-02-14 20:25:45', null, '127.0.0.1', '编辑商品', 'admin', 'marketPrice = 10.8\ntagIds = 5\nmemo = \n_isGift = false\nseoTitle = \nseoKeywords = \nisList = true\npoint = 16\nspecificationIds = 7\nspecificationIds = 8\n_isList = false\nproductCategoryId = 94\n_isTop = false\nprice = 16\n_isMarketable = false\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/女鞋/T1dVtLXu0eXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/女鞋/T1dVtLXu0eXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nid = 1256\nsn = 506-女人街168D_P6.00\nstock = \nkeyword = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/女鞋/T1dVtLXu0eXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nintroduction = <p>\r\n	<strong><span style=\"color:#ff0000;font-size:medium;\">本款鞋子尺码正常如果脚很胖，建议拍大一码哦！材质：毛巾布，人字拖，颜色：蓝色、黑色、玫红色</span></strong>！<img align=\"absMiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/606424445/T29iulXHBaXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img02.taobaocdn.com/imgextra/i2/606424445/T29fGnXFpXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/606424445/T2jJKnXHNXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/606424445/T2lpClXKtaXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/606424445/T2U6SmXMxXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/606424445/T2eOylXUBXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img03.taobaocdn.com/imgextra/i3/606424445/T2bJqlXHxaXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/606424445/T2PIimXRhXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img03.taobaocdn.com/imgextra/i3/606424445/T2DaCmXS8XXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/606424445/T2ZdimXQhXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img02.taobaocdn.com/imgextra/i2/606424445/T2amGmXLBXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img02.taobaocdn.com/imgextra/i2/606424445/T2aoilXT0XXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/606424445/T239GlXFxaXXXXXXXX-606424445.jpg\" />\r\n</p>\nimage = http://127.0.0.1:8080/easy-shopping/upload/image/ad_login.jpg\nstockMemo = \nspecification_8 = 80\ncost = 6\nproductImages[0].title = \nspecificationProductIds = 1256\nspecification_7 = 77\nseoDescription = \nproductImages[0].order = \nisMarketable = true\nweight = \ntoken = 5fb2eeeb-dade-4b73-badd-7430cee18079\nunit = 件\nisTop = true\nbrandId = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/女鞋/T1dVtLXu0eXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nname = 新款厚底坡跟人字凉拖鞋防水台女款夏季松糕女沙滩鞋506\n');
INSERT INTO `xx_log` VALUES ('120', '2017-02-14 20:26:35', '2017-02-14 20:26:35', null, '127.0.0.1', '编辑商品', 'admin', 'marketPrice = 10.8\ntagIds = 5\nmemo = \n_isGift = false\nseoTitle = \nseoKeywords = \nisList = true\npoint = 16\nspecificationIds = 7\nspecificationIds = 8\n_isList = false\nproductCategoryId = 94\n_isTop = false\nprice = 16\n_isMarketable = false\nproductImages[0].source = http://localhost:8080/easy-shopping/upload/image/201407/女鞋/T1dVtLXu0eXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nproductImages[0].large = http://localhost:8080/easy-shopping/upload/image/201407/女鞋/T1dVtLXu0eXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nid = 1256\nsn = 506-女人街168D_P6.00\nstock = \nkeyword = \nproductImages[0].medium = http://localhost:8080/easy-shopping/upload/image/201407/女鞋/T1dVtLXu0eXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nintroduction = <p>\r\n	<strong><span style=\"color:#ff0000;font-size:medium;\">本款鞋子尺码正常如果脚很胖，建议拍大一码哦！材质：毛巾布，人字拖，颜色：蓝色、黑色、玫红色</span></strong>！<img align=\"absMiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/606424445/T29iulXHBaXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img02.taobaocdn.com/imgextra/i2/606424445/T29fGnXFpXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/606424445/T2jJKnXHNXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/606424445/T2lpClXKtaXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/606424445/T2U6SmXMxXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/606424445/T2eOylXUBXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img03.taobaocdn.com/imgextra/i3/606424445/T2bJqlXHxaXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/606424445/T2PIimXRhXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img03.taobaocdn.com/imgextra/i3/606424445/T2DaCmXS8XXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img01.taobaocdn.com/imgextra/i1/606424445/T2ZdimXQhXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img02.taobaocdn.com/imgextra/i2/606424445/T2amGmXLBXXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img02.taobaocdn.com/imgextra/i2/606424445/T2aoilXT0XXXXXXXXX-606424445.jpg\" /><img align=\"absMiddle\" src=\"http://img04.taobaocdn.com/imgextra/i4/606424445/T239GlXFxaXXXXXXXX-606424445.jpg\" />\r\n</p>\nimage = http://127.0.0.1:8080/easy-shopping/upload/image/watermark.png\nstockMemo = \nspecification_8 = 80\ncost = 6\nproductImages[0].title = \nspecificationProductIds = 1256\nspecification_7 = 77\nseoDescription = \nproductImages[0].order = \nisMarketable = true\nweight = \ntoken = 5fb2eeeb-dade-4b73-badd-7430cee18079\nunit = 件\nisTop = true\nbrandId = \nproductImages[0].thumbnail = http://localhost:8080/easy-shopping/upload/image/201407/女鞋/T1dVtLXu0eXXXXXXXX_!!0-item_pic.jpg_460x460.jpg\nname = 新款厚底坡跟人字凉拖鞋防水台女款夏季松糕女沙滩鞋506\n');
INSERT INTO `xx_log` VALUES ('121', '2017-02-21 20:55:05', '2017-02-21 20:55:05', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1256\nids = 1257\nids = 1258\nids = 1260\nids = 1261\nids = 1262\nids = 1263\nids = 1264\nids = 1265\nids = 1266\nids = 1267\nids = 1268\nids = 1269\nids = 1270\nids = 1271\nids = 1272\nids = 1273\nids = 1274\nids = 1275\nids = 1276\n');
INSERT INTO `xx_log` VALUES ('122', '2017-02-21 20:55:15', '2017-02-21 20:55:15', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1277\nids = 1278\nids = 1279\nids = 1228\nids = 1229\nids = 1230\nids = 1231\nids = 1232\nids = 1233\nids = 1234\nids = 1235\nids = 1236\nids = 1237\nids = 1238\nids = 1239\nids = 1240\nids = 1241\nids = 1242\nids = 1243\nids = 1244\n');
INSERT INTO `xx_log` VALUES ('123', '2017-02-21 20:56:55', '2017-02-21 20:56:55', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1246\nids = 1247\nids = 1248\nids = 1249\nids = 1250\nids = 1251\nids = 1252\nids = 1253\nids = 1254\nids = 1255\nids = 1183\nids = 1184\nids = 1185\nids = 1186\nids = 1187\nids = 1188\nids = 1189\nids = 1191\nids = 1192\nids = 1193\n');
INSERT INTO `xx_log` VALUES ('124', '2017-02-21 20:57:06', '2017-02-21 20:57:06', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1195\nids = 1196\nids = 1197\nids = 1198\nids = 1199\nids = 1200\nids = 1201\nids = 1202\nids = 1203\nids = 1204\nids = 1205\nids = 1206\nids = 1207\nids = 1208\nids = 1209\nids = 1210\nids = 1211\nids = 1213\nids = 1214\nids = 1215\n');
INSERT INTO `xx_log` VALUES ('125', '2017-02-21 20:57:14', '2017-02-21 20:57:14', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1216\nids = 1217\nids = 1218\nids = 1219\nids = 1220\nids = 1221\nids = 1222\nids = 1223\nids = 1224\nids = 1225\nids = 1140\nids = 1141\nids = 1142\nids = 1143\nids = 1144\nids = 1145\nids = 1146\nids = 1147\nids = 1148\nids = 1149\n');
INSERT INTO `xx_log` VALUES ('126', '2017-02-21 21:07:14', '2017-02-21 21:07:14', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1150\nids = 1151\nids = 1152\nids = 1153\nids = 1154\nids = 1155\nids = 1156\nids = 1157\nids = 1158\nids = 1159\nids = 1160\nids = 1161\nids = 1162\nids = 1163\nids = 1164\nids = 1165\nids = 1166\nids = 1167\nids = 1168\nids = 1169\n');
INSERT INTO `xx_log` VALUES ('127', '2017-02-21 21:07:30', '2017-02-21 21:07:30', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1170\nids = 1171\nids = 1172\nids = 1173\nids = 1174\nids = 1175\nids = 1176\nids = 1177\nids = 1178\nids = 1179\nids = 1180\nids = 1181\nids = 1182\nids = 1085\nids = 1086\nids = 1087\nids = 1088\nids = 1089\nids = 1090\nids = 1091\n');
INSERT INTO `xx_log` VALUES ('128', '2017-02-21 21:07:37', '2017-02-21 21:07:37', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1092\nids = 1093\nids = 1094\nids = 1095\nids = 1096\nids = 1097\nids = 1098\nids = 1099\nids = 1100\nids = 1101\nids = 1102\nids = 1103\nids = 1104\nids = 1105\nids = 1106\nids = 1107\nids = 1108\nids = 1109\nids = 1110\nids = 1111\n');
INSERT INTO `xx_log` VALUES ('129', '2017-02-21 21:07:42', '2017-02-21 21:07:42', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1112\nids = 1113\nids = 1114\nids = 1115\nids = 1116\nids = 1117\nids = 1118\nids = 1119\nids = 1120\nids = 1121\nids = 1122\nids = 1123\nids = 1124\nids = 1125\nids = 1126\nids = 1127\nids = 1128\nids = 1129\nids = 1130\nids = 1131\n');
INSERT INTO `xx_log` VALUES ('130', '2017-02-21 21:07:47', '2017-02-21 21:07:47', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1132\nids = 1133\nids = 1134\nids = 1135\nids = 1136\nids = 1137\nids = 1138\nids = 1139\nids = 1026\nids = 1027\nids = 1028\nids = 1029\nids = 1030\nids = 1031\nids = 1032\nids = 1033\nids = 1034\nids = 1035\nids = 1036\nids = 1037\n');
INSERT INTO `xx_log` VALUES ('131', '2017-02-21 21:07:53', '2017-02-21 21:07:53', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1038\nids = 1039\nids = 1040\nids = 1041\nids = 1042\nids = 1043\nids = 1044\nids = 1045\nids = 1046\nids = 1047\nids = 1048\nids = 1049\nids = 1050\nids = 1051\nids = 1052\nids = 1053\nids = 1054\nids = 1055\nids = 1056\nids = 1057\n');
INSERT INTO `xx_log` VALUES ('132', '2017-02-21 21:07:59', '2017-02-21 21:07:59', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1058\nids = 1059\nids = 1060\nids = 1061\nids = 1062\nids = 1063\nids = 1064\nids = 1065\nids = 1066\nids = 1067\nids = 1068\nids = 1069\nids = 1070\nids = 1071\nids = 1072\nids = 1073\nids = 1074\nids = 1075\nids = 1076\nids = 1077\n');
INSERT INTO `xx_log` VALUES ('133', '2017-02-21 21:08:05', '2017-02-21 21:08:05', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1078\nids = 1079\nids = 1080\nids = 1081\nids = 1082\nids = 1083\nids = 1024\nids = 1025\nids = 976\nids = 977\nids = 978\nids = 979\nids = 980\nids = 981\nids = 982\nids = 983\nids = 984\nids = 985\nids = 986\nids = 987\n');
INSERT INTO `xx_log` VALUES ('134', '2017-02-21 21:08:10', '2017-02-21 21:08:10', null, '127.0.0.1', '删除商品', 'admin', 'ids = 988\nids = 989\nids = 990\nids = 991\nids = 992\nids = 993\nids = 994\nids = 995\nids = 996\nids = 997\nids = 998\nids = 999\nids = 1000\nids = 1001\nids = 1002\nids = 1003\nids = 1004\nids = 1005\nids = 1006\nids = 1007\n');
INSERT INTO `xx_log` VALUES ('135', '2017-02-21 21:08:15', '2017-02-21 21:08:15', null, '127.0.0.1', '删除商品', 'admin', 'ids = 1008\nids = 1009\nids = 1010\nids = 1011\nids = 1012\nids = 1013\nids = 1014\nids = 1015\nids = 1016\nids = 1017\nids = 1018\nids = 1019\nids = 1020\nids = 1021\nids = 1022\nids = 1023\nids = 945\nids = 946\nids = 947\nids = 948\n');
INSERT INTO `xx_log` VALUES ('136', '2017-02-21 21:08:21', '2017-02-21 21:08:21', null, '127.0.0.1', '删除商品', 'admin', 'ids = 949\nids = 950\nids = 951\nids = 952\nids = 953\nids = 954\nids = 955\nids = 956\nids = 957\nids = 958\nids = 959\nids = 960\nids = 961\nids = 962\nids = 963\nids = 964\nids = 965\nids = 966\nids = 967\nids = 968\n');
INSERT INTO `xx_log` VALUES ('137', '2017-02-21 21:08:28', '2017-02-21 21:08:28', null, '127.0.0.1', '删除商品', 'admin', 'ids = 969\nids = 970\nids = 971\nids = 972\nids = 973\nids = 974\nids = 975\nids = 904\nids = 905\nids = 906\nids = 907\nids = 908\nids = 909\nids = 910\nids = 911\nids = 912\nids = 913\nids = 914\nids = 915\nids = 916\n');
INSERT INTO `xx_log` VALUES ('138', '2017-02-21 21:08:34', '2017-02-21 21:08:34', null, '127.0.0.1', '删除商品', 'admin', 'ids = 917\nids = 918\nids = 919\nids = 920\nids = 921\nids = 922\nids = 923\nids = 924\nids = 925\nids = 926\nids = 927\nids = 928\nids = 929\nids = 930\nids = 931\nids = 932\nids = 933\nids = 934\nids = 935\nids = 936\n');
INSERT INTO `xx_log` VALUES ('139', '2017-02-21 21:08:39', '2017-02-21 21:08:39', null, '127.0.0.1', '删除商品', 'admin', 'ids = 937\nids = 938\nids = 939\nids = 940\nids = 941\nids = 942\nids = 943\nids = 944\nids = 855\nids = 856\nids = 857\nids = 858\nids = 859\nids = 860\nids = 861\nids = 862\nids = 863\nids = 864\nids = 865\nids = 866\n');
INSERT INTO `xx_log` VALUES ('140', '2017-02-21 21:08:44', '2017-02-21 21:08:44', null, '127.0.0.1', '删除商品', 'admin', 'ids = 867\nids = 868\nids = 869\nids = 870\nids = 871\nids = 872\nids = 873\nids = 874\nids = 875\nids = 876\nids = 877\nids = 878\nids = 879\nids = 880\nids = 881\nids = 882\nids = 883\nids = 884\nids = 885\nids = 886\n');
INSERT INTO `xx_log` VALUES ('141', '2017-02-21 21:08:51', '2017-02-21 21:08:51', null, '127.0.0.1', '删除商品', 'admin', 'ids = 887\nids = 888\nids = 889\nids = 890\nids = 891\nids = 892\nids = 893\nids = 894\nids = 895\nids = 896\nids = 897\nids = 898\nids = 899\nids = 900\nids = 901\nids = 902\nids = 903\n');

-- ----------------------------
-- Table structure for xx_member
-- ----------------------------
DROP TABLE IF EXISTS `xx_member`;
CREATE TABLE `xx_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` decimal(27,12) DEFAULT NULL,
  `attribute_value0` varchar(255) DEFAULT NULL,
  `attribute_value1` varchar(255) DEFAULT NULL,
  `attribute_value2` varchar(255) DEFAULT NULL,
  `attribute_value3` varchar(255) DEFAULT NULL,
  `attribute_value4` varchar(255) DEFAULT NULL,
  `attribute_value5` varchar(255) DEFAULT NULL,
  `attribute_value6` varchar(255) DEFAULT NULL,
  `attribute_value7` varchar(255) DEFAULT NULL,
  `attribute_value8` varchar(255) DEFAULT NULL,
  `attribute_value9` varchar(255) DEFAULT NULL,
  `balance` decimal(27,12) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_locked` bit(1) NOT NULL,
  `locked_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `point` bigint(20) DEFAULT NULL,
  `register_ip` varchar(255) DEFAULT NULL,
  `safe_key_expire` datetime DEFAULT NULL,
  `safe_key_value` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  `member_rank` bigint(20) DEFAULT NULL,
  `v_code` varchar(6) DEFAULT NULL,
  `v_code_create` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK92D398B939A0DADE` (`area`),
  KEY `FK92D398B937884F5B` (`member_rank`),
  CONSTRAINT `FK92D398B937884F5B` FOREIGN KEY (`member_rank`) REFERENCES `xx_member_rank` (`id`),
  CONSTRAINT `FK92D398B939A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member
-- ----------------------------
INSERT INTO `xx_member` VALUES ('3', '2014-05-23 23:33:36', '2014-07-14 22:47:57', 'ffee', '0.000000000000', null, null, null, null, null, null, null, null, null, null, '0.000000000000', '2014-05-23 00:00:00', 'fa@134.com', '0', '', '\0', null, '2014-07-14 22:47:57', '0', '0:0:0:0:0:0:0:1', null, 'shit', 'e2fc714c4727ee9395f324cd2e7f331f', null, '0', '0:0:0:0:0:0:0:1', null, null, 'abcd', null, '3219', '1');
INSERT INTO `xx_member` VALUES ('4', '2014-06-17 23:09:51', '2014-06-17 23:09:51', null, '0.000000000000', null, null, null, null, null, null, null, null, null, null, '0.000000000000', null, 'huangjianwu@foxmail.com', '0', '', '\0', null, '2014-06-17 23:09:51', '0', '27.47.23.51', null, null, '6e458aa69069e6cace448d8f4532870f', null, '0', '27.47.23.51', null, null, 'hu', null, null, '1');
INSERT INTO `xx_member` VALUES ('5', '2014-07-07 21:05:45', '2014-07-07 21:05:45', null, '0.000000000000', null, null, null, null, null, null, null, null, null, null, '0.000000000000', null, 'zhzhy637@163.com', '0', '', '\0', null, '2014-07-07 21:05:45', '0', '127.0.0.1', null, null, '05a671c66aefea124cc08b76ea6d30bb', null, '0', '127.0.0.1', null, null, 'test', null, null, '1');
INSERT INTO `xx_member` VALUES ('6', '2015-03-10 20:55:29', '2015-03-10 21:05:44', '车程', '0.000000000000', null, null, null, null, null, null, null, null, null, null, '0.000000000000', '1989-03-01 00:00:00', 'test@163.com', '0', '', '\0', null, '2015-03-10 21:05:44', '0', '0:0:0:0:0:0:0:1', '443322', 'wu', 'f0ac9a3830bb62a0e8da4c583b0739f8', null, '0', '0:0:0:0:0:0:0:1', null, null, 'wujian', null, '367', '1');

-- ----------------------------
-- Table structure for xx_member_attribute
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_attribute`;
CREATE TABLE `xx_member_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `is_required` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `property_index` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_attribute
-- ----------------------------
INSERT INTO `xx_member_attribute` VALUES ('1', '2014-05-15 00:03:43', '2014-05-15 00:03:43', '1', '', '\0', '姓名', null, '0');
INSERT INTO `xx_member_attribute` VALUES ('2', '2014-05-15 00:03:44', '2014-07-07 20:29:15', '2', '', '', '性别', null, '1');
INSERT INTO `xx_member_attribute` VALUES ('3', '2014-05-15 00:03:45', '2014-05-15 00:03:45', '3', '', '\0', '出生日期', null, '2');
INSERT INTO `xx_member_attribute` VALUES ('4', '2014-05-15 00:03:46', '2014-05-15 00:03:46', '4', '', '\0', '地区', null, '3');
INSERT INTO `xx_member_attribute` VALUES ('5', '2014-05-15 00:03:47', '2014-05-15 00:03:47', '5', '', '\0', '地址', null, '4');
INSERT INTO `xx_member_attribute` VALUES ('6', '2014-05-15 00:03:48', '2014-05-15 00:03:48', '6', '\0', '\0', '邮编', null, '5');
INSERT INTO `xx_member_attribute` VALUES ('7', '2014-05-15 00:03:49', '2014-05-15 00:03:49', '7', '\0', '\0', '电话', null, '6');
INSERT INTO `xx_member_attribute` VALUES ('8', '2014-05-15 00:03:50', '2014-07-07 20:27:04', '8', '', '\0', '手机', null, '7');

-- ----------------------------
-- Table structure for xx_member_attribute_option
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_attribute_option`;
CREATE TABLE `xx_member_attribute_option` (
  `member_attribute` bigint(20) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  KEY `FKC3DC263E8A8815` (`member_attribute`),
  CONSTRAINT `FKC3DC263E8A8815` FOREIGN KEY (`member_attribute`) REFERENCES `xx_member_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_attribute_option
-- ----------------------------

-- ----------------------------
-- Table structure for xx_member_favorite_product
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_favorite_product`;
CREATE TABLE `xx_member_favorite_product` (
  `favorite_members` bigint(20) NOT NULL,
  `favorite_products` bigint(20) NOT NULL,
  PRIMARY KEY (`favorite_members`,`favorite_products`),
  KEY `FK44DF1412A43B40D4` (`favorite_members`),
  KEY `FK44DF1412830D5552` (`favorite_products`),
  CONSTRAINT `FK44DF1412830D5552` FOREIGN KEY (`favorite_products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK44DF1412A43B40D4` FOREIGN KEY (`favorite_members`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_favorite_product
-- ----------------------------

-- ----------------------------
-- Table structure for xx_member_rank
-- ----------------------------
DROP TABLE IF EXISTS `xx_member_rank`;
CREATE TABLE `xx_member_rank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `amount` decimal(21,6) DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `is_special` bit(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `scale` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `amount` (`amount`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_member_rank
-- ----------------------------
INSERT INTO `xx_member_rank` VALUES ('1', '2014-05-15 00:03:38', '2014-05-15 00:03:38', '0.000000', '', '\0', '普通会员', '1');
INSERT INTO `xx_member_rank` VALUES ('2', '2014-05-15 00:03:39', '2014-05-15 00:03:39', '1000.000000', '\0', '\0', '银牌会员', '1');
INSERT INTO `xx_member_rank` VALUES ('3', '2014-05-15 00:03:40', '2014-05-15 00:03:40', '10000.000000', '\0', '\0', '金牌会员', '1');
INSERT INTO `xx_member_rank` VALUES ('4', '2014-05-15 00:03:41', '2014-05-15 00:03:41', '100000.000000', '\0', '\0', '白金会员', '0.99');
INSERT INTO `xx_member_rank` VALUES ('5', '2014-05-15 00:03:42', '2014-05-15 00:03:42', null, '\0', '', '贵宾会员', '0.95');

-- ----------------------------
-- Table structure for xx_message
-- ----------------------------
DROP TABLE IF EXISTS `xx_message`;
CREATE TABLE `xx_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_draft` bit(1) NOT NULL,
  `receiver_delete` bit(1) NOT NULL,
  `receiver_read` bit(1) NOT NULL,
  `sender_delete` bit(1) NOT NULL,
  `sender_read` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `for_message` bigint(20) DEFAULT NULL,
  `receiver` bigint(20) DEFAULT NULL,
  `sender` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC7FBB5C886A07D93` (`sender`),
  KEY `FKC7FBB5C8E2B39A54` (`for_message`),
  KEY `FKC7FBB5C88C6C4D4D` (`receiver`),
  CONSTRAINT `FKC7FBB5C886A07D93` FOREIGN KEY (`sender`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FKC7FBB5C88C6C4D4D` FOREIGN KEY (`receiver`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FKC7FBB5C8E2B39A54` FOREIGN KEY (`for_message`) REFERENCES `xx_message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_message
-- ----------------------------
INSERT INTO `xx_message` VALUES ('1', '2014-07-07 21:06:16', '2014-07-07 21:06:55', 'zhzhy637@163.com', '127.0.0.1', '\0', '\0', '', '\0', '', 'test mail', null, '5', null);

-- ----------------------------
-- Table structure for xx_navigation
-- ----------------------------
DROP TABLE IF EXISTS `xx_navigation`;
CREATE TABLE `xx_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_blank_target` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_navigation
-- ----------------------------
INSERT INTO `xx_navigation` VALUES ('1', '2014-05-15 00:00:17', '2015-03-10 20:57:43', '1', '', '会员中心', '0', '/easy-shopping/member/index.jhtml');
INSERT INTO `xx_navigation` VALUES ('2', '2014-05-15 00:00:18', '2015-03-10 20:57:59', '2', '', '购物指南', '0', '/easy-shopping/article/list/3.jhtml');
INSERT INTO `xx_navigation` VALUES ('4', '2014-05-15 00:00:20', '2015-03-09 22:55:21', '4', '\0', '首页', '1', '/easy-shopping/');
INSERT INTO `xx_navigation` VALUES ('12', '2014-05-15 00:00:28', '2015-03-10 20:58:51', '12', '', '关于我们', '2', '/easy-shopping/article/list/7.jhtml');
INSERT INTO `xx_navigation` VALUES ('13', '2014-05-15 00:00:29', '2015-03-10 20:59:33', '13', '', '联系我们', '2', '/easy-shopping/article/list/7.jhtml');
INSERT INTO `xx_navigation` VALUES ('14', '2014-05-15 00:00:30', '2015-03-10 20:59:55', '14', '', '诚聘英才', '2', '/easy-shopping/article/list/7.jhtml');
INSERT INTO `xx_navigation` VALUES ('15', '2014-05-15 00:00:31', '2015-03-10 21:00:10', '15', '', '法律声明', '2', '/easy-shopping/article/list/7.jhtml');
INSERT INTO `xx_navigation` VALUES ('16', '2014-05-15 00:00:32', '2015-03-10 21:00:23', '16', '\0', '友情链接', '2', '/easy-shopping/friend_link.jhtml');
INSERT INTO `xx_navigation` VALUES ('17', '2014-05-15 00:00:33', '2014-05-15 00:00:33', '17', '', '支付方式', '2', '/easy-shopping/article/list/4.jhtml');
INSERT INTO `xx_navigation` VALUES ('18', '2014-05-15 00:00:34', '2014-05-15 00:00:34', '18', '', '配送方式', '2', '/easy-shopping/article/list/5.jhtml');
INSERT INTO `xx_navigation` VALUES ('21', '2014-05-17 23:36:47', '2015-03-09 22:55:34', '5', '\0', '女装', '1', '/easy-shopping/product/list/79.jhtml');
INSERT INTO `xx_navigation` VALUES ('22', '2014-07-08 18:16:00', '2015-03-09 22:55:44', '6', '\0', '女鞋', '1', '/easy-shopping/product/list/93.jhtml');
INSERT INTO `xx_navigation` VALUES ('23', '2014-07-08 18:16:28', '2015-03-10 20:58:23', '7', '\0', '实体店', '1', '/easy-shopping/product/list/90.jhtml');

-- ----------------------------
-- Table structure for xx_order
-- ----------------------------
DROP TABLE IF EXISTS `xx_order`;
CREATE TABLE `xx_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `amount_paid` decimal(21,6) NOT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) NOT NULL,
  `coupon_discount` decimal(21,6) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `fee` decimal(21,6) NOT NULL,
  `freight` decimal(21,6) NOT NULL,
  `invoice_title` varchar(255) DEFAULT NULL,
  `is_allocated_stock` bit(1) NOT NULL,
  `is_invoice` bit(1) NOT NULL,
  `lock_expire` datetime DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `offset_amount` decimal(21,6) NOT NULL,
  `order_status` int(11) NOT NULL,
  `payment_method_name` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `point` bigint(20) NOT NULL,
  `promotion` varchar(255) DEFAULT NULL,
  `promotion_discount` decimal(21,6) NOT NULL,
  `shipping_method_name` varchar(255) DEFAULT NULL,
  `shipping_status` int(11) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `tax` decimal(21,6) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `area` bigint(20) DEFAULT NULL,
  `coupon_code` bigint(20) DEFAULT NULL,
  `member` bigint(20) NOT NULL,
  `operator` bigint(20) DEFAULT NULL,
  `payment_method` bigint(20) DEFAULT NULL,
  `shipping_method` bigint(20) DEFAULT NULL,
  `take_code` varchar(30) NOT NULL COMMENT '取货码',
  `take_status` int(11) NOT NULL COMMENT '取货状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK25E6B94F67F7C585` (`shipping_method`),
  KEY `FK25E6B94F39A0DADE` (`area`),
  KEY `FK25E6B94F7C62EDF8` (`member`),
  KEY `FK25E6B94FC050045D` (`coupon_code`),
  KEY `FK25E6B94FD7122AAF` (`operator`),
  KEY `FK25E6B94FD3A8BE7D` (`payment_method`),
  CONSTRAINT `FK25E6B94F39A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`),
  CONSTRAINT `FK25E6B94F67F7C585` FOREIGN KEY (`shipping_method`) REFERENCES `xx_shipping_method` (`id`),
  CONSTRAINT `FK25E6B94F7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FK25E6B94FC050045D` FOREIGN KEY (`coupon_code`) REFERENCES `xx_coupon_code` (`id`),
  CONSTRAINT `FK25E6B94FD3A8BE7D` FOREIGN KEY (`payment_method`) REFERENCES `xx_payment_method` (`id`),
  CONSTRAINT `FK25E6B94FD7122AAF` FOREIGN KEY (`operator`) REFERENCES `xx_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order
-- ----------------------------
INSERT INTO `xx_order` VALUES ('4', '2014-06-29 19:13:38', '2014-06-30 21:42:17', 'ew', '0.000000', '北京市东城区', 'aatt', '0.000000', '2014-06-30 19:13:38', '0.000000', '0.000000', null, '\0', '\0', '2014-06-29 23:23:37', null, '0.000000', '0', '网上支付', '0', 'fasfe', '33', null, '0.000000', '普通快递', '0', '20140629404', '0.000000', '323dfa', '2', null, '3', null, '1', '1');

-- ----------------------------
-- Table structure for xx_order_coupon
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_coupon`;
CREATE TABLE `xx_order_coupon` (
  `orders` bigint(20) NOT NULL,
  `coupons` bigint(20) NOT NULL,
  KEY `FKA3F6D516E538DDF7` (`coupons`),
  KEY `FKA3F6D516B992E8EF` (`orders`),
  CONSTRAINT `FKA3F6D516B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`),
  CONSTRAINT `FKA3F6D516E538DDF7` FOREIGN KEY (`coupons`) REFERENCES `xx_coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for xx_order_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_item`;
CREATE TABLE `xx_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `is_gift` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(21,6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `return_quantity` int(11) NOT NULL,
  `shipped_quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `orders` bigint(20) NOT NULL,
  `product` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD69FF403B992E8EF` (`orders`),
  KEY `FKD69FF40379F8D99A` (`product`),
  CONSTRAINT `FKD69FF40379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FKD69FF403B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order_item
-- ----------------------------
INSERT INTO `xx_order_item` VALUES ('5', '2014-06-29 19:13:38', '2014-07-01 16:14:34', '夏季蕾丝短裤[规格值2]', '\0', '夏季蕾丝短裤', '33.000000', '1', '0', '0', '99', null, '1', '4', null);

-- ----------------------------
-- Table structure for xx_order_log
-- ----------------------------
DROP TABLE IF EXISTS `xx_order_log`;
CREATE TABLE `xx_order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF6684C54B992E8EF` (`orders`),
  CONSTRAINT `FKF6684C54B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_order_log
-- ----------------------------
INSERT INTO `xx_order_log` VALUES ('4', '2014-06-29 19:13:38', '2014-06-29 19:13:38', null, null, '0', '4');

-- ----------------------------
-- Table structure for xx_parameter
-- ----------------------------
DROP TABLE IF EXISTS `xx_parameter`;
CREATE TABLE `xx_parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parameter_group` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8238FD2A818BF383` (`parameter_group`),
  CONSTRAINT `FK8238FD2A818BF383` FOREIGN KEY (`parameter_group`) REFERENCES `xx_parameter_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_parameter
-- ----------------------------
INSERT INTO `xx_parameter` VALUES ('143', '2014-06-29 18:58:42', '2014-06-29 18:59:43', '2', '参数2', '11');
INSERT INTO `xx_parameter` VALUES ('144', '2014-06-30 17:14:05', '2014-06-30 17:17:50', '1', '白色', '12');
INSERT INTO `xx_parameter` VALUES ('145', '2014-06-30 17:14:05', '2014-06-30 17:17:50', '1', '红色', '12');
INSERT INTO `xx_parameter` VALUES ('146', '2014-06-30 17:14:05', '2014-06-30 17:17:50', '1', '黑色', '12');
INSERT INTO `xx_parameter` VALUES ('147', '2014-06-30 17:14:05', '2014-06-30 17:17:50', '1', '蓝色', '12');
INSERT INTO `xx_parameter` VALUES ('148', '2014-06-30 17:14:05', '2014-06-30 17:17:50', '1', '橙色', '12');
INSERT INTO `xx_parameter` VALUES ('149', '2014-06-30 17:14:05', '2014-06-30 17:17:50', '1', '粉色', '12');
INSERT INTO `xx_parameter` VALUES ('150', '2014-06-30 17:14:05', '2014-06-30 17:17:50', '1', '黄色', '12');
INSERT INTO `xx_parameter` VALUES ('151', '2014-06-30 21:55:50', '2014-07-01 15:50:02', '2', 'S', '13');
INSERT INTO `xx_parameter` VALUES ('152', '2014-06-30 21:55:50', '2014-07-01 15:50:02', '2', 'M', '13');
INSERT INTO `xx_parameter` VALUES ('153', '2014-06-30 21:55:50', '2014-07-01 15:50:02', '2', 'L', '13');
INSERT INTO `xx_parameter` VALUES ('154', '2014-06-30 22:03:01', '2014-07-01 15:51:41', '3', '高腰', '14');
INSERT INTO `xx_parameter` VALUES ('155', '2014-06-30 22:03:01', '2014-07-01 15:51:41', '3', '中腰', '14');
INSERT INTO `xx_parameter` VALUES ('156', '2014-06-30 22:03:01', '2014-07-01 15:51:41', '3', '低腰', '14');
INSERT INTO `xx_parameter` VALUES ('157', '2014-06-30 22:06:06', '2014-07-01 15:50:13', '4', '常规', '15');
INSERT INTO `xx_parameter` VALUES ('158', '2014-06-30 22:06:06', '2014-07-01 15:50:13', '4', '加厚', '15');
INSERT INTO `xx_parameter` VALUES ('159', '2014-06-30 22:06:06', '2014-07-01 15:50:13', '4', '薄款', '15');
INSERT INTO `xx_parameter` VALUES ('160', '2014-06-30 22:23:13', '2014-07-01 15:50:02', '2', '均码', '13');
INSERT INTO `xx_parameter` VALUES ('161', '2014-07-01 15:49:32', '2014-07-01 15:49:53', '1', '图片色', '16');
INSERT INTO `xx_parameter` VALUES ('162', '2014-07-01 15:49:32', '2014-07-01 15:49:53', '1', '深蓝色', '16');
INSERT INTO `xx_parameter` VALUES ('163', '2014-07-01 15:49:32', '2014-07-01 15:49:53', '1', '浅蓝色', '16');
INSERT INTO `xx_parameter` VALUES ('164', '2014-07-01 15:49:32', '2014-07-01 15:49:53', '1', '牛仔蓝', '16');
INSERT INTO `xx_parameter` VALUES ('165', '2014-07-01 15:50:52', '2014-07-01 15:50:52', '2', '均码', '17');
INSERT INTO `xx_parameter` VALUES ('166', '2014-07-01 15:50:52', '2014-07-01 15:50:52', '2', '26', '17');
INSERT INTO `xx_parameter` VALUES ('167', '2014-07-01 15:50:52', '2014-07-01 15:50:52', '2', '27', '17');
INSERT INTO `xx_parameter` VALUES ('168', '2014-07-01 15:50:52', '2014-07-01 15:50:52', '2', '28', '17');
INSERT INTO `xx_parameter` VALUES ('169', '2014-07-01 15:50:52', '2014-07-01 15:50:52', '2', '29', '17');
INSERT INTO `xx_parameter` VALUES ('170', '2014-07-01 15:50:52', '2014-07-01 15:50:52', '2', '30', '17');
INSERT INTO `xx_parameter` VALUES ('171', '2014-07-01 15:51:29', '2014-07-01 15:51:29', '3', '常规', '18');
INSERT INTO `xx_parameter` VALUES ('172', '2014-07-01 15:51:29', '2014-07-01 15:51:29', '3', '高腰', '18');
INSERT INTO `xx_parameter` VALUES ('173', '2014-07-01 15:51:29', '2014-07-01 15:51:29', '3', '中腰', '18');
INSERT INTO `xx_parameter` VALUES ('174', '2014-07-01 15:51:29', '2014-07-01 15:51:29', '3', '低腰', '18');
INSERT INTO `xx_parameter` VALUES ('175', '2014-07-01 15:51:41', '2014-07-01 15:51:41', '3', '常规', '14');
INSERT INTO `xx_parameter` VALUES ('176', '2014-07-01 15:52:09', '2014-07-01 15:52:09', '4', '常规', '19');
INSERT INTO `xx_parameter` VALUES ('177', '2014-07-01 15:52:09', '2014-07-01 15:52:09', '4', '薄款', '19');
INSERT INTO `xx_parameter` VALUES ('178', '2014-07-01 15:52:09', '2014-07-01 15:52:09', '4', '加厚', '19');
INSERT INTO `xx_parameter` VALUES ('179', '2014-07-01 15:52:55', '2014-07-01 15:53:28', '1', '图片色', '20');
INSERT INTO `xx_parameter` VALUES ('180', '2014-07-01 15:52:55', '2014-07-01 15:53:28', '1', '深蓝色', '20');
INSERT INTO `xx_parameter` VALUES ('181', '2014-07-01 15:52:55', '2014-07-01 15:53:28', '1', '浅蓝色', '20');
INSERT INTO `xx_parameter` VALUES ('182', '2014-07-01 15:53:23', '2014-07-01 15:53:23', '2', '均码', '21');
INSERT INTO `xx_parameter` VALUES ('183', '2014-07-01 15:53:23', '2014-07-01 15:53:23', '2', 'S', '21');
INSERT INTO `xx_parameter` VALUES ('184', '2014-07-01 15:53:23', '2014-07-01 15:53:23', '2', 'M', '21');
INSERT INTO `xx_parameter` VALUES ('185', '2014-07-01 15:53:23', '2014-07-01 15:53:23', '2', 'L', '21');
INSERT INTO `xx_parameter` VALUES ('186', '2014-07-01 15:54:05', '2014-07-01 15:54:05', '3', '常规', '22');
INSERT INTO `xx_parameter` VALUES ('187', '2014-07-01 15:54:05', '2014-07-01 15:54:05', '3', '高腰', '22');
INSERT INTO `xx_parameter` VALUES ('188', '2014-07-01 15:54:05', '2014-07-01 15:54:05', '3', '中腰', '22');
INSERT INTO `xx_parameter` VALUES ('189', '2014-07-01 15:54:05', '2014-07-01 15:54:05', '3', '低腰', '22');
INSERT INTO `xx_parameter` VALUES ('190', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '白色', '23');
INSERT INTO `xx_parameter` VALUES ('191', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '黑色', '23');
INSERT INTO `xx_parameter` VALUES ('192', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '红色', '23');
INSERT INTO `xx_parameter` VALUES ('193', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '酒红色', '23');
INSERT INTO `xx_parameter` VALUES ('194', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '粉色', '23');
INSERT INTO `xx_parameter` VALUES ('195', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '米色', '23');
INSERT INTO `xx_parameter` VALUES ('196', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '蓝色', '23');
INSERT INTO `xx_parameter` VALUES ('197', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '黄色', '23');
INSERT INTO `xx_parameter` VALUES ('198', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '1', '紫色', '23');
INSERT INTO `xx_parameter` VALUES ('199', '2014-07-01 15:55:53', '2014-07-01 15:55:53', '2', '均码', '24');
INSERT INTO `xx_parameter` VALUES ('200', '2014-07-01 15:55:53', '2014-07-01 15:55:53', '2', 'S', '24');
INSERT INTO `xx_parameter` VALUES ('201', '2014-07-01 15:55:53', '2014-07-01 15:55:53', '2', 'M', '24');
INSERT INTO `xx_parameter` VALUES ('202', '2014-07-01 15:55:53', '2014-07-01 15:55:53', '2', 'L', '24');
INSERT INTO `xx_parameter` VALUES ('203', '2014-07-01 15:57:04', '2014-07-01 15:57:04', '3', '宽松', '25');
INSERT INTO `xx_parameter` VALUES ('204', '2014-07-01 15:57:04', '2014-07-01 15:57:04', '3', '修身', '25');
INSERT INTO `xx_parameter` VALUES ('205', '2014-07-01 15:57:46', '2014-07-01 15:57:46', '4', '常规', '26');
INSERT INTO `xx_parameter` VALUES ('206', '2014-07-01 15:57:46', '2014-07-01 15:57:46', '4', '中长款', '26');
INSERT INTO `xx_parameter` VALUES ('207', '2014-07-01 15:57:46', '2014-07-01 15:57:46', '4', '长款', '26');
INSERT INTO `xx_parameter` VALUES ('208', '2014-07-01 15:57:46', '2014-07-01 15:57:46', '4', '短款', '26');
INSERT INTO `xx_parameter` VALUES ('209', '2014-07-01 15:59:23', '2014-07-01 15:59:23', '1', '白色', '27');
INSERT INTO `xx_parameter` VALUES ('210', '2014-07-01 15:59:23', '2014-07-01 15:59:23', '1', '黑色', '27');
INSERT INTO `xx_parameter` VALUES ('211', '2014-07-01 15:59:23', '2014-07-01 15:59:23', '1', '蓝色', '27');
INSERT INTO `xx_parameter` VALUES ('212', '2014-07-01 15:59:23', '2014-07-01 15:59:23', '1', '红色', '27');
INSERT INTO `xx_parameter` VALUES ('213', '2014-07-01 15:59:23', '2014-07-01 15:59:23', '1', '粉色', '27');
INSERT INTO `xx_parameter` VALUES ('214', '2014-07-01 15:59:23', '2014-07-01 15:59:23', '1', '紫色', '27');
INSERT INTO `xx_parameter` VALUES ('215', '2014-07-01 15:59:23', '2014-07-01 15:59:23', '1', '绿色', '27');
INSERT INTO `xx_parameter` VALUES ('216', '2014-07-01 15:59:45', '2014-07-01 15:59:45', '2', '均码', '28');
INSERT INTO `xx_parameter` VALUES ('217', '2014-07-01 15:59:45', '2014-07-01 15:59:45', '2', 'S', '28');
INSERT INTO `xx_parameter` VALUES ('218', '2014-07-01 15:59:45', '2014-07-01 15:59:45', '2', 'M', '28');
INSERT INTO `xx_parameter` VALUES ('219', '2014-07-01 15:59:45', '2014-07-01 15:59:45', '2', 'L', '28');
INSERT INTO `xx_parameter` VALUES ('220', '2014-07-01 16:00:12', '2014-07-01 16:00:12', '3', '宽松型', '29');
INSERT INTO `xx_parameter` VALUES ('221', '2014-07-01 16:00:12', '2014-07-01 16:00:12', '3', '修身型', '29');
INSERT INTO `xx_parameter` VALUES ('222', '2014-07-01 16:00:49', '2014-07-01 16:00:49', '4', '常规', '30');
INSERT INTO `xx_parameter` VALUES ('223', '2014-07-01 16:00:49', '2014-07-01 16:00:49', '4', '中长款', '30');
INSERT INTO `xx_parameter` VALUES ('224', '2014-07-01 16:00:49', '2014-07-01 16:00:49', '4', '长款', '30');
INSERT INTO `xx_parameter` VALUES ('225', '2014-07-01 16:00:49', '2014-07-01 16:00:49', '4', '短款', '30');
INSERT INTO `xx_parameter` VALUES ('226', '2014-07-01 16:01:33', '2014-07-01 16:01:33', '5', '立领', '31');
INSERT INTO `xx_parameter` VALUES ('227', '2014-07-01 16:01:33', '2014-07-01 16:01:33', '5', '圆领', '31');
INSERT INTO `xx_parameter` VALUES ('228', '2014-07-01 16:01:33', '2014-07-01 16:01:33', '5', 'V字领', '31');
INSERT INTO `xx_parameter` VALUES ('229', '2014-07-01 16:02:11', '2014-07-01 16:02:11', '6', '常规袖', '32');
INSERT INTO `xx_parameter` VALUES ('230', '2014-07-01 16:02:11', '2014-07-01 16:02:11', '6', '蝙蝠袖', '32');
INSERT INTO `xx_parameter` VALUES ('231', '2014-07-01 16:02:11', '2014-07-01 16:02:11', '6', '花朵袖', '32');
INSERT INTO `xx_parameter` VALUES ('232', '2014-07-01 16:03:09', '2014-07-01 16:03:09', '1', '白色', '33');
INSERT INTO `xx_parameter` VALUES ('233', '2014-07-01 16:03:09', '2014-07-01 16:03:09', '1', '黑色', '33');
INSERT INTO `xx_parameter` VALUES ('234', '2014-07-01 16:03:09', '2014-07-01 16:03:09', '1', '灰色', '33');
INSERT INTO `xx_parameter` VALUES ('235', '2014-07-01 16:03:09', '2014-07-01 16:03:09', '1', '蓝色', '33');
INSERT INTO `xx_parameter` VALUES ('236', '2014-07-01 16:03:09', '2014-07-01 16:03:09', '1', '红色', '33');
INSERT INTO `xx_parameter` VALUES ('237', '2014-07-01 16:03:09', '2014-07-01 16:03:09', '1', '绿色', '33');
INSERT INTO `xx_parameter` VALUES ('238', '2014-07-01 16:03:09', '2014-07-01 16:03:09', '1', '图片色', '33');
INSERT INTO `xx_parameter` VALUES ('239', '2014-07-01 16:03:32', '2014-07-01 16:03:32', '2', '均码', '34');
INSERT INTO `xx_parameter` VALUES ('240', '2014-07-01 16:03:32', '2014-07-01 16:03:32', '2', 'S', '34');
INSERT INTO `xx_parameter` VALUES ('241', '2014-07-01 16:03:32', '2014-07-01 16:03:32', '2', 'M', '34');
INSERT INTO `xx_parameter` VALUES ('242', '2014-07-01 16:03:32', '2014-07-01 16:03:32', '2', 'L', '34');
INSERT INTO `xx_parameter` VALUES ('243', '2014-07-01 16:04:52', '2014-07-01 16:04:52', '3', '常规', '35');
INSERT INTO `xx_parameter` VALUES ('244', '2014-07-01 16:04:52', '2014-07-01 16:04:52', '3', '中长款', '35');
INSERT INTO `xx_parameter` VALUES ('245', '2014-07-01 16:04:52', '2014-07-01 16:04:52', '3', '长款', '35');
INSERT INTO `xx_parameter` VALUES ('246', '2014-07-01 16:04:52', '2014-07-01 16:04:52', '3', '短款', '35');
INSERT INTO `xx_parameter` VALUES ('247', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '1', '白色', '36');
INSERT INTO `xx_parameter` VALUES ('248', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '1', '黑色', '36');
INSERT INTO `xx_parameter` VALUES ('249', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '1', '红色', '36');
INSERT INTO `xx_parameter` VALUES ('250', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '1', '粉色', '36');
INSERT INTO `xx_parameter` VALUES ('251', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '1', '蓝色', '36');
INSERT INTO `xx_parameter` VALUES ('252', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '1', '绿色', '36');
INSERT INTO `xx_parameter` VALUES ('253', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '1', '紫色', '36');
INSERT INTO `xx_parameter` VALUES ('254', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '1', '图片色', '36');
INSERT INTO `xx_parameter` VALUES ('255', '2014-07-01 16:06:30', '2014-07-01 16:06:30', '2', '均码', '37');
INSERT INTO `xx_parameter` VALUES ('256', '2014-07-01 16:06:30', '2014-07-01 16:06:30', '2', 'S', '37');
INSERT INTO `xx_parameter` VALUES ('257', '2014-07-01 16:06:30', '2014-07-01 16:06:30', '2', 'M', '37');
INSERT INTO `xx_parameter` VALUES ('258', '2014-07-01 16:06:30', '2014-07-01 16:06:30', '2', 'L', '37');
INSERT INTO `xx_parameter` VALUES ('259', '2014-07-01 16:07:12', '2014-07-01 16:07:12', '3', '常规', '38');
INSERT INTO `xx_parameter` VALUES ('260', '2014-07-01 16:07:12', '2014-07-01 16:07:12', '3', '高腰', '38');
INSERT INTO `xx_parameter` VALUES ('261', '2014-07-01 16:07:12', '2014-07-01 16:07:12', '3', '中腰', '38');
INSERT INTO `xx_parameter` VALUES ('262', '2014-07-01 16:07:12', '2014-07-01 16:07:12', '3', '低腰', '38');
INSERT INTO `xx_parameter` VALUES ('263', '2014-07-01 16:07:41', '2014-07-01 16:07:41', '4', '无袖', '39');
INSERT INTO `xx_parameter` VALUES ('264', '2014-07-01 16:07:41', '2014-07-01 16:07:41', '4', '常规袖', '39');
INSERT INTO `xx_parameter` VALUES ('265', '2014-07-01 16:07:41', '2014-07-01 16:07:41', '4', '蝙蝠袖', '39');
INSERT INTO `xx_parameter` VALUES ('266', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '1', '白色', '40');
INSERT INTO `xx_parameter` VALUES ('267', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '1', '黑色', '40');
INSERT INTO `xx_parameter` VALUES ('268', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '1', '红色', '40');
INSERT INTO `xx_parameter` VALUES ('269', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '1', '黄色', '40');
INSERT INTO `xx_parameter` VALUES ('270', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '1', '蓝色', '40');
INSERT INTO `xx_parameter` VALUES ('271', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '1', '灰色', '40');
INSERT INTO `xx_parameter` VALUES ('272', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '1', '绿色', '40');
INSERT INTO `xx_parameter` VALUES ('273', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '1', '图片色', '40');
INSERT INTO `xx_parameter` VALUES ('274', '2014-07-01 16:09:10', '2014-07-01 16:09:10', '2', '均码', '41');
INSERT INTO `xx_parameter` VALUES ('275', '2014-07-01 16:09:10', '2014-07-01 16:09:10', '2', 'S', '41');
INSERT INTO `xx_parameter` VALUES ('276', '2014-07-01 16:09:10', '2014-07-01 16:09:10', '2', 'M', '41');
INSERT INTO `xx_parameter` VALUES ('277', '2014-07-01 16:09:10', '2014-07-01 16:09:10', '2', 'L', '41');
INSERT INTO `xx_parameter` VALUES ('278', '2014-07-01 16:09:41', '2014-07-01 16:09:41', '3', '常规', '42');
INSERT INTO `xx_parameter` VALUES ('279', '2014-07-01 16:09:41', '2014-07-01 16:09:41', '3', '高腰', '42');
INSERT INTO `xx_parameter` VALUES ('280', '2014-07-01 16:09:41', '2014-07-01 16:09:41', '3', '中腰', '42');
INSERT INTO `xx_parameter` VALUES ('281', '2014-07-01 16:09:41', '2014-07-01 16:09:41', '3', '低腰', '42');
INSERT INTO `xx_parameter` VALUES ('282', '2014-07-01 16:10:18', '2014-07-01 16:10:18', '4', '可调节', '43');
INSERT INTO `xx_parameter` VALUES ('283', '2014-07-01 16:10:18', '2014-07-01 16:10:18', '4', '不可调节', '43');
INSERT INTO `xx_parameter` VALUES ('284', '2014-07-01 16:11:08', '2014-07-01 16:11:08', '5', 'A字裙', '44');
INSERT INTO `xx_parameter` VALUES ('285', '2014-07-01 16:11:08', '2014-07-01 16:11:08', '5', '一字裙', '44');
INSERT INTO `xx_parameter` VALUES ('286', '2014-07-01 16:11:08', '2014-07-01 16:11:08', '5', '伞裙', '44');
INSERT INTO `xx_parameter` VALUES ('287', '2014-07-01 16:11:08', '2014-07-01 16:11:08', '5', '大摆裙', '44');
INSERT INTO `xx_parameter` VALUES ('288', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '白色', '45');
INSERT INTO `xx_parameter` VALUES ('289', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '黑色', '45');
INSERT INTO `xx_parameter` VALUES ('290', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '灰色', '45');
INSERT INTO `xx_parameter` VALUES ('291', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '蓝色', '45');
INSERT INTO `xx_parameter` VALUES ('292', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '黄色', '45');
INSERT INTO `xx_parameter` VALUES ('293', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '粉色', '45');
INSERT INTO `xx_parameter` VALUES ('294', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '红色', '45');
INSERT INTO `xx_parameter` VALUES ('295', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '紫色', '45');
INSERT INTO `xx_parameter` VALUES ('296', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '1', '图片色', '45');
INSERT INTO `xx_parameter` VALUES ('297', '2014-07-01 16:12:29', '2014-07-01 16:12:29', '2', '均码', '46');
INSERT INTO `xx_parameter` VALUES ('298', '2014-07-01 16:12:29', '2014-07-01 16:12:29', '2', 'S', '46');
INSERT INTO `xx_parameter` VALUES ('299', '2014-07-01 16:12:29', '2014-07-01 16:12:29', '2', 'M', '46');
INSERT INTO `xx_parameter` VALUES ('300', '2014-07-01 16:12:29', '2014-07-01 16:12:29', '2', 'L', '46');
INSERT INTO `xx_parameter` VALUES ('301', '2014-07-01 16:12:57', '2014-07-01 16:12:57', '3', '常规', '47');
INSERT INTO `xx_parameter` VALUES ('302', '2014-07-01 16:12:57', '2014-07-01 16:12:57', '3', '高腰', '47');
INSERT INTO `xx_parameter` VALUES ('303', '2014-07-01 16:12:57', '2014-07-01 16:12:57', '3', '低腰', '47');
INSERT INTO `xx_parameter` VALUES ('304', '2014-07-01 16:12:57', '2014-07-01 16:12:57', '3', '中腰', '47');
INSERT INTO `xx_parameter` VALUES ('305', '2014-07-01 16:13:42', '2014-07-01 16:13:42', '4', 'A字裙', '48');
INSERT INTO `xx_parameter` VALUES ('306', '2014-07-01 16:13:42', '2014-07-01 16:13:42', '4', '一字裙', '48');
INSERT INTO `xx_parameter` VALUES ('307', '2014-07-01 16:13:42', '2014-07-01 16:13:42', '4', '伞裙', '48');
INSERT INTO `xx_parameter` VALUES ('308', '2014-07-01 16:13:42', '2014-07-01 16:13:42', '4', '大摆裙', '48');

-- ----------------------------
-- Table structure for xx_parameter_group
-- ----------------------------
DROP TABLE IF EXISTS `xx_parameter_group`;
CREATE TABLE `xx_parameter_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD68A4F2AD7629117` (`product_category`),
  CONSTRAINT `FKD68A4F2AD7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_parameter_group
-- ----------------------------
INSERT INTO `xx_parameter_group` VALUES ('11', '2014-06-29 18:58:42', '2014-06-29 18:59:43', '1', '参数1', '79');
INSERT INTO `xx_parameter_group` VALUES ('12', '2014-06-30 17:14:05', '2014-06-30 17:17:50', '1', '颜色', '80');
INSERT INTO `xx_parameter_group` VALUES ('13', '2014-06-30 21:55:50', '2014-07-01 15:50:02', '1', '尺寸', '80');
INSERT INTO `xx_parameter_group` VALUES ('14', '2014-06-30 22:03:01', '2014-07-01 15:51:41', '1', '女裤腰高', '80');
INSERT INTO `xx_parameter_group` VALUES ('15', '2014-06-30 22:06:06', '2014-07-01 15:50:13', '1', '厚薄', '80');
INSERT INTO `xx_parameter_group` VALUES ('16', '2014-07-01 15:49:32', '2014-07-01 15:49:53', '2', '颜色', '84');
INSERT INTO `xx_parameter_group` VALUES ('17', '2014-07-01 15:50:52', '2014-07-01 15:50:52', '2', '尺寸', '84');
INSERT INTO `xx_parameter_group` VALUES ('18', '2014-07-01 15:51:29', '2014-07-01 15:51:29', '2', '腰高', '84');
INSERT INTO `xx_parameter_group` VALUES ('19', '2014-07-01 15:52:09', '2014-07-01 15:52:09', '2', '厚薄', '84');
INSERT INTO `xx_parameter_group` VALUES ('20', '2014-07-01 15:52:55', '2014-07-01 15:53:28', '3', '颜色', '85');
INSERT INTO `xx_parameter_group` VALUES ('21', '2014-07-01 15:53:23', '2014-07-01 15:53:23', '3', '尺寸', '85');
INSERT INTO `xx_parameter_group` VALUES ('22', '2014-07-01 15:54:05', '2014-07-01 15:54:05', '3', '腰高', '85');
INSERT INTO `xx_parameter_group` VALUES ('23', '2014-07-01 15:55:29', '2014-07-01 15:55:29', '4', '颜色', '81');
INSERT INTO `xx_parameter_group` VALUES ('24', '2014-07-01 15:55:53', '2014-07-01 15:55:53', '4', '尺寸', '81');
INSERT INTO `xx_parameter_group` VALUES ('25', '2014-07-01 15:57:04', '2014-07-01 15:57:04', '4', '版型', '81');
INSERT INTO `xx_parameter_group` VALUES ('26', '2014-07-01 15:57:46', '2014-07-01 15:57:46', '4', '衣长', '81');
INSERT INTO `xx_parameter_group` VALUES ('27', '2014-07-01 15:59:23', '2014-07-01 15:59:23', '5', '颜色', '86');
INSERT INTO `xx_parameter_group` VALUES ('28', '2014-07-01 15:59:45', '2014-07-01 15:59:45', '5', '尺寸', '86');
INSERT INTO `xx_parameter_group` VALUES ('29', '2014-07-01 16:00:12', '2014-07-01 16:00:12', '5', '版型', '86');
INSERT INTO `xx_parameter_group` VALUES ('30', '2014-07-01 16:00:49', '2014-07-01 16:00:49', '5', '衣长', '86');
INSERT INTO `xx_parameter_group` VALUES ('31', '2014-07-01 16:01:33', '2014-07-01 16:01:33', '5', '领型', '86');
INSERT INTO `xx_parameter_group` VALUES ('32', '2014-07-01 16:02:11', '2014-07-01 16:02:11', '5', '袖型', '86');
INSERT INTO `xx_parameter_group` VALUES ('33', '2014-07-01 16:03:09', '2014-07-01 16:03:09', '6', '颜色', '87');
INSERT INTO `xx_parameter_group` VALUES ('34', '2014-07-01 16:03:32', '2014-07-01 16:03:32', '6', '尺寸', '87');
INSERT INTO `xx_parameter_group` VALUES ('35', '2014-07-01 16:04:52', '2014-07-01 16:04:52', '6', '衣长', '87');
INSERT INTO `xx_parameter_group` VALUES ('36', '2014-07-01 16:06:05', '2014-07-01 16:06:05', '7', '颜色', '82');
INSERT INTO `xx_parameter_group` VALUES ('37', '2014-07-01 16:06:30', '2014-07-01 16:06:30', '7', '尺寸', '82');
INSERT INTO `xx_parameter_group` VALUES ('38', '2014-07-01 16:07:12', '2014-07-01 16:07:12', '7', '腰高', '82');
INSERT INTO `xx_parameter_group` VALUES ('39', '2014-07-01 16:07:41', '2014-07-01 16:07:41', '7', '袖型', '82');
INSERT INTO `xx_parameter_group` VALUES ('40', '2014-07-01 16:08:47', '2014-07-01 16:08:47', '8', '颜色', '88');
INSERT INTO `xx_parameter_group` VALUES ('41', '2014-07-01 16:09:10', '2014-07-01 16:09:10', '8', '尺寸', '88');
INSERT INTO `xx_parameter_group` VALUES ('42', '2014-07-01 16:09:41', '2014-07-01 16:09:41', '8', '腰高', '88');
INSERT INTO `xx_parameter_group` VALUES ('43', '2014-07-01 16:10:18', '2014-07-01 16:10:18', '8', '调节', '88');
INSERT INTO `xx_parameter_group` VALUES ('44', '2014-07-01 16:11:08', '2014-07-01 16:11:08', '8', '裙摆', '88');
INSERT INTO `xx_parameter_group` VALUES ('45', '2014-07-01 16:12:06', '2014-07-01 16:12:06', '9', '颜色', '89');
INSERT INTO `xx_parameter_group` VALUES ('46', '2014-07-01 16:12:29', '2014-07-01 16:12:29', '9', '尺寸', '89');
INSERT INTO `xx_parameter_group` VALUES ('47', '2014-07-01 16:12:57', '2014-07-01 16:12:57', '9', '腰高', '89');
INSERT INTO `xx_parameter_group` VALUES ('48', '2014-07-01 16:13:42', '2014-07-01 16:13:42', '9', '裙型', '89');

-- ----------------------------
-- Table structure for xx_payment
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment`;
CREATE TABLE `xx_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `amount` decimal(21,6) NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `fee` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `method` int(11) NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_plugin_id` varchar(255) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `trade_sn` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `orders` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK602CE7C77C62EDF8` (`member`),
  KEY `FK602CE7C7B992E8EF` (`orders`),
  CONSTRAINT `FK602CE7C77C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
  CONSTRAINT `FK602CE7C7B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment
-- ----------------------------
INSERT INTO `xx_payment` VALUES ('3', '2014-06-29 19:13:44', '2014-06-29 19:13:44', null, '33.000000', null, '2014-07-14 19:13:44', '0.000000', null, '0', null, null, null, '网上支付 - 支付宝即时交易', 'alipayDirectPlugin', '20140629202', null, '0', '0', null, '4');
INSERT INTO `xx_payment` VALUES ('4', '2014-06-29 23:22:35', '2014-06-29 23:22:35', null, '33.000000', null, '2014-07-14 23:22:35', '0.000000', null, '0', null, null, null, '网上支付 - Paypal', 'paypalPlugin', '20140629203', null, '0', '0', null, '4');

-- ----------------------------
-- Table structure for xx_payment_method
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_method`;
CREATE TABLE `xx_payment_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `content` longtext,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `method` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_method
-- ----------------------------
INSERT INTO `xx_payment_method` VALUES ('1', '2014-05-15 00:00:07', '2014-05-15 00:00:07', '1', null, '支持支付宝、财付通、以及大多数网上银行支付', 'http://storage.shopxx.net/demo-image/3.0/payment_method/online.gif', '0', '网上支付', '1440');
INSERT INTO `xx_payment_method` VALUES ('2', '2014-05-15 00:00:08', '2014-05-15 00:00:08', '2', '<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/8417e751-a1d2-4727-82da-003075a44398.jpg\" />', '支持工行、建行、农行汇款支付，收款时间一般为汇款后的1-2个工作日', 'http://storage.shopxx.net/demo-image/3.0/payment_method/remittance.gif', '1', '银行汇款', null);
INSERT INTO `xx_payment_method` VALUES ('3', '2014-05-15 00:00:09', '2014-05-15 00:00:09', '3', null, '由快递公司送货上门，您签收后直接将货款交付给快递员', 'http://storage.shopxx.net/demo-image/3.0/payment_method/cash_on_delivery.gif', '1', '货到付款', null);

-- ----------------------------
-- Table structure for xx_payment_shipping_method
-- ----------------------------
DROP TABLE IF EXISTS `xx_payment_shipping_method`;
CREATE TABLE `xx_payment_shipping_method` (
  `payment_methods` bigint(20) NOT NULL,
  `shipping_methods` bigint(20) NOT NULL,
  PRIMARY KEY (`payment_methods`,`shipping_methods`),
  KEY `FKC230A01A85883714` (`shipping_methods`),
  KEY `FKC230A01AA2ED13BC` (`payment_methods`),
  CONSTRAINT `FKC230A01A85883714` FOREIGN KEY (`shipping_methods`) REFERENCES `xx_shipping_method` (`id`),
  CONSTRAINT `FKC230A01AA2ED13BC` FOREIGN KEY (`payment_methods`) REFERENCES `xx_payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_payment_shipping_method
-- ----------------------------
INSERT INTO `xx_payment_shipping_method` VALUES ('1', '1');
INSERT INTO `xx_payment_shipping_method` VALUES ('2', '1');
INSERT INTO `xx_payment_shipping_method` VALUES ('1', '2');
INSERT INTO `xx_payment_shipping_method` VALUES ('2', '2');
INSERT INTO `xx_payment_shipping_method` VALUES ('3', '2');

-- ----------------------------
-- Table structure for xx_plugin_config
-- ----------------------------
DROP TABLE IF EXISTS `xx_plugin_config`;
CREATE TABLE `xx_plugin_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `plugin_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_id` (`plugin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_plugin_config
-- ----------------------------
INSERT INTO `xx_plugin_config` VALUES ('1', '2014-05-15 00:59:07', '2014-05-15 00:59:07', '100', '', 'filePlugin');
INSERT INTO `xx_plugin_config` VALUES ('2', '2014-05-15 00:59:08', '2014-05-15 00:59:08', '1', '', 'alipayDirectPlugin');
INSERT INTO `xx_plugin_config` VALUES ('3', '2014-05-15 00:59:09', '2014-05-15 00:59:09', '2', '', 'tenpayDirectPlugin');
INSERT INTO `xx_plugin_config` VALUES ('4', '2014-05-15 00:59:10', '2014-05-15 00:59:10', '3', '', 'pay99billPlugin');
INSERT INTO `xx_plugin_config` VALUES ('5', '2014-05-15 00:59:11', '2014-05-15 00:59:11', '4', '', 'yeepayPlugin');
INSERT INTO `xx_plugin_config` VALUES ('6', '2014-05-15 00:59:12', '2014-05-15 00:59:12', '5', '', 'unionpayPlugin');
INSERT INTO `xx_plugin_config` VALUES ('7', '2014-05-15 00:59:13', '2014-05-15 00:59:13', '6', '', 'paypalPlugin');
INSERT INTO `xx_plugin_config` VALUES ('8', '2014-07-07 21:17:39', '2014-07-07 21:17:39', null, '\0', 'alipayPartnerPlugin');

-- ----------------------------
-- Table structure for xx_plugin_config_attribute
-- ----------------------------
DROP TABLE IF EXISTS `xx_plugin_config_attribute`;
CREATE TABLE `xx_plugin_config_attribute` (
  `plugin_config` bigint(20) NOT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`plugin_config`,`name`),
  KEY `FK42CB712CE174C3E7` (`plugin_config`),
  CONSTRAINT `FK42CB712CE174C3E7` FOREIGN KEY (`plugin_config`) REFERENCES `xx_plugin_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_plugin_config_attribute
-- ----------------------------
INSERT INTO `xx_plugin_config_attribute` VALUES ('2', '0', 'fee');
INSERT INTO `xx_plugin_config_attribute` VALUES ('2', 'fixed', 'feeType');
INSERT INTO `xx_plugin_config_attribute` VALUES ('2', 'abc', 'key');
INSERT INTO `xx_plugin_config_attribute` VALUES ('2', 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/alipay.gif', 'logo');
INSERT INTO `xx_plugin_config_attribute` VALUES ('2', 'abc', 'partner');
INSERT INTO `xx_plugin_config_attribute` VALUES ('2', '支付宝即时交易', 'paymentName');
INSERT INTO `xx_plugin_config_attribute` VALUES ('3', '0', 'fee');
INSERT INTO `xx_plugin_config_attribute` VALUES ('3', 'fixed', 'feeType');
INSERT INTO `xx_plugin_config_attribute` VALUES ('3', 'abc', 'key');
INSERT INTO `xx_plugin_config_attribute` VALUES ('3', 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/tenpay.gif', 'logo');
INSERT INTO `xx_plugin_config_attribute` VALUES ('3', 'abc', 'partner');
INSERT INTO `xx_plugin_config_attribute` VALUES ('3', '财付通即时交易', 'paymentName');
INSERT INTO `xx_plugin_config_attribute` VALUES ('4', '0', 'fee');
INSERT INTO `xx_plugin_config_attribute` VALUES ('4', 'fixed', 'feeType');
INSERT INTO `xx_plugin_config_attribute` VALUES ('4', 'abc', 'key');
INSERT INTO `xx_plugin_config_attribute` VALUES ('4', 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/99bill.gif', 'logo');
INSERT INTO `xx_plugin_config_attribute` VALUES ('4', 'abc', 'partner');
INSERT INTO `xx_plugin_config_attribute` VALUES ('4', '快钱支付', 'paymentName');
INSERT INTO `xx_plugin_config_attribute` VALUES ('5', '0', 'fee');
INSERT INTO `xx_plugin_config_attribute` VALUES ('5', 'fixed', 'feeType');
INSERT INTO `xx_plugin_config_attribute` VALUES ('5', 'abc', 'key');
INSERT INTO `xx_plugin_config_attribute` VALUES ('5', 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/yeepay.gif', 'logo');
INSERT INTO `xx_plugin_config_attribute` VALUES ('5', 'abc', 'partner');
INSERT INTO `xx_plugin_config_attribute` VALUES ('5', '易宝支付', 'paymentName');
INSERT INTO `xx_plugin_config_attribute` VALUES ('6', '0', 'fee');
INSERT INTO `xx_plugin_config_attribute` VALUES ('6', 'fixed', 'feeType');
INSERT INTO `xx_plugin_config_attribute` VALUES ('6', 'abc', 'key');
INSERT INTO `xx_plugin_config_attribute` VALUES ('6', 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/unionpay.gif', 'logo');
INSERT INTO `xx_plugin_config_attribute` VALUES ('6', 'abc', 'partner');
INSERT INTO `xx_plugin_config_attribute` VALUES ('6', '银联在线支付', 'paymentName');
INSERT INTO `xx_plugin_config_attribute` VALUES ('7', 'USD', 'currency');
INSERT INTO `xx_plugin_config_attribute` VALUES ('7', '0', 'fee');
INSERT INTO `xx_plugin_config_attribute` VALUES ('7', 'fixed', 'feeType');
INSERT INTO `xx_plugin_config_attribute` VALUES ('7', 'abc', 'key');
INSERT INTO `xx_plugin_config_attribute` VALUES ('7', 'http://storage.shopxx.net/demo-image/3.0/payment_plugin/paypal.gif', 'logo');
INSERT INTO `xx_plugin_config_attribute` VALUES ('7', 'abc', 'partner');
INSERT INTO `xx_plugin_config_attribute` VALUES ('7', 'Paypal', 'paymentName');

-- ----------------------------
-- Table structure for xx_product
-- ----------------------------
DROP TABLE IF EXISTS `xx_product`;
CREATE TABLE `xx_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `allocated_stock` int(11) NOT NULL,
  `attribute_value0` varchar(255) DEFAULT NULL,
  `attribute_value1` varchar(255) DEFAULT NULL,
  `attribute_value10` varchar(255) DEFAULT NULL,
  `attribute_value11` varchar(255) DEFAULT NULL,
  `attribute_value12` varchar(255) DEFAULT NULL,
  `attribute_value13` varchar(255) DEFAULT NULL,
  `attribute_value14` varchar(255) DEFAULT NULL,
  `attribute_value15` varchar(255) DEFAULT NULL,
  `attribute_value16` varchar(255) DEFAULT NULL,
  `attribute_value17` varchar(255) DEFAULT NULL,
  `attribute_value18` varchar(255) DEFAULT NULL,
  `attribute_value19` varchar(255) DEFAULT NULL,
  `attribute_value2` varchar(255) DEFAULT NULL,
  `attribute_value3` varchar(255) DEFAULT NULL,
  `attribute_value4` varchar(255) DEFAULT NULL,
  `attribute_value5` varchar(255) DEFAULT NULL,
  `attribute_value6` varchar(255) DEFAULT NULL,
  `attribute_value7` varchar(255) DEFAULT NULL,
  `attribute_value8` varchar(255) DEFAULT NULL,
  `attribute_value9` varchar(255) DEFAULT NULL,
  `cost` decimal(21,6) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `hits` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `introduction` longtext,
  `is_gift` bit(1) NOT NULL DEFAULT b'0',
  `is_list` bit(1) NOT NULL DEFAULT b'1',
  `is_marketable` bit(1) NOT NULL DEFAULT b'1',
  `is_top` bit(1) NOT NULL DEFAULT b'1',
  `keyword` varchar(255) DEFAULT NULL,
  `market_price` decimal(21,6) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `month_hits` bigint(20) NOT NULL,
  `month_hits_date` datetime NOT NULL,
  `month_sales` bigint(20) NOT NULL,
  `month_sales_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `point` bigint(20) NOT NULL,
  `price` decimal(21,6) NOT NULL,
  `sales` bigint(20) NOT NULL,
  `score` float NOT NULL,
  `score_count` bigint(20) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_memo` varchar(255) DEFAULT NULL,
  `total_score` bigint(20) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `week_hits` bigint(20) NOT NULL,
  `week_hits_date` datetime NOT NULL,
  `week_sales` bigint(20) NOT NULL,
  `week_sales_date` datetime NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `brand` bigint(20) DEFAULT NULL,
  `goods` bigint(20) NOT NULL,
  `product_category` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7C9E82B0D7629117` (`product_category`),
  KEY `FK7C9E82B0FB212D68` (`goods`),
  KEY `FK7C9E82B0FA9695CA` (`brand`),
  KEY `sn` (`sn`) USING BTREE,
  CONSTRAINT `FK7C9E82B0D7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`),
  CONSTRAINT `FK7C9E82B0FA9695CA` FOREIGN KEY (`brand`) REFERENCES `xx_brand` (`id`),
  CONSTRAINT `FK7C9E82B0FB212D68` FOREIGN KEY (`goods`) REFERENCES `xx_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1280 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product
-- ----------------------------

-- ----------------------------
-- Table structure for xx_product_category
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_category`;
CREATE TABLE `xx_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `tree_path` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1B7971ADFBDD5B73` (`parent`),
  CONSTRAINT `FK1B7971ADFBDD5B73` FOREIGN KEY (`parent`) REFERENCES `xx_product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_category
-- ----------------------------
INSERT INTO `xx_product_category` VALUES ('79', '2014-06-22 19:41:31', '2017-02-21 21:33:14', '0', '0', '食品', '实体', '实体', '实体', ',', null);
INSERT INTO `xx_product_category` VALUES ('80', '2014-06-22 19:42:45', '2014-06-30 16:30:57', '1', '1', '夏季短裤', '夏季短裤', '夏季短裤', '夏季短裤', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('81', '2014-06-22 19:43:07', '2014-06-22 19:43:07', '2', '1', 'T恤', null, 'T恤', 'T恤', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('82', '2014-06-22 19:43:28', '2014-06-30 16:33:33', '3', '1', '连衣长裙', '连衣长裙', '连衣长裙', '连衣长裙', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('84', '2014-06-30 16:30:44', '2014-06-30 16:31:07', '1', '1', '牛仔短裤', '牛仔短裤', '牛仔短裤', '牛仔短裤', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('85', '2014-06-30 16:31:50', '2014-06-30 16:31:57', '1', '1', '牛仔裙', '牛仔裙', '牛仔裙', '牛仔裙', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('86', '2014-06-30 16:32:50', '2014-06-30 16:32:50', '2', '1', '衬衫', '衬衫', '衬衫', '衬衫', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('87', '2014-06-30 16:33:09', '2014-06-30 16:33:09', '2', '1', '背心', '背心', '背心', '背心', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('88', '2014-06-30 16:33:56', '2014-06-30 16:33:56', '3', '1', '背带裙', '背带裙', '背带裙', '背带裙', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('89', '2014-06-30 16:34:25', '2014-06-30 16:34:25', '3', '1', '半身裙', '半身裙', '半身裙', '半身裙', ',79,', '79');
INSERT INTO `xx_product_category` VALUES ('90', '2014-07-07 22:50:10', '2015-03-04 21:20:03', '1', '0', '实体店', null, null, null, ',', null);
INSERT INTO `xx_product_category` VALUES ('91', '2014-07-07 22:54:13', '2014-07-07 22:54:13', '1', '1', '上装', null, null, null, ',90,', '90');
INSERT INTO `xx_product_category` VALUES ('92', '2014-07-07 22:54:47', '2014-07-07 22:54:47', '2', '1', '裙裤区', null, null, null, ',90,', '90');
INSERT INTO `xx_product_category` VALUES ('93', '2014-07-07 23:10:56', '2014-07-07 23:10:56', '2', '0', '女鞋', null, null, null, ',', null);
INSERT INTO `xx_product_category` VALUES ('94', '2014-07-08 18:33:43', '2014-07-08 18:33:43', '1', '1', '凉鞋', null, null, null, ',93,', '93');

-- ----------------------------
-- Table structure for xx_product_category_brand
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_category_brand`;
CREATE TABLE `xx_product_category_brand` (
  `product_categories` bigint(20) NOT NULL,
  `brands` bigint(20) NOT NULL,
  PRIMARY KEY (`product_categories`,`brands`),
  KEY `FKE42D6A75A2AB700F` (`brands`),
  KEY `FKE42D6A758C4C0635` (`product_categories`),
  CONSTRAINT `FKE42D6A758C4C0635` FOREIGN KEY (`product_categories`) REFERENCES `xx_product_category` (`id`),
  CONSTRAINT `FKE42D6A75A2AB700F` FOREIGN KEY (`brands`) REFERENCES `xx_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_category_brand
-- ----------------------------

-- ----------------------------
-- Table structure for xx_product_member_price
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_member_price`;
CREATE TABLE `xx_product_member_price` (
  `product` bigint(20) NOT NULL,
  `member_price` decimal(19,2) DEFAULT NULL,
  `member_price_key` bigint(20) NOT NULL,
  PRIMARY KEY (`product`,`member_price_key`),
  KEY `FKDCCD88935CCD83AE` (`member_price_key`),
  KEY `FKDCCD889379F8D99A` (`product`),
  CONSTRAINT `FKDCCD88935CCD83AE` FOREIGN KEY (`member_price_key`) REFERENCES `xx_member_rank` (`id`),
  CONSTRAINT `FKDCCD889379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_member_price
-- ----------------------------

-- ----------------------------
-- Table structure for xx_product_notify
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_notify`;
CREATE TABLE `xx_product_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `has_sent` bit(1) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDCB1ABB87C62EDF8` (`member`),
  KEY `FKDCB1ABB879F8D99A` (`product`),
  CONSTRAINT `FKDCB1ABB879F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FKDCB1ABB87C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_notify
-- ----------------------------

-- ----------------------------
-- Table structure for xx_product_parameter_value
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_parameter_value`;
CREATE TABLE `xx_product_parameter_value` (
  `product` bigint(20) NOT NULL,
  `parameter_value` varchar(255) DEFAULT NULL,
  `parameter_value_key` bigint(20) NOT NULL,
  PRIMARY KEY (`product`,`parameter_value_key`),
  KEY `FK1B76FDCCEDA221E0` (`parameter_value_key`),
  KEY `FK1B76FDCC79F8D99A` (`product`),
  CONSTRAINT `FK1B76FDCC79F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK1B76FDCCEDA221E0` FOREIGN KEY (`parameter_value_key`) REFERENCES `xx_parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_parameter_value
-- ----------------------------

-- ----------------------------
-- Table structure for xx_product_product_image
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_product_image`;
CREATE TABLE `xx_product_product_image` (
  `product` bigint(20) NOT NULL,
  `large` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  KEY `FK66470ABC79F8D99A` (`product`),
  CONSTRAINT `FK66470ABC79F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_product_image
-- ----------------------------

-- ----------------------------
-- Table structure for xx_product_specification
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_specification`;
CREATE TABLE `xx_product_specification` (
  `products` bigint(20) NOT NULL,
  `specifications` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`specifications`),
  KEY `FK622421B45096DE0F` (`products`),
  KEY `FK622421B4840DA38F` (`specifications`),
  CONSTRAINT `FK622421B45096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK622421B4840DA38F` FOREIGN KEY (`specifications`) REFERENCES `xx_specification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_specification
-- ----------------------------

-- ----------------------------
-- Table structure for xx_product_specification_value
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_specification_value`;
CREATE TABLE `xx_product_specification_value` (
  `products` bigint(20) NOT NULL,
  `specification_values` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`specification_values`),
  KEY `FKBF71FF265096DE0F` (`products`),
  KEY `FKBF71FF2677BD1CD0` (`specification_values`),
  CONSTRAINT `FKBF71FF265096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FKBF71FF2677BD1CD0` FOREIGN KEY (`specification_values`) REFERENCES `xx_specification_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_specification_value
-- ----------------------------

-- ----------------------------
-- Table structure for xx_product_tag
-- ----------------------------
DROP TABLE IF EXISTS `xx_product_tag`;
CREATE TABLE `xx_product_tag` (
  `products` bigint(20) NOT NULL,
  `tags` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`tags`),
  KEY `FK2F6A998B5096DE0F` (`products`),
  KEY `FK2F6A998BC842716F` (`tags`),
  CONSTRAINT `FK2F6A998B5096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK2F6A998BC842716F` FOREIGN KEY (`tags`) REFERENCES `xx_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_product_tag
-- ----------------------------

-- ----------------------------
-- Table structure for xx_promotion
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion`;
CREATE TABLE `xx_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `introduction` longtext,
  `is_coupon_allowed` bit(1) NOT NULL,
  `is_free_shipping` bit(1) NOT NULL,
  `maximum_price` decimal(21,6) DEFAULT NULL,
  `maximum_quantity` int(11) DEFAULT NULL,
  `minimum_price` decimal(21,6) DEFAULT NULL,
  `minimum_quantity` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `point_expression` varchar(255) DEFAULT NULL,
  `price_expression` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_promotion
-- ----------------------------
INSERT INTO `xx_promotion` VALUES ('1', '2014-05-15 00:03:06', '2015-03-10 22:26:05', '1', null, null, '<p>\r\n	活动内容：订单商品金额满300元立减10元\r\n</p>\r\n<p>\r\n	参与商品分类：连衣裙、针织衫\r\n</p>\r\n<p>\r\n	说明：参与该活动商品不允许使用优惠券\r\n</p>', '\0', '\0', null, null, null, null, '限时抢购', null, 'price * 0.9', '限时抢购');
INSERT INTO `xx_promotion` VALUES ('2', '2014-05-15 00:03:07', '2015-03-10 22:25:13', '2', null, null, '<p>\r\n	<span style=\"white-space:normal;\">活动内容：</span>订单商品价格满200元赠送双倍<span style=\"white-space:normal;\">积分</span> \r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\">参与商品分类：服饰配件、小西装</span> \r\n</p>', '', '\0', null, null, null, null, '双倍积分', 'point * 2', null, '双倍积分');
INSERT INTO `xx_promotion` VALUES ('5', '2014-06-29 18:49:47', '2015-03-10 22:25:42', '3', null, null, null, '\0', '', null, null, null, null, '每日更新', null, null, '每日更新');

-- ----------------------------
-- Table structure for xx_promotion_brand
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_brand`;
CREATE TABLE `xx_promotion_brand` (
  `promotions` bigint(20) NOT NULL,
  `brands` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`brands`),
  KEY `FKBD21C9ACA2AB700F` (`brands`),
  KEY `FKBD21C9AC682BD58F` (`promotions`),
  CONSTRAINT `FKBD21C9AC682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
  CONSTRAINT `FKBD21C9ACA2AB700F` FOREIGN KEY (`brands`) REFERENCES `xx_brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_promotion_brand
-- ----------------------------

-- ----------------------------
-- Table structure for xx_promotion_coupon
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_coupon`;
CREATE TABLE `xx_promotion_coupon` (
  `promotions` bigint(20) NOT NULL,
  `coupons` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`coupons`),
  KEY `FKE8AB1EA1E538DDF7` (`coupons`),
  KEY `FKE8AB1EA1682BD58F` (`promotions`),
  CONSTRAINT `FKE8AB1EA1682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
  CONSTRAINT `FKE8AB1EA1E538DDF7` FOREIGN KEY (`coupons`) REFERENCES `xx_coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_promotion_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for xx_promotion_member_rank
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_member_rank`;
CREATE TABLE `xx_promotion_member_rank` (
  `promotions` bigint(20) NOT NULL,
  `member_ranks` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`member_ranks`),
  KEY `FKFF359916E24D908C` (`member_ranks`),
  KEY `FKFF359916682BD58F` (`promotions`),
  CONSTRAINT `FKFF359916682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
  CONSTRAINT `FKFF359916E24D908C` FOREIGN KEY (`member_ranks`) REFERENCES `xx_member_rank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_promotion_member_rank
-- ----------------------------
INSERT INTO `xx_promotion_member_rank` VALUES ('1', '1');
INSERT INTO `xx_promotion_member_rank` VALUES ('2', '1');
INSERT INTO `xx_promotion_member_rank` VALUES ('5', '1');
INSERT INTO `xx_promotion_member_rank` VALUES ('1', '2');
INSERT INTO `xx_promotion_member_rank` VALUES ('2', '2');
INSERT INTO `xx_promotion_member_rank` VALUES ('5', '2');
INSERT INTO `xx_promotion_member_rank` VALUES ('1', '3');
INSERT INTO `xx_promotion_member_rank` VALUES ('2', '3');
INSERT INTO `xx_promotion_member_rank` VALUES ('5', '3');
INSERT INTO `xx_promotion_member_rank` VALUES ('1', '4');
INSERT INTO `xx_promotion_member_rank` VALUES ('2', '4');
INSERT INTO `xx_promotion_member_rank` VALUES ('5', '4');
INSERT INTO `xx_promotion_member_rank` VALUES ('5', '5');

-- ----------------------------
-- Table structure for xx_promotion_product
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_product`;
CREATE TABLE `xx_promotion_product` (
  `promotions` bigint(20) NOT NULL,
  `products` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`products`),
  KEY `FKE12E55D45096DE0F` (`products`),
  KEY `FKE12E55D4682BD58F` (`promotions`),
  CONSTRAINT `FKE12E55D45096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FKE12E55D4682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_promotion_product
-- ----------------------------

-- ----------------------------
-- Table structure for xx_promotion_product_category
-- ----------------------------
DROP TABLE IF EXISTS `xx_promotion_product_category`;
CREATE TABLE `xx_promotion_product_category` (
  `promotions` bigint(20) NOT NULL,
  `product_categories` bigint(20) NOT NULL,
  PRIMARY KEY (`promotions`,`product_categories`),
  KEY `FK4A5AE7098C4C0635` (`product_categories`),
  KEY `FK4A5AE709682BD58F` (`promotions`),
  CONSTRAINT `FK4A5AE709682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
  CONSTRAINT `FK4A5AE7098C4C0635` FOREIGN KEY (`product_categories`) REFERENCES `xx_product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_promotion_product_category
-- ----------------------------
INSERT INTO `xx_promotion_product_category` VALUES ('1', '81');
INSERT INTO `xx_promotion_product_category` VALUES ('2', '82');
INSERT INTO `xx_promotion_product_category` VALUES ('5', '84');

-- ----------------------------
-- Table structure for xx_receiver
-- ----------------------------
DROP TABLE IF EXISTS `xx_receiver`;
CREATE TABLE `xx_receiver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `area` bigint(20) DEFAULT NULL,
  `member` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK22D1EC4E39A0DADE` (`area`),
  KEY `FK22D1EC4E7C62EDF8` (`member`),
  CONSTRAINT `FK22D1EC4E39A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`),
  CONSTRAINT `FK22D1EC4E7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_receiver
-- ----------------------------
INSERT INTO `xx_receiver` VALUES ('1', '2014-05-23 23:34:59', '2014-05-23 23:34:59', 'ew', '北京市东城区', 'aatt', '', 'fasfe', '323dfa', '2', '3');
INSERT INTO `xx_receiver` VALUES ('2', '2014-06-17 23:10:42', '2014-06-17 23:10:42', 'addas', '广东省广州市白云区', 'aa', '', 'asd', 'asdasdf', '1952', '4');

-- ----------------------------
-- Table structure for xx_refunds
-- ----------------------------
DROP TABLE IF EXISTS `xx_refunds`;
CREATE TABLE `xx_refunds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `amount` decimal(21,6) NOT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `method` int(11) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `payee` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FKCFC4C5BCB992E8EF` (`orders`),
  CONSTRAINT `FKCFC4C5BCB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_refunds
-- ----------------------------

-- ----------------------------
-- Table structure for xx_returns
-- ----------------------------
DROP TABLE IF EXISTS `xx_returns`;
CREATE TABLE `xx_returns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `delivery_corp` varchar(255) DEFAULT NULL,
  `freight` decimal(21,6) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `shipper` varchar(255) NOT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `sn` varchar(100) NOT NULL,
  `tracking_no` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FKD08A1F04B992E8EF` (`orders`),
  CONSTRAINT `FKD08A1F04B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_returns
-- ----------------------------

-- ----------------------------
-- Table structure for xx_returns_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_returns_item`;
CREATE TABLE `xx_returns_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `returns` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE830D76E21D01242` (`returns`),
  CONSTRAINT `FKE830D76E21D01242` FOREIGN KEY (`returns`) REFERENCES `xx_returns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_returns_item
-- ----------------------------

-- ----------------------------
-- Table structure for xx_review
-- ----------------------------
DROP TABLE IF EXISTS `xx_review`;
CREATE TABLE `xx_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `is_show` bit(1) NOT NULL,
  `score` int(11) NOT NULL,
  `member` bigint(20) DEFAULT NULL,
  `product` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9B6005777C62EDF8` (`member`),
  KEY `FK9B60057779F8D99A` (`product`),
  CONSTRAINT `FK9B60057779F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
  CONSTRAINT `FK9B6005777C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_review
-- ----------------------------

-- ----------------------------
-- Table structure for xx_role
-- ----------------------------
DROP TABLE IF EXISTS `xx_role`;
CREATE TABLE `xx_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_system` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_role
-- ----------------------------
INSERT INTO `xx_role` VALUES ('1', '2014-05-15 00:02:44', '2014-05-15 00:02:44', '拥有管理后台最高权限', '', '超级管理员');

-- ----------------------------
-- Table structure for xx_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `xx_role_authority`;
CREATE TABLE `xx_role_authority` (
  `role` bigint(20) NOT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  KEY `FKE06165D939B03AB0` (`role`),
  CONSTRAINT `FKE06165D939B03AB0` FOREIGN KEY (`role`) REFERENCES `xx_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_role_authority
-- ----------------------------
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:product');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:productCategory');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:parameterGroup');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:attribute');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:specification');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:brand');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:productNotify');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:order');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:print');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:payment');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:refunds');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:shipping');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:returns');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:deliveryCenter');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:deliveryTemplate');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:member');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:memberRank');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:memberAttribute');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:review');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:consultation');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:navigation');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:article');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:articleCategory');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:tag');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:friendLink');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:adPosition');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:ad');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:template');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:cache');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:static');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:index');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:promotion');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:coupon');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:seo');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:sitemap');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:statistics');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:sales');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:salesRanking');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:purchaseRanking');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:deposit');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:setting');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:area');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:paymentMethod');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:shippingMethod');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:deliveryCorp');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:paymentPlugin');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:storagePlugin');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:admin');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:role');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:message');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:log');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:vendingMachine');
INSERT INTO `xx_role_authority` VALUES ('1', 'admin:inventory');

-- ----------------------------
-- Table structure for xx_seo
-- ----------------------------
DROP TABLE IF EXISTS `xx_seo`;
CREATE TABLE `xx_seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_seo
-- ----------------------------
INSERT INTO `xx_seo` VALUES ('1', '2014-05-15 00:59:57', '2014-05-15 00:59:57', '${setting.siteName}', '${setting.siteName}', '${setting.siteName}', '0');
INSERT INTO `xx_seo` VALUES ('2', '2014-05-15 00:59:58', '2014-05-15 00:59:58', '${productCategory.name}', '${productCategory.name}', '${productCategory.name}', '1');
INSERT INTO `xx_seo` VALUES ('3', '2014-05-15 00:59:59', '2014-05-15 00:59:59', '${productKeyword}', '${productKeyword}', '${productKeyword}', '2');
INSERT INTO `xx_seo` VALUES ('4', '2014-05-15 01:00:00', '2014-05-15 01:00:00', '${product.name}', '${product.name}', '${product.name}', '3');
INSERT INTO `xx_seo` VALUES ('5', '2014-05-15 01:00:01', '2014-05-15 01:00:01', '${articleCategory.name}', '${articleCategory.name}', '${articleCategory.name}', '4');
INSERT INTO `xx_seo` VALUES ('6', '2014-05-15 01:00:02', '2014-05-15 01:00:02', '${articleKeyword}', '${articleKeyword}', '${articleKeyword}', '5');
INSERT INTO `xx_seo` VALUES ('7', '2014-05-15 01:00:03', '2014-05-15 01:00:03', '${article.title}', '${article.title}', '${article.title}', '6');
INSERT INTO `xx_seo` VALUES ('8', '2014-05-15 01:00:04', '2014-05-15 01:00:04', '${setting.siteName}', '${setting.siteName}', '${setting.siteName}', '7');
INSERT INTO `xx_seo` VALUES ('9', '2014-05-15 01:00:05', '2014-05-15 01:00:05', '${brand.name}', '${brand.name}', '${brand.name}', '8');

-- ----------------------------
-- Table structure for xx_shipping
-- ----------------------------
DROP TABLE IF EXISTS `xx_shipping`;
CREATE TABLE `xx_shipping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `delivery_corp` varchar(255) NOT NULL,
  `delivery_corp_code` varchar(255) DEFAULT NULL,
  `delivery_corp_url` varchar(255) DEFAULT NULL,
  `freight` decimal(21,6) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `operator` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `sn` varchar(100) NOT NULL,
  `tracking_no` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) NOT NULL,
  `orders` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK3440E00DB992E8EF` (`orders`),
  CONSTRAINT `FK3440E00DB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for xx_shipping_item
-- ----------------------------
DROP TABLE IF EXISTS `xx_shipping_item`;
CREATE TABLE `xx_shipping_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `shipping` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCE65405FF407320` (`shipping`),
  CONSTRAINT `FKCCE65405FF407320` FOREIGN KEY (`shipping`) REFERENCES `xx_shipping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_shipping_item
-- ----------------------------

-- ----------------------------
-- Table structure for xx_shipping_method
-- ----------------------------
DROP TABLE IF EXISTS `xx_shipping_method`;
CREATE TABLE `xx_shipping_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `continue_price` decimal(21,6) NOT NULL,
  `continue_weight` int(11) NOT NULL,
  `description` longtext,
  `first_price` decimal(21,6) NOT NULL,
  `first_weight` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `default_delivery_corp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32A8355346542319` (`default_delivery_corp`),
  CONSTRAINT `FK32A8355346542319` FOREIGN KEY (`default_delivery_corp`) REFERENCES `xx_delivery_corp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_shipping_method
-- ----------------------------
INSERT INTO `xx_shipping_method` VALUES ('1', '2014-05-15 00:00:05', '2014-05-15 00:00:05', '1', '0.000000', '1000', '系统将根据您的收货地址自动匹配快递公司进行配送，享受免运费服务', '0.000000', '1000', 'http://storage.shopxx.net/demo-image/3.0/shipping_method/normal.gif', '普通快递', '2');
INSERT INTO `xx_shipping_method` VALUES ('2', '2014-05-15 00:00:06', '2014-05-15 00:00:06', '2', '0.000000', '1000', '需支付10元配送费用，不享受免运费服务', '10.000000', '1000', 'http://storage.shopxx.net/demo-image/3.0/shipping_method/shunfeng.gif', '顺丰速递', '4');

-- ----------------------------
-- Table structure for xx_sn
-- ----------------------------
DROP TABLE IF EXISTS `xx_sn`;
CREATE TABLE `xx_sn` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `last_value` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_sn
-- ----------------------------
INSERT INTO `xx_sn` VALUES ('1', '2014-05-15 00:59:51', '2014-06-30 22:00:28', '8', '0');
INSERT INTO `xx_sn` VALUES ('2', '2014-05-15 00:59:52', '2014-06-29 19:13:38', '5', '1');
INSERT INTO `xx_sn` VALUES ('3', '2014-05-15 00:59:53', '2014-06-29 19:13:44', '3', '2');
INSERT INTO `xx_sn` VALUES ('4', '2014-05-15 00:59:54', '2014-05-15 00:59:54', '1', '3');
INSERT INTO `xx_sn` VALUES ('5', '2014-05-15 00:59:55', '2014-05-15 00:59:55', '1', '4');
INSERT INTO `xx_sn` VALUES ('6', '2014-05-15 00:59:56', '2014-05-15 00:59:56', '1', '5');

-- ----------------------------
-- Table structure for xx_specification
-- ----------------------------
DROP TABLE IF EXISTS `xx_specification`;
CREATE TABLE `xx_specification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_specification
-- ----------------------------
INSERT INTO `xx_specification` VALUES ('7', '2014-06-29 19:00:59', '2014-07-07 15:26:07', '1', '备注规格', '颜色', '0');
INSERT INTO `xx_specification` VALUES ('8', '2014-07-07 15:26:51', '2014-07-07 15:26:51', '2', null, '尺寸', '0');

-- ----------------------------
-- Table structure for xx_specification_value
-- ----------------------------
DROP TABLE IF EXISTS `xx_specification_value`;
CREATE TABLE `xx_specification_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `specification` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5E624376629A04C2` (`specification`),
  CONSTRAINT `FK5E624376629A04C2` FOREIGN KEY (`specification`) REFERENCES `xx_specification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_specification_value
-- ----------------------------
INSERT INTO `xx_specification_value` VALUES ('77', '2014-06-29 19:00:59', '2014-07-07 15:26:07', '1', null, '白色', '7');
INSERT INTO `xx_specification_value` VALUES ('78', '2014-06-29 19:06:06', '2014-07-07 15:26:07', '2', null, '黑色', '7');
INSERT INTO `xx_specification_value` VALUES ('79', '2014-06-29 19:06:06', '2014-07-07 15:26:07', '3', null, '粉色', '7');
INSERT INTO `xx_specification_value` VALUES ('80', '2014-07-07 15:26:52', '2014-07-07 15:26:52', '1', null, 'S', '8');
INSERT INTO `xx_specification_value` VALUES ('81', '2014-07-07 15:26:52', '2014-07-07 15:26:52', '2', null, 'M', '8');
INSERT INTO `xx_specification_value` VALUES ('82', '2014-07-07 15:26:52', '2014-07-07 15:26:52', '3', null, 'L', '8');
INSERT INTO `xx_specification_value` VALUES ('83', '2014-07-07 15:26:52', '2014-07-07 15:26:52', '4', null, 'XL', '8');
INSERT INTO `xx_specification_value` VALUES ('84', '2014-07-07 15:26:52', '2014-07-07 15:26:52', '5', null, '均码', '8');

-- ----------------------------
-- Table structure for xx_tag
-- ----------------------------
DROP TABLE IF EXISTS `xx_tag`;
CREATE TABLE `xx_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `orders` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xx_tag
-- ----------------------------
INSERT INTO `xx_tag` VALUES ('5', '2014-07-08 19:26:15', '2014-07-08 19:26:15', '1', null, null, '热门商品', '1');
INSERT INTO `xx_tag` VALUES ('6', '2015-03-10 23:06:53', '2015-03-10 23:06:53', '1', null, null, '最新商品', '1');
