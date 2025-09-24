SELECT 
    b.nome AS beneficiario,
    c.status AS cadastro_status,
    c.data_de_cadastro,
    o.titulo AS oportunidade,
    p.status_participacao,
    p.data_participacao
FROM optd_social.Beneficiario b
JOIN optd_social.Cadastro c ON b.id_beneficiario = c.id_beneficiario
JOIN optd_social.Participacao p ON b.id_beneficiario = p.id_beneficiario
JOIN optd_social.Oportunidade o ON p.id_oportunidade = o.id_oportunidade
ORDER BY b.nome, p.data_participacao;
