# Operadores

```
=   Igual a
>   Mayor que
>=  Mayor o igual que
<   Menor que
<=  Menor o igual que
<>  Diferente a
!=  Diferente a

&gt; > (greater than) mayor que
&lt; < (less than) menor que

IS NULL     Es nulo
BETWEEN     Entre dos valores
IN          Lista de valores
LIKE        Se ajusta a...

```

# KEYWORDS

`CREATE DATABASE`: crear una base de datos desde cero.

`CREATE TABLE`: podemos crear una tabla desde cero

`FOREIGN KEY`: Aclara a qué tabla y a qué columna hace referencia aquel dato.

`DROP TABLE`: Borrará la tabla que le especifiquemos en la sentencia.

`ALTER TABLE`: Permite alterar una tabla ya existente y va a operar con tres comandos:
    - `ADD`: para agregar una columna.
    - `MODIFY`: para modificar una columna.
    - `DROP`: para borrar una columna.

`INSERT`: Sequido de `INTO` nos va a permitir agregar datos: en todas las columnas o en algunas en especifico

`UPDATE`: modificará los registros existentes de una tabla.

`DELETE`: borra información de una tabla, el `WHERE` aclara la condición para no borrar toda la tabla.

`SELECT`: Realiza consultas de una o varias columnas de una tabla. Usa `FROM` para especificar la tabla a consultar.

`WHERE`: condicionar y filtrar las consultas `SELECT` que se realizan.

`ORDER BY`: ordena los resultados de una consulta según el valor de la columna especificada, se puede agregar `DESC` y `ASC`, va despues del `WHERE`, desempato con `,`.

`BETWEEN`: Para obtener valores dentro de un rango.

`LIKE`: Para especificar un patrón de búsqueda, puede usar `%` para varios caractres antes o despues y `_` paea un caracter o 2.

`NOT LIKE`: Que no tengan.Ej:'% %' excluye espacios.

`IN`: Muestra que esten incluidos en. Chequea si el item esta en la lista.

`NOT IN`: Muestra que no esten incluidos.

`LIMIT`: limitar el número de filas (registros/resultados). También establece el número máximo de registros a eliminar con `DELETE`

`OFFSET`: permite especificar a partir de qué fila comenzar la recuperación de los datos solicitados. Se suele usar con `LIMIT`.

`AS`: Dan un nombre temporal, a tablas, columnas y funciones. Se definen en la consulta y persisten solo en la consulta.

`GROUP BY`: Devuelve una sola fila por cada elemento agrupado que contengan los mismos valores. 
- Va despues del `WHERE` Y antes del `ORDER BY` y el `LIMIT`. 
- Suelen venir acompañadas por funciones de agregacion. 
- Solo podemos poner 2 cosas en el `SELECT`, podemos poner el o los campos que se encuentren en el GROUP BY. Entonces ponemos en el `SELECT` el dato que usamos para agrupar. 
- No puedo poner mas columnas que no sean funciones de agregacion o las columnas que se encuentren en el GROUP BY.

`HAVING`: Usado en conjunto con las funciones de agregación para filtrar datos agregados. 
- Cuando quiero hacer un filtro en los datos ya agrupados
- Pone condiciones en los datos agrupados, los campos que agregamos despues del SELECT

`INNER JOIN`: Nos devuelve todos los registros donde se cruzan dos o más tablas. Devuelve únicamente los registros que cumplen la condición indicada en la cláusula ON

`LEFT JOIN`:  Devuelve registros de 2 o mas tablas, incluso los registros de una primera tabla (A) (al lado del FROM) que no cumplan con la condición indicada en la cláusula ON.
- `WHERE ISNULL(tablaB.id)`: Excluding: devuelve registros de la tabla A que NO se incluyen en la clausula `ON`

`RIGHT JOIN`: Devuelve registros de 2 o mas tablas, incluso los registros de una segunda tabla (B) (al lado del RIGHT JOIN) que no cumplan con la condición indicada en la cláusula ON.
- `WHERE ISNULL(tablaA.id)`: Excluding: devuelve registros de la tabla B que NO se incluyen en la clausula `ON`

`DISTINCT`: No deja ver datos duplicados; cuando las filas tienen los mismos datos, deja ver una sola linea.

`IS NULL`: Selecciona los valores null

# Funciones

## De agregacion:

`COUNT`: Muestra cantidad de filas/registros, con `WHERE` filtra datos siguiendo condiciones. Puede combinarse con otras funciones. Unico resultado

`MAX`: Indica el valor maximo de una columna, hay que pasarle una columna. Unico resultado

`MIN`: Indica el valor minimo de una columna, hay que pasarle una columna. Unico resultado.

`SUM`: Único resultado indicando la suma de una columna cuyo tipo de datos debe ser numérico.

`AVG`: Indica el promedio de una columna, tambien nos da un resultado por toda la tabla, el tipo de datos debe ser numérico. Unico resultado.

## De alteracion:

`CONCAT(column, " ", column2,...)`: Permite unir varias columnas en un solo resultado, tambien permite concatenar strings literales

`COALESCE(columnNULL, "lo quie quiera")`: Salva los casos donde aparece NULL
- COALESCE(columnNULL, columnQueSirvaParaReemplazarElNull "lo quie quiera")

`NOW()`: Permite tener la fecha y la hora actual.

`DATEDIFF(unafecha, otrafecha)`: Permite tener la diferencia entre 2 fechas.

`TIMEDIFF('00:00:00','01:01:01')`: Permite tener la diferencia entre 2 Horarios.

`TIMESTAMPDIFF(anio/min/dias, 'fecha', 'otrafecha')`: Saca la diferencia en anios o minutos o dias, de las dos fechas/tiempos le mandemos por argumento

`DATE_FORMAT(columnaFecha, 'nuevoFormato')`: Permite formatear la fecha hacia como queremos verla

`YEAR(columnaFecha)`: Extrae el anio

`EXTRACT(dato FROM columnaAextraerDato)`: Permite extraer datos.

`REPLACE(columnaAOperar, datoAReemplazar, datoNuevo)`: Permite reemplazar texto.

`LENGTH(columna)`: Permite ver el largo. Se usa mas con `WHERE` o en un `ORDER BY`.

`CASE` : Sirve para mostrar datos dependiendo de condiciones. Al final va un `END`.

`ROUND(attr o num, num decimales)`: Redondea y num decimales,s es cuantos decimales quiero mostrar, si pongo -1 redondea al 10 mas cercano, -2 AL 100, -3 al 1000.

`SUBSTRING(string, posicionInicio, cantidadExtraer)`: Permite extraer parte de un string, la posicion es desde 1.

`LEFT(string,cantidadExtraer)`: Extrae caracteres desde el inicio; el lado izquierdo del string.

`UPPER()`: Pone el string que lleve dentro en mayuscula

`LOWER()` y `LCASE`: Pone el string que lleve dentro en minuscula

`CAST()`: Convierte de un tipo a otro. (Expresion AS tipo)

`LEFT()`: Extrae caracteres desde el inicio; el lado izquierdo del string. (string,cantidadExtraer).

`SEC_TO_TIME`: Retorna un valor del tiempo, basado en segundos.

`IFFNULL` y `NVL`: Toma dos argumentos, y devuelve el primero que no sea `NULL`

`STRCMP()`: Compara 2 strings.

