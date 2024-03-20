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
    nif CHAR(9) UNIQUE
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
    mail VARCHAR(50),
    fehca_registro TIMESTAMP,
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
    fehca_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_gafas) REFERENCES gafas(id_gafas)
);