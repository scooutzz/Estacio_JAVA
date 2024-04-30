CREATE TABLE Pessoa (
    idUsuario INT PRIMARY KEY,
    login VARCHAR(max),
    senha VARCHAR(max)
);

CREATE SEQUENCE pessoa_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Pessoa (idUsuario, login, senha)
VALUES (NEXT VALUE FOR pessoa_id_seq, 'op1', 'op1');

INSERT INTO Pessoa (idUsuario, login, senha)
VALUES (NEXT VALUE FOR pessoa_id_seq, 'op2', 'op2');

SELECT * FROM Pessoa

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    nome VARCHAR(MAX),
    quantidade INT,
    precoVenda DECIMAL(10, 2)
)

CREATE SEQUENCE produto_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Produto (idProduto, nome, quantidade, precoVenda)
VALUES (NEXT VALUE FOR produto_id_seq, 'Manga', 800, 4.00)

SELECT * FROM Produto

CREATE TABLE PessoaFisica (
	idPf INT PRIMARY KEY,
	nome varchar(max),
	logradouro varchar(max),
	cidade varchar(max),
	estado varchar(2),
	telefone varchar(11),
	email varchar(max),
	cpf varchar(max),
	FOREIGN KEY (idPf) REFERENCES Pessoa(idUsuario)
)

INSERT INTO PessoaFisica (idPf, nome, logradouro, cidade, estado, telefone, email, cpf)
VALUES (1, 'João', 'Rua 12, casa 3, Quitanda', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com', '11111111111')

select * from PessoaFisica

CREATE TABLE PessoaJuridica (
	idPj INT PRIMARY KEY,
	nome varchar(max),
	logradouro varchar(max),
	cidade varchar(max),
	estado varchar(2),
	telefone varchar(11),
	email varchar(max),
	cnpj varchar(max),
	FOREIGN KEY (idPj) REFERENCES Pessoa(idUsuario)
)

INSERT INTO PessoaJuridica (idPj, nome, logradouro, cidade, estado, telefone, email, cnpj)
VALUES (2, 'JJC', 'Rua 12, casa 3, Quitanda', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com', '11111111111111')

select * from PessoaJuridica

CREATE TABLE Movimento (
	idMovimento INT PRIMARY KEY,
	idUsuario int,
	idPessoa int,
	idProduto int,
	quantidade int,
	tipo varchar(max),
	valorUnitario DECIMAL(10, 2),
	FOREIGN KEY (idUsuario) REFERENCES Pessoa(idUsuario),
	FOREIGN KEY (idPessoa) REFERENCES PessoaFisica(idPf),
	FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
)

CREATE SEQUENCE movimento_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Movimento (idMovimento, idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (NEXT VALUE FOR movimento_id_seq, 1, 1, 1, 10, 'S', 4.00)

INSERT INTO Movimento (idMovimento, idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (NEXT VALUE FOR movimento_id_seq, 1, 1, 1, 50, 'E', 10.00)

select * from Movimento