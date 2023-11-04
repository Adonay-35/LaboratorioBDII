-- Crear un procedimiento almacenado para actualizar el precio de un producto
CREATE PROCEDURE ActualizarPrecioProducto
    @ProductID INT,
    @NuevoPrecio DECIMAL(5, 2)
AS
BEGIN
    -- Actualizar el precio de un producto en la tabla "Productos"
    UPDATE Productos
    SET PrecioUnitario = @NuevoPrecio
    WHERE ID_Producto = @ProductID;
END;

EXEC ActualizarPrecioProducto @ProductID = 1, @NuevoPrecio = 1.75;

