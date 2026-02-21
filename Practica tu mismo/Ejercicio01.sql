CREATE DATABASE ventas;
USE ventas;

CREATE TABLE comercial (
    id INT(10),
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    ciudad VARCHAR(100),
    comision FLOAT,
    CONSTRAINT PK_comercial PRIMARY KEY (id)
);

CREATE TABLE cliente (
    id INT(10),
    nombre VARCHAR(25),
    primer_apellido VARCHAR(15),
    ciudad VARCHAR(100),
    categoria INT(10),
    id_comercial INT(10),
    CONSTRAINT PK_cliente PRIMARY KEY (id),
    CONSTRAINT FK_cliente_comercial
        FOREIGN KEY (id_comercial)
        REFERENCES comercial(id)
);

-- ¿Qué sentencia SQL debes ejecutar para modificar el encoding de la base de datos y usar utf8mb4 en lugar de latin1? --

ALTER DATABASE ventas
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

ALTER TABLE cliente
MODIFY nombre VARCHAR(100) NOT NULL;


-- ¿Qué comando podemos ejecutar para comprobar que el cambio en la columna nombre se ha ejecutado correctamente? --

DESCRIBE cliente;

ALTER TABLE cliente
CHANGE primer_apellido apellido1 VARCHAR(100) NOT NULL;

ALTER TABLE cliente
ADD apellido2 VARCHAR(100) NULL AFTER apellido1;

ALTER TABLE cliente
DROP categoria;

ALTER TABLE comercial
MODIFY comision FLOAT DEFAULT 10;