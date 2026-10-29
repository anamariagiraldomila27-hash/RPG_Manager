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
INSERT INTO clase (id_clase, nombre) VALUES 
(1, 'Guerrero'),
(2, 'Mago'),
(3, 'Arquero');
INSERT INTO personaje (nombre, id_clase, nivel, oro) VALUES
('Valerius', 1, 5, 100.50),
('Aeliana', 2, 10, 250.00);
CREATE TABLE item (
    id_objeto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_objeto VARCHAR(50) NOT NULL UNIQUE,
    categoria_objeto VARCHAR(30) NOT NULL,
    valor_objeto DECIMAL(10,2) CHECK (valor_objeto >= 0)
);
INSERT INTO item (nombre_objeto, categoria_objeto, valor_objeto) VALUES
('Espada de hierro', 'arma', 50.00),
('Medicamento curativo', 'pocion', 60.00);
UPDATE item SET valor_objeto = 40.00 WHERE nombre_objeto = 'Medicamento curativo';
CREATE TABLE inventario (
    id_personaje INT,
    id_objeto INT,
    cantidad INT DEFAULT 1 CHECK (cantidad > 0),
    PRIMARY KEY (id_personaje, id_objeto),
    FOREIGN KEY (id_personaje) REFERENCES personaje(id_personaje),
    FOREIGN KEY (id_objeto) REFERENCES item(id_objeto)
);
INSERT INTO inventario (id_personaje, id_objeto, cantidad) VALUES(1, 1, 2),(2, 2, 1);
SELECT personaje.nombre, item.nombre_objeto, inventario.cantidad
FROM inventario
JOIN item ON inventario.id_objeto = item.id_objeto
JOIN personaje ON inventario.id_personaje = personaje.id_personaje;

-----
SELECT * FROM clase;
SELECT* FROM personaje;
SELECT nombre, oro FROM personaje WHERE oro <= 150;
SELECT *FROM item;
SELECT nombre_objeto,valor_objeto FROM item WHERE valor_objeto  >=50.00;
SELECT * FROM inventario;