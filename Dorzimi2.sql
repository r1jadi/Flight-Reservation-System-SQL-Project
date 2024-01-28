Create Database Sistemi

Use Sistemi 

Create table Perdoruesi(
	ID_Perdoruesi int Primary Key,
	Emri varchar(15) not null,
	Mbiemri varchar(15) not null,
	Destinacioni varchar(15) not null,
	MenyraEPageses varchar(15) not null,
	Qyteti varchar(15) not null,
	Rruga varchar(15) not null,
	ZIPCode int not null,

	ID_Perdoruesi_FK INT,
    FOREIGN KEY (ID_Perdoruesi_FK) REFERENCES Perdoruesi(ID_Perdoruesi),

	SistemiID int foreign key references SistemiWEB(ID_Sistemi) unique,

	BankaID INT FOREIGN KEY REFERENCES Banka(ID_Banka),

	AeroplaniID INT FOREIGN KEY REFERENCES Aeroplani(ID_Aeroplani)
);

Create Table SistemiWEB(
	ID_Sistemi int Primary Key,
	Webfaqja varchar(30) not null,
	KohaFillimit time,
	KohaMbarimit time
);

CREATE TABLE NrTel (
    IDNrTel INT,
    ID_Perdoruesi INT,
    Emri VARCHAR(15) NOT NULL,
    Mbiemri VARCHAR(15) NOT NULL,
    Destinacioni VARCHAR(15) NOT NULL,
    MenyraEPageses VARCHAR(15) NOT NULL,
    Qyteti VARCHAR(15) NOT NULL,
    Rruga VARCHAR(15) NOT NULL,
    ZIPCode INT NOT NULL,

    PRIMARY KEY (ID_Perdoruesi, IDNrTel),

    PerdoruesiID INT FOREIGN KEY REFERENCES Perdoruesi(ID_Perdoruesi)
);

CREATE TABLE Pagesa (
    ID_Perdoruesi INT,
    ID_Pagesa INT,
    DataPageses DATE NOT NULL,
    ShumaPageses INT NOT NULL,

    Constraint PK_Pagesa PRIMARY KEY (ID_Perdoruesi, ID_Pagesa),
    PerdoruesiID INT FOREIGN KEY REFERENCES Perdoruesi(ID_Perdoruesi)
);

Create Table Banka(
	ID_Banka int Primary Key,
	NumriKontaktues int not null,
	Shteti varchar(15) not null,
	ZIPCode int not null,
	Rruga varchar(15) not null
);

Create Table Rezervimi(
	ID_Rezervimi int Primary Key,
	Data date not null,
	Ulesja int not null,
	NumriFluturimit int not null
);

Create Table Ushqimi(
	Emri varchar(15),
	ID_Rezervimi int,
    Lloji varchar(15) not null,
	DataProdhimit date not null,
	DataSkadimit date not null,

    Constraint PK_Ushqimi PRIMARY KEY (Emri, ID_Rezervimi),
    RezervimiID INT FOREIGN KEY REFERENCES Rezervimi(ID_Rezervimi)
);

Create Table Permbajtja(
	Emri varchar(15),
	ID_Permbajtja int,
	Lloji varchar(15) not null,
	DataProdhimit date not null,
	DataSkadimit date not null,

	Constraint PK_Permbajtja PRIMARY KEY(Emri, ID_Permbajtja),
    UshqimiEmri varchar(15),
    UshqimiID int,
    FOREIGN KEY (UshqimiEmri, UshqimiID) REFERENCES Ushqimi(Emri, ID_Rezervimi)
	
);

Create Table Fluturimi(
	ID_Fluturimi int Primary Key,
	Vendndodhja varchar(15) not null,
	Destinacioni varchar(15) not null,

	AeroplaniID INT FOREIGN KEY REFERENCES Aeroplani(ID_Aeroplani),
	AgjensioniID INT FOREIGN KEY REFERENCES Agjensioni(ID_Agjensioni)
	
);

Create Table Koha(
	ID_Koha INT,
	ID_Fluturimi INT,
	Vendndodhja varchar not null,
	Destinacioni varchar not null,

	Constraint PK_Koha Primary Key(ID_Koha, ID_Fluturimi),

	FluturimiID INT FOREIGN KEY REFERENCES Fluturimi(ID_Fluturimi)

);

Create Table Aeroporti(
	ID_Aeroporti int primary key,
	Emri varchar(15) not null,
	Qyteti varchar(15) not null,
	Shteti varchar(15) not null,
	Rruga varchar(15) not null,

	FluturimiID INT FOREIGN KEY REFERENCES Fluturimi(ID_Fluturimi)
	
);

Create Table Agjensioni(
	ID_Agjensioni int primary key,
	Emri varchar(15) not null,
	Licensa varchar(15) not null,
	Rruga varchar(15) not null,
	Qyteti varchar(15) not null,
);

Create Table Aeroplani(
	ID_Aeroplani int primary key,
	Pronari varchar(15) not null,
	Lloji varchar(15) not null,
	VitiProdhimit int not null,

	AgjensioniID INT FOREIGN KEY REFERENCES Agjensioni(ID_Agjensioni)
);

Create Table Ulesja(
	ID_Aeroplani int,
	ID_Ulesja int,
	Lloji varchar(15) not null,
	Klasa varchar(15) not null,
	Vendi varchar(15) not null,

	Constraint PK_Ulesja Primary Key(ID_Aeroplani, ID_Ulesja),
	AeroplaniID INT FOREIGN KEY REFERENCES Aeroplani(ID_Aeroplani)
);

Create Table Marreveshje(
	ID_Agjensioni INT,
	ID_Aeroporti INT,

	Marreveshja varchar(25) not null,

	Constraint PK_Marreveshje PRIMARY KEY(ID_Agjensioni, ID_Aeroporti),
	AeroportiID INT Foreign Key References Aeroporti(ID_Aeroporti),
	AgjensioniID INT Foreign Key References Agjensioni(ID_Agjensioni)
);


INSERT INTO SistemiWEB (ID_Sistemi, Webfaqja, KohaFillimit, KohaMbarimit)
VALUES
(1, 'www.sistemi1.com', '12:00:00', '12:00:12'),
(2, 'www.sistemi3.com', '07:00:00', '07:00:56'),
(3, 'www.sistemi4.com', '06:00:00', '06:00:12'),
(4, 'www.sistemi5.com', '05:00:00', '05:00:23'),
(5, 'www.sistemi6.com', '04:00:00', '04:00:44'),
(6, 'www.sistemi7.com', '03:00:00', '03:00:23'),
(7, 'www.sistemi8.com', '02:00:00', '02:00:43'),
(8, 'www.sistemi9.com', '01:00:00', '01:00:54'),
(9, 'www.sistemi10.com', '12:00:00', '12:00:12'),
(10, 'www.sistemi11.com', '11:00:00', '11:00:21')

Select *
From SistemiWEB

INSERT INTO Perdoruesi (ID_Perdoruesi, Emri, Mbiemri, Destinacioni, MenyraEPageses, Qyteti, Rruga, ZIPCode, ID_Perdoruesi_FK, SistemiID, BankaID, AeroplaniID)
VALUES
(1, 'John', 'Doe', 'London', 'Credit Card', 'Seoul', 'Maple Avenue', 90210, 1, 1, 1, 1),
(2, 'Olivia', 'Thompson', 'Paris', 'PayPal', 'Vancouver', 'Elm Street', 10001, 2, 2, 2, 2),
(3, 'Ethan', 'Reynolds', 'Tokyo', 'Cash', 'Nairobi', 'Oak Lane', 30301, 3, 3, 3, 3),
(4, 'Ava', 'Mitchell', 'Istanbul', 'PayPal', 'Reykjavik', 'Cedar Boulevard', 75201, 4, 4, 4, 4),
(5, 'Mason', 'Turner', 'Cairo', 'Credit Card', 'Lima', 'Pinecrest Drive', 94102, 5, 5, 5, 5),
(6, 'Zoe', 'Ramirez', 'Sydney', 'PayPal', 'Munich', 'Willow Lane', 60601, 6, 6, 6, 6),
(7, 'Caleb', 'Morgan', 'Vancouver', 'Credit Card', 'Mumbai', 'Birchwood Terrace', 90045, 7, 7, 7, 7),
(8, 'Sophia', 'Patel', 'Mumbai', 'PayPal', 'New Orleans', 'Sycamore Lane', 33101, 8, 8, 8, 8),
(9, 'Jackson', 'Hayes', 'Barcelona', 'Cash', 'Casablanca', 'Magnolia Court', 20001, 9, 9, 9, 9),
(10, 'Lily', 'Bennett', 'Buenos Aires', 'PayPal', 'Osaka', 'Juniper Way', 97201, 10, 10, 10, 10);

ALTER TABLE Perdoruesi
ALTER COLUMN Rruga varchar(50);

Select *
From Perdoruesi

INSERT INTO NrTel (IDNrTel, ID_Perdoruesi, Emri, Mbiemri, Destinacioni, MenyraEPageses, Qyteti, Rruga, ZIPCode, PerdoruesiID)
VALUES
(5551234, 1, 'John', 'Doe', 'London', 'Credit Card', 'Seoul', 'Maple Avenue', 90210, 1),
(9876543, 2, 'Olivia', 'Thompson', 'Paris', 'PayPal', 'Vancouver', 'Elm Street', 10001, 2),
(1234567, 3, 'Ethan', 'Reynolds', 'Tokyo', 'Cash', 'Nairobi', 'Oak Lane', 30301, 3), -- u fshi
(5559876, 4, 'Ava', 'Mitchell', 'Istanbul', 'PayPal', 'Reykjavik', 'Cedar Boulevard', 75201, 4),
(7890123, 5, 'Mason', 'Turner', 'Cairo', 'Credit Card', 'Lima', 'Pinecrest Drive', 94102, 5),
(2345678, 6, 'Zoe', 'Ramirez', 'Sydney', 'PayPal', 'Munich', 'Willow Lane', 60601, 6),
(8765432, 7, 'Caleb', 'Morgan', 'Vancouver', 'Credit Card', 'Mumbai', 'Birchwood Terrace', 90045, 7),
(3210987, 8, 'Sophia', 'Patel', 'Mumbai', 'PayPal', 'New Orleans', 'Sycamore Lane', 33101, 8),
(4567890, 9, 'Jackson', 'Hayes', 'Barcelona', 'Cash', 'Casablanca', 'Magnolia Court', 20001, 9),
(9998887, 10, 'Lily', 'Bennett', 'Buenos Aires', 'PayPal', 'Osaka', 'Juniper Way', 97201, 10);

ALTER TABLE NrTel
ALTER COLUMN Rruga varchar(50);

Select * 
From NrTel

INSERT INTO Pagesa (ID_Perdoruesi, ID_Pagesa, DataPageses, ShumaPageses, PerdoruesiID)
VALUES
  (1, 1, '2023-01-01', 100, 1),
  (2, 2, '2023-01-02', 150, 2),
  (3, 3, '2023-01-03', 200, 3),
  (4, 4, '2023-01-04', 120, 4),
  (5, 5, '2023-01-05', 180, 5),
  (6, 6, '2023-01-06', 90, 6),
  (7, 7, '2023-01-07', 130, 7),
  (8, 8, '2023-01-08', 110, 8),
  (9, 9, '2023-01-09', 160, 9),
  (10, 10, '2023-01-10', 140, 10);

  Select *
  From Pagesa

INSERT INTO Banka (ID_Banka, NumriKontaktues, Shteti, ZIPCode, Rruga)
VALUES
  (1, 123456789, 'Albania', 12345, 'Shqiperia Avenue'),
  (2, 987654321, 'Bosnia and Herzegovina', 54321, 'Sarajevo Street'),
  (3, 111223344, 'Bulgaria', 67890, 'Sofia Boulevard'),
  (4, 555666777, 'Croatia', 11111, 'Dubrovnik Lane'),
  (5, 999888777, 'Greece', 22222, 'Athens Avenue'),
  (6, 333222111, 'Kosovo', 33333, 'Pristina Place'),
  (7, 777888999, 'Montenegro', 44444, 'Podgorica Drive'),
  (8, 444555666, 'North Macedonia', 55555, 'Skopje Street'),
  (9, 666999888, 'Romania', 66666, 'Bucharest Boulevard'),
  (10, 888777666, 'Turkey', 77777, 'Istambul main');

ALTER TABLE Banka
ALTER COLUMN Rruga varchar(50);

ALTER TABLE Banka
ALTER COLUMN Shteti varchar(50);

Select * 
From Banka

INSERT INTO Rezervimi (ID_Rezervimi, Data, Ulesja, NumriFluturimit)
VALUES
  (1, '2023-01-01', 1, 101),
  (2, '2023-01-02', 2, 102),
  (3, '2023-01-03', 3, 103),
  (4, '2023-01-04', 4, 104),
  (5, '2023-01-05', 5, 105),
  (6, '2023-01-06', 6, 106),
  (7, '2023-01-07', 7, 107),
  (8, '2023-01-08', 8, 108),
  (9, '2023-01-09', 9, 109),
  (10, '2023-01-10', 10, 110);

Select *
From Rezervimi

INSERT INTO Ushqimi (Emri, ID_Rezervimi, Lloji, DataProdhimit, DataSkadimit, RezervimiID)
VALUES
  ('Sushi', 1, 'Kinez', '2023-01-01', '2023-01-10',1),
  ('Pasta Carbonara', 2, 'Pasta', '2023-01-02', '2023-01-11',2),
  ('Tacos', 3, 'Mexican', '2023-01-03', '2023-01-12',3),
  ('Chicken Curry', 4, 'Indian', '2023-01-04', '2023-01-13',4),
  ('Pizza', 5, 'Italian', '2023-01-05', '2023-01-14',5),
  ('Caesar Salad', 6, 'Greek', '2023-01-06', '2023-01-15',6),
  ('Chocolate', 7, 'Snack', '2023-01-07', '2023-01-16',7),
  ('Beef Stir-Fry', 8, 'Meat', '2023-01-08', '2023-01-17',8),
  ('Falafel Wrap', 9, 'Snack', '2023-01-09', '2023-01-18',9),
  ('Cheesecake', 10, 'Snack', '2023-01-10', '2023-01-19',10);

Select *
From Ushqimi

INSERT INTO Permbajtja (Emri, ID_Permbajtja, Lloji, DataProdhimit, DataSkadimit, UshqimiEmri, UshqimiID)
VALUES
  ('Permbajtja1', 1, 'Kinez', '2023-01-01', '2023-01-10', 'Sushi', 1),
  ('Permbajtja2', 2, 'Pasta', '2023-01-02', '2023-01-11', 'Pasta Carbonara', 2),
  ('Permbajtja3', 3, 'Mexican', '2023-01-03', '2023-01-12', 'Tacos', 3),
  ('Permbajtja4', 4, 'Indian', '2023-01-04', '2023-01-13', 'Chicken Curry', 4),
  ('Permbajtja5', 5, 'Italian', '2023-01-05', '2023-01-14', 'Pizza', 5),
  ('Permbajtja6', 6, 'Greek', '2023-01-06', '2023-01-15', 'Caesar Salad', 6),
  ('Permbajtja7', 7, 'Snack', '2023-01-07', '2023-01-16', 'Chocolate', 7),
  ('Permbajtja8', 8, 'Meat', '2023-01-08', '2023-01-17', 'Beef Stir-Fry', 8),
  ('Permbajtja9', 9, 'Snack', '2023-01-09', '2023-01-18', 'Falafel Wrap', 9),
  ('Permbajtja10', 10, 'Snack', '2023-01-10', '2023-01-19', 'Cheesecake', 10);

  Select *
  From Permbajtja

INSERT INTO Fluturimi (ID_Fluturimi, Vendndodhja, Destinacioni, AeroplaniID, AgjensioniID)
VALUES
  (1, 'Atlanta', 'Beijing', 1, 1),
  (2, 'Dubai', 'London', 2, 2),
  (3, 'Tokyo', 'Los Angeles', 3, 3),
  (4, 'Chicago', 'Istanbul', 4, 4),
  (5, 'Singapore City', 'Frankfurt', 5, 5),
  (6, 'Amsterdam', 'Hong Kong', 6, 6),
  (7, 'New York City', 'Paris', 7, 7),
  (8, 'Doha', 'Toronto', 8, 8),
  (9, 'Sydney', 'Seoul', 9, 9),
  (10, 'Munich', 'San Francisco', 10, 10);

  Select *
  From Fluturimi

INSERT INTO Koha (ID_Koha, ID_Fluturimi, Vendndodhja, Destinacioni, FluturimiID)
VALUES
  (1, 1, 'Atlanta', 'Beijing', 1),
  (2, 2, 'Dubai', 'London', 2),
  (3, 3, 'Tokyo', 'Los Angeles', 3),
  (4, 4, 'Chicago', 'Istanbul', 4),
  (5, 5, 'Singapore City', 'Frankfurt', 5),
  (6, 6, 'Amsterdam', 'Hong Kong', 6),
  (7, 7, 'New York City', 'Paris', 7),
  (8, 8, 'Doha', 'Toronto', 8),
  (9, 9, 'Sydney', 'Seoul', 9),
  (10, 10, 'Munich', 'San Francisco', 10);

ALTER TABLE Koha
ALTER COLUMN Vendndodhja varchar(50);

ALTER TABLE Koha
ALTER COLUMN Destinacioni varchar(50);

Select *
From Koha

INSERT INTO Aeroporti (ID_Aeroporti, Emri, Qyteti, Shteti, Rruga, FluturimiID)
VALUES
  (1, 'Atlanta Airport', 'Atlanta', 'United States', 'Airport Boulevard', 1),
  (2, 'Heathrow Airport', 'London', 'United Kingdom', 'Compass Centre', 2),
  (3, 'Dubai Airport', 'Dubai', 'UAE', 'Airport Road', 3),
  (4, 'CDG', 'Paris', 'France', 'Roissy-en-France', 4),
  (5, 'Beijing Airport', 'Beijing', 'China', 'Airport North Road', 5),
  (6, 'LAX', 'Los Angeles', 'United States', 'World Way', 6),
  (7, 'Chicago Aeroport', 'Chicago', 'United States', 'West O Hare', 7),
  (8, 'Istanbul Airport', 'Istanbul', 'Turkey', 'Tayakadın', 8),
  (9, 'Singapore Airport ', 'Singapore', 'Singapore', 'Airport Boulevard', 9),
  (10, 'Frankfurt Airport', 'Frankfurt', 'Germany', 'Hugo-Eckener-Ring', 10);

ALTER TABLE Aeroporti
ALTER COLUMN Rruga varchar(50);
ALTER TABLE Aeroporti
ALTER COLUMN Emri varchar(50);

Select *
From Aeroporti 

INSERT INTO Agjensioni (ID_Agjensioni, Emri, Licensa, Rruga, Qyteti)
VALUES
  (1, 'Delta Air Lines', 'ATPL', 'Hartsfield-Jackson', 'Atlanta'),
  (2, 'British Airways', 'ATPL', 'London', 'Waterside'),
  (3, 'Emirates', 'ATPL', 'Airport Road', 'Dubai'),
  (4, 'Air France', 'ATPL', '45 Rue de Paris', 'Paris'),
  (5, 'Air China', 'ATPL', '30 Tianzhu Road', 'Beijing'),
  (6, 'Qantas Airways', 'ATPL', '10 Bourke Road', 'New South Wales'),
  (7, 'American Airlines', 'ATPL', '1 Skyview Drive', 'Texas'),
  (8, 'Turkish Airlines', 'ATPL', 'Ataturk Airport', 'Istanbul'),
  (9, 'Singapore Airlines', 'ATPL', '25 Airline Road', 'Singapore'),
  (10, 'Lufthansa', 'ATPL', 'Terminal 1', 'Cologne');

ALTER TABLE Agjensioni
ALTER COLUMN Rruga varchar(50);

ALTER TABLE Agjensioni
ALTER COLUMN Emri varchar(50);

Select * 
From Agjensioni

INSERT INTO Aeroplani (ID_Aeroplani, Pronari, Lloji, VitiProdhimit, AgjensioniID)
VALUES
  (1, 'Delta Air Lines', 'Airbus A380', 2020, 1),
  (2, 'British Airways', 'Boeing 747', 2019, 2),
  (3, 'Emirates', 'Airbus A330', 2018, 3),
  (4, 'Air France', 'Boeing 777', 2017, 4),
  (5, 'Air China', 'Boeing 787', 2016, 5),
  (6, 'Qantas Airways', 'Airbus A350', 2015, 6),
  (7, 'American Airlines', 'Boeing 767:', 2014, 7),
  (8, 'Turkish Airlines', 'Airbus A320', 2013, 8),
  (9, 'Singapore Airlines', 'Boeing 737', 2012, 9),
  (10, 'Lufthansa', 'Embraer E-Jet', 2011, 10);

ALTER TABLE Aeroplani
ALTER COLUMN Pronari varchar(50);

Select *
From Aeroplani

INSERT INTO Ulesja (ID_Aeroplani, ID_Ulesja, Lloji, Klasa, Vendi, AeroplaniID)
VALUES
  (1, 1, 'Family Seat', 'Family', '1A', 1),
  (2, 2, 'Bussiness Seat', 'Bussiness', '2B', 2),
  (3, 3, 'VIP Seat', 'VIP', '3C', 3),
  (4, 4, 'First Seat', 'First', '4D', 4),
  (5, 5, 'Second Seat', 'Second', '5A', 5),
  (6, 6, 'Family Seat', 'Family', '7D', 6),
  (7, 7, 'Bussiness Seat', 'Bussiness', '9C', 7),
  (8, 8, 'Bussiness Seat', 'Bussiness', '3E', 8),
  (9, 9, 'First Seat', 'First', '9Q', 9),
  (10, 10, 'Second Seat', 'Second', '2R', 10);

Select *
From Ulesja

INSERT INTO Marreveshje (ID_Agjensioni, ID_Aeroporti, Marreveshja, AeroportiID, AgjensioniID)
VALUES
  (1, 1, 'Marreveshja1', 1, 1),
  (2, 2, 'Marreveshja2', 2, 2),
  (3, 3, 'Marreveshja3', 3, 3),
  (4, 4, 'Marreveshja4', 4, 4),
  (5, 5, 'Marreveshja5', 5, 5),
  (6, 6, 'Marreveshja6', 6, 6),
  (7, 7, 'Marreveshja7', 7, 7),
  (8, 8, 'Marreveshja8', 8, 8),
  (9, 9, 'Marreveshja9', 9, 9),
  (10, 10, 'Marreveshja10', 10, 10);

  /*(11, 11, 'Marreveshja11', 11, 11),
  (12, 12, 'Marreveshja12', 12, 12),
  (13, 13, 'Marreveshja13', 13, 13),
  (14, 14, 'Marreveshja14', 14, 14),
  (15, 15, 'Marreveshja15', 15, 15),
  (16, 16, 'Marreveshja16', 16, 16),
  (17, 17, 'Marreveshja17', 17, 17),
  (18, 18, 'Marreveshja18', 18, 18),
  (19, 19, 'Marreveshja19', 19, 19),
  (20, 20, 'Marreveshja20', 20, 20),
  (21, 21, 'Marreveshja21', 21, 21),
  (22, 22, 'Marreveshja22', 22, 22),
  (23, 23, 'Marreveshja23', 23, 23),
  (24, 24, 'Marreveshja24', 24, 24),
  (25, 25, 'Marreveshja25', 25, 25);*/

  Select *
  From Marreveshje

UPDATE Perdoruesi
SET Emri = 'Rijad', Mbiemri = 'Halili'
WHERE ID_Perdoruesi IN (1);

UPDATE Perdoruesi
SET Emri = 'Filan', Mbiemri = 'Fisteku'
WHERE ID_Perdoruesi = 6;

Select *
From Perdoruesi

UPDATE NrTel
SET Emri = 'Rijad', Mbiemri = 'Halili'
WHERE ID_Perdoruesi = 1;

UPDATE NrTel
SET Emri = 'Filan', Mbiemri = 'Fisteku'
WHERE ID_Perdoruesi = 6;

Select *
From NrTel

UPDATE SistemiWEB
SET Webfaqja = 'www.newweb.com'
WHERE ID_Sistemi = 4;

UPDATE SistemiWEB
SET KohaFillimit = '07:01:00', KohaMbarimit = '07:02:57'
WHERE ID_Sistemi = 4;

Select *
From SistemiWEB

UPDATE Pagesa
SET ShumaPageses = 300
WHERE PerdoruesiID IN (5,6);

UPDATE Pagesa
SET ShumaPageses = 450
WHERE PerdoruesiID IN (8,10);

Select *
From Pagesa

UPDATE Banka
SET NumriKontaktues = 44444111
WHERE ID_Banka LIKE(2);

UPDATE Banka
SET NumriKontaktues = 45444111
WHERE ID_Banka LIKE(5);

Select *
From Banka

UPDATE Rezervimi
SET Data = '2023-01-02'
WHERE ID_Rezervimi = 7;

UPDATE Rezervimi
SET Data = '2023-10-05'
WHERE ID_Rezervimi IN (6,9);

Select *
From Rezervimi

UPDATE Fluturimi
SET Vendndodhja = 'Prishtine', Destinacioni = 'Stamboll'
WHERE ID_Fluturimi LIKE (1);

UPDATE Fluturimi
SET Vendndodhja = 'Tirane', Destinacioni = 'Beograd'
WHERE ID_Fluturimi IN (4,5);

Select *
From Fluturimi

UPDATE Koha
SET Vendndodhja = 'Prishtine', Destinacioni = 'Stamboll'
WHERE ID_Koha LIKE (1);

UPDATE Koha
SET Vendndodhja = 'Tirane', Destinacioni = 'Beograd'
WHERE ID_Koha IN (4,5);

Select *
From Koha

UPDATE Ulesja
SET Lloji = 'Family Seat', Klasa = 'Family', Vendi = '2Z'
WHERE ID_Ulesja = 5;

UPDATE Ulesja
SET Lloji = 'VIP Seat', Klasa = 'VIP', Vendi = '3V'
WHERE ID_Ulesja = 6;

UPDATE Ulesja
SET Lloji = 'Family Seat', Klasa = 'Family', Vendi = '4F'
WHERE ID_Ulesja = 8;

UPDATE Ulesja
SET Lloji = 'VIP Seat', Klasa = 'VIP', Vendi = '2V'
WHERE ID_Ulesja = 10;

Select *
From Ulesja

DELETE FROM NrTel
WHERE ID_Perdoruesi = 3;

DELETE FROM Pagesa
WHERE PerdoruesiID = 6;

DELETE FROM Permbajtja
WHERE UshqimiID = 3;

DELETE FROM Koha
WHERE ID_Fluturimi = 2;

DELETE FROM Ulesja
WHERE ID_Aeroplani = 2;

DELETE FROM Marreveshje
WHERE ID_Agjensioni = 2;

DELETE FROM Permbajtja
WHERE UshqimiEmri = 'Chocolate';

DELETE FROM Ushqimi
WHERE Emri = 'Chocolate';

DELETE FROM Marreveshje
WHERE AeroportiID = 4;

DELETE FROM Aeroporti
WHERE ID_Aeroporti = 4;


--4 Te thjeshta 1 tabele(Rijadi)
Select Emri, Mbiemri, Destinacioni
From Perdoruesi
Where Emri LIKE 'R%' AND Destinacioni = 'London'

Select ID_Aeroplani, Pronari, VitiProdhimit
From Aeroplani
Where VitiProdhimit > 2015 AND Pronari IN ('British Airways', 'Air China')

Select *
From SistemiWEB
WHERE ID_Sistemi in (1,2,4,5)

Select ID_Pagesa, DataPageses, ShumaPageses
From Pagesa
WHERE ShumaPageses > 150 AND NOT DataPageses = '2023-01-04'

--4 Te thjeshta 1 tabele(Erjoni)

Select *
From NrTel
Where IDNrTel IN(5551234, 2345678)

Select Data, Ulesja
From Rezervimi
WHERE Ulesja IN (1,2,3,4) AND Data = '2023-01-01'

Select *
From Ushqimi
Where RezervimiID = 10

Select Emri, Qyteti, FluturimiID
From Aeroporti
Where Shteti LIKE 'U%'

-- 4 Te thjeshta 2 tabela(Rijadi)
SELECT p.Emri, p.Mbiemri, s.Webfaqja
FROM Perdoruesi p, SistemiWEB s
WHERE s.ID_Sistemi = p.SistemiID and p.Emri like 'Rijad'

SELECT a.Lloji, u.Vendi
FROM Aeroplani a, Ulesja u
WHERE a.ID_Aeroplani = u.AeroplaniID and u.Lloji = 'Bussiness Seat'

SELECT p.Emri, p.Mbiemri, b.NumriKontaktues
FROM Perdoruesi p, Banka b
WHERE b.ID_Banka = p.BankaID and p.Emri like 'J%'

SELECT a.Emri, a.Qyteti, f.Destinacioni
FROM Aeroporti a, Fluturimi f
WHERE f.ID_Fluturimi = a.FluturimiID and a.FluturimiID in(1,2,3,4,5)

-- 4 te avancuara 2 tabela(Rijadi)
SELECT m.Marreveshja, agj.Emri, ar.Emri
FROM Marreveshje m
JOIN Agjensioni agj 
ON agj.ID_Agjensioni = m.AgjensioniID
JOIN Aeroporti ar 
ON ar.ID_Aeroporti = m.AeroportiID
WHERE m.AeroportiID IN (1,2,3,4,5)
GROUP BY m.Marreveshja, agj.Emri, ar.Emri

SELECT r.ID_Rezervimi, u.Lloji, p.DataSkadimit
FROM Ushqimi u, Rezervimi r, Permbajtja p
WHERE r.ID_Rezervimi = u.RezervimiID AND u.Emri = p.UshqimiEmri

SELECT r.ID_Rezervimi, u.Lloji, p.DataSkadimit
FROM Rezervimi r
JOIN Ushqimi u 
ON r.ID_Rezervimi = u.RezervimiID
JOIN Permbajtja p
ON u.Emri = p.UshqimiEmri

SELECT m.Marreveshja, agj.Emri, ar.Emri
FROM Marreveshje m, Agjensioni agj, Aeroporti ar
WHERE m.AgjensioniID = agj.ID_Agjensioni AND m.AeroportiID = ar.ID_Aeroporti AND m.AeroportiID IN (1, 2, 3, 4, 5)
GROUP BY m.Marreveshja, agj.Emri, ar.Emri





