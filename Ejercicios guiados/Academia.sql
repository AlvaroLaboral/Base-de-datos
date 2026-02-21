CREATE DATABASE academia;
USE academia;

CREATE TABLE departamentos (
    dnume NUMERIC(3) NOT NULL,
    dnombre VARCHAR(15),
    dedificio NUMERIC(1),
    ddire VARCHAR(20),
    CONSTRAINT pk_departamentos PRIMARY KEY (dnume)
);


CREATE TABLE estudiantes (
    esnume NUMERIC(2) NOT NULL,
    esnombre VARCHAR(15),
    esapelli VARCHAR(25),
    esdomi VARCHAR(10),
    esedad NUMERIC(2),
    CONSTRAINT pk_estudiantes PRIMARY KEY (esnume)
);


CREATE TABLE profesores (
    pnume NUMERIC(2) NOT NULL,
    pnombre VARCHAR(25),
    pdomi VARCHAR(10),
    pdepar NUMERIC(3),
    CONSTRAINT pk_profesores PRIMARY KEY (pnume),
    CONSTRAINT fk_profesores_departamentos
        FOREIGN KEY (pdepar)
        REFERENCES departamentos (dnume)
);



CREATE TABLE cursos (
    cnume VARCHAR(3) NOT NULL,
    cnombre VARCHAR(25),
    cdescrip VARCHAR(10),
    ccredito NUMERIC(2),
    ctarifa NUMERIC(3),
    cprofe NUMERIC(2),
    cdia VARCHAR(9),
    chora VARCHAR(5),
    CONSTRAINT pk_cursos PRIMARY KEY (cnume),
    CONSTRAINT fk_cursos_profesores
        FOREIGN KEY (cprofe)
        REFERENCES profesores (pnume)
);

CREATE TABLE clases (
    clnume VARCHAR(3) NOT NULL,
    clcurso VARCHAR(3) NOT NULL,
    cledificio NUMERIC(1),
    CONSTRAINT pk_clases PRIMARY KEY (clnume, clcurso),
    CONSTRAINT fk_clases_cursos
        FOREIGN KEY (clcurso)
        REFERENCES cursos (cnume)
);


CREATE TABLE matriculas (
    manues NUMERIC(2) NOT NULL,
    manucu VARCHAR(3) NOT NULL,
    CONSTRAINT pk_matriculas PRIMARY KEY (manues, manucu),
    CONSTRAINT fk_matriculas_estudiantes
        FOREIGN KEY (manues)
        REFERENCES estudiantes (esnume),
    CONSTRAINT fk_matriculas_cursos
        FOREIGN KEY (manucu)
        REFERENCES cursos (cnume)
);