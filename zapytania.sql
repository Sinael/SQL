UPDATE klient SET adres_email = 'null' where id_klient like 'KT883'- wrocenie do stanu poprzedniego

ALTER TABLE producent ADD column data_zawarcia_umowy date;
UPDATE producent SET data_zawarcia_umowy = '2010-05-01' where id_producent = 1234;
UPDATE producent SET data_zawarcia_umowy = '2011-05-01' where id_producent = 1345;
UPDATE producent SET data_zawarcia_umowy = '2010-09-02' where id_producent = 1567;
UPDATE producent SET data_zawarcia_umowy = '2009-05-01' where id_producent = 8956;
UPDATE producent SET data_zawarcia_umowy = '2011-05-01' where id_producent = 1690;
ALTER TABLE producent DROP COLUMN data_zawarcia_umowy

DROP TABLE dane,faktura,kategoria,klient,koszyk,paragon,pozycja_koszyka,pracownik,producent,przesylka,rabat,towar,zamowienie CASCADE

ALTER TABLE paragon ADD COLUMN war_netto FLOAT;
UPDATE paragon SET war_netto = wartosc * 0.77;
ALTER TABLE paragon DROP COLUMN war_netto

SELECT id_zamowienie,(SELECT imie from klient WHERE zamowienie.id_klient = klient.id_klient) AS imie_klienta, (SELECT nazwisko FROM klient WHERE zamowienie.id_klient = klient.id_klient) AS nazwisko_klient, imie, nazwisko,(SELECT wartosc FROM paragon WHERE zamowienie.id_zamowienie= paragon.id_zamowienie) AS wartosc_zrealizowana FROM zamowienie, pracownik WHERE pracownik.id_pracownik = zamowienie.id_pracownik ORDER BY imie;
SELECT id_zamowienie,(SELECT imie from klient WHERE zamowienie.id_klient = klient.id_klient) AS imie_klienta, (SELECT nazwisko FROM klient WHERE zamowienie.id_kleint = klient.id_klient) AS nazwisko_klient, imie, nazwisko,(SELECT wartosc FROm paragon WHERE zamowienie.id_zamowienie=


SELECT SUM(ilosc_towaru),nazwa_przedmiotu from pozycja_koszyka,towar where towar.id_towar = pozycja_koszyka.id_towar group by nazwa_przedmiotu -- Zestawienie sprzeda?y produkt?w

SELECT nazwa_przedmiotu,(dostepna_ilosc -ilosc_towaru) AS D from pozycja_koszyka,towar where towar.id_towar = pozycja_koszyka.id_towar group by id_pozycja_koszyka,nazwa_przedmiotu,dostepna_ilosc - Ilo?? dost?pnych towar?w

SELECT nazwa_producenta ,count(nazwa_producenta) AS w_ofercie from producent,towar where producent.id_producent = towar.id_producent  group by nazwa_producenta -- Ilosc towarow danego producenta w ofercie.

SELECT nazwa_producenta,count(nazwa_producenta) AS rodzaje_ilosc, nazwa_przedmiotu  from towar,producent where producent.id_producent = towar.id_producent group by nazwa_producenta,nazwa_przedmiotu order by nazwa_producenta --Wypisanie towar?w danego producenta z podaniem ilo?ci rodzaj?w

SELECT imie,nazwisko,count(id_zamowienie) AS ilosc_zamowien FROM zamowienie,pracownik WHERE pracownik.id_pracownik = zamowienie.id_pracownik GROUP BY imie,nazwisko ORDER BY ilosc_zamowien -- zestawienie pracownikow i realizowanych przez nich zam?wie?

SELECT data_sprzedazy,wartosc FROM paragon WHERE data_sprzedazy > '2012-04-25'- ilosc i wartosc transakcji od dnia 25-04-2012

SELECT SUM(wartosc) FROM paragon WHERE date_part('month', data_sprzedazy) = 05 -- wypisanie zysku w maju

SELECT SUM(wartosc) FROM paragon WHERE date_part('year', data_sprzedazy) = 2012 -- wypisanie zysku transakcji w 2012 roku

SELECT data_sprzedazy,wartosc FROM paragon WHERE date_part('year', data_sprzedazy) = 2012 -- wypisanie wartosci dat transakcji w 2012 roku

SELECT (select imie FROM klient WHERE klient.id_klient = zamowienie.id_klient)AS imie,(select nazwisko FROM klient WHERE klient.id_klient = zamowienie.id_klient)AS nazwisko,data_sprzedazy FROM zamowienie,paragon WHERE zamowienie.id_zamowienie = paragon.id_zamowienie AND  date_part('month', data_sprzedazy) <05 AND id_klient NOT IN (select id_klient from zamowienie,paragon WHERE zamowienie.id_zamowienie = paragon.id_zamowienie AND date_part('month', data_sprzedazy) >=05) ORDER BY data_sprzedazy -- wypisanie danych klient?w kt?rzy ostatni raz zrobili zakupy do maja 2012 roku.

SELECT imie, nazwisko, (date(NOW())-data_zatr)AS staz_dni, ((date_part('year',CURRENT_TIMESTAMP))-(date_part('year', data_zatr)))AS staz_lata from pracownik order by staz_dni -- zestawienie sta?u pracownik?w

SELECT imie, nazwisko,((date_part('year',CURRENT_TIMESTAMP))-(date_part('year', data_urodzenia)))AS wiek from pracownik order by wiek -- wiek pracownik?w

SELECT (SELECT AVG((date_part('year',CURRENT_TIMESTAMP))-(date_part('year', data_urodzenia))) FROM klient,zamowienie WHERE klient.id_klient = zamowienie.id_klient)AS srednia_wieku, AVG(wartosc) AS srednia_wartosc,COUNT(id_paragon) AS ilosc_zamowien FROM zamowienie,paragon WHERE zamowienie.id_zamowienie = paragon.id_zamowienie --?rednia wieku, ?rednia warto?? zam?wie?, ilo?? zam?wie?

SELECT rozmiar,cena_przedmiotu,(SELECT nazwa_kategorii FROM kategoria WHERE towar.id_kategoria = kategoria.id_kategoria)AS kategoria, nazwa_producenta,nazwa_przedmiotu FROM towar, producent WHERE towar.id_producent = producent.id_producent and rozmiar like 'xl' order by rozmiar - wypisanie danych towar?w o oznaczeniu rozmiaru "xl"

SELECT rozmiar,cena_przedmiotu,(SELECT nazwa_kategorii from kategoria WHERE towar.id_kategoria = kategoria.id_kategoria)AS kategoria, nazwa_producenta,nazwa_przedmiotu FROM towar, producent WHERE towar.id_producent = producent.id_producent order by rozmiar - wypisanie wszystkich dost?pnych towar?w, pogrupowane wed?ug rozmiar?w

UPDATE klient SET adres_email = 'krystyna@onet.pl' where id_klient like 'KT883'-aktualizacja maila
