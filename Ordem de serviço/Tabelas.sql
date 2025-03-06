CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(15),
    Endereco VARCHAR(255),
    Data_Cadastro DATE
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE,
    Status VARCHAR(50),
    Descricao TEXT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Responsavel (
    ID_Responsavel INT PRIMARY KEY,
    Nome_Responsavel VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(15),
    Cargo VARCHAR(50)
);

CREATE TABLE OrdemServico (
    ID_OrdemServico INT PRIMARY KEY,
    ID_Pedido INT,
    ID_Responsavel INT,
    Data_Inicio DATE,
    Data_Fim DATE,
    Status VARCHAR(50),
    Descricao TEXT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Responsavel) REFERENCES Responsavel(ID_Responsavel)
);

CREATE TABLE AnalisePedido (
    ID_Analise INT PRIMARY KEY,
    ID_Pedido INT,
    Status_Analise VARCHAR(50),
    Descricao_Analise TEXT,
    Data_Analise DATE,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);
