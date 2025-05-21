-- Q19: Código e descrição do projeto cujo gerente do departamento que ele faz parte ganhe mais que os outros gerentes de departamento

-- CTE para obter os salários dos gerentes por departamento
WITH gerentes AS (
    SELECT 
        d.codigo AS cod_depto,
        f.codigo AS cod_gerente,
        f.salario
    FROM departamento d
    JOIN funcionario f ON d.cod_gerente = f.codigo
),

-- CTE para pegar o salário de cada gerente comparando com os outros
gerentes_mais_ricos AS (
    SELECT 
        g1.cod_depto,
        g1.salario
    FROM gerentes g1
    WHERE g1.salario > ALL (
        SELECT g2.salario
        FROM gerentes g2
        WHERE g2.cod_depto <> g1.cod_depto
    )
)

-- Seleciona os projetos cujo gerente do departamento é o que ganha mais que todos os outros
SELECT 
    p.codigo,
    p.nome AS descricao
FROM projeto p
JOIN gerentes_mais_ricos gm ON p.cod_depto = gm.cod_depto;
