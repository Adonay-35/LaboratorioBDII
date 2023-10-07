-- Declarar el cursor estático
DECLARE miCursor CURSOR STATIC SCROLL FOR
SELECT ID_Empleado, Nombres, Apellidos
FROM Empleados
ORDER BY ID_Empleado;

-- Variables para almacenar datos del cursor
DECLARE @ID_Empleado int, @Nombres varchar(200), @Apellidos varchar(200);

-- Abrir el cursor
OPEN miCursor;

-- Recorrido hacia adelante
-- Obtener el primer registro
FETCH FIRST FROM miCursor INTO @ID_Empleado, @Nombres, @Apellidos;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID_Empleado: ' + CAST(@ID_Empleado AS varchar(10)) + ', Nombres: ' + @Nombres + ', Apellidos: ' + @Apellidos;

    --Obtener el siguiente registro hacia adelante
    FETCH NEXT FROM miCursor INTO @ID_Empleado, @Nombres, @Apellidos;
END;

-- Recorrido hacia atrás
-- Obtener el ultimo registro
FETCH LAST FROM miCursor INTO @ID_Empleado, @Nombres, @Apellidos;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID_Empleado: ' + CAST(@ID_Empleado AS varchar(10)) + ', Nombres: ' + @Nombres + ', Apellidos: ' + @Apellidos;

    -- Obtener el registro anterior hacia atras
    FETCH PRIOR FROM miCursor INTO @ID_Empleado, @Nombres, @Apellidos;
END;

-- Cerrar y liberar el cursor
CLOSE miCursor;
DEALLOCATE miCursor;
