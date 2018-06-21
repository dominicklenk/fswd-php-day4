-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 21. Jun 2018 um 08:40
-- Server-Version: 5.6.38
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `cr09_dominic_klenk_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `fk_contact_id` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additional_charges`
--

INSERT INTO `additional_charges` (`additional_charges_id`, `fk_contact_id`, `price`, `description`) VALUES
(1, 2, '0.00', 'Everything ok !!!');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_driver`
--

CREATE TABLE `additional_driver` (
  `additional_driver_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `license_nr` varchar(60) NOT NULL,
  `price_extradriver` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_service`
--

CREATE TABLE `additional_service` (
  `additional_service_id` int(11) NOT NULL,
  `additional_service_name` varchar(60) NOT NULL,
  `additional_service_price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additional_service`
--

INSERT INTO `additional_service` (`additional_service_id`, `additional_service_name`, `additional_service_price`) VALUES
(1, 'Kindersitz', '20.00'),
(2, 'Schneeketten', '10.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `fk_rentamount_id` int(11) NOT NULL,
  `car_type` varchar(50) NOT NULL,
  `build_year` int(11) DEFAULT NULL,
  `passengeramount` int(11) DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_id`, `fk_rentamount_id`, `car_type`, `build_year`, `passengeramount`, `description`) VALUES
(2, 1, 'Toyota X1', 2014, 5, '120PS, 5 Türen, großer Kofferraum'),
(3, 2, 'Mini Cooper', 2012, 4, '150PS');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `company_address` text,
  `company_UID` varchar(20) DEFAULT NULL,
  `fk_contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_address`, `company_UID`, `fk_contact_id`) VALUES
(2, 'MyRentCompany', 'Rennweg 33, 1030 Vienna, Austria', 'FR9876543', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact_person`
--

CREATE TABLE `contact_person` (
  `contact_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `e_mail` varchar(60) DEFAULT NULL,
  `tel_nr` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `contact_person`
--

INSERT INTO `contact_person` (`contact_id`, `first_name`, `last_name`, `e_mail`, `tel_nr`) VALUES
(1, 'Jon', 'Doe', 'jon.doe@gmx.at', '+43 650 1234567'),
(2, 'Jane', 'Smith', 'jane.smith@google.at', '+43 699 1234567');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `driver_telephone` varchar(50) NOT NULL,
  `driver_email` varchar(60) DEFAULT NULL,
  `license_nr` varchar(60) NOT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`driver_id`, `first_name`, `last_name`, `driver_telephone`, `driver_email`, `license_nr`, `birthday`) VALUES
(1, 'Sam', 'Sammy', '+43 664 8034198', 'sam.sammy@funny.com', 'P753419, BP Vienna', '1990-12-24');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `end_location`
--

CREATE TABLE `end_location` (
  `end_loc_id` int(11) NOT NULL,
  `end_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `end_location`
--

INSERT INTO `end_location` (`end_loc_id`, `end_address`) VALUES
(1, 'Rennweg 33, 1030 Wien'),
(2, 'Linzerstraße 350, 1140 Wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(11) NOT NULL,
  `insurance_kind` varchar(60) NOT NULL,
  `insurance_priceperday` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `insurance`
--

INSERT INTO `insurance` (`insurance_id`, `insurance_kind`, `insurance_priceperday`) VALUES
(1, 'Vollkasko', '30.00'),
(2, 'Insassenversicherung', '5.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_company_id` int(11) NOT NULL,
  `fk_driver_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) NOT NULL,
  `fk_additional_charges_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_sum` decimal(6,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_company_id`, `fk_driver_id`, `fk_car_id`, `fk_reservation_id`, `fk_additional_charges_id`, `invoice_date`, `invoice_sum`, `payment_method`) VALUES
(4, 2, 1, 3, 1, 1, '2018-06-16', '200.00', 'VISA Card');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rentamount`
--

CREATE TABLE `rentamount` (
  `rentamount_id` int(11) NOT NULL,
  `price_perday` decimal(6,2) NOT NULL,
  `price_perweek` decimal(6,2) DEFAULT NULL,
  `price_permonth` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `rentamount`
--

INSERT INTO `rentamount` (`rentamount_id`, `price_perday`, `price_perweek`, `price_permonth`) VALUES
(1, '40.00', '250.00', '700.00'),
(2, '50.00', '300.00', '800.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_car_id` int(11) NOT NULL,
  `fk_driver_id` int(11) NOT NULL,
  `fk_start_loc_id` int(11) NOT NULL,
  `fk_end_loc_id` int(11) NOT NULL,
  `fk_insurance_id` int(11) NOT NULL,
  `fk_additional_service_id` int(11) DEFAULT NULL,
  `fk_additional_driver_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `timestamp`, `fk_car_id`, `fk_driver_id`, `fk_start_loc_id`, `fk_end_loc_id`, `fk_insurance_id`, `fk_additional_service_id`, `fk_additional_driver_id`, `start_date`, `end_date`) VALUES
(1, '2018-06-16 17:10:37', 3, 1, 1, 2, 1, 1, NULL, '2018-06-11 13:00:00', '2018-06-13 13:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start_location`
--

CREATE TABLE `start_location` (
  `start_loc_id` int(11) NOT NULL,
  `start_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `start_location`
--

INSERT INTO `start_location` (`start_loc_id`, `start_address`) VALUES
(1, 'Rennweg 33, 1030 Wien'),
(2, 'Klanggasse 7, 1020 Wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userEmail` varchar(60) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  `userName` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`userId`, `userEmail`, `userPass`, `userName`) VALUES
(1, 'sam.sammy@funny.com', '0a593a58c6f655c6fedfc9b9001e4bef6eaa7ea770a729cf1240008fa81a2e2c', 'Sam Sammy');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`),
  ADD KEY `fk_contact_id` (`fk_contact_id`);

--
-- Indizes für die Tabelle `additional_driver`
--
ALTER TABLE `additional_driver`
  ADD PRIMARY KEY (`additional_driver_id`);

--
-- Indizes für die Tabelle `additional_service`
--
ALTER TABLE `additional_service`
  ADD PRIMARY KEY (`additional_service_id`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_rentamount_id` (`fk_rentamount_id`);

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_contact_id` (`fk_contact_id`);

--
-- Indizes für die Tabelle `contact_person`
--
ALTER TABLE `contact_person`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `end_location`
--
ALTER TABLE `end_location`
  ADD PRIMARY KEY (`end_loc_id`);

--
-- Indizes für die Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_company_id` (`fk_company_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_additional_charges_id` (`fk_additional_charges_id`);

--
-- Indizes für die Tabelle `rentamount`
--
ALTER TABLE `rentamount`
  ADD PRIMARY KEY (`rentamount_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_insurance_id` (`fk_insurance_id`),
  ADD KEY `fk_additional_service_id` (`fk_additional_service_id`),
  ADD KEY `fk_additional_driver_id` (`fk_additional_driver_id`),
  ADD KEY `fk_start_loc_id` (`fk_start_loc_id`),
  ADD KEY `fk_end_loc_id` (`fk_end_loc_id`);

--
-- Indizes für die Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_loc_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  MODIFY `additional_charges_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `additional_driver`
--
ALTER TABLE `additional_driver`
  MODIFY `additional_driver_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `additional_service`
--
ALTER TABLE `additional_service`
  MODIFY `additional_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `end_location`
--
ALTER TABLE `end_location`
  MODIFY `end_loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `insurance`
--
ALTER TABLE `insurance`
  MODIFY `insurance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `rentamount`
--
ALTER TABLE `rentamount`
  MODIFY `rentamount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `start_location`
--
ALTER TABLE `start_location`
  MODIFY `start_loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_contact_id`) REFERENCES `contact_person` (`contact_id`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_rentamount_id`) REFERENCES `rentamount` (`rentamount_id`);

--
-- Constraints der Tabelle `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_contact_id`) REFERENCES `contact_person` (`contact_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `invoice_ibfk_5` FOREIGN KEY (`fk_additional_charges_id`) REFERENCES `additional_charges` (`additional_charges_id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_insurance_id`) REFERENCES `insurance` (`insurance_id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`fk_additional_service_id`) REFERENCES `additional_service` (`additional_service_id`),
  ADD CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`fk_additional_driver_id`) REFERENCES `additional_driver` (`additional_driver_id`),
  ADD CONSTRAINT `reservation_ibfk_6` FOREIGN KEY (`fk_start_loc_id`) REFERENCES `start_location` (`start_loc_id`),
  ADD CONSTRAINT `reservation_ibfk_7` FOREIGN KEY (`fk_end_loc_id`) REFERENCES `end_location` (`end_loc_id`);
