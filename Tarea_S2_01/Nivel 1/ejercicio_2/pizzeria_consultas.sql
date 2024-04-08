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