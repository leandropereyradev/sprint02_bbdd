---------------------------
-- CONSULTAS SOLICITADAS --
---------------------------
-- Lista el total de facturas de un cliente/a en un período determinado.
SELECT cliente.nombre AS nombre_cliente,
       COUNT(venta.id_venta) AS total_facturas,
       SUM(venta.importe) AS total_ventas
FROM cliente
JOIN venta ON cliente.id_cliente = venta.id_cliente
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