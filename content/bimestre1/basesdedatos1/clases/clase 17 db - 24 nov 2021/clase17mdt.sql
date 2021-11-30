-- VISTAS PARTE I
-- CLIENTES
-- 1. Crear una vista con los siguientes datos de los clientes: Id, contacto, y el Fax. En
-- caso que no tenga Fax, colocar el teléfono y en este caso aclararlo. Por ejemplo 'TEL: (01) 123-4567'

create view vista_fax as
select ClienteID, contacto, 
case
	when fax <> "" then fax
    else concat("TEL: ", telefono)
end as fax
from clientes;

-- 2. Se necesita listar los números de teléfono de los clientes que no tengan fax.
-- Hacerlo de dos formas distintas:
-- a. Consultando la tabla de clientes
select * from vista_fax
where fax like "tel%";

-- b. Consultando la vista de clientes
select ClienteID, contacto, telefono from clientes
where fax = "";

-- Proveedores
/* 1. Crear una vista con los siguientes datos de los proveedores: Id, contacto,
compañia y la dirección. Para la dirección tomar la dirección, ciudad, código
postal y país.*/
create view datos_proveedores as
select ProveedorID, Contacto, Compania, concat(direccion, " ",ciudad," ", codigopostal, " ", pais) as direccion  
from proveedores;

select * from datos_proveedores;

/* 2. Listar los proveedores que vivan la calle Americanas en Brazil. Hacerlo de dos
formas distintas:*/
-- a. Consultando la tabla de proveedores
select * from datos_proveedores
where direccion like "%americanas%brazil%";

-- b. Consultando la vista de proveedores
select * from proveedores
where direccion like "%americanas%" and pais = "brazil";

-- VISTAS - Parte II
/*1. Crear una vista de productos que se usará para control de stock. Incluir el id y
nombre del producto, el precio unitario redondeado sin decimales, las unidades
en stock y las unidades pedidas. Incluir además una nueva columna PRIORIDAD
con los siguientes valores:
BAJA si unidades pedidas es cero
MEDIA si unidades pedidas es menor que unidades en stock
URGENTE si unidades pedidas no duplica al número de unidades en stock
SUPERURGENTE en caso contrario*/

create view vista_productos as
select ProductoID, ProductoNombre, format(PrecioUnitario,0), UnidadesStock,
case
	WHEN UnidadesPedidas = 0 then "BAJA"
    WHEN UnidadesPedidas < UnidadesStock THEN "MEDIA"
    WHEN UnidadesPedidas * 2 < UnidadesStock THEN "URGENTE"
    ELSE "SUPERURGENTE"
END as prioridad
 from productos;
 
 select * from vista_productos;

/* 2. Se necesita un reporte de productos para identificar problemas de stock.
Para cada prioridad indicar cuántos productos hay y su precio promedio.
No incluir las prioridades para las que haya menos de 5 productos.*/

select prioridad, count(*) from vista_productos
group by prioridad
having count(*) > 5;

select productos.ProductoNombre, PrecioUnitario, categorias.CategoriaNombre, 
case
	WHEN UnidadesPedidas = 0 then "BAJA"
    WHEN UnidadesPedidas < UnidadesStock THEN "MEDIA"
    WHEN UnidadesPedidas * 2 < UnidadesStock THEN "URGENTE"
    ELSE "SUPERURGENTE"
END as prioridad
 from productos
 inner join categorias
 on productos.CategoriaID = categorias.CategoriaID;
