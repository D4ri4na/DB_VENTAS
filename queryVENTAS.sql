CREATE DATABASE Ventas;
USE Ventas;

CREATE TABLE CLIENTES (
    ClienteID INT IDENTITY(100,1) PRIMARY KEY,
    Nombre VARCHAR(100),
    CorreoElectronico VARCHAR(100) UNIQUE,
    Telefono VARCHAR(15),
    FechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE PEDIDOS (
    PedidoID INT IDENTITY(10000,2) PRIMARY KEY,
    ClienteID INT,
    FechaPedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    Estado VARCHAR(15),
    Total DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES CLIENTES(ClienteID),
    INDEX idx_pedido_cliente (ClienteID)
);

CREATE TABLE PRODUCTOS (
    ProductID INT IDENTITY(1,3) PRIMARY KEY,
    NombreProducto VARCHAR(100),
    Descripcion TEXT,
    Precio DECIMAL(10,2),
    Stock INT,
    INDEX idx_producto_nombre (NombreProducto)
);

CREATE TABLE DETALLE_VENTA (
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID INT,
    ProductID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (PedidoID) REFERENCES PEDIDOS(PedidoID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCTOS(ProductID),
    INDEX idx_detalle_pedido (PedidoID),
    INDEX idx_detalle_producto (ProductID)
);

CREATE TABLE PAGOS (
    PagoID INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID INT,
    Monto DECIMAL(10,2),
    MetodoPago VARCHAR(15),
    FechaPago DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PedidoID) REFERENCES PEDIDOS(PedidoID),
    INDEX idx_pago_pedido (PedidoID)
);

-- Inserción de datos
INSERT INTO CLIENTES (Nombre, CorreoElectronico, Telefono) VALUES 
('Juan Pérez', 'juan.perez@example.com', '70012345'),
('María López', 'maria.lopez@example.com', '70123456'),
('Carlos Sánchez', 'carlos.sanchez@example.com', '70234567'),
('Ana Torres', 'ana.torres@example.com', '70345678'),
('Pedro Gómez', 'pedro.gomez@example.com', '70456789'),
('Luis Fernández', 'luis.fernandez@example.com', '70567890'),
('Sofía Ramírez', 'sofia.ramirez@example.com', '70678901'),
('Diego Castro', 'diego.castro@example.com', '70789012'),
('Paula Herrera', 'paula.herrera@example.com', '70890123'),
('Javier Molina', 'javier.molina@example.com', '70901234');

INSERT INTO PRODUCTOS (NombreProducto, Descripcion, Precio, Stock) VALUES 
('Laptop HP', 'Laptop HP de última generación', 750.00, 10),
('Mouse Logitech', 'Mouse inalámbrico', 25.00, 50),
('Teclado Mecánico', 'Teclado RGB para gaming', 80.00, 30),
('Monitor Samsung', 'Monitor 24 pulgadas Full HD', 180.00, 20),
('Silla Gamer', 'Silla ergonómica para gaming', 250.00, 15),
('Auriculares Sony', 'Auriculares con cancelación de ruido', 120.00, 25),
('Impresora Epson', 'Impresora multifuncional', 300.00, 10),
('Tablet Samsung', 'Tablet de 10 pulgadas', 350.00, 12),
('Disco Duro Externo', '1TB de almacenamiento', 90.00, 20),
('Cámara Web Logitech', 'Cámara Full HD para videollamadas', 60.00, 30);

INSERT INTO PEDIDOS (ClienteID,Estado, Total) VALUES 
(100,'Pendiente', 100.00),
(102, 'Enviado', 500.00),
(103, 'Entregado', 750.00),
(104, 'Cancelado', 200.00),
(105, 'Pendiente', 400.00),
(106, 'Entregado', 900.00),
(107, 'Enviado', 250.00),
(108, 'Pendiente', 600.00),
(109, 'Entregado', 150.00),
(101, 'Pendiente', 300.00);

INSERT INTO DETALLE_VENTA (PedidoID, ProductID, Cantidad, PrecioUnitario) VALUES 
(10000, 1, 2, 25.00),
(10002, 4, 3, 80.00),
(10004, 7, 1, 750.00),
(10006, 10, 1, 180.00),
(10008, 13, 1, 250.00),
(10010, 16, 2, 120.00),
(10012, 19, 1, 300.00),
(10014, 22, 2, 350.00),
(10016, 25, 3, 90.00),
(10018, 28, 1, 60.00);

INSERT INTO PAGOS (PedidoID, Monto, MetodoPago) VALUES 
(10000, 100.00, 'Tarjeta'),
(10002, 500.00, 'Efectivo'),
(10004, 750.00, 'Transferencia'),
(10006, 200.00, 'PayPal'),
(10008, 400.00, 'Tarjeta'),
(10010, 900.00, 'Efectivo'),
(10012, 250.00, 'PayPal'),
(10014, 600.00, 'Transferencia'),
(10016, 150.00, 'Tarjeta'),
(10018, 300.00, 'Efectivo');
