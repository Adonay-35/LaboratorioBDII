Use Panaderia;

-- Crear logins y usuarios
CREATE LOGIN SysadminLogin WITH PASSWORD = '';
CREATE USER SysadminUser FOR LOGIN SysadminLogin;

CREATE LOGIN GerenteLogin WITH PASSWORD = '';
CREATE USER GerenteUser FOR LOGIN GerenteLogin;

CREATE LOGIN VendedorLogin WITH PASSWORD = '';
CREATE USER VendedorUser FOR LOGIN VendedorLogin;

CREATE LOGIN ContadorLogin WITH PASSWORD = '';
CREATE USER ContadorUser FOR LOGIN ContadorLogin;

CREATE LOGIN BodegaLogin WITH PASSWORD = '';
CREATE USER BodegaUser FOR LOGIN BodegaLogin;

CREATE LOGIN RHLogin WITH PASSWORD = '';
CREATE USER RHUser FOR LOGIN RHLogin;

CREATE LOGIN PanaderoLogin WITH PASSWORD = '';
CREATE USER PanaderoUser FOR LOGIN PanaderoLogin;

-- Crear roles
CREATE ROLE Sysadmin;
CREATE ROLE Gerente;
CREATE ROLE Vendedor;
CREATE ROLE Contador;
CREATE ROLE Bodega;
CREATE ROLE RH;
CREATE ROLE Panadero;

-- Agregar usuarios a los roles
ALTER ROLE Sysadmin ADD MEMBER SysadminUser;
ALTER ROLE Gerente ADD MEMBER GerenteUser;
ALTER ROLE Vendedor ADD MEMBER VendedorUser;
ALTER ROLE Contador ADD MEMBER ContadorUser;
ALTER ROLE Bodega ADD MEMBER BodegaUser;
ALTER ROLE RH ADD MEMBER RHUser;
ALTER ROLE Panadero ADD MEMBER PanaderoUser;

-- Asignar permisos al rol Sysadmin
GRANT ALL PRIVILEGES ON DATABASE::Panaderia TO SysadminUser;
GRANT CONTROL ON DATABASE::Panaderia TO SysadminUser;

-- Asignar permisos al rol Gerente
GRANT SELECT, UPDATE, INSERT, DELETE ON DATABASE::Panaderia TO GerenteUser;
GRANT CONTROL ON DATABASE::Panaderia TO GerenteUser WITH GRANT OPTION;

-- Asignar permisos al rol Vendedor
GRANT SELECT ON Inventarios TO VendedorUser;
GRANT SELECT ON Productos TO VendedorUser;
GRANT INSERT, SELECT, UPDATE ON Facturas TO VendedorUser;
GRANT INSERT, SELECT, UPDATE ON Ventas TO VendedorUser;
GRANT INSERT, SELECT, UPDATE ON DetallesVentas TO VendedorUser;
GRANT INSERT, SELECT, UPDATE ON Clientes TO VendedorUser;
GRANT INSERT, SELECT, UPDATE ON Direcciones TO VendedorUser;
GRANT SELECT ON Distritos TO VendedorUser;
GRANT SELECT ON Municipios TO VendedorUser;
GRANT SELECT ON Departamentos TO VendedorUser;

-- Asignar permisos al rol Contador
GRANT SELECT ON  Ventas TO ContadorUser;
GRANT SELECT ON  Detallesventas TO ContadorUser;
GRANT SELECT ON  Compras TO Contador;
GRANT SELECT ON  Detallescompras TO ContadorUser;
GRANT SELECT ON  Proveedores TO ContadorUser;
GRANT SELECT ON  Facturas TO ContadorUser;
GRANT SELECT ON Clientes TO ContadorUser;
GRANT SELECT ON Direcciones TO ContadorUser;
GRANT SELECT ON Distritos TO ContadorUser;
GRANT SELECT ON Municipios TO ContadorUser;
GRANT SELECT ON Departamentos TO ContadorUser;

-- Asignar permisos al rol Bodega
GRANT INSERT, SELECT, UPDATE, DELETE ON  Inventarios TO BodegaUser;
GRANT INSERT, SELECT, UPDATE, DELETE ON  Productos TO BodegaUser;

-- Asignar permisos al rol RH
GRANT INSERT, SELECT, UPDATE, DELETE ON  Empleados TO RHUser;
GRANT INSERT, SELECT, UPDATE, DELETE ON Direcciones TO RHUser;
GRANT INSERT, SELECT, UPDATE, DELETE ON Distritos TO RHUser;
GRANT INSERT, SELECT, UPDATE, DELETE ON Municipios TO RHUser;
GRANT INSERT, SELECT, UPDATE, DELETE ON Departamentos TO RHUser;
GRANT SELECT ON cargos TO RHUser;

-- Asignar permisos al Rol Panadero
GRANT SELECT ON Inventarios TO PanaderoUser;
GRANT SELECT ON Productos TO PanaderoUser;