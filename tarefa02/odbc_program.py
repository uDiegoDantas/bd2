import pyodbc

# Estabelecer conexão com o banco de dados
conn = pyodbc.connect(
    'DRIVER={PostgreSQL Unicode};'
    'SERVER=localhost;'
    'PORT=5432;'
    'DATABASE=atividade_db;'
    'UID=postgres;'
    'PWD=senha'
)

cursor = conn.cursor()

# 1. Inserir uma atividade em um projeto (projeto com código 1)
cursor.execute("""
    INSERT INTO atividade (descricao, projeto, data_inicio, data_fim)
    VALUES ('Nova Atividade ODBC', 1, '2023-01-01', '2023-01-31')
""")

# 2. Atualizar o líder (responsavel) do projeto com código 1 para o funcionário com código 3
cursor.execute("UPDATE projeto SET responsavel = 3 WHERE codigo = 1")

# 3. Listar todos os projetos e suas atividades
cursor.execute("""
    SELECT p.codigo, p.nome, a.codigo, a.descricao
    FROM projeto p
    LEFT JOIN atividade a ON p.codigo = a.projeto
""")
rows = cursor.fetchall()
for row in rows:
    print(f"Projeto: {row[0]} - {row[1]}, Atividade: {row[2]} - {row[3]}")

# Confirmar as alterações e fechar a conexão
conn.commit()
conn.close()