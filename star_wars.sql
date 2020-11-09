-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 09. Nov 2020 um 06:32
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `star_wars`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aliases`
--

CREATE TABLE `aliases` (
  `characters_character_id` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `aliases`
--

INSERT INTO `aliases` (`characters_character_id`, `nickname`) VALUES
(1, 'Ani');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blasters`
--

CREATE TABLE `blasters` (
  `weapon_id` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `mag_size` int(11) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `blasters`
--

INSERT INTO `blasters` (`weapon_id`, `Name`, `mag_size`, `type`) VALUES
(7, 'DL-44', 10, 'pistol'),
(8, 'E-11', 50, 'rifle'),
(9, 'EE-3', 10, 'rifle'),
(10, 'DLT-19', 150, 'rifle'),
(11, 'T-21', 200, 'rifle'),
(12, 'DH-17', 10, 'pistol'),
(13, 'ELG-3A', 10, 'pistol'),
(14, 'DC-15A', 100, 'rifle'),
(15, 'DC-15S', 100, 'rifle'),
(16, 'DC-17', 20, 'pistol'),
(17, 'E-5', 50, 'rifle');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters`
--

CREATE TABLE `characters` (
  `character_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `fraction_name` varchar(50) NOT NULL,
  `species_name` varchar(50) NOT NULL,
  `profession` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `characters`
--

INSERT INTO `characters` (`character_id`, `first_name`, `last_name`, `fraction_name`, `species_name`, `profession`) VALUES
(1, 'Anakin', 'Skywalker', 'Galactic Republic', 'Human', 'Jedi'),
(2, 'Obi Wan', 'Kenobi', 'Galactic Republic', 'Human', 'Jedi'),
(3, 'Sheev', 'Palpatine', 'Galactic Republic', 'Human', 'Senator'),
(4, 'Padmé', 'Amedala', 'Galactic Republic', 'Human', 'Senator'),
(5, 'Yoda', 'Unknown', 'Galactic Republic', 'Unknown', 'Jedi'),
(6, 'Cad', 'Bane', 'Hutts', 'Duros', 'Bounty Hunter'),
(7, 'Mace', 'Windu', 'Galactic Republic', 'Human', 'Jedi'),
(8, 'Jar Jar', 'Binks', 'Galactic Republic', 'Gungan', 'Senator'),
(9, 'Nute', 'Gunray', 'Trade Federation', 'Neimoidian', 'Senator'),
(10, 'Luke', 'Skywalker', 'Rebel Alliance', 'Human', 'Jedi'),
(11, 'Fives', 'Unknown', 'Galactic Republic', 'Human', 'Solider'),
(12, 'Rex', 'Unknown', 'Galactic Republic', 'Human', 'Solider'),
(13, 'Echo', 'Unknown', 'Galactic Republic', 'Human', 'Solider'),
(14, 'Cody', 'Unknown', 'Galactic Republic', 'Human', 'Solider'),
(15, 'Appo', 'Unknown', 'Galactic Republic', 'Human', 'Solider');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clones`
--

CREATE TABLE `clones` (
  `character_id` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  `rank` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `clones`
--

INSERT INTO `clones` (`character_id`, `code`, `rank`) VALUES
(11, 'CT-5555', 'ARC'),
(12, 'CT-7567', 'Captain'),
(13, 'CT-1409', 'ARC'),
(14, 'CC-2224', 'Commander'),
(15, 'CC-1119', 'Commander');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `droids`
--

CREATE TABLE `droids` (
  `droid_id` int(11) NOT NULL,
  `droid_name` varchar(45) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profession` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `droids`
--

INSERT INTO `droids` (`droid_id`, `droid_name`, `type`, `profession`) VALUES
(1, 'C-3PO', 'Protocol droid', 'Other'),
(2, 'R2-D2', 'Astromech droid', 'Other'),
(3, 'IG-88', 'Assassin droid', 'Bounty Hunter');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_blaster_type`
--

CREATE TABLE `e_blaster_type` (
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `e_blaster_type`
--

INSERT INTO `e_blaster_type` (`type`) VALUES
('pistol'),
('rifle'),
('sniper');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_droid_type`
--

CREATE TABLE `e_droid_type` (
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `e_droid_type`
--

INSERT INTO `e_droid_type` (`type`) VALUES
('Assassin droid'),
('Astromech droid'),
('B1 Battledroid'),
('B2 Battledroid'),
('Medical droid'),
('Pilot droid'),
('Protocol droid'),
('Scout droid');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_fraction`
--

CREATE TABLE `e_fraction` (
  `fraction_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `e_fraction`
--

INSERT INTO `e_fraction` (`fraction_name`) VALUES
('Black Sun'),
('Confederacy of Independant Systems'),
('First Order'),
('Galactic Empire'),
('Galactic Republic'),
('Hutts'),
('Intergalactic Banking Clan'),
('Mandalorians'),
('New Republic'),
('Old Republic'),
('Rebel Alliance'),
('Resistance'),
('Shadow Collective'),
('Sith Empire'),
('Techno Union'),
('Trade Federation');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_lightsaber_color`
--

CREATE TABLE `e_lightsaber_color` (
  `color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `e_lightsaber_color`
--

INSERT INTO `e_lightsaber_color` (`color`) VALUES
('blue'),
('green'),
('orange'),
('red'),
('violet'),
('yellow');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_professions`
--

CREATE TABLE `e_professions` (
  `profession` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `e_professions`
--

INSERT INTO `e_professions` (`profession`) VALUES
('Bounty Hunter'),
('Jedi'),
('Leader'),
('Other'),
('Pilot'),
('Senator'),
('Sith'),
('Smuggler'),
('Solider');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_rank`
--

CREATE TABLE `e_rank` (
  `rank` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `e_rank`
--

INSERT INTO `e_rank` (`rank`) VALUES
('ARC'),
('Captain'),
('Commander'),
('Corporal'),
('Lieutenant'),
('Private'),
('Sergeant');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_species`
--

CREATE TABLE `e_species` (
  `species_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `e_species`
--

INSERT INTO `e_species` (`species_name`) VALUES
('Bith'),
('Bothan'),
('Chagrian'),
('Chiss'),
('Devaronian'),
('Dug'),
('Duros'),
('Ewok'),
('Gamorrean'),
('Geonosian'),
('Gran'),
('Gungan'),
('Human'),
('Hutt'),
('Ithorians'),
('Jawa'),
('Kaminoan'),
('Lasat'),
('Mon Calamari'),
('Muun'),
('Neimoidian'),
('Quarren'),
('Rodian'),
('Sullustan'),
('Talz'),
('Togruta'),
('Toydarians'),
('Trandoshan'),
('Tusken'),
('Twi’lek'),
('Ugnaught'),
('Utapaun'),
('Wookiee'),
('Zabrak');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kills`
--

CREATE TABLE `kills` (
  `killer_character_id` int(11) NOT NULL,
  `victim_character_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kills`
--

INSERT INTO `kills` (`killer_character_id`, `victim_character_id`) VALUES
(3, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lightsabers`
--

CREATE TABLE `lightsabers` (
  `weapon_id` int(11) NOT NULL,
  `color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `lightsabers`
--

INSERT INTO `lightsabers` (`weapon_id`, `color`) VALUES
(1, 'blue'),
(2, 'green'),
(3, 'violet'),
(4, 'yellow'),
(5, 'orange'),
(6, 'red');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weapons_bt`
--

CREATE TABLE `weapons_bt` (
  `weapon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `weapons_bt`
--

INSERT INTO `weapons_bt` (`weapon_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weapons_bt_has_characters_jt`
--

CREATE TABLE `weapons_bt_has_characters_jt` (
  `weapons_bt_weapon_id` int(11) NOT NULL,
  `characters_character_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `weapons_bt_has_characters_jt`
--

INSERT INTO `weapons_bt_has_characters_jt` (`weapons_bt_weapon_id`, `characters_character_id`) VALUES
(1, 1),
(1, 2),
(1, 10),
(2, 4),
(2, 10),
(3, 7),
(6, 3),
(15, 11),
(15, 13),
(15, 14),
(15, 15),
(16, 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weapons_bt_has_droids_jt`
--

CREATE TABLE `weapons_bt_has_droids_jt` (
  `weapons_bt_weapon_id` int(11) NOT NULL,
  `droids_droid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `weapons_bt_has_droids_jt`
--

INSERT INTO `weapons_bt_has_droids_jt` (`weapons_bt_weapon_id`, `droids_droid_id`) VALUES
(17, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `aliases`
--
ALTER TABLE `aliases`
  ADD PRIMARY KEY (`characters_character_id`,`nickname`);

--
-- Indizes für die Tabelle `blasters`
--
ALTER TABLE `blasters`
  ADD PRIMARY KEY (`weapon_id`,`type`);

--
-- Indizes für die Tabelle `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`character_id`,`fraction_name`,`species_name`,`profession`);

--
-- Indizes für die Tabelle `clones`
--
ALTER TABLE `clones`
  ADD PRIMARY KEY (`character_id`,`rank`);

--
-- Indizes für die Tabelle `droids`
--
ALTER TABLE `droids`
  ADD PRIMARY KEY (`droid_id`,`type`,`profession`);

--
-- Indizes für die Tabelle `e_blaster_type`
--
ALTER TABLE `e_blaster_type`
  ADD PRIMARY KEY (`type`);

--
-- Indizes für die Tabelle `e_droid_type`
--
ALTER TABLE `e_droid_type`
  ADD PRIMARY KEY (`type`);

--
-- Indizes für die Tabelle `e_fraction`
--
ALTER TABLE `e_fraction`
  ADD PRIMARY KEY (`fraction_name`);

--
-- Indizes für die Tabelle `e_lightsaber_color`
--
ALTER TABLE `e_lightsaber_color`
  ADD PRIMARY KEY (`color`);

--
-- Indizes für die Tabelle `e_professions`
--
ALTER TABLE `e_professions`
  ADD PRIMARY KEY (`profession`);

--
-- Indizes für die Tabelle `e_rank`
--
ALTER TABLE `e_rank`
  ADD PRIMARY KEY (`rank`);

--
-- Indizes für die Tabelle `e_species`
--
ALTER TABLE `e_species`
  ADD PRIMARY KEY (`species_name`);

--
-- Indizes für die Tabelle `kills`
--
ALTER TABLE `kills`
  ADD PRIMARY KEY (`killer_character_id`,`victim_character_id`);

--
-- Indizes für die Tabelle `lightsabers`
--
ALTER TABLE `lightsabers`
  ADD PRIMARY KEY (`weapon_id`,`color`);

--
-- Indizes für die Tabelle `weapons_bt`
--
ALTER TABLE `weapons_bt`
  ADD PRIMARY KEY (`weapon_id`);

--
-- Indizes für die Tabelle `weapons_bt_has_characters_jt`
--
ALTER TABLE `weapons_bt_has_characters_jt`
  ADD PRIMARY KEY (`weapons_bt_weapon_id`,`characters_character_id`) USING BTREE;

--
-- Indizes für die Tabelle `weapons_bt_has_droids_jt`
--
ALTER TABLE `weapons_bt_has_droids_jt`
  ADD PRIMARY KEY (`weapons_bt_weapon_id`,`droids_droid_id`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `characters`
--
ALTER TABLE `characters`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `droids`
--
ALTER TABLE `droids`
  MODIFY `droid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `weapons_bt`
--
ALTER TABLE `weapons_bt`
  MODIFY `weapon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
