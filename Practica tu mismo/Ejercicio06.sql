USE concesionario;

CREATE TABLE distribucion (
    cifconcesi VARCHAR(10),
    codcoche NUMERIC(5),
    cantidad NUMERIC(5),
    CONSTRAINT PK_distribucion PRIMARY KEY (cifconcesi, codcoche),
    CONSTRAINT FK_distribucion_concesionarios
        FOREIGN KEY (cifconcesi)
        REFERENCES concesionarios (cifconcesi),
    CONSTRAINT FK_distribucion_coches
        FOREIGN KEY (codcoche)
        REFERENCES coches (codcoche)
);