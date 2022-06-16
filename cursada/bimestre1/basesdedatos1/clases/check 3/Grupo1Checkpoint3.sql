-- 1
SELECT pais.nombre, count(usuario.idUsuario) AS cantidad_usuario FROM usuario
JOIN pais ON usuario.pais_idpais = pais.idPais
GROUP BY usuario.pais_idpais;

-- 2
SELECT avatar.nombre, count(usuario.avatar_idavatar) AS cantidad 
FROM avatar
INNER JOIN usuario ON avatar.idavatar = usuario.avatar_idavatar
GROUP BY usuario.avatar_idavatar
ORDER BY cantidad DESC
LIMIT 5;

-- 3
SELECT playlist.idPlaylist AS ID, playlist.privado, usuario.nombre AS UsuarioCreador, video.titulo AS Videos,
 playlist.nombre AS Playlist, playlist.fechaCreacion AS "Fecha de creacion" 
FROM usuario
INNER JOIN playlist ON usuario.idUsuario = Usuario_idUsuario
INNER JOIN playlist_video ON idPlaylist = Playlist_idPlaylist
INNER JOIN video ON Video_idVideo = idVideo
WHERE playlist.privado = 0;

 -- 4 
SELECT etiqueta.nombre, COUNT(video_etiqueta.Etiqueta_idEtiqueta) AS cantidad_usadas
FROM video_etiqueta
JOIN etiqueta ON etiqueta.idetiqueta = video_etiqueta.etiqueta_idetiqueta
GROUP BY etiqueta.nombre
ORDER BY cantidad_usadas
LIMIT 10;

-- 5
SELECT idReaccion, fecha, tiporeaccion.nombre, usuario.idUsuario, usuario.nombre, titulo
FROM reaccion
INNER JOIN tiporeaccion ON reaccion.TipoReaccion_idTipoReaccion = tiporeaccion.idTipoReaccion
INNER JOIN usuario ON usuario.idUsuario = reaccion.Usuario_idUsuario
INNER JOIN video ON reaccion.Video_idVideo = video.idVideo
ORDER BY fecha DESC
LIMIT 10;

-- 6
SELECT * FROM playlist
WHERE YEAR(fechaCreacion) >= 2021
ORDER BY fechaCreacion ASC;

-- 7 
SELECT tiporeaccion.nombre AS 'Nombre de Reaccion', usuario.nombre AS 'Nombre de Usuario', 
video.titulo AS 'Titulo de Video', reaccion.fecha AS 'Fecha'
FROM video
INNER JOIN usuario ON video.Usuario_idUsuario = usuario.idUsuario
INNER JOIN reaccion ON usuario.idUsuario = reaccion.Usuario_idUsuario
INNER JOIN tiporeaccion ON reaccion.TipoReaccion_idTipoReaccion = tiporeaccion.idTipoReaccion
WHERE YEAR(fecha) >= 2021
ORDER BY fecha ASC;

-- 8 
SELECT COUNT(*) AS 'Cantidad de Videos',
CASE 
WHEN privado = 1 THEN 'Privado'
WHEN privado = 0 THEN 'Publico'
END AS Visibilidad
FROM video
GROUP BY privado;

-- 9 
SELECT usuario.nombre, playlist.idplaylist
FROM usuario 
LEFT JOIN playlist  ON usuario.idUsuario = playlist.Usuario_idUsuario
WHERE playlist.Usuario_idUsuario IS NULL;

-- 10
SELECT v.*,
COUNT(r.idReaccion) AS Cantidad_Reacciones,
CASE 
WHEN LENGTH(v.cantidadReproducciones) > 0 THEN 'Si'
ELSE 'No'
END AS Reproducido
FROM video v
LEFT JOIN reaccion r ON r.video_idvideo = v.idvideo
WHERE MONTH(r.fecha) = 05
GROUP BY v.idVideo
ORDER BY v.titulo;

-- 11
SELECT usuario.nombre AS 'Nombre de Usuario' , video.titulo AS 'Titulo video'
FROM usuario
INNER JOIN video  ON video.Usuario_idUsuario = usuario.idUsuario
LEFT JOIN playlist_video ON video.idVideo = playlist_video.video_idVideo
WHERE Playlist_idPlaylist IS NULL;

-- 12
SELECT usuario.nombre, video.idVideo
FROM usuario
LEFT JOIN video ON usuario.idUsuario = video.Usuario_idUsuario
WHERE video.idVideo IS NULL;

-- 13
SELECT TipoReaccion_idTipoReaccion, COUNT(idReaccion) FROM reaccion
WHERE reaccion.fecha BETWEEN "2021-01-01" AND "2021-04-01"
GROUP BY TipoReaccion_idTipoReaccion;

-- 14
SELECT usuario.nombre, video.titulo, pais.nombre
FROM usuario 
INNER JOIN video ON idUsuario = video.Usuario_idUsuario
INNER JOIN pais ON pais_idpais = pais.idpais
WHERE usuario.nombre LIKE "%a%" AND pais.nombre = "Argentina";

-- 15 
SELECT avatar.nombre AS Avatar, pais.nombre AS Nacionalidad, COUNT(Pais_idPais) AS CantidadPorPais
FROM avatar
INNER JOIN usuario ON avatar.idAvatar =  usuario.Avatar_idAvatar
INNER JOIN pais ON usuario.Pais_idPais = pais.idPais
GROUP BY pais.nombre, avatar.nombre
ORDER BY count(Pais_idPais) DESC;

-- 16
SELECT video.Usuario_idUsuario AS id, video.titulo as título,  video.cantidadReproducciones AS reproducciones
FROM video
JOIN reaccion ON video.idVideo = reaccion.video_idvideo
WHERE reaccion.video_idvideo IS NOT NULL;

-- 17
SELECT video.titulo as Video,  video.duracion AS duración , usuario.nombre as Usuario, pais.nombre as País
FROM video 
INNER JOIN usuario  ON usuario.idUsuario = video.Usuario_idUsuario
INNER JOIN pais ON pais.idPais = usuario.Pais_idPais
ORDER BY duracion ASC;

-- 18
SELECT u.idUsuario, u.nombre, u.email,
COUNT(r.usuario_idusuario) AS Reacciones
FROM usuario u 
JOIN pais p ON u.pais_idPais = p.idPais
INNER JOIN reaccion r
ON u.idUsuario = r.Usuario_idUsuario
WHERE p.nombre = "Brasil"
ORDER BY reacciones
LIMIT 1;

-- 19
SELECT usuario.nombre as Usuario , canal.nombre as canal, playlist.nombre as playlist , video.titulo as video
FROM usuario
INNER JOIN canal ON usuario.idUsuario = canal.Usuario_idUsuario
INNER JOIN playlist ON playlist.Usuario_idUsuario = usuario.idUsuario
INNER JOIN playlist_video ON playlist_video.Playlist_idPlaylist = playlist.idPlaylist
INNER JOIN video ON playlist_video.Video_idVideo = video.idVideo;

-- 20
SELECT COUNT(playlist_video.Video_idVideo) AS Cantidad_videos, playlist.nombre, avatar.nombre FROM playlist
INNER JOIN usuario ON usuario.idUsuario = playlist.Usuario_idUsuario
INNER JOIN avatar ON avatar.idAvatar = usuario.Avatar_idAvatar
INNER JOIN playlist_video ON playlist.idPlaylist = playlist_video.Playlist_idPlaylist
INNER JOIN video ON playlist_video.Video_idVideo = video.idVideo
GROUP BY playlist.idPlaylist
HAVING COUNT(playlist_video.Video_idVideo) < 3;
