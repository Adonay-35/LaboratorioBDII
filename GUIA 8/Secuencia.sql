-- Crear una secuencia para llave primaria en la tabla "Inventarios"
CREATE SEQUENCE SecuenciaID_Inventario
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 99999999;

-- Crear tabla ReporteInventarios
CREATE TABLE ReporteInventarios(
    ID_ReporteInventario int PRIMARY KEY,
    ID_Inventario int,
    FechaInsercion DATETIME,
    CantidadInventario INT,
    ID_Producto INT
);

-- Crear trigger
CREATE TRIGGER RegistroInventarios
ON Inventarios
AFTER INSERT
AS
BEGIN
    DECLARE @ID_Inventario INT
    DECLARE @FechaInsercion DATETIME
    DECLARE @CantidadInventario INT
    DECLARE @ID_Producto INT
	
    -- Obtiene la información de la inserción
    SELECT TOP 1 
        @ID_Inventario = ID_Inventario, 
        @FechaInsercion = GETDATE(), 
        @CantidadInventario = CantidadInventario,
        @ID_Producto = ID_Producto
    FROM inserted

    -- Inserta la información en la tabla ReporteInventarios
    INSERT INTO ReporteInventarios VALUES
        (NEXT VALUE FOR SecuenciaID_Inventario, @ID_Inventario, @FechaInsercion, @CantidadInventario, @ID_Producto);

    PRINT 'Se registró un nuevo inventario con Fecha y Hora: ' + 
        CAST(@FechaInsercion AS VARCHAR(100)) + ' del Producto con ID: ' + 
        CAST(@ID_Producto AS VARCHAR(10))
END;

-- Inserción de un nuevo producto
INSERT INTO Productos VALUES
    ('Pan Integral', 2.5, 'Pan integral de trigo entero');

-- Inserción de un nuevo inventario
INSERT INTO Inventarios VALUES
    (100, GETDATE(), 1);

-- Consultar tabla de ReporteInventarios
SELECT * FROM ReporteInventarios;

-- Consultar valor actual de la secuencia
SELECT current_value FROM sys.sequences WHERE name = 'SecuenciaID_Inventario';

-- Consultar siguiente valor de la secuencia
SELECT NEXT VALUE FOR SecuenciaID_Inventario AS next_value;

