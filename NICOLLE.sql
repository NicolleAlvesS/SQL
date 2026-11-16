

CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL, 
    UNIQUE (cpf)
);

CREATE TABLE Produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    preco DECIMAL(10,2) NOT NULL, 
    categoria VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Compra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    data DATETIME NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    total DECIMAL(10,2) NOT NULL,        
);

CREATE TABLE Endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    cep VARCHAR(9) NOT NULL,
    complemento VARCHAR(100),             
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,         
    rua VARCHAR(150) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);



CREATE TABLE tem (
    idCompra INT NOT NULL,
    idProduto INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    desconto DECIMAL(10,2) NOT NULL,
    
 
    PRIMARY KEY (idCompra, idProduto),
    
    FOREIGN KEY (idCompra) REFERENCES Compra(id),
    FOREIGN KEY (idProduto) REFERENCES Produto(id)
);
