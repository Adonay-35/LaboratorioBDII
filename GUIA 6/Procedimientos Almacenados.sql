-- Procedimiento de Consulta
create procedure ListaProductos
as
begin
-- Query a realizar
  SELECT P.Nombre_Producto, I.CantidadInventario
	FROM Productos AS P
	JOIN Inventarios AS I ON P.ID_Producto = I.ID_Producto;
end

-- Ejecucion del PA
execute ListaProductos 

------------------------------------------------------------------
-- Procedimiento de Insercion 
create procedure AgregarCompra
-- Variables 
	@FechaCompra date,
	@MontoCompra decimal(5,2),
	@ID_Proveedor int
as
begin
	insert into Compras values (
	@FechaCompra,
	@MontoCompra,
	@ID_Proveedor );

	select * from Compras;
end 

-- Ejecutando el PA
execute AgregarCompra
	@FechaCompra = '07-10-2023',
	@MontoCompra = '50.00',
	@ID_Proveedor = '3' 


