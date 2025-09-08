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

DELETE FROM biblioteca.editora
WHERE cod_editora IN (4, 5, 6, 7, 8, 9);

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
(1,1,3), (2,2,10), (3,3,1);

CREATE TABLE biblioteca.usuario(
	num_cartao INT PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	endereco VARCHAR (100),	
	telefone vARCHAR (20)
);
SELECT * FROM biblioteca.usuario;
INSERT INTO biblioteca.usuario (num_cartao,nome,endereco,telefone) VALUES
(1111111, 'Carlos Magno', 'Rua Alfa', '6191111-1111'),
(2222222, 'Alfreda Burt', 'Rua Beta', '6192222-2222'),
(3333333, 'Jeferson Polaco', 'Rua Charlie', '6193333-3333');

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

-- MOSTRANDO COMO FUNCIONAM AS JOINS

SELECT l.titulo, e.nome AS editora
FROM biblioteca.livro l
INNER JOIN biblioteca.editora e 
       ON l.cod_editora = e.cod_editora;


SELECT l.titulo, e.nome AS editora
FROM biblioteca.livro l
LEFT JOIN biblioteca.editora e 
       ON l.cod_editora = e.cod_editora;


SELECT l.titulo, e.nome AS editora
FROM biblioteca.livro l
RIGHT JOIN biblioteca.editora e 
       ON l.cod_editora = e.cod_editora;


SELECT l.titulo, e.nome AS editora
FROM biblioteca.livro l
FULL JOIN biblioteca.editora e 
       ON l.cod_editora = e.cod_editora;


SELECT u.nome AS usuario, l.titulo, ub.nome_unidade, e.dt_emprestimo, e.dt_devolucao
FROM biblioteca.emprestimo e
JOIN biblioteca.usuario u ON e.num_cartao = u.num_cartao
JOIN biblioteca.livro l ON e.cod_livro = l.cod_livro
JOIN biblioteca.unidade_biblioteca ub ON e.cod_unidade = ub.cod_unidade;

-- CONTANDO QUANTOS LIVROS CADA USUARIO PEGOU

SELECT nome, COUNT(*) AS total_emprestimo
FROM biblioteca.emprestimo e
JOIN biblioteca.usuario u
ON e.num_cartao = u.num_cartao
GROUP BY u.nome
ORDER BY total_emprestimo desc;

SELECT nome, titulo, dt_emprestimo
FROM biblioteca.emprestimo e, biblioteca.usuario u, biblioteca.livro l
WHERE e.cod_livro = l.cod_livro
AND e.dt_devolucao IS NULL

-- Listar os livros com mais de 3 copias em qualquer unidade
SELECT l.titulo, u.nome_unidade AS biblioteca, lc.

