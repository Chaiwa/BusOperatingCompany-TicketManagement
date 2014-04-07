-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 09 Mar 2014, 20:46:50
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `branch`
--

INSERT INTO `branch` (`id`, `branch_name`, `country`, `city`, `county`, `district`, `phone`) VALUES
(1, 'sultanbeyli merkez', 'türkiye', 'istanbul', 'sultanbeyli', 'fatih mahallesi', ' 902162023035');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `bus`
--

INSERT INTO `bus` (`id`, `plate`, `brand`, `model`, `capacity`, `model_year`) VALUES
(1, '34mcd01', 'mercedes', 'travego', 44, 2012),
(2, '34bmc01', 'bmc', 'ultra', 42, 2011);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `driver`
--

INSERT INTO `driver` (`id`, `name`, `surname`, `phone`, `tcno`, `birth_year`) VALUES
(1, 'ahmet', 'şimşek', ' 905554443333', '60055544412', 1985),
(2, 'mehmet', 'burdur', ' 905554443334', '60055544411', 1984);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `empuser`
--

INSERT INTO `empuser` (`id`, `name`, `surname`, `phone`, `username`, `password`, `branch_id`) VALUES
(1, 'caner', 'aslan', ' 905554442211', 'caner_sult', '123456', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `journey`
--

INSERT INTO `journey` (`id`, `bus_id`, `driver1_id`, `driver2_id`, `route_id`, `jorney_no`, `departure_time`, `arrival_time`) VALUES
(1, 1, 2, 1, 1, '340135', '2014-03-21 21:00:00', '2014-03-22 06:00:00'),
(2, 2, 1, 2, 1, '340235', '2014-03-23 21:00:00', '2014-03-24 06:00:00'),
(3, 2, 1, 2, 2, '060111', '2014-03-22 20:00:00', '2014-03-23 07:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=5 ;

--
-- Tablo döküm verisi `passenger`
--

INSERT INTO `passenger` (`id`, `name`, `surname`, `phone`, `gender`) VALUES
(1, 'metin', 'kılıç', ' 905554543321', 'male'),
(2, 'ahmet', 'yıldız', ' 905554567890', 'male'),
(3, 'canan', 'bican', ' 902164994949', 'female'),
(4, 'handan', 'alda', ' 904554545321', 'female');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `route`
--

INSERT INTO `route` (`id`, `route_name`, `from_id`, `to_id`) VALUES
(1, 'istanbul - izmir', 1, 2),
(2, 'ankara - edirne', 5, 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=11 ;

--
-- Tablo döküm verisi `routestation`
--

INSERT INTO `routestation` (`id`, `route_id`, `station_id`, `price`, `route_station_name`) VALUES
(1, 1, 3, 40, 'istanbul - bursa - izmir'),
(2, 1, 7, 15, 'istanbul - manisa - izmir'),
(3, 1, 8, 35, 'istanbul - balıkesir - izmir'),
(4, 1, 1, 60, 'istanbul* - izmir'),
(5, 2, 4, 35, 'ankara - bolu - edirne'),
(6, 2, 10, 25, 'ankara - kocaeli - edirne'),
(7, 2, 1, 15, 'ankara - istanbul - edirne'),
(8, 1, 2, 0, 'istanbul - izmir*'),
(9, 2, 6, 0, 'ankara - edirne*'),
(10, 2, 5, 65, 'ankara* - edirne');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `station`
--

CREATE TABLE IF NOT EXISTS `station` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=11 ;

--
-- Tablo döküm verisi `station`
--

INSERT INTO `station` (`id`, `name`) VALUES
(1, 'istanbul'),
(2, 'izmir'),
(3, 'bursa'),
(4, 'bolu'),
(5, 'ankara'),
(6, 'edirne'),
(7, 'manisa'),
(8, 'balıkesir'),
(9, 'yalova'),
(10, 'kocaeli');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=5 ;

--
-- Tablo döküm verisi `ticket`
--

INSERT INTO `ticket` (`id`, `journey_id`, `passenger_id`, `rStation_id`, `employee_id`, `seat_number`, `taken_date`) VALUES
(1, 1, 1, 1, 1, 1, '2014-03-09 18:57:11'),
(2, 1, 2, 2, 1, 11, '2014-03-09 19:00:44'),
(3, 1, 3, 1, 1, 5, '2014-03-09 19:13:56'),
(4, 1, 4, 8, 1, 9, '2014-03-09 19:15:02');

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
