CREATE DATABASE IF NOT EXISTS bemViver;
USE bemViver;

CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nome_usuario VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    email_usuario VARCHAR(50) NOT NULL,
    senha_usuario VARCHAR(50) NOT NULL
);

CREATE TABLE sintomas (
	id_sintoma INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_sintoma VARCHAR(50),
    descricao_sintoma VARCHAR(100)
);

CREATE TABLE historico (
	id_historico INT PRIMARY KEY AUTO_INCREMENT,
    id_sintoma INT NOT NULL,
    id_cliente INT NOT NULL,
    recomendacao VARCHAR(300),
    
    FOREIGN KEY (id_cliente) REFERENCES usuario (id_usuario),
    FOREIGN KEY (id_sintoma) REFERENCES sintomas (id_sintoma)
);

CREATE TABLE alimentos (
	id_alimento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_alimento VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE recomendacoes (
    id_recomendacao INT PRIMARY KEY AUTO_INCREMENT,
    id_sintoma INT,
    id_alimento INT,
    observacoes VARCHAR(100),
    FOREIGN KEY (id_sintoma) REFERENCES sintomas(id_sintoma),
    FOREIGN KEY (id_alimento) REFERENCES alimentos(id_alimento)
);

CREATE TABLE recomendacoes_usuario (
	id_recomendacao_usuario INT PRIMARY KEY AUTO_INCREMENT,
    id_recomendacao INT NOT NULL,
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_recomendacao) REFERENCES recomendacoes (id_recomendacao),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

select * from usuario;

SET foreign_key_checks = 0;
drop table recomendacoes;

CREATE TABLE recomendacoes (
    id_recomendacao INT auto_increment PRIMARY KEY,
    sintoma VARCHAR(100) NOT NULL,
    alimento VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE historico_recomendacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    sintoma VARCHAR(100) NOT NULL,
    alimento VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_recomendacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

INSERT INTO recomendacoes (sintoma, alimento, descricao) VALUES
('Dor de cabeça', 'Alho', 'Propriedades anti-inflamatórias que ajudam a aliviar a dor.'),
('Dor de cabeça', 'Chá de gengibre', 'Ajuda a reduzir a inflamação e a dor.'),
('Enjoo', 'Gengibre', 'Melhora a digestão e combate náuseas.'),
('Náusea', 'Chá de hortelã', 'Alivia a sensação de náusea e acalma o estômago.'),
('Fadiga', 'Banana', 'Rica em potássio e fornece energia rápida.'),
('Febre', 'Caldo de galinha', 'Ajuda na hidratação e fornece nutrientes.'),
('Tosse', 'Mel', 'Tem propriedades anti-inflamatórias e suaviza a garganta.'),
('Dores Corporais', 'Cúrcuma', 'Possui propriedades anti-inflamatórias.'),
('Falta de ar', 'Alimentos ricos em ômega-3', 'Ajudam a melhorar a saúde pulmonar.'),
('Dificuldade para engolir', 'Alimentos macios', 'Facilitam a deglutição e são mais fáceis de consumir.');

select * from recomendacoes;

select * from historico_recomendacoes;

