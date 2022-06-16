-- CATEOGORIAS Y PRODUCTOS
-- 1
SELECT * FROM categorias;

-- 2
SELECT CategoriaNombre, Descripcion FROM categorias;

-- 3
SELECT * FROM productos;

-- 4
SELECT * FROM productos
WHERE Discontinuado = 1;

-- 5
SELECT * FROM proveedores
WHERE ProveedorID = 8;

-- 6
SELECT * FROM productos
WHERE PrecioUnitario BETWEEN 10 AND 22;

-- 7
SELECT * FROM productos
WHERE UnidadesStock < NivelReorden;

-- 8
SELECT * FROM productos
WHERE (UnidadesStock < NivelReorden) AND UnidadesPedidas = 0;

-- CLIENTES
-- 1
SELECT Contacto, Compania, Titulo, Pais FROM clientes
ORDER BY Pais;

-- 2
SELECT * FROM clientes
WHERE Titulo = 'Owner';

-- 3
SELECT * FROM clientes
WHERE contacto LIKE 'C%';

-- FACTURAS
-- 1
SELECT * FROM facturas
ORDER BY FechaFactura;

-- 2
SELECT * FROM facturas
WHERE PaisEnvio = 'USA' AND EnvioVia != 3;

-- 3
SELECT * FROM clientes
WHERE ClienteID = 'GOURL';

-- 4
SELECT * FROM facturas
WHERE EmpleadoID IN (2,3,5,8,9);
