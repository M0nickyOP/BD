CREATE DATABASE biblioteca;

CREATE TABLE livro(
id_livro SERIAL,
titulo VARCHAR(150) NOT NULL,
isbn VARCHAR(20) UNIQUE,
ano_publicacao INTEGER,
qtd_exemplares INTEGER DEFAULT 1,
CONSTRAINT pk_livro PRIMARY KEY(id_livro)
);

CREATE TABLE autor(
id_autor SERIAL,
nome VARCHAR(100) NOT NULL, 
nacionalidade VARCHAR(50),
 CONSTRAINT pk_autor PRIMARY KEY(id_autor)
);

CREATE TABLE livro_autor(
id_livro INTEGER NOT NULL,
id_autor INTEGER NOT NULL,
CONSTRAINT pk_livro_autor PRIMARY KEY(id_livro, id_autor),
CONSTRAINT fk_livro_autor_livro FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
CONSTRAINT fk_livro_autor_autor FOREIGN KEY(id_autor) REFERENCES autor(id_autor)
);

CREATE TABLE leitor(
id_leitor SERIAL,
nome VARCHAR(100),
cpf VARCHAR(11) UNIQUE,
telefone VARCHAR(20),
CONSTRAINT pk_leitor PRIMARY KEY(id_leitor)
);

CREATE TABLE emprestimo(
id_emprestimo SERIAL,
id_livro INTEGER NOT NULL,
id_leitor INTEGER NOT NULL,
data_emprestimo DATE DEFAULT CURRENT_DATE,
data_prevista_devolucao DATE NOT NULL,
devolvido BOOLEAN NOT NULL,
CONSTRAINT pk_emprestimo PRIMARY KEY(id_emprestimo),
CONSTRAINT fk_emprestimo_livro FOREIGN KEY(id_livro) REFERENCES livro(id_livro),
CONSTRAINT fk_emprestimo_leitor FOREIGN KEY(id_leitor) REFERENCES leitor(id_leitor)
);
