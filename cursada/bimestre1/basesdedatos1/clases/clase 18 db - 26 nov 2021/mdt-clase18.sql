/*
Crear una vista para poder organizar los envíos de las facturas. Indicar número
de factura, fecha de la factura y fecha de envío, ambas en formato dd/mm/yyyy,
valor del transporte formateado con dos decimales, y la información del
domicilio del destino incluyendo dirección, ciudad, código postal y país, en una
columna llamada Destino.
*/

CREATE VIEW VistaFacturas AS 
	SELECT FacturaID, 
		DATE_FORMAT(FechaFactura, '%d/%m/%Y') AS FechaFactura, 
        DATE_FORMAT(FechaEnvio, '%d/%m/%Y') AS FechaEnvio, 
        ROUND(Transporte, 2) AS ValorTransporte,
		CONCAT(DireccionEnvio, ' ', CiudadEnvio, ' ', CodigoPostalEnvio, ' ', PaisEnvio) AS Destino
	FROM Facturas;

CREATE VIEW vistaFacturas AS 
SELECT  FacturaID, 
date_format(FechaFactura, '%d/%m/%y') AS FechaFactura,
 date_format(FechaEnvio, '%d/%m/%y') AS FechaEnvio,
 round(Transporte, 2) AS valorTransporte,
 concat(DireccionEnvio, ' ', CiudadEnvio, ' ', CodigoPostalEnvio, ' ', PaisEnvio) AS  Destino,
 FROM facturas;



SELECT * FROM VistaFacturas;
/*
Realizar una consulta con todos los correos y el detalle de las facturas que
usaron ese correo. Utilizar la vista creada.
*/

SELECT c.CorreoID, vf.*
FROM VistaFacturas AS vf
	INNER JOIN Facturas AS f
		ON vf.FacturaID = f.FacturaID 
	INNER JOIN Correos AS c 
		ON c.CorreoID = f.EnvioVia;
        
        
/*
Crear una vista con un detalle de los productos en stock. Indicar id, nombre del
producto, nombre de la categoría y precio unitario.
*/

CREATE VIEW ProductosEnStock AS
	SELECT p.ProductoID, p.ProductoNombre, c.CategoriaNombre, p.PrecioUnitario
	FROM Productos p
		LEFT JOIN Categorias c
		ON p.CategoriaID = c.CategoriaID;
        
SELECT * FROM ProductosEnStock;
/*
Escribir una consulta que liste el nombre y la categoría de todos los productos
vendidos. Utilizar la vista creada.
*/

SELECT DISTINCT ps.ProductoNombre, ps.CategoriaNombre
FROM ProductosEnStock ps
	INNER JOIN FacturaDetalle fd
	ON ps.ProductoID = fd.ProductoID;
        