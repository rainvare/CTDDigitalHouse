#Clase 1 - BD 2 - C1 

#DDL 
DROP 	--> elimina la tabla
ALTER	--> modifica una tabla
CREATE	--> crea una tabla 

#DML
INSERT	--> inserta registros en una tabla
DELETE 	--> elimina registros de una tabla
UPDATE	--> actualiza registros de una tabla

SELECT 	--> devuelve los datos, una o mas columnas
FROM 	--> indicamos desde donde vamos a devolver los datos
WHERE	--> nos permite agregar condiciones a nuestras consultas delete/select/update 
	--> operadores logicos < > = != 
    --> LIKE _ 1 caracter
			 % 0 o mas caracteres
		select * from address where addressLine1 like '_9%' limit 10 
	--> IN 
		select * from address where city in ('Bothell', 'Monroe', 'Duvall')
        select * from address where city = 'Bothell' OR city = 'Monroe' OR city = 'Duvall'
	--> BETWEEN	 busquedas por rango entre dos valores
		select * from address where stateprovinceId BETWEEN 70 and 75
	--> IS NULL 
GROUP BY  	--> Agrupar registros
HAVING		--> vamos a aplicar condiciones con las funciones de agregacion
LIMIT		--> limita los resultados de una consulta
OFFSET		-->	salta X cantidad de registros 


Funciones de Agregacion:
Count(columna) 	--> contar registros
MAx(columna)--> Maximo valor de una columna
MIN(columna)--> Minimo valor de una columna
SUM(columna)--> Devuelvo la suma de los valores de columna
AVG(columna)--> Devuelvo el promedio de los valores de columna
			
