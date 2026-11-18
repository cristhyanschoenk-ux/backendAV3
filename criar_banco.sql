-- Script para preparar o banco da atividade.
-- Pode ser executado inteiro, quantas vezes quiser: ele recria tudo do zero.
-- No Database Client: conecte no MySQL, abra este arquivo e execute todos os comandos.

-- Garante que acentos e o símbolo "º" sejam lidos corretamente
SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS patrick2dsb2 CHARACTER SET utf8mb4;
USE patrick2dsb2;

-- A tabela horario_aula precisa ser apagada ANTES da tabela aula,
-- porque ela tem chave estrangeira apontando para aula.
DROP TABLE IF EXISTS horario_aula;
DROP TABLE IF EXISTS aula;

CREATE TABLE aula
(
 id INT PRIMARY KEY AUTO_INCREMENT,
 serie CHAR(2) NOT NULL,
 turma VARCHAR(6) NOT NULL,
 componente VARCHAR(100) NOT NULL,
 professor VARCHAR(100) NOT NULL
);

CREATE TABLE horario_aula
(
 id INT PRIMARY KEY AUTO_INCREMENT,
 idaula INT NOT NULL,
 dia_semana VARCHAR(7) NOT NULL,
 ordem INT NOT NULL
);

ALTER TABLE horario_aula ADD FOREIGN KEY(idaula) REFERENCES aula (id);

-- Uma aula de exemplo (vai receber o ID 1)
INSERT INTO aula (serie, turma, componente, professor) VALUES
("2º", "DSB", "Programação Back End", "Ronaldo");
