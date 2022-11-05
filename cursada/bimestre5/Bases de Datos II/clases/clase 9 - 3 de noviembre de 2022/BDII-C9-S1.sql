-- Nos solicitaron crear un procedimiento almacenado, que dado un cliente, un importe y la cantidad de cuotas, le genere el préstamo y su detalle de las cuotas a pagar.
-- Este procedimiento SP_Prestamo, tiene los siguientes parámetros:
-- ● CodCliente: nro interno de cliente
-- ● importe: importe a solicitar del préstamo
-- ● Fecha de Inicio del préstamo.
-- ● CantCuotas: cantidad de cuotas solicitada
-- ● tipo: 1. simulación (no inserta en la base de datos) 2. otorgamiento (inserta en la base de datos)
-- A tener en cuenta para poder trabajar con el siguiente procedimiento:
-- Los préstamos son otorgados a personas mayores de 18 años y menores de 80 años.
-- El cliente no puede tener más de 80 años al finalizar el préstamo, o sea, debemos validar que las cuotas que solicita no superen esa edad, para esto debemos crear una función que verifique la edad del cliente.
-- El importe solicitado deberá ser validado y comparado con los máximos permitidos por cliente.
-- ¡Te damos una ayuda! Podés utilizar los stored procedures y funciones que creaste en
-- la clase anterior.

-- Creo un procedimiento "auxiliar" cuyo único fin es insertar datos en la tabla 'cuotas', ya que me a ser de ayuda con el cursor que implemento en el siguiente sp.
DELIMITER $$
CREATE PROCEDURE sp_insertar_cuotas(IN nuevo_id_cuota INT, IN nuevo_id_prestamo INT, IN nueva_fecha DATE, IN nuevo_importe DECIMAL(10,2))
BEGIN
	INSERT INTO cuotas VALUES (nuevo_id_cuota, nuevo_id_prestamo, nueva_fecha, nuevo_importe);
END$$
DELIMITER ;

-- Creación del SP solicitado en la consigna:
DELIMITER $$
CREATE PROCEDURE sp_prestamo(id_cliente INT, importe DECIMAL(10,2), fecha_prestamo DATE, cant_cuotas INT, tipo INT)
BEGIN
	-- Definición de Variables
	DECLARE fecha_nac_cliente DATE;
    DECLARE edad_valida VARCHAR(5);
    DECLARE edad_cliente INT;
    DECLARE max_importe DECIMAL(10,2);
    
    -- Definición de variables para el CURSOR
    DECLARE c_idcuotas INT;
    DECLARE c_fecha DATE;
    DECLARE c_importe DECIMAL(10,2);
    DECLARE finished INT DEFAULT 0;
    
    -- Declaro el cursor como la selección de todos los campos de la TABLA TEMPORAL.
    -- La TABLA TEMPORAL se obtiene de la invocación del SP de la MDT pasada.
    DECLARE cur1 CURSOR FOR SELECT * FROM tmpCuotas;
    -- Declaro el Handler, que su utilidad es indicar cuando no hay MÁS REGISTROS que consultar, en nuestro caso, sería de la TABLA TEMPORAL.
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
    -- Asigno los valores a las variables previamente definidas:
    -- Necesito la fecha de nacimiento del cliente, para poder calcular la edad y hacer las condiciones de la consigna.
    SET fecha_nac_cliente = (SELECT fecha_nac FROM clientes WHERE idclientes = id_cliente);
    -- Esta variable invoca la función de la MDT pasada, y me indica si es válido el préstamo de acuerdo a la edad del cliente al finalizar el préstamo.
    SET edad_valida = fn_ValidadEdad(fecha_nac_cliente, fecha_prestamo, cant_cuotas);
    -- Calculo la edad del cliente.
    SET edad_cliente = TIMESTAMPDIFF(YEAR, fecha_nac_cliente, CURDATE());
    -- Cada cliente tiene un ID de Scoring asignada que me indica el importe máximo. Así que debo obtenerlo, para poder realizar otra de las condiciones indicadas en la consigna.
    SET max_importe = (SELECT s.MaxImporte FROM clientes c INNER JOIN scoring s ON c.Scoring_idScoring = s.idScoring WHERE c.idclientes = id_cliente);
    
    -- Mi primera validación es el tipo, en este caso, es el 2, cuando es el otorgamiento (insertar datos)
    IF tipo = 2 THEN
		-- Anido un IF con las condiciones especificadas en el enunciado.
		IF (edad_cliente BETWEEN 18 AND 80) AND (edad_valida = 'True') AND (importe <= max_importe) THEN
			-- La primera inserción es en la tabla 'prestamo'
			INSERT INTO prestamo VALUES(DEFAULT, id_cliente, fecha_prestamo, importe, cant_cuotas);
            -- Aquí llamo el SP que me crea la tabla temporal.
            CALL SP_Genera_cuota(importe, fecha_prestamo, cant_cuotas);
            -- Como yo ya invoque el SP, tengo la Tabla Temporal creada, pero yo no quiero perder esos datos, ya que estamos en el caso 2;
            -- Entonces, yo quiero insertar los datos; pero como la tabla tiene x cantidad de registros, recurro al cursor para ir insertando los datos uno por uno.
            -- Aquí viene la necesidad del SP previamente creado de inserción de datos en la tabla 'cuotas'.
            OPEN cur1;
				loop_cuotas: LOOP
                -- Este cursor está sobre la TABLA TEMPORAL, por eso solo cree las tres variables que corresponden a las columnas de la tabla temporal, en este caso son 3.
				FETCH cur1 INTO c_idcuotas, c_fecha, c_importe;
                -- Como estoy en un loop, con cada vuelta invoco al método de insertar en la tabla 'cuotas'
                -- Recuerden que un campo en la tabla 'cuotas' es el ID del préstamo, por eso invoco el "último" valor de la columna.
                -- Ese ID correspondería al último que se genero en el último INSERT (línea 60 de este script).
				CALL sp_insertar_cuotas(c_idcuotas, (SELECT MAX(idPrestamo) FROM prestamo), c_fecha, c_importe);
                -- Este otro IF es para "checkear" que ya se termino de recorrer la tabla temporal.
                -- En caso de que este HANDLER de 1, salgo del LOOP.
				IF finished = 1 THEN LEAVE loop_cuotas;
				END IF;
				END LOOP;
				CLOSE cur1;
        END IF;
        -- Este primer bloque de código sería para el tipo = 2
        -- TODO: tipo = 1.
	END IF;
END$$
DELIMITER ;

-- Llamo el SP
-- Este ejemplo en particular, cumple las condiciones, entonces debería hacer la inserción de datos en las tablas de la BD;
CALL sp_prestamo(1, 8000, '2022-11-03', 4, 2);
-- Con este, el SP se llama, pero no cumple las condiciones, así que en las tablas no deberían haberse insertado datos.
CALL sp_prestamo(1, 15000, '2022-11-03', 5, 2);

-- Por otra parte, hay que mejorar la lógica, ya que el ID del cliente ya debe existir en la tabla de 'clientes'; por lo que tal ves, sería necesario validar que dicho ID exista.
-- Y finalmente, la tabla 'cuotas' consta de 2 primary key, entonces no sé cómo sería ahí el "funcionamiento" interno, para que no haya conflictos con los ID. Duda existencial en todo caso.