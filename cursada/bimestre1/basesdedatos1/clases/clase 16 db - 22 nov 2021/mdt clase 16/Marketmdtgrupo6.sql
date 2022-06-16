-- Reportes parte I
-- 1
select f.FacturaID, f.FechaFactura, c.Compania, cli.Contacto, cat.CategoriaNombre, p.ProductoNombre, p.PrecioUnitario, fd.Cantidad
from Facturas f
inner join Correos c on f.EnvioVia = c.CorreoID
inner join Clientes cli on f.ClienteID = cli.ClienteID
inner join FacturaDetalle fd on fd.FacturaID = f.FacturaID
inner join Productos p on fd.ProductoID = p.ProductoID
inner join Categorias cat on cat.CategoriaID = p.CategoriaID;

-- Reportes parte II
-- 1
select * from Categorias c 
left join Productos p
on c.CategoriaID = p.CategoriaID;

-- 2
select * from Clientes c
left join Facturas f
on c.ClienteID = f.ClienteID
where isnull(f.clienteID);

-- 3
select p.ProductoNombre, c.CategoriaNombre, coalesce(pro.Contacto, 'No tiene proveedor') as proveedor
from Productos p
left join Categorias c on p.CategoriaID = p.CategoriaID
left join Proveedores pro on p.ProveedorID = pro.ProveedorID;

-- 4
select CategoriaID, avg(PrecioUnitario) as  promedio
from Productos
group by CategoriaID;

-- 5
select * 
from Clientes c 
left join Facturas f on c.ClienteID = f.ClienteID
order by f.FechaFactura desc;

-- 6
select f.EnvioVia, count(*) 
from Facturas f
right join Correos c
on f.EnvioVia = c.CorreoID
group by f.EnvioVia;

