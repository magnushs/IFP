CREATE DATABASE CALENDAR
CHARSET utf8 COLLATE utf8_general_ci;

USE CALENDAR;

CREATE TABLE Avtale (
	idAvtale 		int 	unsigned 	NOT NULL,
	dato 			int 				NOT NULL,
	starttid		int,
	sluttid 		int,
	beskrivelse 	varchar(255),
	admin 			int 	unsigned 	NOT NULL,
	sted 			varchar(20) 		NOT NULL,
	idMøterom 		int 				NOT NULL,
	admin 			varchar(30)			NOT NULL,
	PRIMARY KEY(idAvtale),
	FOREIGN KEY(idMøterom) 	REFERENCES Møterom(idMøterom),
	FOREIGN KEY(admin) 		REFERENCES Ansatt(brukernavn),
);

CREATE TABLE AvtaleMellom(
	idAvtale		int 			NOT NULL,
	brukernavn 		varchar(30) 	NOT NULL,
	status 			boolean,
	display  		boolean,
	idvarsel 		int 			NOT NULL,

	PRIMARY KEY(idAvtale, brukernavn),
	FOREIGN KEY(idVarsel) 	REFERENCES Varsel(idVarsel),
	FOREIGN KEY(idAvtale) 	REFERENCES Avtale(idAvtale),
	FOREIGN KEY(brukernavn) REFERENCES Ansatt(brukernavn)

);

CREATE TABLE Varsel (
	idVarsel 		int 		unsigned	NOT NULL,
	klokkeslett 	int 					NOT NULL,
	beskrivelse 	varchar(255)
	PRIMARY KEY(idVarsel)
);

CREATE TABLE Møterom (
	idMøterom 		int unsigned 		NOT NULL,
	navn 			varchar(20) 		NOT NULL,
	ledig 			boolean 			NOT NULL, 
	kapasitet 		int 				NOT NULL
);

CREATE TABLE Ansatt (
	brukernavn 		varchar(30) 		NOT NULL,
	passord			varchar(30)			NOT NULL,
	PRIMARY KEY(brukernavn)
);

CREATE TABLE Medlem (
	brukernavn 		int 	unsigned 		NOT NULL,
	idGruppe 		int 	unsigned		NOT NULL,
	FOREIGN KEY(idGruppe) REFERENCES Gruppe(idGruppe),
	FOREIGN KEY(idAnsatt) REFERENCES Gruppe(idAnsatt)
);

CREATE TABLE Gruppe (
	idGruppe 		int 		unsigned 	NOT NULL,
	navn 			varchar (30),
	PRIMARY KEY(idGruppe)
); 

CREATE TABLE SubGruppe (
	idSubGruppe 			int 		unsigned 	NOT NULL,
	navn 				varchar (30)
	idForeldreGruppe	int 		unsigned	NOT NULL
	PRIMARY KEY(idGruppe),
	FOREIGN KEY(idForeldreGruppe) 	REFERENCES Gruppe(idGruppe),
	FOREIGN KEY(idSupGruppe)			REFERENCES Gruppe(idGruppe)
	idGruppe NOT EQUAL idForeldreGruppe
); 

