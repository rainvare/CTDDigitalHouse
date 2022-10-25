
USE dhtube;

# 1. Listar todos los países que contengan la letra A, ordenada alfabéticamente.
SELECT * FROM pais
WHERE nombre LIKE "%a%"
ORDER BY nombre;

# 2. Generar un listado de los usuarios, con el detalle de todos sus datos, el avatar que poseen y a qué país pertenecen.
SELECT usuario.*, avatar.nombre AS nombreAvatar, pais.nombre nombrePais 
FROM usuario
LEFT JOIN avatar ON usuario.Avatar_idAvatar =  avatar.idAvatar
LEFT JOIN pais ON usuario.Pais_idPais = pais.idPais;

# 3. Confeccionar un listado con los usuarios que tienen playlists, mostrando la cantidad que poseen.
SELECT usuario.nombre, COUNT(*) AS cantidadPlayList 
FROM usuario
INNER JOIN playlist ON usuario.idUsuario = playlist.Usuario_idUsuario
GROUP BY usuario.nombre;


# 4. Mostrar todos los canales creados entre el 01/04/2021 y el 01/06/2021.
SELECT * FROM canal
WHERE fechaCreacion BETWEEN "2021-04-01" AND "2021-06-01";


# 5. Mostrar los 5 videos de menor duración, listando el título del vídeo, la o las etiquetas que poseen, el nombre de usuario y país al que corresponden.

SELECT video.titulo, usuario.nombre nombreUsuario, pais.nombre nombrePais , GROUP_CONCAT(DISTINCT etiqueta.nombre) etiquetas
FROM video
INNER JOIN video_etiqueta ON video.idVideo = video_etiqueta.Video_idVideo
INNER JOIN etiqueta ON video_etiqueta.Etiqueta_idEtiqueta = etiqueta.idEtiqueta
INNER JOIN usuario ON video.Usuario_idUsuario = usuario.idUsuario
INNER JOIN pais ON usuario.Pais_idPais = pais.idPais
GROUP BY video.titulo,usuario.nombre, pais.nombre 
ORDER BY video.duracion 
LIMIT 5;

# 6. Listar todas las playlists que posean menos de 3 videos, mostrando el nombre de usuario y el avatar que poseen.
SELECT playlist.nombre, usuario.nombre nombreUsuario, avatar.nombre nombreAvatar , COUNT(playlist_video.Video_idVideo) cantVideos
FROM playlist
INNER JOIN playlist_video ON playlist.idPlaylist = playlist_video.Playlist_idPlaylist
INNER JOIN usuario ON playlist.Usuario_idUsuario = usuario.idUsuario
INNER JOIN avatar ON usuario.Avatar_idAvatar = avatar.idAvatar 
GROUP BY playlist.nombre,  usuario.nombre, avatar.nombre  
HAVING cantVideos < 3;

# 7. Insertar un nuevo avatar y asignarlo a un usuario.
INSERT INTO avatar (nombre, urlImagen) VALUES 
('Losilo the best', 'https://www.google.com/search?q=Finn+star+wars');
SELECT * FROM avatar;
INSERT INTO usuario (nombre, email, password, fechaNacimiento, codigoPostal, Pais_idPais, Avatar_idAvatar) VALUES
("JAIRO FINN", "JAIRITO@gmail.com", "jairo12345", NOW(), 201404, 40, 87);

SELECT * FROM usuario;

# 8. Generar un informe estilo ranking de avatares utilizados por país.
SELECT avatar.nombre nombreAvatar , pais.nombre nombrePais,  COUNT(usuario.Avatar_idAvatar) cantAvatares 
FROM pais
INNER JOIN usuario ON usuario.Pais_idPais = pais.idPais
INNER JOIN avatar ON avatar.idAvatar = usuario.Avatar_idAvatar
GROUP BY avatar.nombre, pais.nombre 
ORDER BY pais.nombre, cantAvatares DESC;

# 9. Insertar un usuario con los siguientes datos:
#a. Nombre: Roberto Rodriguez
#b. E-mail: rrodriguez@dhtube.com
#c. Password: rr1254
#d. Fecha de nacimiento: 01 de noviembre de 1975
#e. Código postal: 1429
#f. País: Argentina
#g. Avatar: carita feliz
INSERT INTO usuario (nombre, email, password, fechaNacimiento, codigoPostal, Pais_idPais, Avatar_idAvatar) VALUES
("Roberto Rodriguez", "rrodriguez@dhtube.com", "rr1254", "1975-11-01", 1429, 9, 85);
SELECT * FROM usuario;

# 10. Generar un reporte de todos los videos y sus etiquetas, pero solo de aquellos cuyos 
#nombres de la etiqueta contengan menos de 10 caracteres, ordenado
#ascendentemente por la cantidad de caracteres que posea la etiqueta

SELECT video.* 
FROM video 
INNER JOIN video_etiqueta ON video.idVideo = video_etiqueta.Video_idVideo
INNER JOIN etiqueta ON video_etiqueta.Etiqueta_idEtiqueta = etiqueta.idEtiqueta
WHERE length(etiqueta.nombre) < 10
ORDER BY length(etiqueta.nombre) ASC;

