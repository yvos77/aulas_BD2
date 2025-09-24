SELECT 
    a.descricao AS area,
    COUNT(p.id_participacao) AS total_participantes
FROM optd_social.AreaDeAtuacao a
JOIN optd_social.Oportunidade o ON a.id_area = o.id_area
JOIN optd_social.Participacao p ON o.id_oportunidade = p.id_oportunidade
GROUP BY a.descricao
ORDER BY total_participantes DESC;
