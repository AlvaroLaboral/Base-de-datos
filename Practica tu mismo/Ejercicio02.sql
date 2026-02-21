CREATE DATABASE instituto;
USE instituto;

CREATE TABLE alumno (
    numeMatri INT,
    nombreAlu VARCHAR(50),
    CONSTRAINT PK_alumno PRIMARY KEY (numeMatri)
);

CREATE TABLE profesor (
    codigoPro INT,
    nombrePro VARCHAR(50),
    CONSTRAINT PK_profesor PRIMARY KEY (codigoPro)
);

CREATE TABLE modulo (
    codigoMod INT,
    nombreMod VARCHAR(50),
    codigoPro INT,
    CONSTRAINT PK_modulo PRIMARY KEY (codigoMod),
    CONSTRAINT FK_modulo_profesor
        FOREIGN KEY (codigoPro)
        REFERENCES profesor (codigoPro)
);

CREATE TABLE matricula (
    numeMatri INT,
    codigoMod INT,
    nota DECIMAL(4,2),
    CONSTRAINT PK_matricula PRIMARY KEY (numeMatri, codigoMod),
    CONSTRAINT FK_matricula_alumno
        FOREIGN KEY (numeMatri)
        REFERENCES alumno (numeMatri),
    CONSTRAINT FK_matricula_modulo
        FOREIGN KEY (codigoMod)
        REFERENCES modulo (codigoMod)
);