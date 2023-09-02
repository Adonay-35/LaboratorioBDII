create database Panaderia;

use Panaderia;

create table Departamentos(
ID_Departamento int primary key identity(1,1),
Departamento varchar(60)
);

create table Municipios(
ID_Municipio int primary key identity(1,1),
Municipio varchar(60) not null,
ID_Departamento int
);

create table Distritos(
ID_Distrito int primary key identity(1,1),
Distrito varchar(60) not null,
ID_Municipio int
);

create table Direcciones(
ID_Direccion int  primary key identity(1,1),
Linea1 varchar(60) not null,
Linea2 varchar(60),
CodigoPostal int not null,
Pais varchar(30),
ID_Distrito int
);

create table Empleados(
ID_Empleado int primary key identity(1,1),
Nombres varchar(200) not null,
Apellidos varchar(200) not null,
DUI varchar(10) not null,
ISSS varchar(13) not null,
ID_Direccion int,
Fecha_Nacimiento date not null,
Telefono varchar(10) not null
);

create table Clientes(
ID_Cliente int primary key identity(1,1),
Nombres varchar(200) not null,
Apellidos varchar(200) not null,
DUI varchar(10),
ID_Direccion int,
Telefono varchar(10)
);

create table Productos(
ID_Producto int primary key identity(1,1),
Nombre_Producto varchar(200) not null,
Precio_Unitario decimal(5,2) not null,
Descripcion varchar(400)
);

create table Compras(
ID_Compra int primary key identity(1,1),
FechaCompra date not null,
MontoCompra decimal(5,2) not null,
ID_Proveedor int
);

create table Ventas(
ID_Venta int primary key identity (1,1),
FechaVenta datetime not null,
Totalventa decimal(5,2) not null,
ID_Cliente int
);

create table DetalleCompras(
    ID_DetalleCompra int primary key identity (1,1),
    CantidadComprada int not null,
    PrecioUnitarioCompra decimal(5, 2) not null,
    Subtotal decimal(5, 2) not null,
	ID_Compra int,
	ID_Producto int
);


create table DetalleVentas(
    ID_DetalleVenta int primary key identity (1,1),
    CantidadVendida int not null,
    PrecioUnitarioVenta decimal(5, 2) not null,
    Subtotal decimal(5, 2) not null,
	ID_Venta int,
	ID_Producto int 
);

create table Inventarios(
ID_Inventario int primary key identity (1,1),
CantidadInventario int not null,
FechaActualizacion date not null,
ID_Producto int
);

create table Proveedores(
ID_Proveedor int primary key identity (1,1),
Empresa varchar(100) not null,
Telefono varchar (100) not null
);

create table Facturas(
ID_Factura int primary key identity (1,1),
FechaFactura date not null,
TotalFactura decimal(5,2) not null,
ID_Venta int
);

alter table Municipios add constraint FK_Municipios_Departamentos foreign key (ID_Departamento) references Departamentos(ID_Departamento);
alter table Distritos add constraint FK_Distritos_Municipios foreign key (ID_Municipio) references Municipios(ID_Municipio);
alter table Direcciones add constraint FK_Direcciones_Distritos foreign key (ID_Distrito) references Distritos(ID_Distrito);

alter table Empleados add constraint FK_Empleados_Direcciones foreign key (ID_Direccion) references Direcciones(ID_Direccion);
alter table Clientes add constraint FK_Clientes_Direcciones foreign key (ID_Direccion) references Direcciones(ID_Direccion);

alter table Compras add constraint FK_Compras_Proveedores foreign key (ID_Proveedor) references Proveedores(ID_Proveedor);
alter table Ventas add constraint FK_Ventas_Clientes foreign key (ID_Cliente) references Clientes(ID_Cliente);

alter table DetalleCompras add constraint FK_DetalleCompras_Compras foreign key (ID_Compra) references Compras(ID_Compra);
alter table DetalleCompras add constraint FK_DetalleCompras_Productos foreign key (ID_Producto) references Productos(ID_Producto);

alter table DetalleVentas add constraint FK_DetalleVentas_Ventas foreign key (ID_Venta) references Ventas(ID_Venta);
alter table DetalleVentas add constraint FK_DetalleVentas_Productos foreign key (ID_Producto) references Productos(ID_Producto);

alter table Inventarios add constraint FK_Inventarios_Productos foreign key (ID_Producto) references Productos(ID_Producto);

alter table Facturas add constraint FK_Facturas_Ventas foreign key (ID_Venta) references Ventas(ID_Venta);