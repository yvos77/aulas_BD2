CREATE TABLE biblioteca.editora(
	cod_editora SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	endereco VARCHAR (200),
	telefone VARCHAR (20));
	
CREATE TABLE biblioteca.livro(
	cod_livro SERIAL PRIMARY KEY,
	titulo VARCHAR (200) NOT NULL,
	cod_editora INT REFERENCES biblioteca.editora(cod_editora));

CREATE TABLE biblioteca.livro_autor(
	cod_livro INT REFERENCES biblioteca.livro(cod_livro),
	nome_autor VARCHAR (100) NOT NULL,
	PRIMARY KEY (cod_livro, nome_autor));

CREATE TABLE biblioteca.unidade_biblioteca(
	cod_unidade SERIAL PRIMARY KEY,
	nome_unidade VARCHAR (100) NOT NULL,
	endereco VARCHAR (200));

CREATE TABLE biblioteca.livro_copia(
	cod_livro INT REFERENCES biblioteca.livro(cod_livro),
	cod_unidade INT REFERENCES biblioteca.unidade_biblioteca(cod_unidade),
	quantidade_copias INT NOT NULL CHECK (quantidade_copias >=0),
	PRIMARY KEY (cod_livro, cod_unidade));

CREATE TABLE biblioteca.usuario(
	num_cartao SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	endereco VARCHAR (200),
	telefone VARCHAR (20));

	SELECT * FROM biblioteca.usuario
	INS

CREATE TABLE biblioteca.emprestimo(
	cod_livro INT REFERENCES biblioteca.livro(cod_livro),
	cod_unidade INT REFERENCES biblioteca.unidade_biblioteca(cod_unidade),
	num_cartao INT REFERENCES biblioteca.usuario(num_cartao),
	dt_emprestimo DATE NOT NULL,
	dt_devolucao DATE,
	PRIMARY KEY (cod_livro, cod_unidade, num_cartao, dt_emprestimo));

	INSERT INTO biblioteca.emprestimo (nome, end)

SELECT * FROM biblioteca.livro;
INSERT INTO biblioteca.livro(titulo, cod_editora)VALUES
('Matematica Discreta', 1),
('Topicos de Matematica', 2);

SELECT cod_livro FROM biblioteca.emprestimo

select * from biblioteca.livro_copia

BEGIN;

SELECT quantidade_copias
FROM biblioteca.livro_copia
WHERE cod_livro = 2 and cod_unidade = 2
for update;

INSERT INTO biblioteca.emprestimo(
	cod_livro, cod_unidade, num_cartao, dt_emprestimo, dt_devolucao)
	VALUES (2, 2, 1, current_date, null);

update biblioteca.livro_copia
set quantidade_copias = quantidade_copias -1
where cod_livro = 2 and cod_unidade = 2;

commit;

rollback;


}
