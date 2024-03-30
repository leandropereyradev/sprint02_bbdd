------------------------------
-- ELIMINAR DD.BB SI EXISTE --
------------------------------
DROP SCHEMA IF EXISTS optica;

-----------------------------
-- CREACION Y USO DE DD.BB --
-----------------------------
CREATE DATABASE optica;
USE optica;

------------------------------
-- CREACION TABLA PROVEEDOR --
------------------------------
CREATE TABLE proveedor(
    id_proveedor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    direccion_calle VARCHAR(100),
    direccion_numero VARCHAR(10),
    direccion_piso VARCHAR(10),
    direccion_puerta VARCHAR(10),
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(10),
    pais VARCHAR(50),
    telefono CHAR(20),
    fax CHAR(20),
    nif CHAR(12) UNIQUE
);

--------------------------
-- CREACION TABLA MARCA --
--------------------------
CREATE TABLE marca(
    id_marca INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INTEGER,
    nombre VARCHAR(50),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

--------------------------
-- CREACION TABLA GAFAS --
--------------------------
CREATE TABLE gafas(
    id_gafas INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_marca INTEGER,
    graduacion VARCHAR(100),
    montura ENUM('flotante', 'pasta', 'metálica'),
    color_montura VARCHAR(20),
    color_cristal VARCHAR(20),
    precio DECIMAL(8, 2),
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);

-----------------------------
-- CREACION TABLA EMPLEADO --
-----------------------------
CREATE TABLE empleado(
    id_empleado INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    direccion VARCHAR(200),
    telefono CHAR(10),
    nif CHAR(12) UNIQUE
);

----------------------------
-- CREACION TABLA CLIENTE --
----------------------------
CREATE TABLE cliente(
    id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_empleado INTEGER,
    id_cliente_recomendado INTEGER,
    nombre VARCHAR(50),
    direccion VARCHAR(200),
    telefono CHAR(10),
    correo_electronico VARCHAR(50),
    fecha_registro TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_cliente_recomendado) REFERENCES cliente(id_cliente)
);

--------------------------
-- CREACION TABLA VENTA --
--------------------------
CREATE TABLE venta(
    id_venta INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_empleado INTEGER,
    id_cliente INTEGER,
    id_gafas INTEGER,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_gafas) REFERENCES gafas(id_gafas)
);

------------------------------------
--  INSERTAR DATOS PARA CONSULTAS --
------------------------------------
-- Insertar proveedores
INSERT INTO proveedor (nombre, direccion_calle, direccion_numero, direccion_piso, direccion_puerta, ciudad, codigo_postal, pais, telefono, fax, nif)
VALUES
    ('Proveedor 1', 'Calle Proveedor 1', '123', '1', 'A', 'Ciudad Proveedor 1', '12345', 'País Proveedor 1', '123-456-789', '123-456-789', '123456789A'),
    ('Proveedor 2', 'Calle Proveedor 2', '456', '2', 'B', 'Ciudad Proveedor 2', '54321', 'País Proveedor 2', '987-654-321', '987-654-321', '987654321B');
    
-- Insertar marcas
INSERT INTO marca (id_proveedor, nombre)
VALUES
    (1, 'Marca 1'),
    (2, 'Marca 2');
    
-- Insertar gafas
INSERT INTO gafas (id_marca, graduacion, montura, color_montura, color_cristal, precio)
VALUES
    -- Gafas del proveedor 1
    (1, 'Graduación 1', 'flotante', 'Negro', 'Azul', 100.00),
    (1, 'Graduación 2', 'pasta', 'Rojo', 'Verde', 120.00),
    -- Gafas del proveedor 2
    (2, 'Graduación 3', 'metálica', 'Azul', 'Amarillo', 90.00),
    (2, 'Graduación 4', 'flotante', 'Verde', 'Naranja', 110.00);

-- Insertar empleados
INSERT INTO empleado (nombre, direccion, telefono, nif)
VALUES
    ('Carlos González', 'Calle Sol 123', '6555-1234', '29040284F'),
    ('Ana Martínez', 'Avenida Luna 456', '6555-5678', '39029384G');

-- Insertar clientes
INSERT INTO cliente (nombre, direccion, telefono, correo_electronico, fecha_registro, id_cliente_recomendado, id_empleado)
VALUES
    ('Juan Pérez', 'Calle Principal 123', '6555-1234', 'juan@example.com', '2021-07-02', NULL, 1),
    ('María García', 'Avenida Central 456', '6555-5678', 'maria@example.com', '2023-03-21', 1, 2),
    ('Pedro López', 'Plaza Mayor 789', '6555-91011', 'pedro@example.com', '2020-10-12', NULL, 1);

-- Insertar ventas    
INSERT INTO venta (id_empleado, id_cliente, id_gafas, fecha_registro)
VALUES
    -- Ventas del cliente 1
    (1, 1, 1, '2021-08-20'),
    (2, 1, 2, '2022-12-10'),
    (1, 1, 3, '2024-03-25'),
    -- Ventas del cliente 2
    (2, 2, 1, '2023-03-21'),
    (1, 2, 2, '2024-01-11'),
    -- Venta del cliente 3
    (2, 3, 1, '2023-10-12');

---------------------------
-- CONSULTAS SOLICITADAS --
---------------------------
-- Lista el total de facturas de un cliente/a en un período determinado.
SELECT cliente.nombre AS nombre_cliente,
       COUNT(venta.id_venta) AS total_facturas,
       SUM(gafas.precio) AS total_ventas
FROM cliente
JOIN venta ON cliente.id_cliente = venta.id_cliente
JOIN gafas ON venta.id_gafas = gafas.id_gafas
WHERE cliente.nombre = 'María García' AND venta.fecha_registro BETWEEN '2023-01-01' AND '2024-03-31';

-- Lista los diferentes modelos de gafas que ha vendido un empleado durante un año.
SELECT DISTINCT marca.nombre AS nombre_marca
FROM venta
JOIN gafas ON venta.id_gafas = gafas.id_gafas
JOIN empleado ON venta.id_empleado = empleado.id_empleado
JOIN marca ON gafas.id_marca = marca.id_marca
WHERE YEAR(venta.fecha_registro) = '2023' AND empleado.nombre = 'Ana Martínez';

-- Lista a los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.
SELECT DISTINCT proveedor.nombre AS nombre_proveedor
FROM venta
JOIN gafas ON gafas.id_gafas = venta.id_gafas
JOIN marca ON gafas.id_marca = marca.id_marca
JOIN proveedor ON marca.id_proveedor = proveedor.id_proveedor;



