CREATE TABLE kategoria (id_kategoria varchar(15), nazwa_kategorii varchar(15),
PRIMARY KEY (id_kategoria));
CREATE TABLE towar (id_towar varchar (15), id_producent int, id_kategoria varchar(15), nazwa_przedmiotu varchar(30), rozmiar varchar(5), cena_przedmiotu int, dostepna_ilosc int,
PRIMARY KEY (id_towar));
CREATE TABLE producent (id_producent int, nazwa_producenta varchar(30) NOT NULL,
PRIMARY KEY(id_producent));
CREATE TABLE pozycja_koszyka (id_pozycja_koszyka varchar(15), id_towar varchar (15) NOT NULL, ilosc_towaru int,
PRIMARY KEY (id_pozycja_koszyka));
CREATE TABLE przesylka (id_przesylka varchar(15), rodzaj_transportu varchar(30), cena_przesylki int,
PRIMARY KEY (id_przesylka));
CREATE TABLE koszyk (id_koszyk varchar(15), id_pozycja_koszyka varchar (15) NOT NULL, id_pozycja_koszyka_2 varchar(15) NULL,id_pozycja_koszyka_3 varchar(15) NULL,id_pozycja_koszyka_4 varchar(15) NULL, id_przesylka varchar(15) NOT NULL, wartosc_koszyka int NOT NULL,
PRIMARY KEY (id_koszyk));
CREATE TABLE rabat (id_rabat varchar(15), nazwa varchar(30), wysokosc varchar(5),
PRIMARY KEY(id_rabat));
CREATE TABLE zamowienie (id_zamowienie int, id_klient varchar(5) NOT NULL, id_koszyk varchar(15) NOT NULL, id_rabat varchar(15), id_pracownik varchar(5) NOT NULL,
PRIMARY KEY(id_zamowienie));
CREATE TABLE paragon (id_paragon int, id_zamowienie int NOT NULL, data_sprzedazy date NOT NULL, wartosc int NOT NULL, numer_kasy int,
PRIMARY KEY(id_paragon));
CREATE TABLE faktura (id_faktura int NOT NULL, id_zamowienie int NOT NULL, data_wystawienia date NOT NULL, wartosc_brutto int NOT NULL,
PRIMARY KEY(id_faktura));
CREATE TABLE klient (id_klient varchar(5), imie varchar(15) NOT NULL, nazwisko varchar(30) NOT NULL, miasto varchar(15) NOT NULL, ulica varchar (30) NOT NULL, nr_domu varchar(5) NOT NULL, nr_lokalu int, data_urodzenia date NOT NULL, nip int, nazwa_firmy varchar(30), adres_email varchar(30),
PRIMARY KEY(id_klient));
CREATE TABLE pracownik (id_pracownik varchar(5), id_dane varchar(7) NOT NULL, imie varchar(15) NOT NULL, nazwisko varchar(30) NOT NULL, nip int NOT NULL, stanowisko varchar(30), data_zatr date NOT NULL, data_urodzenia date NOT NULL,
PRIMARY KEY(id_pracownik));
CREATE TABLE dane (id_dane varchar(7), miasto varchar(15) , ulica varchar (30) NOT NULL, nr_domu varchar(5) NOT NULL, nr_lokalu int,
PRIMARY KEY(id_dane));


ALTER TABLE towar
ADD FOREIGN KEY (id_producent)
REFERENCES producent(id_producent),
ADD FOREIGN KEY (id_kategoria)
REFERENCES kategoria (id_kategoria);
ALTER TABLE pozycja_koszyka
ADD FOREIGN KEY (id_towar)
REFERENCES towar(id_towar);
ALTER TABLE koszyk
ADD FOREIGN KEY (id_przesylka)
REFERENCES przesylka(id_przesylka),
ADD FOREIGN KEY (id_pozycja_koszyka)
REFERENCES pozycja_koszyka (id_pozycja_koszyka),
add foreign key  (id_pozycja_koszyka_2)
references pozycja_koszyka(id_pozycja_koszyka),
add foreign key  (id_pozycja_koszyka_3)
references pozycja_koszyka(id_pozycja_koszyka),
add foreign key  (id_pozycja_koszyka_4)
references pozycja_koszyka(id_pozycja_koszyka);
ALTER TABLE zamowienie
ADD FOREIGN KEY (id_klient)
REFERENCES klient(id_klient),
ADD FOREIGN KEY (id_koszyk)
REFERENCES koszyk(id_koszyk),
ADD FOREIGN KEY (id_rabat)
REFERENCES rabat (id_rabat),
ADD FOREIGN KEY (id_pracownik)
REFERENCES pracownik(id_pracownik);
ALTER TABLE faktura
ADD FOREIGN KEY (id_zamowienie)
REFERENCES zamowienie(id_zamowienie);
ALTER TABLE paragon
ADD FOREIGN KEY (id_zamowienie)
REFERENCES zamowienie(id_zamowienie);
ALTER TABLE pracownik
ADD FOREIGN KEY (id_dane)
REFERENCES dane(id_dane);


INSERT INTO kategoria (id_kategoria, nazwa_kategorii)
VALUES
('k', 'koszule'),
('s','spodnie'),
('b','buty'),
('m','marynarki'),
('d','dodatki');
INSERT INTO producent (id_producent, nazwa_producenta)
VALUES
('1234','Deloo'),
('1345','Einterlo'),
('1567','Avokado'),
('8956','Strojnis'),
('1690','Vivelato');
INSERT INTO towar (id_towar, id_producent, id_kategoria, nazwa_przedmiotu, rozmiar, cena_przedmiotu, dostepna_ilosc)
VALUES
('12ks','1234','k','bawelna_elegance','s','150','4'),
('12km','1234','k','bawelna_elegance','m','150','10'),
('12kl','1234','k','bawelna_elegance','l','150','5'),
('12kxl','1234','k','bawelna_elegance','xl','150','15'),
('13ks','1345','k','bawelna_poliester_free','s','100','10'),
('13km','1345','k','bawelna_poliester_free','m','100','5'),
('13kl','1345','k','bawelna_poliester_free','l','100','3'),
('13kxl','1345','k','bawelna_poliester_free','xl','100','20'),
('15ks','1567','k','bawelna_egipska_elegance','s','250','3'),
('15km','1567','k','bawelna_egipska_elegance','m','260','2'),
('15kl','1567','k','bawelna_egipska_elegance','l','260','5'),
('15kxl','1567','k','bawelna_egipska_elegance','xl','290','15'),
('89ss','8956','s','do_wszystkiego','s','60','50'),
('89sm','8956','s','do_wszystkiego','m','60','10'),
('89sl','8956','s','do_wszystkiego','l','60','5'),
('89sxl','8956','s','do_wszystkiego','xl','70','50'),
('891s','8956','s','only_elegance','s','190','5'),
('891m','8956','s','only_elegance','m','190','10'),
('891l','8956','s','only_elegance','l','200','5'),
('89b40','8956','b','pawi_blysk','40','180','9'),
('89b41','8956','b','pawi_blysk','41','180','5'),
('89b42','8956','b','pawi_blysk','42','180','3'),
('89b43','8956','b','pawi_blysk','43','190','2'),
('89b44','8956','b','pawi_blysk','44','200','1'),
('16ms','1690','m','snake_eye','s','300','2'),
('16mm','1690','m','snake_eye','m','300','5'),
('16ml','1690','m','snake_eye','l','300','5'),
('16mxl','1690','m','snake_eye','xl','350','3'),
('15dkp','1567','d','krawat_pawilion',NULL,'100','3'),
('15dkw','1567','d','krawat_windsor',NULL,'150','5'),
('16dmv','1690','d','mucha_vivaldi',NULL,'50','9'),
('16dme','1690','d','mucha_elegance',NULL,'190','8'),
('12dkp','1234','d','kapelusz_gittino',NULL,'380','3');
INSERT INTO pozycja_koszyka (id_pozycja_koszyka, id_towar, ilosc_towaru)
VALUES
('1','12ks','1'),
('2','891s','1'),
('3','89b40','2'),
('4','15km','1'),
('5','16mm','2'),
('6','15kxl','10'),
('7','891l','1'),
('8','16dmv','3'),
('9','13kxl','1'),
('10','89b43','1');
INSERT INTO przesylka (id_przesylka, rodzaj_transportu, cena_przesylki)
VALUES
('DHL','kurier','24'),
('pryw','odbior_osobisty',null);
INSERT INTO koszyk (id_koszyk, id_pozycja_koszyka, id_pozycja_koszyka_2,id_pozycja_koszyka_3,id_pozycja_koszyka_4, id_przesylka, wartosc_koszyka)
VALUES
('AA11','1','7','6',null,'DHL','3264'),
('AB12','10',null,null,null,'pryw','190'),
('BB33','8',null,null,null,'pryw','150'),
('BC56','1','2',null,null,'DHL','364'),
('BD79','5',null ,null ,null,'pryw','600');
INSERT INTO rabat (id_rabat, nazwa, wysokosc)
VALUES
('brak',null,null),
('prac','znizka_pracownika','30%'),
('szef','znizka_wlasciciela','99%');
INSERT INTO klient (id_klient, imie, nazwisko, miasto, ulica, nr_domu, nr_lokalu, data_urodzenia, nip, nazwa_firmy, adres_email)
VALUES
('DB891','Daniel','Brykala','Poznan','Wyzwolenia','15b','2','1989-05-26','1251985972','Eran','eran@wp.pl'),
('MB792','Maria','Baring','Warszawa','Kopernika','12',null,'1972-06-02',null,null,'maria2345@noet.pl'),
('KT883','Krystyna','Tomczyk','Gdansk','Niepodleglosci','12a','1','1988-02-09',null,null,null),
('ED696','Endariel','Daramoe','Gdansk','Zwyciestwa','56e','16','1969-06-21',null,null,'endariel@msn.com'),
('ED699','Ewelina','Dunaj','Slupsk','Wyzwolenia','9','12','1969-08-22',null,null,'ewelinadunaj@vp.pl');
INSERT INTO dane(id_dane, miasto, ulica, nr_domu, nr_lokalu)
VALUES
('B1-dane','Gdansk','ManifestuPo?anieckiego','5a','12'),
('C1-dane','Gdansk','Grunwaldzka','79b','5');
INSERT INTO pracownik (id_pracownik, id_dane, imie, nazwisko, nip, stanowisko, data_zatr, data_urodzenia)
VALUES
('B1-01','B1-dane','Daniel','Dabek','1235672896','sprzedawca','2010-05-29','1978-06-21'),
('B1-02','B1-dane','Ewelina','Dabek','1236972581','sprzedawca','2010-02-05','1988-05-05'),
('C1-01','C1-dane','Tomasz','Wyjatek','1689263692','kierownik','2009-01-01','1987-09-07');
INSERT INTO zamowienie (id_zamowienie, id_klient, id_koszyk, id_rabat, id_pracownik)
VALUES
('111111','DB891','AA11',null,'B1-01'),
('222222','MB792','AB12','prac','C1-01'),
('333333','KT883','BB33',null,'B1-01'),
('444444','ED696','BC56',null,'B1-01'),
('555555','ED699','BD79','szef','B1-02');
INSERT INTO faktura (id_faktura, id_zamowienie, data_wystawienia, wartosc_brutto)
VALUES
('124589','111111','2012-05-17','3264');
INSERT INTO paragon (id_paragon, id_zamowienie, data_sprzedazy, wartosc, numer_kasy)
VALUES
('1','111111','2012-05-17','3264','5'),
('2','222222','2012-02-23','133','6'),
('3','333333','2012-04-25','150','5'),
('4','444444','2012-03-21','364','5'),
('5','555555','2012-02-20','6','6');



