-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: intership
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book`
(
    `id`       int(11)       NOT NULL AUTO_INCREMENT,
    `type`     int(11)       NOT NULL DEFAULT '34',
    `name`     varchar(30)   NOT NULL,
    `author`   varchar(30)   NOT NULL DEFAULT '佚名',
    `press`    int(11)       NOT NULL DEFAULT '34',
    `date`     date          NOT NULL,
    `total`    int(11)       NOT NULL DEFAULT '0',
    `remain`   int(11)       NOT NULL DEFAULT '0',
    `price`    double(10, 2) NOT NULL DEFAULT '0.00',
    `verified` tinyint(1)    NOT NULL DEFAULT '0',
    `isbn`     varchar(13)            DEFAULT NULL,
    `b_times`  int(11)       NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `t_fk` (`type`),
    KEY `p_fk` (`press`),
    CONSTRAINT `p_fk` FOREIGN KEY (`press`) REFERENCES `press` (`id`),
    CONSTRAINT `t_fk` FOREIGN KEY (`type`) REFERENCES `booktype` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book`
    DISABLE KEYS */;
INSERT INTO `book`
VALUES (1, 3, '三体', '刘慈欣', 32, '1999-02-01', 11, 11, 25.00, 1, '9787229030933', 6),
       (2, 1, '高等数学（第七版 上册）', '同济大学数学系', 6, '2019-07-01', 100, 100, 15.00, 1, '9787040396638', 0),
       (3, 3, '美国众神：十周年作者修订版', '尼尔·盖曼', 34, '2017-05-01', 100, 100, 69.90, 1, '9787550297142', 0),
       (4, 34, '大学国际化的历程', '程星', 11, '2014-09-01', 1001, 1001, 40.20, 1, '9787100106252', 9),
       (5, 8, '居里夫人传', '艾芙·居里', 11, '1984-07-01', 20, 20, 28.40, 1, '9787100001076', 0),
       (6, 8, '爱因斯传', '亚伯拉罕·派斯', 11, '2004-09-01', 20, 20, 69.00, 1, '9787100038829', 1),
       (7, 10, '逻辑思维训练500题', '于雷', 15, '2013-01-01', 20, 20, 39.00, 1, '9787302303619', 0),
       (8, 27, 'C语言零基础入门学习：带你学C带你飞', '小甲鱼', 15, '2019-07-21', 20, 20, 79.00, 1, '9787302505945', 1),
       (9, 10, '中国哲学简史', '冯友兰', 20, '2019-07-22', 20, 20, 38.00, 1, '9787301215692', 0),
       (10, 15, '博弈论与经济行为', '冯·诺伊曼,摩根斯坦', 20, '2019-07-22', 20, 20, 158.00, 1, '9787301293263', 0),
       (11, 9, '中华经典名著全本全注全译丛书9：老子', '汤漳平，王朝华', 13, '2014-07-01', 20, 20, 23.00, 1, '9787101100747', 0),
       (12, 27, '阿里巴巴Java开发手册', '杨冠宝', 10, '2018-01-01', 20, 20, 35.00, 1, '9787121332319', 2),
       (13, 6, '中国动画经典升级版:没头脑和不高兴 [3-6岁]', '任溶溶，上海美术电影制片厂有限公司', 7, '2019-07-22', 20, 20, 14.80, 1, '9787513593625', 0);
/*!40000 ALTER TABLE `book`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booktype`
--

DROP TABLE IF EXISTS `booktype`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booktype`
(
    `id`   int(11)     NOT NULL AUTO_INCREMENT,
    `name` varchar(20) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booktype`
--

LOCK TABLES `booktype` WRITE;
/*!40000 ALTER TABLE `booktype`
    DISABLE KEYS */;
INSERT INTO `booktype`
VALUES (1, '教材类'),
       (2, '教辅类'),
       (3, '小说类'),
       (4, '漫画类'),
       (5, '青春文学'),
       (6, '绘本类'),
       (7, '科普/百科类'),
       (8, '历史/传记类'),
       (9, '文化类'),
       (10, '哲学/宗教类'),
       (11, '政治/军事类'),
       (12, '心理学'),
       (13, '法律'),
       (14, '社会科学'),
       (15, '经管类'),
       (16, '旅游/地图'),
       (17, '烹饪/美食'),
       (18, '保健/养生'),
       (19, '休闲/爱好'),
       (20, '体育/运动'),
       (21, '时尚/美妆'),
       (22, '家庭/家居'),
       (23, '两性关系'),
       (24, '风水/占卜'),
       (25, '建筑'),
       (26, '医学'),
       (27, '计算机/网络'),
       (28, '农学/林业'),
       (29, '自然科学'),
       (30, '工业技术'),
       (31, '期刊'),
       (32, '影视'),
       (33, '音乐'),
       (34, '未知');
/*!40000 ALTER TABLE `booktype`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha`
--

DROP TABLE IF EXISTS `captcha`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha`
(
    `id`      int(11)  NOT NULL AUTO_INCREMENT,
    `s_id`    int(11)  NOT NULL,
    `captcha` char(24) NOT NULL,
    `date`    date     NOT NULL,
    PRIMARY KEY (`id`),
    KEY `su_fk` (`s_id`),
    CONSTRAINT `su_fk` FOREIGN KEY (`s_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha`
--

LOCK TABLES `captcha` WRITE;
/*!40000 ALTER TABLE `captcha`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code`
(
    `id`    int(11)                     NOT NULL AUTO_INCREMENT,
    `phone` char(11) CHARACTER SET utf8 NOT NULL,
    `code`  char(11) CHARACTER SET utf8 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `phone` (`phone`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 23
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code`
    DISABLE KEYS */;
INSERT INTO `code`
VALUES (1, '13611111111', '123456'),
       (17, '17860638986', '446724'),
       (18, '13667155495', '037054'),
       (20, '13622222222', '123456'),
       (21, '13271356979', '966485'),
       (22, '15328411322', '707707');
/*!40000 ALTER TABLE `code`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments`
(
    `id`      int(11)    NOT NULL AUTO_INCREMENT,
    `s_id`    int(11)    NOT NULL,
    `content` mediumtext NOT NULL,
    PRIMARY KEY (`id`),
    KEY `u_fk` (`s_id`),
    CONSTRAINT `u_fk` FOREIGN KEY (`s_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments`
    DISABLE KEYS */;
INSERT INTO `comments`
VALUES (4, 4, '页面刷新、获取头像没有添加api、注册页面按钮溢出'),
       (6, 9, 'kkkkkkkkkkkkk');
/*!40000 ALTER TABLE `comments`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press`
--

DROP TABLE IF EXISTS `press`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `press`
(
    `id`   int(11)     NOT NULL AUTO_INCREMENT,
    `name` varchar(30) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press`
--

LOCK TABLES `press` WRITE;
/*!40000 ALTER TABLE `press`
    DISABLE KEYS */;
INSERT INTO `press`
VALUES (1, '北京邮电大学出版社'),
       (2, '西南财经大学出版社'),
       (3, '成都时代出版社'),
       (4, '电子科技大学出版社'),
       (5, '人民教育出版社'),
       (6, '高等教育出版社'),
       (7, '外语教育与研究出版社'),
       (8, '上海外语出版社'),
       (9, '人民邮电出版社'),
       (10, '电子工业出版社'),
       (11, '商务印书馆'),
       (12, '人民出版社'),
       (13, '中华书局'),
       (14, '科学出版社'),
       (15, '清华大学出版社'),
       (16, '中国电力出版社'),
       (17, '北京科学技术出版社'),
       (18, '中国财经出版社'),
       (19, '中国人民大学出版社'),
       (20, '北京大学出版社'),
       (21, '中国人民大学出版社'),
       (22, '武汉理工大学出版社'),
       (23, '复旦大学出版社'),
       (24, '岳麓书社'),
       (25, '二十一世纪出版社'),
       (26, '长江少年儿童出版社有限公司'),
       (27, '明天出版社'),
       (28, '西泠印社出版社'),
       (29, '中国文学出版社'),
       (32, '重庆出版社'),
       (34, '未知');
/*!40000 ALTER TABLE `press`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stubook`
--

DROP TABLE IF EXISTS `stubook`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stubook`
(
    `id`         int(11)    NOT NULL AUTO_INCREMENT,
    `s_id`       int(11)    NOT NULL,
    `b_id`       int(11)    NOT NULL,
    `b_date`     date       NOT NULL,
    `r_date`     date       NOT NULL,
    `overtime`   int(11)    NOT NULL DEFAULT '0',
    `isreturned` tinyint(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `s_fk` (`s_id`),
    KEY `b_fk` (`b_id`),
    CONSTRAINT `b_fk` FOREIGN KEY (`b_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `s_fk` FOREIGN KEY (`s_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 23
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stubook`
--

LOCK TABLES `stubook` WRITE;
/*!40000 ALTER TABLE `stubook`
    DISABLE KEYS */;
INSERT INTO `stubook`
VALUES (3, 3, 1, '2019-07-17', '2019-09-17', 0, 0),
       (4, 4, 1, '2019-07-21', '2019-09-21', 0, 1),
       (5, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (6, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (7, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (8, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (9, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (10, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (11, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (12, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (13, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (14, 2, 8, '2019-07-22', '2019-09-22', 0, 1),
       (15, 2, 1, '2019-07-22', '2019-09-22', 0, 1),
       (16, 2, 1, '2019-07-22', '2019-09-22', 0, 1),
       (19, 7, 1, '2019-07-22', '2019-09-22', 0, 1),
       (20, 2, 1, '2019-07-22', '2019-09-22', 0, 1),
       (21, 9, 12, '2019-07-22', '2019-09-22', 0, 1),
       (22, 9, 12, '2019-07-22', '2019-09-22', 0, 1);
/*!40000 ALTER TABLE `stubook`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user`
(
    `id`         int(11)     NOT NULL AUTO_INCREMENT,
    `name`       varchar(10)          DEFAULT NULL,
    `role`       tinyint(4)  NOT NULL DEFAULT '1' COMMENT '0 administrator,1 ordinary user',
    `pwd`        char(24)    NOT NULL,
    `phone`      varchar(11) NOT NULL,
    `gender`     tinyint(4)  NOT NULL DEFAULT '2' COMMENT '0 female,1 male.2 keep secret',
    `total`      int(11)     NOT NULL DEFAULT '10',
    `remain`     int(11)     NOT NULL DEFAULT '10',
    `last_login` datetime             DEFAULT NULL,
    `photo`      varchar(20)          DEFAULT NULL,
    `nickname`   varchar(20)          DEFAULT NULL,
    `signature`  text,
    `birthday`   date        NOT NULL DEFAULT '1949-10-01',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES (1, 'tom', 1, '4QrcOUm6Wau+VuBX8g+IPg==', '15863755633', 1, 10, 10, '2019-07-14 11:50:21', NULL, 'tom', NULL,
        '1949-10-01'),
       (2, 'root', 0, '4QrcOUm6Wau+VuBX8g+IPg==', '13612345678', 1, 10, 10, '2019-07-22 21:09:15', '1563534637050.jpg',
        'testAdmin', 'for test', '1949-10-01'),
       (3, 'tom', 1, '4QrcOUm6Wau+VuBX8g+IPg==', '13611111111', 1, 10, 8, '2019-07-22 10:42:04', '1563171230624.jpg',
        'tom', 'I am an ordinary user.', '1999-02-14'),
       (4, '王大爷', 1, 'lueSGJZetyySpUndWjMBEg==', '13667155495', 2, 10, 10, '2019-07-22 12:44:12', '1563756399760.png',
        '王大爷', '这个团队也太牛皮了吧', '1999-02-14'),
       (5, NULL, 1, 'qgcwXRW49XJ2BUulMJTFig==', '17860638986', 2, 10, 10, '2019-07-21 23:32:46', NULL, NULL, NULL,
        '1949-10-01'),
       (7, NULL, 1, '4QrcOUm6Wau+VuBX8g+IPg==', '13622222222', 2, 10, 10, '2019-07-22 22:10:50', NULL, NULL, NULL,
        '1949-10-01'),
       (8, NULL, 1, '4QrcOUm6Wau+VuBX8g+IPg==', '13271356979', 2, 10, 10, '2019-07-23 10:10:25', NULL, NULL, NULL,
        '2019-07-22'),
       (9, 'kk', 1, '4QrcOUm6Wau+VuBX8g+IPg==', '15328411322', 2, 10, 10, '2019-07-22 20:58:04', '1563800167315.jpg',
        'kk', NULL, '2019-07-22');
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2019-07-23 14:31:26
-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: intership
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book`
(
    `id`       int(11)       NOT NULL AUTO_INCREMENT,
    `type`     int(11)       NOT NULL DEFAULT '34',
    `name`     varchar(30)   NOT NULL,
    `author`   varchar(30)   NOT NULL DEFAULT '佚名',
    `press`    int(11)       NOT NULL DEFAULT '34',
    `date`     date          NOT NULL,
    `total`    int(11)       NOT NULL DEFAULT '0',
    `remain`   int(11)       NOT NULL DEFAULT '0',
    `price`    double(10, 2) NOT NULL DEFAULT '0.00',
    `verified` tinyint(1)    NOT NULL DEFAULT '0',
    `isbn`     varchar(13)            DEFAULT NULL,
    `b_times`  int(11)       NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `t_fk` (`type`),
    KEY `p_fk` (`press`),
    CONSTRAINT `p_fk` FOREIGN KEY (`press`) REFERENCES `press` (`id`),
    CONSTRAINT `t_fk` FOREIGN KEY (`type`) REFERENCES `booktype` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book`
    DISABLE KEYS */;
INSERT INTO `book`
VALUES (1, 3, '三体', '刘慈欣', 32, '1999-02-01', 11, 11, 25.00, 1, '9787229030933', 7),
       (2, 1, '高等数学（第七版 上册）', '同济大学数学系', 6, '2019-07-01', 100, 100, 15.00, 1, '9787040396638', 5),
       (3, 3, '美国众神：十周年作者修订版', '尼尔·盖曼', 34, '2017-05-01', 100, 100, 69.90, 1, '9787550297142', 2),
       (4, 34, '大学国际化的历程', '程星', 11, '2014-09-01', 1001, 1001, 40.20, 1, '9787100106252', 9),
       (5, 8, '居里夫人传', '艾芙·居里', 11, '1984-07-01', 20, 20, 28.40, 1, '9787100001076', 0),
       (6, 8, '爱因斯传', '亚伯拉罕·派斯', 11, '2004-09-01', 20, 20, 69.00, 1, '9787100038829', 1),
       (7, 7, '逻辑思维训练500题', '于雷', 15, '2013-01-01', 20, 20, 39.00, 1, '9787302303619', 0),
       (8, 27, 'C语言零基础入门学习：带你学C带你飞', '小甲鱼', 15, '2019-07-21', 20, 20, 79.00, 1, '9787302505945', 1),
       (9, 10, '中国哲学简史', '冯友兰', 20, '2019-07-22', 20, 20, 38.00, 1, '9787301215692', 0),
       (10, 15, '博弈论与经济行为', '冯·诺伊曼,摩根斯坦', 20, '2019-07-22', 20, 20, 158.00, 1, '9787301293263', 0),
       (11, 9, '中华经典名著全本全注全译丛书9：老子', '汤漳平，王朝华', 13, '2014-07-01', 20, 20, 23.00, 1, '9787101100747', 0),
       (12, 27, '阿里巴巴Java开发手册', '杨冠宝', 10, '2018-01-01', 20, 20, 35.00, 1, '9787121332319', 2),
       (13, 6, '中国动画经典升级版:没头脑和不高兴 [3-6岁]', '任溶溶，上海美术电影制片厂有限公司', 7, '2019-07-22', 20, 20, 14.80, 1, '9787513593625', 0),
       (15, 28, '竹鼠产后护理', '华农兄弟', 1, '2019-07-27', 1, 1, 25.00, 1, '9999999999995', 0);
/*!40000 ALTER TABLE `book`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booktype`
--

DROP TABLE IF EXISTS `booktype`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booktype`
(
    `id`   int(11)     NOT NULL AUTO_INCREMENT,
    `name` varchar(20) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booktype`
--

LOCK TABLES `booktype` WRITE;
/*!40000 ALTER TABLE `booktype`
    DISABLE KEYS */;
INSERT INTO `booktype`
VALUES (1, '教材类'),
       (2, '教辅类'),
       (3, '小说类'),
       (4, '漫画类'),
       (5, '青春文学'),
       (6, '绘本类'),
       (7, '科普/百科类'),
       (8, '历史/传记类'),
       (9, '文化类'),
       (10, '哲学/宗教类'),
       (11, '政治/军事类'),
       (12, '心理学'),
       (13, '法律'),
       (14, '社会科学'),
       (15, '经管类'),
       (16, '旅游/地图'),
       (17, '烹饪/美食'),
       (18, '保健/养生'),
       (19, '休闲/爱好'),
       (20, '体育/运动'),
       (21, '时尚/美妆'),
       (22, '家庭/家居'),
       (23, '两性关系'),
       (24, '风水/占卜'),
       (25, '建筑'),
       (26, '医学'),
       (27, '计算机/网络'),
       (28, '农学/林业'),
       (29, '自然科学'),
       (30, '工业技术'),
       (31, '期刊'),
       (32, '影视'),
       (33, '音乐'),
       (34, '未知');
/*!40000 ALTER TABLE `booktype`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha`
--

DROP TABLE IF EXISTS `captcha`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha`
(
    `id`      int(11)  NOT NULL AUTO_INCREMENT,
    `s_id`    int(11)  NOT NULL,
    `captcha` char(24) NOT NULL,
    `date`    date     NOT NULL,
    PRIMARY KEY (`id`),
    KEY `su_fk` (`s_id`),
    CONSTRAINT `su_fk` FOREIGN KEY (`s_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha`
--

LOCK TABLES `captcha` WRITE;
/*!40000 ALTER TABLE `captcha`
    DISABLE KEYS */;
INSERT INTO `captcha`
VALUES (1, 8, 'h+MCnQgYDnBe5y3KVl7+gg==', '2019-07-23'),
       (3, 2, 'r8Xx+CMKjKysphHC2vij0A==', '2019-07-23'),
       (4, 4, 'UrPWJwbtvsxRAOF2mADqUw==', '2019-07-23');
/*!40000 ALTER TABLE `captcha`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code`
(
    `id`    int(11)                     NOT NULL AUTO_INCREMENT,
    `phone` char(11) CHARACTER SET utf8 NOT NULL,
    `code`  char(11) CHARACTER SET utf8 NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `phone` (`phone`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code`
    DISABLE KEYS */;
INSERT INTO `code`
VALUES (23, '13271356979', '175471');
/*!40000 ALTER TABLE `code`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments`
(
    `id`      int(11)    NOT NULL AUTO_INCREMENT,
    `s_id`    int(11)    NOT NULL,
    `content` mediumtext NOT NULL,
    PRIMARY KEY (`id`),
    KEY `u_fk` (`s_id`),
    CONSTRAINT `u_fk` FOREIGN KEY (`s_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments`
    DISABLE KEYS */;
INSERT INTO `comments`
VALUES (4, 4, '页面刷新、获取头像没有添加api、注册页面按钮溢出'),
       (6, 9, 'kkkkkkkkkkkkk'),
       (7, 10, '666666666666');
/*!40000 ALTER TABLE `comments`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press`
--

DROP TABLE IF EXISTS `press`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `press`
(
    `id`   int(11)     NOT NULL AUTO_INCREMENT,
    `name` varchar(30) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press`
--

LOCK TABLES `press` WRITE;
/*!40000 ALTER TABLE `press`
    DISABLE KEYS */;
INSERT INTO `press`
VALUES (1, '北京邮电大学出版社'),
       (2, '西南财经大学出版社'),
       (3, '成都时代出版社'),
       (4, '电子科技大学出版社'),
       (5, '人民教育出版社'),
       (6, '高等教育出版社'),
       (7, '外语教育与研究出版社'),
       (8, '上海外语出版社'),
       (9, '人民邮电出版社'),
       (10, '电子工业出版社'),
       (11, '商务印书馆'),
       (12, '人民出版社'),
       (13, '中华书局'),
       (14, '科学出版社'),
       (15, '清华大学出版社'),
       (16, '中国电力出版社'),
       (17, '北京科学技术出版社'),
       (18, '中国财经出版社'),
       (19, '中国人民大学出版社'),
       (20, '北京大学出版社'),
       (21, '中国人民大学出版社'),
       (22, '武汉理工大学出版社'),
       (23, '复旦大学出版社'),
       (24, '岳麓书社'),
       (25, '二十一世纪出版社'),
       (26, '长江少年儿童出版社有限公司'),
       (27, '明天出版社'),
       (28, '西泠印社出版社'),
       (29, '中国文学出版社'),
       (32, '重庆出版社'),
       (34, '未知');
/*!40000 ALTER TABLE `press`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stubook`
--

DROP TABLE IF EXISTS `stubook`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stubook`
(
    `id`         int(11)    NOT NULL AUTO_INCREMENT,
    `s_id`       int(11)    NOT NULL,
    `b_id`       int(11)    NOT NULL,
    `b_date`     date       NOT NULL,
    `r_date`     date       NOT NULL,
    `overtime`   int(11)    NOT NULL DEFAULT '0',
    `isreturned` tinyint(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `s_fk` (`s_id`),
    KEY `b_fk` (`b_id`),
    CONSTRAINT `b_fk` FOREIGN KEY (`b_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `s_fk` FOREIGN KEY (`s_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 31
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stubook`
--

LOCK TABLES `stubook` WRITE;
/*!40000 ALTER TABLE `stubook`
    DISABLE KEYS */;
INSERT INTO `stubook`
VALUES (4, 4, 1, '2019-07-21', '2019-09-21', 0, 1),
       (5, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (6, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (7, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (8, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (9, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (10, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (11, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (12, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (13, 2, 4, '2019-07-22', '2019-09-22', 0, 1),
       (14, 2, 8, '2019-07-22', '2019-09-22', 0, 1),
       (15, 2, 1, '2019-07-22', '2019-09-22', 0, 1),
       (16, 2, 1, '2019-07-22', '2019-09-22', 0, 1),
       (19, 7, 1, '2019-07-22', '2019-09-22', 0, 1),
       (20, 2, 1, '2019-07-22', '2019-09-22', 0, 1),
       (21, 9, 12, '2019-07-22', '2019-09-22', 0, 1),
       (22, 9, 12, '2019-07-22', '2019-09-22', 0, 1),
       (23, 10, 1, '2019-07-27', '2019-09-27', 0, 1),
       (24, 2, 2, '2019-07-27', '2019-09-27', 0, 1),
       (25, 2, 2, '2019-07-27', '2019-09-27', 0, 1),
       (26, 2, 2, '2019-07-27', '2019-09-27', 0, 1),
       (27, 2, 2, '2019-07-27', '2019-09-27', 0, 1),
       (28, 2, 2, '2019-07-27', '2019-09-27', 0, 1),
       (29, 2, 3, '2019-08-02', '2019-10-02', 0, 1),
       (30, 2, 3, '2019-08-02', '2019-10-02', 0, 1);
/*!40000 ALTER TABLE `stubook`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user`
(
    `id`         int(11)     NOT NULL AUTO_INCREMENT,
    `name`       varchar(10)          DEFAULT NULL,
    `role`       tinyint(4)  NOT NULL DEFAULT '1' COMMENT '0 administrator,1 ordinary user',
    `pwd`        char(24)    NOT NULL,
    `phone`      varchar(11) NOT NULL,
    `gender`     tinyint(4)  NOT NULL DEFAULT '2' COMMENT '0 female,1 male.2 keep secret',
    `total`      int(11)     NOT NULL DEFAULT '10',
    `remain`     int(11)     NOT NULL DEFAULT '10',
    `last_login` datetime             DEFAULT NULL,
    `photo`      varchar(20)          DEFAULT NULL,
    `nickname`   varchar(20)          DEFAULT NULL,
    `signature`  text,
    `birthday`   date        NOT NULL DEFAULT '1949-10-01',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES (1, 'tom', 1, '4QrcOUm6Wau+VuBX8g+IPg==', '15863755633', 1, 10, 10, '2019-07-14 11:50:21', NULL, 'tom', NULL,
        '1949-10-01'),
       (2, 'root', 0, '4QrcOUm6Wau+VuBX8g+IPg==', '13612345678', 1, 10, 10, '2019-08-02 07:26:42', '1563961130324.png',
        '管理员', '我是全部用户中最靓的仔！', '2019-07-11'),
       (3, 'tom', 1, '4QrcOUm6Wau+VuBX8g+IPg==', '13611111111', 1, 10, 10, '2019-08-01 23:12:29', '1563171230624.jpg',
        'tom', 'I am an ordinary user.', '1999-02-14'),
       (4, '王大爷', 1, '4QrcOUm6Wau+VuBX8g+IPg==', '13667155495', 2, 10, 10, '2019-07-27 20:32:55', '1563954344908.jpeg',
        '王大爷', '这个团队也太牛皮了吧', '1999-02-14'),
       (5, NULL, 1, 'qgcwXRW49XJ2BUulMJTFig==', '17860638986', 2, 10, 10, '2019-07-21 23:32:46', NULL, NULL, NULL,
        '1949-10-01'),
       (7, NULL, 1, '4QrcOUm6Wau+VuBX8g+IPg==', '13622222222', 2, 10, 10, '2019-07-23 20:43:11', NULL, NULL, NULL,
        '1949-10-01'),
       (8, NULL, 1, '4QrcOUm6Wau+VuBX8g+IPg==', '13271356979', 2, 10, 10, '2019-07-23 21:31:36', NULL, NULL, NULL,
        '2019-07-22'),
       (9, 'kk', 1, '4QrcOUm6Wau+VuBX8g+IPg==', '15328411322', 2, 10, 10, '2019-07-27 17:48:55', '1563800167315.jpg',
        'kk', NULL, '2019-07-22'),
       (10, '波波波欧波波波罗', 1, '4QrcOUm6Wau+VuBX8g+IPg==', '13007155587', 0, 10, 10, '2019-07-27 19:21:52',
        '1564226625965.JPG', '菠萝', 'yoooooooooooooooo', '2019-07-27');
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2019-08-02  7:34:56
