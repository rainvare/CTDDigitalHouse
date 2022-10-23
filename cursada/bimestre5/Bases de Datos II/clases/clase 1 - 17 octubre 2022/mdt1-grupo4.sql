-- MDT 1 
-- Q1
Select * from usuario where codigoPostal = 1001 limit 5;
-- Q2
Select * from video where Usuario_idUsuario = 3 ;
-- Q3
Select * from video where titulo like 's%';
-- Q4
Select * from playlist where privado = 1;
-- Q5
Select video.idVideo, idReaccion, video.titulo, tiporeaccion.nombre from reaccion 
inner join video on reaccion.idReaccion = video.idVideo
inner join tiporeaccion on reaccion.TipoReaccion_idTipoReaccion = tiporeaccion.idTipoReaccion
where idReaccion = 2;

