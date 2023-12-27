Create Database Sistemi

Use Sistemi 

Create table Perdoruesi( --veq me excecute
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

Create Table SistemiWEB( --u kry
	ID_Sistemi int Primary Key,
	Webfaqja varchar(30) not null,
	KohaFillimit time,
	KohaMbarimit time
);

CREATE TABLE NrTel ( --veq me excecute
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

CREATE TABLE Pagesa ( --u kry
    ID_Perdoruesi INT,
    ID_Pagesa INT,
    DataPageses DATE NOT NULL,
    ShumaPageses INT NOT NULL,

    Constraint PK_Pagesa PRIMARY KEY (ID_Perdoruesi, ID_Pagesa),
    PerdoruesiID INT FOREIGN KEY REFERENCES Perdoruesi(ID_Perdoruesi)
);

Create Table Banka( -- u kry
	ID_Banka int Primary Key,
	NumriKontaktues int not null,
	Shteti varchar(15) not null,
	ZIPCode int not null,
	Rruga varchar(15) not null
);

Create Table Rezervimi( -- u kry
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
(10, 'Lily', 'Bennett', 'Buenos Aires', 'PayPal', 'Osaka', 'Juniper Way', 97201, 10, 10, 10, 10)


INSERT INTO NrTel (IDNrTel, ID_Perdoruesi, Emri, Mbiemri, Destinacioni, MenyraEPageses, Qyteti, Rruga, ZIPCode, PerdoruesiID)
VALUES
(5551234567, 1, 'John', 'Doe', 'London', 'Credit Card', 'Seoul', 'Maple Avenue', 90210, 1),
(9876543210, 2, 'Olivia', 'Thompson', 'Paris', 'PayPal', 'Vancouver', 'Elm Street', 10001, 2),
(1234567890, 3, 'Ethan', 'Reynolds', 'Tokyo', 'Cash', 'Nairobi', 'Oak Lane', 30301, 3),
(5559876543, 4, 'Ava', 'Mitchell', 'Istanbul', 'PayPal', 'Reykjavik', 'Cedar Boulevard', 75201, 4),
(7890123456, 5, 'Mason', 'Turner', 'Cairo', 'Credit Card', 'Lima', 'Pinecrest Drive', 94102, 5),
(2345678901, 6, 'Zoe', 'Ramirez', 'Sydney', 'PayPal', 'Munich', 'Willow Lane', 60601, 6),
(8765432109, 7, 'Caleb', 'Morgan', 'Vancouver', 'Credit Card', 'Mumbai', 'Birchwood Terrace', 90045, 7),
(3210987654, 8, 'Sophia', 'Patel', 'Mumbai', 'PayPal', 'New Orleans', 'Sycamore Lane', 33101, 8),
(4567890123, 9, 'Jackson', 'Hayes', 'Barcelona', 'Cash', 'Casablanca', 'Magnolia Court', 20001, 9),
(9998887777, 10, 'Lily', 'Bennett', 'Buenos Aires', 'PayPal', 'Osaka', 'Juniper Way', 97201, 10)


INSERT INTO Pagesa (ID_Perdoruesi, ID_Pagesa, DataPageses, ShumaPageses, PerdoruesiID)
VALUES
  (1, 1, '2023-01-01', 100),
  (2, 2, '2023-01-02', 150),
  (3, 3, '2023-01-03', 200),
  (4, 4, '2023-01-04', 120),
  (5, 5, '2023-01-05', 180),
  (6, 6, '2023-01-06', 90),
  (7, 7, '2023-01-07', 130),
  (8, 8, '2023-01-08', 110),
  (9, 9, '2023-01-09', 160),
  (10, 10, '2023-01-10', 140);

  Select *
  From Pagesa -- me bo sc

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

INSERT INTO Ushqimi (Emri, ID_Rezervimi, Lloji, DataProdhimit, DataSkadimit)
VALUES
  ('Sushi', 1, 'Kinez', '2023-01-01', '2023-01-10'),
  ('Pasta Carbonara', 2, 'Pasta', '2023-01-02', '2023-01-11'),
  ('Tacos', 3, 'Mexican', '2023-01-03', '2023-01-12'),
  ('Chicken Curry', 4, 'Indian', '2023-01-04', '2023-01-13'),
  ('Pizza', 5, 'Italian', '2023-01-05', '2023-01-14'),
  ('Caesar Salad', 6, 'Greek', '2023-01-06', '2023-01-15'),
  ('Chocolate', 7, 'Snack', '2023-01-07', '2023-01-16'),
  ('Beef Stir-Fry', 8, 'Meat', '2023-01-08', '2023-01-17'),
  ('Falafel Wrap', 9, 'Snack', '2023-01-09', '2023-01-18'),
  ('Cheesecake', 10, 'Snack', '2023-01-10', '2023-01-19');

Select *
From Ushqimi -- me bo sc

-- Table: Marreveshje
INSERT INTO Marreveshje (ID_Agjensioni, ID_Aeroporti, Marreveshja)
VALUES
(1, 1, 'Agreement 1'),
(1, 2, 'Agreement 2'),
-- ... add 23 more records ...

-- Updating 20 records
-- UPDATE statement with conditions based on your data
UPDATE YourTableName
SET YourColumnName = YourNewValue
WHERE YourCondition;

-- Deleting 10 records
-- DELETE statement with conditions based on your data
DELETE FROM YourTableName
WHERE YourCondition;








