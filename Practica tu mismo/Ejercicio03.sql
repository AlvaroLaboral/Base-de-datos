CREATE DATABASE videoclub;
USE videoclub;

CREATE TABLE director (
    dni VARCHAR(9),
    nombre VARCHAR(50),
    nacionalidad VARCHAR(30)
);

CREATE TABLE pelicula (
    titulo VARCHAR(100),
    nacionalidad VARCHAR(30),
    productora VARCHAR(50),
    fecha DATE,
    dni_director VARCHAR(9)
);

CREATE TABLE actor (
    nombre VARCHAR(50),
    nacionalidad VARCHAR(30),
    sexo CHAR(1)
);

CREATE TABLE pelicula_actor (
    titulo VARCHAR(100),
    actor VARCHAR(50),
    participacion VARCHAR(20)
);

CREATE TABLE ejemplares (
    numero_ejemplar INT,
    titulo VARCHAR(100),
    estado VARCHAR(30)
);

CREATE TABLE socio (
    dni VARCHAR(9),
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    aval VARCHAR(9)
);

CREATE TABLE alquiler (
    numero_ejemplar INT,
    titulo VARCHAR(100),
    socio VARCHAR(9),
    fecha_prestamo DATE,
    fecha_devolucion DATE
);

ALTER TABLE director
ADD CONSTRAINT PK_director PRIMARY KEY (dni);

ALTER TABLE pelicula
ADD CONSTRAINT PK_pelicula PRIMARY KEY (titulo);

ALTER TABLE actor
ADD CONSTRAINT PK_actor PRIMARY KEY (nombre);

ALTER TABLE socio
ADD CONSTRAINT PK_socio PRIMARY KEY (dni);

ALTER TABLE ejemplares
ADD CONSTRAINT PK_ejemplares PRIMARY KEY (numero_ejemplar, titulo);

ALTER TABLE pelicula_actor
ADD CONSTRAINT PK_pelicula_actor PRIMARY KEY (titulo, actor);

ALTER TABLE alquiler
ADD CONSTRAINT PK_alquiler PRIMARY KEY (numero_ejemplar, titulo, fecha_prestamo);

ALTER TABLE pelicula
ADD CONSTRAINT FK_pelicula_director
FOREIGN KEY (dni_director)
REFERENCES director (dni);

ALTER TABLE pelicula_actor
ADD CONSTRAINT FK_pelicula_actor_pelicula
FOREIGN KEY (titulo)
REFERENCES pelicula (titulo);

ALTER TABLE pelicula_actor
ADD CONSTRAINT FK_pelicula_actor_actor
FOREIGN KEY (actor)
REFERENCES actor (nombre);

ALTER TABLE ejemplares
ADD CONSTRAINT FK_ejemplares_pelicula
FOREIGN KEY (titulo)
REFERENCES pelicula (titulo);

ALTER TABLE alquiler
ADD CONSTRAINT FK_alquiler_ejemplar
FOREIGN KEY (numero_ejemplar, titulo)
REFERENCES ejemplares (numero_ejemplar, titulo);

ALTER TABLE alquiler
ADD CONSTRAINT FK_alquiler_socio
FOREIGN KEY (socio)
REFERENCES socio (dni);

ALTER TABLE socio
ADD fechanac DATE;

ALTER TABLE alquiler
ADD importe DECIMAL(6,2) NOT NULL;

ALTER TABLE alquiler
ADD CONSTRAINT CK_fechas_alquiler
CHECK (fecha_devolucion >= fecha_prestamo);

ALTER TABLE pelicula
ADD DineroGenerado DECIMAL(10,2) NOT NULL;