-- Q13: Nome do projeto, data início/fim, descrição da atividade, data início/fim da atividade

SELECT p.nome AS projeto, p.data_inicio AS inicio_projeto, p.data_fim AS fim_projeto,
       a.descricao AS atividade, a.data_inicio AS inicio_atividade, a.data_fim AS fim_atividade
FROM projeto p
JOIN atividade_projeto ap ON p.codigo = ap.cod_projeto
JOIN atividade a ON ap.cod_atividade = a.codigo;
