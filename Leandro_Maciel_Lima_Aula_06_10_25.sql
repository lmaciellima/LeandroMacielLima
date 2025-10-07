-- COMANDO PARA CRIAR O BANCO
CREATE DATABASE DB_03361B_LEANDRO_LIMA;
-- COMANDO PARA USAR MEU BANCO
USE DB_03361B_LEANDRO_LIMA;

-- COMANDO PARA CRIAR  AS TABELAS
CREATE TABLE PRODUTOS
( 
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto varchar(250) NOT NULL
);

CREATE TABLE VENDAS 
( 
id_produto INT PRIMARY KEY AUTO_INCREMENT,
data_venda date,
nome_produto varchar(250) NOT NULL,
QTE int
);

CREATE TABLE FORNECEDORES
( 
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
data_cadastro date,
nome_fornecedor varchar(250) NOT NULL,
contato_telefonico int,
email varchar(250) NOT NULL
);

-- COMANDOS PARA INSERIR  NA TABELA
    INSERT INTO PRODUTOS (nome_produto) VALUES
	("Livro"),
    ("Caderno"),
    ("Caneta");
    
    INSERT INTO VENDAS (data_venda, nome_produto, QTE ) VALUES
	("21/12/2025","Livro","2"),
    ("21/12/2025","Caderno",3),
    ("21/12/2025","Caneta",3);
    
   

INSERT INTO FORNECEDORES (data_cadastro, nome_fornecedor, contato_telefonico, email) VALUES
('2025-12-21', 'Ferreira Livros', '01147859636', 'empresa1@gmail.com'),
('2025-12-21', 'BIC', '01147859635', 'empresa2@gmail.com'),
('2025-12-21', 'HallBook Cadernos', '01147859638', 'empresa3@gmail.com');


-- VISUALIZAR DADOS

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela]
SELECT *
FROM FORNECEDORES;

SELECT *
FROM VENDAS;

SELECT *
FROM PRODUTOS;

-- "SELECIONE" [somente os atributos] [tabela] "LIMITADOS A" 3 [registros];
SELECT data_cadastro, nome_fornecedor
FROM FORNECEDORES
LIMIT 3;

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela]  "ASCENDENTE";
SELECT data_cadastro, nome_fornecedor
FROM FORNECEDORES
ORDER BY nome_fornecedor ASC;

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela]  "DESCENDENTE";
SELECT *
FROM FORNECEDORES
ORDER BY data_cadastro DESC;

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela] Cliente "EM ORDEM DE" "DESCENDENTE" "limitado3;
SELECT *
FROM FORNECEDORES
ORDER BY data_cadastro DESC
LIMIT 3;



