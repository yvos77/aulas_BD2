-- LIMPAR TABELAS (opcional, caso já tenha registros)
TRUNCATE TABLE optd_social.Participacao CASCADE;
TRUNCATE TABLE optd_social.Oportunidade CASCADE;
TRUNCATE TABLE optd_social.Cadastro CASCADE;
TRUNCATE TABLE optd_social.Voluntario CASCADE;
TRUNCATE TABLE optd_social.Instituicao CASCADE;
TRUNCATE TABLE optd_social.AreaDeAtuacao CASCADE;
TRUNCATE TABLE optd_social.Beneficiario CASCADE;

-- Reiniciar sequências
ALTER SEQUENCE optd_social.beneficiario_id_beneficiario_seq RESTART WITH 1;
ALTER SEQUENCE optd_social.cadastro_id_cadastro_seq RESTART WITH 1;
ALTER SEQUENCE optd_social.voluntario_id_voluntario_seq RESTART WITH 1;
ALTER SEQUENCE optd_social.instituicao_id_instituicao_seq RESTART WITH 1;
ALTER SEQUENCE optd_social.areadeatuacao_id_area_seq RESTART WITH 1;
ALTER SEQUENCE optd_social.oportunidade_id_oportunidade_seq RESTART WITH 1;
ALTER SEQUENCE optd_social.participacao_id_participacao_seq RESTART WITH 1;


-- 1️⃣ Inserir Beneficiários
INSERT INTO optd_social.Beneficiario (nome, cpf, endereco, telefone, escolaridade, renda_familiar, data_de_nascimento)
VALUES
('Ana Souza', '12345678901', 'Rua das Flores, 100', '21999990000', 'Ensino Médio', 2500.00, DATE '1990-05-10'),
('Carlos Lima', '98765432100', 'Av. Central, 200', '21988887777', 'Ensino Superior', 4000.00, DATE '1985-09-22');

-- 2️⃣ Inserir Voluntários
INSERT INTO optd_social.Voluntario (nome, cpf, telefone, funcao)
VALUES
('João Pereira', '11122233344', '21977776666', 'Professor'),
('Mariana Costa', '55566677788', '21966665555', 'Médica');

-- 3️⃣ Inserir Instituições
INSERT INTO optd_social.Instituicao (nome, endereco, telefone)
VALUES
('Instituto Esperança', 'Rua Projetada, 123', '2133334444'),
('ONG Vida Nova', 'Av. Alegria, 456', '2144445555');

-- 4️⃣ Inserir Áreas de Atuação
INSERT INTO optd_social.AreaDeAtuacao (descricao, categoria)
VALUES
('Educação Infantil', 'Educação'),
('Atendimento Médico', 'Saúde');

-- 5️⃣ Inserir Cadastros (usando subquery para id_beneficiario real)
INSERT INTO optd_social.Cadastro (status, data_de_cadastro, id_beneficiario)
SELECT 'Ativo', DATE '2025-01-10', id_beneficiario
FROM optd_social.Beneficiario
WHERE nome='Ana Souza';

INSERT INTO optd_social.Cadastro (status, data_de_cadastro, id_beneficiario)
SELECT 'Inativo', DATE '2025-02-15', id_beneficiario
FROM optd_social.Beneficiario
WHERE nome='Carlos Lima';

-- 6️⃣ Inserir Oportunidades (usando subquery para IDs reais)
INSERT INTO optd_social.Oportunidade (titulo, data_de_inicio, data_de_termino, local, vagas, id_instituicao, id_area, id_voluntario)
SELECT 'Aulas de Reforço Escolar', DATE '2025-03-01', DATE '2025-06-30', 'Escola Municipal Centro', 20,
       i.id_instituicao, a.id_area, v.id_voluntario
FROM optd_social.Instituicao i,
     optd_social.AreaDeAtuacao a,
     optd_social.Voluntario v
WHERE i.nome='Instituto Esperança'
  AND a.descricao='Educação Infantil'
  AND v.nome='João Pereira';

INSERT INTO optd_social.Oportunidade (titulo, data_de_inicio, data_de_termino, local, vagas, id_instituicao, id_area, id_voluntario)
SELECT 'Atendimento Médico Comunitário', DATE '2025-04-01', DATE '2025-12-15', 'Posto de Saúde Bairro Novo', 15,
       i.id_instituicao, a.id_area, v.id_voluntario
FROM optd_social.Instituicao i,
     optd_social.AreaDeAtuacao a,
     optd_social.Voluntario v
WHERE i.nome='ONG Vida Nova'
  AND a.descricao='Atendimento Médico'
  AND v.nome='Mariana Costa';

-- 7️⃣ Inserir Participações (usando subquery para IDs reais)
INSERT INTO optd_social.Participacao (data_participacao, status_participacao, id_beneficiario, id_oportunidade)
SELECT DATE '2025-03-05', 'Confirmado', b.id_beneficiario, o.id_oportunidade
FROM optd_social.Beneficiario b
JOIN optd_social.Oportunidade o ON o.titulo='Aulas de Reforço Escolar'
WHERE b.nome='Ana Souza';

INSERT INTO optd_social.Participacao (data_participacao, status_participacao, id_beneficiario, id_oportunidade)
SELECT DATE '2025-04-10', 'Pendente', b.id_beneficiario, o.id_oportunidade
FROM optd_social.Beneficiario b
JOIN optd_social.Oportunidade o ON o.titulo='Atendimento Médico Comunitário'
WHERE b.nome='Carlos Lima';
