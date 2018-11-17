use josense;
CREATE TABLE `jo_article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `content` longtext CHARACTER SET utf8,
  `publish_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `publish_status` tinyint(1) DEFAULT '1',
  `views` int(11) DEFAULT '1',
  PRIMARY KEY (`aid`),
  FULLTEXT KEY `content` (`title`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;