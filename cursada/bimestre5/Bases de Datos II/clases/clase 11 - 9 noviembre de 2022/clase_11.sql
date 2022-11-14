
#Clase 11
DELIMITER $$
CREATE PROCEDURE SP_de_prueba ()
BEGIN
	DECLARE state, message VARCHAR(255);
    DECLARE errorNumber INT;
    START TRANSACTION; -- Abrir la transaccion
	BEGIN -- Sin este BEGIN, no funciona. Acordarse del END antes de cerrar el END del SP
    	-- Si existe algun error
    	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    	BEGIN
    		-- Guardamos informacion del error, SIN el SET al momento de asignarle valores a las variables
    		GET DIAGNOSTICS CONDITION 1
    			state = RETURNED_SQLSTATE, 
    			errorNumber    = MYSQL_ERRNO,
    			message    = MESSAGE_TEXT;
                
    		-- Cancelamos la transaccion
    		ROLLBACK;
            
			-- El SP devuelve la info del error o NULL en esas variables si no hubo errores
			SELECT state, errorNumber, message;
    	END;
    		
    	-- Si no entro al HANDLER, entonces confirmamos los cambios
        
        -- Logica del SP
        
		#Insert
		#Insert 
		#Update 
		#Delete --> Falla 
		#Insert 
        
    	COMMIT; -- Guardamos o confirmamos los cambios
         			
	END;
END $$




# Pasos para una Compra en un Ecommerce
# 1- Agregan el producto al carrito
# 2- Proceso de Pago 									
	# Direccion de facturacion
    # Seleccionar tarjeta y modo de pago
# 3- Genera un pedido								
# 4- Crea una factura
# 5- Reducir en cantidad de stock el producto comprado
 


#Handlers --> Rollback

#Start Transaction

#Insert
#Insert 
#Update 
#Delete 
#Insert 

#Commit 









# Sub consultas



-- udf_cantidad_productos_por_vendedor(pi_idVendedor) 
-- select count(*) from productvendor pv2 where pv2.VendorID = pi_idVendedor

#SubConsultas
#Escribir una consulta que devuelva un producto de un vendedor que se 
#haya recibido el 10-09-2001 y tambien el 13-09-2001. Ademas, mostrar la cantidad de prodcutos del vendedor.

select * 
	, udf_cantidad_productos_por_vendedor(v.vendorId)  as VendorQuant -- Funcion 
    , (select count(*) from productvendor pv2 where pv2.VendorID = v.vendorId )
from productvendor pv 
inner join vendor v 
	on pv.VendorID = v.VendorId 
where 
	exists (
			select * 
			from productvendor pv2 
			where year(pv2.lastReceiptDate) = 2001 
				and month(pv2.lastReceiptDate) = 09
				and day(pv2.lastReceiptDate) = 10
				and 2 = pv2.ProductID
			)    -- Si para productId = 1 hay resultado --> True 
				-- Si para productId = 1 hay resultado --> True 
and exists (
			select * 
			from productvendor pv3 
			where year(pv3.lastReceiptDate) = 2001 
				and month(pv3.lastReceiptDate) = 09
				and day(pv3.lastReceiptDate) = 13
				and 2 = pv3.ProductID
                -- Si para productoId = 1 no hay resultado --> False 
                -- Si para productoId = 2 hay resultado --> True                 
			)


select productID, count(*) 
from productvendor
group by productID 
having count(*) > 1








