# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.10.10 (MySQL 5.7.32-0ubuntu0.18.04.1)
# Database: siklus
# Generation Time: 2021-06-09 08:49:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table CartOrder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CartOrder`;

CREATE TABLE `CartOrder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) NOT NULL,
  `purchase_code` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal_price` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `order_items` tinytext,
  `location_name` varchar(200) DEFAULT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 = created\n2 = settled\n3 = canceled',
  `comment` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table CartOrderItem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CartOrderItem`;

CREATE TABLE `CartOrderItem` (
  `id` int(11) unsigned NOT NULL,
  `cart_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `base_price` decimal(12,2) DEFAULT NULL,
  `each_price` decimal(12,2) DEFAULT NULL,
  `sell_price` decimal(12,2) DEFAULT NULL,
  `subtotal_price` decimal(12,2) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 = created\\n2 = settled\\n3 = canceled',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table CartOrderPayment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CartOrderPayment`;

CREATE TABLE `CartOrderPayment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cart_order_id` int(11) NOT NULL,
  `host_reference_number` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `invoice` varchar(50) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `settlement_date` timestamp NULL DEFAULT NULL,
  `meta_payment` tinytext,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PaymentMethod
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PaymentMethod`;

CREATE TABLE `PaymentMethod` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `meta_data` tinytext,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0 = disabled\n1 = enabled',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ProductBrand
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ProductBrand`;

CREATE TABLE `ProductBrand` (
  `int` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0 = not active\n1 = active\n',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ProductCategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ProductCategory`;

CREATE TABLE `ProductCategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '0 = not active\n1 = active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ProductImage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ProductImage`;

CREATE TABLE `ProductImage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(150) DEFAULT NULL,
  `image_path` varchar(150) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `mime` varchar(25) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ProductLogStock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ProductLogStock`;

CREATE TABLE `ProductLogStock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `last_stock` int(11) DEFAULT NULL,
  `update_stock` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Products`;

CREATE TABLE `Products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` tinytext,
  `sku` varchar(50) DEFAULT NULL,
  `base_price` decimal(12,2) DEFAULT NULL,
  `price_currency` decimal(12,2) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0 = disabled\n1 = enabled\n',
  `expired_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ProductStock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ProductStock`;

CREATE TABLE `ProductStock` (
  `id` int(11) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0 = not active\n1 = active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Role`;

CREATE TABLE `Role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table UserDevice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserDevice`;

CREATE TABLE `UserDevice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `device_id` varchar(50) DEFAULT NULL,
  `os_device` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `app_version` varchar(50) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table UserNotification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserNotification`;

CREATE TABLE `UserNotification` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_order_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `meta_data` tinytext,
  `is_read` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 = unread\n1 = read',
  `type` tinyint(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table UserOtp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserOtp`;

CREATE TABLE `UserOtp` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `expired` datetime DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0 = not active\n1 = active\n',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL,
  `uuid` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `fcm_token` varchar(25) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = not active\n1 = active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
