-- Q16: Nome dos responsáveis de projeto que são gerentes ou ganham mais que o gerente do seu departamento

SELECT DISTINCT f.nome
FROM funcionario f
JOIN projeto p ON f.codigo = p.cod_responsavel
LEFT JOIN departamento d ON p.cod_depto = d.codigo
LEFT JOIN funcionario g ON d.cod_gerente = g.codigo
WHERE f.codigo = d.cod_gerente
   OR f.salario > COALESCE(g.salario, 0);
