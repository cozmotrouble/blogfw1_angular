-- --------------------------------------------------------
-- Host:                         Localhost
-- Server version:               5.5.18 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.author: ~8 rows (approximately)
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` (`authorID`, `firstName`, `lastName`, `email`, `createdOn`, `updatedOn`, `isEditor`, `dob`) VALUES
	(1, 'Gerald', 'Guido', 'gerald.guido@gmail.com', '2013-06-11 00:00:00', '2013-06-13 00:00:00', 1, '1911-12-19'),
	(4, 'Herb', 'Stewart', 'Herb@gmail.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1980-01-01'),
	(5, 'Kevin', 'smith', 'kevin@test.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 1, '1975-01-01'),
	(6, 'fred', 'Macgillicutty', 'fred@test.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 1, '1975-01-01'),
	(7, 'Ben', 'Smith', 'ben@test.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 1, '1970-01-01'),
	(8, 'Ghengas', 'Kahn', 'Ghengas@test.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1975-01-01'),
	(9, 'Ted', 'Nugent', 'ted@test.com', '2009-11-25 12:18:16', '2009-11-25 12:18:16', 0, '1975-01-01'),
	(90, 'Gerald', 'Guido', 'gerald.guido@gmail.com', '2013-06-11 00:00:00', '2013-06-11 00:00:00', 1, '1911-12-19');
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
  KEY `FK_comment_post` (`postID`),
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`postID`) REFERENCES `post` (`postID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.comment: ~5 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`commentID`, `postID`, `body`, `name`, `email`, `website`, `createdOn`, `updatedOn`) VALUES
	(1, 1, '<p>Poop is brown!</p>', 'Earl', 'earl@setr.com', 'http://test.com', '2009-11-25 12:00:00', '2009-12-08 10:38:17'),
	(2, 2, '<p>I agree Poop IS brown.</p>', 'Duke E. Love', 'Dave@setr.com', 'http://test.com', '2009-11-25 21:58:04', '2009-12-08 10:37:58'),
	(3, 3, '<p>I\'d rather it be Moshing. </p>', 'Duke E. Love', 'Dave@setr.com', 'http://test.com', '2009-12-07 19:14:23', '2009-12-08 10:37:41'),
	(4, 1, '<p>I totally and whole heartedly agree</p>', 'Duke E. Love', 'Dave@setr.com', 'http://test.com', '2009-12-09 09:00:08', '2009-12-09 09:00:08'),
	(9, 2, '<p>I totally and whole heartedly agree</p>', 'Duke', 'Dave@test.com', 'asd', '2009-12-09 09:00:08', '2009-12-09 09:00:08');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.post
CREATE TABLE IF NOT EXISTS `post` (
  `postID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `createdOn` date DEFAULT NULL,
  `updatedOn` date DEFAULT NULL,
  `authorID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`postID`),
  KEY `FK_post_author` (`authorID`),
  CONSTRAINT `FK_post_author` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.post: ~5 rows (approximately)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`postID`, `title`, `body`, `createdOn`, `updatedOn`, `authorID`) VALUES
	(1, 'Post 1', 'Relationship is the most crucial aspect of ORM. In a relational database, relation between tables are defined using foreign key. However, in case of objects, relation between two objects is defined using association where one object has a reference to another. ORM defines how the object relation is mapped to the database relation.', '2009-11-25', '2009-12-14', 1),
	(2, 'Post two', '<p>Yeah, I said it.&nbsp; So what. It is. </p>', '2009-11-25', '2009-12-08', 1),
	(3, 'Post three', 'Multiplicity: This defines how many target entities can a particular source have and how many source entities can a particular target have. Consider the example of artwork and artist, where an artist has many artwork pieces. In an object model, an artwork has reference to one artist and an artist has reference to many pieces of artwork. So, for artwork and artist the multiplicity is many-to-one and for artist and artwork, it is one-to-many. The other two type of multiplicities are one-to-one and many-to-many.', '2009-12-07', '2009-12-08', 1),
	(4, 'Post four', 'Multiplicity: This defines how many target entities can a particular source have and how many source entities can a particular target have. Consider the example of artwork and artist, where an artist has many artwork pieces. In an object model, an artwork has reference to one artist and an artist has reference to many pieces of artwork. So, for artwork and artist the multiplicity is many-to-one and for artist and artwork, it is one-to-many. The other two type of multiplicities are one-to-one and many-to-many.', NULL, NULL, 1),
	(5, 'Post five', 'Multiplicity: This defines how many target entities can a particular source have and how many source entities can a particular target have. Consider the example of artwork and artist, where an artist has many artwork pieces. In an object model, an artwork has reference to one artist and an artist has reference to many pieces of artwork. So, for artwork and artist the multiplicity is many-to-one and for artist and artwork, it is one-to-many. The other two type of multiplicities are one-to-one and many-to-many.', NULL, NULL, 1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `subjectID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.subject: ~0 rows (approximately)
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.subjecttopost
CREATE TABLE IF NOT EXISTS `subjecttopost` (
  `subjectID` int(10) unsigned NOT NULL,
  `postID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`postID`,`subjectID`),
  KEY `FK_subjectToPost_subject` (`subjectID`),
  CONSTRAINT `FK_subjecttopost_post` FOREIGN KEY (`postID`) REFERENCES `post` (`postID`),
  CONSTRAINT `FK_subjecttopost_subject` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.subjecttopost: ~0 rows (approximately)
/*!40000 ALTER TABLE `subjecttopost` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjecttopost` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `tagid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table apptacular_blog.tag: ~14 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`tagid`, `name`, `createdOn`, `updatedOn`) VALUES
	(1, 'ColdFusion', '2009-12-07 12:45:55', '2009-12-07 12:45:55'),
	(2, 'Tags', '2009-12-07 12:46:04', '2009-12-07 12:46:04'),
	(3, 'Tag three', '2009-12-07 12:46:14', '2009-12-07 12:46:14'),
	(4, 'Waffles', '2009-12-07 12:46:23', '2009-12-07 12:46:23'),
	(5, 'Dave', '2009-12-15 14:59:07', '2009-12-15 14:59:07'),
	(6, 'Hamburgers', '2009-12-15 15:20:58', '2009-12-15 15:20:58'),
	(7, 'Higher Education', '2009-12-16 11:33:27', '2009-12-16 11:33:27'),
	(8, 'MySQL', '2009-12-16 11:33:46', '2009-12-16 11:33:46'),
	(9, 'Code Generation', '2009-12-16 11:33:58', '2009-12-16 11:33:58'),
	(10, 'Apache Derby', '2009-12-16 11:34:29', '2009-12-16 11:34:29'),
	(11, 'test 11', '2009-12-16 11:35:21', '2009-12-16 11:35:21'),
	(12, 'Ralph\'s brain', '2009-12-16 11:36:16', '2009-12-16 11:36:16'),
	(13, 'Gwar', '2009-12-16 11:36:44', '2009-12-16 11:36:44'),
	(14, 'Elvis', '2009-12-16 11:37:04', '2009-12-16 11:37:04');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.tagtoauthor
CREATE TABLE IF NOT EXISTS `tagtoauthor` (
  `tagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tagID`,`authorID`),
  KEY `FK_tagToAuthor_author` (`authorID`),
  KEY `fk_tagtoauthor_tag1_idx` (`tagID`),
  CONSTRAINT `fk_tagtoauthor_author1` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tagtoauthor_tag1` FOREIGN KEY (`tagID`) REFERENCES `tag` (`tagid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.tagtoauthor: ~24 rows (approximately)
/*!40000 ALTER TABLE `tagtoauthor` DISABLE KEYS */;
INSERT INTO `tagtoauthor` (`tagID`, `authorID`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(12, 2),
	(13, 2),
	(11, 4),
	(12, 4),
	(13, 4),
	(11, 5),
	(12, 5),
	(13, 5),
	(14, 5),
	(11, 6),
	(12, 6),
	(13, 6);
/*!40000 ALTER TABLE `tagtoauthor` ENABLE KEYS */;


-- Dumping structure for table apptacular_blog.tagtopost
CREATE TABLE IF NOT EXISTS `tagtopost` (
  `tagID` int(10) unsigned NOT NULL,
  `postID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`postID`,`tagID`),
  KEY `FK_tagToPost_tag` (`tagID`),
  CONSTRAINT `FK_tagtopost_post` FOREIGN KEY (`postID`) REFERENCES `post` (`postID`),
  CONSTRAINT `FK_tagtopost_tag` FOREIGN KEY (`tagID`) REFERENCES `tag` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table apptacular_blog.tagtopost: ~7 rows (approximately)
/*!40000 ALTER TABLE `tagtopost` DISABLE KEYS */;
INSERT INTO `tagtopost` (`tagID`, `postID`) VALUES
	(1, 2),
	(2, 3),
	(3, 1),
	(3, 3),
	(4, 2),
	(4, 3),
	(10, 2);
/*!40000 ALTER TABLE `tagtopost` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
