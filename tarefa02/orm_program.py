from sqlalchemy import create_engine, Column, Integer, String, Date, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

Base = declarative_base()

# Modelo para a tabela 'projeto'
class Projeto(Base):
    __tablename__ = 'projeto'
    codigo = Column(Integer, primary_key=True)
    nome = Column(String(50), unique=True)
    descricao = Column(String(250))
    responsavel = Column(Integer, ForeignKey('funcionario.codigo'))
    depto = Column(Integer, ForeignKey('departamento.codigo'))
    data_inicio = Column(Date)
    data_fim = Column(Date)
    atividades = relationship("Atividade", back_populates="projeto")

# Modelo para a tabela 'atividade'
class Atividade(Base):
    __tablename__ = 'atividade'
    codigo = Column(Integer, primary_key=True)
    descricao = Column(String(250))
    projeto_id = Column('projeto', Integer, ForeignKey('projeto.codigo'))
    data_inicio = Column(Date)
    data_fim = Column(Date)
    projeto = relationship("Projeto", back_populates="atividades")

# Configurar a conexão com o banco de dados
engine = create_engine('postgresql://postgres:senha@localhost:5432/atividade_db')
Session = sessionmaker(bind=engine)
session = Session()

# 1. Inserir uma atividade em um projeto (projeto com código 1)
nova_atividade = Atividade(
    descricao='Nova Atividade ORM',
    projeto_id=1,
    data_inicio='2023-01-01',
    data_fim='2023-01-31'
)
session.add(nova_atividade)

# 2. Atualizar o líder (responsavel) do projeto com código 1
projeto = session.query(Projeto).filter_by(codigo=1).first()
if projeto:
    projeto.responsavel = 3

# 3. Listar todos os projetos e suas atividades
projetos = session.query(Projeto).all()
for projeto in projetos:
    print(f"Projeto: {projeto.codigo} - {projeto.nome}")
    for atividade in projeto.atividades:
        print(f"  Atividade: {atividade.codigo} - {atividade.descricao}")

# Confirmar as alterações e fechar a sessão
session.commit()
session.close()