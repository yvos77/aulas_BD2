SELECT 
    p.id_participacao,
    b.nome AS beneficiario,
    o.titulo AS oportunidade,
    i.nome AS instituicao,
    p.status_participacao,
    p.data_participacao
FROM optd_social.Participacao p
JOIN optd_social.Beneficiario b ON p.id_beneficiario = b.id_beneficiario
JOIN optd_social.Oportunidade o ON p.id_oportunidade = o.id_oportunidade
JOIN optd_social.Instituicao i ON o.id_instituicao = i.id_instituicao
ORDER BY p.data_participacao;
