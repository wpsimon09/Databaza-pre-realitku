use ZadanieRealitnaKancelaria
go


create table byt
(
    id_bytu                     int                     IDENTITY,
    Metre4                      int                     not null,
    izby                        int                         null,
    cena                        money                   not null,
    kupa_predaj                 BIT                     not null, --0 predaj || 1 kúpa
    Lokalita                    varchar(300)            not null,
    --obmedzenia--
    CONSTRAINT pk_domu  PRIMARY KEY (id_bytu),
    CONSTRAINT ch1_cena CHECK (Cena>1)

)

create table dom
(
	id_domu				        int IDENTITY			,
	Predaj_Kúpa			        bit						NOT NULL,
	Metre4				        int   					NOT NULL,
	Izby				        int 					NOT NULL,
	Poschodia			        int  					NOT NULL,
	Lokalia				        VARCHAR(300)			NOT NULL,
	Cena				        int 					NOT NULL,
    --obmedzenia--  
    CONSTRAINT pk_dom PRIMARY KEY (id_domu),
    CONSTRAINT ch2_cena CHECK (Cena>1)

)

create table pozemok
(
	id_pozemku			        int IDENTITY			,
	Predaj_Kúpa 		        bit 					NOT NULL,
	Metre4				        int 					NOT NULL,
	Lokalita			        VARCHAR	(300)			NOT NULL,
    Cena                        money                   not null,
    --obmedzenia--
    CONSTRAINT pk_pozemku PRIMARY KEY (id_pozemku),
    CONSTRAINT ch3_cena CHECK (Cena>1)

)

create table obhliadka
(
    id_prehliadky               INT                     IDENTITY,
    id_bytu                     int                     not null,
    id_domu                     INT                     not null,
    id_pozemku                  int                     not null,
    číslo_maklera               INT                     not null,
    ČasObhliadky                TIME                    not null,
    DátumObhliadky              DATE                    not null,
    KrstneMenoObhliadajuceho    VARCHAR(40)             not null,
    PreizvyskoObhliadajuce      VARCHAR(100)            not null,
    --obmedzenia--
    CONSTRAINT pk_obhliadky PRIMARY KEY (id_prehliadky ),
    CONSTRAINT fk_bytu FOREIGN KEY (id_bytu) REFERENCES byt(id_bytu),
    CONSTRAINT fk_domu FOREIGN KEY (id_domu) REFERENCES dom (id_domu),
    CONSTRAINT fk_pozemku FOREIGN key (id_pozemku) REFERENCES pozemok(id_pozemku)
)

create table Predaj_Kúpa
(
	id_predaja_kúpi				int IDENTITY			,
	id_domu						int 					NOT NULL,
	id_bytu						int 					NOT NULL,
	id_pozemku					int 					NOT NULL,
    id_prehliadky               int                     NOT NULL,
	Meno_predávajúceho			VARCHAR(100)			NOT NULL,
	Priezvisko_predávajúceho	VARCHAR(100)			NOT NULL,
	Meno_kupujúceho				VARCHAR(100)			NOT NULL,
	Priezvisko_kupujúceho		VARCHAR(100)			NOT NULL,
    --obmedzenia
    CONSTRAINT pk_predaja_kupy PRIMARY KEY (id_predaja_kúpi) ,
    CONSTRAINT fk2_bytu FOREIGN KEY (id_bytu) REFERENCES byt(id_bytu),
    CONSTRAINT fk2_domu FOREIGN KEY (id_domu) REFERENCES dom (id_domu),
    CONSTRAINT fk2_pozemku FOREIGN key (id_pozemku) REFERENCES pozemok(id_pozemku),
    CONSTRAINT fk1_obhliadky FOREIGN KEY (id_prehliadky) REFERENCES obhliadka (id_prehliadky)
)
