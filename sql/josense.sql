CREATE TABLE `jo_article` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `content` longtext CHARACTER SET utf8 DEFAULT NULL,
  `publish_time` bigint(20) DEFAULT 0,
  `publish_status` tinyint(1) DEFAULT 1,
  `views` bigint(20) DEFAULT 0,
  PRIMARY KEY (`aid`),
  FULLTEXT KEY `content` (`title`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
