-- 1. Listar las canciones cuya duración sea mayor a 2 minutos.
Select canciones.nombre, canciones.milisegundos from canciones
where canciones.milisegundos > 120000;

-- 2. Listar las canciones cuyo nombre comience con una vocal.
Select canciones.nombre from canciones 
where canciones.nombre like "a%" or canciones.nombre like "e%" or canciones.nombre like"i%" or canciones.nombre like"o%" or canciones.nombre like "u%"
order by canciones.nombre;

-- 3. Listar las canciones ordenadas por compositor en forma descendente. Luego, por nombre en forma ascendente. Incluir únicamente aquellas
-- canciones que tengan compositor.
Select canciones.nombre, canciones.compositor from canciones
WHERE canciones.compositor IS NOT NULL OR canciones.compositor != ""
order by canciones.compositor desc;

-- 4. a) Listar la cantidad de canciones de cada compositor.
Select count(canciones.nombre), canciones.compositor from canciones
Group by canciones.compositor;

-- b) Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones.
Select count(canciones.nombre), canciones.compositor from canciones
Group by canciones.compositor
HAVING COUNT(canciones.nombre) > 10;

-- 5. a) Listar el total facturado agrupado por ciudad.
Select sum(facturas.total), ciudad_de_facturacion from facturas
group by ciudad_de_facturacion;

-- b) Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.
Select sum(facturas.total), facturas.ciudad_de_facturacion from facturas
where pais_de_facturacion ="Canada"
group by ciudad_de_facturacion;

-- c) Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.
Select sum(facturas.total), ciudad_de_facturacion from facturas
group by ciudad_de_facturacion
HAVING SUM(facturas.total) > 38;

-- d) Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.
Select sum(facturas.total), pais_de_facturacion, ciudad_de_facturacion from facturas
group by pais_de_facturacion, ciudad_de_facturacion;

-- 6. a) Listar la duración mínima, máxima y promedio de las canciones.
SELECT MIN(milisegundos) AS 'Duración Mínima', MAX(milisegundos) AS 'Duración Máxima', AVG(milisegundos) AS 'Promedio' FROM canciones;

-- b) Modificar el punto (a) mostrando la información agrupada por género.
SELECT id_genero, generos.nombre, MIN(milisegundos) AS 'Duración Mínima', MAX(milisegundos) AS 'Duración Máxima', AVG(milisegundos) AS 'Promedio' FROM canciones
INNER JOIN generos ON generos.id = canciones.id_genero
group by generos.nombre;