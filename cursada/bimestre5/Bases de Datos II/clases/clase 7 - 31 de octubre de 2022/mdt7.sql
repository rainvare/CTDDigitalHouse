-- En una base de datos cualquiera, debemos confeccionar un store procedure que le enviemos un entero comprendido entre 0 y 999 inclusive.
-- El segundo parámetro debe retornar la cantidad de dígitos que tiene dicho número. Debemos utilizar la sentencia IF.
DELIMITER $$
CREATE PROCEDURE sp_random(IN valor INT, OUT digitos INT)
BEGIN
	IF (valor < 10) THEN
		SET digitos = 1;
	ELSEIF (valor < 100) THEN
		SET digitos = 2;
	ELSE
		SET digitos = 3;
	END IF;
END $$

CALL sp_random(5,@result1);
CALL sp_random(321,@result2);
CALL sp_random(66,@result3);
SELECT @result1, @result2, @result3;


-- En la base de datos Musimundos, vamos a generar un SP donde le vamos a pasar por parametro diferentes nombres de generos en un varchar separados por |.
-- Importante: al final siempre poner un |. Un ejemplo, 'Trap|Reggaeton|House|'. Luego, debemos insertar cada uno de ellos en nuestra tabla de generos.
-- Utilizar la sentencia WHILE. Tener en cuenta que para insertar el id, debemos ir a buscar el último número de id de la tabla de generos.
DELIMITER $$
CREATE PROCEDURE insertar_generos (IN nombres VARCHAR(100))
BEGIN
	DECLARE ultimo_id INT DEFAULT (SELECT id FROM generos ORDER BY id DESC LIMIT 1);
	WHILE (LOCATE('|', nombres) != 0) DO
		SET ultimo_id = ultimo_id + 1;
		INSERT INTO generos (id, nombre) VALUES (ultimo_id, LEFT(nombres, LOCATE('|', nombres) - 1));
		SET nombres = RIGHT(nombres, CHAR_LENGTH(nombres) - LOCATE('|', nombres));
    END WHILE;
END $$

CALL insertar_generos('Trap|Reggaeton|House|');
SELECT * FROM generos ORDER BY id DESC LIMIT 5;