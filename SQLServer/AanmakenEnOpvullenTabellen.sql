DROP TABLE IF EXISTS PizzaBestelling.Bestelling;
DROP TABLE IF EXISTS PizzaBestelling.Klant;
DROP TABLE IF EXISTS PizzaBestelling.Medewerker;
DROP TABLE IF EXISTS [PizzaBestelling.Status];
DROP TABLE IF EXISTS PizzaBestelling.Pizza;
DROP TABLE IF EXISTS PizzaBestelling.PizzaGrootte;
DROP TABLE IF EXISTS PizzaBestelling.BestellingPizza;
GO

DROP SCHEMA IF EXISTS PizzaBestelling;
GO
CREATE SCHEMA PizzaBestelling;
GO

CREATE TABLE PizzaBestelling.Klant
(
	id				int,
	voornaam		varchar(50) NOT NULL,
	naam			varchar(50),
	straat			varchar(50),
	huisnummer		int,
	postcode		varchar(10),
	gemeente		varchar(50),
	geslacht		varchar(1),
	geboortedatum	date,
	CONSTRAINT PK_Klant PRIMARY KEY (id),
	CONSTRAINT CK_Klant_geslacht
		CHECK (geslacht = 'M' OR geslacht = 'V')
);

CREATE TABLE PizzaBestelling.Medewerker
(
	id				int,
	voornaam		varchar(50) NOT NULL,
	naam			varchar(50),
	straat			varchar(50),
	huisnummer		int,
	postcode		varchar(10),
	gemeente		varchar(50),
	geslacht		varchar(1),
	geboortedatum	date,
	CONSTRAINT PK_Medewerker PRIMARY KEY (id),
	CONSTRAINT CK_Medewerker_geslacht
		CHECK (geslacht = 'M' OR geslacht = 'V')
);

CREATE TABLE PizzaBestelling.Status
(
	id		int,
	naam	varchar(50) NOT NULL,
	CONSTRAINT PK_Status PRIMARY KEY (id)
);

CREATE TABLE PizzaBestelling.PizzaGrootte
(
	id		int,
	naam	varchar(50) NOT NULL,
	CONSTRAINT PK_PizzaGrootte PRIMARY KEY (id)
);

CREATE TABLE PizzaBestelling.Pizza
(
	id		int,
	naam	varchar(50) NOT NULL,
	grootte	int	NOT NULL,
	prijs	money NOT NULL,
	CONSTRAINT PK_Pizza PRIMARY KEY (id),
	CONSTRAINT FK_Pizza_grootte
		FOREIGN KEY (grootte)
		REFERENCES PizzaBestelling.PizzaGrootte (id)
);

CREATE TABLE PizzaBestelling.Bestelling
(
	id				int,
	klantid			int NOT NULL,
	medewerkerid	int NOT NULL,
	statusid		int NOT NULL,
	datum			date NOT NULL,
	bezorging		bit	NOT NULL,
	CONSTRAINT	PK_Bestelling PRIMARY KEY (id),
	CONSTRAINT	FK_Bestelling_klantid
		FOREIGN KEY	(klantid)
		REFERENCES	PizzaBestelling.Klant (id) ON DELETE CASCADE,
	CONSTRAINT	FK_Bestelling_medewerkerid
		FOREIGN KEY (medewerkerid)
		REFERENCES	PizzaBestelling.Medewerker (id),
	CONSTRAINT	FK_Bestelling_statusid
		FOREIGN KEY (statusid)
		REFERENCES	PizzaBestelling.Status (id)
);

CREATE TABLE PizzaBestelling.BestellingPizza
(
	id				int,
	bestellingid	int NOT NULL,
	pizzaid			int NOT NULL,
	aantal			int NOT NULL,
	korting			float NOT NULL,
	CONSTRAINT	PK_BestellingPizza PRIMARY KEY (id),
	CONSTRAINT	FK_Bestelling_bestellingid
		FOREIGN KEY (bestellingid)
		REFERENCES	PizzaBestelling.Bestelling (id),
	CONSTRAINT	FK_Bestelling_pizzaid
		FOREIGN KEY (pizzaid)
		REFERENCES	PizzaBestelling.Pizza (id),
);


-- Opvullen [Klant]
INSERT INTO [PizzaBestelling].[Klant] VALUES(1,'Jean','Peeters','Adelberg',15,3920,'Lommel','M','01-27-1989');
INSERT INTO [PizzaBestelling].[Klant] VALUES(2,'Maria','Janssens','Balendijk',27,3920,'Lommel','V','03-23-1985');
INSERT INTO [PizzaBestelling].[Klant] VALUES(3,'Marc','Maes','Hoogstraat',37,3920,'Lommel','M','02-17-1995');
INSERT INTO [PizzaBestelling].[Klant] VALUES(4,'Nathalie','Peeters','Binnensingel',18,3920,'Lommel','V','06-15-1996');
INSERT INTO [PizzaBestelling].[Klant] VALUES(5,'Patrick','Mertens','Nijshoek',45,3920,'Lommel','M','12-23-1999');
INSERT INTO [PizzaBestelling].[Klant] VALUES(6,'Maarten','Boonen','Blokstraat',29,2440,'Geel','M','12-18-1998');
INSERT INTO [PizzaBestelling].[Klant] VALUES(7,'An','De Smet','Kalverstraat',37,2440,'Geel','V','10-12-1993');
INSERT INTO [PizzaBestelling].[Klant] VALUES(8,'Emma','Peeters','Molenstraat',17,2440,'Geel','V','04-17-1997');
INSERT INTO [PizzaBestelling].[Klant] VALUES(9,'Stefanie','Wouters','Gasthuisstraat',19,2440,'Geel','V','05-16-1997');
INSERT INTO [PizzaBestelling].[Klant] VALUES(10,'Ruben','De Smet','Ossemeer',26,2440,'Geel','M','06-16-1991');
INSERT INTO [PizzaBestelling].[Klant] VALUES(11,'Rita','Maes','Bareelstraat',13,2300,'Turnhout','V','06-30-1985');
INSERT INTO [PizzaBestelling].[Klant] VALUES(12,'Nicole','Peeters','Kastelein',05,2300,'Turnhout','V','05-13-1989');
INSERT INTO [PizzaBestelling].[Klant] VALUES(13,'Anne','Claes','Kruishuisstraat',09,2300,'Turnhout','V','07-16-1985');
INSERT INTO [PizzaBestelling].[Klant] VALUES(14,'Martine','Goossens','Spoorwegstraat',35,2300,'Turnhout','V','10-15-1979');
INSERT INTO [PizzaBestelling].[Klant] VALUES(15,'Bieke','Willems','Molenstraat',104,2300,'Turnhout','V','11-11-1974');
INSERT INTO [PizzaBestelling].[Klant] VALUES(16,'Karel','Jacobs','Akkerstraat',97,2491,'Balen','M','01-06-1975');
INSERT INTO [PizzaBestelling].[Klant] VALUES(17,'Thomas','Van Gestel','Kromstraat',45,2491,'Balen','M','08-27-1983');
INSERT INTO [PizzaBestelling].[Klant] VALUES(18,'David','Boonen','Leopoldlaan',73,2491,'Balen','M','07-16-1984');
INSERT INTO [PizzaBestelling].[Klant] VALUES(19,'Michael','Willems','Broekstraat',41,2491,'Balen','M','06-14-1987');
INSERT INTO [PizzaBestelling].[Klant] VALUES(20,'Jan','De Smet','Rijsberg',86,2491,'Balen','M','02-23-1989');


-- Opvullen [Medewerker]
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(1,'Carine','Declercq','Broekstraat',17,2491,'Balen','V','03-14-1980');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(2,'Chantal','De Pauw','Postelweg',13,2491,'Balen','V','01-27-1985');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(3,'Laura','Pollet','Populierenstraat',26,2491,'Balen','V','03-13-1984');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(4,'Emma','De Meyer','Holven',16,2491,'Balen','V','05-17-1986');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(5,'Julie','Bauwens','Zandstraat',32,2491,'Balen','V','07-19-1988');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(6,'Kevin','Vermeiren','Kerkplein',64,2300,'Turnhout','M','09-23-1990');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(7,'Vincent','Jansen','Kongostraat',39,2300,'Turnhout','M','11-26-1992');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(8,'Sophie','Verstraeten','Klinkstraat',104,2300,'Turnhout','V','02-03-1991');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(9,'Marleen','Lievens','Begijnhof',164,2300,'Turnhout','V','04-30-1989');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(10,'Pascal','Pieters','Broekstraat',46,2300,'Turnhout','M','06-01-1987');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(11,'Charlotte','Ceulemans','Liesdonk',39,2440,'Geel','V','08-03-1985');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(12,'Laurent','Nijs','Lijsterstraat',87,2440,'Geel','M','10-07-1983');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(13,'Wim','De Decker','Drijhoek',54,2440,'Geel','M','12-09-1982');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(14,'Sandra','Daems','Larumseweg',78,2440,'Geel','V','01-15-1984');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(15,'Thierry','Gielen','Kwakkelberg',16,2440,'Geel','M','03-17-1986');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(16,'Cindy','Roels','Kattenbos',91,3920,'Lommel','V','05-19-1989');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(17,'Frank','Verbruggen','Roerstraat',94,3920,'Lommel','M','07-23-1999');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(18,'Jonathan','De Bruyn','Driehoek',31,3920,'Lommel','M','09-25-1998');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(19,'Hugo','Verdonck','Fabriekstraat',78,3920,'Lommel','M','11-29-1995');
INSERT INTO [PizzaBestelling].[Medewerker] VALUES(20,'Suzanne','Luyten','Spechtstraat',14,3920,'Lommel','V','12-30-2000');

-- Opvullen [PizzaGrootte]
INSERT INTO [PizzaBestelling].[PizzaGrootte] VALUES(1,'small');
INSERT INTO [PizzaBestelling].[PizzaGrootte] VALUES(2,'medium');
INSERT INTO [PizzaBestelling].[PizzaGrootte] VALUES(3,'large');
INSERT INTO [PizzaBestelling].[PizzaGrootte] VALUES(4,'XL');
INSERT INTO [PizzaBestelling].[PizzaGrootte] VALUES(5,'XXL');

-- Opvullen [Pizza]
INSERT INTO [PizzaBestelling].[Pizza] VALUES(1,'margherita',1,8);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(2,'margherita',2,10);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(3,'margherita',3,12);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(4,'margherita',4,13);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(5,'margherita',5,14);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(6,'Peperoni',1,9);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(7,'Peperoni',2,11);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(8,'Peperoni',3,13);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(9,'Peperoni',4,14);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(10,'Peperoni',5,15);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(11,'Bolognese',1,10);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(12,'Bolognese',2,12);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(13,'Bolognese',3,14);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(14,'Bolognese',4,15);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(15,'Bolognese',5,16);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(16,'Kebap',1,11);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(17,'Kebap',2,13);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(18,'Kebap',3,15);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(19,'Kebap',4,16);
INSERT INTO [PizzaBestelling].[Pizza] VALUES(20,'Kebap',5,17);

-- Opvullen [Status]
INSERT INTO [PizzaBestelling].[Status] VALUES(1,'Besteld');
INSERT INTO [PizzaBestelling].[Status] VALUES(2,'in Verwerking');
INSERT INTO [PizzaBestelling].[Status] VALUES(3,'Onderweg');
INSERT INTO [PizzaBestelling].[Status] VALUES(4,'Geleverd');

-- Opvullen [Bestelling]
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(1,1,2,1,'03-15-2022',0);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(2,10,6,2,'03-15-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(3,2,4,1,'03-15-2022',0);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(4,14,15,1,'03-15-2022',0);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(5,9,9,3,'03-15-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(6,3,8,2,'03-15-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(7,15,16,4,'02-28-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(8,4,20,3,'03-15-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(9,13,17,2,'03-15-2022',0);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(10,18,7,3,'03-15-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(11,12,14,2,'03-15-2022',0);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(12,5,18,3,'03-15-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(13,8,10,3,'03-15-2022',0);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(14,6,11,2,'03-15-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(15,19,13,4,'03-14-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(16,16,19,3,'03-15-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(17,11,12,4,'02-28-2022',0);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(18,7,3,4,'03-11-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(19,20,5,4,'03-10-2022',1);
INSERT INTO [PizzaBestelling].[Bestelling] VALUES(20,17,1,4,'03-13-2022',0);

-- Opvullen [BestllingPizza]

INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(1,1,1,1,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(2,1,7,1,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(3,2,19,2,7.5);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(4,2,17,1,7.5);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(5,3,12,1,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(6,4,6,2,5.5);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(7,5,2,2,5);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(8,6,8,1,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(9,6,12,2,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(10,6,15,1,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(11,7,3,1,5);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(12,7,4,1,5);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(13,8,6,1,7);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(14,8,9,2,7);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(15,9,11,3,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(16,10,13,1,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(17,11,15,3,5);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(18,11,17,1,5);
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(19,12,19,2,'');
INSERT INTO [PizzaBestelling].[BestellingPizza] VALUES(20,12,20,1,'');