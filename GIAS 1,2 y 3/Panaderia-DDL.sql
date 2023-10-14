-- Base de Datos Panaderia
-- DDL
create database Panaderia;
go
use Panaderia;

-- TABLAS 
-- DIRECCIONES

go
create table Departamentos(
	ID_Departamento char(2) primary key,
	Departamento varchar(60) not null,
	Pais varchar(60)
);
go
create table Municipios(
	ID_Municipio char(3) primary key,
	Municipio varchar(60) not null,
	ID_Departamento char(2) not null
);
go
create table Distritos(
	ID_Distrito varchar(5) primary key,
	Distrito varchar(60) not null,
	ID_Municipio char(3) not null
);
go
create table Direcciones(
	ID_Direccion int primary key identity(1, 1),
    Linea1 varchar(100) not null,
    Linea2 varchar(100),
    ID_Distrito varchar(5) not null,
    CodigoPostal int,
);

-- EMPLEADOS
go
create table Cargos(
	ID_Cargo int primary key identity(1,1),
	Cargo varchar(100) not null
);
go
create table Empleados(
	ID_Empleado int primary key identity(1,1),
	Nombres_Empleado varchar(200) not null,
	Apellidos_Empleado varchar(200) not null,
	DUI varchar(10) not null,
	ISSS varchar(13) not null,
	FechaNacEmpleado date not null,
	Telefono varchar(10) not null,
	ID_Cargo int not null,
	ID_Direccion int
);

-- MANEJO DE ROLES
go
create table Opciones(
	ID_Opcion int primary key identity(1,1),
	NombreOpcion varchar(150) not null
);

go
create table Roles(
	ID_Rol int primary key identity(1,1),
	NombreRol varchar(100)
);
go
create table AsignacionRolesOpciones(
	ID_AsignacionRol int primary key identity(1,1),
	ID_Rol int not null,
	ID_Opcion int not null
);
go
create table Usuarios(
	ID_Usuario int primary key identity(1,1),
	ID_Empleado int not null,
	ID_Rol int not null,
	Usuario varchar(150) not null,
	Clave varchar(150) not null
);

-- CLIENTES
go
create table Clientes(
	ID_Cliente int primary key identity(1,1),
	Nombres_Cliente varchar(200) not null,
	Apellidos_Cliente varchar(200) not null,
	DUI varchar(10),
	ID_Direccion int,
	Telefono varchar(10)
);

-- PRODUCTOS
go
create table Productos(
	ID_Producto int primary key identity(1,1),
	Nombre_Producto varchar(200) not null,
	Precio_Unitario decimal(5,2) not null,
	Descripcion varchar(400)
);
-- PROVEEDORES
go
create table Proveedores(
	ID_Proveedor int primary key identity (1,1),
	Empresa varchar(100) not null,
	Telefono varchar (100) not null
);

-- COMPRAS
go
create table Compras(
	ID_Compra int primary key identity(1,1),
	FechaCompra date not null,
	MontoCompra decimal(5,2) not null,
	ID_Proveedor int
);
go
create table DetallesCompras(
	ID_DetalleCompra int primary key identity (1,1),
	CantidadComprada int not null,
	PrecioUnitarioCompra decimal(5, 2) not null,
	Subtotal decimal(5, 2) not null,
	ID_Compra int,
	ID_Producto int
);

-- VENTAS
go
create table Ventas(
	ID_Venta int primary key identity (1,1),
	FechaVenta datetime not null,
	Totalventa decimal(5,2) not null,
	ID_Cliente int
);

create table DetallesVentas(
	ID_DetalleVenta int primary key identity (1,1),
	CantidadVendida int not null,
	PrecioUnitarioVenta decimal(5, 2) not null,
	Subtotal decimal(5, 2) not null,
	ID_Venta int,
	ID_Producto int 
);

-- INVENTARIO
go
create table Inventarios(
	ID_Inventario int primary key identity (1,1),
	CantidadInventario int not null,
	FechaActualizacion date not null,
	ID_Producto int
);

-- FACTURAS
create table Facturas(
	ID_Factura int primary key identity (1,1),
	FechaFactura date not null,
	TotalFactura decimal(5,2) not null,
	ID_Venta int
);

-- CONEXIONES CON LLAVES FOREANEAS
go
alter table Municipios add constraint FK_Municipios_Departamentos foreign key (ID_Departamento) references Departamentos(ID_Departamento);
alter table Distritos add constraint FK_Distritos_Municipios foreign key (ID_Municipio) references Municipios(ID_Municipio);
alter table Direcciones add constraint FK_Direcciones_Distritos foreign key (ID_Distrito) references Distritos(ID_Distrito);
alter table Empleados add constraint FK_Empleados_Cargos foreign key (ID_Cargo) references Cargos(ID_Cargo);
alter table Empleados add constraint FK_Empleados_Direcciones foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Clientes add constraint FK_Clientes_Direcciones foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Usuarios add constraint FK_Usuarios_Empleados foreign key (ID_Empleado) references Empleados(ID_Empleado);
alter table Usuarios add constraint FK_Usuarios_Roles foreign key (ID_Rol) references Roles(ID_Rol);
alter table AsignacionRolesOpciones add constraint FK_AsignacionRolesOpciones_Roles foreign key (ID_Rol) references Roles(ID_Rol);
alter table AsignacionRolesOpciones add constraint FK_AsignacionRolesOpciones_Opciones foreign key (ID_Opcion) references Opciones(ID_Opcion);
alter table Compras add constraint FK_Compras_Proveedores foreign key (ID_Proveedor) references Proveedores(ID_Proveedor);
alter table DetallesCompras add constraint FK_DetalleCompras_Compras foreign key (ID_Compra) references Compras(ID_Compra);
alter table DetallesCompras add constraint FK_DetalleCompras_Productos foreign key (ID_Producto) references Productos(ID_Producto);
alter table Ventas add constraint FK_Ventas_Clientes foreign key (ID_Cliente) references Clientes(ID_Cliente);
alter table DetallesVentas add constraint FK_DetalleVentas_Ventas foreign key (ID_Venta) references Ventas(ID_Venta);
alter table DetallesVentas add constraint FK_DetalleVentas_Productos foreign key (ID_Producto) references Productos(ID_Producto);
alter table Inventarios add constraint FK_Inventarios_Productos foreign key (ID_Producto) references Productos(ID_Producto);
alter table Facturas add constraint FK_Facturas_Ventas foreign key (ID_Venta) references Ventas(ID_Venta);