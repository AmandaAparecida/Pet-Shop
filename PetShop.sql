-- Script de criação do banco de dados para o Pet Shop

CREATE DATABASE pet_shop;
USE pet_shop;

-- Tabela Dono
CREATE TABLE Dono (
    id_dono INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela Animal
CREATE TABLE Animal (
    id_animal INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT,
    id_dono INT,
    FOREIGN KEY (id_dono) REFERENCES Dono(id_dono)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    funcao VARCHAR(50),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela Servico
CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Tabela Atendimento
CREATE TABLE Atendimento (
    id_atendimento INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    id_animal INT,
    id_funcionario INT,
    FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

-- Tabela Atendimento_Servico
CREATE TABLE Atendimento_Servico (
    id_atendimento INT,
    id_servico INT,
    FOREIGN KEY (id_atendimento) REFERENCES Atendimento(id_atendimento),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico),
    PRIMARY KEY (id_atendimento, id_servico)
);

-- Tabela Produto
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_em_estoque INT NOT NULL
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    id_atendimento INT,
    id_produto INT,
    FOREIGN KEY (id_atendimento) REFERENCES Atendimento(id_atendimento),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);



