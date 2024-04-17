------------------------------------
--  INSERTAR DATOS PARA CONSULTAS --
------------------------------------

-- Insertar dirección
INSERT INTO direccion (calle, numero, piso, puerta, cp, localidad, provincia, pais) 
VALUES 
('Calle Gran Vía', '10', '1', 'A', '28013', 'Madrid', 'Madrid', 'España'),
('Avenida de la Constitución', '25', '3', 'B', '41001', 'Sevilla', 'Sevilla', 'España'),
('Calle Mayor', '5', '2', 'C', '50001', 'Zaragoza', 'Zaragoza', 'España'),
('Plaza del Ayuntamiento', '1', '4', 'D', '46002', 'Valencia', 'Valencia', 'España'),
('Calle Real', '20', 'Bajo', NULL, '15003', 'A Coruña', 'A Coruña', 'España'),
('Paseo de Gracia', '123', '1', '2', '08008', 'Barcelona', 'Barcelona', 'España'),
('Calle Mayor', '10', '1', 'C', '28004', 'Madrid', 'Madrid', 'España'),
('Avenida Diagonal', '200', '5', 'E', '08018', 'Barcelona', 'Barcelona', 'España'),
('Calle de la Paz', '15', '2', 'F', '46002', 'Valencia', 'Valencia', 'España'),
('Calle Real', '30', '2', 'G', '29001', 'Málaga', 'Málaga', 'España'),
('Calle Ancha', '40', '3', 'H', '41003', 'Sevilla', 'Sevilla', 'España'),
('Calle Mayor', '50', '4', 'I', '28045', 'Madrid', 'Madrid', 'España'),
('Avenida Libertad', '60', '5', 'J', '03001', 'Alicante', 'Alicante', 'España'),
('Calle del Sol', '70', '6', 'K', '47001', 'Valladolid', 'Valladolid', 'España'),
('Plaza Mayor', '80', '7', 'L', '37002', 'Salamanca', 'Salamanca', 'España'),
('Calle Estrecha', '90', '8', 'M', '46003', 'Valencia', 'Valencia', 'España'),
('Avenida del Mar', '100', '9', 'N', '29015', 'Málaga', 'Málaga', 'España'),
('Calle Real', '110', '10', 'O', '15004', 'A Coruña', 'A Coruña', 'España'),
('Calle Mayor', '120', '11', 'P', '01001', 'Vitoria', 'Álava', 'España'),
('Avenida Central', '130', '12', 'Q', '41004', 'Sevilla', 'Sevilla', 'España'),
('Paseo del Prado', '140', '13', 'R', '28014', 'Madrid', 'Madrid', 'España'),
('Calle Nueva', '150', '14', 'S', '03002', 'Alicante', 'Alicante', 'España'),
('Calle San Juan', '160', '15', 'T', '48001', 'Bilbao', 'Vizcaya', 'España'),
('Calle del Carmen', '170', '16', 'U', '46005', 'Valencia', 'Valencia', 'España'),
('Avenida de la Libertad', '180', '17', 'V', '46006', 'Valencia', 'Valencia', 'España');

-- Insertar tiendas
INSERT INTO tienda (nombre, telefono, direccion) VALUES
    ('Pizzería Localidad 1A', '912345678', 1),
    ('Pizzería Localidad 1B', '912345679', 2),
    ('Pizzería Localidad 2A', '912345680', 3),
    ('Pizzería Localidad 2B', '912345681', 4),
    ('Pizzería Localidad 3A', '912345682', 5),
    ('Pizzería Localidad 3B', '912345683', 6),
    ('Pizzería Localidad 4A', '912345684', 7),
    ('Pizzería Localidad 4B', '912345685', 8),
    ('Pizzería Localidad 5A', '912345686', 9),
    ('Pizzería Localidad 5B', '912345687', 10);

-- Insertar empleados
INSERT INTO empleado (id_tienda, nombre, apellidos, nif, telefono, puesto, direccion) VALUES
    (1, 'Juan', 'González Pérez', '12345678A', '611223344', 'repartidor', 11),
    (1, 'María', 'Rodríguez Martínez', '87654321B', '655443322', 'cocinero', 12),
    (2, 'Pedro', 'Fernández Gómez', '11111111C', '611223344', 'repartidor', 13),
    (2, 'Laura', 'Sánchez López', '22222222D', '655443322', 'cocinero', 14),
    (3, 'Ana', 'Pérez García', '33333333E', '611223344', 'repartidor', 15),
    (3, 'David', 'López Martínez', '44444444F', '655443322', 'cocinero', 16),
    (4, 'Sara', 'Martínez Pérez', '55555555G', '611223344', 'repartidor', 17),
    (4, 'Carlos', 'Gómez Rodríguez', '66666666H', '655443322', 'cocinero', 18),
    (5, 'Lucía', 'Hernández López', '77777777I', '611223344', 'repartidor', 19),
    (5, 'Pablo', 'Díaz Martínez', '88888888J', '655443322', 'cocinero', 20);
    
-- Insertar clientes
INSERT INTO cliente (nombre, apellidos, telefono, direccion) VALUES
    ('Juan', 'Pérez Gómez', '912345678', 21),
    ('María', 'García López', '912345679', 22),
    ('Pedro', 'Martínez Rodríguez', '912345680', 23),
    ('Ana', 'Fernández Sánchez', '912345681', 24),
    ('Laura', 'Fernández Sánchez', '912345681', 25);
    
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