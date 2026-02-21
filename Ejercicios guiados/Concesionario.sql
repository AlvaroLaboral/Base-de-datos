CREATE DATABASE concesionario;
USE concesionario;

CREATE TABLE clientes (
    dnicli VARCHAR(9),
    nombrecli VARCHAR(15),
    ciudadcli VARCHAR(15),
    telfcli VARCHAR(9),
    CONSTRAINT PK_Clientes PRIMARY KEY (dnicli)
);

CREATE TABLE marcas (
    codmarca NUMERIC(5),
    nombremar VARCHAR(15),
    sedemar VARCHAR(15),
    CONSTRAINT PK_marcas PRIMARY KEY (codmarca)
);

CREATE TABLE concesionarios (
    cifconcesi VARCHAR(10),
    nombrecon VARCHAR(15),
    ciudadcon VARCHAR(15),
    telfcon VARCHAR(9),
    CONSTRAINT PK_Concesionarios PRIMARY KEY (cifconcesi)
);

CREATE TABLE coches (
    codcoche NUMERIC(5),
    codmarca NUMERIC(5),
    modelo VARCHAR(15),
    potencia NUMERIC(4),
    numplazas NUMERIC(1),
    numpuertas NUMERIC(1),
    color VARCHAR(15),
    CONSTRAINT PK_Coches PRIMARY KEY (codcoche)
);

CREATE TABLE ventas (
    codventa VARCHAR(10),
    fecha DATE,
    dnicli VARCHAR(9),
    cifconcesi VARCHAR(10),
    codcoche NUMERIC(5),
    CONSTRAINT PK_Ventas PRIMARY KEY (codventa)
);

ALTER TABLE coches
ADD CONSTRAINT FK_coches_marcas
FOREIGN KEY (codmarca)
REFERENCES marcas (codmarca)
ON DELETE CASCADE;

ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_coches
FOREIGN KEY (codcoche)
REFERENCES coches (codcoche)
ON DELETE CASCADE;

ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_clientes
FOREIGN KEY (dnicli)
REFERENCES clientes (dnicli)
ON DELETE CASCADE;

ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_concesionarios
FOREIGN KEY (cifconcesi)
REFERENCES concesionarios (cifconcesi)
ON DELETE CASCADE;