-- Tabela Pessoa (para Alunos e Professores)
CREATE TABLE Pessoa (
    ID_Pessoa INT PRIMARY KEY,
    Nome VARCHAR(100),
    Tipo_Pessoa VARCHAR(50),  -- Aluno ou Professor
    CPF VARCHAR(20),
    Email VARCHAR(100)
);

-- Tabela Departamento
CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Nome_Departamento VARCHAR(100)
);

-- Tabela Professor
CREATE TABLE Professor (
    ID_Professor INT PRIMARY KEY,
    ID_Departamento INT,
    Nome_Professor VARCHAR(100),
    Especializacao VARCHAR(100),
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);

-- Tabela Curso
CREATE TABLE Curso (
    ID_Curso INT PRIMARY KEY,
    Nome_Curso VARCHAR(100)
);

-- Tabela Aluno
CREATE TABLE Aluno (
    ID_Aluno INT PRIMARY KEY,
    ID_Curso INT,
    Nome_Aluno VARCHAR(100),
    Email VARCHAR(100),
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
    ID_Disciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(100),
    ID_Professor INT,
    Ciclo_Vida VARCHAR(50),  -- Semestral
    Status VARCHAR(50),  -- Ativa ou Inativa
    FOREIGN KEY (ID_Professor) REFERENCES Professor(ID_Professor)
);

-- Tabela Matriculado (Aluno e Disciplina)
CREATE TABLE Matriculado (
    ID_Aluno INT,
    ID_Disciplina INT,
    Nota_Prova1 DECIMAL(5,2),
    Nota_Prova2 DECIMAL(5,2),
    Nota_Trabalho DECIMAL(5,2),
    Nota_Final DECIMAL(5,2),
    PRIMARY KEY (ID_Aluno, ID_Disciplina),
    FOREIGN KEY (ID_Aluno) REFERENCES Aluno(ID_Aluno),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina(ID_Disciplina)
);

-- Tabela Disciplina_Curso (Disciplina e Curso)
CREATE TABLE Disciplina_Curso (
    ID_Disciplina INT,
    ID_Curso INT,
    PRIMARY KEY (ID_Disciplina, ID_Curso),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina(ID_Disciplina),
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
);

-- Tabela Pré_Requisitos
CREATE TABLE Pré_Requisitos (
    ID_Disciplina INT,
    ID_Pre_Requisito INT,
    PRIMARY KEY (ID_Disciplina, ID_Pre_Requisito),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina(ID_Disciplina),
    FOREIGN KEY (ID_Pre_Requisito) REFERENCES Disciplina(ID_Pre_Requisito)
);

-- Tabela Oferta_de_Disciplina
CREATE TABLE Oferta_de_Disciplina (
    ID_Oferta INT PRIMARY KEY,
    ID_Disciplina INT,
    Ano_Semestre VARCHAR(50),
    Status_Oferta VARCHAR(50),  -- Ativa ou Finalizada
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina(ID_Disciplina)
);

-- Tabela Extensão
CREATE TABLE Extensão (
    ID_Extensao INT PRIMARY KEY,
    Nome_Extensao VARCHAR(100),
    Descricao TEXT
);

-- Tabela Extensão_has_Alunos
CREATE TABLE Extensão_has_Alunos (
    ID_Aluno INT,
    ID_Extensao INT,
    PRIMARY KEY (ID_Aluno, ID_Extensao),
    FOREIGN KEY (ID_Aluno) REFERENCES Aluno(ID_Aluno),
    FOREIGN KEY (ID_Extensao) REFERENCES Extensão(ID_Extensao)
);
