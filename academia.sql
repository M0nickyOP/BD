CREATE DATABASE academia;

CREATE TABLE aluno (
  id_aluno SERIAL,
  nome VARCHAR(100) NOT NULL, 
  cpf VARCHAR(11) UNIQUE,
  data_nascimento DATE,
  peso NUMERIC,
  CONSTRAINT pk_aluno PRIMARY KEY(id_aluno)
);

CREATE TABLE modalidade(
  id_modalidade SERIAL,
  nome_modalidade VARCHAR(50) NOT NULL,
  CONSTRAINT pk_modalidade PRIMARY KEY(id_modalidade)
);

CREATE TABLE matricula(
  id_matricula SERIAL,
  id_aluno INTEGER NOT NULL,
  id_modalidade INTEGER NOT NULL,
  data_matricula DATE DEFAULT CURRENT_DATE,
  CONSTRAINT pk_matricula PRIMARY KEY(id_matricula),
  CONSTRAINT fk_aluno FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno),
  CONSTRAINT fk_modalidade FOREIGN KEY(id_modalidade) REFERENCES modalidade(id_modalidade)
);
