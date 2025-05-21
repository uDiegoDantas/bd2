-- Inserções de dados

-- Departamentos
INSERT INTO departamento (descricao, cod_gerente) VALUES
('TI', NULL),
('RH', NULL),
('Financeiro', NULL),
('Comercial', NULL),
('Logística', NULL);

-- Funcionários
INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_depto) VALUES
('Ana Silva', 'F', '1990-05-12', 5000, 1),
('Carlos Souza', 'M', '1985-08-20', 7000, 2),
('Bruna Oliveira', 'F', '1998-03-30', 4500, 3),
('Daniel Rocha', 'M', '1975-11-10', 9500, 1),
('Fernanda Lima', 'F', '1992-01-25', 6000, 4);

-- Atualiza gerentes dos departamentos
UPDATE departamento SET cod_gerente = 1 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 2 WHERE codigo = 2;
UPDATE departamento SET cod_gerente = 4 WHERE codigo = 3;

-- Projetos
INSERT INTO projeto (nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
('Sistema Web', 'Desenvolvimento de uma plataforma online', 1, 1, '2023-01-01', '2023-12-31'),
('Reestruturação RH', 'Atualização de processos de RH', 2, 2, '2023-02-15', '2023-09-30'),
('Auditoria Financeira', 'Revisão de contas e despesas', 3, 3, '2023-03-10', '2023-11-20'),
('Campanha Comercial', 'Nova campanha de marketing', 4, 5, '2023-04-01', '2023-10-01'),
('Otimização de Estoque', 'Redução de custos logísticos', 5, 4, '2023-05-01', '2023-12-01');

-- Atividades
INSERT INTO atividade (nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
('Levantamento de requisitos', 'Coleta de requisitos com usuários', 1, '2023-01-05', '2023-01-20'),
('Entrevistas RH', 'Entrevistas com candidatos', 2, '2023-02-20', '2023-02-25'),
('Análise de gastos', 'Mapeamento de despesas', 3, '2023-03-15', '2023-04-15'),
('Design gráfico', 'Criação de peças publicitárias', 5, '2023-04-05', '2023-04-20'),
('Revisão estoque', 'Conferência de inventário', 4, '2023-05-10', '2023-06-10');

-- Relação atividade-projeto
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
