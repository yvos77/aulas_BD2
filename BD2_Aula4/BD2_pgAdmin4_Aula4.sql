CREATE TABLE biblioteca.editora(
	cod_editora SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	endereco VARCHAR (200),
	telefone VARCHAR (20)
);
SELECT * FROM biblioteca.editora;
INSERT INTO biblioteca.editora(nome,endereco,telefone) VALUES 
('Editora Alfa', 'Rua A, 1223', '61987654321'),
('Editora Beta', 'Av. do Livros, 432', '61997854520'),
('Editora Charlie', 'Rua C, 1443', '61981234567');

CREATE TABLE biblioteca.livro(
	cod_livro SERIAL PRIMARY KEY,
	titulo VARCHAR (100) NOT NULL,
	cod_editora INT REFERENCES biblioteca.editora(cod_editora)	
);
SELECT * FROM biblioteca.livro;
INSERT INTO biblioteca.livro(titulo,cod_editora) VALUES 
('Banco de Dados Basico', 1),
('Inteligência Artificial', 2),
('Engenharia de Software', 3);

CREATE TABLE biblioteca.livro_autor(
	cod_livro INT REFERENCES biblioteca.livro(cod_livro),
	nome_autor VARCHAR (100) NOT NULL,
	PRIMARY KEY (cod_livro, nome_autor)
);
SELECT * FROM biblioteca.livro_autor;
INSERT INTO biblioteca.livro_autor (cod_livro, nome_autor) VALUES 
(1, 'Mauricio de Sousa'),
(2, 'J.K. Rowling'),
(3, 'Machado de Assis');

CREATE TABLE biblioteca.unidade_biblioteca(
	cod_unidade SERIAL PRIMARY KEY,
	nome_unidade VARCHAR (100) NOT NULL,
	endereco VARCHAR (100)
);
SELECT * FROM biblioteca.unidade_biblioteca;
INSERT INTO biblioteca.unidade_biblioteca (nome_unidade,endereco) VALUES
('Biblioteca ParkWay', 'SMPW Quadra 10, Conjunto 2'),
('Biblioteca Asa Norte', 'SQN 111'),
('Biblioteca Bandeirante', 'Av. Central, Bloco 2');

CREATE TABLE biblioteca.livro_copias(
	cod_livro INT REFERENCES biblioteca.livro(cod_livro),
	cod_unidade INT REFERENCES biblioteca.unidade_biblioteca(cod_unidade),
	quantidade_copia INT NOT NULL CHECK (quantidade_copia >= 0),
	PRIMARY KEY (cod_livro, cod_unidade)
);
SELECT * FROM biblioteca.livro_copias;
INSERT INTO biblioteca.livro_copias (cod_livro, cod_unidade, quantidade_copia) VALUES
(1,1,3), (2,2,10),(3,3,1);

CREATE TABLE biblioteca.usuario(
	num_cartao INT PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	endereco VARCHAR (100),	
	telefone vARCHAR (20)
);
SELECT * FROM biblioteca.usuario;
INSERT INTO biblioteca.usuario (num_cartao,nome,endereco,telefone) VALUES
(1111111, 'Carlos Magno', 'Rua Alfa', '61911111111'),
(2222222, 'Alfreda Burt', 'Rua Beta', '61922222222'),
(3333333, 'Jeferson Polaco', 'Rua Charlie', '61933333333');

CREATE TABLE biblioteca.emprestimo(
	cod_livro INT REFERENCES biblioteca.livro (cod_livro),
	cod_unidade INT REFERENCES biblioteca.unidade_biblioteca(cod_unidade),
	num_cartao INT REFERENCES biblioteca.usuario(num_cartao),
	dt_emprestimo DATE NOT NULL,
	dt_devolucao DATE,
	PRIMARY KEY (cod_livro, cod_unidade, num_cartao, dt_emprestimo)
);
SELECT * FROM biblioteca.emprestimo;
INSERT INTO biblioteca.emprestimo (cod_livro,cod_unidade,num_cartao,dt_emprestimo,dt_devolucao) VALUES
(1,1,1111111,'2025-09-01','2025-09-15'), (2,2,2222222,'2025-09-10','2025-09-20'), 
(3,3,3333333,'2025-09-30','2025-10-09');

SELECT num_cartao, dt_emprestimo, dt_devolucao FROM biblioteca.emprestimo;