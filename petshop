CREATE DATABASE petshop;

CREATE TABLE cliente (
  id_cliente SERIAL,
  nome VARCHAR(100) NOT NULL, 
  telefone VARCHAR(20),
  email VARCHAR(100) UNIQUE,
  CONSTRAINT pk_cliente PRIMARY KEY(id_cliente)
);

CREATE TABLE pet(
  id_pet SERIAL,
  id_cliente  INTEGER NOT NULL,
  nome_pet VARCHAR(80) NOT NULL,
  especie VARCHAR(50),
  data_nascimento DATE,
  CONSTRAINT pk_pet PRIMARY KEY(id_pet),
  CONSTRAINT fk_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
);
