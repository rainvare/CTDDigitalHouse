/* 1*/
SELECT titulo FROM cancion
WHERE titulo LIKE "%z%"

/*2*/
SELECT titulo FROM cancion
WHERE titulo LIKE "_a%s"


/*3*/
SELECT titulo, cantcanciones FROM playlist
ORDER BY cantcanciones

ALTER TABLE playlist 
RENAME COLUMN idPlaylist to IdPlaylist

ALTER TABLE playlist
RENAME COLUMN idusuario to IdUsuario

ALTER TABLE playlist
RENAME COLUMN titulo to Título

ALTER TABLE playlist
RENAME COLUMN cantcanciones to CantCanciones

ALTER TABLE playlist
RENAME COLUMN idestado to IdEstado

ALTER TABLE playlist
RENAME COLUMN Fechacreacion to FechaCreación

ALTER TABLE playlist
RENAME COLUMN Fechaeliminada to FechaEliminada

/*4*/
SELECT nombreusuario, fecha_nac FROM usuario
ORDER BY fecha_nac DESC
LIMIT 10
OFFSET 6

/*5*/
SELECT titulo FROM cancion
ORDER BY cantreproduccion DESC


/*6*/
SELECT titulo FROM album
ORDER BY titulo ASC

/*7*/
SELECT titulo FROM album
WHERE  imagenportada = NULL
ORDER BY titulo ASC

/*8*/
INSERT INTO usuario
VALUES (11111,"EGOMEZ", "Elmer Gomez", "1991-11-15", "M", "B4129ATF", "S4321m", 2, 3, NULL)

/*9*/
DELETE FROM generoxcancion 
WHERE IdGenero = 9

/*10*/
UPDATE spotify.artista SET imagen = "imagen faltante" WHERE imagen=null












