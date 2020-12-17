-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tx_web
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_city`
--

DROP TABLE IF EXISTS `t_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_city` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `t_city_t_province_p_id_fk` (`p_id`),
  CONSTRAINT `t_city_t_province_p_id_fk` FOREIGN KEY (`p_id`) REFERENCES `t_province` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_city`
--

LOCK TABLES `t_city` WRITE;
/*!40000 ALTER TABLE `t_city` DISABLE KEYS */;
INSERT INTO `t_city` (`c_id`, `city`, `p_id`) VALUES (1,'武汉市',1),(2,'仙桃市',1),(3,'荆州市',1),(4,'天门市',1),(5,'宜昌市',1),(6,'襄阳市',1),(7,'杭州市',2),(8,'温州市',2),(9,'宁波市',2),(10,'绍兴市',2),(11,'湖州市',2),(12,'嘉兴市',2),(13,'广州市',3),(14,'深圳市',3),(15,'珠海市',3),(16,'佛山市',3),(17,'惠州市',3),(18,'汕头市',3),(19,'韶关市',3),(20,'长沙市',4),(21,'株洲市',4),(22,'岳阳市',4),(23,'张家界市',4),(24,'邵阳市',4),(25,'湘潭市',4),(26,'南京市',5),(27,'无锡市',5),(28,'苏州市',5),(29,'南通市',5),(30,'常州市',5),(31,'徐州市',5);
/*!40000 ALTER TABLE `t_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_downloadlist`
--

DROP TABLE IF EXISTS `t_downloadlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_downloadlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `size` longblob NOT NULL,
  `star` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_downloadlist`
--

LOCK TABLES `t_downloadlist` WRITE;
/*!40000 ALTER TABLE `t_downloadlist` DISABLE KEYS */;
INSERT INTO `t_downloadlist` (`id`, `name`, `path`, `description`, `size`, `star`, `image`) VALUES (1,'Android.pdf电子书','Android.pdf','安卓是一种基于Linux内核（不包含GNU组件）的自由及开放源代码的操作系统。主要使用于移动设备，如智能手机和平板电脑，由美国Google公司和开放手机联盟领导及开发。Android操作系统最初由Andy Rubin开发，主要支持手机。2005年8月由Google收购注资。2007年11月，Google与84家硬件制造商、软件开发商及电信营运商组建开放手机联盟共同研发改良Android系统。','161660',3,'e_books.png'),(2,'Web.pdf电子书','Web.pdf','JSP（全称JavaServer Pages）是由Sun Microsystems公司主导创建的一种动态网页技术标准。JSP部署于网络服务器上，可以响应客户端发送的请求，并根据请求内容动态地生成HTML、XML或其他格式文档的Web网页，然后返回给请求者。JSP技术以Java语言作为脚本语言，为用户的HTTP请求提供服务，并能与服务器上的其它Java程序共同处理复杂的业务需求。','9534185',4,'books.png'),(3,'无线传感器网络.pdf电子书','无线传感器网络.pdf','无线传感器网络(Wireless Sensor Networks, WSN)是一种分布式传感网络，它的末梢是可以感知和检查外部世界的传感器。WSN中的传感器通过无线方式通信，因此网络设置灵活，设备位置可以随时更改，还可以跟互联网进行有线或无线方式的连接。通过无线通信方式形成的一个多跳自组织网络。','18132142',2,'e_books.png');
/*!40000 ALTER TABLE `t_downloadlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_province`
--

DROP TABLE IF EXISTS `t_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_province` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_province`
--

LOCK TABLES `t_province` WRITE;
/*!40000 ALTER TABLE `t_province` DISABLE KEYS */;
INSERT INTO `t_province` (`p_id`, `province`) VALUES (1,'湖北省'),(2,'浙江省'),(3,'广东省'),(4,'湖南省'),(5,'江苏省');
/*!40000 ALTER TABLE `t_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_resource`
--

DROP TABLE IF EXISTS `t_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_resource` (
  `resourceId` int(11) NOT NULL AUTO_INCREMENT,
  `resourceName` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`resourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_resource`
--

LOCK TABLES `t_resource` WRITE;
/*!40000 ALTER TABLE `t_resource` DISABLE KEYS */;
INSERT INTO `t_resource` (`resourceId`, `resourceName`, `url`) VALUES (1,'资源下载','/GetDownloadList.do'),(2,'资源下载页面','/main/download.jsp'),(3,'用户管理','/userManager.do'),(4,'用户管理界面','/main/userManager.jsp'),(5,'资源管理','/resourceManager.do'),(6,'资源管理界面','/main/resourceManager.jsp'),(7,'个人中心','/personalCenter.do'),(8,'个人中心界面','/main/personalCenter');
/*!40000 ALTER TABLE `t_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` (`roleId`, `roleName`) VALUES (1,'管理员'),(2,'普通用户');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_resource`
--

DROP TABLE IF EXISTS `t_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid_fk_rr` (`roleId`),
  KEY `resourceid_fk` (`resourceId`),
  CONSTRAINT `resourceid_fk` FOREIGN KEY (`resourceId`) REFERENCES `t_resource` (`resourceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleid_fk_rr` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_resource`
--

LOCK TABLES `t_role_resource` WRITE;
/*!40000 ALTER TABLE `t_role_resource` DISABLE KEYS */;
INSERT INTO `t_role_resource` (`id`, `resourceId`, `roleId`) VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,1,2),(10,2,2),(11,7,2),(12,8,2);
/*!40000 ALTER TABLE `t_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `chrName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `province` int(10) NOT NULL,
  `city` int(10) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`userName`, `password`, `chrName`, `emailAddress`, `province`, `city`) VALUES ('admin','202cb962ac59075b964b07152d234b70','管理员','admin@qq.com',1,1),('sad','123456','思思','sisiliu@qq.com',1,2),('sansan','123456','张三','zhangsan@qq.com',2,8),('sasisi12','123456','李四','lisi321@qq.com',3,15),('dswewe','123456','王五二','wangwuer@qq.com',2,8),('qinqin','123456','钱柳','qianliu@qq.com',2,8),('qiqie','123456','李七','liqi4512@qq.com',1,1),('ls2020','827ccb0eea8a706c4c34a16891f84e7b','李四','1233@qq.com',1,2),('xiaowu','123456','小五','xiaowuo@qq.com',1,3),('wanglan','827ccb0eea8a706c4c34a16891f84e7b','王兰','zzc034011@qq.com',1,1),('wangwu2','827ccb0eea8a706c4c34a16891f84e7b','王五','111231@qq.com',1,1),('qqii','827ccb0eea8a706c4c34a16891f84e7b','七七','14523381@qq.com',1,1),('zahn5','81dc9bdb52d04dc20036dbd8313ed055','张三','1231@qq.com',1,1),('qtewd','827ccb0eea8a706c4c34a16891f84e7b','徐徐','xxc01011@qq.com',1,1),('msw123456','25f9e794323b453885f5181f1b624d0b','马思文','1627355463@qq.com',1,1),('msw123456789','123456','刘星','liixin@qq.com',3,14),('masiwen','e10adc3949ba59abbe56e057f20f883e','马思文','123456789@qq.com',4,24),('tgdsg','123456','微微','weiwei23@qq.com',3,14),('dewfa','123456','思思','libadsddi@qq.com',2,8),('fw2020','827ccb0eea8a706c4c34a16891f84e7b','王五','11123@qq.com',2,10),('wj2020','827ccb0eea8a706c4c34a16891f84e7b','秀秀','12333@qq.com',2,12),('zqw1','827ccb0eea8a706c4c34a16891f84e7b','仙女','zz1919@qq.com',1,1);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username_fk` (`userName`),
  KEY `roleid_fk` (`roleId`),
  CONSTRAINT `roleid_fk` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `username_fk` FOREIGN KEY (`userName`) REFERENCES `t_user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` (`id`, `roleId`, `userName`) VALUES (1,1,'admin'),(2,2,'zzc01'),(19,2,'ls2020'),(20,2,'ww2020'),(21,2,'zj2020'),(23,2,'shm123456'),(25,2,'sunhanming'),(29,2,'dsadsa'),(30,2,'dsad'),(31,2,'dsadsa12'),(32,2,'dsadsaf'),(33,2,'tgdsg'),(34,2,'dsadsads'),(35,2,'dsadsadsa'),(36,2,'tgdsgdsa');
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-01 21:16:39
