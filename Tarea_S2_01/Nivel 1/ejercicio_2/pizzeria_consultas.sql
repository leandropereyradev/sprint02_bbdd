---------------------------
-- CONSULTAS SOLICITADAS --
---------------------------
-- Lista cuántos productos de categoría 'Bebidas' se han vendido en una determinada localidad.
SELECT COUNT(dp.id_detalle) AS cantidad_bebidas_vendidas
FROM detalle_pedido dp
JOIN pedido p ON dp.id_pedido = p.id_pedido
JOIN cliente c ON p.id_cliente = c.id_cliente
JOIN direccion d ON c.direccion = d.id_direccion
JOIN tienda t ON p.id_empleado = t.id_tienda
JOIN producto prod ON dp.id_producto = prod.id_producto
JOIN categoria cat ON prod.id_categoria = cat.id_categoria
WHERE cat.nombre = 'bebida' AND d.localidad = 'Madrid';

-- Lista cuántos pedidos ha efectuado un determinado empleado/a.
SELECT COUNT(*) AS cantidad_pedidos_empleado
FROM pedido
JOIN empleado ON pedido.id_empleado = empleado.id_empleado
WHERE empleado.nombre = 'Juan';