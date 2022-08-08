-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mall
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cms_help`
--

DROP TABLE IF EXISTS `cms_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_help` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_help`
--

LOCK TABLES `cms_help` WRITE;
/*!40000 ALTER TABLE `cms_help` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_help_category`
--

DROP TABLE IF EXISTS `cms_help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_help_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `help_count` int DEFAULT NULL COMMENT '专题数量',
  `show_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_help_category`
--

LOCK TABLES `cms_help_category` WRITE;
/*!40000 ALTER TABLE `cms_help_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_member_report`
--

DROP TABLE IF EXISTS `cms_member_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_member_report` (
  `id` bigint DEFAULT NULL,
  `report_type` int DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) DEFAULT NULL COMMENT '举报人',
  `create_time` datetime DEFAULT NULL,
  `report_object` varchar(100) DEFAULT NULL,
  `report_status` int DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_member_report`
--

LOCK TABLES `cms_member_report` WRITE;
/*!40000 ALTER TABLE `cms_member_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_member_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_prefrence_area`
--

DROP TABLE IF EXISTS `cms_prefrence_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_prefrence_area` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `pic` varbinary(500) DEFAULT NULL COMMENT '展示图片',
  `sort` int DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优选专区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_prefrence_area`
--

LOCK TABLES `cms_prefrence_area` WRITE;
/*!40000 ALTER TABLE `cms_prefrence_area` DISABLE KEYS */;
INSERT INTO `cms_prefrence_area` VALUES (1,'让音质更出众','音质不打折 完美现场感',NULL,NULL,1),(2,'让音质更出众22','让音质更出众22',NULL,NULL,NULL),(3,'让音质更出众33',NULL,NULL,NULL,NULL),(4,'让音质更出众44',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms_prefrence_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_prefrence_area_product_relation`
--

DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_prefrence_area_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='优选专区和产品关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_prefrence_area_product_relation`
--

LOCK TABLES `cms_prefrence_area_product_relation` WRITE;
/*!40000 ALTER TABLE `cms_prefrence_area_product_relation` DISABLE KEYS */;
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1,1,12),(2,1,13),(3,1,14),(4,1,18),(5,1,7),(6,2,7),(7,1,22),(24,1,23);
/*!40000 ALTER TABLE `cms_prefrence_area_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_subject`
--

DROP TABLE IF EXISTS `cms_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL COMMENT '专题主图',
  `product_count` int DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  `comment_count` int DEFAULT NULL,
  `album_pics` varchar(1000) DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) DEFAULT NULL,
  `show_status` int DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text,
  `forward_count` int DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_subject`
--

LOCK TABLES `cms_subject` WRITE;
/*!40000 ALTER TABLE `cms_subject` DISABLE KEYS */;
INSERT INTO `cms_subject` VALUES (1,1,'polo衬衫的也时尚',NULL,NULL,NULL,'2018-11-11 13:26:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'服装专题'),(2,2,'大牌手机低价秒',NULL,NULL,NULL,'2018-11-12 13:27:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'手机专题'),(3,2,'晓龙845新品上市',NULL,NULL,NULL,'2018-11-13 13:27:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'手机专题'),(4,1,'夏天应该穿什么',NULL,NULL,NULL,'2018-11-01 13:27:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'服装专题'),(5,1,'夏季精选',NULL,NULL,NULL,'2018-11-06 13:27:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'服装专题'),(6,2,'品牌手机降价',NULL,NULL,NULL,'2018-11-07 13:27:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'手机专题');
/*!40000 ALTER TABLE `cms_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_subject_category`
--

DROP TABLE IF EXISTS `cms_subject_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_subject_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int DEFAULT NULL COMMENT '专题数量',
  `show_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专题分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_subject_category`
--

LOCK TABLES `cms_subject_category` WRITE;
/*!40000 ALTER TABLE `cms_subject_category` DISABLE KEYS */;
INSERT INTO `cms_subject_category` VALUES (1,'服装专题',NULL,NULL,NULL,NULL),(2,'手机专题',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms_subject_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_subject_comment`
--

DROP TABLE IF EXISTS `cms_subject_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_subject_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_subject_comment`
--

LOCK TABLES `cms_subject_comment` WRITE;
/*!40000 ALTER TABLE `cms_subject_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_subject_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_subject_product_relation`
--

DROP TABLE IF EXISTS `cms_subject_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_subject_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='专题商品关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_subject_product_relation`
--

LOCK TABLES `cms_subject_product_relation` WRITE;
/*!40000 ALTER TABLE `cms_subject_product_relation` DISABLE KEYS */;
INSERT INTO `cms_subject_product_relation` VALUES (1,1,12),(2,1,13),(3,1,14),(4,1,18),(5,1,7),(6,2,7),(7,1,22),(29,1,23),(30,4,23),(31,5,23),(41,2,26),(42,3,26),(43,6,26);
/*!40000 ALTER TABLE `cms_subject_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_topic`
--

DROP TABLE IF EXISTS `cms_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `attend_count` int DEFAULT NULL COMMENT '参与人数',
  `attention_count` int DEFAULT NULL COMMENT '关注人数',
  `read_count` int DEFAULT NULL,
  `award_name` varchar(100) DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) DEFAULT NULL COMMENT '参与方式',
  `content` text COMMENT '话题内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_topic`
--

LOCK TABLES `cms_topic` WRITE;
/*!40000 ALTER TABLE `cms_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_topic_category`
--

DROP TABLE IF EXISTS `cms_topic_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_topic_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int DEFAULT NULL COMMENT '专题数量',
  `show_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_topic_category`
--

LOCK TABLES `cms_topic_category` WRITE;
/*!40000 ALTER TABLE `cms_topic_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_topic_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_topic_comment`
--

DROP TABLE IF EXISTS `cms_topic_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_topic_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `topic_id` bigint DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_topic_comment`
--

LOCK TABLES `cms_topic_comment` WRITE;
/*!40000 ALTER TABLE `cms_topic_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_topic_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_cart_item`
--

DROP TABLE IF EXISTS `oms_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `product_sku_id` bigint DEFAULT NULL,
  `member_id` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `product_pic` varchar(1000) DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int DEFAULT '0' COMMENT '是否删除',
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(200) DEFAULT NULL,
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_cart_item`
--

LOCK TABLES `oms_cart_item` WRITE;
/*!40000 ALTER TABLE `oms_cart_item` DISABLE KEYS */;
INSERT INTO `oms_cart_item` VALUES (12,26,90,1,1,3788.00,NULL,'华为 HUAWEI P20','AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待','201806070026001','windir','2018-08-27 16:53:44',NULL,1,19,NULL,NULL,NULL),(13,27,98,1,3,2699.00,NULL,'小米8','骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购','201808270027001','windir','2018-08-27 17:11:53',NULL,1,19,NULL,NULL,NULL),(14,28,102,1,1,649.00,NULL,'红米5A','8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购','201808270028001','windir','2018-08-27 17:18:02',NULL,1,19,NULL,NULL,NULL),(15,28,103,1,1,699.00,NULL,'红米5A','8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购','201808270028001','windir','2018-08-28 10:22:45',NULL,1,19,NULL,NULL,NULL),(16,29,106,1,1,5499.00,NULL,'Apple iPhone 8 Plus','【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。','201808270029001','windir','2018-08-28 10:50:50',NULL,1,19,NULL,NULL,NULL),(19,36,163,1,3,100.00,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','202002210036001','windir','2020-02-25 15:51:59',NULL,1,29,'NIKE','6799345','[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]'),(20,36,164,1,2,120.00,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','202002210036001','windir','2020-02-25 15:54:23',NULL,1,29,'NIKE','6799345','[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]'),(21,36,164,1,2,120.00,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','202002210036001','windir','2020-02-25 16:49:53',NULL,1,29,'NIKE','6799345','[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
/*!40000 ALTER TABLE `oms_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_company_address`
--

DROP TABLE IF EXISTS `oms_company_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_company_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) DEFAULT NULL COMMENT '地址名称',
  `send_status` int DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `region` varchar(64) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公司收发货地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_company_address`
--

LOCK TABLES `oms_company_address` WRITE;
/*!40000 ALTER TABLE `oms_company_address` DISABLE KEYS */;
INSERT INTO `oms_company_address` VALUES (1,'深圳发货点',1,1,'大梨','18000000000','广东省','深圳市','南山区','科兴科学园'),(2,'北京发货点',0,0,'大梨','18000000000','北京市',NULL,'南山区','科兴科学园'),(3,'南京发货点',0,0,'大梨','18000000000','江苏省','南京市','南山区','科兴科学园');
/*!40000 ALTER TABLE `oms_company_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order`
--

DROP TABLE IF EXISTS `oms_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint NOT NULL COMMENT '用户id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `admin_id` bigint NOT NULL COMMENT '商品创建人id',
  `product_id` bigint NOT NULL COMMENT '商品id',
  `member_username` varchar(64) DEFAULT NULL COMMENT '用户帐号',
  `wechat_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人微信号',
  `source_type` int DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `receiver_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) NOT NULL COMMENT '收货人电话',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `status` int DEFAULT NULL COMMENT '订单状态：0->待确认；1->已寄件；2->已拒绝；3->已取消',
  `deny_reason` varchar(100) DEFAULT NULL COMMENT '拒绝原因',
  `delete_status` int NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oms_order_order_sn_IDX` (`order_sn`) USING BTREE,
  KEY `idx_oms_order_admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order`
--

LOCK TABLES `oms_order` WRITE;
/*!40000 ALTER TABLE `oms_order` DISABLE KEYS */;
INSERT INTO `oms_order` VALUES (27,1,'202002250100000001',10,0,'test','518000',1,NULL,NULL,'大梨','18033441849','广东省','深圳市','南山区','科兴科学园',NULL,0,NULL,1,NULL,NULL,NULL,'2020-02-25 15:59:20'),(28,1,'202002250100000002',10,0,'test','518000',1,NULL,NULL,'大梨','18033441849','广东省','深圳市','南山区','科兴科学园',NULL,0,NULL,1,NULL,NULL,NULL,'2020-02-25 16:05:47'),(29,1,'202002250100000003',10,0,'test','518000',1,NULL,NULL,'大梨','18033441849','广东省','深圳市','南山区','科兴科学园',NULL,0,NULL,0,NULL,NULL,NULL,'2020-02-25 16:07:58'),(30,1,'202002250100000004',10,0,'test','518000',1,'顺丰快递','12333333','大梨','18033441849','广东省','深圳市','南山区','科兴科学园',NULL,2,NULL,0,'2020-02-25 16:54:03',NULL,'2020-02-25 16:52:51','2020-02-25 16:50:13'),(31,1,'p202207291525400000107',10,42,'test','ttc510k',2,NULL,'t121312321','小t','15171410261',NULL,NULL,NULL,'武汉光谷',NULL,1,NULL,0,'2022-07-29 16:04:02',NULL,'2022-07-29 16:33:48','2022-07-29 15:25:41'),(32,10,'p202208061333550001003',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:33:56','2022-08-06 13:33:56'),(33,10,'p202208061334270001003',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:27','2022-08-06 13:34:27'),(35,10,'p202208061334280001008',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:28','2022-08-06 13:34:28'),(36,10,'p202208061334290001003',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:29','2022-08-06 13:34:29'),(37,10,'p202208061334290001006',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:30','2022-08-06 13:34:30'),(38,10,'p202208061334300001005',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:30','2022-08-06 13:34:30'),(39,10,'p202208061334300001003',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:31','2022-08-06 13:34:31'),(40,10,'p202208061334310001003',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:31','2022-08-06 13:34:31'),(41,10,'p202208061334310001000',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:32','2022-08-06 13:34:32'),(42,10,'p202208061334320001009',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:32','2022-08-06 13:34:32'),(43,10,'p202208061334320001005',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:33','2022-08-06 13:34:33'),(44,10,'p202208061334330001007',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:33','2022-08-06 13:34:33'),(45,10,'p202208061334330001005',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:34','2022-08-06 13:34:34'),(46,10,'p202208061334340001003',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:34','2022-08-06 13:34:34'),(47,10,'p202208061334340001008',10,42,'ttc','ttc510k',2,NULL,NULL,'小汤汤','15171410261',NULL,NULL,NULL,'湖北省武汉市大华',NULL,0,NULL,0,NULL,NULL,'2022-08-06 13:34:35','2022-08-06 13:34:35');
/*!40000 ALTER TABLE `oms_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_item`
--

DROP TABLE IF EXISTS `oms_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint DEFAULT NULL,
  `product_pic` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(64) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类id',
  `promotion_name` varchar(200) DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int DEFAULT '0',
  `gift_growth` int DEFAULT '0',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='订单中所包含的商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_item`
--

LOCK TABLES `oms_order_item` WRITE;
/*!40000 ALTER TABLE `oms_order_item` DISABLE KEYS */;
INSERT INTO `oms_order_item` VALUES (21,12,'201809150101000001',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605',3788.00,1,90,'201806070026001',19,'单品促销',200.00,2.02,0.00,3585.98,3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(22,12,'201809150101000001',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788',2699.00,3,98,'201808270027001',19,'打折优惠：满3件，打7.50折',674.75,1.44,0.00,2022.81,2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(23,12,'201809150101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',649.00,1,102,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',57.60,0.35,0.00,591.05,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(24,12,'201809150101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',699.00,1,103,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',62.40,0.37,0.00,636.23,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(25,12,'201809150101000001',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799',5499.00,1,106,'201808270029001',19,'无优惠',0.00,2.94,0.00,5496.06,5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(26,13,'201809150102000002',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605',3788.00,1,90,'201806070026001',19,'单品促销',200.00,2.02,0.00,3585.98,3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(27,13,'201809150102000002',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788',2699.00,3,98,'201808270027001',19,'打折优惠：满3件，打7.50折',674.75,1.44,0.00,2022.81,2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(28,13,'201809150102000002',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',649.00,1,102,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',57.60,0.35,0.00,591.05,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(29,13,'201809150102000002',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',699.00,1,103,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',62.40,0.37,0.00,636.23,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(30,13,'201809150102000002',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799',5499.00,1,106,'201808270029001',19,'无优惠',0.00,2.94,0.00,5496.06,5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(31,14,'201809130101000001',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605',3788.00,1,90,'201806070026001',19,'单品促销',200.00,2.02,0.00,3585.98,3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(32,14,'201809130101000001',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788',2699.00,3,98,'201808270027001',19,'打折优惠：满3件，打7.50折',674.75,1.44,0.00,2022.81,2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(33,14,'201809130101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',649.00,1,102,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',57.60,0.35,0.00,591.05,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(34,14,'201809130101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',699.00,1,103,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',62.40,0.37,0.00,636.23,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(35,14,'201809130101000001',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799',5499.00,1,106,'201808270029001',19,'无优惠',0.00,2.94,0.00,5496.06,5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(36,15,'201809130101000001',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605',3788.00,1,90,'201806070026001',19,'单品促销',200.00,2.02,0.00,3585.98,3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(37,15,'201809130101000001',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788',2699.00,3,98,'201808270027001',19,'打折优惠：满3件，打7.50折',674.75,1.44,0.00,2022.81,2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(38,15,'201809130101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',649.00,1,102,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',57.60,0.35,0.00,591.05,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(39,15,'201809130101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',699.00,1,103,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',62.40,0.37,0.00,636.23,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(40,15,'201809130101000001',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799',5499.00,1,106,'201808270029001',19,'无优惠',0.00,2.94,0.00,5496.06,5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(41,16,'201809140101000001',26,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','6946605',3788.00,1,90,'201806070026001',19,'单品促销',200.00,2.02,0.00,3585.98,3788,3788,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(42,16,'201809140101000001',27,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','7437788',2699.00,3,98,'201808270027001',19,'打折优惠：满3件，打7.50折',674.75,1.44,0.00,2022.81,2699,2699,'[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(43,16,'201809140101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',649.00,1,102,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',57.60,0.35,0.00,591.05,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]'),(44,16,'201809140101000001',28,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','7437789',699.00,1,103,'201808270028001',19,'满减优惠：满1000.00元，减120.00元',62.40,0.37,0.00,636.23,649,649,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(45,16,'201809140101000001',29,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg','Apple iPhone 8 Plus','苹果','7437799',5499.00,1,106,'201808270029001',19,'无优惠',0.00,2.94,0.00,5496.06,5499,5499,'[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]'),(46,27,'202002250100000001',36,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','NIKE','6799345',100.00,3,163,'202002210036001',29,'无优惠',0.00,0.00,0.00,100.00,0,0,NULL),(47,27,'202002250100000001',36,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','NIKE','6799345',120.00,2,164,'202002210036001',29,'无优惠',0.00,0.00,0.00,120.00,0,0,NULL),(48,28,'202002250100000002',36,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','NIKE','6799345',100.00,3,163,'202002210036001',29,'无优惠',0.00,0.00,0.00,100.00,0,0,NULL),(49,28,'202002250100000002',36,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','NIKE','6799345',120.00,2,164,'202002210036001',29,'无优惠',0.00,0.00,0.00,120.00,0,0,NULL),(50,29,'202002250100000003',36,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','NIKE','6799345',100.00,3,163,'202002210036001',29,'无优惠',0.00,0.00,0.00,100.00,0,0,'[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]'),(51,29,'202002250100000003',36,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','NIKE','6799345',120.00,2,164,'202002210036001',29,'无优惠',0.00,0.00,0.00,120.00,0,0,'[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]'),(52,30,'202002250100000004',36,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg','耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码','NIKE','6799345',120.00,2,164,'202002210036001',29,'无优惠',0.00,0.00,0.00,120.00,0,0,'[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
/*!40000 ALTER TABLE `oms_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_operate_history`
--

DROP TABLE IF EXISTS `oms_order_operate_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_operate_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单sn',
  `operate_man` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `order_status` int DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='订单操作历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_operate_history`
--

LOCK TABLES `oms_order_operate_history` WRITE;
/*!40000 ALTER TABLE `oms_order_operate_history` DISABLE KEYS */;
INSERT INTO `oms_order_operate_history` VALUES (5,'','后台管理员',2,'2018-10-12 14:01:29','完成发货'),(6,'','后台管理员',2,'2018-10-12 14:01:29','完成发货'),(7,'','后台管理员',4,'2018-10-12 14:13:10','订单关闭:买家退货'),(8,'','后台管理员',4,'2018-10-12 14:13:10','订单关闭:买家退货'),(9,'','后台管理员',4,'2018-10-15 16:31:48','订单关闭:xxx'),(10,'','后台管理员',4,'2018-10-15 16:35:08','订单关闭:xxx'),(11,'','后台管理员',4,'2018-10-15 16:35:59','订单关闭:xxx'),(12,'','后台管理员',4,'2018-10-15 16:43:40','订单关闭:xxx'),(13,'','后台管理员',4,'2018-10-15 16:52:14','订单关闭:xxx'),(14,'','后台管理员',4,'2018-10-15 16:52:14','订单关闭:xxx'),(15,'','后台管理员',2,'2018-10-16 14:41:28','完成发货'),(16,'','后台管理员',2,'2018-10-16 14:42:17','完成发货'),(17,'','后台管理员',2,'2018-10-16 14:42:17','完成发货'),(18,'','后台管理员',4,'2018-10-30 14:37:44','订单关闭:关闭订单'),(19,'','后台管理员',0,'2018-10-30 15:07:01','修改收货人信息'),(20,'','后台管理员',0,'2018-10-30 15:08:13','修改费用信息'),(21,'','后台管理员',0,'2018-10-30 15:08:31','修改备注信息：xxx'),(22,'','后台管理员',4,'2018-10-30 15:08:39','订单关闭:2222'),(23,'','后台管理员',4,'2019-11-09 16:50:28','修改备注信息：111'),(24,'','后台管理员',0,'2020-02-25 16:52:37','修改费用信息'),(25,'','后台管理员',0,'2020-02-25 16:52:51','修改费用信息'),(26,'','后台管理员',2,'2020-02-25 16:54:03','完成发货'),(27,'p202207291525400000107','yym',1,'2022-07-29 16:04:02','同意寄样'),(28,'p202207291525400000107','yym',NULL,'2022-07-29 16:33:48','更新收货人信息');
/*!40000 ALTER TABLE `oms_order_operate_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_return_apply`
--

DROP TABLE IF EXISTS `oms_order_return_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_return_apply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) DEFAULT NULL COMMENT '退货人电话',
  `status` int DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单退货申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_return_apply`
--

LOCK TABLES `oms_order_return_apply` WRITE;
/*!40000 ALTER TABLE `oms_order_return_apply` DISABLE KEYS */;
INSERT INTO `oms_order_return_apply` VALUES (3,12,NULL,26,'201809150101000001','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,3788.00,3585.98,'质量问题','老是卡','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg',NULL,NULL,NULL,NULL,NULL),(4,12,2,27,'201809150101000001','2018-10-17 14:40:21','test',3585.98,'大梨','18000000000',1,'2018-10-18 13:54:10','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,2699.00,2022.81,'质量问题','不够高端','','已经处理了','admin',NULL,NULL,NULL),(5,12,3,28,'201809150101000001','2018-10-17 14:44:18','test',3585.98,'大梨','18000000000',2,'2018-10-18 13:55:28','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,649.00,591.05,'质量问题','颜色太土','','已经处理了','admin','admin','2018-10-18 13:55:58','已经处理了'),(8,13,NULL,28,'201809150102000002','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',3,'2018-10-18 13:57:12','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,649.00,591.05,'质量问题','颜色太土','','理由不够充分','admin',NULL,NULL,NULL),(9,14,2,26,'201809130101000001','2018-10-17 14:34:57','test',3500.00,'大梨','18000000000',2,'2018-10-24 15:44:56','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,3788.00,3585.98,'质量问题','老是卡','','呵呵','admin','admin','2018-10-24 15:46:35','收货了'),(10,14,NULL,27,'201809130101000001','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',3,'2018-10-24 15:46:57','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,2699.00,2022.81,'质量问题','不够高端','','就是不退','admin',NULL,NULL,NULL),(11,14,2,28,'201809130101000001','2018-10-17 14:44:18','test',591.05,'大梨','18000000000',1,'2018-10-24 17:09:04','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,649.00,591.05,'质量问题','颜色太土','','可以退款','admin',NULL,NULL,NULL),(12,15,3,26,'201809130102000002','2018-10-17 14:34:57','test',3500.00,'大梨','18000000000',2,'2018-10-24 17:22:54','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,3788.00,3585.98,'质量问题','老是卡','','退货了','admin','admin','2018-10-24 17:23:06','收货了'),(13,15,NULL,27,'201809130102000002','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',3,'2018-10-24 17:23:30','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,2699.00,2022.81,'质量问题','不够高端','','无法退货','admin',NULL,NULL,NULL),(15,16,NULL,26,'201809140101000001','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,3788.00,3585.98,'质量问题','老是卡','',NULL,NULL,NULL,NULL,NULL),(16,16,NULL,27,'201809140101000001','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,2699.00,2022.81,'质量问题','不够高端','',NULL,NULL,NULL,NULL,NULL),(17,16,NULL,28,'201809140101000001','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,649.00,591.05,'质量问题','颜色太土','',NULL,NULL,NULL,NULL,NULL),(18,17,NULL,26,'201809150101000003','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,3788.00,3585.98,'质量问题','老是卡','',NULL,NULL,NULL,NULL,NULL),(19,17,NULL,27,'201809150101000003','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,2699.00,2022.81,'质量问题','不够高端','',NULL,NULL,NULL,NULL,NULL),(20,17,NULL,28,'201809150101000003','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,649.00,591.05,'质量问题','颜色太土','',NULL,NULL,NULL,NULL,NULL),(21,18,NULL,26,'201809150102000004','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,3788.00,3585.98,'质量问题','老是卡','',NULL,NULL,NULL,NULL,NULL),(22,18,NULL,27,'201809150102000004','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,2699.00,2022.81,'质量问题','不够高端','',NULL,NULL,NULL,NULL,NULL),(23,18,NULL,28,'201809150102000004','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,649.00,591.05,'质量问题','颜色太土','',NULL,NULL,NULL,NULL,NULL),(24,19,NULL,26,'201809130101000003','2018-10-17 14:34:57','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','华为 HUAWEI P20','华为','颜色：金色;内存：16G',1,3788.00,3585.98,'质量问题','老是卡','',NULL,NULL,NULL,NULL,NULL),(25,19,NULL,27,'201809130101000003','2018-10-17 14:40:21','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','小米8','小米','颜色：黑色;内存：32G',1,2699.00,2022.81,'质量问题','不够高端','',NULL,NULL,NULL,NULL,NULL),(26,19,NULL,28,'201809130101000003','2018-10-17 14:44:18','test',NULL,'大梨','18000000000',0,NULL,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','红米5A','小米','颜色：金色;内存：16G',1,649.00,591.05,'质量问题','颜色太土','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oms_order_return_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_return_reason`
--

DROP TABLE IF EXISTS `oms_order_return_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_return_reason` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '退货类型',
  `sort` int DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='退货原因表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_return_reason`
--

LOCK TABLES `oms_order_return_reason` WRITE;
/*!40000 ALTER TABLE `oms_order_return_reason` DISABLE KEYS */;
INSERT INTO `oms_order_return_reason` VALUES (1,'质量问题',1,1,'2018-10-17 10:00:45'),(2,'尺码太大',1,1,'2018-10-17 10:01:03'),(3,'颜色不喜欢',1,1,'2018-10-17 10:01:13'),(4,'7天无理由退货',1,1,'2018-10-17 10:01:47'),(5,'价格问题',1,0,'2018-10-17 10:01:57'),(12,'发票问题',0,1,'2018-10-19 16:28:36'),(13,'其他问题',0,1,'2018-10-19 16:28:51'),(14,'物流问题',0,1,'2018-10-19 16:29:01'),(15,'售后问题',0,1,'2018-10-19 16:29:11');
/*!40000 ALTER TABLE `oms_order_return_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_setting`
--

DROP TABLE IF EXISTS `oms_order_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_setting`
--

LOCK TABLES `oms_order_setting` WRITE;
/*!40000 ALTER TABLE `oms_order_setting` DISABLE KEYS */;
INSERT INTO `oms_order_setting` VALUES (1,60,120,15,7,7);
/*!40000 ALTER TABLE `oms_order_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_album`
--

DROP TABLE IF EXISTS `pms_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_album` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `cover_pic` varchar(1000) DEFAULT NULL,
  `pic_count` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_album`
--

LOCK TABLES `pms_album` WRITE;
/*!40000 ALTER TABLE `pms_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_album_pic`
--

DROP TABLE IF EXISTS `pms_album_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_album_pic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `album_id` bigint DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='画册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_album_pic`
--

LOCK TABLES `pms_album_pic` WRITE;
/*!40000 ALTER TABLE `pms_album_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_album_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_brand`
--

DROP TABLE IF EXISTS `pms_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `sort` int DEFAULT NULL,
  `factory_status` int DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int DEFAULT NULL,
  `product_count` int DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `brand_story` text COMMENT '品牌故事',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_brand`
--

LOCK TABLES `pms_brand` WRITE;
/*!40000 ALTER TABLE `pms_brand` DISABLE KEYS */;
INSERT INTO `pms_brand` VALUES (1,'万和','W',0,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg','','Victoria\'s Secret的故事'),(2,'三星','S',100,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg',NULL,'三星的故事'),(3,'华为','H',100,1,0,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (2).jpg',NULL,'Victoria\'s Secret的故事'),(4,'格力','G',30,1,0,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (3).jpg',NULL,'Victoria\'s Secret的故事'),(5,'方太','F',20,1,0,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg',NULL,'Victoria\'s Secret的故事'),(6,'小米','M',500,1,1,100,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5a912944N474afb7a.png','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg','小米手机的故事'),(21,'OPPO','O',0,1,1,88,500,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg','','string'),(49,'七匹狼','S',200,1,1,77,400,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/1522738681.jpg',NULL,'BOOB的故事'),(50,'海澜之家','H',200,1,1,66,300,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/LOGO1024.png','','海澜之家的故事'),(51,'苹果','A',200,1,1,55,200,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg',NULL,'苹果的故事'),(58,'NIKE','N',0,1,1,33,100,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg','','NIKE的故事');
/*!40000 ALTER TABLE `pms_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_comment`
--

DROP TABLE IF EXISTS `pms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `star` int DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime DEFAULT NULL,
  `show_status` int DEFAULT NULL,
  `product_attribute` varchar(255) DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  `content` text,
  `pics` varchar(1000) DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_comment`
--

LOCK TABLES `pms_comment` WRITE;
/*!40000 ALTER TABLE `pms_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_comment_replay`
--

DROP TABLE IF EXISTS `pms_comment_replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_comment_replay` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_id` bigint DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品评价回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_comment_replay`
--

LOCK TABLES `pms_comment_replay` WRITE;
/*!40000 ALTER TABLE `pms_comment_replay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_comment_replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_feight_template`
--

DROP TABLE IF EXISTS `pms_feight_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_feight_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `charge_type` int DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL,
  `continme_fee` decimal(10,2) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费模版';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_feight_template`
--

LOCK TABLES `pms_feight_template` WRITE;
/*!40000 ALTER TABLE `pms_feight_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_feight_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_member_price`
--

DROP TABLE IF EXISTS `pms_member_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_member_price` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `member_level_id` bigint DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='商品会员价格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_member_price`
--

LOCK TABLES `pms_member_price` WRITE;
/*!40000 ALTER TABLE `pms_member_price` DISABLE KEYS */;
INSERT INTO `pms_member_price` VALUES (26,7,1,500.00,NULL),(27,8,1,500.00,NULL),(28,9,1,500.00,NULL),(29,10,1,500.00,NULL),(30,11,1,500.00,NULL),(31,12,1,500.00,NULL),(32,13,1,500.00,NULL),(33,14,1,500.00,NULL),(37,18,1,500.00,NULL),(44,7,2,480.00,NULL),(45,7,3,450.00,NULL),(52,22,1,NULL,NULL),(53,22,2,NULL,NULL),(54,22,3,NULL,NULL),(58,24,1,NULL,NULL),(59,24,2,NULL,NULL),(60,24,3,NULL,NULL),(112,23,1,88.00,'黄金会员'),(113,23,2,88.00,'白金会员'),(114,23,3,66.00,'钻石会员'),(142,31,1,NULL,'黄金会员'),(143,31,2,NULL,'白金会员'),(144,31,3,NULL,'钻石会员'),(148,32,1,NULL,'黄金会员'),(149,32,2,NULL,'白金会员'),(150,32,3,NULL,'钻石会员'),(154,33,1,NULL,'黄金会员'),(155,33,2,NULL,'白金会员'),(156,33,3,NULL,'钻石会员'),(175,34,1,NULL,'黄金会员'),(176,34,2,NULL,'白金会员'),(177,34,3,NULL,'钻石会员'),(178,30,1,NULL,'黄金会员'),(179,30,2,NULL,'白金会员'),(180,30,3,NULL,'钻石会员'),(192,27,1,NULL,'黄金会员'),(193,27,2,NULL,'白金会员'),(194,27,3,NULL,'钻石会员'),(195,28,1,NULL,'黄金会员'),(196,28,2,NULL,'白金会员'),(197,28,3,NULL,'钻石会员'),(198,29,1,NULL,'黄金会员'),(199,29,2,NULL,'白金会员'),(200,29,3,NULL,'钻石会员'),(201,26,1,NULL,'黄金会员'),(202,26,2,NULL,'白金会员'),(203,26,3,NULL,'钻石会员'),(246,36,1,NULL,'黄金会员'),(247,36,2,NULL,'白金会员'),(248,36,3,NULL,'钻石会员'),(249,35,1,NULL,'黄金会员'),(250,35,2,NULL,'白金会员'),(251,35,3,NULL,'钻石会员');
/*!40000 ALTER TABLE `pms_member_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product`
--

DROP TABLE IF EXISTS `pms_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `product_category_id` bigint DEFAULT NULL COMMENT '商品分类id',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品分类名称',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品头相',
  `product_sn` varchar(64) NOT NULL COMMENT '货号',
  `delete_status` int DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int DEFAULT NULL COMMENT '排序',
  `sale` int DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `rebate_rate` int unsigned NOT NULL COMMENT '佣金比例，0-100之间的整数',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `product_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品链接',
  `description` text COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `album_pics` varchar(255) DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_html` text COMMENT '产品详情网页内容',
  `detail_mobile_html` text COMMENT '移动端网页详情',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pms_product_product_sn_IDX` (`product_sn`) USING BTREE,
  KEY `pms_product_admin_id` (`create_user_id`,`delete_status`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product`
--

LOCK TABLES `pms_product` WRITE;
/*!40000 ALTER TABLE `pms_product` DISABLE KEYS */;
INSERT INTO `pms_product` VALUES (41,53,'女鞋','test商品001','ttc小店_001',NULL,'e474509a46df4946a8b5f8ee9afa2913',1,1,NULL,NULL,1,NULL,NULL,NULL,0,NULL,'http://www.baidu.com',NULL,NULL,'http://123.jpg,http:/345.png','<span>hello ttc</span>',NULL,10,'2022-07-18 15:16:19','2022-07-18 16:11:42'),(42,53,'女鞋','test商品001','ttc小店',NULL,'73b050b0cdd74eedb03c7584396d4542',0,1,NULL,NULL,0,NULL,NULL,156.78,18,NULL,'http://www.baidu.com',NULL,NULL,'http://123.jpg,http:/345.png','<span>hello</span>',NULL,10,'2022-07-19 11:41:52','2022-07-19 11:41:52'),(43,10,'牛仔裤','牛仔裤','小汤百货','1,2,34','efefdef0c9dc438b99286eff1bd1b56b',0,0,NULL,NULL,1,NULL,NULL,118.20,18,NULL,'https://douyin.com/123',NULL,NULL,'2,23,222','<span>123</span>',NULL,10,'2022-07-26 23:05:10','2022-07-26 23:05:10'),(44,45,'五金工具','五金水龙头(不锈钢)','小汤五金店','http://192.168.1.10:9000/mall/20220728/78c7d306026c4dc19dfbb373f40c4ae8.jpg,http://192.168.1.10:9000/mall/20220728/e72b6aa1ac744e238cc943e4327c6ded.jpg','fbbc4d2e7d1e4db086daf3ccae35647a',0,0,NULL,NULL,0,NULL,NULL,25.00,17,NULL,'http://www.baidu.com',NULL,NULL,'http://192.168.1.10:9000/mall/20220728/e72b6aa1ac744e238cc943e4327c6ded.jpg','<span>12312312</span>',NULL,10,'2022-07-28 23:40:28','2022-07-28 23:40:28'),(45,45,'五金工具','五金喷头(不锈钢)','小汤五金店','http://159.75.125.80:9000/mall/20220803/4c3a1f04c69549769ffde4cf25dccf22.jpg,http://159.75.125.80:9000/mall/20220803/212f940519124b9dba97a52f7c237340.jpg','ab76bdb6c4c74d1c92ff3c7adcd8ac70',0,1,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220803/4c3a1f04c69549769ffde4cf25dccf22.jpg,http://159.75.125.80:9000/mall/20220803/212f940519124b9dba97a52f7c237340.jpg','<span>12312312</span>',NULL,10,'2022-08-03 12:03:32','2022-08-03 12:03:32'),(46,45,'五金工具','五金喷头(tangtang店)','tangtang店','http://159.75.125.80:9000/mall/20220803/4c3a1f04c69549769ffde4cf25dccf22.jpg,http://159.75.125.80:9000/mall/20220803/212f940519124b9dba97a52f7c237340.jpg','1a35b748cef4467bbb6337dd4daf3ec5',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220803/4c3a1f04c69549769ffde4cf25dccf22.jpg,http://159.75.125.80:9000/mall/20220803/212f940519124b9dba97a52f7c237340.jpg','<span>tangtang店最佳年度产品推荐</span>',NULL,20,'2022-08-05 09:31:35','2022-08-05 09:31:35'),(47,54,'内裤','男式裤衩(tangtang店)','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','bd0099c6174248ecb3c9e13676ef23a4',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,20,'2022-08-05 09:54:49','2022-08-05 09:54:49'),(48,8,'T恤','男式背心(tangtang店)','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','6dcc8872b9a54040bb29e21803564fb9',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,20,'2022-08-05 09:57:43','2022-08-05 09:57:43'),(49,8,'T恤','男式背心(tangtang店)','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','1bb2d19e83e24470a552f86b0cac635c',1,1,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,11,'2022-08-05 23:09:10','2022-08-05 23:09:10'),(50,1,'服装','Stormfa衣服','Stormfa店铺','http://159.75.125.80:9000/mall/20220805/9e593a6721c245888a69dbab725feb7e.png','9d0ab49001c742738772d00450251f3a',1,0,NULL,NULL,0,NULL,NULL,11.00,8,NULL,'http://159.75.125.80:8899/doc.html#/default/%E5%90%8E%E5%8F%B0%E7%94%A8%E6%88%B7%E4%BF%A1%E6%81%AF%E7%AE%A1%E7%90%86/getAdminBusinessInfoUsingGET',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/a93ceaf9fda14e149849ec90ea0e5fc7.png','<p>123123123123<img src=\"data:image/png;base64,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\"></p>',NULL,11,'2022-08-05 23:27:10','2022-08-05 23:27:10'),(51,1,'服装','Stormfa衣服','Stormfa店铺','http://159.75.125.80:9000/mall/20220806/8ca478bebff44d8db53b80413de5fc34.png','892260d12b274f60b14710e432bacf97',0,1,NULL,NULL,0,NULL,NULL,10.00,4,NULL,'http://159.75.125.80:8899/doc.html#/default/%E5%95%86%E5%93%81%E7%AE%A1%E7%90%86/getListUsingGET_1',NULL,NULL,'http://159.75.125.80:9000/mall/20220806/b3bc347287174dd38dca887be92f79b0.png','<p><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALwAAADmCAMAAABYgh8IAAAAA3NCSVQICAjb4U/gAAABgFBMVEX///9SOCxSOjH/wp8AAAD+wJ4ICAhWPjL/7tDMQjj////66834vZuZmZmVcl+bdmN7KCIxIRr39/dUQjpRS0nFQjhKMihptaVQRUEzJyAyIx46KSF8LSdAKyJSOCxUQjqcincQEBBSOjFSOjHzp4tSOCz/xqZSOjFkTEBUQjpSOjG7qJP/+PQpHhpSOjFSOjH87+jz4cRqUURDMSlTSURQRUFUQjr/1r//0bAaEg9UQjqHZFL/59nOTENTSURSOCyNfGojGhddV0wpKSnGl3yWlJKUh3d4YlM5OTkQEBDez7fLvKWdj4hzW0xIQj/05+bbp4nWZlZTSURTSURSOjFSOjHo17yMgn5+bFwZLSlWPjL358v/4sL5w6XWxKyJcmF3VkYhFxIzMzP86MynnIi1jHRXmYwhISEYGBhSOCwICAj50rvehn+SblqRMClWPjIICAgAAACLZWJAa2I2XVRRS0kQEBBUQjpLOC/xt5blqqWvhnBNh3spRD4ICAhWPjKmNNozAAAAgHRSTlMA////////////////////////RBH///8i///////uZv//d4j/3f+q/1WZ////Zrv/////IjN3////M////zPM//8RM/////8RiP////8R////EUTM7v////+7/////////yL/////RGa73f////+q7u7///8id5mq//////+q7kFCNkwAAAAJcEhZcwAACxIAAAsSAdLdfvwAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzQGstOgAAAgAElEQVR4nMVdh0PUyBo32U2C7gLC0vvCozcBQREbFlTUs/feFfXOe/q84on/+pv2lZkkm6x3nCNuSzL5zTe/r8zMl2TXrsTSNrny2/z8+PBgZX/yDv9e6Tp6rXKongMGPV0i+TI+eXWngGWUrsmpGxrGt2u5DxrxfIPel3++d2ywbQcxJpa2ym8DHit5hV9B6JGvP/q+P145saNgrdJWmcKeV/LzvBs5xXfds4togUDvfRv5l/hf+c3Xvc763/NWch3b5bFjtOhNB3jjR3cY965dhzTN7aJ0L5fo57CxrPHw4Vh+zfke5ILnvoNZ/+BH3mSeGqboCHV8RE2R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\"></p><p><img src=\"data:image/png;base64,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\"></p>',NULL,11,'2022-08-06 00:12:22','2022-08-06 00:12:22'),(52,1,'服装','Stormfa衣服','Stormfa店铺','http://159.75.125.80:9000/mall/20220806/444f08147a784064af6007f42de312c2.png','134dbcb4da5646aebb3b9d531b3a053a',0,1,NULL,NULL,0,NULL,NULL,5.00,6,NULL,'http://159.75.125.80:8899/doc.html#/default/%E5%95%86%E5%93%81%E7%AE%A1%E7%90%86/getListUsingGET_1',NULL,NULL,'http://159.75.125.80:9000/mall/20220806/b8bfecffd1a049debb1e2aeaacc20b36.png','<p>3213213123</p>',NULL,11,'2022-08-06 00:51:03','2022-08-06 00:51:03'),(53,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','24c2982c5ca44052922cbefb20bf7cd7',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:18','2022-08-06 00:53:18'),(54,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','e79c5e64a2e24c75b044b2bef0e06562',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:22','2022-08-06 00:53:22'),(55,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','0aa9b9969b354d90b20edb7baa61de3c',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:24','2022-08-06 00:53:24'),(56,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','6e22763b155f47d88a2683a48ace762f',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:25','2022-08-06 00:53:25'),(57,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','b2e5f633ed78417982c100c248f74abe',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:26','2022-08-06 00:53:26'),(58,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','8b9807e00c7f45d0b6bf1a5c995bd7f3',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:27','2022-08-06 00:53:27'),(59,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','1c4d1d9a73a8438ebfa7c7605717e043',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:28','2022-08-06 00:53:28'),(60,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','c98c60a2fe404683883cfa0ad4edd1ac',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:41','2022-08-06 00:53:41'),(61,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','4d1005d5bb34499aa4923384b321d0a7',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:41','2022-08-06 00:53:41'),(62,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','314a787081414afeae92a9e77be4d9b8',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:42','2022-08-06 00:53:42'),(63,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','b36a2f6e0a3444bc9431988fccb2e5f5',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:43','2022-08-06 00:53:43'),(64,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','c5ce4eba548c439f9a509da2feaf2f95',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:53:44','2022-08-06 00:53:44'),(65,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','ff5bf25d1bdd42008e246d17642718a0',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:54:16','2022-08-06 00:54:16'),(66,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','760a75826e08434b91de3735737b72ce',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 00:54:17','2022-08-06 00:54:17'),(67,1,'服装','Stormfa衣服','Stormfa店铺','http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','35e2abb06e0f4a3a90ef440543a10442',0,0,NULL,NULL,0,NULL,NULL,5.00,8,NULL,'http://www.baidu.com',NULL,NULL,'http://www.qianduanheidong.com/static/img/gongzhonghao.jpg','<div>测试</div>',NULL,11,'2022-08-06 11:10:48','2022-08-06 11:10:48'),(68,8,'T恤','男式背心(tangtang店)1','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','672e20499c91415dbac4db8b26af3609',0,1,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:06:53','2022-08-06 13:06:53'),(69,8,'T恤','男式背心(tangtang店)2','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','7b902325cbfe4e62bb8f397c67ecb2e3',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:06:56','2022-08-06 13:06:56'),(70,8,'T恤','男式背心(tangtang店)3','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','29fa4689848a476ba5d6b31d7f55e76e',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:07:01','2022-08-06 13:07:01'),(71,8,'T恤','男式背心(tangtang店)4','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','335526e1b3b845b78bd5d11f78e47c71',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:07:04','2022-08-06 13:07:04'),(72,8,'T恤','男式背心(tangtang店)5','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','81ff787df64d4b8783803b8ec51c6111',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:07:06','2022-08-06 13:07:06'),(73,8,'T恤','男式背心(tangtang店)6','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','cc64eedd691049e29b0d6926ddf01e39',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:07:08','2022-08-06 13:07:08'),(74,8,'T恤','男式背心(tangtang店)7','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','fe6d7bbd342c4af78abee9ce87bda2ba',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:07:13','2022-08-06 13:07:13'),(75,8,'T恤','男式背心(tangtang店)8','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','63d8d5a2640541de993b87e6aee3835e',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:07:16','2022-08-06 13:07:16'),(76,8,'T恤','男式背心(tangtang店)9','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','bcba4b6c12254209a36e79910b741376',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:07:18','2022-08-06 13:07:18'),(77,8,'T恤','男式背心(tangtang店)10','tangtang店','http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','4c1334490e6b477a86efa13bc292f8f4',0,0,NULL,NULL,0,NULL,NULL,12.00,12,NULL,'http://www.baidu.com',NULL,NULL,'http://159.75.125.80:9000/mall/20220805/f5f1048566f74488a844d9cb3a77d576.jpg','<span>tangtang店夏季新品</span>',NULL,10,'2022-08-06 13:07:22','2022-08-06 13:07:22'),(78,3,'家用电器','泰国进口chabatree 柚木正餐勺正餐叉黄油刀日式吃饭勺子餐具无漆','stormfa店铺','http://159.75.125.80:9000/mall/20220806/ba17e65563a44ac99123ee059ced26f6.jpg','e6a937716cbe4bd083da6c34e008d529',0,1,NULL,NULL,0,NULL,NULL,12.00,3,NULL,'https://item.taobao.com/item.htm?id=567390731504',NULL,NULL,'http://159.75.125.80:9000/mall/20220806/70a23ef1da774c7da78c563b12a0ec26.jpg','<h1>泰国进口chabatree 柚木正餐勺正餐叉黄油刀日式吃饭勺子餐具无漆</h1><h1><br></h1><p><br></p><p><br></p><p class=\"ql-align-center\"><img src=\"https://img.alicdn.com/imgextra/i4/3814691387/TB2EsHuHKuSBuNjSsplXXbe8pXa_!!3814691387.jpg\"><img src=\"https://img.alicdn.com/imgextra/i2/3814691387/TB22iWwHNSYBuNjSsphXXbGvVXa_!!3814691387.jpg\"></p><p class=\"ql-align-center\"><img src=\"https://img.alicdn.com/imgextra/i2/3814691387/TB2fFw2jamWBuNjy1XaXXXCbXXa_!!3814691387.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/3814691387/TB2xjKLjHuWBuNjSszgXXb8jVXa_!!3814691387.jpg\"><img src=\"https://img.alicdn.com/imgextra/i3/3814691387/TB2szKCjMaTBuNjSszfXXXgfpXa_!!3814691387.jpg\"><img src=\"https://img.alicdn.com/imgextra/i1/3814691387/TB2Bq2qjKuSBuNjy1XcXXcYjFXa_!!3814691387.jpg\" height=\"468\" width=\"480\"><img src=\"https://img.alicdn.com/imgextra/i1/3814691387/TB2ha7ujStYBeNjSspaXXaOOFXa_!!3814691387.jpg\" height=\"468\" width=\"480\"></p><p><br></p><p><br></p>',NULL,11,'2022-08-06 23:02:35','2022-08-06 23:02:35');
/*!40000 ALTER TABLE `pms_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_attribute`
--

DROP TABLE IF EXISTS `pms_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `select_type` int DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='商品属性参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_attribute`
--

LOCK TABLES `pms_product_attribute` WRITE;
/*!40000 ALTER TABLE `pms_product_attribute` DISABLE KEYS */;
INSERT INTO `pms_product_attribute` VALUES (1,1,'尺寸',2,1,'M,X,XL,2XL,3XL,4XL',0,0,0,0,0,0),(7,1,'颜色',2,1,'黑色,红色,白色,粉色',100,0,0,0,1,0),(13,0,'上市年份',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(14,0,'上市年份1',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(15,0,'上市年份2',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(16,0,'上市年份3',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(17,0,'上市年份4',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(18,0,'上市年份5',1,1,'2013年,2014年,2015年,2016年,2017年',0,0,0,0,0,1),(19,0,'适用对象',1,1,'青年女性,中年女性',0,0,0,0,0,1),(20,0,'适用对象1',2,1,'青年女性,中年女性',0,0,0,0,0,1),(21,0,'适用对象3',2,1,'青年女性,中年女性',0,0,0,0,0,1),(24,1,'商品编号',1,0,'',0,0,0,0,0,1),(25,1,'适用季节',1,1,'春季,夏季,秋季,冬季',0,0,0,0,0,1),(32,2,'适用人群',0,1,'老年,青年,中年',0,0,0,0,0,1),(33,2,'风格',0,1,'嘻哈风格,基础大众,商务正装',0,0,0,0,0,1),(35,2,'颜色',0,0,'',100,0,0,0,1,0),(37,1,'适用人群',1,1,'儿童,青年,中年,老年',0,0,0,0,0,1),(38,1,'上市时间',1,1,'2017年秋,2017年冬,2018年春,2018年夏',0,0,0,0,0,1),(39,1,'袖长',1,1,'短袖,长袖,中袖',0,0,0,0,0,1),(40,2,'尺码',0,1,'29,30,31,32,33,34',0,0,0,0,0,0),(41,2,'适用场景',0,1,'居家,运动,正装',0,0,0,0,0,1),(42,2,'上市时间',0,1,'2018年春,2018年夏',0,0,0,0,0,1),(43,3,'颜色',0,0,'',100,0,0,0,1,0),(44,3,'容量',0,1,'16G,32G,64G,128G',0,0,0,0,0,0),(45,3,'屏幕尺寸',0,0,'',0,0,0,0,0,1),(46,3,'网络',0,1,'3G,4G',0,0,0,0,0,1),(47,3,'系统',0,1,'Android,IOS',0,0,0,0,0,1),(48,3,'电池容量',0,0,'',0,0,0,0,0,1),(49,11,'颜色',0,1,'红色,蓝色,绿色',0,1,0,0,0,0),(50,11,'尺寸',0,1,'38,39,40',0,0,0,0,0,0),(51,11,'风格',0,1,'夏季,秋季',0,0,0,0,0,0);
/*!40000 ALTER TABLE `pms_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_attribute_category`
--

DROP TABLE IF EXISTS `pms_product_attribute_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_attribute_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `attribute_count` int DEFAULT '0' COMMENT '属性数量',
  `param_count` int DEFAULT '0' COMMENT '参数数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='产品属性分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_attribute_category`
--

LOCK TABLES `pms_product_attribute_category` WRITE;
/*!40000 ALTER TABLE `pms_product_attribute_category` DISABLE KEYS */;
INSERT INTO `pms_product_attribute_category` VALUES (1,'服装-T恤',2,5),(2,'服装-裤装',2,4),(3,'手机数码-手机通讯',2,4),(4,'配件',0,0),(5,'居家',0,0),(6,'洗护',0,0),(10,'测试分类',0,0),(11,'服装-鞋帽',3,0);
/*!40000 ALTER TABLE `pms_product_attribute_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_attribute_value`
--

DROP TABLE IF EXISTS `pms_product_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_attribute_value` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `product_attribute_id` bigint DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COMMENT='存储产品参数信息的表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_attribute_value`
--

LOCK TABLES `pms_product_attribute_value` WRITE;
/*!40000 ALTER TABLE `pms_product_attribute_value` DISABLE KEYS */;
INSERT INTO `pms_product_attribute_value` VALUES (1,9,1,'X'),(2,10,1,'X'),(3,11,1,'X'),(4,12,1,'X'),(5,13,1,'X'),(6,14,1,'X'),(7,18,1,'X'),(8,7,1,'X'),(9,7,1,'XL'),(10,7,1,'XXL'),(11,22,7,'x,xx'),(12,22,24,'no110'),(13,22,25,'春季'),(14,22,37,'青年'),(15,22,38,'2018年春'),(16,22,39,'长袖'),(124,23,7,'米白色,浅黄色'),(125,23,24,'no1098'),(126,23,25,'春季'),(127,23,37,'青年'),(128,23,38,'2018年春'),(129,23,39,'长袖'),(130,1,13,NULL),(131,1,14,NULL),(132,1,15,NULL),(133,1,16,NULL),(134,1,17,NULL),(135,1,18,NULL),(136,1,19,NULL),(137,1,20,NULL),(138,1,21,NULL),(139,2,13,NULL),(140,2,14,NULL),(141,2,15,NULL),(142,2,16,NULL),(143,2,17,NULL),(144,2,18,NULL),(145,2,19,NULL),(146,2,20,NULL),(147,2,21,NULL),(183,31,24,NULL),(184,31,25,'夏季'),(185,31,37,'青年'),(186,31,38,'2018年夏'),(187,31,39,'短袖'),(198,30,24,NULL),(199,30,25,'夏季'),(200,30,37,'青年'),(201,30,38,'2018年夏'),(202,30,39,'短袖'),(213,27,43,'黑色,蓝色'),(214,27,45,'5.8'),(215,27,46,'4G'),(216,27,47,'Android'),(217,27,48,'3000ml'),(218,28,43,'金色,银色'),(219,28,45,'5.0'),(220,28,46,'4G'),(221,28,47,'Android'),(222,28,48,'2800ml'),(223,29,43,'金色,银色'),(224,29,45,'4.7'),(225,29,46,'4G'),(226,29,47,'IOS'),(227,29,48,'1960ml'),(228,26,43,'金色,银色'),(229,26,45,'5.0'),(230,26,46,'4G'),(231,26,47,'Android'),(232,26,48,'3000');
/*!40000 ALTER TABLE `pms_product_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_category`
--

DROP TABLE IF EXISTS `pms_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) DEFAULT NULL,
  `level` int DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int DEFAULT NULL,
  `product_unit` varchar(64) DEFAULT NULL,
  `nav_status` int DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL,
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='产品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_category`
--

LOCK TABLES `pms_product_category` WRITE;
/*!40000 ALTER TABLE `pms_product_category` DISABLE KEYS */;
INSERT INTO `pms_product_category` VALUES (1,0,'服装',0,100,'件',1,1,1,NULL,'服装','服装分类'),(2,0,'手机数码',0,100,'件',1,1,1,NULL,'手机数码','手机数码'),(3,0,'家用电器',0,100,'件',1,1,1,NULL,'家用电器','家用电器'),(4,0,'家具家装',0,100,'件',1,1,1,NULL,'家具家装','家具家装'),(5,0,'汽车用品',0,100,'件',1,1,1,NULL,'汽车用品','汽车用品'),(7,1,'外套',1,100,'件',1,1,0,'','外套','外套'),(8,1,'T恤',1,100,'件',1,1,0,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png','T恤','T恤'),(9,1,'休闲裤',1,100,'件',1,1,0,NULL,'休闲裤','休闲裤'),(10,1,'牛仔裤',1,100,'件',1,1,0,NULL,'牛仔裤','牛仔裤'),(11,1,'衬衫',1,100,'件',1,1,0,NULL,'衬衫','衬衫分类'),(13,12,'家电子分类1',1,1,'string',0,1,0,'string','string','string'),(14,12,'家电子分类2',1,1,'string',0,1,0,'string','string','string'),(19,2,'手机通讯',1,0,'件',0,0,0,'','手机通讯','手机通讯'),(29,1,'男鞋',1,0,'',0,0,0,'','',''),(30,2,'手机配件',1,0,'',0,0,0,'','手机配件','手机配件'),(31,2,'摄影摄像',1,0,'',0,0,0,'','',''),(32,2,'影音娱乐',1,0,'',0,0,0,'','',''),(33,2,'数码配件',1,0,'',0,0,0,'','',''),(34,2,'智能设备',1,0,'',0,0,0,'','',''),(35,3,'电视',1,0,'',0,0,0,'','',''),(36,3,'空调',1,0,'',0,0,0,'','',''),(37,3,'洗衣机',1,0,'',0,0,0,'','',''),(38,3,'冰箱',1,0,'',0,0,0,'','',''),(39,3,'厨卫大电',1,0,'',0,0,0,'','',''),(40,3,'厨房小电',1,0,'',0,0,0,'','',''),(41,3,'生活电器',1,0,'',0,0,0,'','',''),(42,3,'个护健康',1,0,'',0,0,0,'','',''),(43,4,'厨房卫浴',1,0,'',0,0,0,'','',''),(44,4,'灯饰照明',1,0,'',0,0,0,'','',''),(45,4,'五金工具',1,0,'',0,0,0,'','',''),(46,4,'卧室家具',1,0,'',0,0,0,'','',''),(47,4,'客厅家具',1,0,'',0,0,0,'','',''),(48,5,'全新整车',1,0,'',0,0,0,'','',''),(49,5,'车载电器',1,0,'',0,0,0,'','',''),(50,5,'维修保养',1,0,'',0,0,0,'','',''),(51,5,'汽车装饰',1,0,'',0,0,0,'','',''),(53,1,'女鞋',1,0,'',0,0,0,'','',''),(54,1,'内裤',1,0,'',0,0,0,'','','');
/*!40000 ALTER TABLE `pms_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_category_attribute_relation`
--

DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_category_attribute_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint DEFAULT NULL,
  `product_attribute_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_category_attribute_relation`
--

LOCK TABLES `pms_product_category_attribute_relation` WRITE;
/*!40000 ALTER TABLE `pms_product_category_attribute_relation` DISABLE KEYS */;
INSERT INTO `pms_product_category_attribute_relation` VALUES (1,24,24),(5,26,24),(7,28,24),(9,25,24),(10,25,25);
/*!40000 ALTER TABLE `pms_product_category_attribute_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_full_reduction`
--

DROP TABLE IF EXISTS `pms_product_full_reduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_full_reduction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `full_price` decimal(10,2) DEFAULT NULL,
  `reduce_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='产品满减表(只针对同商品)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_full_reduction`
--

LOCK TABLES `pms_product_full_reduction` WRITE;
/*!40000 ALTER TABLE `pms_product_full_reduction` DISABLE KEYS */;
INSERT INTO `pms_product_full_reduction` VALUES (1,7,100.00,20.00),(2,8,100.00,20.00),(3,9,100.00,20.00),(4,10,100.00,20.00),(5,11,100.00,20.00),(6,12,100.00,20.00),(7,13,100.00,20.00),(8,14,100.00,20.00),(9,18,100.00,20.00),(10,7,200.00,50.00),(11,7,300.00,100.00),(14,22,0.00,0.00),(16,24,0.00,0.00),(34,23,0.00,0.00),(44,31,0.00,0.00),(46,32,0.00,0.00),(48,33,0.00,0.00),(55,34,0.00,0.00),(56,30,0.00,0.00),(59,27,0.00,0.00),(60,28,500.00,50.00),(61,28,1000.00,120.00),(62,29,0.00,0.00),(63,26,0.00,0.00),(78,36,0.00,0.00),(79,35,0.00,0.00);
/*!40000 ALTER TABLE `pms_product_full_reduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_ladder`
--

DROP TABLE IF EXISTS `pms_product_ladder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_ladder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `count` int DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='产品阶梯价格表(只针对同商品)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_ladder`
--

LOCK TABLES `pms_product_ladder` WRITE;
/*!40000 ALTER TABLE `pms_product_ladder` DISABLE KEYS */;
INSERT INTO `pms_product_ladder` VALUES (1,7,3,0.70,0.00),(2,8,3,0.70,0.00),(3,9,3,0.70,0.00),(4,10,3,0.70,0.00),(5,11,3,0.70,0.00),(6,12,3,0.70,0.00),(7,13,3,0.70,0.00),(8,14,3,0.70,0.00),(12,18,3,0.70,0.00),(14,7,4,0.60,0.00),(15,7,5,0.50,0.00),(18,22,0,0.00,0.00),(20,24,0,0.00,0.00),(38,23,0,0.00,0.00),(48,31,0,0.00,0.00),(50,32,0,0.00,0.00),(52,33,0,0.00,0.00),(59,34,0,0.00,0.00),(60,30,0,0.00,0.00),(64,27,2,0.80,0.00),(65,27,3,0.75,0.00),(66,28,0,0.00,0.00),(67,29,0,0.00,0.00),(68,26,0,0.00,0.00),(83,36,0,0.00,0.00),(84,35,0,0.00,0.00);
/*!40000 ALTER TABLE `pms_product_ladder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_operate_log`
--

DROP TABLE IF EXISTS `pms_product_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_operate_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `price_new` decimal(10,2) DEFAULT NULL,
  `sale_price_old` decimal(10,2) DEFAULT NULL,
  `sale_price_new` decimal(10,2) DEFAULT NULL,
  `gift_point_old` int DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int DEFAULT NULL,
  `use_point_limit_old` int DEFAULT NULL,
  `use_point_limit_new` int DEFAULT NULL,
  `operate_man` varchar(64) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_operate_log`
--

LOCK TABLES `pms_product_operate_log` WRITE;
/*!40000 ALTER TABLE `pms_product_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_product_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_vertify_record`
--

DROP TABLE IF EXISTS `pms_product_vertify_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_vertify_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `vertify_man` varchar(64) DEFAULT NULL COMMENT '审核人',
  `status` int DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品审核记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_vertify_record`
--

LOCK TABLES `pms_product_vertify_record` WRITE;
/*!40000 ALTER TABLE `pms_product_vertify_record` DISABLE KEYS */;
INSERT INTO `pms_product_vertify_record` VALUES (1,1,'2018-04-27 16:36:41','test',1,'验证通过'),(2,2,'2018-04-27 16:36:41','test',1,'验证通过'),(3,41,'2022-07-18 17:38:23','test',0,''),(4,41,'2022-07-18 17:38:26','test',1,''),(5,41,'2022-07-18 17:38:29','test',1,''),(6,41,'2022-07-18 17:38:30','test',1,''),(7,41,'2022-07-18 17:38:30','test',1,''),(8,43,'2022-07-26 23:16:22','test',1,'审核通过');
/*!40000 ALTER TABLE `pms_product_vertify_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_sku_stock`
--

DROP TABLE IF EXISTS `pms_sku_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_sku_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku名称',
  `product_id` bigint DEFAULT NULL COMMENT '商品id',
  `sku_code` varchar(64) NOT NULL COMMENT 'sku编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `rebate_rate` int DEFAULT '0' COMMENT '佣金比例',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '展示图片',
  `order` tinyint DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='sku的库存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_sku_stock`
--

LOCK TABLES `pms_sku_stock` WRITE;
/*!40000 ALTER TABLE `pms_sku_stock` DISABLE KEYS */;
INSERT INTO `pms_sku_stock` VALUES (98,'',27,'201808270027001',2699.00,97,NULL,NULL),(99,'',27,'201808270027002',2999.00,100,NULL,NULL),(100,'',27,'201808270027003',2699.00,100,NULL,NULL),(101,'',27,'201808270027004',2999.00,100,NULL,NULL),(102,'',28,'201808270028001',649.00,99,NULL,NULL),(103,'',28,'201808270028002',699.00,99,NULL,NULL),(104,'',28,'201808270028003',649.00,100,NULL,NULL),(105,'',28,'201808270028004',699.00,100,NULL,NULL),(106,'',29,'201808270029001',5499.00,99,NULL,NULL),(107,'',29,'201808270029002',6299.00,100,NULL,NULL),(108,'',29,'201808270029003',5499.00,100,NULL,NULL),(109,'',29,'201808270029004',6299.00,100,NULL,NULL),(110,'',26,'201806070026001',3788.00,499,NULL,NULL),(111,'',26,'201806070026002',3999.00,500,NULL,NULL),(112,'',26,'201806070026003',3788.00,500,NULL,NULL),(113,'',26,'201806070026004',3999.00,500,NULL,NULL),(163,'',36,'202002210036001',100.00,100,NULL,NULL),(164,'',36,'202002210036002',120.00,98,NULL,NULL),(165,'',36,'202002210036003',100.00,100,NULL,NULL),(166,'',36,'202002210036004',100.00,100,NULL,NULL),(167,'',36,'202002210036005',100.00,100,NULL,NULL),(168,'',36,'202002210036006',100.00,100,NULL,NULL),(169,'',36,'202002210036007',100.00,100,NULL,NULL),(170,'',36,'202002210036008',100.00,100,NULL,NULL),(171,'',35,'202002250035001',200.00,100,NULL,NULL),(172,'',35,'202002250035002',240.00,100,NULL,NULL),(173,'',35,'202002250035003',200.00,100,NULL,NULL),(174,'',35,'202002250035004',200.00,100,NULL,NULL),(175,'',35,'202002250035005',200.00,100,NULL,NULL),(176,'',35,'202002250035006',200.00,100,NULL,NULL),(177,'',35,'202002250035007',200.00,100,NULL,NULL),(178,'',35,'202002250035008',200.00,100,NULL,NULL),(180,'小黑鞋一双',41,'202207180041001',123.45,20,NULL,0),(181,'小红鞋一双',41,'202207180041002',111.00,18,NULL,1),(182,'小白鞋红色一双',42,'202207190042001',156.78,18,NULL,0),(183,'一条黑牛仔',43,'202207260043001',118.20,18,NULL,0),(184,'一条蓝牛仔',43,'202207260043002',128.20,19,NULL,1),(185,'低配水龙头',44,'202207280044001',25.00,17,NULL,0),(186,'高配水龙头',44,'202207280044002',35.00,19,NULL,1),(187,'喷头1号',45,'202208030045001',12.00,12,NULL,0),(188,'喷头2号',45,'202208030045002',18.00,15,NULL,1),(189,'喷头3号',45,'202208030045003',22.00,18,NULL,2),(190,'喷头1号',46,'202208050046001',12.00,12,NULL,0),(191,'喷头2号',46,'202208050046002',18.00,15,NULL,1),(192,'喷头3号',46,'202208050046003',22.00,18,NULL,2),(193,'男式裤衩1号',47,'202208050047001',12.00,12,NULL,0),(194,'男式裤衩2号',47,'202208050047002',18.00,15,NULL,1),(195,'男式裤衩3号',47,'202208050047003',22.00,18,NULL,2),(196,'男式背心1号',48,'202208050048001',12.00,12,NULL,0),(197,'男式背心2号',48,'202208050048002',18.00,15,NULL,1),(198,'男式背心3号',48,'202208050048003',22.00,18,NULL,2),(199,'男式背心1号',49,'202208050049001',12.00,12,NULL,0),(200,'男式背心2号',49,'202208050049002',18.00,15,NULL,1),(201,'男式背心3号',49,'202208050049003',22.00,18,NULL,2),(202,'打4折',50,'202208050050001',11.00,8,NULL,0),(203,'打4折',51,'202208060051001',10.00,4,NULL,0),(204,'',51,'202208060051002',0.00,0,NULL,1),(205,'打5折',52,'202208060052001',5.00,6,NULL,0),(206,'打6折',53,'202208060053001',5.00,8,NULL,0),(207,'打6折',54,'202208060054001',5.00,8,NULL,0),(208,'打6折',55,'202208060055001',5.00,8,NULL,0),(209,'打6折',56,'202208060056001',5.00,8,NULL,0),(210,'打6折',57,'202208060057001',5.00,8,NULL,0),(211,'打6折',58,'202208060058001',5.00,8,NULL,0),(212,'打6折',59,'202208060059001',5.00,8,NULL,0),(213,'打6折',60,'202208060060001',5.00,8,NULL,0),(214,'打6折',61,'202208060061001',5.00,8,NULL,0),(215,'打6折',62,'202208060062001',5.00,8,NULL,0),(216,'打6折',63,'202208060063001',5.00,8,NULL,0),(217,'打6折',64,'202208060064001',5.00,8,NULL,0),(218,'打6折',65,'202208060065001',5.00,8,NULL,0),(219,'打6折',66,'202208060066001',5.00,8,NULL,0),(220,'打6折',67,'202208060067001',5.00,8,NULL,0),(221,'男式背心1号',68,'202208060068001',12.00,12,NULL,0),(222,'男式背心2号',68,'202208060068002',18.00,15,NULL,1),(223,'男式背心3号',68,'202208060068003',22.00,18,NULL,2),(224,'男式背心1号',69,'202208060069001',12.00,12,NULL,0),(225,'男式背心2号',69,'202208060069002',18.00,15,NULL,1),(226,'男式背心3号',69,'202208060069003',22.00,18,NULL,2),(227,'男式背心1号',70,'202208060070001',12.00,12,NULL,0),(228,'男式背心2号',70,'202208060070002',18.00,15,NULL,1),(229,'男式背心3号',70,'202208060070003',22.00,18,NULL,2),(230,'男式背心1号',71,'202208060071001',12.00,12,NULL,0),(231,'男式背心2号',71,'202208060071002',18.00,15,NULL,1),(232,'男式背心3号',71,'202208060071003',22.00,18,NULL,2),(233,'男式背心1号',72,'202208060072001',12.00,12,NULL,0),(234,'男式背心2号',72,'202208060072002',18.00,15,NULL,1),(235,'男式背心3号',72,'202208060072003',22.00,18,NULL,2),(236,'男式背心1号',73,'202208060073001',12.00,12,NULL,0),(237,'男式背心2号',73,'202208060073002',18.00,15,NULL,1),(238,'男式背心3号',73,'202208060073003',22.00,18,NULL,2),(239,'男式背心1号',74,'202208060074001',12.00,12,NULL,0),(240,'男式背心2号',74,'202208060074002',18.00,15,NULL,1),(241,'男式背心3号',74,'202208060074003',22.00,18,NULL,2),(242,'男式背心1号',75,'202208060075001',12.00,12,NULL,0),(243,'男式背心2号',75,'202208060075002',18.00,15,NULL,1),(244,'男式背心3号',75,'202208060075003',22.00,18,NULL,2),(245,'男式背心1号',76,'202208060076001',12.00,12,NULL,0),(246,'男式背心2号',76,'202208060076002',18.00,15,NULL,1),(247,'男式背心3号',76,'202208060076003',22.00,18,NULL,2),(248,'男式背心1号',77,'202208060077001',12.00,12,NULL,0),(249,'男式背心2号',77,'202208060077002',18.00,15,NULL,1),(250,'男式背心3号',77,'202208060077003',22.00,18,NULL,2),(251,'打4折',78,'202208060078001',12.00,3,NULL,0);
/*!40000 ALTER TABLE `pms_sku_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_coupon`
--

DROP TABLE IF EXISTS `sms_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL COMMENT '优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) DEFAULT NULL,
  `platform` int DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int DEFAULT NULL COMMENT '数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `per_limit` int DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10,2) DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `use_type` int DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `publish_count` int DEFAULT NULL COMMENT '发行数量',
  `use_count` int DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) DEFAULT NULL COMMENT '优惠码',
  `member_level` int DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='优惠券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_coupon`
--

LOCK TABLES `sms_coupon` WRITE;
/*!40000 ALTER TABLE `sms_coupon` DISABLE KEYS */;
INSERT INTO `sms_coupon` VALUES (2,0,'全品类通用券',0,92,10.00,1,100.00,'2018-08-27 16:40:47','2018-11-23 16:40:47',0,'满100减10',100,0,8,'2018-08-27 16:40:47',NULL,NULL),(3,0,'小米手机专用券',0,92,50.00,1,1000.00,'2018-08-27 16:40:47','2018-11-16 16:40:47',2,'小米手机专用优惠券',100,0,8,'2018-08-27 16:40:47',NULL,NULL),(4,0,'手机品类专用券',0,92,300.00,1,2000.00,'2018-08-27 16:40:47','2018-09-15 16:40:47',1,'手机分类专用优惠券',100,0,8,'2018-08-27 16:40:47',NULL,NULL),(7,0,'T恤分类专用优惠券',0,93,50.00,1,500.00,'2018-08-27 16:40:47','2018-08-15 16:40:47',1,'满500减50',100,0,7,'2018-08-27 16:40:47',NULL,NULL),(8,0,'新优惠券',0,100,100.00,1,1000.00,'2018-11-08 00:00:00','2018-11-27 00:00:00',0,'测试',100,0,1,NULL,NULL,NULL),(9,0,'全品类通用券',0,100,5.00,1,100.00,'2018-11-08 00:00:00','2018-11-10 00:00:00',0,NULL,100,0,1,NULL,NULL,NULL),(10,0,'全品类通用券',0,100,15.00,1,200.00,'2018-11-08 00:00:00','2018-11-10 00:00:00',0,NULL,100,0,1,NULL,NULL,NULL),(11,0,'全品类通用券',0,1000,50.00,1,1000.00,'2018-11-08 00:00:00','2018-11-10 00:00:00',0,NULL,1000,0,0,NULL,NULL,NULL),(12,0,'移动端全品类通用券',1,1,10.00,1,100.00,'2018-11-08 00:00:00','2018-11-10 00:00:00',0,NULL,100,0,0,NULL,NULL,NULL),(19,0,'手机分类专用',0,100,100.00,1,1000.00,'2018-11-09 00:00:00','2018-11-17 00:00:00',1,'手机分类专用',100,0,0,NULL,NULL,NULL),(20,0,'小米手机专用',0,100,200.00,1,1000.00,'2018-11-09 00:00:00','2018-11-24 00:00:00',2,'小米手机专用',100,0,0,NULL,NULL,NULL),(21,0,'xxx',0,100,10.00,1,100.00,'2018-11-09 00:00:00','2018-11-30 00:00:00',2,NULL,100,0,0,NULL,NULL,NULL),(22,0,'string',0,0,0.00,0,0.00,'2019-08-18 15:36:11','2019-08-18 15:36:11',0,'string',0,0,0,'2019-08-18 15:36:11','string',0),(23,0,'有效期测试',0,100,10.00,1,100.00,'2019-10-05 00:00:00','2019-10-09 00:00:00',0,NULL,100,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sms_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_coupon_history`
--

DROP TABLE IF EXISTS `sms_coupon_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_coupon_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint DEFAULT NULL,
  `member_id` bigint DEFAULT NULL,
  `coupon_code` varchar(64) DEFAULT NULL,
  `member_nickname` varchar(64) DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime DEFAULT NULL,
  `use_status` int DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `idx_coupon_id` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='优惠券使用、领取历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_coupon_history`
--

LOCK TABLES `sms_coupon_history` WRITE;
/*!40000 ALTER TABLE `sms_coupon_history` DISABLE KEYS */;
INSERT INTO `sms_coupon_history` VALUES (2,2,1,'4931048380330002','windir',1,'2018-08-29 14:04:12',1,'2018-11-12 14:38:47',12,'201809150101000001'),(3,3,1,'4931048380330003','windir',1,'2018-08-29 14:04:29',0,NULL,NULL,NULL),(4,4,1,'4931048380330004','windir',1,'2018-08-29 14:04:32',0,NULL,NULL,NULL),(11,7,1,'4931048380330001','windir',1,'2018-09-04 16:21:50',0,NULL,NULL,NULL),(12,2,4,'0340981248320004','zhensan',1,'2018-11-12 14:16:50',0,NULL,NULL,NULL),(13,3,4,'0342977234360004','zhensan',1,'2018-11-12 14:17:10',0,NULL,NULL,NULL),(14,4,4,'0343342928830004','zhensan',1,'2018-11-12 14:17:13',0,NULL,NULL,NULL),(15,2,5,'0351883832180005','lisi',1,'2018-11-12 14:18:39',0,NULL,NULL,NULL),(16,3,5,'0352201672680005','lisi',1,'2018-11-12 14:18:42',0,NULL,NULL,NULL),(17,4,5,'0352505810180005','lisi',1,'2018-11-12 14:18:45',0,NULL,NULL,NULL),(18,2,6,'0356114588380006','wangwu',1,'2018-11-12 14:19:21',0,NULL,NULL,NULL),(19,3,6,'0356382856920006','wangwu',1,'2018-11-12 14:19:24',0,NULL,NULL,NULL),(20,4,6,'0356656798470006','wangwu',1,'2018-11-12 14:19:27',0,NULL,NULL,NULL),(21,2,3,'0363644984620003','windy',1,'2018-11-12 14:20:36',0,NULL,NULL,NULL),(22,3,3,'0363932820300003','windy',1,'2018-11-12 14:20:39',0,NULL,NULL,NULL),(23,4,3,'0364238275840003','windy',1,'2018-11-12 14:20:42',0,NULL,NULL,NULL),(24,2,7,'0385034833070007','lion',1,'2018-11-12 14:24:10',0,NULL,NULL,NULL),(25,3,7,'0385350208650007','lion',1,'2018-11-12 14:24:13',0,NULL,NULL,NULL),(26,4,7,'0385632733900007','lion',1,'2018-11-12 14:24:16',0,NULL,NULL,NULL),(27,2,8,'0388779132990008','shari',1,'2018-11-12 14:24:48',0,NULL,NULL,NULL),(28,3,8,'0388943658810008','shari',1,'2018-11-12 14:24:49',0,NULL,NULL,NULL),(29,4,8,'0389069398320008','shari',1,'2018-11-12 14:24:51',0,NULL,NULL,NULL),(30,2,9,'0390753935250009','aewen',1,'2018-11-12 14:25:08',0,NULL,NULL,NULL),(31,3,9,'0390882954470009','aewen',1,'2018-11-12 14:25:09',0,NULL,NULL,NULL),(32,4,9,'0391025542810009','aewen',1,'2018-11-12 14:25:10',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sms_coupon_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_coupon_product_category_relation`
--

DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_coupon_product_category_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint DEFAULT NULL,
  `product_category_id` bigint DEFAULT NULL,
  `product_category_name` varchar(200) DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优惠券和产品分类关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_coupon_product_category_relation`
--

LOCK TABLES `sms_coupon_product_category_relation` WRITE;
/*!40000 ALTER TABLE `sms_coupon_product_category_relation` DISABLE KEYS */;
INSERT INTO `sms_coupon_product_category_relation` VALUES (4,19,30,'手机配件','手机数码');
/*!40000 ALTER TABLE `sms_coupon_product_category_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_coupon_product_relation`
--

DROP TABLE IF EXISTS `sms_coupon_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_coupon_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='优惠券和产品的关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_coupon_product_relation`
--

LOCK TABLES `sms_coupon_product_relation` WRITE;
/*!40000 ALTER TABLE `sms_coupon_product_relation` DISABLE KEYS */;
INSERT INTO `sms_coupon_product_relation` VALUES (9,21,33,'小米（MI）小米电视4A ','4609652');
/*!40000 ALTER TABLE `sms_coupon_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_flash_promotion`
--

DROP TABLE IF EXISTS `sms_flash_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_flash_promotion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `status` int DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='限时购表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_flash_promotion`
--

LOCK TABLES `sms_flash_promotion` WRITE;
/*!40000 ALTER TABLE `sms_flash_promotion` DISABLE KEYS */;
INSERT INTO `sms_flash_promotion` VALUES (2,'春季家电家具疯狂秒杀1','2018-11-12','2018-11-23',1,'2018-11-16 11:12:13'),(3,'手机特卖','2018-11-03','2018-11-10',1,'2018-11-16 11:11:31'),(4,'春季家电家具疯狂秒杀3','2018-11-24','2018-11-25',1,'2018-11-16 11:12:19'),(5,'春季家电家具疯狂秒杀4','2018-11-16','2018-11-16',1,'2018-11-16 11:12:24'),(6,'春季家电家具疯狂秒杀5','2018-11-16','2018-11-16',1,'2018-11-16 11:12:31'),(7,'春季家电家具疯狂秒杀6','2018-11-16','2018-11-16',1,'2018-11-16 11:12:35'),(8,'春季家电家具疯狂秒杀7','2018-11-16','2018-11-16',0,'2018-11-16 11:12:39'),(9,'春季家电家具疯狂秒杀8','2018-11-16','2018-11-16',0,'2018-11-16 11:12:42'),(13,'测试','2018-11-01','2018-11-30',0,'2018-11-19 10:34:24');
/*!40000 ALTER TABLE `sms_flash_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_flash_promotion_log`
--

DROP TABLE IF EXISTS `sms_flash_promotion_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_flash_promotion_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `member_phone` varchar(64) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `subscribe_time` datetime DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时购通知记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_flash_promotion_log`
--

LOCK TABLES `sms_flash_promotion_log` WRITE;
/*!40000 ALTER TABLE `sms_flash_promotion_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_flash_promotion_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_flash_promotion_product_relation`
--

DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_flash_promotion_product_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint DEFAULT NULL,
  `flash_promotion_session_id` bigint DEFAULT NULL COMMENT '编号',
  `product_id` bigint DEFAULT NULL,
  `flash_promotion_price` decimal(10,2) DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int DEFAULT NULL COMMENT '每人限购数量',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='商品限时购与商品关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_flash_promotion_product_relation`
--

LOCK TABLES `sms_flash_promotion_product_relation` WRITE;
/*!40000 ALTER TABLE `sms_flash_promotion_product_relation` DISABLE KEYS */;
INSERT INTO `sms_flash_promotion_product_relation` VALUES (1,2,1,26,3000.00,10,1,0),(2,2,1,27,2000.00,10,1,20),(3,2,1,28,599.00,19,1,0),(4,2,1,29,4999.00,10,1,100),(9,2,2,26,2999.00,100,1,0),(10,2,2,27,NULL,NULL,NULL,NULL),(11,2,2,28,NULL,NULL,NULL,NULL),(12,2,2,29,NULL,NULL,NULL,NULL),(13,2,2,30,NULL,NULL,NULL,NULL),(14,2,3,31,NULL,NULL,NULL,NULL),(15,2,3,32,NULL,NULL,NULL,NULL),(16,2,4,33,NULL,NULL,NULL,NULL),(17,2,4,34,NULL,NULL,NULL,NULL),(18,2,5,36,NULL,NULL,NULL,NULL),(19,2,6,33,NULL,NULL,NULL,NULL),(20,2,6,34,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sms_flash_promotion_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_flash_promotion_session`
--

DROP TABLE IF EXISTS `sms_flash_promotion_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_flash_promotion_session` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '场次名称',
  `start_time` time DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time DEFAULT NULL COMMENT '每日结束时间',
  `status` int DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='限时购场次表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_flash_promotion_session`
--

LOCK TABLES `sms_flash_promotion_session` WRITE;
/*!40000 ALTER TABLE `sms_flash_promotion_session` DISABLE KEYS */;
INSERT INTO `sms_flash_promotion_session` VALUES (1,'8:00','08:00:29','09:00:33',1,'2018-11-16 13:22:17'),(2,'10:00','10:00:33','11:00:33',1,'2018-11-16 13:22:34'),(3,'12:00','12:00:00','13:00:22',1,'2018-11-16 13:22:37'),(4,'14:00','14:00:00','15:00:00',1,'2018-11-16 13:22:41'),(5,'16:00','16:00:00','17:00:00',1,'2018-11-16 13:22:45'),(6,'18:00','18:00:00','19:00:00',1,'2018-11-16 13:21:34'),(7,'20:00','20:00:33','21:00:33',0,'2018-11-16 13:22:55');
/*!40000 ALTER TABLE `sms_flash_promotion_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_home_advertise`
--

DROP TABLE IF EXISTS `sms_home_advertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_home_advertise` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `admin_id` bigint NOT NULL COMMENT '团长id',
  `name` varchar(100) DEFAULT NULL COMMENT '广告标题',
  `type` int DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) DEFAULT NULL COMMENT '广告图片',
  `start_time` datetime DEFAULT NULL COMMENT '生效时间',
  `end_time` datetime DEFAULT NULL COMMENT '失效时间',
  `status` int DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int DEFAULT NULL COMMENT '点击数',
  `order_count` int DEFAULT NULL COMMENT '下单数',
  `url` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `sort` int DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `idx_admin_id` (`admin_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='首页轮播广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_home_advertise`
--

LOCK TABLES `sms_home_advertise` WRITE;
/*!40000 ALTER TABLE `sms_home_advertise` DISABLE KEYS */;
INSERT INTO `sms_home_advertise` VALUES (2,0,'夏季大热促销',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg','2018-11-01 14:01:37','2018-11-15 14:01:37',1,0,0,NULL,'夏季大热促销',0),(3,0,'夏季大热促销1',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg','2018-11-13 14:01:37','2018-11-13 14:01:37',0,0,0,NULL,'夏季大热促销1',0),(4,0,'夏季大热促销2',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg','2018-11-13 14:01:37','2018-11-13 14:01:37',1,0,0,NULL,'夏季大热促销2',0),(9,0,'电影推荐广告',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg','2018-11-01 00:00:00','2018-11-24 00:00:00',1,0,0,'www.baidu.com','电影推荐广告',100),(10,0,'汽车促销广告',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg','2018-11-13 00:00:00','2018-11-24 00:00:00',1,0,0,'xxx',NULL,99),(11,0,'汽车推荐广告',1,'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg','2018-11-13 00:00:00','2018-11-30 00:00:00',1,0,0,'xxx',NULL,98),(13,10,'夏季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-03 23:34:00','2099-01-01 00:00:00',1,0,0,'http://www.baidu.com','短袖、短裤',333),(14,10,'冬季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-05 19:05:43','2099-01-01 00:00:00',1,0,0,'','袄子，毛衣',12),(15,10,'冬季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-06 13:45:47','2099-01-01 00:00:00',0,0,0,'','袄子，毛衣',12),(16,10,'冬季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-06 13:45:47','2099-01-01 00:00:00',0,0,0,'','袄子，毛衣',12),(17,10,'冬季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-06 13:45:48','2099-01-01 00:00:00',0,0,0,'','袄子，毛衣',12),(18,10,'冬季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-06 13:45:48','2099-01-01 00:00:00',0,0,0,'','袄子，毛衣',12),(19,10,'冬季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-06 13:45:49','2099-01-01 00:00:00',0,0,0,'','袄子，毛衣',12),(20,10,'冬季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-06 13:45:49','2099-01-01 00:00:00',0,0,0,'','袄子，毛衣',12),(21,10,'冬季特卖',1,'http://159.75.125.80:9000/mall/20220803/50f61f1ee6d84c96a7ed44fd09cd8a04.jpg','2022-08-06 13:45:49','2099-01-01 00:00:00',0,0,0,'','袄子，毛衣',12),(22,3,'stormfa',1,'','2022-08-07 14:04:11','2099-01-01 00:00:00',0,0,0,'http://159.75.125.80:9000/mall/20220807/e2abec6d04e84637a9d13a718df2e988.jpg','',0),(24,3,'Banner2',1,NULL,'2022-08-07 14:24:17','2099-01-01 00:00:00',0,0,0,'http://159.75.125.80:9000/mall/20220807/2ad95a1168744ee9a42de356126e20b6.png',NULL,NULL);
/*!40000 ALTER TABLE `sms_home_advertise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_home_brand`
--

DROP TABLE IF EXISTS `sms_home_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_home_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint DEFAULT NULL,
  `brand_name` varchar(64) DEFAULT NULL,
  `recommend_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='首页推荐品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_home_brand`
--

LOCK TABLES `sms_home_brand` WRITE;
/*!40000 ALTER TABLE `sms_home_brand` DISABLE KEYS */;
INSERT INTO `sms_home_brand` VALUES (1,1,'万和',1,200),(2,2,'三星',1,0),(6,6,'小米',1,300),(8,5,'方太',1,100),(31,49,'七匹狼',0,0),(32,50,'海澜之家',1,0),(33,51,'苹果',1,0),(34,2,'三星',0,0),(35,3,'华为',1,0),(36,4,'格力',1,0),(37,5,'方太',1,0),(38,1,'万和',1,0),(39,21,'OPPO',1,0);
/*!40000 ALTER TABLE `sms_home_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_home_new_product`
--

DROP TABLE IF EXISTS `sms_home_new_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_home_new_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='新鲜好物表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_home_new_product`
--

LOCK TABLES `sms_home_new_product` WRITE;
/*!40000 ALTER TABLE `sms_home_new_product` DISABLE KEYS */;
INSERT INTO `sms_home_new_product` VALUES (2,27,'小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待',1,200),(8,26,'华为 HUAWEI P20 ',0,0),(9,27,'小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待',1,0),(10,28,'小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待',1,0),(11,29,'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机',1,0),(12,30,'HLA海澜之家简约动物印花短袖T恤',1,0);
/*!40000 ALTER TABLE `sms_home_new_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_home_recommend_product`
--

DROP TABLE IF EXISTS `sms_home_recommend_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_home_recommend_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='人气推荐商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_home_recommend_product`
--

LOCK TABLES `sms_home_recommend_product` WRITE;
/*!40000 ALTER TABLE `sms_home_recommend_product` DISABLE KEYS */;
INSERT INTO `sms_home_recommend_product` VALUES (3,26,'华为 HUAWEI P20 ',1,0),(4,27,'小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待',1,0),(5,28,'小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待',1,0),(6,29,'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机',1,0),(7,30,'HLA海澜之家简约动物印花短袖T恤',1,100);
/*!40000 ALTER TABLE `sms_home_recommend_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_home_recommend_subject`
--

DROP TABLE IF EXISTS `sms_home_recommend_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_home_recommend_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_id` bigint DEFAULT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `recommend_status` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='首页推荐专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_home_recommend_subject`
--

LOCK TABLES `sms_home_recommend_subject` WRITE;
/*!40000 ALTER TABLE `sms_home_recommend_subject` DISABLE KEYS */;
INSERT INTO `sms_home_recommend_subject` VALUES (14,1,'polo衬衫的也时尚',1,0),(15,2,'大牌手机低价秒',1,0),(16,3,'晓龙845新品上市',1,0),(17,4,'夏天应该穿什么',1,0),(18,5,'夏季精选',1,100),(19,6,'品牌手机降价',1,0);
/*!40000 ALTER TABLE `sms_home_recommend_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_admin`
--

DROP TABLE IF EXISTS `ums_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '账号id',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ums_admin_username_IDX` (`username`) USING BTREE /*!80000 INVISIBLE */,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='后台用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_admin`
--

LOCK TABLES `ums_admin` WRITE;
/*!40000 ALTER TABLE `ums_admin` DISABLE KEYS */;
INSERT INTO `ums_admin` VALUES (1,'test','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg','test@qq.com','测试账号',NULL,'','2018-09-29 13:55:30','2018-09-29 13:55:39',1),(3,'admin','$2a$10$.E1FokumK5GIXWgKlg.Hc.i/0/2.qdAwYFL1zc5QHdyzpXOr38RZO','http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg','admin@163.com','系统管理员','系统管理员','','2018-10-08 13:32:47','2019-04-20 12:45:16',1),(4,'macro','$2a$10$Bx4jZPR7GhEpIQfefDQtVeS58GfT5n6mxs/b4nLLK65eMFa16topa','string','macro@qq.com','macro','macro专用','','2019-10-06 15:53:51','2020-02-03 14:55:55',1),(6,'productAdmin','$2a$10$6/.J.p.6Bhn7ic4GfoB5D.pGd7xSiD1a9M6ht6yO0fxzlKJPjRAGm',NULL,'product@qq.com','商品管理员','只有商品权限','','2020-02-07 16:15:08',NULL,1),(7,'orderAdmin','$2a$10$UqEhA9UZXjHHA3B.L9wNG.6aerrBjC6WHTtbv1FdvYPUI.7lkL6E.',NULL,'order@qq.com','订单管理员','只有订单管理权限','','2020-02-07 16:15:50',NULL,1),(9,'ttc','$2a$10$zxqVvWZ2JB7JE.ySRIBNo.ZhOak.U6skx9a05NkUc8oXQberKLk/a',NULL,'2456266311@qq.com','小汤汤',NULL,'','2022-07-13 14:55:30',NULL,1),(10,'yym','$2a$10$fEvHu2DMPG8y3WjidvbiY.MVOkB2fTSXM8UjDySlfy1/sY4Xwjs/6','','2@qq.com','小y','','','2022-07-13 23:00:54',NULL,1),(11,'stormfa','$2a$10$6pAb4s7AUN5325EXr8pUrOgpS08CVCsSb85THimSe0AC5YALMmEeS',NULL,NULL,NULL,NULL,'','2022-07-20 23:58:33',NULL,1),(12,'stormfa001','$2a$10$n/MlQ/6StqOH32mEoTqRBuYL9.aBvNGVLOOXFVklSari/1LkcO6Sa',NULL,NULL,NULL,NULL,'','2022-07-21 00:00:31',NULL,1),(13,'stormfa002','$2a$10$ltZ3HnElq2qpt8d/TxHcV.Rj320welnXjvndIhaySwyMWDo2920i6',NULL,NULL,NULL,NULL,'','2022-07-21 21:51:45',NULL,1),(14,'stormfa003','$2a$10$cp3KisNUbESPhM2F5it2jeNabg9iAiBbyE6ROWnZaT44srUGoEZdq',NULL,NULL,NULL,NULL,'','2022-07-21 21:54:21',NULL,1),(15,'htc','$2a$10$6NAkP4WvQ/j/J69Y7FOrB.XGOL8LVWTJaO9JBFkt/GCFNgClw.Cjy','','2@qq.com','小y','','','2022-07-21 22:33:12',NULL,1),(16,'hhh','$2a$10$BPpvwQO93QSyS/UgCUXT/eVoQCCJ2Hu/jQu9mM/XK97v9ALo4.jRO',NULL,NULL,NULL,NULL,NULL,'2022-08-04 23:32:47',NULL,1),(20,'tang','$2a$10$oy7OSnttLT1jpJ9BzPkRtubGZavPMldEuTqrVQ/3nG8aJEVZBmBzG',NULL,NULL,NULL,NULL,NULL,'2022-08-05 09:15:34',NULL,1),(21,'tong','$2a$10$Un9ldf5s4vUI7orH7T7Pfuk5mP547VZzfZD1A25EFERNiZUvPXkfS',NULL,NULL,NULL,NULL,NULL,'2022-08-05 09:27:24',NULL,1);
/*!40000 ALTER TABLE `ums_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_admin_info`
--

DROP TABLE IF EXISTS `ums_admin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_admin_info` (
  `id` bigint NOT NULL COMMENT '管理员id（与ums_admin表一致）',
  `invite_code` varchar(10) NOT NULL COMMENT '邀请码',
  `reward_point` int NOT NULL COMMENT '管理员积分',
  `intro` varchar(255) DEFAULT NULL COMMENT '自我介绍',
  `username` varchar(20) NOT NULL COMMENT '管理员账号名称',
  `skilled_domain` varchar(50) DEFAULT NULL COMMENT '擅长领域，逗号隔开',
  `head_icon` varchar(100) DEFAULT NULL COMMENT '管理员头像',
  `nickname` varchar(20) NOT NULL COMMENT '管理员昵称',
  PRIMARY KEY (`id`),
  KEY `idx_invite_code` (`invite_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理员信息表，放积分，邀请码，各种其它信息等';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_admin_info`
--

LOCK TABLES `ums_admin_info` WRITE;
/*!40000 ALTER TABLE `ums_admin_info` DISABLE KEYS */;
INSERT INTO `ums_admin_info` VALUES (10,'wJNqCM',999499,'哧哧哧','yym','直播,卖衣服','http://159.75.125.80:9000/mall/20220804/c4eec9fd60114eb7970796f950f001bf.jpg',''),(11,'FcGme7',998999,'我是个高手，卖货','stormfa','直播,卖衣服','http://159.75.125.80:9000/mall/20220806/a4ef6aeb79334000b27c820d1d582c62.png','stormfa'),(16,'nn5NCH',500,NULL,'hhh',NULL,NULL,'hhh'),(20,'zKnAku',500,NULL,'tang',NULL,NULL,'tang'),(21,'Hv2gNz',500,NULL,'tong',NULL,NULL,'tong');
/*!40000 ALTER TABLE `ums_admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_admin_login_log`
--

DROP TABLE IF EXISTS `ums_admin_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_admin_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COMMENT='后台用户登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_admin_login_log`
--

LOCK TABLES `ums_admin_login_log` WRITE;
/*!40000 ALTER TABLE `ums_admin_login_log` DISABLE KEYS */;
INSERT INTO `ums_admin_login_log` VALUES (1,3,'2018-12-23 14:27:00','0:0:0:0:0:0:0:1',NULL,NULL),(2,3,'2019-04-07 16:04:39','0:0:0:0:0:0:0:1',NULL,NULL),(3,3,'2019-04-08 21:47:52','0:0:0:0:0:0:0:1',NULL,NULL),(4,3,'2019-04-08 21:48:18','0:0:0:0:0:0:0:1',NULL,NULL),(5,3,'2019-04-18 22:18:40','0:0:0:0:0:0:0:1',NULL,NULL),(6,3,'2019-04-20 12:45:16','0:0:0:0:0:0:0:1',NULL,NULL),(7,3,'2019-05-19 14:52:12','0:0:0:0:0:0:0:1',NULL,NULL),(8,3,'2019-05-25 15:00:17','0:0:0:0:0:0:0:1',NULL,NULL),(9,3,'2019-06-19 20:11:42','0:0:0:0:0:0:0:1',NULL,NULL),(10,3,'2019-06-30 10:33:48','0:0:0:0:0:0:0:1',NULL,NULL),(11,3,'2019-06-30 10:34:31','0:0:0:0:0:0:0:1',NULL,NULL),(12,3,'2019-06-30 10:35:34','0:0:0:0:0:0:0:1',NULL,NULL),(13,3,'2019-07-27 17:11:01','0:0:0:0:0:0:0:1',NULL,NULL),(14,3,'2019-07-27 17:13:18','0:0:0:0:0:0:0:1',NULL,NULL),(15,3,'2019-07-27 17:15:35','0:0:0:0:0:0:0:1',NULL,NULL),(16,3,'2019-07-27 17:17:11','0:0:0:0:0:0:0:1',NULL,NULL),(17,3,'2019-07-27 17:18:34','0:0:0:0:0:0:0:1',NULL,NULL),(18,3,'2019-07-27 21:21:52','0:0:0:0:0:0:0:1',NULL,NULL),(19,3,'2019-07-27 21:34:29','0:0:0:0:0:0:0:1',NULL,NULL),(20,3,'2019-07-27 21:35:17','0:0:0:0:0:0:0:1',NULL,NULL),(21,3,'2019-07-27 21:35:48','0:0:0:0:0:0:0:1',NULL,NULL),(22,3,'2019-07-27 21:40:33','0:0:0:0:0:0:0:1',NULL,NULL),(23,3,'2019-08-18 16:00:38','0:0:0:0:0:0:0:1',NULL,NULL),(24,3,'2019-08-18 16:01:06','0:0:0:0:0:0:0:1',NULL,NULL),(25,3,'2019-08-18 16:47:01','0:0:0:0:0:0:0:1',NULL,NULL),(26,3,'2019-10-06 15:54:23','0:0:0:0:0:0:0:1',NULL,NULL),(27,3,'2019-10-06 16:03:28','0:0:0:0:0:0:0:1',NULL,NULL),(28,3,'2019-10-06 16:04:51','0:0:0:0:0:0:0:1',NULL,NULL),(29,3,'2019-10-06 16:06:44','0:0:0:0:0:0:0:1',NULL,NULL),(30,3,'2019-10-06 16:14:51','0:0:0:0:0:0:0:1',NULL,NULL),(31,1,'2019-10-06 16:15:09','0:0:0:0:0:0:0:1',NULL,NULL),(32,1,'2019-10-06 16:16:14','0:0:0:0:0:0:0:1',NULL,NULL),(33,3,'2019-10-06 16:16:35','0:0:0:0:0:0:0:1',NULL,NULL),(34,3,'2019-10-06 16:16:42','0:0:0:0:0:0:0:1',NULL,NULL),(35,3,'2019-10-07 15:20:48','0:0:0:0:0:0:0:1',NULL,NULL),(36,3,'2019-10-07 15:40:07','0:0:0:0:0:0:0:1',NULL,NULL),(37,3,'2019-10-07 16:34:15','0:0:0:0:0:0:0:1',NULL,NULL),(38,3,'2019-10-09 21:19:08','0:0:0:0:0:0:0:1',NULL,NULL),(39,4,'2019-10-09 21:30:35','0:0:0:0:0:0:0:1',NULL,NULL),(40,4,'2019-10-09 21:31:30','0:0:0:0:0:0:0:1',NULL,NULL),(41,4,'2019-10-09 21:32:39','0:0:0:0:0:0:0:1',NULL,NULL),(42,4,'2019-10-09 21:33:27','0:0:0:0:0:0:0:1',NULL,NULL),(43,4,'2019-10-09 21:33:50','0:0:0:0:0:0:0:1',NULL,NULL),(44,3,'2019-10-20 16:02:53','0:0:0:0:0:0:0:1',NULL,NULL),(45,3,'2019-10-23 21:20:55','0:0:0:0:0:0:0:1',NULL,NULL),(46,3,'2019-10-27 21:41:45','0:0:0:0:0:0:0:1',NULL,NULL),(47,3,'2019-11-09 16:44:57','0:0:0:0:0:0:0:1',NULL,NULL),(48,3,'2019-11-09 16:46:56','0:0:0:0:0:0:0:1',NULL,NULL),(49,3,'2019-11-09 16:49:55','0:0:0:0:0:0:0:1',NULL,NULL),(50,3,'2019-11-23 14:17:16','0:0:0:0:0:0:0:1',NULL,NULL),(51,6,'2019-11-23 14:52:30','0:0:0:0:0:0:0:1',NULL,NULL),(52,3,'2019-11-23 15:07:24','0:0:0:0:0:0:0:1',NULL,NULL),(53,3,'2019-11-30 21:25:30','192.168.3.185',NULL,NULL),(54,3,'2019-11-30 21:27:54','192.168.3.185',NULL,NULL),(55,3,'2019-12-28 15:23:01','0:0:0:0:0:0:0:1',NULL,NULL),(56,3,'2020-01-01 15:21:46','0:0:0:0:0:0:0:1',NULL,NULL),(57,3,'2020-01-04 16:00:54','192.168.3.185',NULL,NULL),(58,3,'2020-02-01 15:05:19','0:0:0:0:0:0:0:1',NULL,NULL),(59,3,'2020-02-01 15:36:05','0:0:0:0:0:0:0:1',NULL,NULL),(60,3,'2020-02-01 15:36:36','0:0:0:0:0:0:0:1',NULL,NULL),(61,3,'2020-02-01 15:37:30','0:0:0:0:0:0:0:1',NULL,NULL),(62,3,'2020-02-01 15:37:46','0:0:0:0:0:0:0:1',NULL,NULL),(63,3,'2020-02-01 15:38:20','0:0:0:0:0:0:0:1',NULL,NULL),(64,3,'2020-02-01 15:38:33','0:0:0:0:0:0:0:1',NULL,NULL),(65,3,'2020-02-01 15:39:06','0:0:0:0:0:0:0:1',NULL,NULL),(66,3,'2020-02-01 15:41:31','0:0:0:0:0:0:0:1',NULL,NULL),(67,3,'2020-02-01 15:43:17','0:0:0:0:0:0:0:1',NULL,NULL),(68,3,'2020-02-01 15:44:34','0:0:0:0:0:0:0:1',NULL,NULL),(69,3,'2020-02-01 15:45:10','0:0:0:0:0:0:0:1',NULL,NULL),(70,3,'2020-02-01 15:46:04','0:0:0:0:0:0:0:1',NULL,NULL),(71,3,'2020-02-01 15:48:33','0:0:0:0:0:0:0:1',NULL,NULL),(72,3,'2020-02-01 16:00:07','0:0:0:0:0:0:0:1',NULL,NULL),(73,3,'2020-02-01 16:07:25','0:0:0:0:0:0:0:1',NULL,NULL),(74,3,'2020-02-01 16:08:22','0:0:0:0:0:0:0:1',NULL,NULL),(75,3,'2020-02-02 15:28:13','0:0:0:0:0:0:0:1',NULL,NULL),(76,3,'2020-02-02 15:44:37','0:0:0:0:0:0:0:1',NULL,NULL),(77,3,'2020-02-02 15:45:25','0:0:0:0:0:0:0:1',NULL,NULL),(78,3,'2020-02-02 15:52:32','0:0:0:0:0:0:0:1',NULL,NULL),(79,3,'2020-02-02 15:53:44','0:0:0:0:0:0:0:1',NULL,NULL),(80,3,'2020-02-02 15:54:36','0:0:0:0:0:0:0:1',NULL,NULL),(81,3,'2020-02-02 16:01:00','0:0:0:0:0:0:0:1',NULL,NULL),(82,3,'2020-02-02 16:05:19','0:0:0:0:0:0:0:1',NULL,NULL),(83,3,'2020-02-02 16:06:31','0:0:0:0:0:0:0:1',NULL,NULL),(84,3,'2020-02-02 16:17:26','0:0:0:0:0:0:0:1',NULL,NULL),(85,3,'2020-02-02 16:18:45','0:0:0:0:0:0:0:1',NULL,NULL),(86,3,'2020-02-02 16:19:05','0:0:0:0:0:0:0:1',NULL,NULL),(87,3,'2020-02-02 16:19:23','0:0:0:0:0:0:0:1',NULL,NULL),(88,3,'2020-02-02 16:22:27','0:0:0:0:0:0:0:1',NULL,NULL),(89,3,'2020-02-02 16:23:30','0:0:0:0:0:0:0:1',NULL,NULL),(90,3,'2020-02-02 16:23:48','0:0:0:0:0:0:0:1',NULL,NULL),(91,3,'2020-02-02 16:24:38','0:0:0:0:0:0:0:1',NULL,NULL),(92,3,'2020-02-02 16:25:22','0:0:0:0:0:0:0:1',NULL,NULL),(93,3,'2020-02-02 16:26:19','0:0:0:0:0:0:0:1',NULL,NULL),(94,3,'2020-02-02 16:26:31','0:0:0:0:0:0:0:1',NULL,NULL),(95,3,'2020-02-02 16:27:08','0:0:0:0:0:0:0:1',NULL,NULL),(96,3,'2020-02-02 16:31:02','0:0:0:0:0:0:0:1',NULL,NULL),(97,3,'2020-02-02 16:31:08','0:0:0:0:0:0:0:1',NULL,NULL),(98,3,'2020-02-02 16:31:25','0:0:0:0:0:0:0:1',NULL,NULL),(99,3,'2020-02-02 16:31:50','0:0:0:0:0:0:0:1',NULL,NULL),(100,3,'2020-02-02 16:33:22','0:0:0:0:0:0:0:1',NULL,NULL),(101,3,'2020-02-02 16:33:41','0:0:0:0:0:0:0:1',NULL,NULL),(102,3,'2020-02-02 16:34:58','0:0:0:0:0:0:0:1',NULL,NULL),(103,3,'2020-02-02 16:38:42','0:0:0:0:0:0:0:1',NULL,NULL),(104,3,'2020-02-02 16:39:41','0:0:0:0:0:0:0:1',NULL,NULL),(105,3,'2020-02-02 16:42:22','0:0:0:0:0:0:0:1',NULL,NULL),(106,3,'2020-02-02 16:46:21','0:0:0:0:0:0:0:1',NULL,NULL),(107,3,'2020-02-02 16:50:23','0:0:0:0:0:0:0:1',NULL,NULL),(108,3,'2020-02-02 16:51:11','0:0:0:0:0:0:0:1',NULL,NULL),(109,3,'2020-02-02 16:51:22','0:0:0:0:0:0:0:1',NULL,NULL),(110,3,'2020-02-02 16:52:00','0:0:0:0:0:0:0:1',NULL,NULL),(111,3,'2020-02-02 17:01:05','0:0:0:0:0:0:0:1',NULL,NULL),(112,3,'2020-02-03 10:43:22','0:0:0:0:0:0:0:1',NULL,NULL),(113,3,'2020-02-03 10:45:29','0:0:0:0:0:0:0:1',NULL,NULL),(114,3,'2020-02-03 10:46:33','0:0:0:0:0:0:0:1',NULL,NULL),(115,3,'2020-02-03 10:54:33','0:0:0:0:0:0:0:1',NULL,NULL),(116,3,'2020-02-03 14:24:47','0:0:0:0:0:0:0:1',NULL,NULL),(117,3,'2020-02-03 14:25:38','0:0:0:0:0:0:0:1',NULL,NULL),(118,5,'2020-02-03 15:22:28','0:0:0:0:0:0:0:1',NULL,NULL),(119,5,'2020-02-03 15:23:00','0:0:0:0:0:0:0:1',NULL,NULL),(120,5,'2020-02-03 15:24:29','0:0:0:0:0:0:0:1',NULL,NULL),(121,3,'2020-02-03 15:24:50','0:0:0:0:0:0:0:1',NULL,NULL),(122,5,'2020-02-03 15:27:18','0:0:0:0:0:0:0:1',NULL,NULL),(123,3,'2020-02-03 15:27:33','0:0:0:0:0:0:0:1',NULL,NULL),(124,3,'2020-02-03 15:29:06','0:0:0:0:0:0:0:1',NULL,NULL),(125,5,'2020-02-03 15:33:25','0:0:0:0:0:0:0:1',NULL,NULL),(126,3,'2020-02-03 15:33:51','0:0:0:0:0:0:0:1',NULL,NULL),(127,1,'2020-02-03 15:34:35','0:0:0:0:0:0:0:1',NULL,NULL),(128,3,'2020-02-03 15:34:47','0:0:0:0:0:0:0:1',NULL,NULL),(129,3,'2020-02-04 14:14:46','0:0:0:0:0:0:0:1',NULL,NULL),(130,3,'2020-02-05 10:33:35','0:0:0:0:0:0:0:1',NULL,NULL),(131,3,'2020-02-05 10:36:21','0:0:0:0:0:0:0:1',NULL,NULL),(132,3,'2020-02-05 16:34:37','0:0:0:0:0:0:0:1',NULL,NULL),(133,4,'2020-02-05 16:58:37','0:0:0:0:0:0:0:1',NULL,NULL),(134,3,'2020-02-05 16:59:03','0:0:0:0:0:0:0:1',NULL,NULL),(135,3,'2020-02-06 10:25:02','0:0:0:0:0:0:0:1',NULL,NULL),(136,3,'2020-02-07 14:34:34','0:0:0:0:0:0:0:1',NULL,NULL),(137,3,'2020-02-07 14:36:20','0:0:0:0:0:0:0:1',NULL,NULL),(138,1,'2020-02-07 14:43:34','0:0:0:0:0:0:0:1',NULL,NULL),(139,3,'2020-02-07 15:18:06','0:0:0:0:0:0:0:1',NULL,NULL),(140,3,'2020-02-07 15:20:07','0:0:0:0:0:0:0:1',NULL,NULL),(141,3,'2020-02-07 15:22:20','0:0:0:0:0:0:0:1',NULL,NULL),(142,3,'2020-02-07 15:22:28','0:0:0:0:0:0:0:1',NULL,NULL),(143,3,'2020-02-07 15:55:11','0:0:0:0:0:0:0:1',NULL,NULL),(144,3,'2020-02-07 15:56:04','0:0:0:0:0:0:0:1',NULL,NULL),(145,3,'2020-02-07 15:58:49','0:0:0:0:0:0:0:1',NULL,NULL),(146,6,'2020-02-07 16:16:21','0:0:0:0:0:0:0:1',NULL,NULL),(147,7,'2020-02-07 16:16:37','0:0:0:0:0:0:0:1',NULL,NULL),(148,3,'2020-02-07 16:18:39','0:0:0:0:0:0:0:1',NULL,NULL),(149,7,'2020-02-07 16:20:06','0:0:0:0:0:0:0:1',NULL,NULL),(150,3,'2020-02-07 16:20:44','0:0:0:0:0:0:0:1',NULL,NULL),(151,3,'2020-02-07 16:32:31','0:0:0:0:0:0:0:1',NULL,NULL),(152,3,'2020-02-07 19:32:34','0:0:0:0:0:0:0:1',NULL,NULL),(153,3,'2020-02-07 19:32:48','0:0:0:0:0:0:0:1',NULL,NULL),(154,3,'2020-02-07 19:33:01','0:0:0:0:0:0:0:1',NULL,NULL),(155,3,'2020-02-07 19:33:06','0:0:0:0:0:0:0:1',NULL,NULL),(156,3,'2020-02-07 19:33:21','0:0:0:0:0:0:0:1',NULL,NULL),(157,3,'2020-02-07 19:35:33','0:0:0:0:0:0:0:1',NULL,NULL),(158,3,'2020-02-07 19:37:10','0:0:0:0:0:0:0:1',NULL,NULL),(159,3,'2020-02-07 19:37:14','0:0:0:0:0:0:0:1',NULL,NULL),(160,3,'2020-02-07 19:37:25','0:0:0:0:0:0:0:1',NULL,NULL),(161,3,'2020-02-07 19:45:41','0:0:0:0:0:0:0:1',NULL,NULL),(162,3,'2020-02-07 19:47:45','0:0:0:0:0:0:0:1',NULL,NULL),(163,3,'2020-02-07 20:02:25','0:0:0:0:0:0:0:1',NULL,NULL),(164,6,'2020-02-07 20:10:55','0:0:0:0:0:0:0:1',NULL,NULL),(165,6,'2020-02-07 20:11:02','0:0:0:0:0:0:0:1',NULL,NULL),(166,6,'2020-02-07 20:13:44','0:0:0:0:0:0:0:1',NULL,NULL),(167,6,'2020-02-07 20:17:14','0:0:0:0:0:0:0:1',NULL,NULL),(168,3,'2020-02-07 20:17:44','0:0:0:0:0:0:0:1',NULL,NULL),(169,6,'2020-02-07 20:18:13','0:0:0:0:0:0:0:1',NULL,NULL),(170,3,'2020-02-10 10:28:14','0:0:0:0:0:0:0:1',NULL,NULL),(171,3,'2020-02-10 10:45:15','0:0:0:0:0:0:0:1',NULL,NULL),(172,3,'2020-02-10 10:57:46','0:0:0:0:0:0:0:1',NULL,NULL),(173,3,'2020-02-10 10:59:06','0:0:0:0:0:0:0:1',NULL,NULL),(174,3,'2020-02-10 11:04:19','0:0:0:0:0:0:0:1',NULL,NULL),(175,3,'2020-02-10 11:05:55','0:0:0:0:0:0:0:1',NULL,NULL),(176,3,'2020-02-10 11:06:45','0:0:0:0:0:0:0:1',NULL,NULL),(177,3,'2020-02-10 11:07:41','0:0:0:0:0:0:0:1',NULL,NULL),(178,3,'2020-02-10 11:08:13','0:0:0:0:0:0:0:1',NULL,NULL),(179,3,'2020-02-10 11:10:02','0:0:0:0:0:0:0:1',NULL,NULL),(180,6,'2020-02-10 14:25:17','0:0:0:0:0:0:0:1',NULL,NULL),(181,6,'2020-02-10 14:29:14','0:0:0:0:0:0:0:1',NULL,NULL),(182,3,'2020-02-10 16:09:16','0:0:0:0:0:0:0:1',NULL,NULL),(183,3,'2020-02-20 14:39:19','0:0:0:0:0:0:0:1',NULL,NULL),(184,8,'2020-02-20 17:14:58','0:0:0:0:0:0:0:1',NULL,NULL),(185,8,'2020-02-20 17:17:04','0:0:0:0:0:0:0:1',NULL,NULL),(186,8,'2020-02-20 17:17:42','0:0:0:0:0:0:0:1',NULL,NULL),(187,8,'2020-02-21 10:26:56','0:0:0:0:0:0:0:1',NULL,NULL),(188,8,'2020-02-21 10:28:54','0:0:0:0:0:0:0:1',NULL,NULL),(189,8,'2020-02-21 10:32:25','0:0:0:0:0:0:0:1',NULL,NULL),(190,8,'2020-02-21 10:33:41','0:0:0:0:0:0:0:1',NULL,NULL),(191,8,'2020-02-21 10:35:58','0:0:0:0:0:0:0:1',NULL,NULL),(192,8,'2020-02-21 10:36:49','0:0:0:0:0:0:0:1',NULL,NULL),(193,3,'2020-02-21 11:10:11','0:0:0:0:0:0:0:1',NULL,NULL),(194,3,'2020-02-25 16:11:13','0:0:0:0:0:0:0:1',NULL,NULL),(195,3,'2020-02-25 16:46:29','0:0:0:0:0:0:0:1',NULL,NULL),(196,3,'2022-07-13 14:35:40','192.168.1.107',NULL,NULL),(197,3,'2022-07-13 14:42:48','192.168.1.107',NULL,NULL),(198,3,'2022-07-13 14:47:30','192.168.1.107',NULL,NULL),(199,3,'2022-07-13 14:50:40','192.168.1.107',NULL,NULL),(200,3,'2022-07-13 14:50:50','192.168.1.107',NULL,NULL),(201,3,'2022-07-13 14:51:41','192.168.1.107',NULL,NULL),(202,9,'2022-07-13 14:57:04','192.168.1.107',NULL,NULL),(203,9,'2022-07-13 14:57:36','192.168.1.107',NULL,NULL),(204,9,'2022-07-13 14:57:43','192.168.1.107',NULL,NULL),(205,9,'2022-07-13 14:58:24','192.168.1.107',NULL,NULL),(206,9,'2022-07-13 16:09:04','10.244.0.28',NULL,NULL),(207,9,'2022-07-13 16:09:31','10.244.0.28',NULL,NULL),(208,9,'2022-07-13 16:09:32','10.244.0.28',NULL,NULL),(209,9,'2022-07-13 16:09:32','10.244.0.28',NULL,NULL),(210,9,'2022-07-13 16:09:32','10.244.0.28',NULL,NULL),(211,9,'2022-07-13 16:09:58','10.244.0.28',NULL,NULL),(212,9,'2022-07-13 16:11:29','10.244.0.28',NULL,NULL),(213,9,'2022-07-13 16:14:26','10.244.0.28',NULL,NULL),(214,9,'2022-07-13 22:32:14','10.244.0.28',NULL,NULL),(215,9,'2022-07-13 22:35:05','10.244.0.28',NULL,NULL),(216,9,'2022-07-13 22:56:37','10.244.0.28',NULL,NULL),(217,9,'2022-07-13 22:57:46','10.244.0.28',NULL,NULL),(218,10,'2022-07-13 23:01:17','10.244.0.28',NULL,NULL),(219,3,'2022-07-13 23:04:17','10.244.0.28',NULL,NULL),(220,10,'2022-07-13 23:07:52','10.244.0.28',NULL,NULL),(221,3,'2022-07-14 21:16:03','10.244.0.28',NULL,NULL),(222,3,'2022-07-14 22:18:24','10.244.0.28',NULL,NULL),(223,10,'2022-07-18 11:53:31','10.244.0.28',NULL,NULL),(224,10,'2022-07-18 13:43:14','10.244.0.28',NULL,NULL),(225,10,'2022-07-18 14:50:26','10.244.0.28',NULL,NULL),(226,10,'2022-07-18 16:07:39','10.244.0.28',NULL,NULL),(227,10,'2022-07-18 17:34:39','10.244.0.28',NULL,NULL),(228,10,'2022-07-18 19:23:27','10.244.0.28',NULL,NULL),(229,10,'2022-07-19 11:04:50','10.244.0.28',NULL,NULL),(230,10,'2022-07-19 11:08:50','10.244.0.28',NULL,NULL),(231,11,'2022-07-21 00:02:59','10.244.0.86',NULL,NULL),(232,11,'2022-07-21 00:03:02','10.244.0.86',NULL,NULL),(233,11,'2022-07-21 00:03:05','10.244.0.86',NULL,NULL),(234,11,'2022-07-21 00:03:07','10.244.0.86',NULL,NULL),(235,11,'2022-07-21 00:05:26','10.244.0.86',NULL,NULL),(236,11,'2022-07-21 10:01:55','10.244.0.4',NULL,NULL),(237,11,'2022-07-21 10:01:55','10.244.0.4',NULL,NULL),(238,14,'2022-07-21 21:54:42','10.244.0.4',NULL,NULL),(239,14,'2022-07-21 21:56:15','10.244.0.4',NULL,NULL),(240,14,'2022-07-21 21:58:23','10.244.0.4',NULL,NULL),(241,14,'2022-07-21 22:08:31','10.244.0.4',NULL,NULL),(242,14,'2022-07-21 22:14:02','10.244.0.4',NULL,NULL),(243,14,'2022-07-21 22:14:32','10.244.0.4',NULL,NULL),(244,14,'2022-07-21 22:15:17','10.244.0.4',NULL,NULL),(245,14,'2022-07-21 22:22:51','10.244.0.4',NULL,NULL),(246,15,'2022-07-21 22:33:27','10.244.0.4',NULL,NULL),(247,3,'2022-07-26 16:55:13','192.168.137.1',NULL,NULL),(248,9,'2022-07-26 22:25:15','192.168.137.1',NULL,NULL),(249,10,'2022-07-26 22:26:24','192.168.137.1',NULL,NULL),(250,10,'2022-07-26 22:26:27','192.168.137.1',NULL,NULL),(251,10,'2022-07-26 22:26:29','192.168.137.1',NULL,NULL),(252,10,'2022-07-26 22:26:31','192.168.137.1',NULL,NULL),(253,10,'2022-07-28 12:04:56','192.168.137.1',NULL,NULL),(254,10,'2022-07-28 16:26:09','192.168.137.1',NULL,NULL),(255,10,'2022-07-29 16:29:33','192.168.137.1',NULL,NULL),(256,11,'2022-07-31 12:17:23','192.168.137.1',NULL,NULL),(257,11,'2022-07-31 12:39:12','192.168.137.1',NULL,NULL),(258,11,'2022-07-31 12:39:28','192.168.137.1',NULL,NULL),(259,11,'2022-07-31 12:40:23','192.168.137.1',NULL,NULL),(260,11,'2022-07-31 13:43:00','192.168.137.1',NULL,NULL),(261,10,'2022-08-01 11:05:10','192.168.137.1',NULL,NULL),(262,11,'2022-08-02 21:53:47','192.168.137.1',NULL,NULL),(263,11,'2022-08-02 21:54:10','192.168.137.1',NULL,NULL),(264,3,'2022-08-02 21:57:49','192.168.137.1',NULL,NULL),(265,10,'2022-08-02 22:12:35','192.168.137.1',NULL,NULL),(266,3,'2022-08-03 21:30:33','192.168.137.1',NULL,NULL),(267,10,'2022-08-03 22:32:05','192.168.137.1',NULL,NULL),(268,3,'2022-08-04 14:58:29','192.168.137.1',NULL,NULL),(269,3,'2022-08-04 14:59:19','192.168.137.1',NULL,NULL),(270,3,'2022-08-04 15:06:07','192.168.137.1',NULL,NULL),(271,11,'2022-08-04 22:31:02','192.168.137.1',NULL,NULL),(272,20,'2022-08-05 09:19:23','192.168.137.1',NULL,NULL),(273,10,'2022-08-05 16:15:59','192.168.137.1',NULL,NULL),(274,3,'2022-08-05 21:19:57','192.168.137.1',NULL,NULL),(275,11,'2022-08-05 22:50:39','192.168.137.1',NULL,NULL),(276,10,'2022-08-05 22:54:56','192.168.137.1',NULL,NULL),(277,11,'2022-08-05 23:08:45','192.168.137.1',NULL,NULL),(278,11,'2022-08-05 23:16:48','192.168.137.1',NULL,NULL),(279,3,'2022-08-05 23:21:05','192.168.137.1',NULL,NULL),(280,11,'2022-08-05 23:24:26','192.168.137.1',NULL,NULL),(281,11,'2022-08-05 23:24:49','192.168.137.1',NULL,NULL),(282,10,'2022-08-05 23:55:26','192.168.137.1',NULL,NULL),(283,11,'2022-08-06 00:15:26','192.168.137.1',NULL,NULL),(284,11,'2022-08-06 00:16:17','192.168.137.1',NULL,NULL),(285,11,'2022-08-06 00:21:40','192.168.137.1',NULL,NULL),(286,11,'2022-08-06 13:47:38','192.168.137.1',NULL,NULL),(287,11,'2022-08-06 15:26:01','192.168.137.1',NULL,NULL),(288,11,'2022-08-06 15:35:13','192.168.137.1',NULL,NULL),(289,11,'2022-08-06 15:46:39','192.168.137.1',NULL,NULL),(290,11,'2022-08-06 22:46:00','192.168.137.1',NULL,NULL),(291,11,'2022-08-06 22:51:14','192.168.137.1',NULL,NULL),(292,11,'2022-08-06 22:53:18','192.168.137.1',NULL,NULL),(293,11,'2022-08-06 23:18:30','192.168.137.1',NULL,NULL),(294,3,'2022-08-07 13:09:16','192.168.137.1',NULL,NULL),(295,3,'2022-08-07 13:10:57','192.168.137.1',NULL,NULL),(296,3,'2022-08-07 13:37:07','192.168.137.1',NULL,NULL),(297,3,'2022-08-07 14:31:59','192.168.137.1',NULL,NULL),(298,3,'2022-08-07 14:32:37','192.168.137.1',NULL,NULL),(299,3,'2022-08-07 14:32:50','192.168.137.1',NULL,NULL),(300,3,'2022-08-07 14:32:56','192.168.137.1',NULL,NULL),(301,3,'2022-08-07 14:37:33','192.168.137.1',NULL,NULL);
/*!40000 ALTER TABLE `ums_admin_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_admin_permission_relation`
--

DROP TABLE IF EXISTS `ums_admin_permission_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_admin_permission_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint DEFAULT NULL,
  `permission_id` bigint DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户和权限关系表(除角色中定义的权限以外的加减权限)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_admin_permission_relation`
--

LOCK TABLES `ums_admin_permission_relation` WRITE;
/*!40000 ALTER TABLE `ums_admin_permission_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_admin_permission_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_admin_role_relation`
--

DROP TABLE IF EXISTS `ums_admin_role_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_admin_role_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='后台用户和角色关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_admin_role_relation`
--

LOCK TABLES `ums_admin_role_relation` WRITE;
/*!40000 ALTER TABLE `ums_admin_role_relation` DISABLE KEYS */;
INSERT INTO `ums_admin_role_relation` VALUES (26,3,5),(27,6,1),(28,7,2),(29,1,5),(30,4,5),(32,10,8),(33,11,8),(34,12,8),(35,13,8),(36,9,8),(37,16,8),(41,20,8),(42,21,8);
/*!40000 ALTER TABLE `ums_admin_role_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_cooperation_request`
--

DROP TABLE IF EXISTS `ums_cooperation_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_cooperation_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '达人姓名',
  `phone` varchar(20) NOT NULL COMMENT '达人联系方式',
  `status` tinyint DEFAULT '0' COMMENT '申请状态：0->未处理 1->已查阅',
  `admin_id` bigint NOT NULL COMMENT '团长id',
  `member_id` bigint NOT NULL COMMENT '会员id',
  `note` varchar(250) NOT NULL COMMENT '留言',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合作申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_cooperation_request`
--

LOCK TABLES `ums_cooperation_request` WRITE;
/*!40000 ALTER TABLE `ums_cooperation_request` DISABLE KEYS */;
INSERT INTO `ums_cooperation_request` VALUES (1,'小明明','15171410261',1,10,10,'我希望可以和你合作一款化妆品，淘宝链接是这个：http://www.baidu.com。佣金是17%，我的微信是：xxx','2022-08-05 17:28:46');
/*!40000 ALTER TABLE `ums_cooperation_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_growth_change_history`
--

DROP TABLE IF EXISTS `ums_growth_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_growth_change_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '操作备注',
  `source_type` int DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='成长值变化历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_growth_change_history`
--

LOCK TABLES `ums_growth_change_history` WRITE;
/*!40000 ALTER TABLE `ums_growth_change_history` DISABLE KEYS */;
INSERT INTO `ums_growth_change_history` VALUES (1,1,'2018-08-29 17:16:35',0,1000,'test','测试使用',1);
/*!40000 ALTER TABLE `ums_growth_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_integration_change_history`
--

DROP TABLE IF EXISTS `ums_integration_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_integration_change_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '操作备注',
  `source_type` int DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分变化历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_integration_change_history`
--

LOCK TABLES `ums_integration_change_history` WRITE;
/*!40000 ALTER TABLE `ums_integration_change_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_integration_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_integration_consume_setting`
--

DROP TABLE IF EXISTS `ums_integration_consume_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_integration_consume_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='积分消费设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_integration_consume_setting`
--

LOCK TABLES `ums_integration_consume_setting` WRITE;
/*!40000 ALTER TABLE `ums_integration_consume_setting` DISABLE KEYS */;
INSERT INTO `ums_integration_consume_setting` VALUES (1,100,50,100,1);
/*!40000 ALTER TABLE `ums_integration_consume_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_invite_record`
--

DROP TABLE IF EXISTS `ums_invite_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_invite_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL COMMENT '邀请人id',
  `invite_code` varchar(20) NOT NULL COMMENT '邀请码',
  `user_id_invited` bigint NOT NULL COMMENT '被邀请人id',
  `reward_point` int DEFAULT NULL COMMENT '赠送会员积分',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `username_invited` varchar(20) NOT NULL COMMENT '被邀请人账号',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='团队邀请记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_invite_record`
--

LOCK TABLES `ums_invite_record` WRITE;
/*!40000 ALTER TABLE `ums_invite_record` DISABLE KEYS */;
INSERT INTO `ums_invite_record` VALUES (1,10,'wJNqCM',16,50,'2022-08-04 23:32:48','hhh'),(5,10,'wJNqCM',20,50,'2022-08-05 09:15:36','tang'),(6,10,'wJNqCM',21,50,'2022-08-05 09:27:28','tong');
/*!40000 ALTER TABLE `ums_invite_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member`
--

DROP TABLE IF EXISTS `ums_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号码',
  `status` int DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `gender` int DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city` varchar(64) DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `source_type` int DEFAULT NULL COMMENT '用户来源',
  `integration` int DEFAULT NULL COMMENT '积分',
  `growth` int DEFAULT NULL COMMENT '成长值',
  `luckey_count` int DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `idx_phone` (`phone`),
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member`
--

LOCK TABLES `ums_member` WRITE;
/*!40000 ALTER TABLE `ums_member` DISABLE KEYS */;
INSERT INTO `ums_member` VALUES (1,4,'test','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','windir','18061581849',1,'2018-08-02 10:35:44','http://159.75.125.80:9000/mall/20220802/364fe0a2a59140edaf82009e90a4b6da.jpg',1,'2009-06-01','上海','学生','test',NULL,5000,NULL,NULL,NULL),(3,4,'windy','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','windy','18061581848',1,'2018-08-03 16:46:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,'zhengsan','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','zhengsan','18061581847',1,'2018-11-12 14:12:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,4,'lisi','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','lisi','18061581841',1,'2018-11-12 14:12:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,4,'wangwu','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','wangwu','18061581842',1,'2018-11-12 14:13:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,4,'lion','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','lion','18061581845',1,'2018-11-12 14:21:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,4,'shari','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','shari','18061581844',1,'2018-11-12 14:22:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,4,'aewen','$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG','aewen','18061581843',1,'2018-11-12 14:22:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,4,'ttc','$2a$10$txaPupWtv.RMFWGRMVBHxe835EbGGVC19SMHTZxgCNDf/0/Vjn3xG',NULL,'15171410261',1,'2022-08-02 10:58:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ums_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_favorite_product`
--

DROP TABLE IF EXISTS `ums_member_favorite_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_favorite_product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint NOT NULL COMMENT '会员id',
  `product_id` bigint NOT NULL COMMENT '商品id',
  `admin_id` bigint NOT NULL COMMENT '团长id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id_admin_id` (`member_id`,`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员收藏的商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_favorite_product`
--

LOCK TABLES `ums_member_favorite_product` WRITE;
/*!40000 ALTER TABLE `ums_member_favorite_product` DISABLE KEYS */;
INSERT INTO `ums_member_favorite_product` VALUES (2,10,45,10,'2022-08-05 18:19:28');
/*!40000 ALTER TABLE `ums_member_favorite_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_level`
--

DROP TABLE IF EXISTS `ums_member_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_level` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth_point` int DEFAULT NULL,
  `default_status` int DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10,2) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_level`
--

LOCK TABLES `ums_member_level` WRITE;
/*!40000 ALTER TABLE `ums_member_level` DISABLE KEYS */;
INSERT INTO `ums_member_level` VALUES (1,'黄金会员',1000,0,199.00,5,1,1,1,1,1,1,NULL),(2,'白金会员',5000,0,99.00,10,1,1,1,1,1,1,NULL),(3,'钻石会员',15000,0,69.00,15,1,1,1,1,1,1,NULL),(4,'普通会员',1,1,199.00,20,1,1,1,1,0,0,NULL);
/*!40000 ALTER TABLE `ums_member_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_login_log`
--

DROP TABLE IF EXISTS `ums_member_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `login_type` int DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员登录记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_login_log`
--

LOCK TABLES `ums_member_login_log` WRITE;
/*!40000 ALTER TABLE `ums_member_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_member_tag_relation`
--

DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_member_tag_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `tag_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和标签关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_member_tag_relation`
--

LOCK TABLES `ums_member_member_tag_relation` WRITE;
/*!40000 ALTER TABLE `ums_member_member_tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_member_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_product_category_relation`
--

DROP TABLE IF EXISTS `ums_member_product_category_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_product_category_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `product_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员与产品分类关系表（用户喜欢的分类）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_product_category_relation`
--

LOCK TABLES `ums_member_product_category_relation` WRITE;
/*!40000 ALTER TABLE `ums_member_product_category_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_product_category_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_receive_address`
--

DROP TABLE IF EXISTS `ums_member_receive_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_receive_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) DEFAULT NULL,
  `default_status` int DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员收货地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_receive_address`
--

LOCK TABLES `ums_member_receive_address` WRITE;
/*!40000 ALTER TABLE `ums_member_receive_address` DISABLE KEYS */;
INSERT INTO `ums_member_receive_address` VALUES (1,1,'大梨','18033441849',0,'518000','广东省','深圳市','南山区','科兴科学园'),(3,1,'大梨','18033441849',0,'518000','广东省','深圳市','福田区','清水河街道'),(4,1,'大梨','18033441849',1,'518000','广东省','深圳市','福田区','东晓街道');
/*!40000 ALTER TABLE `ums_member_receive_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_rule_setting`
--

DROP TABLE IF EXISTS `ums_member_rule_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_rule_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10,2) DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10,2) DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分成长规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_rule_setting`
--

LOCK TABLES `ums_member_rule_setting` WRITE;
/*!40000 ALTER TABLE `ums_member_rule_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_rule_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_statistics_info`
--

DROP TABLE IF EXISTS `ums_member_statistics_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_statistics_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `consume_amount` decimal(10,2) DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int DEFAULT NULL COMMENT '评价数',
  `return_order_count` int DEFAULT NULL COMMENT '退货数量',
  `login_count` int DEFAULT NULL COMMENT '登录次数',
  `attend_count` int DEFAULT NULL COMMENT '关注数量',
  `fans_count` int DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int DEFAULT NULL,
  `collect_subject_count` int DEFAULT NULL,
  `collect_topic_count` int DEFAULT NULL,
  `collect_comment_count` int DEFAULT NULL,
  `invite_friend_count` int DEFAULT NULL,
  `recent_order_time` datetime DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员统计信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_statistics_info`
--

LOCK TABLES `ums_member_statistics_info` WRITE;
/*!40000 ALTER TABLE `ums_member_statistics_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_statistics_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_tag`
--

DROP TABLE IF EXISTS `ums_member_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `finish_order_count` int DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10,2) DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_tag`
--

LOCK TABLES `ums_member_tag` WRITE;
/*!40000 ALTER TABLE `ums_member_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_task`
--

DROP TABLE IF EXISTS `ums_member_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth` int DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int DEFAULT NULL COMMENT '赠送积分',
  `type` int DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_task`
--

LOCK TABLES `ums_member_task` WRITE;
/*!40000 ALTER TABLE `ums_member_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_menu`
--

DROP TABLE IF EXISTS `ums_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父级ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `level` int DEFAULT NULL COMMENT '菜单级数',
  `sort` int DEFAULT NULL COMMENT '菜单排序',
  `name` varchar(100) DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(200) DEFAULT NULL COMMENT '前端图标',
  `hidden` int DEFAULT NULL COMMENT '前端隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_menu`
--

LOCK TABLES `ums_menu` WRITE;
/*!40000 ALTER TABLE `ums_menu` DISABLE KEYS */;
INSERT INTO `ums_menu` VALUES (1,0,'2020-02-02 14:50:36','商品',0,0,'pms','product',0),(2,1,'2020-02-02 14:51:50','商品列表',1,0,'product','product-list',0),(3,1,'2020-02-02 14:52:44','添加商品',1,0,'addProduct','product-add',0),(4,1,'2020-02-02 14:53:51','商品分类',1,0,'productCate','product-cate',0),(5,1,'2020-02-02 14:54:51','商品类型',1,0,'productAttr','product-attr',0),(6,1,'2020-02-02 14:56:29','品牌管理',1,0,'brand','product-brand',0),(7,0,'2020-02-02 16:54:07','订单',0,0,'oms','order',0),(8,7,'2020-02-02 16:55:18','订单列表',1,0,'order','product-list',0),(9,7,'2020-02-02 16:56:46','订单设置',1,0,'orderSetting','order-setting',0),(10,7,'2020-02-02 16:57:39','退货申请处理',1,0,'returnApply','order-return',0),(11,7,'2020-02-02 16:59:40','退货原因设置',1,0,'returnReason','order-return-reason',0),(12,0,'2020-02-04 16:18:00','营销',0,0,'sms','sms',0),(13,12,'2020-02-04 16:19:22','秒杀活动列表',1,0,'flash','sms-flash',0),(14,12,'2020-02-04 16:20:16','优惠券列表',1,0,'coupon','sms-coupon',0),(16,12,'2020-02-07 16:22:38','品牌推荐',1,0,'homeBrand','product-brand',0),(17,12,'2020-02-07 16:23:14','新品推荐',1,0,'homeNew','sms-new',0),(18,12,'2020-02-07 16:26:38','人气推荐',1,0,'homeHot','sms-hot',0),(19,12,'2020-02-07 16:28:16','专题推荐',1,0,'homeSubject','sms-subject',0),(20,12,'2020-02-07 16:28:42','广告列表',1,0,'homeAdvertise','sms-ad',0),(21,0,'2020-02-07 16:29:13','权限',0,0,'ums','ums',0),(22,21,'2020-02-07 16:29:51','用户列表',1,0,'admin','ums-admin',0),(23,21,'2020-02-07 16:30:13','角色列表',1,0,'role','ums-role',0),(24,21,'2020-02-07 16:30:53','菜单列表',1,0,'menu','ums-menu',0),(25,21,'2020-02-07 16:31:13','资源列表',1,0,'resource','ums-resource',0);
/*!40000 ALTER TABLE `ums_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_permission`
--

DROP TABLE IF EXISTS `ums_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(200) DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) DEFAULT NULL COMMENT '图标',
  `type` int DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) DEFAULT NULL COMMENT '前端资源路径',
  `status` int DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台用户权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_permission`
--

LOCK TABLES `ums_permission` WRITE;
/*!40000 ALTER TABLE `ums_permission` DISABLE KEYS */;
INSERT INTO `ums_permission` VALUES (1,0,'商品',NULL,NULL,0,NULL,1,'2018-09-29 16:15:14',0),(2,1,'商品列表','pms:product:read',NULL,1,'/pms/product/index',1,'2018-09-29 16:17:01',0),(3,1,'添加商品','pms:product:create',NULL,1,'/pms/product/add',1,'2018-09-29 16:18:51',0),(4,1,'商品分类','pms:productCategory:read',NULL,1,'/pms/productCate/index',1,'2018-09-29 16:23:07',0),(5,1,'商品类型','pms:productAttribute:read',NULL,1,'/pms/productAttr/index',1,'2018-09-29 16:24:43',0),(6,1,'品牌管理','pms:brand:read',NULL,1,'/pms/brand/index',1,'2018-09-29 16:25:45',0),(7,2,'编辑商品','pms:product:update',NULL,2,'/pms/product/updateProduct',1,'2018-09-29 16:34:23',0),(8,2,'删除商品','pms:product:delete',NULL,2,'/pms/product/delete',1,'2018-09-29 16:38:33',0),(9,4,'添加商品分类','pms:productCategory:create',NULL,2,'/pms/productCate/create',1,'2018-09-29 16:43:23',0),(10,4,'修改商品分类','pms:productCategory:update',NULL,2,'/pms/productCate/update',1,'2018-09-29 16:43:55',0),(11,4,'删除商品分类','pms:productCategory:delete',NULL,2,'/pms/productAttr/delete',1,'2018-09-29 16:44:38',0),(12,5,'添加商品类型','pms:productAttribute:create',NULL,2,'/pms/productAttr/create',1,'2018-09-29 16:45:25',0),(13,5,'修改商品类型','pms:productAttribute:update',NULL,2,'/pms/productAttr/update',1,'2018-09-29 16:48:08',0),(14,5,'删除商品类型','pms:productAttribute:delete',NULL,2,'/pms/productAttr/delete',1,'2018-09-29 16:48:44',0),(15,6,'添加品牌','pms:brand:create',NULL,2,'/pms/brand/add',1,'2018-09-29 16:49:34',0),(16,6,'修改品牌','pms:brand:update',NULL,2,'/pms/brand/update',1,'2018-09-29 16:50:55',0),(17,6,'删除品牌','pms:brand:delete',NULL,2,'/pms/brand/delete',1,'2018-09-29 16:50:59',0),(18,0,'首页',NULL,NULL,0,NULL,1,'2018-09-29 16:51:57',0);
/*!40000 ALTER TABLE `ums_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_resource`
--

DROP TABLE IF EXISTS `ums_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `category_id` bigint DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='后台资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_resource`
--

LOCK TABLES `ums_resource` WRITE;
/*!40000 ALTER TABLE `ums_resource` DISABLE KEYS */;
INSERT INTO `ums_resource` VALUES (1,'2020-02-04 17:04:55','商品品牌管理','/brand/**',NULL,1),(2,'2020-02-04 17:05:35','商品属性分类管理','/productAttribute/**',NULL,1),(3,'2020-02-04 17:06:13','商品属性管理','/productAttribute/**',NULL,1),(4,'2020-02-04 17:07:15','商品分类管理','/productCategory/**',NULL,1),(5,'2020-02-04 17:09:16','商品管理','/product/**',NULL,1),(6,'2020-02-04 17:09:53','商品库存管理','/sku/**',NULL,1),(8,'2020-02-05 14:43:37','订单管理','/order/**','',2),(9,'2020-02-05 14:44:22',' 订单退货申请管理','/returnApply/**','',2),(10,'2020-02-05 14:45:08','退货原因管理','/returnReason/**','',2),(11,'2020-02-05 14:45:43','订单设置管理','/orderSetting/**','',2),(12,'2020-02-05 14:46:23','收货地址管理','/companyAddress/**','',2),(13,'2020-02-07 16:37:22','优惠券管理','/coupon/**','',3),(14,'2020-02-07 16:37:59','优惠券领取记录管理','/couponHistory/**','',3),(15,'2020-02-07 16:38:28','限时购活动管理','/flash/**','',3),(16,'2020-02-07 16:38:59','限时购商品关系管理','/flashProductRelation/**','',3),(17,'2020-02-07 16:39:22','限时购场次管理','/flashSession/**','',3),(18,'2020-02-07 16:40:07','首页轮播广告管理','/home/advertise/**','',3),(19,'2020-02-07 16:40:34','首页品牌管理','/home/brand/**','',3),(20,'2020-02-07 16:41:06','首页新品管理','/home/newProduct/**','',3),(21,'2020-02-07 16:42:16','首页人气推荐管理','/home/recommendProduct/**','',3),(22,'2020-02-07 16:42:48','首页专题推荐管理','/home/recommendSubject/**','',3),(23,'2020-02-07 16:44:56',' 商品优选管理','/prefrenceArea/**','',5),(24,'2020-02-07 16:45:39','商品专题管理','/subject/**','',5),(25,'2020-02-07 16:47:34','后台用户管理','/admin/**','',4),(26,'2020-02-07 16:48:24','后台用户角色管理','/role/**','',4),(27,'2020-02-07 16:48:48','后台菜单管理','/menu/**','',4),(28,'2020-02-07 16:49:18','后台资源分类管理','/resourceCategory/**','',4),(29,'2020-02-07 16:49:45','后台资源管理','/resource/**','',4);
/*!40000 ALTER TABLE `ums_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_resource_category`
--

DROP TABLE IF EXISTS `ums_resource_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_resource_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='资源分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_resource_category`
--

LOCK TABLES `ums_resource_category` WRITE;
/*!40000 ALTER TABLE `ums_resource_category` DISABLE KEYS */;
INSERT INTO `ums_resource_category` VALUES (1,'2020-02-05 10:21:44','商品模块',0),(2,'2020-02-05 10:22:34','订单模块',0),(3,'2020-02-05 10:22:48','营销模块',0),(4,'2020-02-05 10:23:04','权限模块',0),(5,'2020-02-07 16:34:27','内容模块',0),(6,'2020-02-07 16:35:49','其他模块',0);
/*!40000 ALTER TABLE `ums_resource_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_role`
--

DROP TABLE IF EXISTS `ums_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `admin_count` int DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
  `sort` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='后台用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_role`
--

LOCK TABLES `ums_role` WRITE;
/*!40000 ALTER TABLE `ums_role` DISABLE KEYS */;
INSERT INTO `ums_role` VALUES (1,'商品管理员','只能查看及操作商品',0,'2020-02-03 16:50:37',1,0),(2,'订单管理员','只能查看及操作订单',0,'2018-09-30 15:53:45',1,0),(5,'超级管理员','拥有所有查看和操作功能',0,'2020-02-02 15:11:05',1,0),(8,'团长','抖团后台管理员，既可以管理商品，又可以管理订单',0,'2022-07-13 23:05:58',1,0);
/*!40000 ALTER TABLE `ums_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_role_menu_relation`
--

DROP TABLE IF EXISTS `ums_role_menu_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_role_menu_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='后台角色菜单关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_role_menu_relation`
--

LOCK TABLES `ums_role_menu_relation` WRITE;
/*!40000 ALTER TABLE `ums_role_menu_relation` DISABLE KEYS */;
INSERT INTO `ums_role_menu_relation` VALUES (53,2,7),(54,2,8),(55,2,9),(56,2,10),(57,2,11),(72,5,1),(73,5,2),(74,5,3),(75,5,4),(76,5,5),(77,5,6),(78,5,7),(79,5,8),(80,5,9),(81,5,10),(82,5,11),(83,5,12),(84,5,13),(85,5,14),(86,5,16),(87,5,17),(88,5,18),(89,5,19),(90,5,20),(91,5,21),(92,5,22),(93,5,23),(94,5,24),(95,5,25),(96,1,1),(97,1,2),(98,1,3),(99,1,4),(100,1,5),(101,1,6),(102,1,7),(103,1,8),(104,1,9),(105,1,10),(106,1,11),(118,8,1),(119,8,2),(120,8,3),(121,8,4),(122,8,5),(123,8,6),(124,8,7),(125,8,8),(126,8,9),(127,8,10),(128,8,11),(129,8,20),(130,8,12);
/*!40000 ALTER TABLE `ums_role_menu_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_role_permission_relation`
--

DROP TABLE IF EXISTS `ums_role_permission_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_role_permission_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL,
  `permission_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='后台用户角色和权限关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_role_permission_relation`
--

LOCK TABLES `ums_role_permission_relation` WRITE;
/*!40000 ALTER TABLE `ums_role_permission_relation` DISABLE KEYS */;
INSERT INTO `ums_role_permission_relation` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,7),(5,1,8),(6,2,4),(7,2,9),(8,2,10),(9,2,11),(10,3,5),(11,3,12),(12,3,13),(13,3,14),(14,4,6),(15,4,15),(16,4,16),(17,4,17);
/*!40000 ALTER TABLE `ums_role_permission_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_role_resource_relation`
--

DROP TABLE IF EXISTS `ums_role_resource_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_role_resource_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COMMENT='后台角色资源关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_role_resource_relation`
--

LOCK TABLES `ums_role_resource_relation` WRITE;
/*!40000 ALTER TABLE `ums_role_resource_relation` DISABLE KEYS */;
INSERT INTO `ums_role_resource_relation` VALUES (103,2,8),(104,2,9),(105,2,10),(106,2,11),(107,2,12),(142,5,1),(143,5,2),(144,5,3),(145,5,4),(146,5,5),(147,5,6),(148,5,8),(149,5,9),(150,5,10),(151,5,11),(152,5,12),(153,5,13),(154,5,14),(155,5,15),(156,5,16),(157,5,17),(158,5,18),(159,5,19),(160,5,20),(161,5,21),(162,5,22),(163,5,23),(164,5,24),(165,5,25),(166,5,26),(167,5,27),(168,5,28),(169,5,29),(170,1,1),(171,1,2),(172,1,3),(173,1,4),(174,1,5),(175,1,6),(176,1,23),(177,1,24),(201,8,1),(202,8,2),(203,8,3),(204,8,4),(205,8,5),(206,8,6),(207,8,8),(208,8,9),(209,8,10),(210,8,11),(211,8,12),(212,8,18),(213,8,25);
/*!40000 ALTER TABLE `ums_role_resource_relation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-07 22:28:39
