CREATE DATABASE loja_roupas;

CREATE TABLE cliente(
id_cliente SERIAL,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
data_cadastro DATE DEFAULT CURRENT_DATE,
CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE produto(
 id_produto SERIAL,
 nome_produto VARCHAR(100) NOT NULL,
 categoria VARCHAR(50),
 preco NUMERIC CHECK (preco > 0),
 estoque INTEGER DEFAULT 0,
 CONSTRAINT pk_produto PRIMARY KEY(id_produto)
);

CREATE TABLE pedido(
id_pedido SERIAL,
id_cliente INTEGER NOT NULL,
data_pedido DATE DEFAULT CURRENT_DATE,
valor_total INTEGER CHECK(valor_total > 0),
CONSTRAINT pk_pedido PRIMARY KEY(id_pedido),
CONSTRAINT fk_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido(
id_item SERIAL,
id_produto INTEGER NOT NULL,
id_pedido INTEGER NOT NULL,
quantidade INTEGER CHECK(quantidade > 0),
CONSTRAINT pk_item PRIMARY KEY(id_item),
CONSTRAINT fk_produto FOREIGN KEY(id_produto) REFERENCES produto(id_produto),
CONSTRAINT fk_pedido FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido)
);
