-- Crear un disparador que se dispara por la ejecución del procedimiento almacenado "ActualizarPrecioProducto"
CREATE TRIGGER DespuesDeActualizarPrecio
ON Productos
AFTER UPDATE
AS
BEGIN
    -- Mostrar un mensaje al inicio del disparador
    PRINT 'El disparador ha sido activado por la ejecución del procedimiento almacenado "ActualizarPrecioProducto".'

    -- Realizar una actualización en la misma tabla "Productos"
    UPDATE p
    SET p.PrecioUnitario = i.PrecioUnitario
    FROM Productos p
    INNER JOIN inserted i ON p.ID_Producto = i.ID_Producto;

    -- Mostrar un mensaje al final del disparador
    PRINT 'El precio del producto ha sido actualizado en la tabla "Productos".';
END;
