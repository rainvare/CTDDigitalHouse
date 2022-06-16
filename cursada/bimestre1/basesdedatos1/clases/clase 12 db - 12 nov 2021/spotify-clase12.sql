-- 1
SELECT * FROM cancion
WHERE titulo LIKE "%z%";
-- 2
SELECT * FROM cancion
WHERE titulo LIKE "_a%s";
-- 3
SELECT titulo Título, cantcanciones "Cantidad Canciones"
FROM playlist
ORDER BY cantcanciones DESC
LIMIT 1;
-- 4
SELECT nombreusuario, fecha_nac
FROM usuario
Order by fecha_nac DESC
LIMIT 10;
-- 5
SELECT titulo, cantreproduccion
FROM cancion
Order by cantreproduccion DESC
LIMIT 5;
-- 6
SELECT *
FROM album
Order by titulo;
-- 7
SELECT titulo, imagenportada
FROM album
WHERE imagenportada is null
Order by titulo;
-- 8
INSERT INTO usuario
VALUES (11111,"EGOMEZ", "Elmer Gomez", "1991-11-15", "M", "B4129ATF", "S4321m", 2, 3, NULL);
-- 9
DELETE FROM generoxcancion WHERE IdGenero = 9;
-- 10
UPDATE spotify.artista SET imagen = "imagen faltante" WHERE imagen = null;


