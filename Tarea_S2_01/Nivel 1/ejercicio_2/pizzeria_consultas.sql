---------------------------
-- CONSULTAS SOLICITADAS --
---------------------------
-- Lista cuántos productos de categoría 'Bebidas' se han vendido en una determinada localidad.

SELECT COUNT(dp.id_detalle) AS cantidad_bebidas_vendidas FROM detalle_pedido dp
	JOIN pedido p ON dp.id_pedido = p.id_pedido
	JOIN empleado e ON p.id_empleado = e.id_empleado
	JOIN tienda t ON e.id_tienda = t.id_direccion
	JOIN localidad l ON t.id_direccion = l.id_localidad
	JOIN producto pr ON dp.id_producto = pr.id_producto
	JOIN categoria cat ON pr.id_categoria = cat.id_categoria
	WHERE cat.nombre = 'Bebida' AND l.nombre = 'Madrid';

-- Lista cuántos pedidos ha efectuado un determinado empleado/a.
SELECT COUNT(*) AS cantidad_pedidos_empleado FROM pedido
	JOIN empleado ON pedido.id_empleado = empleado.id_empleado
	WHERE empleado.nombre = 'Juan';