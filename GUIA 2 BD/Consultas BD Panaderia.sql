
-- CONSULTAS NORMALES

-- Obtener la cantidad total de productos en inventario para un producto específico
	SELECT Nombre_Producto, SUM(CantidadInventario) AS Total_Inventario
	FROM Inventarios
	JOIN Productos ON Inventarios.ID_Producto = Productos.ID_Producto
	WHERE Productos.ID_Producto = 1
	GROUP BY Nombre_Producto;

--  Calcular el total de las compras realizadas en septiembre de 2023
	SELECT SUM(MontoCompra) AS Total_Compras
	FROM Compras
	WHERE MONTH(FechaCompra) = 9 AND YEAR(FechaCompra) = 2023;

-- Calcular el subtotal de cada detalle de venta 
	SELECT CantidadVendida, PrecioUnitarioVenta, CantidadVendida * PrecioUnitarioVenta AS Subtotal
	FROM DetalleVentas;

-- Encuentre los productos con un precio unitario superior a $5.00 o una descripción no nula
	SELECT Nombre_Producto, Precio_Unitario, Descripcion
	FROM Productos
	WHERE Precio_Unitario > 5.00 OR Descripcion IS NOT NULL;

-- Obtener la fecha y hora actual del sistema
	SELECT GETDATE() AS Fecha_y_Hora_Actual;

-- CONSULTAS MULTITABLAS, SUBCONSULTAS Y JOINS

-- Encontrar los detalles de ventas de productos vendidos por un cliente específico
	SELECT Ventas.ID_Venta, Ventas.FechaVenta, Productos.Nombre_Producto,
	DetalleVentas.CantidadVendida, DetalleVentas.PrecioUnitarioVenta, DetalleVentas.Subtotal
	FROM Clientes
	JOIN Ventas ON Clientes.ID_Cliente = Ventas.ID_Cliente
	JOIN DetalleVentas ON Ventas.ID_Venta = DetalleVentas.ID_Venta
	JOIN Productos ON DetalleVentas.ID_Producto = Productos.ID_Producto
	WHERE Clientes.ID_Cliente = 1;

-- Encontrar los clientes que han realizado compras de productos con un precio unitario superior a $10.00
	SELECT C.Nombres, C.Apellidos, P.Nombre_Producto, P.Precio_Unitario
	FROM Clientes AS C
	JOIN Ventas AS V ON C.ID_Cliente = V.ID_Cliente
	JOIN DetalleVentas AS DV ON V.ID_Venta = DV.ID_Venta
	JOIN Productos AS P ON DV.ID_Producto = P.ID_Producto
	WHERE P.Precio_Unitario > 10.00;

-- Encontrar los nombres de los empleados y sus respectivos distritos de residencia
	SELECT E.Nombres, E.Apellidos, D.Distrito
	FROM Empleados AS E
	JOIN Direcciones AS Dir ON E.ID_Direccion = Dir.ID_Direccion
	JOIN Distritos AS D ON Dir.ID_Distrito = D.ID_Distrito;

-- Encontrar la información de las facturas relacionadas con un cliente específico
	SELECT F.ID_Factura, F.FechaFactura, F.TotalFactura
	FROM Facturas AS F
	JOIN Ventas AS V ON F.ID_Venta = V.ID_Venta
	WHERE V.ID_Cliente = 1;

-- Obtenga una lista de productos y sus cantidades en inventario
	SELECT P.Nombre_Producto, I.CantidadInventario
	FROM Productos AS P
	JOIN Inventarios AS I ON P.ID_Producto = I.ID_Producto;






