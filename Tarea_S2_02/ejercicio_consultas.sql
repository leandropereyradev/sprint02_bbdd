USE tienda;

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT producto.nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT producto.nombre, producto.precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT producto.nombre, producto.precio, ROUND(producto.precio * 1.08, 2) FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
-- Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares.
SELECT producto.nombre AS 'nombre de producto', producto.precio AS euros, ROUND(producto.precio * 1.8, 2) AS dólares FROM producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(producto.nombre), producto.precio FROM producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(producto.nombre), producto.precio FROM producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT DISTINCT fabricante.nombre, UPPER(LEFT(fabricante.nombre, 2)) AS 'dos primeros caracteres'  FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT producto.nombre, ROUND(producto.precio, 0) AS 'precio redondeado' FROM producto;

-- 10. Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT producto.nombre, TRUNCATE(producto.precio, 0) AS 'precio sin decimal' FROM producto;

-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT producto.codigo_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT producto.codigo_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT fabricante.nombre FROM fabricante ORDER BY fabricante.nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT fabricante.nombre FROM fabricante ORDER BY fabricante.nombre DESC;

-- 15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT producto.nombre, producto.precio FROM producto ORDER BY producto.nombre ASC, producto.precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
SELECT producto.nombre, producto.precio FROM producto ORDER BY producto.precio ASC LIMIT 1;

-- 19. Lista el nombre y precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA : Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT producto.nombre, producto.precio FROM producto ORDER BY producto.precio DESC LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.codigo = 2;

-- 21. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre, producto.precio, fabricante.nombre AS 'fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre, producto.precio, fabricante.nombre AS 'fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;

-- 23. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo AS 'cod. producto', producto.nombre, fabricante.codigo AS 'cod. fabricante', fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre AS 'nombre prod', producto.precio, fabricante.nombre AS 'nombre fabr' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;

-- 25. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre AS 'nombre prod', producto.precio, fabricante.nombre AS 'nombre fabr' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;

-- 26. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';

-- 27. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

-- 28. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT producto.nombre AS 'nombre prod', fabricante.nombre AS 'nombre fabr' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' UNION
SELECT producto.nombre, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Hewlett-Packard' UNION
SELECT producto.nombre, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Seagate';

-- 29. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT producto.nombre AS 'nombre prod', fabricante.nombre AS 'nombre fabr' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE  RIGHT(fabricante.nombre, 1) = 'e';

-- 31. Devuelve un listado con el nombre y precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';

-- 32. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordena el resultado, en primer lugar,
-- por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT producto.nombre AS 'nombre prod', producto.precio, fabricante.nombre AS 'nombre fabr' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

-- 33. Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 34. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos
-- fabricantes que no tienen productos asociados.
SELECT fabricante.codigo, fabricante.nombre AS 'nombre fabr', GROUP_CONCAT(producto.nombre SEPARATOR ', ') AS productos FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.codigo, fabricante.nombre;

-- 35. Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NULL;

-- 36. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';

-- 37. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT * FROM producto WHERE producto.precio = ( SELECT MAX(precio) FROM producto WHERE codigo_fabricante = ( SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo' ));

-- 38. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT producto.nombre FROM producto WHERE producto.precio = (SELECT MAX(producto.precio) FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo'));

-- 39. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT producto.nombre FROM producto WHERE producto.precio = (SELECT MIN(producto.precio) FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Hewlett-Packard'));

-- 40. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto WHERE producto.precio >= (SELECT MAX(producto.precio) FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo'));

-- 41. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' AND producto.precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = fabricante.codigo);

