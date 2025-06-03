CREATE DATABASE estacionamento;

USE estacionamento;


CREATE TABLE CLIENTE(
    cpf INT NOT NULL PRIMARY KEY,
    nome VARCHAR(80),
    dtNacs DATE
);

CREATE TABLE modelo(
    codmod INT NOT NULL PRIMARY KEY,
    desc_2 VARCHAR(80)
);

CREATE TABLE VEICULO(
    placa VARCHAR(8) NOT NULL PRIMARY KEY,
    modelo_codMod INT,
    cliente_cpf INT,
    cor VARCHAR(20),
    FOREIGN KEY (modelo_codMod) REFERENCES modelo (codmod),
    FOREIGN KEY (cliente_cpf) REFERENCES CLIENTE(cpf)
);

CREATE TABLE PATIO(
    num INT NOT NULL PRIMARY KEY,
    ender VARCHAR(40),
    capacidade INT
);

CREATE TABLE estaciona(
    cod INT NOT NULL PRIMARY KEY,
    patio_num INT,
    veiculo_placa VARCHAR(8),
    dtEntrada DATE,
    dtsaida DATE,
    hsEntrada TIME,
    hsSaida TIME,
    FOREIGN KEY (patio_num) REFERENCES PATIO(num),
    FOREIGN KEY (veiculo_placa) REFERENCES VEICULO (placa)
);

