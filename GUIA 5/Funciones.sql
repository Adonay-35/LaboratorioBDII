-- Funciones 

-- UDF escalar que suma dos números
CREATE FUNCTION dbo.SumarNumeros
(
    @Numero1 DECIMAL(10, 2),
    @Numero2 DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Resultado DECIMAL(10, 2)
    SET @Resultado = @Numero1 + @Numero2
    RETURN @Resultado
END

-- Uso de la UDF escalar
DECLARE @Resultado DECIMAL(10, 2)
SET @Resultado = dbo.SumarNumeros(5.00, 3.50)
SELECT @Resultado AS Resultado


-- UDF con valores de tabla que filtra productos por precio
CREATE FUNCTION dbo.FiltrarProductosPorPrecio
(
    @PrecioMinimo DECIMAL(5, 2)
)
RETURNS TABLE
AS
RETURN (
    SELECT ID_Producto, Nombre_Producto, Precio_Unitario, Descripcion
    FROM Productos
    WHERE Precio_Unitario >= @PrecioMinimo
)
-- Uso de la UDF con valores de tabla
SELECT * FROM dbo.FiltrarProductosPorPrecio(10.00)

