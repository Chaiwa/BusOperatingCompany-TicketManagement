-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 09 Mar 2014, 13:44:11
-- Sunucu sürümü: 5.6.16
-- PHP Sürümü: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `ticketsystem`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `adminuser`
--

CREATE TABLE IF NOT EXISTS `adminuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `adminuser`
--

INSERT INTO `adminuser` (`id`, `name`, `surname`, `phone`, `username`, `password`) VALUES
(1, 'Metin', 'Kılıç', '05554443322', 'admin', '123456');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `county` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bus`
--

CREATE TABLE IF NOT EXISTS `bus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `model_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_etlvdoxq0m4ioou5hqtgxdjim` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `tcno` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `birth_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `empuser`
--

CREATE TABLE IF NOT EXISTS `empuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `branch_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3elayv0l0ldkjp5fpbwwcapu1` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `journey`
--

CREATE TABLE IF NOT EXISTS `journey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bus_id` bigint(20) NOT NULL,
  `driver1_id` bigint(20) NOT NULL,
  `driver2_id` bigint(20) DEFAULT NULL,
  `route_id` bigint(20) NOT NULL,
  `jorney_no` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i5vv268ps1s0pqr5i91ekfuil` (`bus_id`),
  KEY `FK_fafura0rjjof0jdu8tlr3pw86` (`driver1_id`),
  KEY `FK_j73pht9hwwsuv0rum923927p3` (`driver2_id`),
  KEY `FK_6ffy3ar29ks1ffyqywejibbj6` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `passenger`
--

CREATE TABLE IF NOT EXISTS `passenger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4bqynwh29g6082ms8fgwn9hlh` (`from_id`),
  KEY `FK_cxjqyf5bmbk6v7iaorbu5xkp7` (`to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `routestation`
--

CREATE TABLE IF NOT EXISTS `routestation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `route_id` bigint(20) NOT NULL,
  `station_id` bigint(20) NOT NULL,
  `price` double DEFAULT NULL,
  `route_station_name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fbi6so060rrvg0gi3ofbos3hi` (`route_id`),
  KEY `FK_p6u1rnlltul7ieo8ls877isyo` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `station`
--

CREATE TABLE IF NOT EXISTS `station` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journey_id` bigint(20) NOT NULL,
  `passenger_id` bigint(20) NOT NULL,
  `rStation_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `taken_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h75dflwv6gi0u1p5spp5swk4r` (`journey_id`),
  KEY `FK_i09l3ohyhjpwjwu6y0ytgkl2i` (`passenger_id`),
  KEY `FK_br5kdsx6iuyl03cxpg8hq1d54` (`rStation_id`),
  KEY `FK_nyt5qyxap0c9vij0gkm014uc` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `empuser`
--
ALTER TABLE `empuser`
  ADD CONSTRAINT `FK_3elayv0l0ldkjp5fpbwwcapu1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`);

--
-- Tablo kısıtlamaları `journey`
--
ALTER TABLE `journey`
  ADD CONSTRAINT `FK_6ffy3ar29ks1ffyqywejibbj6` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`),
  ADD CONSTRAINT `FK_fafura0rjjof0jdu8tlr3pw86` FOREIGN KEY (`driver1_id`) REFERENCES `driver` (`id`),
  ADD CONSTRAINT `FK_i5vv268ps1s0pqr5i91ekfuil` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`),
  ADD CONSTRAINT `FK_j73pht9hwwsuv0rum923927p3` FOREIGN KEY (`driver2_id`) REFERENCES `driver` (`id`);

--
-- Tablo kısıtlamaları `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `FK_cxjqyf5bmbk6v7iaorbu5xkp7` FOREIGN KEY (`to_id`) REFERENCES `station` (`id`),
  ADD CONSTRAINT `FK_4bqynwh29g6082ms8fgwn9hlh` FOREIGN KEY (`from_id`) REFERENCES `station` (`id`);

--
-- Tablo kısıtlamaları `routestation`
--
ALTER TABLE `routestation`
  ADD CONSTRAINT `FK_p6u1rnlltul7ieo8ls877isyo` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`),
  ADD CONSTRAINT `FK_fbi6so060rrvg0gi3ofbos3hi` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`);

--
-- Tablo kısıtlamaları `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_nyt5qyxap0c9vij0gkm014uc` FOREIGN KEY (`employee_id`) REFERENCES `empuser` (`id`),
  ADD CONSTRAINT `FK_br5kdsx6iuyl03cxpg8hq1d54` FOREIGN KEY (`rStation_id`) REFERENCES `routestation` (`id`),
  ADD CONSTRAINT `FK_h75dflwv6gi0u1p5spp5swk4r` FOREIGN KEY (`journey_id`) REFERENCES `journey` (`id`),
  ADD CONSTRAINT `FK_i09l3ohyhjpwjwu6y0ytgkl2i` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
