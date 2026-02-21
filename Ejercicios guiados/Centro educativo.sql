USE centro_educativo;

ALTER TABLE alumnos
ADD edad INT;

ALTER TABLE alumnos
ADD CONSTRAINT CK_alumnos_edad
CHECK (edad BETWEEN 14 AND 65);

ALTER TABLE cursos
ADD CONSTRAINT CK_cursos_numHoTo
CHECK (numHoTo IN (30, 40, 60));

ALTER TABLE cursos
ADD CONSTRAINT CK_cursos_maxAlu
CHECK (maxAlu >= 15);

ALTER TABLE alumnos
DROP CONSTRAINT alu_sex_CK;

ALTER TABLE cursos
DROP FOREIGN KEY FK_cursos_profesores;

ALTER TABLE profesores
DROP COLUMN direPro;

ALTER TABLE profesores
DROP PRIMARY KEY;

ALTER TABLE profesores
ADD CONSTRAINT PK_profesores_nombre_apellidos
PRIMARY KEY (nombrePro, apellido1Pro, apellido2Pro);

ALTER TABLE profesores
RENAME TO tutores;

DROP TABLE alumnos;