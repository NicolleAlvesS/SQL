-- 1. Criando as tabelas independentes primeiro (sem FKs)

CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL, -- Usei 14 para caber a máscara (000.000.000-00)
    UNIQUE (cpf)
);

CREATE TABLE Produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    preco DECIMAL(10,2) NOT NULL, -- Alterado para DECIMAL para suportar centavos
    categoria VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

-- 2. Criando as tabelas dependentes (com FKs)

CREATE TABLE Compra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    data DATETIME NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL, -- Corrigido o nome de fprm_pag
    total DECIMAL(10,2) NOT NULL,         -- Alterado para DECIMAL
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE Endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    cep VARCHAR(9) NOT NULL,
    complemento VARCHAR(100),             -- Pode ser nulo (casa não tem complemento)
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,          -- VARCHAR para aceitar "S/N" ou "123A"
    rua VARCHAR(150) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

-- 3. Criando a tabela associativa "tem" (Itens da Compra)

CREATE TABLE tem (
    idCompra INT NOT NULL,
    idProduto INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    desconto DECIMAL(10,2) NOT NULL,
    
    -- Chave Primária Composta (A dupla de IDs identifica a linha de forma única)
    PRIMARY KEY (idCompra, idProduto),
    
    -- Chaves Estrangeiras corrigidas
    FOREIGN KEY (idCompra) REFERENCES Compra(id),
    FOREIGN KEY (idProduto) REFERENCES Produto(id)
);
