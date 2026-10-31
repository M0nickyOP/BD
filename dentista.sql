CREATE DATABASE petshop;

CREATE TABLE dentista (
 id_dentista SERIAL,
 nome VARCHAR(100) NOT NULL,
 cro VARCHAR(20) UNIQUE,
 especialidade VARCHAR(50),
 CONSTRAINT pk_dentista PRIMARY KEY (id_dentista)
);

CREATE TABLE paciente(
  id_paciente SERIAL,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(20),
  email VARCHAR(100),
  CONSTRAINT pk_paciente PRIMARY KEY(id_paciente)
);

CREATE TABLE consulta(
id_consulta SERIAL,
id_dentista INTEGER NOT NULL,
id_paciente INTEGER NOT NULL,
data_consulta date NOT NULL,
horario TIMESTAMP NOT NULL,
realizada BOOLEAN,
CONSTRAINT pk_consulta PRIMARY KEY(id_consulta),
CONSTRAINT fk_dentista FOREIGN KEY (id_dentista) REFERENCES dentista(id_dentista),
CONSTRAINT fk_paciente FOREIGN KEY(id_paciente) REFERENCES paciente(id_paciente)
);
