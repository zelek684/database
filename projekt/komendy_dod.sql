SELECT student.indeks, student.imie, student.nazwisko, AVG(oceny.ocena) AS 'srednia ocen' FROM student, oceny WHERE oceny.id_student=student.indeks GROUP BY oceny.id_student
SELECT przedmioty.nazwa,wykladowca.imie,wykladowca.nazwisko FROM przedmioty JOIN wykladowca ON przedmioty.id_wykladowca=wykladowca.id
SELECT nazwa, cena*ilosc_godzin AS 'Koszt warunku' FROM przedmioty
SELECT student.imie, student.nazwisko, akademik.nazwa_sk AS 'nazwa skrocona',akademik.ulica,akademik.nr_budynku FROM student, akademik, zakwaterowanie WHERE student.nazwisko LIKE('K%') AND zakwaterowanie.id_student=student.indeks AND zakwaterowanie.id_akademik=akademik.id
SELECT * FROM student WHERE indeks IN (SELECT id_student FROM grupa)
SELECT student.indeks,student.imie,student.nazwisko,oceny.ocena,rodzaj_oceny.nazwa FROM oceny JOIN student ON oceny.id_student=student.indeks JOIN rodzaj_oceny ON oceny.id_rodzaj_oceny=rodzaj_oceny.ID
SELECT MAX(cena*ilosc_godzin) AS 'Maksymalna cena/h', MIN(cena*ilosc_godzin) AS 'Minimalna cena/h' FROM przedmioty

SELECT s.imie, s.nazwisko, s.wiek, z.Data_Zakwaterowania,z.Data_Wykwaterowania FROM student s INNER JOIN zakwaterowanie z ON s.indeks = z.id
----------------------
DELIMITER $$
CREATE DEFINER=lazoryszyna@% PROCEDURE Aktualizacja Rachunku()
    NO SQL
UPDATE rachunek , przedmioty SET rachunek.Koszt=przedmioty.cena*przedmioty.ilosc_godzin , Data_wplaty=NOW() WHERE rachunek.id_przedmiot = przedmioty.id AND Koszt IS NULL$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=lazoryszyna@% PROCEDURE Dodawanie Miasta(IN Nazwa VARCHAR(50) CHARSET utf8)
    NO SQL
INSERT INTO miasta(nazwa) VALUES (@p0)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=lazoryszyna@% PROCEDURE Dodawanie studenta(IN imie VARCHAR(50), IN nazwisko VARCHAR(50), IN miasto VARCHAR(40), IN ulica VARCHAR(40), IN nr_bud INT(10), IN nr_mieszkania INT(10), IN data_ur DATE, IN PESEL VARCHAR(11))
    NO SQL
INSERT INTO student(indeks, imie, nazwisko, miasto, ulica, nr_bud, nr_mieszkania, data_ur, wiek, PESEL) VALUES (DEFAULT,@P0,@P1,@P2,@P3,@P4,@P5,@P6,(SELECT YEAR(NOW())-YEAR(@P6)),@P8)$$
DELIMITER ;
---------------------------------
CREATE TRIGGER `Zapisywanie Danych` BEFORE UPDATE ON `student`
 FOR EACH ROW INSERT INTO `zmiany_danych_student` (`indeks`, `imie`, `nazwisko`, `miasto`, `ulica`, `nr_bud`, `nr_mieszkania`, `data_ur`, `wiek`, `PESEL`) VALUES (old.`indeks`, old.`imie`, old.`nazwisko`, old.`miasto`, old.`ulica`, old.`nr_bud`, old.`nr_mieszkania`, old.`data_ur`, old.`wiek`, old.`PESEL`)


CREATE TRIGGER `Zmiana Wykładowcy` BEFORE DELETE ON `wykladowca`
 FOR EACH ROW UPDATE przedmioty SET id_wykladowca=1 WHERE id_wykladowca=old.id