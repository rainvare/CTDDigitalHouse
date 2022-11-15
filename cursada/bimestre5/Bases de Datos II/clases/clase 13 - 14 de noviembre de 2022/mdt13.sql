-- mdt 13

/* El director de marca de Microsoft solicitó un informe para averiguar la relevancia de la
descripción “Suitable for any type of riding, on or off-road." en modelos registrados.
También solicitó un Reporte de Optimización de la tabla de productdescription, con el
objetivo de prospectar el crecimiento de la base de datos para los próximos 6 meses*/

/*1. Crear un índice FULLTEXT en la tabla productdescription, utilizando como
parámetro la columna description.*/

create fulltext index idx_product_description
on productdescription(description);

show index from productdescription;

/*2. Crear una consulta que devuelva el nombre del modelo y la cantidad de veces que
la descripción “Suitable for any type of riding, on or off-road” aparece en
cada modelo.
Luego revisar las siguientes preguntas:
● ¿Cuántos registros retornaron?
● ¿Cuál es el tiempo de duración de esta consulta?
● ¿En qué modelos aparece más de una vez la descripción citada?*/

select pm.name as 'nombre de modelo', count(pd.productdescriptionID) as cantidad
from productdescription pd
inner join productmodelproductdescriptionculture pmpdc
on pd.ProductDescriptionID = pmpdc.ProductDescriptionID
inner join productmodel pm
on pmpdc.ProductModelID = pm.ProductModelID
where match(description)
against('Suitable for any type of riding, on or off-road')
group by pm.name;

-- 24 registros 
-- 0.047 sec
-- 'Road-550-W' e 'Road-550'

/*3. Crear una consulta que devuelva el porcentaje de relevancia de la descripción
“Suitable for any type of riding, on or off-road.” para todos los modelos
involucrados. Luego, revisar las siguientes preguntas:
● ¿En qué modelo fue más relevante la descripción?
● ¿En qué modelo fue menos relevante la descripción?
● ¿Cuál es la duración de esta consulta?*/

select pm.name, match(description) against('Suitable for any type of riding, on or off-road') as porcentaje
from productdescription pd
inner join productmodelproductdescriptionculture pmpdc
on pd.ProductDescriptionID = pmpdc.ProductDescriptionID
inner join productmodel pm
on pmpdc.ProductModelID = pm.ProductModelID
where match(description)
against('Suitable for any type of riding, on or off-road')
group by pm.name;

-- 'Mountain-500'
-- 'LL Road Rear Wheel'
-- 0.016 sec


/*4. Visualizar todos los índices de la tabla productdescription y responder:
● ¿En qué columna está el índice agrupado?
● ¿En qué columna está el índice no agrupado?
● ¿Cuál es la estructura del índice agrupado?
● ¿Cuál es la estructura del índice no agrupado?*/

show index from productdescription;


/*5. Acceder al Schema Inspector de la base de datos AdventureWorks y responder:
● ¿Qué tan grande es la base de datos?
● ¿Qué tamaño tiene la tabla más grande de esta base de datos?*/

-- bbdd: 77.3 MB
-- tabla: 12.5 MB

/*6. Acceder al Table Inspector de la tabla productdescription y responder:
● ¿Cuál es el tamaño estimado de la tabla?*/

-- 144.0 KB

/*7. Seleccionar la guía Indexes y hacer clic en el índice FULLTEXT. Responder:
● ¿Cuál es la cardinalidad del índice creado?
● Justificar este valor.*/

-- 762
-- Hay 762 descripciones diferentes en la tabla

/*8. Excluir el índice FULLTEXT.*/
alter table productdescription
drop index idx_product_description;