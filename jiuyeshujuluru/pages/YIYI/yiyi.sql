/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : zkpu

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-02-07 13:22:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for operatingconditions
-- ----------------------------
DROP TABLE IF EXISTS `operatingconditions`;
CREATE TABLE `operatingconditions` (
  `company` varchar(255) NOT NULL,
  `income` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `salesexpense` varchar(255) DEFAULT NULL,
  `manageexpense` varchar(255) DEFAULT NULL,
  `finacialexpense` varchar(255) DEFAULT NULL,
  `taxenpense` varchar(255) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `currentassets` varchar(255) DEFAULT NULL,
  `moneyfunds` varchar(255) DEFAULT NULL,
  `stock` varchar(255) DEFAULT NULL,
  `fixedassets` varchar(255) DEFAULT NULL,
  `networth` varchar(255) DEFAULT NULL,
  `non-currentassets` varchar(255) DEFAULT NULL,
  `totalassets` varchar(255) DEFAULT NULL,
  `shareholdersassets` varchar(255) DEFAULT NULL,
  `currentliabilities` varchar(255) DEFAULT NULL,
  `non-currentliabilities` varchar(255) DEFAULT NULL,
  `totalliabilities` varchar(255) DEFAULT NULL,
  `ownership` varchar(255) DEFAULT NULL,
  `liabilitiesownership` varchar(255) DEFAULT NULL,
  `totalprofit` varchar(255) DEFAULT NULL,
  `netprofit` varchar(255) DEFAULT NULL,
  `intangibleassets` varchar(255) DEFAULT NULL,
  `constructions` varchar(255) DEFAULT NULL,
  `pershare` varchar(255) DEFAULT NULL,
  `netcash-operating` varchar(255) DEFAULT NULL,
  `netcash-investment` varchar(255) DEFAULT NULL,
  `netcash-fund` varchar(255) DEFAULT NULL,
  `investment-reporting` varchar(255) DEFAULT NULL,
  `stockgoods` varchar(255) DEFAULT NULL,
  `spend-advertise` varchar(255) DEFAULT NULL,
  `employeecompensation` varchar(255) DEFAULT NULL,
  `governmentgrants` varchar(255) DEFAULT NULL,
  `price-tonswine` varchar(255) DEFAULT NULL,
  `profit-tonswine` varchar(255) DEFAULT NULL,
  `cost-tonswine` varchar(255) DEFAULT NULL,
  `managecost-tonswine` varchar(255) DEFAULT NULL,
  `assetsprofitability` varchar(255) DEFAULT NULL,
  `perprofit` varchar(255) DEFAULT NULL,
  `persale` varchar(255) DEFAULT NULL,
  `perincome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sector_data
-- ----------------------------
DROP TABLE IF EXISTS `sector_data`;
CREATE TABLE `sector_data` (
  `wine` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `income` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `profit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company`,`wine`),
  CONSTRAINT `fk_sc` FOREIGN KEY (`company`) REFERENCES `operatingconditions` (`company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sub-area_data
-- ----------------------------
DROP TABLE IF EXISTS `sub-area_data`;
CREATE TABLE `sub-area_data` (
  `area` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `income` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `profit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company`,`area`),
  CONSTRAINT `fk_ac` FOREIGN KEY (`company`) REFERENCES `operatingconditions` (`company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TRIGGER IF EXISTS `computerOper`;
DELIMITER ;;
CREATE TRIGGER `computerOper` BEFORE INSERT ON `operatingconditions` FOR EACH ROW BEGIN
declare c VARCHAR(255);
declare b VARCHAR(255);
SET c = (SELECT productoutput FROM size WHERE size.company=NEW.company);
SET b = (SELECT employeesnumber FROM size WHERE size.company=NEW.company);
IF (c > "0" AND b > "0")THEN
SET NEW.`price-tonswine`=NEW.income/c;
SET NEW.`profit-tonswine`=NEW.totalprofit/c;
SET NEW.`cost-tonswine`=NEW.salesexpense/c;
SET NEW.`managecost-tonswine`=NEW.manageexpense/c;
SET NEW.`perprofit`=NEW.totalprofit/b;
SET NEW.`persale`=NEW.income/b;
SET NEW.`perincome`=NEW.employeecompensation/b;
END IF;
SET NEW.`assetsprofitability`=NEW.totalprofit/NEW.totalassets;
END
;;
DELIMITER ;
