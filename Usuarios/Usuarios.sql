 -- Creamos la base de datos prestashop
 DROP DATABASE IF EXISTS prestashop;
 CREATE DATABASE prestashop CHARACTER SET utf8mb4;
 USE prestashop;

-- Creamos un usuario y le asignamos todos los persisos
DROP USER IF EXISTS 'user'@'localhost';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
 GRANT ALL PRIVILEGES ON prestashop.* TO 'user'@'localhost';

 -- Refrescamos los privilegios si queremos que se apliquen los cambios inmediatamente
 FLUSH PRIVILEGES;
 
-- Creamos la base de datos prestashop
DROP DATABASE IF EXISTS prestashop;
CREATE DATABASE prestashop CHARACTER SET utf8mb4;
USE prestashop;

-- Creamos un usuario y le asignamos todos los persisos
DROP USER IF EXISTS 'user'@'localhost';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON prestashop.* TO 'user'@'localhost';
-- Refrescamos los privilegios si queremos que se apliquen los cambios inmediatamente
FLUSH PRIVILEGES;

-- Creamos la base de datos de prestashop
DROP DATABASE IF EXISTS prestashop;
CREATE DATABASE prestashop CHARACTER SET utf8mb4;
USE prestashop;

-- Creamos un usuario y le asignamos todos los persisos
DROP USER IF EXISTS 'user'@'localhost';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON prestashop.* TO 'user'@'localhost' WITH GRANT OPTION;

-- Refrescamos los privilegios si queremos que se apliquen los cambios inmediatamente
FLUSH PRIVILEGES;

-- el usuario 'user'@'localhost' sólo podrá asignar a otros usuarios el permiso de
-- SELECT sobre la tabla customer de la base de datos prestashop.

GRANT SELECT ON prestashop.customer TO 'user'@'localhost' WITH GRANT OPTION;

-- La sintaxis simplificada para elminar permisos a un usuario en MySQL es la siguiente:
REVOKE permiso ON nombre_base_de_datos.nombre_tabla FROM 'nombre_usuario'@'
localhost';

-- vamos a eliminar los permisos de INSERT, UPDATE y DELETE, que tiene el usuario
-- user@localhost sobre todas las tablas de la base de datos prestashop.
REVOKE INSERT, UPDATE, DELETE ON prestashop.* FROM 'user'@'localhost';

-- Si queremos que los cambios se apliquen inmediatamente, tendremos que ejecutar la sentencia:
FLUSH PRIVILEGES;

-- La sintaxis para crear un rol en MySQL es la siguiente:
-- CREATE ROLE [IF NOT EXISTS] nombre_rol [, nombre_rol ] ...

-- Para asignar privilegios a un rol se utiliza la sentencia GRANT:
GRANT permiso ON nombre_base_de_datos.nombre_tabla TO nombre_rol;

-- Para asignar un rol a un usuario también se utiliza la sentencia GRANT:
 GRANT nombre_rol TO nombre_usuario;
 
 -- vamos a crear tres roles: rol_lectura_escritura, rol_lectura y rol_escritura
DROP ROLE IF EXISTS 'rol_lectura_escritura', 'rol_lectura', 'rol_escritura';
CREATE ROLE 'rol_lectura_escritura', 'rol_lectura', 'rol_escritura';

-- vamos a asignar los privilegios que tendrá cada rol y sobre qué base datos tendrá estos privilegios.
GRANT ALL ON base_de_datos.* TO 'rol_lectura_escritura';
GRANT SELECT ON base_de_datos.* TO 'rol_lectura';
GRANT INSERT, UPDATE, DELETE ON base_de_datos.* TO 'rol_escritura';

-- Creamos los usuarios
DROP USER IF EXISTS admin;
CREATE USER admin@'localhost' IDENTIFIED BY 'password1';

DROP USER IF EXISTS usuario_lectura_1;
CREATE USER usuario_lectura_1@'localhost' IDENTIFIED BY 'password2';

DROP USER IF EXISTS usuario_lectura_2;
CREATE USER usuario_lectura_2@'localhost' IDENTIFIED BY 'password3';

DROP USER IF EXISTS usuario_escritura_1;
CREATE USER usuario_escritura_1@'localhost' IDENTIFIED BY 'password4';
DROP USER IF EXISTS usuario_escritura_2;
CREATE USER usuario_escritura_2@'localhost' IDENTIFIED BY 'password5';

-- Asignamos los roles a los usuarios
GRANT 'rol_lectura_escritura' TO admin@'localhost';
GRANT 'rol_lectura' TO usuario_lectura_1@'localhost', usuario_lectura_2@'
localhost';
GRANT 'rol_escritura' TO usuario_escritura_1@'localhost', usuario_escritura_2@'
localhost';

-- Eliminar un rol de un usuario
REVOKE nombre_rol FROM nombre_usuario;

-- La sintaxis para eliminar un rol en MySQL es la siguiente:
-- DROP ROLE [IF NOT EXISTS] nombre_rol [, nombre_rol ] ...

-- Para obtener el listado de roles en MySQL podemos ejecutar la siguiente consulta:

SELECT mysql.user.user
FROM mysql.user
WHERE mysql.user.account_locked='Y' AND mysql.user.password_expired='Y' AND
mysql.user.authentication_string='';



