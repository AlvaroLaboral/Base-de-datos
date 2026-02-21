CREATE DATABASE pubs;
USE pubs;

CREATE TABLE localidad (
    cod_localidad INT,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT PK_localidad PRIMARY KEY (cod_localidad)
);

CREATE TABLE empleado (
    dni_empleado VARCHAR(9),
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100),
    CONSTRAINT PK_empleado PRIMARY KEY (dni_empleado)
);

CREATE TABLE pub (
    cod_pub VARCHAR(10),
    nombre VARCHAR(50) NOT NULL,
    licencia_fiscal VARCHAR(20) NOT NULL,
    domicilio VARCHAR(100),
    fecha_apertura DATE NOT NULL,
    horario VARCHAR(4) NOT NULL,
    cod_localidad INT NOT NULL,
    CONSTRAINT PK_pub PRIMARY KEY (cod_pub),
    CONSTRAINT CK_pub_horario CHECK (horario IN ('HOR1','HOR2','HOR3')),
    CONSTRAINT FK_pub_localidad
        FOREIGN KEY (cod_localidad)
        REFERENCES localidad (cod_localidad)
);

CREATE TABLE titular (
    dni_titular VARCHAR(9),
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100),
    cod_pub VARCHAR(10) NOT NULL,
    CONSTRAINT PK_titular PRIMARY KEY (dni_titular),
    CONSTRAINT FK_titular_pub
        FOREIGN KEY (cod_pub)
        REFERENCES pub (cod_pub)
);

CREATE TABLE existencias (
    cod_articulo VARCHAR(10),
    nombre VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(6,2) NOT NULL,
    cod_pub VARCHAR(10) NOT NULL,
    CONSTRAINT PK_existencias PRIMARY KEY (cod_articulo),
    CONSTRAINT CK_existencias_precio CHECK (precio > 0),
    CONSTRAINT FK_existencias_pub
        FOREIGN KEY (cod_pub)
        REFERENCES pub (cod_pub)
);

CREATE TABLE pub_empleado (
    cod_pub VARCHAR(10),
    dni_empleado VARCHAR(9),
    funcion VARCHAR(20),
    CONSTRAINT PK_pub_empleado PRIMARY KEY (cod_pub, dni_empleado),
    CONSTRAINT CK_pub_empleado_funcion
        CHECK (funcion IN ('CAMARERO','SEGURIDAD','LIMPIEZA')),
    CONSTRAINT FK_pub_empleado_pub
        FOREIGN KEY (cod_pub)
        REFERENCES pub (cod_pub),
    CONSTRAINT FK_pub_empleado_empleado
        FOREIGN KEY (dni_empleado)
        REFERENCES empleado (dni_empleado)
);