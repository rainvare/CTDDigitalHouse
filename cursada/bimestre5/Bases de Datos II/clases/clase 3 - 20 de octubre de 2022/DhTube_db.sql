-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 26, 2021 at 05:41 PM
-- Server version: 10.2.36-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DHtube`
--
CREATE DATABASE IF NOT EXISTS `DHtube` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `DHtube`;

-- --------------------------------------------------------

--
-- Table structure for table `avatar`
--

CREATE TABLE `avatar` (
  `idAvatar` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `urlimagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `avatar`
--

INSERT INTO `avatar` (`idAvatar`, `nombre`, `urlimagen`) VALUES
(1, 'Luke Skywalker', 'https://www.google.com/search?q=Luke Skywalker+star+wars'),
(2, 'C-3PO', 'https://www.google.com/search?q=C-3PO+star+wars'),
(3, 'R2-D2', 'https://www.google.com/search?q=R2-D2+star+wars'),
(4, 'Darth Vader', 'https://www.google.com/search?q=Darth Vader+star+wars'),
(5, 'Leia Organa', 'https://www.google.com/search?q=Leia Organa+star+wars'),
(6, 'Owen Lars', 'https://www.google.com/search?q=Owen Lars+star+wars'),
(7, 'Beru Whitesun lars', 'https://www.google.com/search?q=Beru Whitesun lars+star+wars'),
(8, 'R5-D4', 'https://www.google.com/search?q=R5-D4+star+wars'),
(9, 'Biggs Darklighter', 'https://www.google.com/search?q=Biggs Darklighter+star+wars'),
(10, 'Obi-Wan Kenobi', 'https://www.google.com/search?q=Obi-Wan Kenobi+star+wars'),
(11, 'Anakin Skywalker', 'https://www.google.com/search?q=Anakin Skywalker+star+wars'),
(12, 'Wilhuff Tarkin', 'https://www.google.com/search?q=Wilhuff Tarkin+star+wars'),
(13, 'Chewbacca', 'https://www.google.com/search?q=Chewbacca+star+wars'),
(14, 'Han Solo', 'https://www.google.com/search?q=Han Solo+star+wars'),
(15, 'Greedo', 'https://www.google.com/search?q=Greedo+star+wars'),
(16, 'Jabba Desilijic Tiure', 'https://www.google.com/search?q=Jabba Desilijic Tiure+star+wars'),
(17, 'Wedge Antilles', 'https://www.google.com/search?q=Wedge Antilles+star+wars'),
(18, 'Jek Tono Porkins', 'https://www.google.com/search?q=Jek Tono Porkins+star+wars'),
(19, 'Yoda', 'https://www.google.com/search?q=Yoda+star+wars'),
(20, 'Palpatine', 'https://www.google.com/search?q=Palpatine+star+wars'),
(21, 'Boba Fett', 'https://www.google.com/search?q=Boba Fett+star+wars'),
(22, 'IG-88', 'https://www.google.com/search?q=IG-88+star+wars'),
(23, 'Bossk', 'https://www.google.com/search?q=Bossk+star+wars'),
(24, 'Lando Calrissian', 'https://www.google.com/search?q=Lando Calrissian+star+wars'),
(25, 'Lobot', 'https://www.google.com/search?q=Lobot+star+wars'),
(26, 'Ackbar', 'https://www.google.com/search?q=Ackbar+star+wars'),
(27, 'Mon Mothma', 'https://www.google.com/search?q=Mon Mothma+star+wars'),
(28, 'Arvel Crynyd', 'https://www.google.com/search?q=Arvel Crynyd+star+wars'),
(29, 'Wicket Systri Warrick', 'https://www.google.com/search?q=Wicket Systri Warrick+star+wars'),
(30, 'Nien Nunb', 'https://www.google.com/search?q=Nien Nunb+star+wars'),
(31, 'Qui-Gon Jinn', 'https://www.google.com/search?q=Qui-Gon Jinn+star+wars'),
(32, 'Nute Gunray', 'https://www.google.com/search?q=Nute Gunray+star+wars'),
(33, 'Finis Valorum', 'https://www.google.com/search?q=Finis Valorum+star+wars'),
(34, 'Jar Jar Binks', 'https://www.google.com/search?q=Jar Jar Binks+star+wars'),
(35, 'Roos Tarpals', 'https://www.google.com/search?q=Roos Tarpals+star+wars'),
(36, 'Rugor Nass', 'https://www.google.com/search?q=Rugor Nass+star+wars'),
(37, 'Watto', 'https://www.google.com/search?q=Watto+star+wars'),
(38, 'Sebulba', 'https://www.google.com/search?q=Sebulba+star+wars'),
(39, 'Quarsh Panaka', 'https://www.google.com/search?q=Quarsh Panaka+star+wars'),
(40, 'Shmi Skywalker', 'https://www.google.com/search?q=Shmi Skywalker+star+wars'),
(41, 'Darth Maul', 'https://www.google.com/search?q=Darth Maul+star+wars'),
(42, 'Bib Fortuna', 'https://www.google.com/search?q=Bib Fortuna+star+wars'),
(43, 'Ayla Secura', 'https://www.google.com/search?q=Ayla Secura+star+wars'),
(44, 'Dud Bolt', 'https://www.google.com/search?q=Dud Bolt+star+wars'),
(45, 'Gasgano', 'https://www.google.com/search?q=Gasgano+star+wars'),
(46, 'Ben Quadinaros', 'https://www.google.com/search?q=Ben Quadinaros+star+wars'),
(47, 'Mace Windu', 'https://www.google.com/search?q=Mace Windu+star+wars'),
(48, 'Ki-Adi-Mundi', 'https://www.google.com/search?q=Ki-Adi-Mundi+star+wars'),
(49, 'Kit Fisto', 'https://www.google.com/search?q=Kit Fisto+star+wars'),
(50, 'Eeth Koth', 'https://www.google.com/search?q=Eeth Koth+star+wars'),
(51, 'Adi Gallia', 'https://www.google.com/search?q=Adi Gallia+star+wars'),
(52, 'Saesee Tiin', 'https://www.google.com/search?q=Saesee Tiin+star+wars'),
(53, 'Yarael Poof', 'https://www.google.com/search?q=Yarael Poof+star+wars'),
(54, 'Plo Koon', 'https://www.google.com/search?q=Plo Koon+star+wars'),
(55, 'Mas Amedda', 'https://www.google.com/search?q=Mas Amedda+star+wars'),
(56, 'Gregar Typho', 'https://www.google.com/search?q=Gregar Typho+star+wars'),
(57, 'Cliegg Lars', 'https://www.google.com/search?q=Cliegg Lars+star+wars'),
(58, 'Poggle the Lesser', 'https://www.google.com/search?q=Poggle the Lesser+star+wars'),
(59, 'Luminara Unduli', 'https://www.google.com/search?q=Luminara Unduli+star+wars'),
(60, 'Barriss Offee', 'https://www.google.com/search?q=Barriss Offee+star+wars'),
(61, 'Dooku', 'https://www.google.com/search?q=Dooku+star+wars'),
(62, 'Bail Prestor Organa', 'https://www.google.com/search?q=Bail Prestor Organa+star+wars'),
(63, 'Jango Fett', 'https://www.google.com/search?q=Jango Fett+star+wars'),
(64, 'Zam Wesell', 'https://www.google.com/search?q=Zam Wesell+star+wars'),
(65, 'Dexter Jettster', 'https://www.google.com/search?q=Dexter Jettster+star+wars'),
(66, 'Lama Su', 'https://www.google.com/search?q=Lama Su+star+wars'),
(67, 'Taun We', 'https://www.google.com/search?q=Taun We+star+wars'),
(68, 'Jocasta Nu', 'https://www.google.com/search?q=Jocasta Nu+star+wars'),
(69, 'Ratts Tyerell', 'https://www.google.com/search?q=Ratts Tyerell+star+wars'),
(70, 'R4-P17', 'https://www.google.com/search?q=R4-P17+star+wars'),
(71, 'Wat Tambor', 'https://www.google.com/search?q=Wat Tambor+star+wars'),
(72, 'San Hill', 'https://www.google.com/search?q=San Hill+star+wars'),
(73, 'Shaak Ti', 'https://www.google.com/search?q=Shaak Ti+star+wars'),
(74, 'Grievous', 'https://www.google.com/search?q=Grievous+star+wars'),
(75, 'Tarfful', 'https://www.google.com/search?q=Tarfful+star+wars'),
(76, 'Raymus Antilles', 'https://www.google.com/search?q=Raymus Antilles+star+wars'),
(77, 'Sly Moore', 'https://www.google.com/search?q=Sly Moore+star+wars'),
(78, 'Tion Medon', 'https://www.google.com/search?q=Tion Medon+star+wars'),
(79, 'Finn', 'https://www.google.com/search?q=Finn+star+wars'),
(80, 'Rey', 'https://www.google.com/search?q=Rey+star+wars'),
(81, 'Poe Dameron', 'https://www.google.com/search?q=Poe Dameron+star+wars'),
(82, 'BB8', 'https://www.google.com/search?q=BB8+star+wars'),
(83, 'Captain Phasma', 'https://www.google.com/search?q=Captain Phasma+star+wars'),
(84, 'avDhTube', NULL),
(85, 'carita feliz', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `canal`
--

CREATE TABLE `canal` (
  `idCanal` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `canal`
--

INSERT INTO `canal` (`idCanal`, `nombre`, `descripcion`, `fechaCreacion`, `Usuario_idUsuario`) VALUES
(1, 'Aprender a Programar', 'Los mejores videos para comenzar en el mundo de la programacion', '2021-05-01 00:00:00', 2),
(2, 'Lo Mejor de la musica', 'Mis temas favoritos', '2021-03-15 00:00:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `etiqueta`
--

CREATE TABLE `etiqueta` (
  `idEtiqueta` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etiqueta`
--

INSERT INTO `etiqueta` (`idEtiqueta`, `nombre`) VALUES
(1, 'Mark Ronson'),
(2, 'vevo'),
(3, 'official'),
(4, 'video'),
(5, 'music video'),
(6, 'Mark Ronson Uptown Funk'),
(7, 'single'),
(8, 'album'),
(9, 'featuring Bruno Mars'),
(10, 'Uptown Funk'),
(11, 'Uptown Special'),
(12, 'pop'),
(13, 'Mark Ronson Uptown Funk Lyrics'),
(14, 'uptown funk'),
(15, 'MarkRonsonvevo'),
(16, 'bruno mars'),
(17, 'Mark Ronson & The Business Intl. official'),
(18, 'Mark Ronson Uptown Funk ft Bruno Mars'),
(19, 'Mark Ronson Uptown Funk official video'),
(20, 'Mark Ronson essentials'),
(21, 'Mark Ronson official video'),
(22, 'Bruno Mars Uptown Funk official video'),
(23, 'MARK'),
(24, 'FROM'),
(25, 'Ed Sheeran'),
(26, 'Shape Of You'),
(27, 'Ed Sheeran Shape Of You'),
(28, 'Shape Of You Song'),
(29, 'Ed Sheeran Official Video'),
(30, 'Shape Of You Official Video'),
(31, 'Ed Sheeran music'),
(32, 'Ed Sheeran Lyrics'),
(33, 'Shape Of You Lyrics'),
(34, 'Ed Sheeran 2017'),
(35, 'divide'),
(36, 'Ed Sheeran divide'),
(37, 'Ed Sheeran third album'),
(38, 'Ed Sheeran 3rd album'),
(39, 'Ed Sheeran songs'),
(40, 'Pop'),
(41, 'Pop Music'),
(42, 'Official Music Video'),
(43, 'Ed'),
(44, 'Sheeran'),
(45, 'Ed Sheerin'),
(46, 'EdSheeran'),
(47, 'Ed Sheran'),
(48, 'English Songs'),
(49, 'English Song'),
(50, 'i\'m in love with the shape of you'),
(51, 'i\'m in love with your body'),
(52, 'python tutorial'),
(53, 'python'),
(54, 'python for beginners'),
(55, 'python tutorial for beginners'),
(56, 'learn python'),
(57, 'python crash course'),
(58, 'python 2019'),
(59, 'python tutorial for beginners full'),
(60, 'python (programming language)'),
(61, 'python basics'),
(62, 'python course'),
(63, 'python from scratch'),
(64, 'python full course'),
(65, 'python language'),
(66, 'python programming'),
(67, 'python programming language'),
(68, 'python programming tutorial'),
(69, 'getting started with python'),
(70, 'learn python programming'),
(71, 'web development'),
(72, 'mosh hamedani'),
(73, 'machine learning'),
(74, 'python 2020'),
(75, 'sql'),
(76, 'sql tutorial'),
(77, 'sql course'),
(78, 'sql for beginners'),
(79, 'Structured Query Language'),
(80, 'sql course for beginners'),
(81, 'learn sql'),
(82, 'free sql course'),
(83, 'web development'),
(84, 'mysql'),
(85, 'mysql tutorial'),
(86, 'mysql course'),
(87, 'rdbms');

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`idPais`, `nombre`) VALUES
(1, 'Afganistán'),
(2, 'Albania'),
(3, 'Alemania'),
(4, 'Andorra'),
(5, 'Angola'),
(6, 'Antigua y Barbuda'),
(7, 'Arabia Saudita'),
(8, 'Argelia'),
(9, 'Argentina'),
(10, 'Armenia'),
(11, 'Australia'),
(12, 'Austria'),
(13, 'Azerbaiyán'),
(14, 'Bahamas'),
(15, 'Bahrein'),
(16, 'Bangladesh'),
(17, 'Barbados'),
(18, 'Belarús'),
(19, 'Belice'),
(20, 'Benin'),
(21, 'Bhután'),
(22, 'Bolivia (Estado Plurinacional de)'),
(23, 'Bosnia y Herzegovina'),
(24, 'Botswana'),
(25, 'Brasil'),
(26, 'Brunei Darussalam'),
(27, 'Bulgaria'),
(28, 'Burkina Faso'),
(29, 'Burundi'),
(30, 'Bélgica'),
(31, 'Cabo Verde'),
(32, 'Camboya'),
(33, 'Camerún'),
(34, 'Canadá'),
(35, 'Chad'),
(36, 'Chequia'),
(37, 'Chile'),
(38, 'China'),
(39, 'Chipre'),
(40, 'Colombia'),
(41, 'Comoras'),
(42, 'Congo'),
(43, 'Costa Rica'),
(44, 'Croacia'),
(45, 'Cuba'),
(46, 'Dinamarca'),
(47, 'Djibouti'),
(48, 'Dominica'),
(49, 'Ecuador'),
(50, 'Egipto'),
(51, 'El Salvador'),
(52, 'Emiratos Árabes Unidos'),
(53, 'Eritrea'),
(54, 'Eslovaquia'),
(55, 'Eslovenia'),
(56, 'España'),
(57, 'Estados Unidos de América'),
(58, 'Estonia'),
(59, 'Eswatini'),
(60, 'Etiopía'),
(61, 'Federación de Rusia'),
(62, 'Fiji'),
(63, 'Filipinas'),
(64, 'Finlandia'),
(65, 'Francia'),
(66, 'Gabón'),
(67, 'Gambia'),
(68, 'Georgia'),
(69, 'Ghana'),
(70, 'Granada'),
(71, 'Grecia'),
(72, 'Guatemala'),
(73, 'Guinea'),
(74, 'Guinea Ecuatorial'),
(75, 'Guinea-Bissau'),
(76, 'Guyana'),
(77, 'Haití'),
(78, 'Honduras'),
(79, 'Hungría'),
(80, 'India'),
(81, 'Indonesia'),
(82, 'Iraq'),
(83, 'Irlanda'),
(84, 'Irán (República Islámica del)'),
(85, 'Islandia'),
(86, 'Islas Cook'),
(87, 'Islas Feroe'),
(88, 'Islas Marshall'),
(89, 'Islas Salomón'),
(90, 'Israel'),
(91, 'Italia'),
(92, 'Jamaica'),
(93, 'Japón'),
(94, 'Jordania'),
(95, 'Kazajstán'),
(96, 'Kenya'),
(97, 'Kirguistán'),
(98, 'Kiribati'),
(99, 'Kuwait'),
(100, 'Lesotho'),
(101, 'Letonia'),
(102, 'Liberia'),
(103, 'Libia'),
(104, 'Lituania'),
(105, 'Luxemburgo'),
(106, 'Líbano'),
(107, 'Macedonia del Norte'),
(108, 'Madagascar'),
(109, 'Malasia'),
(110, 'Malawi'),
(111, 'Maldivas'),
(112, 'Malta'),
(113, 'Malí'),
(114, 'Marruecos'),
(115, 'Mauricio'),
(116, 'Mauritania'),
(117, 'Micronesia (Estados Federados de)'),
(118, 'Mongolia'),
(119, 'Montenegro'),
(120, 'Mozambique'),
(121, 'Myanmar'),
(122, 'México'),
(123, 'Mónaco'),
(124, 'Namibia'),
(125, 'Nauru'),
(126, 'Nepal'),
(127, 'Nicaragua'),
(128, 'Nigeria'),
(129, 'Niue'),
(130, 'Noruega'),
(131, 'Nueva Zelandia'),
(132, 'Níger'),
(133, 'Omán'),
(134, 'Pakistán'),
(135, 'Palau'),
(136, 'Panamá'),
(137, 'Papua Nueva Guinea'),
(138, 'Paraguay'),
(139, 'Países Bajos'),
(140, 'Perú'),
(141, 'Polonia'),
(142, 'Portugal'),
(143, 'Qatar'),
(144, 'Reino Unido de Gran Bretaña e Irlanda del Norte'),
(145, 'República Centroafricana'),
(146, 'República Democrática Popular Lao'),
(147, 'República Democrática del Congo'),
(148, 'República Dominicana'),
(149, 'República Popular Democrática de Corea'),
(150, 'República Unida de Tanzanía'),
(151, 'República de Corea'),
(152, 'República de Moldova'),
(153, 'República Árabe Siria'),
(154, 'Rumania'),
(155, 'Rwanda'),
(156, 'Saint Kitts y Nevis'),
(157, 'Samoa'),
(158, 'San Marino'),
(159, 'San Vicente y las Granadinas'),
(160, 'Santa Lucía'),
(161, 'Santo Tomé y Príncipe'),
(162, 'Senegal'),
(163, 'Serbia'),
(164, 'Seychelles'),
(165, 'Sierra Leona'),
(166, 'Singapur'),
(167, 'Somalia'),
(168, 'Sri Lanka'),
(169, 'Sudáfrica'),
(170, 'Sudán'),
(171, 'Sudán del Sur'),
(172, 'Suecia'),
(173, 'Suiza'),
(174, 'Suriname'),
(175, 'Tailandia'),
(176, 'Tayikistán'),
(177, 'Timor-Leste'),
(178, 'Togo'),
(179, 'Tokelau'),
(180, 'Tonga'),
(181, 'Trinidad y Tabago'),
(182, 'Turkmenistán'),
(183, 'Turquía'),
(184, 'Tuvalu'),
(185, 'Túnez'),
(186, 'Ucrania'),
(187, 'Uganda'),
(188, 'Uruguay'),
(189, 'Uzbekistán'),
(190, 'Vanuatu'),
(191, 'Venezuela'),
(192, 'Viet Nam'),
(193, 'Yemen'),
(194, 'Zambia'),
(195, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `idPlaylist` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `privado` tinyint(1) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`idPlaylist`, `nombre`, `fechaCreacion`, `privado`, `Usuario_idUsuario`) VALUES
(1, 'Para correr', '2021-01-29 00:00:00', 1, 15),
(2, 'Para Estudiar', '2021-05-31 00:00:00', 0, 4),
(3, 'Para Gym', '2021-04-04 00:00:00', 1, 6),
(4, 'Las mejores videos', '2021-02-14 00:00:00', 0, 9),
(5, 'Mis videos favoritos', '2021-05-03 00:00:00', 0, 7),
(6, 'Top 20', '2021-05-02 00:00:00', 0, 5),
(7, 'Mi top 10', '2021-01-21 00:00:00', 1, 15),
(8, 'Lo mejor del pop', '2021-04-30 00:00:00', 0, 14),
(9, 'Musica Latina', '2021-03-26 00:00:00', 0, 10),
(10, 'Rock', '2021-05-21 00:00:00', 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `playlist_video`
--

CREATE TABLE `playlist_video` (
  `Video_idVideo` int(11) NOT NULL,
  `Playlist_idPlaylist` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playlist_video`
--

INSERT INTO `playlist_video` (`Video_idVideo`, `Playlist_idPlaylist`) VALUES
(13, 7),
(17, 7),
(17, 3),
(10, 1),
(9, 5),
(3, 3),
(3, 9),
(14, 2),
(9, 9),
(15, 10),
(14, 7),
(13, 7),
(8, 6),
(13, 5),
(8, 6),
(14, 10),
(18, 8),
(13, 3),
(15, 6),
(3, 6),
(13, 10),
(11, 3),
(7, 5),
(15, 5),
(15, 1),
(19, 1),
(11, 8),
(20, 5),
(11, 6),
(5, 1),
(16, 1),
(16, 10),
(9, 3),
(4, 5),
(7, 9),
(13, 5),
(6, 1),
(1, 3),
(2, 7),
(9, 3),
(20, 9),
(14, 4),
(20, 6),
(7, 2),
(19, 4),
(18, 6),
(1, 10),
(8, 4),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `reaccion`
--

CREATE TABLE `reaccion` (
  `idReaccion` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `TipoReaccion_idTipoReaccion` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Video_idVideo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reaccion`
--

INSERT INTO `reaccion` (`idReaccion`, `fecha`, `TipoReaccion_idTipoReaccion`, `Usuario_idUsuario`, `Video_idVideo`) VALUES
(1, '2021-04-11 00:00:00', 1, 4, 6),
(2, '2021-05-13 00:00:00', 2, 14, 15),
(3, '2021-04-03 00:00:00', 2, 16, 8),
(4, '2021-05-18 00:00:00', 2, 8, 1),
(5, '2021-02-15 00:00:00', 2, 19, 8),
(6, '2021-03-20 00:00:00', 2, 18, 4),
(8, '2021-05-23 00:00:00', 1, 10, 5),
(9, '2021-03-30 00:00:00', 2, 3, 4),
(10, '2021-02-23 00:00:00', 1, 7, 14),
(11, '2021-02-19 00:00:00', 2, 15, 10),
(12, '2021-05-25 00:00:00', 2, 16, 10),
(13, '2021-05-01 00:00:00', 2, 8, 9),
(14, '2021-05-09 00:00:00', 2, 18, 11),
(15, '2021-05-29 00:00:00', 1, 13, 3),
(16, '2021-01-13 00:00:00', 2, 7, 20),
(17, '2021-03-11 00:00:00', 1, 3, 12),
(18, '2021-01-19 00:00:00', 1, 3, 11),
(20, '2021-01-04 00:00:00', 2, 12, 4),
(21, '2021-05-16 00:00:00', 1, 2, 14),
(22, '2021-04-25 00:00:00', 2, 13, 7),
(23, '2021-04-20 00:00:00', 2, 9, 10),
(24, '2021-02-15 00:00:00', 2, 19, 17),
(25, '2021-01-20 00:00:00', 2, 9, 4),
(26, '2021-03-09 00:00:00', 2, 16, 19),
(27, '2021-01-18 00:00:00', 1, 15, 16),
(28, '2021-01-20 00:00:00', 1, 9, 8),
(29, '2021-04-01 00:00:00', 1, 8, 18),
(31, '2021-05-09 00:00:00', 2, 18, 19),
(32, '2021-05-29 00:00:00', 2, 1, 20),
(35, '2021-01-16 00:00:00', 2, 13, 5),
(36, '2021-03-04 00:00:00', 2, 19, 1),
(37, '2021-04-20 00:00:00', 2, 15, 14),
(38, '2021-05-16 00:00:00', 2, 5, 4),
(39, '2021-05-17 00:00:00', 1, 6, 4),
(40, '2021-02-03 00:00:00', 1, 2, 16),
(42, '2021-01-28 00:00:00', 1, 18, 2),
(43, '2021-01-14 00:00:00', 2, 11, 14),
(46, '2021-05-09 00:00:00', 1, 8, 4),
(47, '2021-05-22 00:00:00', 2, 17, 3),
(48, '2021-03-05 00:00:00', 2, 7, 15),
(49, '2021-04-02 00:00:00', 1, 12, 11),
(50, '2021-03-22 00:00:00', 1, 5, 20),
(51, '2021-02-11 00:00:00', 2, 9, 2),
(52, '2021-02-04 00:00:00', 1, 12, 20),
(53, '2021-02-18 00:00:00', 1, 15, 20),
(56, '2021-02-22 00:00:00', 1, 17, 8),
(57, '2021-05-06 00:00:00', 2, 8, 13),
(58, '2021-05-24 00:00:00', 2, 19, 7),
(59, '2021-04-21 00:00:00', 2, 8, 17),
(61, '2021-04-29 00:00:00', 1, 10, 3),
(62, '2021-02-16 00:00:00', 1, 15, 17),
(63, '2021-05-24 00:00:00', 1, 1, 16),
(64, '2021-04-04 00:00:00', 2, 19, 18),
(65, '2021-05-10 00:00:00', 2, 19, 20),
(66, '2021-01-05 00:00:00', 2, 5, 19),
(67, '2021-05-04 00:00:00', 1, 7, 11),
(70, '2021-01-08 00:00:00', 2, 6, 10),
(71, '2021-04-06 00:00:00', 2, 2, 1),
(72, '2021-03-30 00:00:00', 1, 13, 16),
(73, '2021-02-04 00:00:00', 1, 14, 16),
(74, '2021-01-09 00:00:00', 2, 11, 16),
(75, '2021-05-22 00:00:00', 2, 10, 18),
(76, '2021-01-23 00:00:00', 2, 15, 6),
(77, '2021-01-29 00:00:00', 2, 11, 4),
(78, '2021-03-03 00:00:00', 1, 12, 12),
(79, '2021-03-03 00:00:00', 1, 11, 7),
(80, '2021-01-08 00:00:00', 1, 8, 7),
(81, '2021-04-27 00:00:00', 2, 17, 18),
(82, '2021-01-27 00:00:00', 2, 1, 18),
(83, '2021-04-18 00:00:00', 1, 18, 18),
(85, '2021-02-24 00:00:00', 2, 17, 17),
(86, '2021-02-25 00:00:00', 2, 5, 17),
(87, '2021-04-07 00:00:00', 2, 6, 18),
(88, '2021-02-14 00:00:00', 2, 9, 18),
(89, '2021-03-17 00:00:00', 1, 11, 20),
(90, '2021-05-01 00:00:00', 2, 3, 20),
(91, '2021-01-28 00:00:00', 1, 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tiporeaccion`
--

CREATE TABLE `tiporeaccion` (
  `idTipoReaccion` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tiporeaccion`
--

INSERT INTO `tiporeaccion` (`idTipoReaccion`, `nombre`) VALUES
(1, 'Like'),
(2, 'DisLike');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `codigoPostal` varchar(10) DEFAULT NULL,
  `Pais_idPais` int(11) NOT NULL,
  `Avatar_idAvatar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `email`, `password`, `fechaNacimiento`, `codigoPostal`, `Pais_idPais`, `Avatar_idAvatar`) VALUES
(1, 'MARIA ORTIZ', 'MORTIZ@gmail.com', 'ORTIZ!16', '1975-09-27 00:00:00', '1001', 9, 40),
(2, 'ISABEL BALLESTEROS', 'IBALLESTEROS@gmail.com', 'BALLESTEROS$93', '1987-10-17 00:00:00', '1001', 9, 69),
(3, 'CARMEN RAMIREZ', 'CRAMIREZ@gmail.com', 'RAMIREZ&88', '1994-08-26 00:00:00', '1001', 9, 65),
(4, 'MARIA PAULA GONZALEZ', 'MGONZALEZ@gmail.com', 'GONZALEZ!15', '1981-03-27 00:00:00', '118942', 25, 52),
(5, 'EMILY HERNANDEZ', NULL, 'HERNANDEZ$4', '2001-02-10 00:00:00', '118942', 25, 6),
(6, 'LUISA GOMEZ', 'LGOMEZ@gmail.com', 'GOMEZ&35', '1971-12-12 00:00:00', '118942', 25, 48),
(7, 'MARIA CARMEN SOSA', 'MSOSA@gmail.com', 'SO61', '1981-07-16 00:00:00', '3', 6, 72),
(8, 'MARY SMITH', 'MSMITH@gmail.com', 'SMITH#93', '2000-05-04 00:00:00', 'B24', 25, 48),
(9, 'PATRICIA SOTO', 'PSOTO@gmail.com', 'SOTO!93', '1974-07-12 00:00:00', '832 0000', 8, 72),
(10, 'ANTONIO GARCIA', 'AGARCIA@gmail.com', 'GARCIA!21', '1995-08-30 00:00:00', '1001', 9, 57),
(11, 'JOSE MARTINEZ', 'JMARTINEZ@gmail.com', 'MARTINEZ$16', '1987-11-22 00:00:00', '1001', 9, 70),
(12, 'FRANCISCO LOPEZ', 'FLOPEZ@gmail.com', 'LOPEZ&27', '1998-02-06 00:00:00', '1001', 9, 13),
(13, 'JUAN SANCHEZ', 'JSANCHEZ@gmail.com', 'SANCHEZ.60', '2003-03-23 00:00:00', '1001', 9, 51),
(14, 'MIGUEL ANGEL RODRIGUEZ', 'MRODRIGUEZ@gmail.com', 'RODRIGUEZ#38', '2003-10-16 00:00:00', '118942', 25, 54),
(15, 'JUAN ESTEBAN DIAZ', 'JDIAZ@gmail.com', 'DIAZ!93', '1973-05-23 00:00:00', '118942', 25, 43),
(16, 'JUAN SEBASTIAN LOPEZ', 'JLOPEZ@gmail.com', 'LOPEZ$56', '1974-03-15 00:00:00', '118942', 25, 57),
(17, 'SANTIAGO MARTINEZ', 'SMARTINEZ@gmail.com', 'MARTINEZ&33', '1977-07-18 00:00:00', '118942', 25, 76),
(18, 'DAVID RUBIO', 'DRUBIO@gmail.com', '12345', '2001-01-17 00:00:00', '60000', 3, 49),
(19, 'JHON WATSON', 'JWATSON@gmail.com', 'WATSON#81', '2003-10-22 00:00:00', '10029', 4, 65);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `idVideo` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `tamanio` double DEFAULT NULL,
  `nombreArchivo` varchar(100) DEFAULT NULL,
  `duracion` double DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `cantidadReproducciones` int(11) DEFAULT NULL,
  `cantidadLikes` int(11) DEFAULT NULL,
  `cantidadDislikes` int(11) DEFAULT NULL,
  `privado` smallint(6) DEFAULT NULL,
  `fechaPublicacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`idVideo`, `Usuario_idUsuario`, `titulo`, `descripcion`, `tamanio`, `nombreArchivo`, `duracion`, `imagen`, `cantidadReproducciones`, `cantidadLikes`, `cantidadDislikes`, `privado`, `fechaPublicacion`) VALUES
(1, 3, 'Shake It Off', 'Shake It Off” by Taylor Swift', 759727, 'shakeitoff.mp4', 613293, 'https://www.google.com/search?q=Shake It Off” by Taylor Swift', 897833, 8675, 348, 1, '2021-02-22 00:00:00'),
(2, 4, 'Faded', 'Faded by Alan Walker', 589666, 'faded.mp4', 696245, 'https://www.google.com/search?q=Faded by Alan Walker', 783045, 4466, 702, 0, '2021-03-02 00:00:00'),
(3, 17, 'Dark Horse', 'Dark Horse by Katy Perry', 572662, 'darkhorse.mp4', 649374, 'https://www.google.com/search?q=Dark Horse by Katy Perry', 615393, 5002, 380, 1, '2021-05-06 00:00:00'),
(4, 13, 'Thinking Out Loud', 'Thinking Out Loud by Ed Sheeran ', 731631, 'thinkingoutloud.mp4', 872349, 'https://www.google.com/search?q=Thinking Out Loud by Ed Sheeran ', 957013, 3234, 668, 1, '2021-03-17 00:00:00'),
(5, 9, 'Counting Stars', 'Counting Stars by OneRepublic', 614438, 'countingstars.mp4', 839763, 'https://www.google.com/search?q=Counting Stars by OneRepublic', 596800, 4809, 360, 0, '2021-01-01 00:00:00'),
(6, 17, 'Roar', 'Roar by Katy Perry ', 818041, 'roar.mp4', 776468, 'https://www.google.com/search?q=Roar by Katy Perry ', 95000, 100, 974, 0, '2021-01-29 00:00:00'),
(7, 15, 'Sorry', 'Sorry by Justin Bieber ', 243859, 'sorry.mp4', 273609, 'https://www.google.com/search?q=Sorry by Justin Bieber ', 991739, 1074, 342, 1, '2021-01-07 00:00:00'),
(8, 2, 'Sugar', 'Sugar by Maroon 5', 630640, 'sugar.mp4', 596714, 'https://www.google.com/search?q=Sugar by Maroon 5', 973108, 2572, 399, 0, '2021-01-31 00:00:00'),
(9, 2, 'Gangnam Style', 'Gangnam Style by Psy', 916901, 'gangnamstyle.mp4', 246858, 'https://www.google.com/search?q=Gangnam Style by Psy', 674100, 5101, 520, 1, '2021-03-30 00:00:00'),
(10, 2, 'Uptown Funk', 'Uptown Funk by Mark Ronson, featuring Bruno Mars', 988774, 'uptownfunk.mp4', 760646, 'https://www.google.com/search?q=Uptown Funk by Mark Ronson, featuring Bruno Mars', 507413, 1630, 356, 1, '2021-02-13 00:00:00'),
(11, 11, 'See You Again', 'See You Again by Wiz Khalifa, featuring Charlie Puth', 339806, 'seeyouagain.mp4', 915741, 'https://www.google.com/search?q=See You Again by Wiz Khalifa, featuring Charlie Puth', 879994, 9664, 583, 1, '2021-02-28 00:00:00'),
(12, 1, 'Shape of You', 'Shape of You by Ed Sheeran', 611333, 'shapeofyou.mp4', 131236, 'https://www.google.com/search?q=Shape of You by Ed Sheeran', 278514, 1663, 717, 0, '2021-03-03 00:00:00'),
(13, 15, 'Despacito', 'Despacito by Luis Fonsi, featuring Daddy Yankee', 304816, 'despacito.mp4', 731259, 'https://www.google.com/search?q=Despacito by Luis Fonsi, featuring Daddy Yankee', 584473, 3035, 441, 0, '2021-03-07 00:00:00'),
(14, 15, 'Python for beginners', 'Python for beginners', 702671, 'pythonforbeginners.mp4', 404345, 'https://www.google.com/search?q=Python for beginners', 269782, 2009, 607, 1, '2021-05-31 00:00:00'),
(15, 2, 'Tutorial de SQL 1', 'Tutorial de SQL 1', 771528, 'tutorialdesql.mp4', 713892, 'https://www.google.com/search?q=Tutorial de SQL 1', 952957, 7991, 461, 1, '2021-05-25 00:00:00'),
(16, 14, 'Tutorial de SQL 2', 'Tutorial de SQL 2', 401729, 'tutorialdesql.mp4', 940268, 'https://www.google.com/search?q=Tutorial de SQL 2', 703093, 6206, 806, 1, '2021-02-18 00:00:00'),
(17, 6, 'Tutorial de SQL 3', 'Tutorial de SQL 3', 381035, 'tutorialdesql.mp4', 902462, 'https://www.google.com/search?q=Tutorial de SQL 3', 246033, 6985, 524, 0, '2021-04-20 00:00:00'),
(18, 2, 'Programacion front end ', 'Programacion front end ', 815173, 'programacionfrontend.mp4', 846190, 'https://www.google.com/search?q=Programacion front end ', 455469, 4903, 672, 1, '2021-05-13 00:00:00'),
(19, 11, 'Programacion back end', 'Programacion back end', 518272, 'programacionbackend.mp4', 609856, 'https://www.google.com/search?q=Programacion back end', 885452, 1481, 881, 0, '2021-01-21 00:00:00'),
(20, 7, 'Eliminaciones Sudamericanas - Colombia vs Argentina 2021', 'Eliminaciones Sudamericanas - Colombia vs Argentina 2021 - Futbol fans', 544447, 'eliminacionessudamericanascolombiavsargentina.mp4', 574099, 'https://www.google.com/search?q=Eliminaciones Sudamericanas - Colombia vs Argentina 2021', 403719, 8667, 496, 1, '2020-04-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `video_etiqueta`
--

CREATE TABLE `video_etiqueta` (
  `Video_idVideo` int(11) NOT NULL,
  `Etiqueta_idEtiqueta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_etiqueta`
--

INSERT INTO `video_etiqueta` (`Video_idVideo`, `Etiqueta_idEtiqueta`) VALUES
(5, 80),
(1, 60),
(6, 73),
(14, 55),
(6, 11),
(6, 53),
(20, 43),
(17, 33),
(3, 75),
(13, 84),
(6, 68),
(17, 55),
(11, 73),
(1, 66),
(8, 82),
(18, 84),
(8, 42),
(15, 76),
(19, 34),
(12, 37),
(1, 84),
(19, 65),
(8, 79),
(8, 38),
(16, 65),
(5, 12),
(8, 63),
(6, 7),
(3, 2),
(13, 37),
(7, 70),
(8, 78),
(3, 56),
(8, 43),
(13, 8),
(11, 80),
(18, 81),
(11, 40),
(15, 19),
(15, 3),
(15, 16),
(7, 20),
(3, 78),
(8, 70),
(10, 56),
(10, 50),
(1, 14),
(15, 21),
(8, 55),
(19, 59),
(19, 82),
(9, 67),
(14, 10),
(5, 54),
(5, 23),
(18, 87),
(7, 37),
(3, 25),
(13, 13),
(13, 75),
(6, 56),
(17, 52),
(19, 5),
(19, 85),
(8, 14),
(8, 58),
(19, 73),
(10, 12),
(3, 34),
(6, 11),
(2, 22),
(11, 22),
(1, 14),
(18, 61),
(13, 73),
(16, 60),
(10, 51),
(15, 60),
(9, 82),
(13, 35),
(12, 51),
(2, 27),
(8, 43),
(2, 38),
(8, 41),
(9, 23),
(19, 5),
(16, 14),
(6, 40),
(18, 30),
(20, 39),
(2, 41),
(15, 75),
(16, 56),
(9, 79),
(8, 77),
(15, 85),
(11, 24),
(6, 45),
(16, 81),
(7, 30),
(5, 75),
(7, 7),
(3, 73),
(17, 81),
(14, 26),
(15, 85),
(9, 1),
(2, 82),
(19, 8),
(13, 6),
(14, 8),
(11, 36),
(18, 7),
(13, 54),
(7, 76),
(17, 85),
(3, 65),
(18, 43),
(20, 24),
(10, 83),
(12, 42),
(3, 22),
(3, 54),
(9, 15),
(5, 52),
(3, 5),
(8, 85),
(17, 28),
(16, 78),
(8, 46),
(9, 52),
(7, 69),
(5, 61),
(17, 22),
(18, 23),
(19, 18),
(17, 31),
(16, 25),
(14, 36),
(16, 5),
(17, 7),
(8, 75),
(7, 11),
(15, 32),
(5, 40),
(14, 72),
(12, 16),
(12, 53),
(9, 65),
(2, 42),
(4, 52),
(10, 50),
(19, 28),
(9, 31),
(12, 63),
(12, 13),
(19, 39),
(20, 75),
(12, 40),
(15, 44),
(3, 21),
(11, 48),
(16, 70),
(10, 35),
(8, 16),
(20, 70),
(1, 4),
(8, 7),
(9, 19),
(15, 48),
(3, 34),
(14, 58),
(4, 36),
(7, 51),
(16, 49),
(16, 55),
(16, 74),
(13, 35),
(20, 47),
(3, 19),
(1, 16),
(8, 9),
(4, 73),
(6, 10),
(15, 75),
(17, 39),
(16, 53),
(12, 22),
(6, 5),
(11, 68),
(14, 61),
(5, 60),
(15, 7),
(1, 30),
(18, 35),
(10, 65),
(9, 74),
(15, 80),
(18, 36),
(20, 56),
(13, 1),
(3, 2),
(4, 15),
(9, 6),
(14, 59),
(15, 47),
(2, 32),
(12, 36),
(18, 18),
(20, 81),
(1, 64),
(19, 48),
(11, 40),
(7, 6),
(14, 48),
(16, 77),
(20, 87),
(14, 57),
(1, 22),
(18, 87),
(10, 76),
(14, 30),
(2, 3),
(7, 30),
(7, 8),
(10, 55),
(2, 56),
(20, 29),
(8, 51),
(9, 22),
(20, 44),
(1, 4),
(9, 42),
(9, 46),
(18, 78),
(1, 54),
(4, 11),
(16, 74),
(14, 58),
(7, 64),
(14, 49),
(14, 24),
(9, 1),
(1, 21),
(7, 10),
(7, 14),
(5, 50),
(17, 50),
(10, 48),
(1, 34),
(6, 16),
(3, 84),
(9, 73),
(5, 25),
(14, 39),
(11, 85),
(12, 71),
(18, 22),
(11, 83),
(15, 22),
(20, 60),
(9, 58),
(3, 67),
(2, 5),
(16, 62),
(1, 37),
(18, 83),
(12, 32),
(19, 63),
(19, 15),
(8, 61),
(13, 6),
(1, 15),
(19, 54),
(9, 4),
(6, 1),
(5, 66),
(13, 10),
(18, 32),
(5, 8),
(11, 78),
(1, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`idAvatar`);

--
-- Indexes for table `canal`
--
ALTER TABLE `canal`
  ADD PRIMARY KEY (`idCanal`),
  ADD KEY `fk_Canal_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indexes for table `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`idEtiqueta`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`idPlaylist`),
  ADD KEY `fk_Playlist_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indexes for table `playlist_video`
--
ALTER TABLE `playlist_video`
  ADD KEY `fk_PlayList-Video_Video1_idx` (`Video_idVideo`),
  ADD KEY `fk_PlayList-Video_Playlist1_idx` (`Playlist_idPlaylist`);

--
-- Indexes for table `reaccion`
--
ALTER TABLE `reaccion`
  ADD PRIMARY KEY (`idReaccion`),
  ADD KEY `fk_Reaccion_TipoReaccion1_idx` (`TipoReaccion_idTipoReaccion`),
  ADD KEY `fk_Reaccion_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Reaccion_Video1_idx` (`Video_idVideo`);

--
-- Indexes for table `tiporeaccion`
--
ALTER TABLE `tiporeaccion`
  ADD PRIMARY KEY (`idTipoReaccion`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Pais1_idx` (`Pais_idPais`),
  ADD KEY `fk_Usuario_Avatar1_idx` (`Avatar_idAvatar`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`idVideo`),
  ADD KEY `fk_Video_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indexes for table `video_etiqueta`
--
ALTER TABLE `video_etiqueta`
  ADD KEY `fk_Video-Etiqueta_Video1_idx` (`Video_idVideo`),
  ADD KEY `fk_Video-Etiqueta_Etiqueta1_idx` (`Etiqueta_idEtiqueta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `idAvatar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `canal`
--
ALTER TABLE `canal`
  MODIFY `idCanal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `idEtiqueta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
  MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `idPlaylist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reaccion`
--
ALTER TABLE `reaccion`
  MODIFY `idReaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `tiporeaccion`
--
ALTER TABLE `tiporeaccion`
  MODIFY `idTipoReaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `idVideo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `canal`
--
ALTER TABLE `canal`
  ADD CONSTRAINT `fk_Canal_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Constraints for table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `fk_Playlist_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Constraints for table `playlist_video`
--
ALTER TABLE `playlist_video`
  ADD CONSTRAINT `fk_PlayList-Video_Playlist1` FOREIGN KEY (`Playlist_idPlaylist`) REFERENCES `playlist` (`idPlaylist`),
  ADD CONSTRAINT `fk_PlayList-Video_Video1` FOREIGN KEY (`Video_idVideo`) REFERENCES `video` (`idVideo`);

--
-- Constraints for table `reaccion`
--
ALTER TABLE `reaccion`
  ADD CONSTRAINT `fk_Reaccion_TipoReaccion1` FOREIGN KEY (`TipoReaccion_idTipoReaccion`) REFERENCES `tiporeaccion` (`idTipoReaccion`),
  ADD CONSTRAINT `fk_Reaccion_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `fk_Reaccion_Video1` FOREIGN KEY (`Video_idVideo`) REFERENCES `video` (`idVideo`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Avatar1` FOREIGN KEY (`Avatar_idAvatar`) REFERENCES `avatar` (`idAvatar`),
  ADD CONSTRAINT `fk_Usuario_Pais1` FOREIGN KEY (`Pais_idPais`) REFERENCES `pais` (`idPais`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `fk_Video_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Constraints for table `video_etiqueta`
--
ALTER TABLE `video_etiqueta`
  ADD CONSTRAINT `fk_Video-Etiqueta_Etiqueta1` FOREIGN KEY (`Etiqueta_idEtiqueta`) REFERENCES `etiqueta` (`idEtiqueta`),
  ADD CONSTRAINT `fk_Video-Etiqueta_Video1` FOREIGN KEY (`Video_idVideo`) REFERENCES `video` (`idVideo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
