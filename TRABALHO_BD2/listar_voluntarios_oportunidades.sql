SELECT 
    v.nome AS voluntario,
    o.titulo AS oportunidade,
    a.descricao AS area,
    a.categoria
FROM optd_social.Voluntario v
JOIN optd_social.Oportunidade o ON v.id_voluntario = o.id_voluntario
JOIN optd_social.AreaDeAtuacao a ON o.id_area = a.id_area
ORDER BY v.nome;
