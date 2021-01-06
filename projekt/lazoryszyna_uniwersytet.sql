-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 06 Sty 2021, 23:01
-- Wersja serwera: 10.0.28-MariaDB-2+b1
-- Wersja PHP: 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `lazoryszyna_uniwersytet`
--

DELIMITER $$
--
-- Procedury
--
$$

$$

$$

CREATE DEFINER=`lazoryszyna`@`%` PROCEDURE `Dodawanie studenta` (IN `imie` VARCHAR(50), IN `nazwisko` VARCHAR(50), IN `miasto` VARCHAR(40), IN `ulica` VARCHAR(40), IN `nr_bud` INT(10), IN `nr_mieszkania` INT(10), IN `data_ur` DATE, IN `PESEL` VARCHAR(11))  NO SQL
INSERT INTO `student`(`indeks`, `imie`, `nazwisko`, `miasto`, `ulica`, `nr_bud`, `nr_mieszkania`, `data_ur`, `wiek`, `PESEL`) VALUES (DEFAULT,@P0,@P1,@P2,@P3,@P4,@P5,@P6,(SELECT YEAR(NOW())-YEAR(@P6)),@P8)$$

$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akademik`
--

CREATE TABLE `akademik` (
  `id` int(11) NOT NULL,
  `nazwa_sk` varchar(5) COLLATE utf8_polish_ci DEFAULT NULL,
  `ulica` varchar(40) COLLATE utf8_polish_ci DEFAULT NULL,
  `nr_budynku` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `akademik`
--

INSERT INTO `akademik` (`id`, `nazwa_sk`, `ulica`, `nr_budynku`) VALUES
(1, 'DS1', 'Kolejowa', '21C'),
(3, 'DS2', 'Kolejowa', '21A'),
(4, 'DS3', 'Kolejowa', '21B'),
(5, 'DS4', 'Kolejowa', '21D'),
(6, 'DS5', 'Kolejowa', '21E'),
(7, 'DS6', 'Kolejowa', '20A'),
(8, 'DS7', 'Kolejowa', '20B'),
(9, 'DS8', 'Kolejowa', '20C'),
(10, 'DS9', 'Kolejowa', '20D'),
(11, 'DS10', 'Kolejowa', '20E');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Data zakwaterowania i wykwaterowania studenta`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Data zakwaterowania i wykwaterowania studenta` (
`imie` varchar(30)
,`nazwisko` varchar(50)
,`wiek` int(11)
,`Data_Zakwaterowania` date
,`Data_Wykwaterowania` date
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Data zakwaterowania studenta`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Data zakwaterowania studenta` (
`imie` varchar(30)
,`nazwisko` varchar(50)
,`indeks` int(11)
,`Data_zakwaterowania` date
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grupa`
--

CREATE TABLE `grupa` (
  `id` int(11) NOT NULL,
  `id_wydzialu` int(11) DEFAULT NULL,
  `rok` int(11) DEFAULT NULL,
  `grupa_d` int(11) DEFAULT NULL,
  `grupa_m` int(11) DEFAULT NULL,
  `id_student` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `grupa`
--

INSERT INTO `grupa` (`id`, `id_wydzialu`, `rok`, `grupa_d`, `grupa_m`, `id_student`) VALUES
(1, 1, 1, 1, 1, 2),
(2, 1, 1, 1, 1, 3),
(3, 1, 1, 2, 1, 4),
(4, 1, 1, 2, 1, 5),
(5, 1, 1, 2, 1, 6),
(6, 3, 1, 2, 2, 7),
(7, 3, 1, 2, 2, 8),
(8, 3, 2, 2, 2, 9),
(9, 4, 2, 3, 3, 32),
(10, 4, 2, 3, 3, 10),
(11, 4, 1, 3, 3, 11),
(12, 5, 3, 4, 4, 12),
(13, 5, 3, 4, 4, 13),
(14, 5, 3, 4, 4, 14),
(15, 11, 1, 4, 5, 15),
(16, 12, 2, 5, 5, 16),
(17, 11, 1, 5, 6, 17),
(18, 11, 1, 5, 7, 18),
(19, 14, 4, 5, 8, 19),
(20, 5, 4, 5, 8, 20),
(21, 3, 4, 5, 8, 21),
(22, 4, 1, 6, 9, 22),
(23, 5, 2, 6, 9, 23),
(24, 8, 2, 6, 9, 24),
(25, 10, 1, 6, 9, 25),
(26, 10, 1, 7, 4, NULL),
(27, 1, 1, 7, 4, 27),
(28, 1, 2, 7, 4, 28),
(29, 1, 3, 7, 4, 29),
(30, 2, 4, 8, 4, 30),
(31, 2, 2, 9, 1, 31),
(32, 1, 1, 1, 1, 33),
(33, 2, 2, 1, 1, 34),
(34, 3, 3, 2, 1, 35),
(35, 3, 2, 2, 1, 36),
(36, 4, 2, 2, 1, 37),
(37, 5, 3, 2, 2, 38),
(38, 6, 4, 2, 2, 39),
(39, 7, 4, 2, 2, 40),
(40, 8, 1, 3, 3, 41),
(41, 9, 3, 3, 3, 42),
(42, 10, 4, 3, 3, 43),
(43, 14, 1, 2, 3, 1);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Ilosc osob na grupe`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Ilosc osob na grupe` (
`grupa_d` int(11)
,`ilosc osób na grupe` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Ilosc Studnetow w Akademikach`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Ilosc Studnetow w Akademikach` (
`Akademik` varchar(5)
,`Ilość Studnetów` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Ilosc Studnetow w Miastach`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Ilosc Studnetow w Miastach` (
`nazwa` varchar(50)
,`Ilość studnetów` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Koszt warunku`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Koszt warunku` (
`nazwa` varchar(50)
,`Koszt warunku` double
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Maksymalna i minimalna cena/h`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Maksymalna i minimalna cena/h` (
`Maksymalna cena/h` double
,`Minimalna cena/h` double
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miasta`
--

CREATE TABLE `miasta` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `miasta`
--

INSERT INTO `miasta` (`id`, `nazwa`) VALUES
(5, 'Bartoszyce'),
(3, 'Gdynia'),
(4, 'Giżycko'),
(8, 'Górowo'),
(9, 'Kraków'),
(2, 'Lidzbark'),
(1, 'Lublin'),
(10, 'Łódź'),
(12, 'Morąg'),
(6, 'Moskwa'),
(7, 'Olsztyn'),
(13, 'Poznań'),
(14, 'Włodawa'),
(11, 'Wrocław');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Ocena i rodzaj oceny studenta`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Ocena i rodzaj oceny studenta` (
`indeks` int(11)
,`imie` varchar(30)
,`nazwisko` varchar(50)
,`ocena` enum('2','2.5','3','3.5','4','4.5','5')
,`nazwa` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `id` int(11) NOT NULL,
  `id_student` int(11) DEFAULT NULL,
  `id_przedmiot` int(11) DEFAULT NULL,
  `id_rodzaj_oceny` int(11) NOT NULL,
  `ocena` enum('2','2.5','3','3.5','4','4.5','5') COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `oceny`
--

INSERT INTO `oceny` (`id`, `id_student`, `id_przedmiot`, `id_rodzaj_oceny`, `ocena`) VALUES
(1, 15, 10, 3, '2'),
(2, 11, 9, 1, '3'),
(3, 10, 10, 3, '4'),
(4, 40, 4, 1, '3'),
(5, 19, 2, 1, '5'),
(6, 24, 10, 3, '5'),
(7, 45, 7, 1, '3.5'),
(8, 22, 10, 1, '4'),
(9, 14, 3, 1, '2'),
(10, 6, 4, 1, '3.5'),
(11, 44, 10, 3, '5'),
(12, 44, 10, 1, '5'),
(13, 44, 12, 1, '2'),
(14, 44, 1, 1, '2'),
(15, 21, 9, 7, '4'),
(16, 24, 9, 2, '3'),
(17, 10, 1, 1, '2.5'),
(18, 10, 1, 1, '2.5'),
(19, 11, 2, 1, '3'),
(20, 16, 3, 1, '5'),
(21, 14, 4, 1, '4'),
(22, 18, 4, 1, '3'),
(23, 22, 4, 1, '2'),
(24, 19, 5, 1, '4'),
(25, 20, 6, 1, '4'),
(26, 12, 7, 1, '3.5'),
(27, 16, 7, 1, '4.5'),
(28, 18, 7, 1, '5'),
(29, 19, 8, 1, '2'),
(30, 25, 9, 1, '2'),
(31, 28, 10, 1, '2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `plan_zajec`
--

CREATE TABLE `plan_zajec` (
  `id` int(11) NOT NULL,
  `id_grupa` int(11) DEFAULT NULL,
  `id_przedmiot` int(11) DEFAULT NULL,
  `godz_rozpoczecia` time DEFAULT NULL,
  `godz_zakonczenia` time DEFAULT NULL,
  `data_zaplanowana` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `plan_zajec`
--

INSERT INTO `plan_zajec` (`id`, `id_grupa`, `id_przedmiot`, `godz_rozpoczecia`, `godz_zakonczenia`, `data_zaplanowana`) VALUES
(1, 1, 1, '08:15:00', '10:30:00', NULL),
(2, 2, 2, '08:15:00', '10:30:00', NULL),
(3, 3, 3, '09:15:00', '11:30:00', NULL),
(4, 4, 4, '08:25:00', '10:20:00', NULL),
(5, 5, 5, '09:00:00', '11:30:00', NULL),
(6, 6, 6, '11:00:00', '13:00:00', NULL),
(7, 7, 7, '09:15:00', '10:30:00', NULL),
(8, 8, 8, '14:00:00', '15:30:00', NULL),
(9, 9, 9, '08:15:00', '10:30:00', NULL),
(10, 10, 10, '08:15:00', '10:30:00', NULL),
(11, 11, 11, '12:15:00', '10:00:00', NULL),
(12, 12, 12, '09:45:00', '11:15:00', NULL),
(13, 13, 13, '08:15:00', '10:20:00', NULL),
(14, 14, 12, '15:15:00', '17:30:00', NULL),
(15, 15, 11, '07:15:00', '10:30:00', NULL),
(16, 16, 10, '10:15:00', '11:00:00', NULL),
(17, 17, 9, '08:15:00', '10:00:00', NULL),
(18, 18, 8, '08:15:00', '10:00:00', NULL),
(19, 19, 1, '08:00:00', '10:00:00', NULL),
(20, 20, 6, '08:45:00', '10:45:00', NULL),
(21, 21, 3, '08:15:00', '10:30:00', NULL),
(22, 22, 8, '09:15:00', '10:10:00', NULL);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Prowadzący przedmiotu`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Prowadzący przedmiotu` (
`nazwa` varchar(50)
,`imie` varchar(30)
,`nazwisko` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `id_wykladowca` int(11) DEFAULT NULL,
  `pkt_ECTS` int(11) DEFAULT NULL,
  `cena` float DEFAULT NULL,
  `ilosc_godzin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `przedmioty`
--

INSERT INTO `przedmioty` (`id`, `nazwa`, `id_wykladowca`, `pkt_ECTS`, `cena`, `ilosc_godzin`) VALUES
(1, 'Elementy Algebry i Geometrii Analitycznej', 1, 5, 88, 30),
(2, 'Matematyka Dyskretna', 1, 5, 110, 30),
(3, 'Programy użytkowe', 1, 2, 25, 30),
(4, 'Podstawy logiki i teori mnogośći', 2, 4, 40, 25),
(5, 'Podstawy logiki i teori mnogośći wykład', 2, 4, 40, 25),
(6, 'Wstęp do programowania wykład', 3, 4, 30, 25),
(7, 'Wstęp do programowania', 5, 5, 60, 30),
(8, 'Bazy danych wykład', 4, 4, 50, 25),
(9, 'Bazy danych', 6, 5, 40, 30),
(10, 'Filozofia', 7, 3, 25, 20),
(11, 'Praktyczna filozofia przyrody', 1, 3, 25, 20),
(12, 'Repetytorium matematyki elementarnej', 9, 5, 60, 30),
(13, 'Elementy algebry i geometrii analitycznej wykład', 1, 5, 80, 35);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rachunek`
--

CREATE TABLE `rachunek` (
  `ID` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `id_przedmiot` int(11) NOT NULL,
  `Koszt` float DEFAULT NULL,
  `Data_wplaty` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rachunek`
--

INSERT INTO `rachunek` (`ID`, `id_student`, `id_przedmiot`, `Koszt`, `Data_wplaty`) VALUES
(1, 15, 10, 500, '2019-06-10'),
(2, 14, 3, 750, '2020-12-10'),
(3, 44, 12, 1800, '2017-05-12'),
(4, 44, 1, 2640, '2019-04-22'),
(5, 10, 1, 2640, '2019-10-10'),
(6, 10, 1, 2640, '2015-06-07'),
(7, 22, 4, 1000, '2012-12-12'),
(8, 19, 8, 1250, '2016-12-10'),
(9, 25, 9, 1200, '2020-06-10'),
(10, 28, 10, 500, '2020-12-10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_oceny`
--

CREATE TABLE `rodzaj_oceny` (
  `ID` int(11) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rodzaj_oceny`
--

INSERT INTO `rodzaj_oceny` (`ID`, `nazwa`) VALUES
(3, 'Aktywność'),
(4, 'Egzamin I temin'),
(5, 'Egzamin II temin'),
(6, 'Egzamin III temin'),
(1, 'Kolokwium'),
(7, 'Projekt Naukowy'),
(2, 'Sprawdzian');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Srednia ocen studentow`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Srednia ocen studentow` (
`indeks` int(11)
,`imie` varchar(30)
,`nazwisko` varchar(50)
,`srednia ocen` decimal(7,4)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `student`
--

CREATE TABLE `student` (
  `indeks` int(11) NOT NULL,
  `imie` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `miasto` int(11) NOT NULL,
  `ulica` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nr_bud` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `nr_mieszkania` int(11) DEFAULT NULL,
  `data_ur` date DEFAULT NULL,
  `wiek` int(11) DEFAULT NULL,
  `PESEL` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `student`
--

INSERT INTO `student` (`indeks`, `imie`, `nazwisko`, `miasto`, `ulica`, `nr_bud`, `nr_mieszkania`, `data_ur`, `wiek`, `PESEL`) VALUES
(1, 'Marek', 'Masalski', 1, 'Słoneczna', '25', 8, '1998-05-06', 24, '65476548764'),
(2, 'Nikola', 'Urbanowicz', 2, 'Poniatowskiego', '10', 2, '1980-02-23', 44, '43658732996'),
(3, 'Julia', 'Stankiewicz', 3, 'Immanuela Kanta', '1', 1, '1995-03-05', 28, '65443348764'),
(4, 'Marcin', 'Bogusław', 4, 'Kwiatowa', '11', 4, '1992-12-06', 31, '65478855764'),
(5, 'Padryg', 'Lawankowsk', 5, 'Kopernika', '5', 5, '1999-12-06', 23, '65471122764'),
(6, 'Mariusz', 'Zabijaka', 6, 'Vodyka', '1', 1, '1970-05-11', 55, '65472233464'),
(7, 'Piotrek', 'Duda', 7, 'Słoneczna', '15', 5, '1996-04-16', 26, '65777748764'),
(8, 'Marek', 'Piszewski', 8, 'Miasteczkowa', '5', 4, '2000-03-13', 22, '65333348764'),
(9, 'Marta', 'Liseł', 9, 'Kajki', '5', 2, '1997-05-06', 25, '65123448764'),
(10, 'Dominika', 'Sawicka', 10, 'Lipowa', '4', NULL, '1979-06-11', 45, '65544236664'),
(11, 'Adam', 'Piotrowski', 11, 'Kijowska', '2', 1, '1999-01-01', 23, '12121212123'),
(12, 'Marcin', 'Duda', 7, 'Dworcowa', '33', 16, '1999-09-14', 23, '99091456321'),
(13, 'Franek', 'Piotrowski', 11, 'Kijowska', '2', 1, '1993-01-01', 30, '12121212123'),
(14, 'Oliwia', 'Piotrowska', 9, 'Kolejowa', '4', 2, '2000-03-01', 22, '13547612123'),
(15, 'Adrian', 'Duda', 7, 'Wojska Polskiego', '2', 1, '1975-02-14', 50, '25479562123'),
(16, 'Adrian', 'Duda', 7, 'Subirakow', '10', 1, '1997-05-16', 25, '12121234343'),
(17, 'Julia', 'Grzelak ', 11, 'Ignacego Krasickiego', '25', 1, '1998-02-17', 24, '12126486023'),
(18, 'Adrian', 'Duda', 7, 'Żołnierska', '12', NULL, '1999-03-12', 23, '99031246539'),
(19, 'Jan', 'Wójcik', 12, 'Żołnierska', '17', 1, '1999-05-23', 23, '99052318574'),
(20, 'Maja', 'Leśniak', 11, 'Obozowa', '8', 12, '1998-08-29', 24, '12121266663'),
(21, 'Andrzej', 'Majchrzak', 11, 'Ogrodowa', '29', 2, '1999-06-13', 44, '12121213333'),
(22, 'Maja', 'Barańska', 10, 'Opolska', '23', 4, '1999-08-16', 23, '12321212123'),
(23, 'Piotr', 'Duda', 7, 'Bolesława Prusa', '26', 2, '1997-08-17', 25, '55521212123'),
(24, 'Bartek', 'Morawski', 13, 'Lipowa', '11', 1, '1998-06-06', 24, '66661212123'),
(25, 'Konrad', 'Kazmierczak', 14, 'Hoża', '34', 9, '1980-12-12', 44, '12777712123'),
(27, 'Wiktoria', 'Przybylska', 11, 'Bartoszycka', '16', 1, '1999-12-08', 23, '99921212123'),
(28, 'Adrian', 'Duda', 7, 'Bartoszycka', '2', 404, '1995-03-14', 28, '68060994932'),
(29, 'Adrian', 'Duda', 7, 'Hoża', '3', 8, '1995-06-21', 28, '53052147272'),
(30, 'Adrian', 'Duda', 7, 'Żołnierska', '33', NULL, '1995-08-02', 28, '57031939236'),
(31, 'Bartosz', 'Duda', 7, 'Żołnierska', '86', 45, '1995-08-18', 28, '55082573111'),
(32, 'Adrian', 'Duda', 7, 'Ignacego Krasickiego', '6', 7, '1995-08-21', 28, '71120748738'),
(33, 'Adam', 'Polakowski', 7, 'Dworcowa', '25', 8, '1995-11-24', 28, '00250492756'),
(34, 'Kamil', 'Jankowski', 7, 'Subirakow', '1', 21, '1999-02-26', 23, '69110447657'),
(35, 'Marek', 'Kowalkowski', 7, 'Dworcowa', '24', 44, '1999-11-23', 23, '99110662659'),
(36, 'Adrian', 'Duda', 7, 'Dworcowa', '55', 87, '2000-05-10', 22, '74041472555'),
(37, 'Adrian', 'Duda', 7, 'Ignacego Krasickiego', '17', 66, '2001-09-12', 21, '67072423319'),
(38, 'Daniel', 'Duda', 7, 'Subirakow', '2', 4, '1999-06-24', 23, '48052248733'),
(39, 'Marcin', 'Duda', 7, 'Dworcowa', '8', 1, '1998-08-13', 24, '02312253677'),
(40, 'Dawid', 'Duda', 7, 'Ignacego Krasickiego', '44', 2, '1997-11-04', 25, '74041117339'),
(41, 'Marian', 'Duda', 7, 'Dworcowa', '303', 1, '2000-01-27', 22, '64122677418'),
(42, 'Piotr', 'Antoszkiewicz', 7, 'Dworcowa', '105', 404, '2001-11-12', 21, '66121243597'),
(43, 'Marek', 'Kowalski', 7, 'Dworcowa', '4', 23, '2001-09-12', 21, '53040912398'),
(44, 'Janusz', 'Kowaelki', 1, 'Słoneczna', '23', 25, '1998-01-03', 24, '12333322222'),
(45, 'Magda', 'Szczacor', 2, 'Astro', '22', 1, '1992-02-02', 30, '12323232322');

--
-- Wyzwalacze `student`
--
DELIMITER $$
CREATE TRIGGER `Zapisywanie Danych` BEFORE UPDATE ON `student` FOR EACH ROW INSERT INTO `zmiany_danych_student` (`indeks`, `imie`, `nazwisko`, `miasto`, `ulica`, `nr_bud`, `nr_mieszkania`, `data_ur`, `wiek`, `PESEL`) VALUES (old.`indeks`, old.`imie`, old.`nazwisko`, old.`miasto`, old.`ulica`, old.`nr_bud`, old.`nr_mieszkania`, old.`data_ur`, old.`wiek`, old.`PESEL`)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydzial`
--

CREATE TABLE `wydzial` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwa_skr` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wydzial`
--

INSERT INTO `wydzial` (`id`, `nazwa`, `nazwa_skr`) VALUES
(1, 'Wydział Matematyki i Informatyki', 'WMiI'),
(2, 'Wydział Biologi i Biotechnologii', 'WBiB'),
(3, 'Wydział Geoinżynierii', 'WG'),
(4, 'Wydział Bioinżynierii Zwierząt', 'WBZ'),
(5, 'Wydział Nauk Społecznych', 'WNS'),
(6, 'Wydział Humanistyczny', 'WH'),
(7, 'Wydział Lekarski', 'WL'),
(8, 'Wydział Medycyny Weterynaryjnej', 'WMW'),
(9, 'Wydział Nauk Ekonomicznych', 'WNE'),
(10, 'Wydział Nauk Technicznych', 'WNT'),
(11, 'Szkoła Zdrowia Publicznego', 'SZP'),
(12, 'Wydział Nauki o Żywności', 'WNoŻ'),
(13, 'Wydział Nauk o Środowisku', 'WNoŚ'),
(14, 'Wydział Prawa i Administracji', 'WPiA'),
(15, 'Wydział Sztuki', 'WS');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wykladowca`
--

CREATE TABLE `wykladowca` (
  `id` int(11) NOT NULL,
  `imie` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `PESEL` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL,
  `id_wydzial` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wykladowca`
--

INSERT INTO `wykladowca` (`id`, `imie`, `nazwisko`, `PESEL`, `id_wydzial`) VALUES
(1, 'Jan', 'Kowalski', '12345678911', 1),
(2, 'Magda', 'Kowalska', '22225567654', 1),
(3, 'Łukasz', 'Baran', '12225567654', 3),
(4, 'Helena', 'Rogowska', '32445457654', 2),
(5, 'Julia', 'Woźniak', '42488777654', 1),
(6, 'Andrzej', 'Lipiński', '52665567654', 4),
(7, 'Jakub', 'Król', '62434367654', 2),
(9, 'Szymon', 'Andrzejewski', '82666667654', 8),
(10, 'Dominika', 'Michalska', '12445333354', 4),
(11, 'Agata', 'Nowak', '12445444454', 3),
(12, 'Magda', 'Mickiewicz', '22222567654', 9),
(13, 'Aleksander', 'Wiśniewski', '12455437654', 1),
(14, 'Pola', 'Murszałek', '12488877654', 9),
(15, 'Daniel', 'Kucharski', '12346832058', 1);

--
-- Wyzwalacze `wykladowca`
--
DELIMITER $$
CREATE TRIGGER `Zmiana Wykładowcy` BEFORE DELETE ON `wykladowca` FOR EACH ROW UPDATE przedmioty SET id_wykladowca=1 WHERE id_wykladowca=old.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zakwaterowanie`
--

CREATE TABLE `zakwaterowanie` (
  `id` int(11) NOT NULL,
  `id_student` int(11) DEFAULT NULL,
  `id_akademik` int(11) DEFAULT NULL,
  `nr_pokoju` int(11) DEFAULT NULL,
  `nr_pietra` int(11) DEFAULT NULL,
  `Data_zakwaterowania` date NOT NULL,
  `Data_wykwaterowania` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zakwaterowanie`
--

INSERT INTO `zakwaterowanie` (`id`, `id_student`, `id_akademik`, `nr_pokoju`, `nr_pietra`, `Data_zakwaterowania`, `Data_wykwaterowania`) VALUES
(1, 1, 1, 1, 1, '2020-11-24', '2020-11-27'),
(2, 2, 1, 2, 2, '2017-11-24', '2020-11-27'),
(3, 3, 1, 3, 2, '2017-11-24', '2020-03-03'),
(4, 4, 1, 3, 3, '2020-11-24', '2020-11-27'),
(5, 14, 5, 31, 2, '2020-11-24', '2020-11-27'),
(6, 11, 4, 23, 5, '2020-11-24', '2020-11-25'),
(7, 12, 3, 14, 3, '2020-11-24', '2020-11-28'),
(8, 18, 5, 2, 7, '2020-11-24', '2020-11-19'),
(9, 22, 5, 55, 1, '2017-11-24', '2019-09-04'),
(10, 41, 4, 23, 5, '2020-11-24', '2020-11-27'),
(11, 15, 3, 20, 2, '2020-11-24', '2020-11-27'),
(15, 6, 3, 20, 1, '2020-06-20', '2020-10-15'),
(16, 7, 5, 25, 2, '2020-02-20', '2020-06-06'),
(17, 8, 3, 40, 4, '2020-05-15', '2020-07-18'),
(19, 10, 5, 15, 1, '2020-08-14', '2020-10-10'),
(20, 16, 3, 14, 1, '2020-08-22', '2020-10-25'),
(21, 19, 4, 44, 4, '2020-02-25', '2020-11-20'),
(22, 20, 5, 35, 3, '2020-01-28', '2020-02-20'),
(23, 25, 6, 66, 6, '2020-06-30', '2020-08-20');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Zakwaterowanie studenta w akademiku w wieku 22 lat`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Zakwaterowanie studenta w akademiku w wieku 22 lat` (
`id` int(11)
,`id_student` int(11)
,`id_akademik` int(11)
,`nr_pokoju` int(11)
,`nr_pietra` int(11)
,`Data_zakwaterowania` date
,`Data_wykwaterowania` date
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `Zakwaterowanie studenta w akademiku z nazwiskiem na K`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `Zakwaterowanie studenta w akademiku z nazwiskiem na K` (
`imie` varchar(30)
,`nazwisko` varchar(50)
,`nazwa skrocona` varchar(5)
,`ulica` varchar(40)
,`nr_budynku` varchar(15)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zmiany_danych_student`
--

CREATE TABLE `zmiany_danych_student` (
  `indeks` int(11) NOT NULL,
  `imie` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `miasto` int(11) NOT NULL,
  `ulica` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nr_bud` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `nr_mieszkania` int(11) DEFAULT NULL,
  `data_ur` date DEFAULT NULL,
  `wiek` int(11) DEFAULT NULL,
  `PESEL` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zmiany_danych_student`
--

INSERT INTO `zmiany_danych_student` (`indeks`, `imie`, `nazwisko`, `miasto`, `ulica`, `nr_bud`, `nr_mieszkania`, `data_ur`, `wiek`, `PESEL`) VALUES
(8, 'Marek', 'Piszewski', 8, 'Miasteczkowa', '2', 4, '2000-03-13', 22, '65333348764'),
(9, 'Marta', 'Lis', 9, 'Kajki', '5', 2, '1997-05-06', 25, '65123448764');

-- --------------------------------------------------------

--
-- Struktura widoku `Data zakwaterowania i wykwaterowania studenta`
--
DROP TABLE IF EXISTS `Data zakwaterowania i wykwaterowania studenta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Data zakwaterowania i wykwaterowania studenta`  AS  select `s`.`imie` AS `imie`,`s`.`nazwisko` AS `nazwisko`,`s`.`wiek` AS `wiek`,`z`.`Data_zakwaterowania` AS `Data_Zakwaterowania`,`z`.`Data_wykwaterowania` AS `Data_Wykwaterowania` from (`student` `s` join `zakwaterowanie` `z` on((`s`.`indeks` = `z`.`id`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `Data zakwaterowania studenta`
--
DROP TABLE IF EXISTS `Data zakwaterowania studenta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Data zakwaterowania studenta`  AS  select `student`.`imie` AS `imie`,`student`.`nazwisko` AS `nazwisko`,`student`.`indeks` AS `indeks`,`zakwaterowanie`.`Data_zakwaterowania` AS `Data_zakwaterowania` from (`zakwaterowanie` join `student` on((`zakwaterowanie`.`id_student` = `student`.`indeks`))) order by `student`.`indeks` ;

-- --------------------------------------------------------

--
-- Struktura widoku `Ilosc osob na grupe`
--
DROP TABLE IF EXISTS `Ilosc osob na grupe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Ilosc osob na grupe`  AS  select `grupa`.`grupa_d` AS `grupa_d`,count(0) AS `ilosc osób na grupe` from `grupa` group by `grupa`.`grupa_d` ;

-- --------------------------------------------------------

--
-- Struktura widoku `Ilosc Studnetow w Akademikach`
--
DROP TABLE IF EXISTS `Ilosc Studnetow w Akademikach`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Ilosc Studnetow w Akademikach`  AS  select `akademik`.`nazwa_sk` AS `Akademik`,count(`zakwaterowanie`.`id_student`) AS `Ilość Studnetów` from (`zakwaterowanie` join `akademik` on((`zakwaterowanie`.`id_akademik` = `akademik`.`id`))) group by `zakwaterowanie`.`id_akademik` order by count(`zakwaterowanie`.`id_student`) desc ;

-- --------------------------------------------------------

--
-- Struktura widoku `Ilosc Studnetow w Miastach`
--
DROP TABLE IF EXISTS `Ilosc Studnetow w Miastach`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Ilosc Studnetow w Miastach`  AS  select `miasta`.`nazwa` AS `nazwa`,count(`student`.`miasto`) AS `Ilość studnetów` from (`miasta` join `student` on((`student`.`miasto` = `miasta`.`id`))) group by `student`.`miasto` order by count(`student`.`miasto`) desc ;

-- --------------------------------------------------------

--
-- Struktura widoku `Koszt warunku`
--
DROP TABLE IF EXISTS `Koszt warunku`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Koszt warunku`  AS  select `przedmioty`.`nazwa` AS `nazwa`,(`przedmioty`.`cena` * `przedmioty`.`ilosc_godzin`) AS `Koszt warunku` from `przedmioty` ;

-- --------------------------------------------------------

--
-- Struktura widoku `Maksymalna i minimalna cena/h`
--
DROP TABLE IF EXISTS `Maksymalna i minimalna cena/h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Maksymalna i minimalna cena/h`  AS  select max((`przedmioty`.`cena` * `przedmioty`.`ilosc_godzin`)) AS `Maksymalna cena/h`,min((`przedmioty`.`cena` * `przedmioty`.`ilosc_godzin`)) AS `Minimalna cena/h` from `przedmioty` ;

-- --------------------------------------------------------

--
-- Struktura widoku `Ocena i rodzaj oceny studenta`
--
DROP TABLE IF EXISTS `Ocena i rodzaj oceny studenta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Ocena i rodzaj oceny studenta`  AS  select `student`.`indeks` AS `indeks`,`student`.`imie` AS `imie`,`student`.`nazwisko` AS `nazwisko`,`oceny`.`ocena` AS `ocena`,`rodzaj_oceny`.`nazwa` AS `nazwa` from ((`oceny` join `student` on((`oceny`.`id_student` = `student`.`indeks`))) join `rodzaj_oceny` on((`oceny`.`id_rodzaj_oceny` = `rodzaj_oceny`.`ID`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `Prowadzący przedmiotu`
--
DROP TABLE IF EXISTS `Prowadzący przedmiotu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Prowadzący przedmiotu`  AS  select `przedmioty`.`nazwa` AS `nazwa`,`wykladowca`.`imie` AS `imie`,`wykladowca`.`nazwisko` AS `nazwisko` from (`przedmioty` join `wykladowca` on((`przedmioty`.`id_wykladowca` = `wykladowca`.`id`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `Srednia ocen studentow`
--
DROP TABLE IF EXISTS `Srednia ocen studentow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Srednia ocen studentow`  AS  select `student`.`indeks` AS `indeks`,`student`.`imie` AS `imie`,`student`.`nazwisko` AS `nazwisko`,avg(`oceny`.`ocena`) AS `srednia ocen` from (`student` join `oceny`) where (`oceny`.`id_student` = `student`.`indeks`) group by `oceny`.`id_student` ;

-- --------------------------------------------------------

--
-- Struktura widoku `Zakwaterowanie studenta w akademiku w wieku 22 lat`
--
DROP TABLE IF EXISTS `Zakwaterowanie studenta w akademiku w wieku 22 lat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Zakwaterowanie studenta w akademiku w wieku 22 lat`  AS  select `zakwaterowanie`.`id` AS `id`,`zakwaterowanie`.`id_student` AS `id_student`,`zakwaterowanie`.`id_akademik` AS `id_akademik`,`zakwaterowanie`.`nr_pokoju` AS `nr_pokoju`,`zakwaterowanie`.`nr_pietra` AS `nr_pietra`,`zakwaterowanie`.`Data_zakwaterowania` AS `Data_zakwaterowania`,`zakwaterowanie`.`Data_wykwaterowania` AS `Data_wykwaterowania` from `zakwaterowanie` where `zakwaterowanie`.`id_student` in (select `student`.`indeks` from `student` where (`student`.`wiek` = 22)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `Zakwaterowanie studenta w akademiku z nazwiskiem na K`
--
DROP TABLE IF EXISTS `Zakwaterowanie studenta w akademiku z nazwiskiem na K`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lazoryszyna`@`%` SQL SECURITY DEFINER VIEW `Zakwaterowanie studenta w akademiku z nazwiskiem na K`  AS  select `student`.`imie` AS `imie`,`student`.`nazwisko` AS `nazwisko`,`akademik`.`nazwa_sk` AS `nazwa skrocona`,`akademik`.`ulica` AS `ulica`,`akademik`.`nr_budynku` AS `nr_budynku` from ((`student` join `akademik`) join `zakwaterowanie`) where ((`student`.`nazwisko` like 'K%') and (`zakwaterowanie`.`id_student` = `student`.`indeks`) and (`zakwaterowanie`.`id_akademik` = `akademik`.`id`)) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `akademik`
--
ALTER TABLE `akademik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazwa_sk` (`nazwa_sk`);

--
-- Indeksy dla tabeli `grupa`
--
ALTER TABLE `grupa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_wydzialu` (`id_wydzialu`),
  ADD KEY `id_student` (`id_student`);

--
-- Indeksy dla tabeli `miasta`
--
ALTER TABLE `miasta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazwa` (`nazwa`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_student` (`id_student`),
  ADD KEY `id_przedmiot` (`id_przedmiot`),
  ADD KEY `id_rodzaj_oceny` (`id_rodzaj_oceny`);

--
-- Indeksy dla tabeli `plan_zajec`
--
ALTER TABLE `plan_zajec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_grupa` (`id_grupa`),
  ADD KEY `id_przedmiot` (`id_przedmiot`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `przedmioty` (`id_wykladowca`);

--
-- Indeksy dla tabeli `rachunek`
--
ALTER TABLE `rachunek`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_przedmiot` (`id_przedmiot`),
  ADD KEY `id_student` (`id_student`);

--
-- Indeksy dla tabeli `rodzaj_oceny`
--
ALTER TABLE `rodzaj_oceny`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `nazwa` (`nazwa`);

--
-- Indeksy dla tabeli `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`indeks`),
  ADD KEY `miasto` (`miasto`);

--
-- Indeksy dla tabeli `wydzial`
--
ALTER TABLE `wydzial`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wykladowca`
--
ALTER TABLE `wykladowca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wykladowca` (`id_wydzial`);

--
-- Indeksy dla tabeli `zakwaterowanie`
--
ALTER TABLE `zakwaterowanie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`id_student`) USING BTREE,
  ADD KEY `id_student` (`id_student`),
  ADD KEY `id_akademik` (`id_akademik`);

--
-- Indeksy dla tabeli `zmiany_danych_student`
--
ALTER TABLE `zmiany_danych_student`
  ADD PRIMARY KEY (`indeks`),
  ADD KEY `miasto` (`miasto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `akademik`
--
ALTER TABLE `akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `grupa`
--
ALTER TABLE `grupa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT dla tabeli `miasta`
--
ALTER TABLE `miasta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT dla tabeli `plan_zajec`
--
ALTER TABLE `plan_zajec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `rachunek`
--
ALTER TABLE `rachunek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_oceny`
--
ALTER TABLE `rodzaj_oceny`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `student`
--
ALTER TABLE `student`
  MODIFY `indeks` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT dla tabeli `wydzial`
--
ALTER TABLE `wydzial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `wykladowca`
--
ALTER TABLE `wykladowca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `zakwaterowanie`
--
ALTER TABLE `zakwaterowanie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT dla tabeli `zmiany_danych_student`
--
ALTER TABLE `zmiany_danych_student`
  MODIFY `indeks` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `grupa`
--
ALTER TABLE `grupa`
  ADD CONSTRAINT `grupa_ibfk_1` FOREIGN KEY (`id_wydzialu`) REFERENCES `wydzial` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `grupa_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `student` (`indeks`) ON DELETE SET NULL;

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`indeks`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_przedmiot`) REFERENCES `przedmioty` (`id`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`id_rodzaj_oceny`) REFERENCES `rodzaj_oceny` (`ID`);

--
-- Ograniczenia dla tabeli `plan_zajec`
--
ALTER TABLE `plan_zajec`
  ADD CONSTRAINT `plan_zajec_ibfk_1` FOREIGN KEY (`id_grupa`) REFERENCES `grupa` (`id`),
  ADD CONSTRAINT `plan_zajec_ibfk_3` FOREIGN KEY (`id_przedmiot`) REFERENCES `przedmioty` (`id`);

--
-- Ograniczenia dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD CONSTRAINT `przedmioty` FOREIGN KEY (`id_wykladowca`) REFERENCES `wykladowca` (`id`);

--
-- Ograniczenia dla tabeli `rachunek`
--
ALTER TABLE `rachunek`
  ADD CONSTRAINT `rachunek_ibfk_1` FOREIGN KEY (`id_przedmiot`) REFERENCES `przedmioty` (`id`),
  ADD CONSTRAINT `rachunek_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `student` (`indeks`);

--
-- Ograniczenia dla tabeli `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`miasto`) REFERENCES `miasta` (`id`);

--
-- Ograniczenia dla tabeli `wykladowca`
--
ALTER TABLE `wykladowca`
  ADD CONSTRAINT `wykladowca` FOREIGN KEY (`id_wydzial`) REFERENCES `wydzial` (`id`);

--
-- Ograniczenia dla tabeli `zakwaterowanie`
--
ALTER TABLE `zakwaterowanie`
  ADD CONSTRAINT `zakwaterowanie_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`indeks`),
  ADD CONSTRAINT `zakwaterowanie_ibfk_2` FOREIGN KEY (`id_akademik`) REFERENCES `akademik` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
