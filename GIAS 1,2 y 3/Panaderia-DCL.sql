-- Base de Datos Panaderia
-- DCL
Use Panaderia;

-- ROLES
go
CREATE ROLE Sysadmin;
CREATE ROLE Gerente;
CREATE ROLE Vendedor;
CREATE ROLE Contador;
CREATE ROLE Bodega;
CREATE ROLE RH;
CREATE ROLE Panadero;

-- LOGINS
go
CREATE LOGIN Login_Sysadmin_PedroHernandez WITH PASSWORD = 'root';
go
CREATE LOGIN Login_Gerente_JuanLopez WITH PASSWORD = 'lopez1234';
go
CREATE LOGIN Login_Vendedor_MariaGonzales WITH PASSWORD = 'gonzales1234';
go
CREATE LOGIN Login_Contador_MariaCalderon WITH PASSWORD = 'calderon1234';
go
CREATE LOGIN Login_Bodega_CarlosRamirez WITH PASSWORD = 'ramirez1234';
go
CREATE LOGIN Login_RH_MarioCortez WITH PASSWORD = 'cortez1234';
go
CREATE LOGIN Login_Panadero_PedroLopez WITH PASSWORD = 'lopez1234';
go

-- USUARIOS
go
CREATE USER SysadminPedroHernandez FOR LOGIN Login_Sysadmin_PedroHernandez;
go
CREATE USER GerenteJuanLopez  FOR LOGIN Login_Gerente_JuanLopez;
go
CREATE USER VendedorMariaGonzales FOR LOGIN Login_Vendedor_MariaGonzales;
go
CREATE USER ContadorMariaCalderon FOR LOGIN Login_Contador_MariaCalderon;
go
CREATE USER BodegaCarlosRamirez FOR LOGIN Login_Bodega_CarlosRamirez;
go
CREATE USER RHMarioCortez FOR LOGIN Login_RH_MarioCortez;
go
CREATE USER PanaderoPedroLopez FOR LOGIN Login_Panadero_PedroLopez;

-- Agregar usuarios a los roles
go
ALTER ROLE Sysadmin ADD MEMBER SysadminPedroHernandez;
go
ALTER ROLE Gerente ADD MEMBER GerenteJuanLopez;
go
ALTER ROLE Vendedor ADD MEMBER VendedorMariaGonzales;
go
ALTER ROLE Contador ADD MEMBER ContadorMariaCalderon;
go
ALTER ROLE Bodega ADD MEMBER BodegaCarlosRamirez;
go
ALTER ROLE RH ADD MEMBER RHMarioCortez;
go
ALTER ROLE Panadero ADD MEMBER PanaderoPedroLopez;

-- Asignar permisos al rol Sysadmin
GRANT CONTROL ON DATABASE::Panaderia TO Sysadmin;

-- Asignar permisos al rol Gerente
GRANT SELECT, UPDATE, INSERT, DELETE ON DATABASE::Panaderia TO Gerente;

-- Asignar permisos al rol Vendedor
GRANT SELECT ON Inventarios TO Vendedor;
GRANT SELECT ON Productos TO Vendedor;
GRANT INSERT, SELECT, UPDATE ON Facturas TO Vendedor;
GRANT INSERT, SELECT, UPDATE ON Ventas TO Vendedor;
GRANT INSERT, SELECT, UPDATE ON DetallesVentas TO Vendedor;
GRANT INSERT, SELECT, UPDATE ON Clientes TO Vendedor;
GRANT INSERT, SELECT, UPDATE ON Direcciones TO Vendedor;
GRANT SELECT ON Distritos TO Vendedor;
GRANT SELECT ON Municipios TO Vendedor;
GRANT SELECT ON Departamentos TO Vendedor;

-- Asignar permisos al rol Contador
GRANT SELECT ON  Ventas TO Contador;
GRANT SELECT ON  Detallesventas TO Contador;
GRANT SELECT ON  Compras TO Contador;
GRANT SELECT ON  Detallescompras TO Contador;
GRANT SELECT ON  Proveedores TO Contador;
GRANT SELECT ON  Facturas TO Contador;
GRANT SELECT ON Clientes TO Contador;
GRANT SELECT ON Direcciones TO Contador;
GRANT SELECT ON Distritos TO Contador;
GRANT SELECT ON Municipios TO Contador;
GRANT SELECT ON Departamentos TO Contador;

-- Asignar permisos al rol Bodega
GRANT INSERT, SELECT, UPDATE, DELETE ON  Inventarios TO Bodega;
GRANT INSERT, SELECT, UPDATE, DELETE ON  Productos TO Bodega;

-- Asignar permisos al rol RH
GRANT INSERT, SELECT, UPDATE, DELETE ON  Empleados TO RH;
GRANT INSERT, SELECT, UPDATE, DELETE ON Direcciones TO RH;
GRANT INSERT, SELECT, UPDATE, DELETE ON Distritos TO RH;
GRANT INSERT, SELECT, UPDATE, DELETE ON Municipios TO RH;
GRANT INSERT, SELECT, UPDATE, DELETE ON Departamentos TO RH;
GRANT SELECT ON cargos TO RH;

-- Asignar permisos al Rol Panadero
GRANT SELECT ON Inventarios TO Panadero;
GRANT SELECT ON Productos TO Panadero;