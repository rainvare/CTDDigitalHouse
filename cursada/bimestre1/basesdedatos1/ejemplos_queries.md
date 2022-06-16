## OPERACIONES RAPIDAS

> 1000 milisegundos = 1 segundo y 60000 milisegundos = 1 minuto

```
milisegundos a minutes = (millis / 1000)  / 60;
milisegundos a seconds = ((millis / 1000) % 60);
```
## CREATE DATABASE
```
CREATE DATABASE miprimerabasededatos;
USE miprimerabasededatos;
```
## CREATE TABLE
```
CREATE TABLE nombre_de_la_tabla (
    nombre_de_la_columna_1 TIPO_DE_DATO CONSTRAINT,
    nombre_de_la_columna_2 TIPO_DE_D        ATO CONSTRAINT
)
```
```
CREATE TABLE post (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200)
)
```
```
CREATE TABLE ordenes (
    orden_id INT NOT NULL,
    orden_numero INT NOT NULL,
    cliente_id INT,
    PRIMARY KEY (orden_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
```

## ALTER TABLE

```
ALTER TABLE peliculas
ADD rating DECIMAL(3,1) NOT NULL;
```
```
ALTER TABLE peliculas
MODIFY rating DECIMAL(4,1) NOT NULL;
```
```
ALTER TABLE peliculas
DROP rating;
```

## INSERT

```
INSERT INTO table_name (columna_1, columna_2, columna_3, ...)
VALUES (valor_1, valor_2, valor_3, ...);
```
```
INSERT INTO artistas (id, nombre, rating)
VALUES (DEFAULT, 'Shakira', 1.0);
```

## UPDATE

```
UPDATE nombre_tabla
SET columna_1 = valor_1, columna_2 = valor_2, ...
WHERE condición;
```
```
UPDATE artistas
SET nombre = 'Charly Garcia', rating = 1.0
WHERE id = 1;
```

## DELETE

```
DELETE FROM nombre_tabla WHERE condición;
```
```
DELETE FROM artistas WHERE id = 4;
```

## SELECT

```
SELECT nombre_columna, nombre_columna, ...
FROM nombre_tabla;
```
```
SELECT id, titulo, rating
FROM peliculas;
```
```
SELECT * FROM albumes
```
```
SELECT titulo FROM albumes
```
```
SELECT nombre_columna_1, nombre_columna_2, ...
FROM nombre_tabla
WHERE condicion;
```
```
SELECT primer_nombre, apellido
FROM clientes
WHERE pais = ‘Argentina’;
```

## ORDER BY

```
SELECT nombre_columna1, nombre_columna2
FROM tabla
WHERE condicion
ORDER BY nombre_columna1;
```
```
SELECT nombre, rating
FROM artistas
WHERE rating > 1.0
ORDER BY nombre DESC;
```
```
SELECT * FROM movies
WHERE rating > 5
ORDER BY rating
```
```
SELECT firts_name, last_name FROM actors
WHERE rating > 2
ORDER BY firts_name DESC, rating DESC
```

## BETWEEN

```
SELECT * FROM movies
WHERE rating BETWEEN 7 AND 10
```
```
SELECT nombre, edad
FROM alumnos
WHERE edad BETWEEN 6 AND 12;
```

## LIKE

```
SELECT * FROM movies
WHERE title LIKE 'AVATAR'
```
```
SELECT * FROM movies
WHERE title LIKE 'a%'
```
```
SELECT * FROM movies
WHERE title LIKE '%s'
```
```
SELECT * FROM movies
WHERE title LIKE '%a%t%'
```
```
SELECT nombre
FROM usuarios
WHERE direccion LIKE '%Monroe%';
```
```
SELECT nombre
FROM clientes
WHERE nombre LIKE 'Los%s';
```
```
SELECT * FROM movies
WHERE title LIKE '_a%'
```
```
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'
  AND name NOT LIKE '% %'
```

## IN / NOT IN

```
SELECT * FROM pedido WHERE id IN (3,6,9)
```
```
SELECT * FROM pedido WHERE id NOT IN (3,6,9)
```

## LIMIT

```
SELECT * FROM movies LIMIT 2
```
```
SELECT firts_name, last_name, rating FROM actors
ORDER BY rating DESC
LIMIT 10
```
```
SELECT *
FROM peliculas
WHERE premios > 4
LIMIT 10;
```

## OFFSET

```
SELECT firts_name, last_name, rating FROM actors
ORDER BY rating DESC
LIMIT 10
OFFSET 5
```

## AS

```
SELECT title AS titulo, rating * 10 AS 'rating hasta 100' FROM movies
```
```
SELECT nombre_columna1 AS alias_nombre_columna1
FROM nombre_tabla;
```
```
SELECT razon_social_cliente AS nombre
FROM cliente
WHERE nombre LIKE 'a%';
```
```
SELECT nombre, apellido, edad
FROM alumnos_comision_inicial AS alumnos;
```
## COUNT()

```
SELECT COUNT(*) FROM movies;
```
```
SELECT COUNT(id) AS total FROM movies WHERE genre_id = 3;
```
## MAX()

```
SELECT MAX(rating)
FROM movies
WHERE title LIKE "Harry%"
```
```
SELECT MAX(rating), COUNT(*)
FROM movies
WHERE title LIKE "La guerra%"
```

## MIN()

```
SELECT MIN(total) AS 'Total minimo' FROM facturas;
```
```
SELECT id, MIN(total) AS 'Total minimo' FROM facturas;
```
```
SELECT MIN(rating), COUNT(*)
FROM movies
```

## SUM()

```
SELECT SUM(total) FROM facturas;
```
```
SELECT SUM(total) FROM facturas WHERE id > 25;
```
```
SELECT pais_de_facturacion, SUM(total) AS 'Total de Facturacion' 
FROM facturas
GROUP BY pais_de_facturacion
```
```
SELECT SUM(length)
FROM movies
```

## AVG()

```
SELECT AVG(total) FROM facturas;
```
```
SELECT AVG(total) FROM facturas WHERE total > 2;
```
```
SELECT AVG(length)
FROM movies
```

## GROUP BY

```
SELECT marca 
FROM coche 
WHERE anio_fabricacion >= 2010
GROUP BY marca
```
```
SELECT marca, MAX(precio) AS precio_maximo
FROM coche
GROUP BY marca;
```
```
SELECT * 
FROM movies
GROUP BY genre_id;
```
```
SELECT genre_id
FROM movies
GROUP BY genre_id;
```
```
SELECT genero, AVG(duracion) AS duracion_promedio
FROM pelicula
GROUP BY genero;
```
```
SELECT genre_id, COUNT(*)
FROM movies
GROUP BY genre_id;
```
```
SELECT genre_id, COUNT(*), AVG(length)
FROM movies
GROUP BY genre_id;
```

## MIN() MAX() SUM() GROUP BY

```
SELECT pais_de_facturacion, MIN(total), MAX(total), SUM(total) AS 'Total de Facturacion'
FROM facturas
GROUP BY pais_de_facturacion;
```
## MIN() SUM() GROUP BY

```
SELECT pais_de_facturacion, MIN(total), SUM(total) AS 'Total de Facturacion'
FROM facturas
GROUP BY pais_de_facturacion;
```
## MIN() MAX() SUM() AS GROUP BY HAVING

```
SELECT pais_de_facturacion, MIN(total), MAX(total), SUM(total) AS 'T'
FROM facturas
GROUP BY pais_de_facturacion
HAVING t >= 1.5;
```
## HAVING COUNT() GROUP BY 

```
SELECT pais, COUNT(clientesId)
FROM clientes
GROUP BY pais
HAVING COUNT(clienteId) >= 3;
```
## COUNT() MAX() AVG() INNER JOIN GROUP BY HAVING

```
SELECT name, COUNT(*), MAX(rating), AVG(length)
FROM movies
INNER JOIN genres ON genre_id = genres.id
GROUP BY name
HAVING COUNT(*) >= 3;
```
## TABLE REFERENCE

```
SELECT *
FROM usuario u, rol r
WHERE u.rol_id = r.id;
```

## INNER JOIN

```
SELECT columna1, columna2
FROM tabla_A
INNER JOIN tabla_B
ON condicion
```
```
SELECT movies.id, title, genre_id, genres_id, name
FROM movies
INNER JOIN genres ON genre_id = genres.id
```
```
SELECT * FROM usuario u
INNER JOIN rol r ON u.rol_id = r.id
WHERE u.id > 3;
```
```
SELECT factura.id AS nro_factura, apellido, nombre, fecha
FROM cliente
INNER JOIN factura
ON cliente.id = factura.cliente_id;
```
```
SELECT title, firts_name, last_name
FROM movies
INNER JOIN actor_movie ON movie.id = movies.id
INNER JOIN actors ON actor_id = actors_id
```

## LEFT JOIN

```
SELECT columna1, columna2
FROM tabla_A
LEFT JOIN tabla_B
ON condicion
```
```
SELECT movies.id, title, genre_id, genres_id, name
FROM movies
LEFT JOIN genres ON genre_id = genres.id
```
```
SELECT factura.id AS nro_factura, apellido, nombre, fecha
FROM cliente
LEFT JOIN factura
ON cliente.id = factura.cliente_id;
```

## LEFT Excluding JOIN

```
SELECT factura.id AS nro_factura, apellido, nombre, fecha
FROM cliente
LEFT JOIN factura
ON cliente.id = factura.cliente_id
WHERE ISNULL(factura.id);
```

## RIGHT JOIN

```
SELECT columna1, columna2
FROM tabla_A
RIGHT JOIN tabla_B
ON condicion
```
```
SELECT movies.id, title, genre_id, genres_id, name
FROM movies
right JOIN genres ON genre_id = genres.id
```
```
SELECT factura.id AS nro_factura, apellido, nombre, fecha
FROM cliente
RIGHT JOIN factura
ON cliente.id = factura.cliente_id;
```

## RIGHT Excluding JOIN

```
SELECT factura.id AS nro_factura, apellido, nombre, fecha
FROM cliente
RIGHT JOIN factura
ON cliente.id = factura.cliente_id
WHERE ISNULL(cliente.id);
```
# DISTINCT pivot MUCHOS A MUCHOS

```
SELECT DISTINCT firts_name, last_name
FROM movies
INNER JOIN actor_movie ON movie.id = movies.id
INNER JOIN actors ON actor_id = actors.id
WHERE title LIKE "Harry%"
```

## CONCAT()

```
SELECT CONCAT(firts_name, " ", last_name) AS nombre_completo
FROM actors
```

## COALESCE()

```
SELECT title, COALESCE(name, "No tiene genero")
FROM movies
LEFT JOINN genres ON genre_id = genres.id
```
```
SELECT apellido, nombre
COALESCE(ocupacion, hobby, 'Sin ocupacion')
FROM usuario;
```
```
SELECT apellido, nombre
COALESCE(ocupacion, 'Sin ocupacion')
FROM usuario;
```

## NOW()

```
SELECT title, rease_date, NOW()
FROM movies
```

## DATEDIFF()

```
SELECT apellido, nombre, fecha_nacimiento, DATEDIFF('2000-01-15', fecha nacimiento)
FROM usuario;
```

## TIMEDIFF()

```
SELECT TIMEDIFF('18:45:00', '12:30:00');
```

## TIMESTAMPDIFF()

```
SELECT TIMESTAMPDIFF(YEAR, '1990-03-15', NOW());
```

## DATE_FORMAT()

```
SELECT title, DATE_FORMAT(release_date, "%d/%m/%Y")
FROM movies
```

# YEAR()

```
SELECT title, YEAR(release_date)
FROM movies
```

## EXTRACT()

```
SELECT title, EXTRACT(day FROM release_date)
FROM movies
```

## REPLACE()

```
SELECT REPLACE(title, "Harry", "Juanito")
FROM movies
```
```
SELECT REPLACE('Buenas tardes', 'tardes', 'Noches');
```

## LENGTH()

```
SELECT title
FROM movies
WHERE LENGTH(title) > 10
```

## CASE()

```
SELECT title, rating
CASE
    WHEN rating < 5 THEN "Mala"
    WHEN rating < 7 THEN "Buena"
    ELSE "Muy buena
END
FROM movies
```

## LEFT()

```
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital
```

## SUBSTRING()

```
SELECT name,
SUBSTRING(name, 2, 5)
FROM bbc
```

## ROUND()
```
SELECT name,
ROUND(population/1000000,1)
FROM bbc
```
```
SELECT name,
ROUND(population/1000000)
FROM bbc
```
```
SELECT name,
ROUND(population/1000000,-1)
FROM bbc
```

## LOWER()

```
SELECT LOWER(name) FROM bbc
```

## UPPER()

```
SELECT UPPER(name) FROM bbc
```

## IS NULL

```
SELECT name,gdp
FROM world
WHERE gdp IS NULL
```
## CONCAT() EXTRACT() CAST()

```
SELECT nombre, CONCAT(
	EXTRACT(MINUTE FROM CAST(milisegundos/600 AS TIME)),
	":",
	EXTRACT(SECOND FROM CAST(milisegundos/600 AS TIME))) AS duracionMinutos
FROM canciones
```
