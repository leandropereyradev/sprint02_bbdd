------------------------------------
--  INSERTAR DATOS PARA CONSULTAS --
------------------------------------
-- Insertar direcciones en España
INSERT INTO direccion (calle, numero, piso, puerta, codigo_postal, localidad, provincia, pais)
VALUES
    ('Calle Ejemplo 1', '1', '1A', 'A', '28001', 'Madrid', 'Madrid', 'España'),
    ('Calle de la Paz', '2', NULL, NULL, '46002', 'Valencia', 'Valencia', 'España'),
    ('Calle Mayor', '3', '2', 'B', '50001', 'Zaragoza', 'Zaragoza', 'España'),
    ('Calle Real', '4', NULL, NULL, '15001', 'A Coruña', 'A Coruña', 'España'),
    ('Avenida Libertad', '5', '3', 'C', '03001', 'Alicante', 'Alicante', 'España'),
    ('Plaza España', '6', NULL, NULL, '28013', 'Madrid', 'Madrid', 'España'),
    ('Paseo de Gracia', '7', '4', 'D', '08007', 'Barcelona', 'Barcelona', 'España');
    
-- Insertar proveedores
INSERT INTO proveedor (nombre, id_direccion, telefono, fax, nif)
VALUES
    ('Proveedor 1', 1, '123-456-789', '123-456-789', '123456789A'),
    ('Proveedor 2', 2, '987-654-321', '987-654-321', '987654321B');
    
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
INSERT INTO empleado (nombre, id_direccion, telefono, nif)
VALUES
    ('Carlos González', 3, '6555-1234', '29040284F'),
    ('Ana Martínez', 4, '6555-5678', '39029384G');

-- Insertar clientes
INSERT INTO cliente (nombre, id_direccion, telefono, correo_electronico, fecha_registro, id_cliente_recomendado)
VALUES
    ('Juan Pérez', 5, '6555-1234', 'juan@example.com', '2021-07-02', NULL),
    ('María García', 6, '6555-5678', 'maria@example.com', '2023-03-21', 1),
    ('Pedro López', 7, '6555-91011', 'pedro@example.com', '2020-10-12', NULL);

-- Insertar ventas    
INSERT INTO venta (id_empleado, id_cliente, id_gafas, importe, fecha_registro)
VALUES
    -- Ventas del cliente 1
    (1, 1, 1, 100.00, '2021-08-20'),
    (2, 1, 2, 120.00, '2022-12-10'),
    (1, 1, 3, 90.00, '2024-03-25'),
    -- Ventas del cliente 2
    (2, 2, 1, 100.00, '2023-03-21'),
    (1, 2, 2, 120.00, '2024-01-11'),
    -- Venta del cliente 3
    (2, 3, 1, 100.00, '2023-10-12');
