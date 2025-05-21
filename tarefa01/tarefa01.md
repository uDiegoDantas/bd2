# Tarefa 01 – Consultas Aninhadas

## Lista de Exercícios

[Link para o documento de exercícios](https://docs.google.com/document/d/1S8QITJFW59ss9CIAiw8UznCbxKVvDAlu4ir75fNoBF0/edit?tab=t.0)

## 📜 Scripts

- [Criação do esquema relacional](tarefa01-create.sql)
- [Inserção de dados no esquema](tarefa01-inserts.sql)

## 📊 Consultas

- [Q01 – Funcionários com salário acima dos salários do departamento 2](tarefa01-q01.sql)
- [Q04 – Funcionários que não são o mais velho](tarefa01-q04.sql)
- [Q07 – Total de funcionários por departamento (incluindo sem gerente)](tarefa01-q07.sql)
- [Q13 – Detalhes de atividades dos projetos](tarefa01-q13.sql)
- [Q16 – Responsáveis de projeto que são gerentes ou ganham mais que o gerente do departamento](tarefa01-q16.sql)
- [Q19 – Funcionários com maior salário por departamento (mesmo sem estar associado a um)](tarefa01-q19.sql)

# 📘 Conceitos

## 📘 NATURAL JOIN e CROSS JOIN em SQL

## 🔹 NATURAL JOIN

O `NATURAL JOIN` realiza uma junção automática entre duas tabelas, utilizando **todas as colunas com nomes iguais** nas duas tabelas como critério de junção. Ele elimina colunas duplicadas no resultado final.

### ✅ Características:
- A junção é feita implicitamente com base nos nomes das colunas comuns.
- As colunas duplicadas (presentes em ambas as tabelas) aparecem apenas uma vez no resultado.
- Requer que as colunas em comum tenham o mesmo nome e tipos compatíveis.

### 🧾 Exemplo:

```sql
-- Tabela: alunos
-- id | nome     | curso_id
-- 1  | Ana      | 101
-- 2  | Bruno    | 102

-- Tabela: cursos
-- curso_id | nome_curso
-- 101      | Engenharia
-- 102      | Medicina

SELECT * 
FROM alunos
NATURAL JOIN cursos;
```

## 🔸 CROSS JOIN

O `CROSS JOIN` realiza o **produto cartesiano** entre duas tabelas, ou seja, combina **todas as linhas da primeira tabela com todas as da segunda**.

### ✅ Características:
- Não utiliza cláusula `ON`.
- O número de linhas resultantes é o produto do número de linhas das duas tabelas (`n * m`).
- Pode ser útil para gerar combinações de possibilidades (ex: cores × tamanhos).

### 🧾 Exemplo:

```sql
-- Tabela: cores
-- nome_cor
-- Azul
-- Vermelho

-- Tabela: tamanhos
-- tamanho
-- P
-- M

SELECT * 
FROM cores
CROSS JOIN tamanhos;
```

# 🪟 Funções de Janela (Window Functions) no PostgreSQL

As **Window Functions** (Funções de Janela) são um recurso poderoso do PostgreSQL (e de outros bancos SQL) que permite realizar cálculos agregados ao longo de um conjunto de linhas relacionadas à linha atual, sem colapsar os resultados em uma única linha (como ocorre com `GROUP BY`).

## 📌 Características

- Preservam todas as linhas da tabela.
- Executam cálculos com base em um "conjunto de janelas" definido.
- São muito úteis para rankings, médias móveis, totais acumulados e comparações entre linhas.

## 🧠 Sintaxe Básica

```sql
<função_de_janela>([expressões]) OVER (
  [PARTITION BY colunas]
  [ORDER BY colunas]
  [frame_clause]
)
```
