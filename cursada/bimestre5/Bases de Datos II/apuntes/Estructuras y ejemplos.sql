#############################################################################################################################
################################################ Estructura de una /Función/ ################################################
-- Sintáxis --
DELIMITER $$
CREATE FUNCTION nombre_function() -- Comando seguido por el nombre de la función
RETURNS [TIPO_DE_DATO] [CARACTERISTICA] -- Para indicar qué tipo de dato retornará y el tipo de función
BEGIN
	RETURN -- Retorna el bloque de instrucciones SQL;
END; $$

CREATE FUNCTION nombre_function(); -- Crear una funcion

DROP FUNCTION [IF EXISTS] nombre_function(); -- Elimina una función. Se requiere privilegio de ALTER ROUTINE.

### Tipos de características de funciones ###
-- DETERMINISTIC --------> Siempre devuelve el mismo resultado cuando se utilizan los mismo parámetros
-- NO DETERMINISTIC -----> No siempre devuelve el mismo resultado aunque se utilizan los mismo parámetros
-- CONTAINS SQL ---------> Contiene sentencias SQL pero no contiene sentencias de manipulación de datos
-- NO SQL ---------------> No contiene sentencias SQL
-- READS DATA -----------> Contiene sentencias de lectura de datos, como el SELECT
-- MODIFIES SQL DATA ----> Modifica los datos de la base de datos y que contiene sentencias como INSERT, UPDATE o DELETE

### Alaraciones para las funciones ###
-- Si no queremos especificar una caracrística a la función, debemos ejecutar los siguiente para que no nos muestre error al ejecutarla. Por defecto es = 0;
SET GLOBAL log_bin_trust_function_creators = 1;

### Ejecución y ejemplo de FUNCIONES ###
-- Ejemplo I
CREATE FUNCTION nombre_completo(nombre VARCHAR(45), apellido VARCHAR(45))
RETURNS VARCHAR(90) DETERMINISTIC
BEGIN
	RETURN CONCAT(nombre, ' ', apellido);
END;

-- Ejecución -- Ejemplo I
SELECT idUsuario, nombre_completo(nombre, apellido) FROM usuarios;
- o -
SELECT legajo, nombre_completo(nombre, apellido) FROM usuarios;

-- Ejemplo II
DELIMITER $$
CREATE FUNCTION categoria_sueldo(sueldo DOUBLE)
RETURNS VARCHAR(15) DETERMINISTIC
BEGIN
	DECLARE categoria VARCHAR(15);
    CASE WHEN sueldo < 200 THEN SET categoria = 'Bajo';
		WHEN sueldo < 1000 THEN SET categoria = 'Promedio';
		ELSE SET categoria = 'Alto';
    END CASE;
		RETURN catgeoria;
END $$

-- Ejecución -- Ejemplo II
SELECT legajo, sueldo, categoria_sueldo(sueldo) FROM empleados;

############################### Asignacion de valores a Variables ###############################
-- Ejemplo de uso en Funciones
DELIMITER $$
CREATE FUNCTION agregar_IVA(precio_sin_impuestos DOUBLE(10,12))
RETURNS DOUBLE(10,12) DETERMINISTIC
BEGIN
	DECLARE IVA INT DEFAULT 21;
    RETURN ((precio_sin_impuestos * IVA)/100) + precio_sin_impuestos;
END $$

-- Para asignar una -Variable- se utiliza la cláusula SET
-- Las -Variables- solo pueden contener valores escalables (solo valor)

############################### *Parámetros* en FUNCIONES ###############################

-- Los *Parámetros* son variables por donde se envían y reciben datos de programas clientes
-- Se defienen dentro de la cláusula CREATE
-- Las FUNCIONES pueden tener uno, varios o ningún parámetro de entrada
-- NO pueden ingresarse Parámetros del tipo OUT o INOUT

############################### Declaración del *Parámetro* IN ###############################
-- Es un Parámetro de entrada de datos y se utiliza para recibir valores.
-- Sintáxis
CREATE FUNCTION nombre_function(IN param1 TIPO_DE_DATO, IN param2 TIPO_DE_DATO)

-- Ejemplo de uso 
CREATE FUNCTION nombre_function(IN id_usuario INT)
BEGIN
	-- Bloque de instrucciones SQL
END;

-- Ejecución
SELECT *, nombre_fucntion(idUsuario) FROM usuarios;

########################################################################################################################################
################################################ Estructura de un SP (Stored Procedure) ################################################
-- Sintáxis --
DELIMITER $$ -- Esta cláusula va siempre
CREATE PROCEDURE sp_nombre_procedimiento() -- Comando para crear el procediento seguido del nombre
BEGIN -- Inicio del código SQL
	-- Bloque de instrucciónes SQL;
END $$ -- Esta cláusula seguida de $$ definidos en el DELIMITER para indicar el fin del código SQL

CREATE PROCEDURE sp_nombre_procedimiento() -- Crea un procemiento almacenado

DROP PROCEDURE [IF EXISTS] sp_nombre_procedimiento() -- Elimina un procedimiento almacenado. Se requiere del privilegio de ALTER ROUTINE

-- Dentreo de un SP se permiten declarar -Variables- que son elementos que almacenan datos que pueden ir cambiando a lo largo de la ejecución
-- La declaración de -Variables- se coloca después de la cláusula BEGIN y antes del bloque de instrucciones SQL
-- Opcionalmente, se puede definir un valor inicial mediante la cláusula DEFAULT
-- Dentro del bloque BEGIN ... END, además de la declaracion de -Variables- se pueden escribir distintas sentencias para nuestros procedimientos: Sentencias de control de flujo, Cursores y Manejo de errores

############################### Declaración de Variables ###############################
-- Sintáxis --
DECLARE nombre_variable TIPO_DE_DATO [DEFAULT valor];

-- Ejemplo de uso
DECLARE salario FLOAT DEFAULT 1000.00;

-- La declarción de -Variables- se coloca despues de la cláusula BEGIN y antes del bloque de instrucciones SQL

############################### Asignacion de valores a Variables ###############################
-- Sintáxis --
SET nombre_variable = expresión;

-- Ejemplo de uso en SP
DELIMITER $$
CREATE PROCEDURE sp_nombre_procedimiento()
BEGIN
	DECLARE salario FLOAT DEFAULT 1000.00;
    SET salario = 25700.50;
END $$

-- Para asignar una -Variable- se utiliza la cláusula SET
-- Las -Variables- solo pueden contener valores escalables (solo valor)

#################################################################################################
############################# *Parámetros* en SP (Stored Procedure) #############################

-- Los *Parámetros* son variables por donde se envían y reciben datos de programas clientes
-- Se defienen dentro de la cláusula CREATE
-- Los SP pueden tener uno, varios o ningún parámetro de entrada y asimismo, pueden tener uno, varios o ningún parámetro de salida
-- Existen 3 tipos de Prarámetros: IN, OUT e INOUT, declarados a continuación.

############################### Declaración del *Parámetro* IN ###############################
-- Prámetro de entrada de datos y se utiliza para recibir valores. Viene definido por defecto si no se especifica
-- Sintáxis --
CREATE PROCEDURE sp_nombre_procedimiento(IN param1 TIPO_DE_DATO, IN param2 TIPO_DE_DATO);

-- Ejemplo de uso
DELIMITER $$
CREATE PROCEDURE sp_nombre_procedimiento(IN id_usuario INT)
BEGIN 
	-- Bloque de instrucciónes SQL;
END $$

-- Ejecución 
CALL sp_nombre_procedimiento(11);

############################### Declaración del *Parámetro* OUT ###############################
-- Prámetro de salida de datos y se utiliza para devolver valores.
-- Sintáxis --
CREATE PROCEDURE sp_nombre_procedimiento(OUT param1 TIPO_DE_DATO, OUT param2 TIPO_DE_DATO);

-- Ejemplo de uso
DELIMITER $$
CREATE PROCEDURE sp_nombre_procedimiento(OUT salario FLOAT)
BEGIN 
	SET salario = 25700.00;
END $$

-- Ejecución 
CALL sp_nombre_procedimiento(@salario);
SELECT @salario; -- Bloque de instrucciónes SQL;

############################### Declaración del *Parámetro* INOUT ###############################
-- Es un mismo Parámetro que utiliza para la entrada y salida de datos. Puede recibir valores y devolver los resultados en la misma Variable
-- Sintáxis --
CREATE PROCEDURE sp_nombre_procedimiento(INOUT param1 TIPO_DE_DATO, INOUT param2 TIPO_DE_DATO);

-- Ejemplo de uso
DELIMITER $$
CREATE PROCEDURE sp_nombre_procedimiento(INOUT aumento FLOAT)
BEGIN 
	SET aumento = aumento + 25700.00;
END $$

-- Ejecución 
SET @salario = 2000.00; -- Declaración y asignación de -Variables- (dato)
CALL sp_nombre_procedimiento(@salario); -- Ejecución y envío de dato (2000.0)
SELECT @salario; -- Muestra el resultado

#############################################################################################
##################################### Instrucciones DDL #####################################
-- CREATE TABLE --
DELIMITER $$
CREATE PROCEDURE sp_crear_tabla()
BEGIN 
	CREATE TABLE nombre_tabla(
		id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
        descripcion VARCHAR(200));
END $$

CALL sp_crear_tabla();

-- ALTER TABLE --
DELIMITER $$
CREATE PROCEDURE sp_modificar_tabla()
BEGIN 
	ALTER TABLE nombre_tabla ADD COLUMN campo VARCHAR(50) NOT NULL;
END $$

CALL sp_modificar_tabla();

-- DROP TABLE --
DELIMITER $$
CREATE PROCEDURE sp_eliminar_tabla()
BEGIN 
	DROP TABLE nombre_tabla;
END $$

CALL sp_modificar_tabla();

#############################################################################################
##################################### Instrucciones DML #####################################
-- INSERT --
DELIMITER $$
CREATE PROCEDURE sp_agregar_usuario(
	IN nombre VARCHAR(30), IN apellido VARCHAR(30))
BEGIN 
	INSERT INTO usuario (nombre,apellido) VALUES (nombre, apellido);
END $$

CALL sp_agregar_usuario('VICTORIA', 'SUAREZ');

-- UPDATE -- 
DELIMITER $$
CREATE PROCEDURE sp_modificar_nombre_usuario(
	IN id INT, IN nombre VARCHAR(30))
BEGIN 
	UPDATE usuario SET nombre = nombre WHERE id_usuario = id;
END $$

CALL sp_modificar_nombre_usuario(1, 'VICTORIA');

-- DELETE --
DELIMITER $$
CREATE PROCEDURE sp_eliminar_usuario(IN id INT)
BEGIN 
	DELETE FROM usuario WHERE id_usuario = id;
END $$

CALL sp_eliminar_usuario(1);

-- SELECT con IN - OUT --
DELIMITER $$
CREATE PROCEDURE sp_dame_nombre_usuario(
	IN id INT, OUT nom VARCHAR(30))
BEGIN 
	SELECT nombre INTO nom FROM usuarios WHERE id_usuario = id;
END $$

CALL sp_dame_nombre_usuario(1, @nombre); -- Ejecución del SP y envía '1' como dato
SELECT @nombre; -- Muestra el resultado

-- SELECT con INOUT --
DELIMITER $$
CREATE PROCEDURE sp_dame_nombre_usuario(INOUT valor VARCHAR(30))
BEGIN 
	SELECT COUNT(*) INTO valor FROM usuarios 
    WHERE combre LIKE CONCAT('%', valor, '%');
END $$

SET @letra = 'a'; -- Declaración y asignación de -Variables- (dato)
CALL sp_dame_nombre_usuario(@letra); -- Ejecución del SP y envía 'a' como dato
SELECT @letra; -- Muestra el resultado

################################################ Sentencias de control de flujo ################################################
-- CASE -----> se utiliza para condicionales complejos
-- IF -------> se utiliza para condicionales simples
-- ITERATE --> volver a empezar una iteración. Solo se utiliza en WHILE, LOOP y REPEAT
-- LEAVE ----> se utiliza para salir de iteraciones
-- LOOP -----> bucle que se ejecuta X cantidad de veces
-- REPEAT ---> bucle que se ejecuta hasta que se cumpla la condicion
-- RETURN ---> se utiliza para retornar un valor en una Función o Procedimiento (SP)
-- WHILE ----> bucle que se ejecuta mientra se cumpla una condición

-- Ejemplo de sentencias de control de flujo I --
DELIMITER $$
CREATE FUNCTION nombre_funcion(id_usuario INT) 
RETURNS INT
BEGIN
	DECLARE v INT;
	SET v = id_usuario;
    CASE v
		WHEN v = 1 THEN SET v = 2;
        WHEN v = 3 THEN SET v = 4;
	END CASE;
    nombreLoop: LOOP
		SET v = v +1;
		IF v <= 3 THEN ITERATE nombreLoop;
		ELSEIF v > 3 THEN LEAVE nombreLoop;
		END IF;
    END LOOP nombreLoop;
    RETURN v;
END $$

-- Ejemplo de sentencias de control de flujo II --
CREATE FUNCTION nombre_funcion() RETURNS INT
BEGIN
	DECLARE v INT;
    SET v = 1;
    REPEAT
		SET v = v + 1;
		UNTIL v = 1000 
    END REPEAT;
    WHILE v > 0 DO
		SET v = v - 1;
	END WHILE;
	RETURN v;
END $$

################################################ Cursor ################################################ (+info línea 607)
-- DECLARE --> se utiliza para definir el cursor
-- OPEN -----> se utiliza para abrir el cursor
-- FETCH ----> se utiliza para asignar el próximo valor del cursor a una variable
-- CLOSE ----> se utiliza para cerrar un cursor

-- Ejemplo de cursor -- 
DELIMITER $$
CREATE PROCEDURE sp_nombre_procedimeinto(IN id_usuario INT)
BEGIN
	DECLARE a, b INT;
    DECLARE cur1 CURSOR FOR SELECT id FROM test.t1;
    OPEN cur1;
    sumarIds: LOOP
    FETCH cr1 INTO a;
		IF a > 100 THEN
			SET b = a + b;
		END IF;
        IF b > 100 THEN
			LEAVE sumarIds;
		END IF;
	END LOOP;
    CLOSE cur1;
END $$

################################################ Manejo de errores ################################################
-- CONDITIONS --> son nombres que podemos agregar a los errores para dejar más legible nuestro código
-- HANDLERS ----> es el manejo de errores. Por cada error que se ejecute, y si esa condicion está definida en un handler, el código que definimos será ejecutado

-- Ejemplo de manejo de errores --
-- Si una condicion no está definida, al leer nuestro código tenemos que saber de antemano que es el "error"
DECLARE CONTINUE HANDLER FOR 1051
BEGIN 
	-- Bloque de instrucciones SQL;
END;
-- Si definimos la condition. al momento de leer el código nos hacemos una idea sobre de qué trata el error. Luego sigue el código que definimos en el Handler
DECLARE no_existe_tabla CONDITION FOR 1054
DECLARE CONTINUE HANDLER FOR no_existe_tabla
BEGIN
	-- Bloque de instrucciones SQL;
END;

######################################################################################################
################################## Diferencias entre SP y Funciones ##################################
######################################################################################################
-- Definición -- 
-- SP -------> es un objeto de la base de datos en el cual podemos agregas distintas instruciiones de SQL para que se ejecuten
-- FUNCIÓN --> es un objeto de la base de datos en el cual podemos agregas distintas instruciiones de SQL para que siempre devuelvan un resultado

-- Parámetetros --
-- SP -------> los mismos pueden o no tener parámetros de entrada y/o salida
-- FUNCIÓN --> las mismas pueden tener parámetros solo de entrada

-- Resultado --
-- SP -------> se puede devolver un resultado en un parámetro OUT. También puede retornar la ejecución de un SELECT
-- FUNCIÓN --> siempre una función tiene que devolver un resultado. El tipo de resultado se define cuando creamos una función

-- ¿Cuándo usarlo?
-- SP -------> cuando queramos definir cierta lógica de negocio que involucre uno o más sentencias
-- FUNCIÓN --> cuando queramos definir cierta lógica de cálculo y que siempre retorne un valor

-- ¿Cómo lo llamamos?
-- SP -------> con la sentencia CALL
-- FUNCIÓN --> con la sentencia SELECT

#######################################################################################
################################## Tipo de Funciones ##################################
#######################################################################################
-- ------ Funciones almacenadas ------ --
-- Las ya detalladas anteriormente

-- ------ Funciones de cadena de texto ------ --
-- CHARACTER_LENGTH --> devuelve la longitud de la cadena (en caracteres)
-- CONCAT ------------> junta 2 o más cadenas de texto
-- FORMAT ------------> formatea un número a un formato como '#,###,###.##', redondeando a un número específico de posiciones decimales
-- INSERT ------------> inserta una cadena de cadena en la posicon específica y para un cierto número de caracteres
-- LEFT --------------> extrae varios caracteres de una cadena comenzando desde la izquierda
-- RIGHT -------------> extrae varios caracteres de una cadena comenzando desde la derecha
-- SUBSTR ------------> extrae una subcadena de una cadena (comenzando por cualquier posición)
-- LOCATE ------------> devuelve la posición de la primera aparición de una subcadena en una cadena
-- LOWER -------------> convierte una cadena en minúsculas
-- UPPER -------------> convierte una cadena en mayúculas
-- REPLACE -----------> reemplaza todas las apariciones de una subcadena dentro de una cadena, con una nueva subcadena

-- ------ Funciones numéricas ------ --
-- AVG, SUM, MAX, MIN, COUNT (más conocidas)
-- GREATEST --> devuelve el mayor valor de la lista de argumentos
-- LEAST -----> devuelve el valor más pequeño de la lista de argumentos
-- MOD -------> devuelve es resto de un número dividido por otro número
-- POW -------> devuleve del valor de un número elevado a la potencia de otro número
-- ROUND -----> redondea un número a un número específico de decimales
-- SQRT ------> devuelve la raíz cuadrada de un número
-- TRUNCATE --> trunca un número al número especificado de posiciones decimales

-- ------ Funciones de fecha ------ --
-- ADDDATE ------> agrega un intérvalo de hora/feha a una fecha y luego devuelve la fecha
-- CURDATE ------> devuelve la fecha actual
-- DATEDIFF -----> devuelve el número de días entre dos valores de fecha
-- DATE_FORMAT --> formatea una fecha
-- EXTRACT ------> extrae una parte de una fecha determinada
-- LAST_DATE ----> extrae el último día del mes para una fecha determinada
-- SEC_TO_TIME --> devuelve un valor de tiempo basado en los segundos especificados

-- ------ Funciones de ventana ------ --
-- Realiza un cálculo en un conjunto de filas de la tabla que de alguna manera están relacionadas con la fila actual.Esto es comparable al tipo de cálculo que se puede hacer con una función de agregación —AVG, COUNT, SUM, etc.—. Pero, a diferencia de las funciones agregadas normales, *** el uso de una función de ventana no hace que las filas se agrupen en una sola fila de salida; las filas conservan sus identidades separadas *** . Detrás de escena, la función de ventana puede acceder a más que solo la fila actual del resultado de la consulta.
-- FIRST_VALUE --> devuelve el primer valor del primer registro de nuestra consulta
-- LAST_VALUE ---> devuelve el valor del último registro de nuestra consulta
-- LAG ----------> devuelve el valor anterior del registro actual que estamos mostrando
-- LEAD ---------> devuelve el valor siguiente del registro actual que estamos mostrando
-- NTILE --------> divide la cantidad de resultados por el parámetro que recibe y asigna un grupo a cada uno de los registros.
-- ROW_NUMBER ---> devuelve el número de la fila actual dentro de la cantidad de resultados. Los números de filas van desde 1 hasta el número de filas de resultados.

-- ------ Funciones de información ------ --
-- se utilizan para consultar la información del sistema de la base de datos MySQL. Se utilizan también para obtener información sobre las conexiones a nuestra base.
-- CURRENT_ROLE ----> devuelve los roles activos actuales del usuario conectado.
-- CURRENT_USER ----> devuelve el nombre de usuario y el nombre de host autenticados.
-- DATABASE --------> devuelve el nombre de la base de datos actual.
-- LAST_INSERT_ID --> devuelve el valor de la columna AUTOINCREMENT para el último INSERT.
-- ROW_COUNT -------> Devuelve el número de filas actualizadas.
-- VERSION ---------> Devuelve una cadena que indica la versión del servidor MySQL.

################################################### Variables ###################################################
-- ----- Variables definidas por el usuario ----- --
-- Identificadas por el símbolo @ usado como prefijo. Si no se inicializan al declararlas su valor es NULL
-- Para inicializarla se usa SET o SELECT
-- Se pueden inicializar varias a la vez separadas por comas (,)
-- Dura mientras la sesión esté activa. Cuando se cierra desaparece
-- Hay 5 tipos de datos que se pueden asignar: VARCHAR (o CHAR), INT, DECIMAL, FLOAT y NULL (que no se asoscia a ningún tipo)

-- Ejemplo de uso
SET @nombre_variable1 = valor, @nombre_variable2 = valor;

-- ----- Variables locales ----- --
-- NO necesitan el prefijo @
-- Deben ser declaradas antes de ser usadas
-- Para declararla se usa la declaración DECLARE o usarla como Parámetro dentro de un SP o FUNCION
-- Si no se asigna ningín valor se inicializa en NULL
-- Viven dentro de BEGIN ... END

-- Ejemplo de uso 
DELIMITER $$
CREATE FUNCTION agregar_IVA(precio_sin_impuestos DOUBLE(10,12))
RETURNS DOUBLE(10,12) DETERMINISTIC
BEGIN
	DECLARE IVA INT DEFAULT 21;
    RETURN ((precio_sin_impuestos * IVA)/100) + precio_sin_impuestos;
END $$

-- ----- Variables del sistema ----- --
-- Identificadas por el símbolo @ usado como prefijo o las palabras SESSION o GLOBAL en la sentencia SET
-- Otra forma de diferenciarlas es usando como segundo prefijo global o session

-- Ejemplo de asignacion de valores
-- Session
SET interactive_timeout = 30000;
SET SESSION interactive_timeout = 30000;
SET @@interactive_timeout = 30000;
SET @@local.interactive_timeout = 30000;

-- Global
SET @@global.interactive_timeout = 30000;
SET GLOBAL interactive_timeout = 30000;

-- Para visaulizar las variables en uso dentro de una sesión o un servidor se utiliza una sentencia y se pueden añadir los operadores que se usan en el WHERE para filtrar esta lista, si queremos obtener el valor de algunas variables específicas
SHOW VARIABLES LIKE '%timeout%';

################################################### Condicionales ###################################################

######################## Condicional IF ########################

-- Implementacion para el control de flujo de un SP
CREATE PROCEDURE condicionales(tabla VARCHAR(50))
BEGIN
	IF (tabla = 'empleados') THEN
		SELECT fecha_nacimiento FROM empleados;
	ELSEIF (tabla = 'clientes') THEN
		SELECT fecha_nacimiento FROM clientes;
	ELSE 
		SELECT fecha_nacimiento FROM proveedores;
	END IF;
END;

-- Implemetancion como funcion utilizada en una query
SELECT IF(fecha_nacimiento IS NULL, 'Sin datos', fecha_nacimiento) AS fecha_nac FROM empleados;

######################## Condicional CASE ########################

-- Implementacion para el control de flujo de un SP
CREATE PROCEDURE condicionales2(tabla VARCHAR(50))
BEGIN
	CASE WHEN (tabla = 'empleados') THEN
		SELECT fecha_nacimiento FROM empleados;
	WHEN (tabla = 'clientes') THEN
		SELECT fecha_nacimiento FROM clientes;
	ELSE
		SELECT fecha_nacimiento FROM proveedores;
	END CASE;
END;

-- Implemetancion utilizada en una query. Recordemos que con el CASE, se pueden seguir agregando condiciones a evaluar entre el primer CASE WHEN y el ELSE
SELECT (CASE WHEN fecha_nacimiento IS NULL THEN 'Sin datos' ELSE fecha_nacimiento END) AS fecha_nac FROM empleados;

######################## Condicional IF anidados ########################

-- Implementacion para el control de flujo de un SP
CREATE PROCEDURE condicionales3(tabla VARCHAR(50), campo VARCHAR(50))
BEGIN
	IF (tabla = 'empleados') THEN
		IF (campo = 'todos') THEN
			SELECT * FROM empleados;
		END IF;
    END IF;
END;

-- Implemetancion como funcion utilizada en una query
SELECT IF(fecha_nacimiento IS NULL, 'Sin datos', IF(YEAR(fecha_nacimiento) < 1850, 'Error', fecha_nacimiento)) AS fecha_nac FROM empleados;

###################################################################################################################
################################################### Repetitivas ###################################################

######################## WHILE ########################

-- Ejemplo de uso
DELIMITE $$
CREATE PROCEDURE contar_compositores (IN compositor VARCHAR(255), OUT cantidad INT)
				-- Creamos un SP del que recibimos un parámetro de entrada de compositor que puede tener 0, 1 o muchos compositores 
                -- separados por “,”. Y el mismo SP, debe devolver la cantidad de compositores que tiene.
BEGIN
	IF compositor IS NULL OR compositor = '' THEN
				-- Verificamos que el campo compositor tenga al menos 1 compositor, caso contrario, le ponemos un 0 a la cantidad.
		SET cantidad = 0;
	ELSE 
		SET cantidad = 1;
	END IF;
    WHILE (LOCATE(',', compositor) != 0) DO
				-- En este caso, vamos a recorrer el campo compositor que recibimos por parámetro, mientras se encuentre al menos 1 coma (“,”) en el texto.
                -- while -> Es un bucle que hace que una parte del código se repita mientras se dé una condición. Si la condición no se cumple antes de 
                -- entrar al bucle, no entra ni una sola vez.
		SET cantidad = cantidad + 1;
				-- Cada vez que se entra en la condición, significa que tenemos al menos un compositor, entonces sumamos 1 a la la variable de cantidad.
	SET compositor = RIGHT(compositor, CHAR_LENGT(compositor) - LOCATE(',', compositor));
				-- Ahora, luego de sumar 1 a la cantidad, debemos recortar el texto del compositor, quitando el texto hasta la siguiente coma o hasta el final del texto.
    END WHILE;
END $$

######################## REPEAT ########################

-- Ejemplo de uso
DELIMITER $$
CREATE PROCEDURE dos_numeros_aleatorios (OUT valor1 INT, OUT valor2 INT)
				-- Creamos un SP que debe devolver dos números aleatorios del 0 al 10, pero sin que se repitan entre ellos
BEGIN
	REPEAT
				-- Es un bucle que hace que una parte del código se repita mientras se dé una condición. La diferencia con el WHILE, es que el REPEAT 
                -- siempre se ejecuta al menos una vez.
		SET valor1 = RAND() * 10;
				-- De esta forma es como generamos los números random entre 0 y 10.
		SET valor2 = RAND() * 10;
				-- Hacemos lo mismo que la línea anterior, pero para el valor 2.
	UNTIL valor1 != valor2
				-- Si los números generados para valor1 y valor2 son diferentes, pasa a la instrucción END REPEAT y termina el bucle. Si son iguales, 
                -- se va a recorrer nuevamente lo que se encuentra dentro del REPEAT, hasta que los valores sean diferentes
	END REPEAT;
END $$

######################## LOOP ########################

-- Ejemplo de uso
DELIMITER $$
CREATE PROCEDURE contrasenia_aleatoria (IN cantidad_caracteres INT, OUT contrasenia VARCHAR(100))
				-- Creamos un SP que recibe un parámetro de entrada con la cantidad de caracteres que queremos para la password y recibimos 
                -- un parámetro de salida con la contraseña aleatoria.
BEGIN
	SET contrasenia = '';
loop_simple: LOOP
				-- Este tipo de estructura repetitiva encierra un bloque de instrucciones entre los comandos 'loop' y 'end loop'. Para finalizar 
                -- el bloque, debemos ejecutar el comando 'leave' e indicar una etiqueta definida previa al comando 'loop'. En este caso, a la 
                -- etiqueta le pusimos el nombre de “loop_simple”, pero se puede cambiar el nombre al que mas les guste.
	SET contrasenia = CONCAT(contrasenia, LEFT(MD5(RAND()), 1));
				-- De esta forma es como generamos un caracter alfanumérico en forma aleatoria y se lo concatenamos a la variable “contrasenia”.
	IF (CHAR_LENGTH(contrasenia) = cantidad_caracteres) THEN
				-- En este momento es donde le ponemos la condición de salida al bucle. Para este ejemplo, si la cantidad de caracteres de la 
                -- variable “contrasenia” es igual al valor recibido por parámetro, salimos del bucle.
		LEAVE loop_simple;
				-- Sintaxis para salir del bucle. Recordemos que debemos utilizar el nombre de la etiqueta que le asignamos al loop cuando declaramos su inicio.
	END IF;
 END LOOP;
END $$

################################################################################################################
################################################# Cursores ##################################################### (+info línea 318)

-- Aclaración -> hay 2 sentencias que agregar a los cursores:
--  # Un LOOP para recorrer los registros de un SELECT
--  # Un HANDLER para cuando nos quedamos sin registros por recorrer en el SELECT

-- 1 -> DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
-- 2 -> Abrir el LOOP
-- 3 -> IF finished = 1 THEN LEAVE recorre; END IF;
-- 4 -> Cerrar el LOOP

-- Cuando usarlos? --> Un ejemplo sería: tenemos un registro de personas y en ellas existe la posibilidad de que algunas tengan deudas a nuestro banco. La idea es identificar todas aquellas personas que tengan deudas y notificarlas por correo electrónico. Todos los días, debemos obtener a todas las personas que cumplan con la condición y por cada una de ellas debemos insertarla en la tabla NotificarDeuda re-usando un procedimiento almacenado que inserta los datos en esa tabla.  Se llamará al procedimiento por cada persona que tenga deudas. Siempre utilizaremos un  r cuando queramos procesar individualmente cada afiladora consulta.

-- Ventajas --
		-- Procesamiento fila por fila.
		-- Pueden ser más rápidos que la sentencia While pero tiene más costo de procesamiento.
-- Desventajas --
		-- El cursor en SQL es un área de trabajo temporal creada en la memoria del servidor, por lo que consume recursos.

#############################################################################################################
############################################# Tablas temporales #############################################

-- Definición -> Una tabla temporal es un tipo de tabla que nos permite guardar resultados de forma temporal. Estas tablas tienen un tiempo de vida, no se guardan los datos en nuestra base de datos, sino que es temporal, por lo tanto cuando cerremos nuestra sesión, la tabla automáticamente se borrará.

-- Sintáxis --
CREATE TEMPORARY TABLE  nombreTabla (nombre_columna VARCHAR(50));

-- Las opraciones que se pueden utilizar son: DROP, SELECT, INSERT y UPDATE

-- Ejemplo -> si no sabemos los campos y el tipo de campo para crear la tabla podemos:
CREATE TEMPORARY TABLE nombreTabla 
SELECT now() as fecha, 1 as número;
	-- De esta forma creamos una tabla temporal con los campos fecha y número dinámicamente

-- Ejemplo de uso I
CREATE TEMPORARY TABLE t_Cliente (id INT, nombre VARCHAR(50), apellido VARCHAR(50));

-- Ejemplo de uso II
CREATE TEMPORARY TABLE t_Cliente 
SELECT DISTINCT c.id, c.nombre
FROM Cliente c;
INNER JOIN factura f ON c.id = f.id_Cliente;

SELECT tc.nombre, COUNT(tc.id)
FROM t_Cliente tc;
GROUP BY tc.nombre;

### Sentencias de Cursores y Tablas Temporales ###
DELIMITER $$
CREATE PROCEDURE usp_cursor_tablaTemporal()
BEGIN
DECLARE empleadoId ,managerID INT default 0;
DECLARE genero ,estado_civil varchar(1) default '';
DECLARE titulo ,national_number varchar(50) default '';
DECLARE cur1 CURSOR FOR
 SELECT * FROM temp_empleado;
CREATE TEMPORARY TABLE IF NOT EXISTS temp_empleado
 SELECT 
    e.EmployeeID AS 'EmpleadoId'
   ,e.ManagerId AS 'ManagerId'
   ,e.Gender AS 'Genero'
   ,e.MaritalStatus AS 'EstadoCivil'
   ,e.Title AS 'Titulo' 
   ,e.NationalIdNumber AS 'NationalIdNumber'
  FROM employee e
        LIMIT 10;
OPEN cur1;
	empleados: LOOP
	FETCH cur1 INTO empleadoId, managerID, genero, estado_civil, titulo, national_number; 
	   CALL usp_contacto_Insertar(empleadoId, managerID, genero, estado_civil, titulo, national_number);
	END LOOP ;
CLOSE cur1;
END; $$







