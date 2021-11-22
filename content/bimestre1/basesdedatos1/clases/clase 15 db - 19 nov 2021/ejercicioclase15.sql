-- 1. Listar las canciones cuya duración sea mayor a 2 minutos.
Select canciones.nombre, canciones.milisegundos from canciones
where canciones.milisegundos > 120000;
-- 1000 row

-- 2. Listar las canciones cuyo nombre comience con una vocal.
Select canciones.nombre from canciones 
where canciones.nombre like "a%" or canciones.nombre like "e%" or canciones.nombre like"i%" or  canciones.nombre like"o%" or  canciones.nombre like"u%"
order by canciones.nombre asc;
-- 250 row

-- 3. Listar las canciones ordenadas por compositor en forma descendente.
Select canciones.nombre, canciones.compositor from canciones
order by canciones.compositor desc;

/*Luego, por nombre en forma ascendente. Incluir únicamente aquellas
canciones que tengan compositor.*/-- 1000 row
Select canciones.nombre, canciones.compositor from canciones
Where canciones.compositor is not null and canciones.compositor != ""
order by canciones.compositor asc;
-- 1000 row

-- 4. a) Listar la cantidad de canciones de cada compositor.
Select count(canciones.nombre), canciones.compositor from canciones
Group by canciones.compositor;
-- 852 row

-- b) Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones.
Select count(canciones.nombre), canciones.compositor from canciones
Group by canciones.compositor
having   count(canciones.nombre) >10;
-- 56 row

-- 5. a) Listar el total facturado agrupado por ciudad.
Select sum(facturas.total), ciudad_de_facturacion from facturas
group by ciudad_de_facturacion;
-- 53

-- b) Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.
Select sum(facturas.total), facturas.ciudad_de_facturacion from facturas
where pais_de_facturacion ="Canada"
group by ciudad_de_facturacion;

-- 56 row 

-- c) Modificar el listado del punto (a) mostrando únicamente las ciudades 
Select sum(facturas.total), facturas.ciudad_de_facturacion from facturas
group by ciudad_de_facturacion

-- con una facturación mayor a 38.
Select sum(facturas.total), facturas.ciudad_de_facturacion from facturas
group by ciudad_de_facturacion
having sum(facturas.total) >38;

-- d) Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.
Select sum(facturas.total), facturas.ciudad_de_facturacion, facturas.ciudad_de_facturacion from facturas
group by pais_de_facturacion, facturas.ciudad_de_facturacion;


-- 6. a) Listar la duración mínima, máxima y promedio de las canciones.
Select min(canciones.milisegundos) from canciones;
Select max(canciones.milisegundos) from canciones;
Select avg(canciones.milisegundos) from canciones;
-- b) Modificar el punto (a) mostrando la información agrupada por género.
Select min(canciones.milisegundos), id_genero, generos.nombre from canciones
inner join generos on generos.id = canciones.id_genero
group by generos.nombre;
Select max(canciones.milisegundos), id_genero from canciones;
Select avg(canciones.milisegundos), id_genero from canciones;