-- 1. Listar las canciones cuya duracion sea mayor a 2 minutos
select nombre, milisegundos/120000 as minutos
from canciones where milisegundos > 120000;

-- 2. Listar las canciones cuyo nombre comience con una vocal
select * from canciones where left(nombre,1) IN ('A', 'E','I','O','U');
-- otra forma 
select * from canciones 
where nombre like 'A%'
OR nombre like 'E%'
OR nombre like 'I%'
OR nombre like 'O%'
OR nombre like 'U%'
;

-- 3. Listar las canciones ordenadas por compositor en forma descendente, y luego por nombre en forma ascendente.
-- Incluir únicamente aquellas canciones que tengan compositor.
select * from canciones 
where coalesce(compositor,'') <>''
order by compositor desc, nombre asc;

-- 4. a) Listar la cantidad de canciones de cada compositor.
select compositor, count(*) as cantidad
from canciones 
where coalesce(compositor,'') <>''
group by compositor;

-- 4. b) Modificar la consulta para incluir únicamente los compositores que tengan más de 10 canciones.
select compositor, count(*) as cantidad
from canciones 
where coalesce(compositor,'') <>''
group by compositor
having count(*) > 10;

-- 5. a) Listar el total facturado agrupado por ciudad.
select ciudad_de_facturacion, sum(total)
from facturas
group by ciudad_de_facturacion
order by ciudad_de_facturacion;

-- 5. b) Modificar el listado del punto (a) mostrando únicamente las ciudades de Canadá.
select ciudad_de_facturacion, sum(total)
from facturas
where pais_de_facturacion = 'Canada'
group by ciudad_de_facturacion
order by ciudad_de_facturacion;

-- 5. c) Modificar el listado del punto (a) mostrando únicamente las ciudades con una facturación mayor a 38.
select ciudad_de_facturacion, sum(total)
from facturas
group by ciudad_de_facturacion
having sum(total)>38
order by ciudad_de_facturacion;

-- 5. d) Modificar el listado del punto (a) agrupando la facturación por país, y luego por ciudad.
select pais_de_facturacion, ciudad_de_facturacion, sum(total)
from facturas
group by pais_de_facturacion, ciudad_de_facturacion
order by pais_de_facturacion, ciudad_de_facturacion;

-- 6. a) Listar el bonus mínimo, el máximo y el promedio de los empleados.
select min(bonus) as minimo,
       max(bonus) as maximo,
       avg(bonus) as promedio
from empleados;

-- 6. b) Modificar el punto (a) mostrando la información agrupada por título.

select titulo,
       min(bonus) as minimo,
       max(bonus) as maximo,
       avg(bonus) as promedio
from empleados
group by titulo;

