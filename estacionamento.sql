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

INSERT INTO CLIENTE (cpf, nome, dtNacs) VALUES
(123456789, 'João da Silva', '1985-04-12'),
(234567890, 'Maria Oliveira', '1990-07-25'),
(345678901, 'Carlos Souza', '1978-01-15');

INSERT INTO modelo (codmod, desc_2) VALUES
(1, 'Sedan 1.0 Flex'),
(2, 'SUV 2.0 Turbo');

INSERT INTO VEICULO (placa, modelo_codMod, cliente_cpf, cor) VALUES
('ABC1234', 1, 123456789, 'Prata'),
('DEF5678', 2, 234567890, 'Preto'),
('GHI9012', 1, 345678901, 'Branco');

INSERT INTO PATIO (num, ender, capacidade) VALUES
(1, 'Rua das Flores, 100', 50),
(2, 'Av. Central, 500', 30);

INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtsaida, hsEntrada, hsSaida) VALUES
(1, 1, 'ABC1234', '2025-06-08', '2025-06-08', '08:00:00', '12:00:00'),
(2, 2, 'DEF5678', '2025-06-07', '2025-06-08', '09:30:00', '10:15:00'),
(3, 1, 'GHI9012', '2025-06-09', NULL, '07:45:00', NULL);

--letra a--
SELECT CLIENTE.nome, VEICULO.cor
FROM VEICULO
JOIN CLIENTE ON VEICULO.cliente_cpf = CLIENTE.cpf;
--letra b--
--letra c--
SELECT
VEICULO.placa,
VEICULO.cor
FROM VEICULO
JOIN estaciona ON estaciona.veiculo_placa = VEICULO.placa
WHERE
estaciona.COD;
--letra d--
SELECT * from estaciona
JOIN VEICULO ON estaciona.veiculo_placa = VEICULO.placa
WHERE
    estaciona.COD = 1;
--letra e--
SELECT 
VEICULO.placa,
MODELO.desc_2
FROM
VEICULO
JOIN modelo ON VEICULO.modelo_codMod = MODELO.codmod;