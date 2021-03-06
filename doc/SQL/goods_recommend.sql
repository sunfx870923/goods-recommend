/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : goods_recommend

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-20 08:42:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `sessionId` varchar(50) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `itemTypeId` int(11) NOT NULL,
  `actionTypeId` int(11) NOT NULL,
  `ratingValue` int(11) DEFAULT NULL,
  `actionInfo` varchar(500) DEFAULT NULL,
  `actionTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `action_reader` (`tenantId`,`userId`,`actionTypeId`,`itemTypeId`),
  KEY `charts` (`tenantId`,`actionTypeId`,`actionTime`,`itemId`,`itemTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=391517321912385537 DEFAULT CHARSET=utf8 COMMENT='用户动作记录';

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES ('1', '1', '2', 'initA', '0:0:0:0:0:0:0:1', '3', '1', '1', null, '{\"price\":5}', '2017-12-09 17:49:46');
INSERT INTO `action` VALUES ('2', '1', '4', 'initB', '0:0:0:0:0:0:0:1', '3', '1', '1', null, '{\"price\":5}', '2017-12-09 17:49:46');
INSERT INTO `action` VALUES ('3', '1', '2', 'initA', '0:0:0:0:0:0:0:1', '5', '1', '1', null, '{\"price\":7}', '2017-12-09 17:49:46');
INSERT INTO `action` VALUES ('4', '1', '4', 'initB', '0:0:0:0:0:0:0:1', '5', '1', '1', null, '{\"price\":7}', '2017-12-09 17:49:46');
INSERT INTO `action` VALUES ('5', '1', '2', 'initA', '0:0:0:0:0:0:0:1', '6', '1', '1', null, '{\"price\":3}', '2017-12-09 17:49:46');
INSERT INTO `action` VALUES ('6', '1', '4', 'initB', '0:0:0:0:0:0:0:1', '6', '1', '1', null, '{\"price\":3}', '2017-12-09 17:49:46');
INSERT INTO `action` VALUES ('391183760076308480', '1', '1', '2', '3', '4', '1', '1', '5', '6', '2017-12-15 11:04:36');
INSERT INTO `action` VALUES ('391183928561500160', '1', '1', '2', '3', '4', '1', '1', '5', '6', '2017-12-15 11:05:16');
INSERT INTO `action` VALUES ('391183933275897856', '1', '1', '2', '3', '4', '1', '1', '5', '6', '2017-12-15 11:05:17');
INSERT INTO `action` VALUES ('391517319219642368', '1', '1', '2', '0:0:0:0:0:0:0:1', '4', '1', '1', '5', '6', '2017-12-16 09:10:03');
INSERT INTO `action` VALUES ('391517321912385536', '1', '1', '2', '0:0:0:0:0:0:0:1', '4', '1', '1', '5', '6', '2017-12-16 09:10:03');

-- ----------------------------
-- Table structure for `actiontype`
-- ----------------------------
DROP TABLE IF EXISTS `actiontype`;
CREATE TABLE `actiontype` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `hasvalue` bit(1) NOT NULL DEFAULT b'0',
  `weight` int(11) NOT NULL DEFAULT '1',
  UNIQUE KEY `tenantId` (`tenantId`,`name`),
  UNIQUE KEY `tenantId_2` (`tenantId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户动作类型';

-- ----------------------------
-- Records of actiontype
-- ----------------------------
INSERT INTO `actiontype` VALUES ('2', '1', '商品评分', '', '1');
INSERT INTO `actiontype` VALUES ('3', '1', '商品购买', '', '1');
INSERT INTO `actiontype` VALUES ('1', '1', '商品阅读', '', '1');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) NOT NULL,
  `itemid` varchar(250) NOT NULL DEFAULT '',
  `itemtype` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(500) DEFAULT NULL,
  `profileData` text,
  `url` varchar(500) DEFAULT NULL,
  `imageurl` varchar(500) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemTripple` (`tenantId`,`itemid`,`itemtype`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品配置项表';

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '1', 'CLUSTERS', 'CLUSTER', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><clusterVO><description>The root object of every cluster hierarchy. Cannot be removed!</description><name>CLUSTERS</name></clusterVO>', null, null, '1', '2017-12-09 17:49:46', '0000-00-00 00:00:00');
INSERT INTO `item` VALUES ('2', '1', '42', 'ITEM', 'Fatboy Slim - The Rockafeller Skank', '{\"genres\":[\"Electronic\",\"Pop\"],\"label\":\"EMI\"}', '/item/fatboyslim', '/img/covers/fatboyslim.jpg', '1', '2017-12-09 17:49:46', '0000-00-00 00:00:00');
INSERT INTO `item` VALUES ('3', '1', '43', 'ITEM', 'Beastie Boys - Intergalactic', '{\"genres\":[\"Electronic\"],\"label\":\"EMI\"}', '/item/beastieboyz', '/img/covers/beastieboys.jpg', '1', '2017-12-09 17:49:46', '0000-00-00 00:00:00');
INSERT INTO `item` VALUES ('4', '1', '44', 'ITEM', 'Gorillaz - Clint Eastwood', '{\"genres\":[\"Pop\",\"Hiphop\"],\"label\":\"Ariola\"}', '/item/gorillaz', '/img/covers/gorillaz.jpg', '1', '2017-12-09 17:49:46', '0000-00-00 00:00:00');
INSERT INTO `item` VALUES ('5', '2', 'CLUSTERS', 'CLUSTER', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><clusterVO><description>The root object of every cluster hierarchy. Cannot be removed!</description><name>CLUSTERS</name></clusterVO>', null, null, '1', '2017-12-09 18:28:05', '0000-00-00 00:00:00');
INSERT INTO `item` VALUES ('6', '3', 'CLUSTERS', 'CLUSTER', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><clusterVO><description>The root object of every cluster hierarchy. Cannot be removed!</description><name>CLUSTERS</name></clusterVO>', null, null, '1', '2017-12-09 18:30:24', '0000-00-00 00:00:00');
INSERT INTO `item` VALUES ('7', '4', 'CLUSTERS', 'CLUSTER', null, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><clusterVO><description>The root object of every cluster hierarchy. Cannot be removed!</description><name>CLUSTERS</name></clusterVO>', null, null, '1', '2017-12-09 18:34:16', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `itemtype`
-- ----------------------------
DROP TABLE IF EXISTS `itemtype`;
CREATE TABLE `itemtype` (
  `id` int(11) NOT NULL,
  `tenantId` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `visible` bit(1) NOT NULL DEFAULT b'1',
  UNIQUE KEY `tenantId` (`tenantId`,`name`),
  UNIQUE KEY `tenantId_2` (`tenantId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品配置项类型表';

-- ----------------------------
-- Records of itemtype
-- ----------------------------
INSERT INTO `itemtype` VALUES ('1', '1', '手机', '');
INSERT INTO `itemtype` VALUES ('2', '2', '笔记本', '');
INSERT INTO `itemtype` VALUES ('3', '3', '鲜花', '');
INSERT INTO `itemtype` VALUES ('4', '4', '相机', '');

-- ----------------------------
-- Table structure for `tenant`
-- ----------------------------
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `id` int(11) unsigned NOT NULL,
  `stringId` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `ratingRangeMin` int(11) unsigned DEFAULT NULL,
  `ratingRangeMax` int(11) unsigned DEFAULT NULL,
  `ratingRangeNeutral` double DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `operatorid` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `tenantConfig` mediumblob,
  `tenantStatistic` mediumblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stringId` (`stringId`,`operatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB应用表';

-- ----------------------------
-- Records of tenant
-- ----------------------------
INSERT INTO `tenant` VALUES ('1', 'YIMAI_WEB', '易买商城', '1', '10', '5.5', '1', 'admin', 'http://www.yimaisc.com/', '2017-12-09 18:34:16', 0x230D0A23536174204465632030392031383A33343A31362043535420323031370D0A53455353494F4E5F544F5F555345525F4D415050494E472E656E61626C65643D66616C73650D0A6261636B747261636B696E673D747275650D0A4155544F5F41524348495645522E656E61626C65643D747275650D0A4155544F5F52554C454D494E45522E656E61626C65643D747275650D0A4155544F5F41524348495645522E74696D6552616E67653D313832350D0A4155544F5F52554C454D494E45522E657865637574696F6E54696D653D30325C3A30300D0A, 0x230D0A23536174204465632030392031383A33343A31362043535420323031370D0A4153534F432E6974656D735769746852756C65732E42454C4F4E47535F544F3D300D0A4153534F432E72756C65732E49535F504152454E545F4F463D300D0A555345522E312E616374696F6E3D300D0A4153534F432E76616C75652E677265617465722E7468616E2E6D696E6173736F6376616C7565343D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E50524F46494C455F53494D494C41524954593D300D0A4153534F432E76616C75652E677265617465722E7468616E2E6D696E6173736F6376616C7565333D300D0A54454E414E542E7265636F6D6D656E646174696F6E436F7665726167653D302E300D0A4153534F432E6974656D735769746852756C65732E50524F46494C455F53494D494C41524954593D300D0A4153534F432E76616C75652E677265617465722E7468616E2E6D696E6173736F6376616C7565323D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E42454C4F4E47535F544F3D300D0A4153534F432E76616C75652E677265617465722E7468616E2E6D696E6173736F6376616C7565313D300D0A4153534F432E616374696F6E732E49535F504152454E545F4F463D300D0A4153534F432E6974656D735769746852756C65732E49535F504152454E545F4F463D300D0A434F4E56455253494F4E2E7265636F6D6D656E646174696F6E546F427579436F756E743D300D0A4153534F432E6974656D735769746852756C65732E424F554748545F544F4745544845523D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E49535F504152454E545F4F463D300D0A54454E414E542E6261636B747261636B733D300D0A4153534F432E72756C65732E424F554748545F544F4745544845523D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E49535F504152454E545F4F463D300D0A4153534F432E72756C65732E49535F52454C415445443D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E5649455745445F544F4745544845523D300D0A4153534F432E72756C65732E474F4F445F52415445445F544F4745544845523D300D0A4153534F432E616374696F6E732E49535F52454C415445443D300D0A555345522E322E616374696F6E733D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E474F4F445F52415445445F544F4745544845523D300D0A54454E414E542E616374696F6E733D300D0A555345522E3130312E616E642E6D6F72652E616374696F6E733D300D0A54454E414E542E75736572733D300D0A4153534F432E616374696F6E732E474F4F445F52415445445F544F4745544845523D300D0A4153534F432E72756C65732E42454C4F4E47535F544F3D300D0A4153534F432E616374696F6E732E42454C4F4E47535F544F3D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E5649455745445F544F4745544845523D300D0A4153534F432E746F74616C2E6974656D732E776974682E72756C65733D300D0A555345522E332E31302E616374696F6E733D300D0A4153534F432E616374696F6E732E5649455745445F544F4745544845523D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E49535F52454C415445443D300D0A4153534F432E72756C65732E50524F46494C455F53494D494C41524954593D300D0A4153534F432E616374696F6E732E50524F46494C455F53494D494C41524954593D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E424F554748545F544F4745544845523D300D0A555345522E31312E3130302E616374696F6E733D300D0A54454E414E542E6974656D733D300D0A54454E414E542E61766572616765416374696F6E73506572557365723D302E300D0A54454E414E542E6D6F6E74686C792E616374696F6E733D300D0A4153534F432E6974656D735769746852756C65732E49535F52454C415445443D300D0A4153534F432E6974656D735769746852756C65732E5649455745445F544F4745544845523D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E50524F46494C455F53494D494C41524954593D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E42454C4F4E47535F544F3D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E49535F52454C415445443D300D0A4153534F432E72756C65732E5649455745445F544F4745544845523D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E424F554748545F544F4745544845523D300D0A4153534F432E616374696F6E732E424F554748545F544F4745544845523D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E474F4F445F52415445445F544F4745544845523D300D0A4153534F432E6974656D735769746852756C65732E474F4F445F52415445445F544F4745544845523D300D0A);
INSERT INTO `tenant` VALUES ('2', 'EASYREC_DEMO', 'This is a demo tenant.', '1', '10', '5.5', '1', 'admin', 'http://localhost:8080/easyrec-web', '2017-12-09 17:49:46', 0x230D0A23536174204465632030392031373A34393A34362043535420323031370D0A53455353494F4E5F544F5F555345525F4D415050494E472E656E61626C65643D66616C73650D0A6261636B747261636B696E673D747275650D0A4155544F5F41524348495645522E656E61626C65643D747275650D0A4155544F5F52554C454D494E45522E656E61626C65643D747275650D0A4155544F5F41524348495645522E74696D6552616E67653D313832350D0A4155544F5F52554C454D494E45522E657865637574696F6E54696D653D30325C3A30300D0A, 0x230D0A23536174204465632030392031373A34393A34362043535420323031370D0A4153534F432E6974656D735769746852756C65732E42454C4F4E47535F544F3D300D0A4153534F432E72756C65732E49535F504152454E545F4F463D300D0A555345522E312E616374696F6E3D300D0A4153534F432E76616C75652E677265617465722E7468616E2E6D696E6173736F6376616C7565343D330D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E50524F46494C455F53494D494C41524954593D300D0A4153534F432E76616C75652E677265617465722E7468616E2E6D696E6173736F6376616C7565333D330D0A54454E414E542E7265636F6D6D656E646174696F6E436F7665726167653D3130302E300D0A4153534F432E6974656D735769746852756C65732E50524F46494C455F53494D494C41524954593D300D0A4153534F432E76616C75652E677265617465722E7468616E2E6D696E6173736F6376616C7565323D330D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E42454C4F4E47535F544F3D300D0A4153534F432E76616C75652E677265617465722E7468616E2E6D696E6173736F6376616C7565313D330D0A4153534F432E616374696F6E732E49535F504152454E545F4F463D300D0A4153534F432E6974656D735769746852756C65732E49535F504152454E545F4F463D300D0A434F4E56455253494F4E2E7265636F6D6D656E646174696F6E546F427579436F756E743D300D0A4153534F432E6974656D735769746852756C65732E424F554748545F544F4745544845523D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E49535F504152454E545F4F463D300D0A54454E414E542E6261636B747261636B733D300D0A4153534F432E72756C65732E424F554748545F544F4745544845523D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E49535F504152454E545F4F463D300D0A4153534F432E72756C65732E49535F52454C415445443D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E5649455745445F544F4745544845523D300D0A4153534F432E72756C65732E474F4F445F52415445445F544F4745544845523D300D0A4153534F432E616374696F6E732E49535F52454C415445443D300D0A555345522E322E616374696F6E733D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E474F4F445F52415445445F544F4745544845523D300D0A54454E414E542E616374696F6E733D360D0A555345522E3130312E616E642E6D6F72652E616374696F6E733D300D0A54454E414E542E75736572733D320D0A4153534F432E616374696F6E732E474F4F445F52415445445F544F4745544845523D300D0A4153534F432E72756C65732E42454C4F4E47535F544F3D300D0A4153534F432E616374696F6E732E42454C4F4E47535F544F3D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E5649455745445F544F4745544845523D320D0A4153534F432E746F74616C2E6974656D732E776974682E72756C65733D330D0A555345522E332E31302E616374696F6E733D320D0A4153534F432E616374696F6E732E5649455745445F544F4745544845523D360D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E49535F52454C415445443D300D0A4153534F432E72756C65732E50524F46494C455F53494D494C41524954593D300D0A4153534F432E616374696F6E732E50524F46494C455F53494D494C41524954593D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E424F554748545F544F4745544845523D300D0A555345522E31312E3130302E616374696F6E733D300D0A54454E414E542E6974656D733D330D0A54454E414E542E61766572616765416374696F6E73506572557365723D332E300D0A54454E414E542E6D6F6E74686C792E616374696F6E733D360D0A4153534F432E6974656D735769746852756C65732E49535F52454C415445443D300D0A4153534F432E6974656D735769746852756C65732E5649455745445F544F4745544845523D330D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E50524F46494C455F53494D494C41524954593D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E42454C4F4E47535F544F3D300D0A4153534F432E7374644E756D6265724F6652756C65735065724974656D2E49535F52454C415445443D300D0A4153534F432E72756C65732E5649455745445F544F4745544845523D360D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E424F554748545F544F4745544845523D300D0A4153534F432E616374696F6E732E424F554748545F544F4745544845523D300D0A4153534F432E617665726167654E756D6265724F6652756C65735065724974656D2E474F4F445F52415445445F544F4745544845523D300D0A4153534F432E6974656D735769746852756C65732E474F4F445F52415445445F544F4745544845523D300D0A);

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '/user/list.shtml', '用户列表');
INSERT INTO `t_permission` VALUES ('2', '/user/add.shtml', '添加用户');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '888888');
INSERT INTO `t_role` VALUES ('2', 'guest', '100003');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '1');
INSERT INTO `t_role_permission` VALUES ('1', '2');
INSERT INTO `t_role_permission` VALUES ('2', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('11', 'admin', '8446666@qq.com', 'ad1a19d240936e9d', '2016-05-26 20:50:54', '2016-06-16 11:24:35', '1');
INSERT INTO `t_user` VALUES ('12', 'sunfx', '8446666@qq.com', 'ad1a19d240936e9d', '2016-05-27 22:34:19', '2016-06-15 17:03:16', '1');
INSERT INTO `t_user` VALUES ('13', 'test', '8446666@qq.com', 'ad1a19d240936e9d', null, null, '1');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('11', '1');
INSERT INTO `t_user_role` VALUES ('11', '2');
INSERT INTO `t_user_role` VALUES ('12', '2');

-- ----------------------------
-- Table structure for `version`
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `VERSION` int(11) NOT NULL COMMENT '版本',
  PRIMARY KEY (`VERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本';

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('1');

-- ----------------------------
-- Procedure structure for `init_shiro_demo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `init_shiro_demo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `init_shiro_demo`()
BEGIN	
/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - 
*********************************************************************
*/
/*表结构插入*/
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*Table structure for table `u_role` */
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*Table structure for table `u_role_permission` */
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*Table structure for table `u_user` */
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*Table structure for table `u_user_role` */
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16-log : Database - i_wenyiba_com
*********************************************************************
*/
/*所有的表数据插入*/
/*Data for the table `u_permission` */
insert  into `u_permission`(`id`,`url`,`name`) values (4,'/permission/index.shtml','权限列表'),(6,'/permission/addPermission.shtml','权限添加'),(7,'/permission/deletePermissionById.shtml','权限删除'),(8,'/member/list.shtml','用户列表'),(9,'/member/online.shtml','在线用户'),(10,'/member/changeSessionStatus.shtml','用户Session踢出'),(11,'/member/forbidUserById.shtml','用户激活&禁止'),(12,'/member/deleteUserById.shtml','用户删除'),(13,'/permission/addPermission2Role.shtml','权限分配'),(14,'/role/clearRoleByUserIds.shtml','用户角色分配清空'),(15,'/role/addRole2User.shtml','角色分配保存'),(16,'/role/deleteRoleById.shtml','角色列表删除'),(17,'/role/addRole.shtml','角色列表添加'),(18,'/role/index.shtml','角色列表'),(19,'/permission/allocation.shtml','权限分配'),(20,'/role/allocation.shtml','角色分配');
/*Data for the table `u_role` */
insert  into `u_role`(`id`,`name`,`type`) values (1,'系统管理员','888888'),(3,'权限角色','100003'),(4,'用户中心','100002');
/*Data for the table `u_role_permission` */
insert  into `u_role_permission`(`rid`,`pid`) values (4,8),(4,9),(4,10),(4,11),(4,12),(3,4),(3,6),(3,7),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(1,4),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20);
/*Data for the table `u_user` */
insert  into `u_user`(`id`,`nickname`,`email`,`pswd`,`create_time`,`last_login_time`,`status`) values (1,'管理员','admin','9c3250081c7b1f5c6cbb8096e3e1cd04','2016-06-16 11:15:33','2016-06-16 11:24:10',1),(11,'soso','8446666@qq.com','d57ffbe486910dd5b26d0167d034f9ad','2016-05-26 20:50:54','2016-06-16 11:24:35',1),(12,'8446666','8446666','4afdc875a67a55528c224ce088be2ab8','2016-05-27 22:34:19','2016-06-15 17:03:16',1);
/*Data for the table `u_user_role` */
insert  into `u_user_role`(`uid`,`rid`) values (12,4),(11,3),(11,4),(1,1);
   
    END
;;
DELIMITER ;
