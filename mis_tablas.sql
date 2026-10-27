CREATE DATABASE rpg_manager CHARACTER SET utf8mb4;
USE rpg_manager;
SHOW TABLES;
SELECT DATABASE();
CREATE TABLE clase (
    id_clase INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE personaje (
    id_personaje INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    id_clase INT NOT NULL,
    nivel INT CHECK (nivel BETWEEN 1 AND 100),
    oro DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase)
);