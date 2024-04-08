DROP SCHEMA IF EXISTS optica;
CREATE DATABASE optica;
USE optica;

------------------------------
-- CREACION TABLA DIRECCION --
------------------------------
CREATE TABLE direccion(
    id_direccion INTEGER PRIMARY KEY AUTO_INCREMENT,
    calle VARCHAR(100),
    numero VARCHAR(10),
    piso VARCHAR(10),
    puerta VARCHAR(10),
    codigo_postal VARCHAR(10),
    localidad VARCHAR(20),
    provincia VARCHAR(20),
    pais VARCHAR(50)
);

------------------------------
-- CREACION TABLA PROVEEDOR --
------------------------------
CREATE TABLE proveedor(
    id_proveedor INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_direccion INTEGER,
    nombre VARCHAR(50),
    telefono CHAR(20),
    fax CHAR(20),
    nif CHAR(12) UNIQUE,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
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
    id_direccion INTEGER,
    nombre VARCHAR(50),
    telefono CHAR(10),
    nif CHAR(12) UNIQUE,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

----------------------------
-- CREACION TABLA CLIENTE --
----------------------------
CREATE TABLE cliente(
    id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_empleado INTEGER,
    id_cliente_recomendado INTEGER,
    id_direccion INTEGER,
    nombre VARCHAR(50),
    telefono CHAR(10),
    correo_electronico VARCHAR(50),
    fecha_registro TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_cliente_recomendado) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

--------------------------
-- CREACION TABLA VENTA --
--------------------------
CREATE TABLE venta(
    id_venta INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_empleado INTEGER,
    id_cliente INTEGER,
    id_gafas INTEGER,
    importe DECIMAL(8, 2),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_gafas) REFERENCES gafas(id_gafas)
);