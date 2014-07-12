-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.17 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for apptacular_blog
CREATE DATABASE IF NOT EXISTS `apptacular_blog` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `apptacular_blog`;


-- Dumping structure for table apptacular_blog.author
CREATE TABLE IF NOT EXISTS `author` (
  `authorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `isEditor` tinyint(1) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.author: 12 rows
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
REPLACE INTO `author` (`authorID`, `firstName`, `lastName`, `email`, `createdOn`, `updatedOn`, `isEditor`, `dob`) VALUES
	(1, 'Lee', 'Brimlowe', 'lee@brimlow.com', '2009-11-25 00:00:00', '2014-07-12 00:00:00', 0, '1975-01-01'),
	(2, 'Earl', 'Ragefest', 'earl@ragefest', '2009-11-25 13:11:40', '2009-11-25 13:11:40', 0, '1976-12-19'),
	(3, 'Adam', 'Lehman', 'adam@adrocknapohbia.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1978-10-26'),
	(4, 'Ryan', 'Stewart', 'ryan@ryanstewart.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1980-01-01'),
	(5, 'Kevin', 'Hoyt', 'kevin@kevinhoyt.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 1, '1975-01-01'),
	(6, 'Serge', 'Jespers', 'serge@webkitchen.be', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 1, '1975-01-01'),
	(7, 'Ben', 'Forta', 'ben@forta.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 1, '1970-01-01'),
	(8, 'Lee', 'Brimlowe', 'lee@brimlow.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1975-01-01'),
	(9, 'Ted', 'Patrick', 'ted@adobe.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1975-01-01'),
	(10, 'Andrew', 'Shorten', 'ashorten@adobe.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1975-01-01'),
	(11, 'Greg', 'Wilson', 'gwilson@adobe.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 1, '1970-01-01'),
	(12, 'Danny', 'Dura', 'ddura@adobe.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1975-01-01');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `commentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postID` int(10) unsigned NOT NULL,
  `body` text,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `FK_comment_post` (`postID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.comment: 4 rows
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
REPLACE INTO `comment` (`commentID`, `postID`, `body`, `name`, `email`, `website`, `createdOn`, `updatedOn`) VALUES
	(1, 1, '<p>ROOOOOOOAAAARRRRRR!</p>', 'Earl', 'earl@ragefest.com', 'http://www.earl.com', '2009-11-25 12:00:00', '2009-12-08 10:38:17'),
	(2, 2, '<p>I agree, but I am you, so I better.</p>', 'Terrence P Ryan', 'terrence.p.ryan@gmail.com', 'http://terrenceryan.com', '2009-11-25 21:58:04', '2009-12-08 10:37:58'),
	(3, 3, '<p>I\'d rather it be Flaming Labala. </p>', 'Terrence Ryan', 'terry@numtopia.com', 'http://terrenceryan.com', '2009-12-07 19:14:23', '2009-12-08 10:37:41'),
	(4, 1, '<p>I totally and whole heartedly agree</p>', 'Terrence P Ryan', 'terrence.p.ryan@gmail.com', 'http://terrenceryan.com', '2009-12-09 09:00:08', '2009-12-09 09:00:08');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.post
CREATE TABLE IF NOT EXISTS `post` (
  `postID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL,
  `authorID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`postID`),
  KEY `FK_post_author` (`authorID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.post: 3 rows
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
REPLACE INTO `post` (`postID`, `title`, `body`, `createdOn`, `updatedOn`, `authorID`) VALUES
	(1, 'ColdFusion Builder Rocks', '<p>It\'s awesome.  It integrates with Flex Builder.  I once saw it lift a burning car off it\'s injured son.  It\'s asymptotically approaching infinity.</p>', '2009-11-25 00:00:00', '2009-12-14 00:00:00', 1),
	(2, 'ColdFusion 9 is Awesome', '<p>Yeah, I said it.&nbsp; So what. It is. </p>', '2009-11-25 17:24:15', '2009-12-08 10:36:08', 1),
	(3, 'Flex 4 is going to be a game changerdd', '<p>And that game will be "Yahtzee."</p>', '2009-12-07 00:00:00', '2009-12-08 00:00:00', 1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `tagid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table apptacular_blog.tag: 14 rows
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
REPLACE INTO `tag` (`tagid`, `name`, `createdOn`, `updatedOn`) VALUES
	(1, 'ColdFusion', '2009-12-07 12:45:55', '2009-12-07 12:45:55'),
	(2, 'Flex', '2009-12-07 12:46:04', '2009-12-07 12:46:04'),
	(3, 'Flash Builder', '2009-12-07 12:46:14', '2009-12-07 12:46:14'),
	(4, 'ColdFusion Builder', '2009-12-07 12:46:23', '2009-12-07 12:46:23'),
	(5, 'Flash', '2009-12-15 14:59:07', '2009-12-15 14:59:07'),
	(6, 'Java', '2009-12-15 15:20:58', '2009-12-15 15:20:58'),
	(7, 'Higher Education', '2009-12-16 11:33:27', '2009-12-16 11:33:27'),
	(8, 'MySQL', '2009-12-16 11:33:46', '2009-12-16 11:33:46'),
	(9, 'Code Generation', '2009-12-16 11:33:58', '2009-12-16 11:33:58'),
	(10, 'Apache Derby', '2009-12-16 11:34:29', '2009-12-16 11:34:29'),
	(11, 'Flash Catalyst', '2009-12-16 11:35:21', '2009-12-16 11:35:21'),
	(12, 'Evangelist', '2009-12-16 11:36:16', '2009-12-16 11:36:16'),
	(13, 'AIR', '2009-12-16 11:36:44', '2009-12-16 11:36:44'),
	(14, 'AIR with JavaScript', '2009-12-16 11:37:04', '2009-12-16 11:37:04');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.tagtoauthor
CREATE TABLE IF NOT EXISTS `tagtoauthor` (
  `tagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tagID`,`authorID`),
  KEY `FK_tagToAuthor_author` (`authorID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.tagtoauthor: 41 rows
/*!40000 ALTER TABLE `tagtoauthor` DISABLE KEYS */;
REPLACE INTO `tagtoauthor` (`tagID`, `authorID`) VALUES
	(1, 1),
	(1, 3),
	(2, 1),
	(3, 1),
	(4, 1),
	(4, 3),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(11, 4),
	(11, 5),
	(11, 6),
	(11, 10),
	(12, 1),
	(12, 2),
	(12, 3),
	(12, 4),
	(12, 5),
	(12, 6),
	(12, 7),
	(12, 8),
	(12, 9),
	(12, 10),
	(12, 11),
	(12, 12),
	(13, 1),
	(13, 2),
	(13, 3),
	(13, 4),
	(13, 5),
	(13, 6),
	(13, 7),
	(13, 8),
	(13, 9),
	(13, 10),
	(13, 11),
	(13, 12),
	(14, 1),
	(14, 5);
/*!40000 ALTER TABLE `tagtoauthor` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.tagtopost
CREATE TABLE IF NOT EXISTS `tagtopost` (
  `tagID` int(10) unsigned NOT NULL,
  `postID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`postID`,`tagID`),
  KEY `FK_tagToPost_tag` (`tagID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.tagtopost: 6 rows
/*!40000 ALTER TABLE `tagtopost` DISABLE KEYS */;
REPLACE INTO `tagtopost` (`tagID`, `postID`) VALUES
	(3, 1),
	(4, 1),
	(1, 2),
	(2, 3),
	(3, 3),
	(4, 3);
/*!40000 ALTER TABLE `tagtopost` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
