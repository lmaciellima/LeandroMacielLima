-- todos as atividades Aula 8



-- COMANDOS DE INÍCIO
-- --------------------------------------------------------------------------------
-- 1. Seleciona o banco de dados para garantir que as tabelas sejam criadas no lugar correto.
-- --------------------------------------------------------------------------------
USE DB_03361B_LEANDRO_LIMA;

-- CRIAÇÃO DE TABELAS

-- --------------------------------------------------------------------------------
-- 2. CRIAÇÃO DA TABELA AUTOMÓVEL
-- Define as características dos veículos disponíveis para locação.
-- id_automovel: Chave Primária (INT), auto-incrementada, identificador único do carro.
-- marca, modelo, tipo: Campos de texto para descrever o veículo.
-- --------------------------------------------------------------------------------
CREATE TABLE Automóvel (
    id_automovel INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    tipo VARCHAR(50)
);

-- --------------------------------------------------------------------------------
-- 3. CRIAÇÃO DA TABELA CLIENTE
-- Armazena as informações de identificação e contato dos clientes.
-- id_cliente: Chave Primária (INT), auto-incrementada, identificador único do cliente.
-- nome, sobrenome: Nome completo do cliente.
-- telefone, email: Dados de contato.
-- --------------------------------------------------------------------------------
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- --------------------------------------------------------------------------------
-- 4. CRIAÇÃO DA TABELA DATALOCACAO
-- Tabela de relacionamento que registra a transação de locação.
-- id_datalocacao: Chave Primária (INT), auto-incrementada, identificador da locação.
-- datainiciolocacao, datafinallocacao: Datas de início e fim da locação (DATE).
-- id_cliente: Chave Estrangeira ligando à tabela Cliente (quem alugou).
-- id_automovel: Chave Estrangeira ligando à tabela Automóvel (o que foi alugado).
-- --------------------------------------------------------------------------------
CREATE TABLE DataLocacao (
    id_datalocacao INT PRIMARY KEY AUTO_INCREMENT,
    datainiciolocacao DATE,
    datafinallocacao DATE,

    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),

    id_automovel INT NOT NULL,
    FOREIGN KEY (id_automovel) REFERENCES Automóvel(id_automovel)
);

-- INSERÇÃO DE DADOS DE EXEMPLO

-- --------------------------------------------------------------------------------
-- 5. INSERÇÃO DE 5 AUTOMÓVEIS
-- Adiciona carros de diferentes marcas, modelos e tipos (Sedan, SUV, Hatch, Picape).
-- --------------------------------------------------------------------------------
INSERT INTO Automóvel (marca, modelo, tipo) VALUES
('Toyota', 'Corolla', 'Sedan'),
('Honda', 'Civic', 'Sedan'),
('Ford', 'EcoSport', 'SUV'),
('Volkswagen', 'Gol', 'Hatch'),
('Fiat', 'Toro', 'Picape');

-- --------------------------------------------------------------------------------
-- 6. INSERÇÃO DE 5 CLIENTES
-- Adiciona dados de clientes de exemplo (incluindo o seu nome, Leandro Lima).
-- --------------------------------------------------------------------------------
INSERT INTO Cliente (nome, sobrenome, telefone, email) VALUES
('Leandro', 'Lima', '11987654321', 'leandro.l@email.com'),
('Mariana', 'Silva', '21912345678', 'mariana.s@email.com'),
('Ricardo', 'Souza', '31955554444', 'ricardo.s@email.com'),
('Patricia', 'Ferreira', '41900001111', 'patricia.f@email.com'),
('Gustavo', 'Almeida', '51998887777', 'gustavo.a@email.com');

-- --------------------------------------------------------------------------------
-- 7. INSERÇÃO DE 5 REGISTROS DE LOCAÇÃO
-- Cria 5 locações, vinculando IDs de Cliente e Automóvel, com datas em Outubro/2025.
-- Ex: Cliente 1 (Leandro) alugou o Automóvel 4 (Gol).
-- --------------------------------------------------------------------------------
INSERT INTO DataLocacao (id_cliente, id_automovel, datainiciolocacao, datafinallocacao) VALUES
(1, 4, '2025-10-01', '2025-10-05'),
(2, 1, '2025-10-02', '2025-10-15'),
(3, 5, '2025-10-05', '2025-10-07'),
(4, 3, '2025-10-10', '2025-10-20'),
(5, 2, '2025-10-12', '2025-10-14');

-- CONSULTAS SQL

-- --------------------------------------------------------------------------------
-- 1. Consultar todos os clientes cadastrados
-- Seleciona todos os dados (*) da tabela Cliente.
-- --------------------------------------------------------------------------------
SELECT *
FROM Cliente;


-- --------------------------------------------------------------------------------
-- 2. Consultar todos os automóveis disponíveis
-- Seleciona todos os dados (*) da tabela Automóvel.
-- --------------------------------------------------------------------------------
SELECT *
FROM Automóvel;


-- --------------------------------------------------------------------------------
-- 3. Consultar informações sobre o cliente e o automóvel locado, incluindo a data de
-- início e fim da locação, a marca e o modelo do automóvel.
-- Junta DataLocacao (L), Cliente (C) e Automóvel (A) para obter todos os detalhes.
-- --------------------------------------------------------------------------------
SELECT
    C.nome AS Nome_Cliente,
    C.sobrenome AS Sobrenome_Cliente,
    A.marca,
    A.modelo,
    L.datainiciolocacao,
    L.datafinallocacao
FROM DataLocacao L
JOIN Cliente C ON L.id_cliente = C.id_cliente
JOIN Automóvel A ON L.id_automovel = A.id_automovel;


-- --------------------------------------------------------------------------------
-- 4. Consultar informações sobre os automóveis locados em uma data específica,
-- incluindo a marca e o modelo. (Usando '2025-10-05' como exemplo)
-- Junta DataLocacao (L) e Automóvel (A) e filtra as locações que estavam ativas na data.
-- --------------------------------------------------------------------------------
SELECT
    A.marca,
    A.modelo,
    L.datainiciolocacao,
    L.datafinallocacao
FROM DataLocacao L
JOIN Automóvel A ON L.id_automovel = A.id_automovel
WHERE '2025-10-05' BETWEEN L.datainiciolocacao AND L.datafinallocacao; -- Filtra por data ativa


-- COMANDOS DE INÍCIO
-- --------------------------------------------------------------------------------
-- 1. Seleciona o banco de dados para garantir que as tabelas sejam criadas no lugar correto.
-- --------------------------------------------------------------------------------
USE DB_03361B_LEANDRO_LIMA;

-- CRIAÇÃO DE TABELAS

-- --------------------------------------------------------------------------------
-- 2. CRIAÇÃO DA TABELA PRODUTO
-- Define os itens vendidos pela padaria.
-- id_produto: Chave Primária (INT), auto-incrementada, identificador único do produto.
-- nome: Nome do produto (VARCHAR(100)).
-- preco: Preço unitário em reais (DECIMAL(8,2)).
-- --------------------------------------------------------------------------------
CREATE TABLE Aula_08_Padaria_PRODUTO (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(8, 2)
);

-- --------------------------------------------------------------------------------
-- 3. CRIAÇÃO DA TABELA FORNECEDOR
-- Armazena as informações dos fornecedores da padaria.
-- id_fornecedor: Chave Primária (INT), auto-incrementada, identificador único do fornecedor.
-- nome: Nome do fornecedor (VARCHAR(100)).
-- telefone: Telefone de contato (VARCHAR(20)).
-- --------------------------------------------------------------------------------
CREATE TABLE Aula_08_Padaria_FORNECEDOR (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

-- --------------------------------------------------------------------------------
-- 4. CRIAÇÃO DA TABELA VENDAS
-- Tabela de relacionamento que registra as transações de venda.
-- id_venda: Chave Primária (INT), auto-incrementada, identificador da venda.
-- id_produto: Chave Estrangeira ligando à tabela PRODUTO (o item vendido).
-- quantidade: Quantidade vendida (INT).
-- data_venda: Data em que a venda ocorreu (DATE).
-- AJUSTE: A referência FOREIGN KEY deve usar o nome completo da tabela.
-- --------------------------------------------------------------------------------
CREATE TABLE Aula_08_Padaria_VENDAS (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    data_venda DATE,

    id_produto INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Aula_08_Padaria_PRODUTO(id_produto) -- AJUSTADO
);

-- INSERÇÃO DE DADOS DE EXEMPLO

-- --------------------------------------------------------------------------------
-- 5. INSERÇÃO DE 5 PRODUTOS
-- Adiciona itens típicos de padaria com seus respectivos preços.
-- --------------------------------------------------------------------------------
INSERT INTO Aula_08_Padaria_PRODUTO (nome, preco) VALUES
('Pão Francês', 0.50),
('Bolo de Fubá', 28.50),
('Sonho de Creme', 6.00),
('Café Expresso', 4.50),
('Pão Integral', 15.00);

-- --------------------------------------------------------------------------------
-- 6. INSERÇÃO DE 3 FORNECEDORES
-- Adiciona dados de fornecedores de exemplo.
-- --------------------------------------------------------------------------------
INSERT INTO Aula_08_Padaria_FORNECEDOR (nome, telefone) VALUES
('Moagem Trigo Puro', '1122334455'),
('Laticínios da Fazenda', '1166778899'),
('Grãos de Minas', '1100112233');

-- --------------------------------------------------------------------------------
-- 7. INSERÇÃO DE 8 REGISTROS DE VENDAS
-- Cria vendas vinculando IDs de Produto (1-Pão Francês, 2-Bolo Fubá, etc.) e quantidades.
-- --------------------------------------------------------------------------------
INSERT INTO Aula_08_Padaria_VENDAS (id_produto, quantidade, data_venda) VALUES
(1, 10, '2025-10-07'),
(2, 1, '2025-10-07'),
(3, 3, '2025-10-07'),
(4, 2, '2025-10-08'),
(1, 5, '2025-10-08'),
(5, 1, '2025-10-08'),
(3, 1, '2025-10-08'),
(2, 2, '2025-10-09');

-- CONSULTAS SQL

-- --------------------------------------------------------------------------------
-- 1. Listar todos os produtos cadastrados
-- Seleciona todas as colunas (*) da tabela PRODUTO.
-- --------------------------------------------------------------------------------
SELECT *
FROM PRODUTO;


-- --------------------------------------------------------------------------------
-- 2. Listar total de unidades vendidas por produto
-- Junta as tabelas VENDAS (V) e PRODUTO (P).
-- Agrupa por nome do produto e usa SUM(quantidade) para calcular o total vendido de cada item.
-- --------------------------------------------------------------------------------
SELECT
    P.nome AS Nome_Produto,
    SUM(V.quantidade) AS Total_Unidades_Vendidas
FROM VENDAS V
JOIN PRODUTO P ON V.id_produto = P.id_produto
GROUP BY P.nome
ORDER BY Total_Unidades_Vendidas DESC;


-- --------------------------------------------------------------------------------
-- 3. Listar o total de vendas do Bolo de Fubá
-- Junta VENDAS (V) e PRODUTO (P).
-- Filtra (WHERE) pelo nome do produto 'Bolo de Fubá' e soma a quantidade vendida.
-- --------------------------------------------------------------------------------
SELECT
    SUM(V.quantidade) AS Total_Bolo_Fuba
FROM VENDAS V
JOIN PRODUTO P ON V.id_produto = P.id_produto
WHERE P.nome = 'Bolo de Fubá';


-- --------------------------------------------------------------------------------
-- 4. Listar o total de vendas do Bolo de Chocolate
-- Junta VENDAS (V) e PRODUTO (P).
-- Filtra (WHERE) pelo nome do produto 'Bolo de Chocolate' e soma a quantidade vendida.
-- NOTA: Este produto deve ser inserido na tabela PRODUTO para que esta consulta retorne dados.
-- --------------------------------------------------------------------------------
SELECT
    SUM(V.quantidade) AS Total_Bolo_Chocolate
FROM VENDAS V
JOIN PRODUTO P ON V.id_produto = P.id_produto
WHERE P.nome = 'Bolo de Chocolate';


-- --------------------------------------------------------------------------------
-- 5. Produtos vendidos em 2025-06-03
-- Junta VENDAS (V) e PRODUTO (P).
-- Filtra (WHERE) pelo campo data_venda igual à data específica.
-- --------------------------------------------------------------------------------
SELECT
    P.nome AS Produto_Vendido,
    V.quantidade,
    V.data_venda
FROM VENDAS V
JOIN PRODUTO P ON V.id_produto = P.id_produto
WHERE V.data_venda = '2025-06-03';

-- COMANDOS DE INÍCIO
-- --------------------------------------------------------------------------------
-- 1. Seleciona o banco de dados para garantir que as tabelas sejam criadas no lugar correto.
-- --------------------------------------------------------------------------------
USE DB_03361B_LEANDRO_LIMA;

-- CRIAÇÃO DE TABELAS

-- --------------------------------------------------------------------------------
-- 2. CRIAÇÃO DA TABELA PRODUTO
-- Define os itens vendidos pela padaria.
-- id_produto: Chave Primária (INT), auto-incrementada, identificador único do produto.
-- nome: Nome do produto (VARCHAR(100)).
-- preco: Preço unitário em reais (DECIMAL(8,2)).
-- --------------------------------------------------------------------------------
CREATE TABLE Aula_08_Padaria_PRODUTO (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(8, 2)
);

-- --------------------------------------------------------------------------------
-- 3. CRIAÇÃO DA TABELA FORNECEDOR
-- Armazena as informações dos fornecedores da padaria.
-- id_fornecedor: Chave Primária (INT), auto-incrementada, identificador único do fornecedor.
-- nome: Nome do fornecedor (VARCHAR(100)).
-- telefone: Telefone de contato (VARCHAR(20)).
-- --------------------------------------------------------------------------------
CREATE TABLE Aula_08_Padaria_FORNECEDOR (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

-- --------------------------------------------------------------------------------
-- 4. CRIAÇÃO DA TABELA VENDAS
-- Tabela de relacionamento que registra as transações de venda.
-- id_venda: Chave Primária (INT), auto-incrementada, identificador da venda.
-- id_produto: Chave Estrangeira ligando à tabela PRODUTO (o item vendido).
-- quantidade: Quantidade vendida (INT).
-- data_venda: Data em que a venda ocorreu (DATE).
-- A referência FOREIGN KEY usa o nome completo da tabela 'Aula_08_Padaria_PRODUTO'.
-- --------------------------------------------------------------------------------
CREATE TABLE Aula_08_Padaria_VENDAS (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    data_venda DATE,

    id_produto INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Aula_08_Padaria_PRODUTO(id_produto)
);

-- INSERÇÃO DE DADOS DE EXEMPLO

-- --------------------------------------------------------------------------------
-- 5. INSERÇÃO DE 5 PRODUTOS
-- Adiciona itens típicos de padaria com seus respectivos preços.
-- --------------------------------------------------------------------------------
INSERT INTO Aula_08_Padaria_PRODUTO (nome, preco) VALUES
('Pão Francês', 0.50),
('Bolo de Fubá', 28.50),
('Sonho de Creme', 6.00),
('Café Expresso', 4.50),
('Pão Integral', 15.00);

-- --------------------------------------------------------------------------------
-- 6. INSERÇÃO DE 3 FORNECEDORES
-- Adiciona dados de fornecedores de exemplo.
-- --------------------------------------------------------------------------------
INSERT INTO Aula_08_Padaria_FORNECEDOR (nome, telefone) VALUES
('Moagem Trigo Puro', '1122334455'),
('Laticínios da Fazenda', '1166778899'),
('Grãos de Minas', '1100112233');

-- --------------------------------------------------------------------------------
-- 7. INSERÇÃO DE 8 REGISTROS DE VENDAS
-- Cria vendas vinculando IDs de Produto e quantidades.
-- --------------------------------------------------------------------------------
INSERT INTO Aula_08_Padaria_VENDAS (id_produto, quantidade, data_venda) VALUES
(1, 10, '2025-10-07'),
(2, 1, '2025-10-07'),
(3, 3, '2025-10-07'),
(4, 2, '2025-10-08'),
(1, 5, '2025-10-08'),
(5, 1, '2025-10-08'),
(3, 1, '2025-10-08'),
(2, 2, '2025-10-09');

-- CONSULTAS SQL

-- --------------------------------------------------------------------------------
-- 1. Listar todos os produtos cadastrados
-- Seleciona todas as colunas (*) da tabela PRODUTO.
-- --------------------------------------------------------------------------------
SELECT *
FROM Aula_08_Padaria_PRODUTO; -- AJUSTADO


-- --------------------------------------------------------------------------------
-- 2. Listar total de unidades vendidas por produto
-- Junta as tabelas VENDAS (V) e PRODUTO (P).
-- Agrupa por nome do produto e usa SUM(quantidade) para calcular o total vendido de cada item.
-- --------------------------------------------------------------------------------
SELECT
    P.nome AS Nome_Produto,
    SUM(V.quantidade) AS Total_Unidades_Vendidas
FROM Aula_08_Padaria_VENDAS V -- AJUSTADO
JOIN Aula_08_Padaria_PRODUTO P ON V.id_produto = P.id_produto -- AJUSTADO
GROUP BY P.nome
ORDER BY Total_Unidades_Vendidas DESC;


-- --------------------------------------------------------------------------------
-- 3. Listar o total de vendas do Bolo de Fubá
-- Junta VENDAS (V) e PRODUTO (P).
-- Filtra (WHERE) pelo nome do produto 'Bolo de Fubá' e soma a quantidade vendida.
-- --------------------------------------------------------------------------------
SELECT
    SUM(V.quantidade) AS Total_Bolo_Fuba
FROM Aula_08_Padaria_VENDAS V -- AJUSTADO
JOIN Aula_08_Padaria_PRODUTO P ON V.id_produto = P.id_produto -- AJUSTADO
WHERE P.nome = 'Bolo de Fubá';


-- --------------------------------------------------------------------------------
-- 4. Listar o total de vendas do Bolo de Chocolate
-- Junta VENDAS (V) e PRODUTO (P).
-- Filtra (WHERE) pelo nome do produto 'Bolo de Chocolate' e soma a quantidade vendida.
-- NOTA: Este produto deve ser inserido na tabela PRODUTO para que esta consulta retorne dados.
-- --------------------------------------------------------------------------------
SELECT
    SUM(V.quantidade) AS Total_Bolo_Chocolate
FROM Aula_08_Padaria_VENDAS V -- AJUSTADO
JOIN Aula_08_Padaria_PRODUTO P ON V.id_produto = P.id_produto -- AJUSTADO
WHERE P.nome = 'Bolo de Chocolate';


-- --------------------------------------------------------------------------------
-- 5. Produtos vendidos em 2025-06-03
-- Junta VENDAS (V) e PRODUTO (P).
-- Filtra (WHERE) pelo campo data_venda igual à data específica.
-- --------------------------------------------------------------------------------
SELECT
    P.nome AS Produto_Vendido,
    V.quantidade,
    V.data_venda
FROM Aula_08_Padaria_VENDAS V -- AJUSTADO
JOIN Aula_08_Padaria_PRODUTO P ON V.id_produto = P.id_produto -- AJUSTADO
WHERE V.data_venda = '2025-06-03';