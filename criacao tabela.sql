create database agrega

use agrega


CREATE TABLE Filme(
id					INT				NOT NULL	PRIMARY KEY,
titulo				VARCHAR(40)		NOT NULL,
ano					INT				NULL		CHECK(ano <= 2021)
)

CREATE TABLE Estrela(
id					INT				NOT NULL	PRIMARY KEY,
nome				VARCHAR(50)		NOT NULL
)

CREATE TABLE Cliente(
num_cadastro		INT				NOT NULL	PRIMARY KEY,
nome				VARCHAR(70)		NOT NULL,
logradouro			VARCHAR(150)	NOT NULL,
num					INT				NOT NULL	CHECK (num > 0),
cep					CHAR(8)			NULL		CHECK (LEN(cep) = 8)
)

CREATE TABLE DVD(
num					INT				NOT NULL	PRIMARY KEY,
data_fabricacao		DATE			NOT NULL	CHECK (data_fabricacao < GETDATE()),
filmeId				INT				NOT NULL,

CONSTRAINT FK_filmeIdDvd 
	FOREIGN KEY(filmeId) 
	REFERENCES Filme(id)
)

CREATE TABLE Filme_Estrela(
filmeid				INT				NOT NULL,
estrelaid			INT				NOT NULL,

CONSTRAINT FK_filmeidEstrela 
	FOREIGN KEY (filmeid) 
	REFERENCES Filme(id),
CONSTRAINT FK_estrelaid 
	FOREIGN KEY (estrelaid) 
	REFERENCES Estrela(id),

CONSTRAINT PK_filme_estrela 
	PRIMARY KEY(filmeid, estrelaid)
)

CREATE TABLE Locacao(
dvdNum				INT				NOT NULL,
clienteNum_Cadastro INT				NOT NULL,
data_locacao		DATE			NOT NULL	DEFAULT(GETDATE()),
data_devolucao		DATE			NOT NULL,
valor				DECIMAL(7,2)	NOT NULL	CHECK (valor > 0),

CONSTRAINT chk_dt 
	CHECK (data_devolucao > data_locacao),

CONSTRAINT FK_dvdNum 
	FOREIGN KEY (dvdNum) 
	REFERENCES  DVD(num),
CONSTRAINT FK_clienteNum_Cadastro 
	FOREIGN KEY (clienteNum_Cadastro) 
	REFERENCES  Cliente(num_cadastro),

CONSTRAINT PK_Locacao 
	PRIMARY KEY (dvdNum, clienteNum_Cadastro, data_locacao)
)