------------------------------
-- ELIMINAR DD.BB SI EXISTE --
------------------------------
DROP SCHEMA IF EXISTS pizzeria;

-----------------------------
-- CREACION Y USO DE DD.BB --
-----------------------------
CREATE DATABASE pizzeria;
USE pizzeria;

-------------------------------
-- CREACION TABLA PROVINCIA --
-------------------------------
CREATE TABLE provincia(
	id_provincia INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50));

------------------------------
-- CREACION TABLA LOCALIDAD --
------------------------------
CREATE TABLE localidad(
	id_localidad INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    id_provincia INTEGER,
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
    );
    
----------------------------
-- CREACION TABLA CLIENTE --
----------------------------
CREATE TABLE cliente(
	id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
    apellidos VARCHAR(50),
    direccion VARCHAR(100),
    codigo_postal VARCHAR(20),
    telefono VARCHAR(12),
    id_localidad INTEGER,
    id_provincia INTEGER,
    FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
    );
  
------------------------------
-- CREACION TABLA CATEGORIA --
------------------------------
CREATE TABLE categoria(
	id_categoria INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30)
	);

------------------------------
-- CREACION TABLA PRODUCTO --
------------------------------
CREATE TABLE producto(
	id_producto INTEGER PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('pizza', 'hamburguesa', 'bebida'),
    nombre VARCHAR(50),
    descripcion VARCHAR(200),
    imagen VARCHAR(30),
    precio DECIMAL(8, 2),
    id_categoria INTEGER,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
    );

---------------------------
-- CREACION TABLA TIENDA --
---------------------------
CREATE TABLE tienda(
	id_tienda INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
    telefono VARCHAR(12),
    direccion VARCHAR(100),
    codigo_postal VARCHAR(20),
    id_localidad INTEGER,
    id_provincia INTEGER,
    FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
	);

-----------------------------
-- CREACION TABLA EMPLEADO --
-----------------------------
CREATE TABLE empleado(
	id_empleado INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_tienda INTEGER,
    nombre VARCHAR(30),
    apellidos VARCHAR(50),
    nif VARCHAR(12) UNIQUE,
    telefono VARCHAR(12),
    puesto ENUM('cocinero', 'repartidor'),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
	);

---------------------------
-- CREACION TABLA PEDIDO --
---------------------------
CREATE TABLE pedido(
	id_pedido INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_empleado INTEGER,
    id_cliente INTEGER,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    entrega ENUM('domicilio', 'tienda') DEFAULT 'tienda',
    total DECIMAL(8, 2),
    fecha_entrega TIMESTAMP NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	);

-----------------------------------
-- CREACION TABLA DETALLE_PEDIDO --
-----------------------------------
CREATE TABLE detalle_pedido (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

------------------------------------
--  INSERTAR DATOS PARA CONSULTAS --
------------------------------------
-- Insertar provincias
INSERT INTO provincia (nombre) VALUES
    ('Provincia 1'),
    ('Provincia 2'),
    ('Provincia 3'),
    ('Provincia 4'),
    ('Provincia 5');

-- Insertar localidades
INSERT INTO localidad (nombre, id_provincia) VALUES
    ('Localidad 1A', 1),
    ('Localidad 1B', 1),
    ('Localidad 2A', 2),
    ('Localidad 2B', 2),
    ('Localidad 3A', 3),
    ('Localidad 3B', 3),
    ('Localidad 4A', 4),
    ('Localidad 4B', 4),
    ('Localidad 5A', 5),
    ('Localidad 5B', 5);

-- Insertar tiendas
INSERT INTO tienda (nombre, telefono, direccion, codigo_postal, id_localidad, id_provincia) VALUES
    ('Pizzería Localidad 1A', '912345678', 'Calle Principal 1', '28001', 1, 1),
    ('Pizzería Localidad 1B', '912345679', 'Avenida Central 2', '28002', 2, 1),
    ('Pizzería Localidad 2A', '912345680', 'Plaza Mayor 3', '28003', 3, 2),
    ('Pizzería Localidad 2B', '912345681', 'Calle Gran Vía 4', '28004', 4, 2),
    ('Pizzería Localidad 3A', '912345682', 'Avenida del Mar 5', '28005', 5, 3),
    ('Pizzería Localidad 3B', '912345683', 'Calle Mayor 6', '28006', 6, 3),
    ('Pizzería Localidad 4A', '912345684', 'Calle San Juan 7', '28007', 7, 4),
    ('Pizzería Localidad 4B', '912345685', 'Paseo de la Reina 8', '28008', 8, 4),
    ('Pizzería Localidad 5A', '912345686', 'Calle Mayor 9', '28009', 9, 5),
    ('Pizzería Localidad 5B', '912345687', 'Avenida de la Paz 10', '28010', 10, 5);

-- Insertar empleados
INSERT INTO empleado (id_tienda, nombre, apellidos, nif, telefono, puesto) VALUES
    (1, 'Juan', 'González Pérez', '12345678A', '611223344', 'repartidor'),
    (1, 'María', 'Rodríguez Martínez', '87654321B', '655443322', 'cocinero'),
    (2, 'Pedro', 'Fernández Gómez', '11111111C', '611223344', 'repartidor'),
    (2, 'Laura', 'Sánchez López', '22222222D', '655443322', 'cocinero'),
    (3, 'Ana', 'Pérez García', '33333333E', '611223344', 'repartidor'),
    (3, 'David', 'López Martínez', '44444444F', '655443322', 'cocinero'),
    (4, 'Sara', 'Martínez Pérez', '55555555G', '611223344', 'repartidor'),
    (4, 'Carlos', 'Gómez Rodríguez', '66666666H', '655443322', 'cocinero'),
    (5, 'Lucía', 'Hernández López', '77777777I', '611223344', 'repartidor'),
    (5, 'Pablo', 'Díaz Martínez', '88888888J', '655443322', 'cocinero');
    
-- Insertar clientes
INSERT INTO cliente (nombre, apellidos, direccion, codigo_postal, telefono, id_localidad, id_provincia) VALUES
    ('Juan', 'Pérez Gómez', 'Calle Principal 123', '28001', '912345678', 1, 1),
    ('María', 'García López', 'Avenida Central 456', '28002', '912345679', 2, 2),
    ('Pedro', 'Martínez Rodríguez', 'Plaza Mayor 789', '28003', '912345680', 3, 3),
    ('Ana', 'Fernández Sánchez', 'Calle Gran Vía 100', '28004', '912345681', 4, 4),
    ('Laura', 'Fernández Sánchez', 'Calle Gran Vía 100', '28004', '912345681', 5, 5);
    
-- Insertart categorías
INSERT INTO categoria (nombre) VALUES
    ('Vegetariana'),
    ('Hawaiana'),
    ('Barbacoa'),
    ('Margarita'),
    ('Hamburguesa'),
    ('Bebida');

-- Insertar productos
INSERT INTO producto (tipo, nombre, descripcion, imagen, precio, id_categoria) VALUES    
    ('hamburguesa', 'Hamburguesa con Queso', 'Hamburguesa clásica con queso cheddar fundido.', 'hamburguesa_queso.jpg', 9.99, 5),
    ('hamburguesa', 'Hamburguesa Doble', 'Hamburguesa con doble carne, lechuga, tomate y salsa especial.', 'hamburguesa_doble.jpg', 10.99, 5),
    ('hamburguesa', 'Hamburguesa Vegetariana', 'Hamburguesa con hamburguesa de soja, lechuga, tomate y salsa vegana.', 'hamburguesa_vegetariana.jpg', 8.99, 5),
    ('hamburguesa', 'Hamburguesa BBQ', 'Hamburguesa con salsa barbacoa, aros de cebolla crujientes y bacon.', 'hamburguesa_bbq.jpg', 11.99, 5),
    ('pizza', 'Pizza Vegetariana', 'Deliciosa pizza con salsa de tomate, mozzarella, champiñones, pimientos y cebolla.', 'vegetariana.jpg', 10.99, 1),
    ('pizza', 'Pizza Hawaiana', 'Deliciosa pizza con salsa de tomate, mozzarella, piña y jamón.', 'hawaiana.jpg', 11.99, 2),
    ('pizza', 'Pizza Barbacoa', 'Deliciosa pizza con salsa de barbacoa, mozzarella, pollo a la barbacoa y cebolla caramelizada.', 'barbacoa.jpg', 12.99, 3),
    ('pizza', 'Pizza Margarita', 'Deliciosa pizza con salsa de tomate, mozzarella y albahaca fresca.', 'margarita.jpg', 9.99, 4),
    ('bebida', 'Refresco de Naranja', 'Refresco de naranja frío y refrescante.', 'naranja.jpg', 1.99, 6),
    ('bebida', 'Refresco de Limón', 'Refresco de limón frío y refrescante.', 'limon.jpg', 1.99, 6),
    ('bebida', 'Agua Mineral', 'Agua mineral sin gas.', 'agua.jpg', 0.99, 6),
    ('bebida', 'Té Helado', 'Té helado de diferentes sabores.', 'te.jpg', 2.49, 6);

-- Insertar pedidos
INSERT INTO pedido (id_empleado, id_cliente, fecha_hora, entrega, total, fecha_entrega) VALUES
    -- Pedidos para tienda 1
    (1, 1, '2024-01-15 12:00:00', 'domicilio', 25.00, '2024-01-15 15:00:00'),
    (1, 3, '2024-03-25 12:30:00', 'tienda', 18.00, '2024-03-25 14:00:00'),
    (2, 2, '2024-02-20 18:30:00', 'tienda', 30.00, NULL),
    -- Pedidos para tienda 2
    (3, 3, '2024-01-25 14:00:00', 'domicilio', 20.00, NULL),
    (4, 4, '2024-02-05 19:45:00', 'tienda', 35.00, '2024-02-05 20:30:00'),
    -- Pedidos para tienda 3
    (5, 5, '2024-03-10 11:30:00', 'domicilio', 27.00, '2024-03-10 13:00:00'),
    (6, 1, '2024-03-15 13:45:00', 'tienda', 40.00, NULL),
    -- Pedidos para tienda 4
    (7, 2, '2024-01-20 20:00:00', 'domicilio', 23.00, NULL),
    (8, 3, '2024-03-05 16:20:00', 'tienda', 28.00, '2024-03-05 17:00:00'),
    -- Pedidos para tienda 5
    (9, 4, '2024-02-15 17:30:00', 'domicilio', 22.00, '2024-02-15 18:45:00'),
    (10, 5, '2024-03-20 21:00:00', 'tienda', 32.00, NULL);

-- Insertar detalles de pedido
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad) VALUES
    (1, 1, 2),
    (1, 3, 1),
    (1, 10, 1),
    (1, 12, 2),
    (1, 9, 1),
    (2, 2, 1),
    (2, 3, 2),
    (3, 4, 3),
    (3, 5, 1),
    (4, 6, 2),
    (4, 2, 1),
    (5, 3, 1),
    (5, 6, 3),
    (6, 1, 2),
    (6, 3, 1),
    (7, 2, 1),
    (7, 6, 2),
    (8, 4, 2),
    (8, 1, 1),
    (9, 2, 3),
    (9, 6, 1),
    (10, 3, 1),
    (10, 1, 2);

---------------------------
-- CONSULTAS SOLICITADAS --
---------------------------
-- Lista cuántos productos de categoría 'Bebidas' se han vendido en una determinada localidad.
SELECT COUNT(*) AS total_bebidas_vendidas
FROM detalle_pedido
JOIN pedido ON detalle_pedido.id_pedido = pedido.id_pedido
JOIN cliente ON pedido.id_cliente = cliente.id_cliente
JOIN localidad ON cliente.id_localidad = localidad.id_localidad
JOIN producto ON detalle_pedido.id_producto = producto.id_producto
JOIN categoria ON producto.id_categoria = categoria.id_categoria
WHERE categoria.nombre = 'Bebida' AND localidad.nombre = 'Localidad 1A';

-- Lista cuántos pedidos ha efectuado un determinado empleado/a.
SELECT COUNT(*) AS cantidad_pedidos_empleado
FROM pedido
JOIN empleado ON pedido.id_empleado = empleado.id_empleado
WHERE empleado.nombre = 'Juan';