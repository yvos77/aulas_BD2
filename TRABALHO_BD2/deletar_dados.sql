-- Deletando os dados das tabelas podendo usar condição
DELETE FROM optd_social.Participacao;
DELETE FROM optd_social.Oportunidade;
DELETE FROM optd_social.AreaDeAtuacao;
DELETE FROM optd_social.Instituicao;
DELETE FROM optd_social.Voluntario;
DELETE FROM optd_social.Cadastro;
DELETE FROM optd_social.Beneficiario;

-- Limpando os dados das tabelas de uma vez
TRUNCATE TABLE optd_social.Participacao CASCADE;
TRUNCATE TABLE optd_social.Oportunidade CASCADE;
TRUNCATE TABLE optd_social.Cadastro CASCADE;
TRUNCATE TABLE optd_social.Voluntario CASCADE;
TRUNCATE TABLE optd_social.Instituicao CASCADE;
TRUNCATE TABLE optd_social.AreaDeAtuacao CASCADE;
TRUNCATE TABLE optd_social.Beneficiario CASCADE;
