# Tarefa - ODBC e ORM

## Links para Scripts e Programas

- [Script de Criação do Banco de Dados](scripts/criar_banco.sql)
- [Script Docker Compose](docker-compose.yml)
- [Programa ODBC](odbc_program.py)
- [Programa ORM](orm_program.py)

## ODBC em Python

ODBC (Open Database Connectivity) é uma API padrão que permite a conexão e interação com sistemas de gerenciamento de banco de dados de forma independente do SGBD utilizado. Em Python, o pacote `pyodbc` é amplamente utilizado para implementar essa conexão via ODBC. Ele oferece uma interface simples para executar comandos SQL, gerenciar transações e recuperar resultados, sendo compatível com diversos bancos de dados, como PostgreSQL, MySQL e SQL Server.

## ORM em Python

ORM (Object-Relational Mapping) é uma técnica que mapeia objetos de uma linguagem de programação para tabelas de um banco de dados relacional, permitindo manipular dados sem escrever SQL diretamente. Em Python, utilizei o framework **SQLAlchemy**, uma ferramenta poderosa e flexível para ORM. O SQLAlchemy abstrai as operações de banco de dados, possibilitando trabalhar com objetos Python que representam entidades do banco, além de suportar relações entre tabelas e múltiplos SGBDs. Neste projeto, ele foi usado para interagir com o banco de dados `atividade_db`.