-- Remover tabelas existentes, se necessário
DROP TABLE IF EXISTS atividade CASCADE;
DROP TABLE IF EXISTS projeto CASCADE;
DROP TABLE IF EXISTS departamento CASCADE;
DROP TABLE IF EXISTS funcionario CASCADE;

-- Criação das tabelas
CREATE TABLE funcionario (
    codigo SERIAL,
    nome VARCHAR(150),
    sexo CHAR(1),
    dt_nasc DATE,
    salario MONEY,
    supervisor INT,
    depto INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (supervisor) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE departamento (
    codigo SERIAL,
    nome VARCHAR(100),
    sigla VARCHAR(10) UNIQUE,
    descricao VARCHAR(250),
    gerente INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (gerente) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Adicionar a chave estrangeira de funcionario
ALTER TABLE funcionario
ADD CONSTRAINT funcDeptoFK
FOREIGN KEY (depto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE;

CREATE TABLE projeto (
    codigo SERIAL,
    nome VARCHAR(50) UNIQUE,
    descricao VARCHAR(250),
    responsavel INT,
    depto INT,
    data_inicio DATE,
    data_fim DATE,
    PRIMARY KEY (codigo),
    FOREIGN KEY (responsavel) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (depto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE atividade (
    codigo SERIAL,
    descricao VARCHAR(250),
    projeto INT,
    data_inicio DATE,
    data_fim DATE,
    PRIMARY KEY (codigo),
    FOREIGN KEY (projeto) REFERENCES projeto(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);