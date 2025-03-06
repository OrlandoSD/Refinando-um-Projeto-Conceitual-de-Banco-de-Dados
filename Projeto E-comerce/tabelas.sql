<<<<< Estrutura das Tabelas >>>>>>

CREATE TABLE Produto (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

CREATE TABLE Estoque (
    estoque_id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

CREATE TABLE Vendedor (
    vendedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    tipo ENUM('Interno', 'Terceirizado') NOT NULL
);

CREATE TABLE Produto_Vendedor (
    produto_id INT,
    vendedor_id INT,
    PRIMARY KEY (produto_id, vendedor_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id),
    FOREIGN KEY (vendedor_id) REFERENCES Vendedor(vendedor_id)
);

CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Endereco (
    endereco_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(255) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    endereco_id INT,
    data_pedido DATE NOT NULL,
    status ENUM('Em andamento', 'Concluído', 'Cancelado') NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (endereco_id) REFERENCES Endereco(endereco_id)
);

CREATE TABLE Pedido_Produto (
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

CREATE TABLE Pagamento (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    metodo_pagamento ENUM('Credito', 'Debito', 'A Vista', 'Pix') NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

CREATE TABLE Fornecedor (
    fornecedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Entrega (
    entrega_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    status_entrega ENUM('Em trânsito', 'Entregue', 'Atrasado') NOT NULL,
    codigo_rastreio VARCHAR(50),
    data_entrega DATE,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

<<<< Exemplo de Consultas SQL >>>>
<<   Consulta para verificar os produtos disponíveis e sua quantidade no estoque:    >>
SELECT p.nome, e.quantidade
FROM Produto p
JOIN Estoque e ON p.produto_id = e.produto_id;

<<  Consulta para verificar os pedidos de um cliente específico:   >>
SELECT * 
FROM Pedido
WHERE cliente_id = 1;

<<  Consulta para verificar o status da entrega de um pedido:   >>
SELECT e.status_entrega, e.codigo_rastreio
FROM Entrega e
JOIN Pedido p ON e.pedido_id = p.pedido_id
WHERE p.pedido_id = 1;

<< Consulta para listar os produtos em um pedido específico:  >>
SELECT p.nome, pp.quantidade
FROM Pedido_Produto pp
JOIN Produto p ON pp.produto_id = p.produto_id
WHERE pp.pedido_id = 1;

