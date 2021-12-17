create ZadanieRealitnaKancelaria
go

--AUTORI : Šimon Potočňák a Kristián Samuel Sabol
-- All rights reserved © 

--VYTVORENIE TABUĽOK
create table byt
(
    id_bytu                     		int                     		IDENTITY,
    Metre4                     			int                     		not null,
    izby                        		int                       		null,
    cena                       			money                   		not null,
    kupa_predaj                 		BIT                     		not null, --0 predaj || 1 kúpa
    Lokalita                    		varchar(300)            		not null,
    --obmedzenia--
    CONSTRAINT pk_domu  PRIMARY KEY (id_bytu),
    CONSTRAINT ch1_cena CHECK (Cena>1)
)

create table dom
(
	id_domu				        int IDENTITY			,
	Predaj_Kúpa			        bit					NOT NULL, --0 predaj || 1 kúpa
	Metre4				        int   					NOT NULL,
	Izby				        int 					NOT NULL,
	Poschodia			        int  					NOT NULL,
	Lokalia				        VARCHAR(300)				NOT NULL,
	Cena				        int 					NOT NULL,
    --obmedzenia--  
    CONSTRAINT pk_dom PRIMARY KEY (id_domu),
    CONSTRAINT ch2_cena CHECK (Cena>1)
)
--uprava tabulky dom--


create table pozemok
(
	id_pozemku			        int IDENTITY				,
	Predaj_Kúpa 		        	bit 					NOT NULL,
	Metre4				        int 					NOT NULL,
	Lokalita			        VARCHAR	(300)				NOT NULL,
   	Cena                        		money                   		not null,
    --obmedzenia--
    CONSTRAINT pk_pozemku PRIMARY KEY (id_pozemku),
    CONSTRAINT ch3_cena CHECK (Cena>1)

)

create table obhliadka
(
    id_prehliadky               		INT                     		IDENTITY,
    id_bytu                     		int                     		not null,
    id_domu                     		INT                     		not null,
    id_pozemku                  		int                     		not null,
    číslo_maklera              			INT                     		not null,
    ČasObhliadky                		TIME                    		not null,
    DátumObhliadky             			DATE                    		not null,
    KrstneMenoObhliadajuceho    		VARCHAR(40)             		not null,
    PreizvyskoObhliadajuce      		VARCHAR(100)            		not null,
    
    --obmedzenia--
    CONSTRAINT pk_obhliadky PRIMARY KEY (id_prehliadky ),
    CONSTRAINT fk_bytu FOREIGN KEY (id_bytu) REFERENCES byt(id_bytu),
    CONSTRAINT fk_domu FOREIGN KEY (id_domu) REFERENCES dom (id_domu),
    CONSTRAINT fk_pozemku FOREIGN key (id_pozemku) REFERENCES pozemok(id_pozemku)
)

--upravenie tabulky aby id_bytu, id_domu a id_pozemku mohli byť null
alter table obhliadka alter column id_bytu int null
alter table obhliadka alter column id_pozemku int null
alter table obhliadka alter column id_domu int null

create table Predaj_Kúpa
(
	id_predaja_kúpi				int 					IDENTITY,
	id_domu					int 					NOT NULL,
	id_bytu					int 					NOT NULL,
	id_pozemku				int 					NOT NULL,
    	id_prehliadky               		int                     		NOT NULL,
	Meno_predávajúceho			VARCHAR(100)				NOT NULL,
	Priezvisko_predávajúceho		VARCHAR(100)				NOT NULL,
	Meno_kupujúceho				VARCHAR(100)				NOT NULL,
	Priezvisko_kupujúceho			VARCHAR(100)				NOT NULL,
	
    --obmedzenia
    CONSTRAINT pk_predaja_kupy PRIMARY KEY (id_predaja_kúpi) ,
    CONSTRAINT fk2_bytu FOREIGN KEY (id_bytu) REFERENCES byt(id_bytu),
    CONSTRAINT fk2_domu FOREIGN KEY (id_domu) REFERENCES dom (id_domu),
    CONSTRAINT fk2_pozemku FOREIGN key (id_pozemku) REFERENCES pozemok(id_pozemku),
    CONSTRAINT fk1_obhliadky FOREIGN KEY (id_prehliadky) REFERENCES obhliadka (id_prehliadky)
)
--uprava tabulky Predaj_Kúpa
alter table Predaj_Kúpa ADD DátumKúpy DATE NULL
alter table Predaj_Kúpa ALTER COLUMN id_domu        INT NULL
alter table Predaj_Kúpa ALTER COLUMN id_bytu        INT NULL
alter table Predaj_Kúpa ALTER COLUMN id_pozemku     INT NULL
alter table Predaj_Kúpa ALTER COLUMN id_prehliadky  INT NULL


----------------------------------------------------------------------------------------------------------------


---------------------------------------INSETY DO TABULKY DOMU---------------------------------------------------------------
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('0', '300','6', '2','Kojatice','200000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('0', '180','8', '1','Lubotice','200000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('1', '200','4', '1','Prešov(Rúrky)','180000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('1', '250','5', '2','Veľký Šariš','205000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('1', '400','8', '2','Záborské','310000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('0', '384','6', '1','Prešov(Pod šalgovíkom)','320000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('1', '232','4', '1','Prešov(Sídlisko 2)','210000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('0', '425','8', '2','Malý Šariš','270000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('1', '394','8', '2','Kapušany pri Prešove','260000')
INSERT INTO dom (Predaj_Kúpa,Metre4,Izby,Poschodia,Lokalia,Cena) VALUES('0', '470','12', '3','Fintice','300000')
-------------------------------------------------------------------------------------------------------------------------

--------------------------------------INSERTY DO TABULKY BYTU----------------------------------------------
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('62', '1','1','Solivar(Prešov)','149000')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('69', '3','0','Surdok(Prešov)','179000')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('79', '4','0','Sídlisko III(Prešov)','150000')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('87', '2','1','Solivar(Prešov)','149000')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('138', '4','1','Sekčov(Prešov)','143000')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('84', '3','1','Hlavná(Prešov)','299985')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('61', '2','0','Hlavná(Prešov)','217949')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('29', '1','1','Trojica(Prešov)','103900')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('62', '3','1','Sídlisko III(Prešov)','136500')
INSERT INTO byt (Metre4,Izby,kupa_predaj,Lokalita,Cena) VALUES('54', '2','0','Sídlisko II(Prešov)','128000')
---------------------------------------------------------------------------------------------------------------

-----------------------------------INSERTY DO TABULKY POZEMOK------------------------------------------------
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (0,'1736', '(Klenov)Prešov',26000)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (1,'526', '(Solivar)Prešov',17000)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (1,'2542', '(Hrabkov)Prešov',49000)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (0,'4317', '(Vyšná śebastová)Prešov',19900)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (1,'3736', '(Sekčov)Prešov',272728)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (0,'5528', '(Mirkovce)Prešov',60000)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (1,'6513', '(Mirkovce)Prešov',100000)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (0,'934', '(Kokošovce)Prešov',63000)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (1,'1360', '(Široke)Prešov',58480)
INSERT into pozemok (Predaj_Kúpa,Metre4,Lokalita,Cena) VALUES (1,'637', '(Okužná)Prešov',32000)
-----------------------------------------------------------------------------------------------------------

-------------------------------------INSERT DO TABULKY OBHLIADKY-------------------------------------------
--obhliadky bytov
INSERT into obhliadka (id_bytu, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(32,132,CONVERT( time,'13:00:00',110),CONVERT(date,'20.12.2020',103 ),'Jana', 'Mokra')
INSERT into obhliadka (id_bytu, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(36,302,CONVERT( time,'16:30:00',110),CONVERT(date,'21.12.2020',103 ),'James', 'Pekný')
INSERT into obhliadka (id_bytu, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(39,342,CONVERT( time,'9:00:00',110),CONVERT(date,'22.12.2020',103 ),'Obivan', 'Kenobi')
INSERT into obhliadka (id_bytu, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(34,007,CONVERT( time,'15:15:00',110),CONVERT(date,'20.12.2020',103 ),'Lukáš', 'Skywalker')

--obhliadky domov
INSERT into obhliadka (id_domu, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(27,333,CONVERT( time,'8:00:00',110),CONVERT(date,'20.12.2020',103 ),'Kirk', 'Hamet')
INSERT into obhliadka (id_domu, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(29,976,CONVERT( time,'10:00:00',110),CONVERT(date,'30.12.2020',103 ),'Jeff', 'Sosami')
INSERT into obhliadka (id_domu, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(28,666,CONVERT( time,'16:00:00',110),CONVERT(date,'23.12.2020',103 ),'Elon', 'Mlas')

--obhliadky pozemkov
INSERT into obhliadka (id_pozemku, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(30,001,CONVERT( time,'17:00:00',110),CONVERT(date,'21.12.2020',103 ),'Rastislav', 'Sinek')
INSERT into obhliadka (id_pozemku, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(25,301,CONVERT( time,'15:10:00',110),CONVERT(date,'28.12.2020',103 ),'Jožo', 'Ráž')
INSERT into obhliadka (id_pozemku, číslo_maklera,ČasObhliadky,DátumObhliadky,KrstneMenoObhliadajuceho,PreizvyskoObhliadajuce) VALUES(29,332,CONVERT( time,'16:15:00',110),CONVERT(date,'29.12.2020',103 ),'Ivo', 'Pečivo')

------------------------------------------------------------------------------------------------------------

------------------------------------------------INSERTY DO TABUĽKY PREDAJ_KUPA---------------------------------------------

--kupene počas prehliadky
INSERT into Predaj_Kúpa(id_prehliadky, Meno_predávajúceho, Priezvisko_predávajúceho, Meno_kupujúceho, Priezvisko_kupujúceho) VALUES (46,'Jožko','Kramblička', 'Jana', 'Spišakova')
INSERT into Predaj_Kúpa(id_prehliadky, Meno_predávajúceho, Priezvisko_predávajúceho, Meno_kupujúceho, Priezvisko_kupujúceho) VALUES (42,'Smigl','Hobbyt', 'Sauron', 'Milášik')
INSERT into Predaj_Kúpa(id_prehliadky, Meno_predávajúceho, Priezvisko_predávajúceho, Meno_kupujúceho, Priezvisko_kupujúceho) VALUES (44,'Lukáš','Žgola', 'Slavomír', 'Kotuč')
INSERT into Predaj_Kúpa(id_prehliadky, Meno_predávajúceho, Priezvisko_predávajúceho, Meno_kupujúceho, Priezvisko_kupujúceho) VALUES (50,'Joe','Who', 'Lig', 'Maballs')


--kupene bez prehliadky
---kupeny dom
INSERT into Predaj_Kúpa(id_domu, Meno_predávajúceho, Priezvisko_predávajúceho, Meno_kupujúceho,Priezvisko_kupujúceho,DátumKúpy) VALUES (22,'Jozef','Lico', 'Bill', 'Brany',CONVERT(date,'10.12.2020',103))
---kupeny byt
INSERT into Predaj_Kúpa(id_bytu, Meno_predávajúceho, Priezvisko_predávajúceho, Meno_kupujúceho,Priezvisko_kupujúceho,DátumKúpy) VALUES (32,'Laco','Demek', 'Marcel', 'Mamba',CONVERT(date,'14.12.2020',103))

---kupeny pozemok
INSERT into Predaj_Kúpa(id_pozemku, Meno_predávajúceho, Priezvisko_predávajúceho, Meno_kupujúceho,Priezvisko_kupujúceho,DátumKúpy) VALUES (25,'Leo','Cirus', 'Marta', 'Hladná',CONVERT(date,'17.12.2020',103))


-----------------------------KLASICKÉ VÍPISY Z TABUĽKY----------------------------------
SELECT*FROM byt
go

SELECT*FROM dom
go

SELECT*FROM pozemok
go

SELECT*FROM obhliadka
go

SELECT*FROM Predaj_Kúpa
go
-------------------------------------------------------------------------------------------

---------------------MAZANIE VYPLNENÝCH ÚDAJOV (debug možnosť)-----------------------------
DELETE pozemok 
DELETE byt 
DELETE obhliadka 
DELETE byt 
DELETE dom 

-------------------------------------------------------------------------------------------

----------------------SELECT S ORDER BY-------------------------------

--zoradenie bytov,ktoré sú na predaj podla počtu izieb
SELECT izby,Metre4,cena,Lokalita from byt WHERE ABS(kupa_predaj)=1 ORDER BY (izby) ASC

--zoradenie domy,ktoré sú na kúpu podla  ceny ktorú si určil stanovil klient
SELECT izby,Metre4,cena,Lokalia from dom WHERE ABS(Predaj_Kúpa)=0 ORDER BY (Cena) ASC

--zoradenie pozemku ktorý je v mirkovciach podľa m4
SELECT Lokalita, Cena, Metre4 FROM pozemok WHERE (Lokalita)='(Mirkovce)Prešov' ORDER by (Metre4)asc
----------------------------------------------------------------------

---------------------SELECT S GROUP BY----------------------------------

--spočíta všetky byty, ktoré sú na predaj a vypíše ich počet a priemernú sumu
SELECT 
count(id_bytu)   as PocetBytovNaPredaj,
avg(cena) as PriemernaSuma
from byt
where kupa_predaj =0
group by kupa_predaj

--zrátanie všetkych ponúkanýc 1 poschodových domov a priemerny pocet izieb, metrov4
SELECT
count(id_domu) as PocetDostupnýchDomov,
AVG(Izby) as PriemernyPocetIzieb,
AVG(Metre4) as PriemernyPocetMetrov4
FROM dom
WHERE Poschodia =1
GROUP BY Poschodia

--všetky pozemky ktoré majú väčšie 4 metre ako 1000 + ich priemerna suma a sú napredaj
SELECT
COUNT(id_pozemku) as PocetPozemkov,
AVG(Cena) as PriemernaCena
FROM pozemok 
WHERE Metre4 > 1000 AND Predaj_Kúpa = 0
Group BY Predaj_Kúpa

----------------------------------------------------------------------
