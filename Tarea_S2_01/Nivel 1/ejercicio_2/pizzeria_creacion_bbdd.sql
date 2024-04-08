DROP SCHEMA IF EXISTS pizzeria;
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