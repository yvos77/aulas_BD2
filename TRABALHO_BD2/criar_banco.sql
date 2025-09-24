-- Criando o schema

CREATE SCHEMA optd_social;

SET search_path TO optd_social;

CREATE TABLE optd_social.Beneficiario (
    id_beneficiario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    escolaridade VARCHAR(50),
    renda_familiar NUMERIC(10,2),
    data_de_nascimento DATE
);

CREATE TABLE optd_social.Cadastro (
    id_cadastro SERIAL PRIMARY KEY,
    status VARCHAR(30) NOT NULL,
    data_de_cadastro DATE NOT NULL,
    id_beneficiario INT NOT NULL REFERENCES optd_social.Beneficiario(id_beneficiario)
);

CREATE TABLE optd_social.Voluntario (
    id_voluntario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    funcao VARCHAR(50)
);

CREATE TABLE optd_social.Instituicao (
    id_instituicao SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20)
);

CREATE TABLE optd_social.AreaDeAtuacao (
    id_area SERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    categoria VARCHAR(100)
);

CREATE TABLE optd_social.Oportunidade (
    id_oportunidade SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    data_de_inicio DATE NOT NULL,
    data_de_termino DATE,
    local VARCHAR(100),
    vagas INT,
    id_instituicao INT NOT NULL REFERENCES optd_social.Instituicao(id_instituicao),
    id_area INT NOT NULL REFERENCES optd_social.AreaDeAtuacao(id_area),
    id_voluntario INT NOT NULL REFERENCES optd_social.Voluntario(id_voluntario)
);

CREATE TABLE optd_social.Participacao (
    id_participacao SERIAL PRIMARY KEY,
    data_participacao DATE NOT NULL,
    status_participacao VARCHAR(30),
    id_beneficiario INT NOT NULL REFERENCES optd_social.Beneficiario(id_beneficiario),
    id_oportunidade INT NOT NULL REFERENCES optd_social.Oportunidade(id_oportunidade)
);



DROP SCHEMA IF EXISTS optd_social CASCADE;

-- Deletar todas as tabelas do schema optd_social
DROP TABLE IF EXISTS optd_social.Participacao CASCADE;
DROP TABLE IF EXISTS optd_social.Oportunidade CASCADE;
DROP TABLE IF EXISTS optd_social.Cadastro CASCADE;
DROP TABLE IF EXISTS optd_social.Voluntario CASCADE;
DROP TABLE IF EXISTS optd_social.Instituicao CASCADE;
DROP TABLE IF EXISTS optd_social.AreaDeAtuacao CASCADE;
DROP TABLE IF EXISTS optd_social.Beneficiario CASCADE;

-- Opcional: apagar o schema inteiro
-- DROP SCHEMA IF EXISTS optd_social CASCADE;
