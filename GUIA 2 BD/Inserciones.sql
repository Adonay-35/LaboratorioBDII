insert into Departamentos values
('Sonsonate'),
('Santa Ana'),
('San Salvador'),
('San Miguel'),
('La Union'),
('La Libertad'),
('Cuscatlán'),
('Chalatenango'),
('Morazán'),
('Ahuachapán');

insert into Municipios values
('Izalco','1'),
('El Congo','2'),
('Mejicanos','3'),
('Carolina','4'),
('El Sauce','5'),
('Nahuizalco','6'),
('Suchitoto','7'),
('Apopa','8'),
('San Miguel Tepezontes','9'),
('Ataco','10');

insert into Distritos values
('Izalco','1'),
('Metapan','2'),
('Tonacatepeque','3'),
('Chinameca','4'),
('Santa Rosa de Lima','5'),
('Juayúa','6'),
('San Rafael','7'),
('San Salvador Centro','8'),
('Chinameca','9'),
('Santa Rosa de Lima Centro','10');

insert into Direcciones values
('Calle El Calvario','Casa #21','02306','El Salvador','1'),
('Calle Gerardo Barrios','Casa #12','02211','El Salvador','2'),
('Calle El Progreso','Casa #23','01132','El Salvador','3'),
('Calle El Carmen ','Casa #34','03306','El Salvador','4'),
('Calle San José','Casa #11','03101','El Salvador','5'),
('Avenida Las Palmeras','Casa #45','04112','El Salvador','6'),
('Calle Los Pinos','Casa #7','02456','El Salvador','7'),
('Calle La Paz','Casa #88','03678','El Salvador','8'),
('Avenida Principal','Casa #3','03045','El Salvador','9'),
('Calle Santa Rosa','Casa #56','02234','El Salvador','10');

insert into Empleados values
('Juan Alberto', 'Pérez López', '12345678-9', '12345678', '1', '1990-05-15', '7777-1234'),
('María Magdalena', 'González Pérez', '98765432-1', '98765432', '2', '1985-08-22', '8888-5678'),
('Pedro Fernandez', 'López Bonilla', '56473829-0', '98765432', '3', '1995-02-10', '9999-9876'),
('Maria Luisa', 'Calderon Martínez', '10111213-4', '87654321', '4', '1980-11-30', '7777-5432'),
('Carlos Maurico', 'Ramírez Hernandez', '19202122-5', '11223344', '5', '1992-07-03', '8888-8765');

insert into Clientes values
('Ana', 'Sánchez', '30313233-6', '6', '7777-1111'),
('Roberto', 'Hernández', NULL, '7', '8888-2222'),
('Elena', 'Gómez', '40414243-7', '8', '9999-3333'),
('Manuel', 'Torres', '50515253-8', '9', '7777-4444'),
('Sofía', 'Díaz', NULL, '10', '8888-5555');

insert into Productos values
('Pan Francés', '1.50', 'Pan fresco tipo baguette'),
('Pastel de Chocolate', '12.99', 'Pastel de chocolate con crema'),
('Galletas de Avena','0.75', 'Galletas de avena caseras'),
('Empanadas de Carne','2.25', 'Empanadas rellenas de carne'),
('Torta de Manzana','9.99','Torta de manzana con canela');

insert into Proveedores values
('Panadería La Delicia', '7777-7777'),
('Distribuidora Pan y Más', '8888-8888'),
('Molinos San Salvador', '9999-9999'),
('Carnicería El Ranchero', '7777-9999'),
('Frutas Frescas', '8888-7777');

insert into Compras values
('2023-09-01','150.75','1'),
('2023-08-25','98.50','2'),
('2023-08-20','75.25','3'),
('2023-08-15','120.30','1'),
('2023-08-10','55.75','2');

insert into Ventas values
('2023-09-02 10:15:00','25.50','1'),
('2023-09-01 15:30:00','48.75','2'),
('2023-08-30 09:45:00','37.20','3'),
('2023-08-29 17:20:00','62.40','4'),
('2023-08-28 14:55:00','30.75','5');

insert into DetalleCompras values
('100', '1.00', '100.00', '1', '1'),
('50', '2.50', '125.00', '2', '2'),
('80', '1.20', '96.00', '3', '3'),
('60', '2.00', '120.00', '4', '1'),
('40', '3.00', '120.00', '5', '4');

insert into DetalleVentas values
('20', '1.50', '30.00', '1', '1'),
('10', '12.99', '129.90', '2', '2'),
('30', '0.75', '22.50', '3', '3'),
('15', '2.25', '33.75', '4', '4'),
('25', '9.99', '249.75', '5', '5');

insert into Inventarios values
('500', '2023-09-02', '1'),
('200', '2023-09-02', '2'),
('300', '2023-09-02', '3'),
('150', '2023-09-02', '4'),
('250', '2023-09-02', '5');

insert into Facturas values
('2023-09-02', '25.50', '1'),
('2023-09-01', '48.75', '2'),
('2023-08-30', '37.20', '3'),
('2023-08-29', '62.40', '4'),
('2023-08-28', '30.75', '5');