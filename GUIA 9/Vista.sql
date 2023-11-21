-- Consulta 
SELECT
    E.ID_Empleado,
    E.NombresEmpleado,
    E.ApellidosEmpleado,
    E.DUI,
    E.ISSS,
    E.FechaNacEmpleado,
    E.Telefono,
    E.ID_Cargo,
    C.Cargo AS NombreCargo
FROM
    Empleados E
JOIN
    Cargos C ON E.ID_Cargo = C.ID_Cargo;

-- Crear una vista que muestra empleados con su respectivo cargo
CREATE VIEW VistaEmpleadosConCargo AS
SELECT
    E.ID_Empleado,
    E.NombresEmpleado,
    E.ApellidosEmpleado,
    E.DUI,
    E.ISSS,
    E.FechaNacEmpleado,
    E.Telefono,
    E.ID_Cargo,
    C.Cargo AS NombreCargo
FROM
    Empleados E
JOIN
    Cargos C ON E.ID_Cargo = C.ID_Cargo;

-- Consultar la vista de empleados con su respectivo cargo
SELECT * FROM VistaEmpleadosConCargo;
